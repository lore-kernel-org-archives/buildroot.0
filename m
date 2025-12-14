Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A9D1D5B171
	for <buildroot@archiver.kernel.org>; Sun, 14 Dec 2025 17:48:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5F761409C7;
	Sun, 14 Dec 2025 17:48:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ljYgzJJDXDTs; Sun, 14 Dec 2025 17:48:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8C5C4409C9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765734482;
	bh=mZkxl07U2kxrFbs85wMAvzhHeKZpPGQCwGriMDrOb8s=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=rXdsAdfiNIJTcrQZqSTihhuUPyTUrIqD4iPJqvQdsnDqvO7TKTcJDIjeYkOl8xsU3
	 uKH5hGkNBsgd+MH99c672Q+0d/B2JJXIYhTt08tsbxaJQlvajaVZ8dQqRt3QJeNvZW
	 uPAmzrdONVBMvACSc7d+f+CjJw4yz6HKsHrwkmxDeNOR6sLbNgRE2FOV1Xkyl6o4fU
	 2cWHKO9+sgDt4iZrfYR8jDfdy/AYXK4k3dbnjxcVsuEpZvDNoJhzZWaXnPdzFFT5rm
	 S1pV/oX7cpLcI6i61qJDYJP3FIkc46C8zJ7ZKpT0yG1gYIqzligh46yKIqB5xhO9G5
	 xkFT52Lkr08mQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8C5C4409C9;
	Sun, 14 Dec 2025 17:48:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7B67F2D0
 for <buildroot@buildroot.org>; Sun, 14 Dec 2025 17:47:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AEEB440697
 for <buildroot@buildroot.org>; Sun, 14 Dec 2025 17:47:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eRYfSjWLt7Ux for <buildroot@buildroot.org>;
 Sun, 14 Dec 2025 17:47:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F133A406A0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id F133A406A0
 for <buildroot@buildroot.org>; Sun, 14 Dec 2025 17:47:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F0EF186E93; Sun, 14 Dec 2025 17:47:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 14 Dec 2025 18:47:24 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1be3962f8f7c479eff8420e0c6227af13ef1d639
X-Git-Newrev: e022386c7e1e0b3c94c295302208e06825825a3b
X-Patchwork-Hint: ignore
Message-Id: <20251214174742.F0EF186E93@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-bcrypt: bump version to
 5.0.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=e022386c7e1e0b3c94c295302208e06825825a3b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog: https://github.com/pyca/bcrypt/blob/5.0.0/README.rst

Fixes build with python 3.14.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-bcrypt/python-bcrypt.hash | 2 +-
 package/python-bcrypt/python-bcrypt.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/python-bcrypt/python-bcrypt.hash b/package/python-bcrypt/python-bcrypt.hash
index 029baab0ea..a30e716df0 100644
--- a/package/python-bcrypt/python-bcrypt.hash
+++ b/package/python-bcrypt/python-bcrypt.hash
@@ -1,4 +1,4 @@
 # Locally calculated after vendoring
-sha256  f33b38de3883c173e1eb9426c99aca1379708ef5feac46bf749f4d36ecf9ed98  python-bcrypt-4.2.1-cargo4.tar.gz
+sha256  c209e01bb77628213eecb2152cf143c95e4147e3ef54aada6cf69803fafdc67d  python-bcrypt-5.0.0-cargo4.tar.gz
 # Locally computed sha256 checksums
 sha256  8173d5c29b4f956d532781d2b86e4e30f83e6b7878dce18c919451d6ba707c90  LICENSE
diff --git a/package/python-bcrypt/python-bcrypt.mk b/package/python-bcrypt/python-bcrypt.mk
index cbbc7bcecf..436312d0ad 100644
--- a/package/python-bcrypt/python-bcrypt.mk
+++ b/package/python-bcrypt/python-bcrypt.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_BCRYPT_VERSION = 4.2.1
+PYTHON_BCRYPT_VERSION = 5.0.0
 PYTHON_BCRYPT_SOURCE_PYPI = bcrypt-$(PYTHON_BCRYPT_VERSION).tar.gz
-PYTHON_BCRYPT_SITE_PYPI = https://files.pythonhosted.org/packages/56/8c/dd696962612e4cd83c40a9e6b3db77bfe65a830f4b9af44098708584686c
+PYTHON_BCRYPT_SITE_PYPI = https://files.pythonhosted.org/packages/d4/36/3329e2518d70ad8e2e5817d5a4cac6bba05a47767ec416c7d020a965f408
 PYTHON_BCRYPT_SITE = $(PYTHON_BCRYPT_SITE_PYPI)/$(PYTHON_BCRYPT_SOURCE_PYPI)?buildroot-path=filename
 PYTHON_BCRYPT_SETUP_TYPE = setuptools-rust
 PYTHON_BCRYPT_LICENSE = Apache-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

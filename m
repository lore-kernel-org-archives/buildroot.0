Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E6D4D65C63
	for <buildroot@archiver.kernel.org>; Wed, 17 Dec 2025 21:45:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 07C8B61177;
	Wed, 17 Dec 2025 21:45:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yol82NJieuKD; Wed, 17 Dec 2025 21:45:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B7759611C3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766007918;
	bh=eVQ6RIW5bq98Og6cqGT5x333Gend1xygRKDoY7/xr68=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=hJWKuiFPHUU/1XwpgecobUutK/36piDrhcWmzSoaWFgh0giP3vIHK7YwLftIjINLA
	 4Th7rzEXw4Ngsg1v5n2jyvj8U+Qp+seu4il6YRDETWruPgLDKbpPPGtiO7vzchdUYn
	 YMgP0Hxj0YI42ejiAzR2NzogSoK9uSu2VAgcr/zjDKZAkgUgSAvPLSiGnbL+IMrkIN
	 TczDV+xuO+4KOu9kmUtOBZ7xcIkh2YTTKbhExlW3g26L+Jf1zHmk71oebjizBAVk3E
	 AlC+Z2zAElztOhF5CmefTQQAq7otdhb3uqyv+SMh/IAn+E74AU6woF0aTLL2v78CbX
	 HfhcjyUeORFcA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B7759611C3;
	Wed, 17 Dec 2025 21:45:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0EE15361
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 21:45:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5E9BB40F81
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 21:45:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0r94fH3dqkuF for <buildroot@buildroot.org>;
 Wed, 17 Dec 2025 21:44:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6D34A40F82
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6D34A40F82
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 21:44:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6A2858120D; Wed, 17 Dec 2025 21:44:58 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 17 Dec 2025 22:08:39 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8ae60abbe92de57c64aa4e2a5d07e32025a7e25b
X-Git-Newrev: 61b522acd0c4b25e925a78883c0837a0f31b2f16
X-Patchwork-Hint: ignore
Message-Id: <20251217214458.6A2858120D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-urwid: bump version to 3.0.4
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

commit: https://git.buildroot.net/buildroot/commit/?id=61b522acd0c4b25e925a78883c0837a0f31b2f16
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/urwid/urwid/blob/3.0.4/docs/changelog.rst

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-urwid/python-urwid.hash | 4 ++--
 package/python-urwid/python-urwid.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-urwid/python-urwid.hash b/package/python-urwid/python-urwid.hash
index 1612070c3f..dd9c208ad0 100644
--- a/package/python-urwid/python-urwid.hash
+++ b/package/python-urwid/python-urwid.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/urwid/json
-md5  0ed7f3cf33545912b9ad0d8f2200863b  urwid-3.0.3.tar.gz
-sha256  300804dd568cda5aa1c5b204227bd0cfe7a62cef2d00987c5eb2e4e64294ed9b  urwid-3.0.3.tar.gz
+md5  6cf95702b787fd7e5f90e74d9900f000  urwid-3.0.4.tar.gz
+sha256  c3d0d2f47602b21949ffb8669a7ef0a8ca5fa13ed5c1ee1d2d81edf05616187f  urwid-3.0.4.tar.gz
 # Locally computed sha256 checksums
 sha256  36b6d3fa47916943fd5fec313c584784946047ec1337a78b440e5992cb595f89  COPYING
diff --git a/package/python-urwid/python-urwid.mk b/package/python-urwid/python-urwid.mk
index 0ca1b79c55..b3069fdaff 100644
--- a/package/python-urwid/python-urwid.mk
+++ b/package/python-urwid/python-urwid.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_URWID_VERSION = 3.0.3
+PYTHON_URWID_VERSION = 3.0.4
 PYTHON_URWID_SOURCE = urwid-$(PYTHON_URWID_VERSION).tar.gz
-PYTHON_URWID_SITE = https://files.pythonhosted.org/packages/bb/d3/09683323e2290732a39dc92ca5031d5e5ddda56f8d236f885a400535b29a
+PYTHON_URWID_SITE = https://files.pythonhosted.org/packages/e0/4d/f0832a6bf0986bdd770d61f9cf9e9915741171502c0c399bf934c72a3e5e
 PYTHON_URWID_LICENSE = LGPL-2.1+
 PYTHON_URWID_LICENSE_FILES = COPYING
 PYTHON_URWID_SETUP_TYPE = setuptools
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

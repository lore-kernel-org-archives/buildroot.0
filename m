Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89312D68BC4
	for <buildroot@archiver.kernel.org>; Wed, 17 Dec 2025 21:45:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5B81C40F61;
	Wed, 17 Dec 2025 21:45:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hiNeNAtySObC; Wed, 17 Dec 2025 21:45:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9187F40F7D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766007914;
	bh=9HtX1wMw0qb1Lv9biKBkOPKzhvjzKJPu3VlR/O1GAVU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=f5UBNkoNmujwBZF5qxBvPSQU+ClZcz3GAMXnR3r/rR6J7HhNBNRFpkbp+4pUuq2/p
	 APcy3o9mm9gAdTCa17ijfai5jZZqi2jB0N8nB0zDwCnEcF77+gEJdIZASiyQezb0Q+
	 I4T8BfHnrRQMaHP/KMm7pvNlVt2+XYmlarW8jQExwEkd8KoepMR7PFq2SeqmT1XJXD
	 DaXFDpN52c4eq4FmQ4gZ1i18O2eLI/YS4Lw6fAcHXKJUySWAyFPfY+/u72js/bTJez
	 3AslG7Z/p/9scQzLpLjUL7Ztb+BBv2RpcM7z9nT9e2aJTxQDuzAv9anNORh5Cn9uFd
	 fNAEZGR0FRvHw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9187F40F7D;
	Wed, 17 Dec 2025 21:45:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 11C60361
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 21:45:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 03BD040F7E
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 21:45:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2OYWo97YB5NM for <buildroot@buildroot.org>;
 Wed, 17 Dec 2025 21:44:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A299640F86
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A299640F86
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 21:44:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A12C28120D; Wed, 17 Dec 2025 21:44:58 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 17 Dec 2025 22:11:06 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 13e1e1562b6392e90938583fd7da9bc4f70d9fb6
X-Git-Newrev: 6104d7fe226c45746bc4f4432cf00073d38fd452
X-Patchwork-Hint: ignore
Message-Id: <20251217214458.A12C28120D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-wsproto: bump version to
 1.3.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=6104d7fe226c45746bc4f4432cf00073d38fd452
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/python-hyper/wsproto/blob/1.3.2/CHANGELOG.rst

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-wsproto/python-wsproto.hash | 4 ++--
 package/python-wsproto/python-wsproto.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-wsproto/python-wsproto.hash b/package/python-wsproto/python-wsproto.hash
index 4eb3195785..861749a3f2 100644
--- a/package/python-wsproto/python-wsproto.hash
+++ b/package/python-wsproto/python-wsproto.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/wsproto/json
-md5  f64973434117e23d2079460ed64b05c3  wsproto-1.2.0.tar.gz
-sha256  ad565f26ecb92588a3e43bc3d96164de84cd9902482b130d0ddbaa9664a85065  wsproto-1.2.0.tar.gz
+md5  b6374a15a82ca55b23cecc31a489deee  wsproto-1.3.2.tar.gz
+sha256  b86885dcf294e15204919950f666e06ffc6c7c114ca900b060d6e16293528294  wsproto-1.3.2.tar.gz
 # Locally computed sha256 checksums
 sha256  c0329a8dbf3437b095f7f5cf4257d6bb855e07120cae8786586073ff7a699959  LICENSE
diff --git a/package/python-wsproto/python-wsproto.mk b/package/python-wsproto/python-wsproto.mk
index 629f4431b4..e16f72f6e0 100644
--- a/package/python-wsproto/python-wsproto.mk
+++ b/package/python-wsproto/python-wsproto.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_WSPROTO_VERSION = 1.2.0
+PYTHON_WSPROTO_VERSION = 1.3.2
 PYTHON_WSPROTO_SOURCE = wsproto-$(PYTHON_WSPROTO_VERSION).tar.gz
-PYTHON_WSPROTO_SITE = https://files.pythonhosted.org/packages/c9/4a/44d3c295350d776427904d73c189e10aeae66d7f555bb2feee16d1e4ba5a
+PYTHON_WSPROTO_SITE = https://files.pythonhosted.org/packages/c7/79/12135bdf8b9c9367b8701c2c19a14c913c120b882d50b014ca0d38083c2c
 PYTHON_WSPROTO_SETUP_TYPE = setuptools
 PYTHON_WSPROTO_LICENSE = MIT
 PYTHON_WSPROTO_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

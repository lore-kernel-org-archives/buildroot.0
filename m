Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E2E0FA3752
	for <buildroot@archiver.kernel.org>; Fri,  2 Jan 2026 15:30:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 01933806FA;
	Fri,  2 Jan 2026 15:30:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WD-a5aJJXPWa; Fri,  2 Jan 2026 15:30:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 28FEA80702
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767367848;
	bh=9fJCJPKO01WtRDn1V8FsDFVKhC1tbAF7FTc775f0eps=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=SYFKKOMkYQLmwOVi/09H1g/l6KxDyHdqWTj6hi6trc4/krglPZL4aFUvMp+2zjBmi
	 S85HuvEbvb0OdF55vB4jYuEDFMVYn2Oum87qmSq0pARFpmyVGmoSXvccOKf4Nob85F
	 Nm98f97090eRqx+F2wI09u0L3snyB+2bIXsAjQEmv2RLtgs5YzHGBkxDC3wALXjHnt
	 ZyilsAwnPehF4JH25mP3QfwdvyNbq5Ei7/HMTq/RUrVtuWgkPpJpFxhH1WWoepGA6g
	 tm4k0KiElNGXQxksYN9mhlEd6pzRB4su57Xz9p754096becDcLyDQSOMVN5jmcFm6W
	 1Yt82q3Ty7Zpg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 28FEA80702;
	Fri,  2 Jan 2026 15:30:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 50655D7
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 15:30:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 43125607FD
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 15:30:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kKOcPk_puGMs for <buildroot@buildroot.org>;
 Fri,  2 Jan 2026 15:30:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A85FF600C4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id A85FF600C4
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 15:30:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9FDA287F67; Fri,  2 Jan 2026 15:30:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 2 Jan 2026 16:26:58 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a8aed698c706ec534ddc41cdce651c18016c28ca
X-Git-Newrev: b5e737e5753fe0a87f329b125a96f32ffa36d8e5
X-Patchwork-Hint: ignore
Message-Id: <20260102153043.9FDA287F67@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-iwlib: bump version to 1.7.0
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=b5e737e5753fe0a87f329b125a96f32ffa36d8e5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/nhoad/python-iwlib/blob/1.7.0/README.rst
"1.6: Added support for Python 3 (via migration to CFFI)"

Switched SITE to pypi.

Added dependency to python-cffi:
https://github.com/nhoad/python-iwlib/commit/a7c14aff76a28004afb45e08bcf83be5948cb7c1

Updated package as computed by scanpypi.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-iwlib/Config.in         | 1 +
 package/python-iwlib/python-iwlib.hash | 6 ++++--
 package/python-iwlib/python-iwlib.mk   | 7 ++++---
 3 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/package/python-iwlib/Config.in b/package/python-iwlib/Config.in
index eb28d674d9..e15ae38025 100644
--- a/package/python-iwlib/Config.in
+++ b/package/python-iwlib/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_PYTHON_IWLIB
 	bool "python-iwlib"
 	depends on BR2_PACKAGE_WIRELESS_TOOLS_LIB
+	select BR2_PACKAGE_PYTHON_CFFI # runtime
 	help
 	  python-iwlib is a package for interfacing with iwlib,
 	  providing an implementation to the wireless tools in Linux.
diff --git a/package/python-iwlib/python-iwlib.hash b/package/python-iwlib/python-iwlib.hash
index 4d71a3fea6..d1848e0bd7 100644
--- a/package/python-iwlib/python-iwlib.hash
+++ b/package/python-iwlib/python-iwlib.hash
@@ -1,3 +1,5 @@
-# Locally calculated
-sha256  7f1ad4354284a452388e178b5d9b191fa5a68a9183423a90a1d261ba2ebd1cac  python-iwlib-1.5.tar.gz
+# md5, sha256 from https://pypi.org/pypi/iwlib/json
+md5  66016f4f7f53128525d1f9d9de7a6fed  iwlib-1.7.0.tar.gz
+sha256  a805f6597a70ee3001aba8f039fb7b2dcb75dc15c4e7852f5594fd6379196da1  iwlib-1.7.0.tar.gz
+# Locally computed sha256 checksums
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/python-iwlib/python-iwlib.mk b/package/python-iwlib/python-iwlib.mk
index 9d0985567d..7a4fee7fc9 100644
--- a/package/python-iwlib/python-iwlib.mk
+++ b/package/python-iwlib/python-iwlib.mk
@@ -4,11 +4,12 @@
 #
 ################################################################################
 
-PYTHON_IWLIB_VERSION = 1.5
-PYTHON_IWLIB_SITE = $(call github,nhoad,python-iwlib,$(PYTHON_IWLIB_VERSION))
+PYTHON_IWLIB_VERSION = 1.7.0
+PYTHON_IWLIB_SOURCE = iwlib-$(PYTHON_IWLIB_VERSION).tar.gz
+PYTHON_IWLIB_SITE = https://files.pythonhosted.org/packages/59/44/fd72c0a7094baeb448dc9e87b3d579da98e2b8593c3fe05c5f9dd20dc6bc
 PYTHON_IWLIB_LICENSE = GPL-2.0
 PYTHON_IWLIB_LICENSE_FILES = COPYING
 PYTHON_IWLIB_SETUP_TYPE = setuptools
-PYTHON_IWLIB_DEPENDENCIES = wireless_tools
+PYTHON_IWLIB_DEPENDENCIES = host-python-cffi wireless_tools
 
 $(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

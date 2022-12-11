Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C1EFC4332F
	for <buildroot@archiver.kernel.org>; Sun, 11 Dec 2022 21:46:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C482A60A93;
	Sun, 11 Dec 2022 21:46:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C482A60A93
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2h-ar_BwxtgL; Sun, 11 Dec 2022 21:46:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DED7660BF2;
	Sun, 11 Dec 2022 21:46:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DED7660BF2
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 92F841BF309
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 21:45:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6A38A4054A
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 21:45:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6A38A4054A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NOb3F1EIwpB4 for <buildroot@lists.busybox.net>;
 Sun, 11 Dec 2022 21:45:48 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5731A407D7
 for <buildroot@buildroot.org>; Sun, 11 Dec 2022 21:45:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5731A407D7
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3A1468179A; Sun, 11 Dec 2022 21:45:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 11 Dec 2022 22:44:17 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6398d18d50c021992375c4229e3898402c3a1cc8
X-Git-Newrev: 470ce5d85c40a2f3b43dd9efaefac0000b047d23
X-Patchwork-Hint: ignore
Message-Id: <20221211214548.3A1468179A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-m2r: remove package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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

commit: https://git.buildroot.net/buildroot/commit/?id=470ce5d85c40a2f3b43dd9efaefac0000b047d23
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since the bump of python-mistune to version 2.0.4 in commit
ead539c27dd61ba010b3723b26af91da0779eb98, the python-m2r package fails
to build: it is no longer maintained and no longer compatible with
recent versions of python-mistune.

Since the only user of python-m2r, python-automat, no longer needs it,
we can safely drop this package.

Fixes:

   http://autobuild.buildroot.net/results/9041acc5be4d2b33dee9ff0ad66dcd41d4dbfba1

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 Config.in.legacy                   |  6 ++++++
 package/Config.in                  |  1 -
 package/python-m2r/Config.in       |  8 --------
 package/python-m2r/python-m2r.hash |  5 -----
 package/python-m2r/python-m2r.mk   | 16 ----------------
 5 files changed, 6 insertions(+), 30 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 9136ccd0e0..28c6822689 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,12 @@ endif
 
 comment "Legacy options removed in 2023.02"
 
+config BR2_PACKAGE_PYTHON_M2R
+	bool "python-m2r removed"
+	select BR2_LEGACY
+	help
+	  The python-m2r package is unmaintained.
+
 config BR2_PACKAGE_MESA3D_XVMC
 	bool "mesa Gallium XvMC state tracker removed"
 	select BR2_LEGACY
diff --git a/package/Config.in b/package/Config.in
index 10a0493b8d..914c3584e9 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1112,7 +1112,6 @@ menu "External python modules"
 	source "package/python-logstash/Config.in"
 	source "package/python-lxml/Config.in"
 	source "package/python-m2crypto/Config.in"
-	source "package/python-m2r/Config.in"
 	source "package/python-mako/Config.in"
 	source "package/python-markdown/Config.in"
 	source "package/python-markdown2/Config.in"
diff --git a/package/python-m2r/Config.in b/package/python-m2r/Config.in
deleted file mode 100644
index 44dafaa464..0000000000
--- a/package/python-m2r/Config.in
+++ /dev/null
@@ -1,8 +0,0 @@
-config BR2_PACKAGE_PYTHON_M2R
-	bool "python-m2r"
-	select BR2_PACKAGE_PYTHON_MISTUNE # runtime
-	select BR2_PACKAGE_PYTHON_DOCUTILS # runtime
-	help
-	  Markdown to reStructuredText converter.
-
-	  https://github.com/miyakogi/m2r
diff --git a/package/python-m2r/python-m2r.hash b/package/python-m2r/python-m2r.hash
deleted file mode 100644
index 4bdd7160d8..0000000000
--- a/package/python-m2r/python-m2r.hash
+++ /dev/null
@@ -1,5 +0,0 @@
-# md5, sha256 from https://pypi.org/pypi/m2r/json
-md5  255d080f56eb3d3a82d95194850c99c3  m2r-0.3.1.tar.gz
-sha256  aafb67fc49cfb1d89e46a3443ac747e15f4bb42df20ed04f067ad9efbee256ab  m2r-0.3.1.tar.gz
-# Locally computed sha256 checksums
-sha256  28728ec0ecbd8c171ebaeccebf69e3961282fd81f06abc7424c65546b6ae6f27  LICENSE
diff --git a/package/python-m2r/python-m2r.mk b/package/python-m2r/python-m2r.mk
deleted file mode 100644
index 8a4708f128..0000000000
--- a/package/python-m2r/python-m2r.mk
+++ /dev/null
@@ -1,16 +0,0 @@
-################################################################################
-#
-# python-m2r
-#
-################################################################################
-
-PYTHON_M2R_VERSION = 0.3.1
-PYTHON_M2R_SOURCE = m2r-$(PYTHON_M2R_VERSION).tar.gz
-PYTHON_M2R_SITE = https://files.pythonhosted.org/packages/94/65/fd40fbdc608298e760affb95869c3baed237dfe5649d62da1eaa1deca8f3
-PYTHON_M2R_SETUP_TYPE = setuptools
-PYTHON_M2R_LICENSE = MIT
-PYTHON_M2R_LICENSE_FILES = LICENSE
-HOST_PYTHON_M2R_DEPENDENCIES = host-python-docutils host-python-mistune
-
-$(eval $(python-package))
-$(eval $(host-python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

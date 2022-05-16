Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EF6BC433F5
	for <buildroot@archiver.kernel.org>; Mon, 16 May 2022 22:54:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0F6916114C;
	Mon, 16 May 2022 22:54:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LZnMjCwNAVhl; Mon, 16 May 2022 22:54:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0BDFD61150;
	Mon, 16 May 2022 22:54:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 12D5F1BF2CF
 for <buildroot@lists.busybox.net>; Mon, 16 May 2022 22:54:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EE32941940
 for <buildroot@lists.busybox.net>; Mon, 16 May 2022 22:54:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2OftNqB7FkIT for <buildroot@lists.busybox.net>;
 Mon, 16 May 2022 22:54:44 +0000 (UTC)
X-Greylist: delayed 00:07:36 by SQLgrey-1.8.0
Received: from dev.flatmax.com (unknown
 [IPv6:2406:3400:213:70c0:e22b:ed2:b64d:d06])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C3A444193E
 for <buildroot@buildroot.org>; Mon, 16 May 2022 22:54:43 +0000 (UTC)
Received: by monstilationax (Postfix, from userid 1000)
 id D52783846185; Tue, 17 May 2022 08:47:03 +1000 (AEST)
From: Matt Flax <flatmax@flatmax.com>
To: buildroot@buildroot.org
Date: Tue, 17 May 2022 08:46:55 +1000
Message-Id: <20220516224655.15730-1-flatmax@flatmax.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Subject: [Buildroot] [RESEND PATCH v2 1/1] package/gtkiostream: new package
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Matt Flax <flatmax@flatmax.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This package provides many useful software engineering and signal
processing libraries.

Signed-off-by: Matt Flax <flatmax@flatmax.com>
---

Notes:
    Changes in v2:
    
    - added DEVELOPERS entry
    - trimmed down Config.in to min. selections.
    - Cleaned up gtkiostream.mk
    - Added hash file.
    - fixed TAB indention

 DEVELOPERS                           |  3 +++
 package/Config.in                    |  1 +
 package/gtkiostream/Config.in        | 16 ++++++++++++++++
 package/gtkiostream/gtkiostream.hash |  3 +++
 package/gtkiostream/gtkiostream.mk   | 16 ++++++++++++++++
 5 files changed, 39 insertions(+)
 create mode 100644 package/gtkiostream/Config.in
 create mode 100644 package/gtkiostream/gtkiostream.hash
 create mode 100644 package/gtkiostream/gtkiostream.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 292b919137..0c0fb9646d 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1883,6 +1883,9 @@ F:	board/technologic/ts4900/
 F:	configs/ts4900_defconfig
 F:	package/ts4900-fpga/
 
+N:	Matt Flax <flatmax@flatmax.org>
+F:	package/gtkiostream/
+
 N:	Matt Weber <matthew.weber@collins.com>
 F:	board/freescale/p*
 F:	board/freescale/t*
diff --git a/package/Config.in b/package/Config.in
index befeadc27b..8e3dd0c08d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1328,6 +1328,7 @@ menu "Audio/Sound"
 	source "package/bcg729/Config.in"
 	source "package/caps/Config.in"
 	source "package/fdk-aac/Config.in"
+	source "package/gtkiostream/Config.in"
 	source "package/libao/Config.in"
 	source "package/libasplib/Config.in"
 	source "package/libbroadvoice/Config.in"
diff --git a/package/gtkiostream/Config.in b/package/gtkiostream/Config.in
new file mode 100644
index 0000000000..2cbec5a844
--- /dev/null
+++ b/package/gtkiostream/Config.in
@@ -0,0 +1,16 @@
+config BR2_PACKAGE_GTKIOSTREAM
+	bool "gtkiostream"
+	depends on BR2_INSTALL_LIBSTDCPP # eigen
+	select BR2_PACKAGE_EIGEN
+	select BR2_PACKAGE_EIGEN_UNSUPPORTED_MODULES
+	select BR2_PACKAGE_FFTW
+	select BR2_PACKAGE_FFTW_DOUBLE
+	select BR2_PACKAGE_FFTW_SINGLE
+	help
+	  This package provides many useful software engineering and signal
+	  processing includes and linkable library.
+
+	  https://github.com/flatmax/gtkiostream
+
+comment "gtkiostream needs a toolchain w/ C++"
+	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/gtkiostream/gtkiostream.hash b/package/gtkiostream/gtkiostream.hash
new file mode 100644
index 0000000000..472dd2e9d2
--- /dev/null
+++ b/package/gtkiostream/gtkiostream.hash
@@ -0,0 +1,3 @@
+# locally computed hash
+sha256 9edf7d034796ac79a24ef1de14023a9c7f0f9b8bf7fdd6fc3437839c4fdc0aa0 gtkiostream-7b5056be13135a5526d39afbaaaff7cfd879b5ca.tar.gz
+sha256 204d8eff92f95aac4df6c8122bc1505f468f3a901e5a4cc08940e0ede1938994 gpl.txt
diff --git a/package/gtkiostream/gtkiostream.mk b/package/gtkiostream/gtkiostream.mk
new file mode 100644
index 0000000000..41cdd4e4a5
--- /dev/null
+++ b/package/gtkiostream/gtkiostream.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# GTKIOSTREAM
+#
+################################################################################
+GTKIOSTREAM_VERSION = 7b5056be13135a5526d39afbaaaff7cfd879b5ca
+GTKIOSTREAM_SITE = $(call github,flatmax,gtkiostream,$(GTKIOSTREAM_VERSION))
+
+GTKIOSTREAM_LICENSE = GPL-2.0+
+GTKIOSTREAM_CONF_OPTS = --disable-octave
+GTKIOSTREAM_DEPENDENCIES = eigen fftw-double fftw-single host-pkgconf
+
+# Fetched from git, no configure script
+GTKIOSTREAM_AUTORECONF = YES
+
+$(eval $(autotools-package))
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

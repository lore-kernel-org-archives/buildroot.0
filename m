Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4D9BC433EF
	for <buildroot@archiver.kernel.org>; Mon, 23 May 2022 22:24:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 502DB41833;
	Mon, 23 May 2022 22:24:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7VxfuXsgLB5M; Mon, 23 May 2022 22:24:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7BDDF4182B;
	Mon, 23 May 2022 22:23:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CBA7A1BF337
 for <buildroot@lists.busybox.net>; Mon, 23 May 2022 22:23:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C437882EA4
 for <buildroot@lists.busybox.net>; Mon, 23 May 2022 22:23:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JBlWxizxRCbc for <buildroot@lists.busybox.net>;
 Mon, 23 May 2022 22:23:56 +0000 (UTC)
X-Greylist: delayed 00:06:26 by SQLgrey-1.8.0
Received: from dev.flatmax.com (unknown
 [IPv6:2406:3400:213:70c0:1368:f9ff:595e:f328])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 84B7682EA2
 for <buildroot@buildroot.org>; Mon, 23 May 2022 22:23:56 +0000 (UTC)
Received: by dev.flatmax.com (Postfix, from userid 1000)
 id E83FD384028F; Tue, 24 May 2022 08:17:26 +1000 (AEST)
From: Matt Flax <flatmax@flatmax.com>
To: buildroot@buildroot.org
Date: Tue, 24 May 2022 08:17:24 +1000
Message-Id: <20220523221724.677215-1-flatmax@flatmax.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Subject: [Buildroot] [RESEND PATCH v3 1/1] package/gtkiostream: new package
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
Cc: Matt Flax <flatmax@flatmax.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Matt Flax <flatmax@flatmax.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This package provides many useful software engineering and signal
processing libraries.

Signed-off-by: Matt Flax <flatmax@flatmax.com>
---

Notes:
    Changes in v3:
    - removed BR2_PACKAGE_EIGEN_UNSUPPORTED_MODULES

    Changes in v2:
    
    - added DEVELOPERS entry
    - trimmed down Config.in to min. selections.
    - Cleaned up gtkiostream.mk
    - Added hash file.
    - fixed TAB indention

 DEVELOPERS                           |  3 +++
 package/Config.in                    |  1 +
 package/gtkiostream/Config.in        | 15 +++++++++++++++
 package/gtkiostream/gtkiostream.hash |  3 +++
 package/gtkiostream/gtkiostream.mk   | 16 ++++++++++++++++
 5 files changed, 38 insertions(+)
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
index 0000000000..a56d93c562
--- /dev/null
+++ b/package/gtkiostream/Config.in
@@ -0,0 +1,15 @@
+config BR2_PACKAGE_GTKIOSTREAM
+	bool "gtkiostream"
+	depends on BR2_INSTALL_LIBSTDCPP # eigen
+	select BR2_PACKAGE_EIGEN
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

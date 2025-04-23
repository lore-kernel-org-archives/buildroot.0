Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CA6BC369CB
	for <buildroot@archiver.kernel.org>; Wed, 23 Apr 2025 20:31:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 472B6411AB;
	Wed, 23 Apr 2025 20:31:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JC_a02dC9Wfm; Wed, 23 Apr 2025 20:31:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 50B17411AF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 50B17411AF;
	Wed, 23 Apr 2025 20:31:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8CE702A6
 for <buildroot@buildroot.org>; Wed, 23 Apr 2025 20:31:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 72587411AB
 for <buildroot@buildroot.org>; Wed, 23 Apr 2025 20:31:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z6Ek1sNr4cEr for <buildroot@buildroot.org>;
 Wed, 23 Apr 2025 20:31:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5B543411AF
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5B543411AF
 for <buildroot@buildroot.org>; Wed, 23 Apr 2025 20:31:12 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3C82586270; Wed, 23 Apr 2025 20:31:12 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 23 Apr 2025 22:30:42 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e42da630d0c1f3aca8ecc6d0d35a777f202270ed
X-Git-Newrev: f78280bf262ceb1c1abbdade9de77fcc4add74ae
X-Patchwork-Hint: ignore
Message-Id: <20250423203112.3C82586270@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/sane-airscan: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=f78280bf262ceb1c1abbdade9de77fcc4add74ae
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Guillaume Chaye <guillaume.chaye@zeetim.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                             |  3 +++
 package/Config.in                      |  1 +
 package/sane-airscan/Config.in         | 20 ++++++++++++++++++++
 package/sane-airscan/sane-airscan.hash |  3 +++
 package/sane-airscan/sane-airscan.mk   | 13 +++++++++++++
 5 files changed, 40 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index a692a9779c..1f0fc1903c 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1361,6 +1361,9 @@ F:	package/python-rpi-ws281x/
 F:	package/python-wtforms/
 F:	package/rpi-rgb-led-matrix/
 
+N:	Guillaume Chaye
+F:	package/sane-airscan/
+
 N:	Guillaume William Brs <guillaume.bressaix@gmail.com>
 F:	package/libnids/
 F:	package/libxcrypt/
diff --git a/package/Config.in b/package/Config.in
index 1bdbbd28fd..93bb99c2d7 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -615,6 +615,7 @@ endmenu
 	source "package/rtl8821au/Config.in"
 	source "package/rtl8821cu/Config.in"
 	source "package/rtl8822cs/Config.in"
+	source "package/sane-airscan/Config.in"
 	source "package/sane-backends/Config.in"
 	source "package/sdparm/Config.in"
 	source "package/sedutil/Config.in"
diff --git a/package/sane-airscan/Config.in b/package/sane-airscan/Config.in
new file mode 100644
index 0000000000..f35e244ea6
--- /dev/null
+++ b/package/sane-airscan/Config.in
@@ -0,0 +1,20 @@
+config BR2_PACKAGE_SANE_AIRSCAN
+	bool "sane-airscan"
+	select BR2_PACKAGE_AVAHI
+	select BR2_PACKAGE_AVAHI_DAEMON # needed to get avahi-client
+	select BR2_PACKAGE_DBUS # needed by avahi to get avahi-client
+	select BR2_PACKAGE_GNUTLS
+	select BR2_PACKAGE_JPEG
+	select BR2_PACKAGE_LIBPNG
+	select BR2_PACKAGE_LIBXML2
+	select BR2_PACKAGE_SANE_BACKENDS
+	select BR2_PACKAGE_TIFF
+	help
+	  SANE backend for AirScan (eSCL) and WSD document scanners
+
+	  Similar to how most modern network printers support
+	  "driverless" printing, using the universal vendor-neutral
+	  printing protocol, many modern network scanners and MFPs
+	  support "driverless" scanning.
+
+	  https://github.com/alexpevzner/sane-airscan
diff --git a/package/sane-airscan/sane-airscan.hash b/package/sane-airscan/sane-airscan.hash
new file mode 100644
index 0000000000..40fb84e32d
--- /dev/null
+++ b/package/sane-airscan/sane-airscan.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  647f41f84f9bce743c796ca84c1fda67e519968fab407490c28fd0cc6d7ac485  sane-airscan-0.99.33.tar.gz
+sha256  a2631c1b81992bd6f66db6be8b009ed7e3e998d1e2db4de497fa82d65011d373  LICENSE
diff --git a/package/sane-airscan/sane-airscan.mk b/package/sane-airscan/sane-airscan.mk
new file mode 100644
index 0000000000..168430e3e3
--- /dev/null
+++ b/package/sane-airscan/sane-airscan.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# sane-airscan
+#
+################################################################################
+
+SANE_AIRSCAN_VERSION = 0.99.33
+SANE_AIRSCAN_SITE = $(call github,alexpevzner,sane-airscan,$(SANE_AIRSCAN_VERSION))
+SANE_AIRSCAN_DEPENDENCIES = avahi gnutls jpeg libpng libxml2 sane-backends tiff
+SANE_AIRSCAN_LICENSE = GPL-2.0+-with-exception
+SANE_AIRSCAN_LICENSE_FILES = LICENSE
+
+$(eval $(meson-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

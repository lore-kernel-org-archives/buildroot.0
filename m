Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6760C64EC4
	for <buildroot@archiver.kernel.org>; Thu,  9 Mar 2023 21:22:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7293782269;
	Thu,  9 Mar 2023 21:22:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7293782269
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 06yEbEZe4Qrb; Thu,  9 Mar 2023 21:22:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7CAC68224B;
	Thu,  9 Mar 2023 21:22:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7CAC68224B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E36151BF366
 for <buildroot@lists.busybox.net>; Thu,  9 Mar 2023 21:21:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AA75B60E82
 for <buildroot@lists.busybox.net>; Thu,  9 Mar 2023 21:21:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AA75B60E82
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sstzhV1DXRxL for <buildroot@lists.busybox.net>;
 Thu,  9 Mar 2023 21:21:00 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8315460E85
 for <buildroot@buildroot.org>; Thu,  9 Mar 2023 21:21:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8315460E85
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 730DA86C92; Thu,  9 Mar 2023 21:21:00 +0000 (UTC)
From: Arnout Vandecappelle <arnout@mind.be>
To: buildroot@buildroot.org
Date: Thu, 9 Mar 2023 22:18:42 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: cd68e89c6c7d3bc3573ff5ae4eeedde4ca63003e
X-Git-Newrev: f91661108d85d4bb663fe555be82a246a7e6b027
X-Patchwork-Hint: ignore
Message-Id: <20230309212100.730DA86C92@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pangomm2_46: new package
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=f91661108d85d4bb663fe555be82a246a7e6b027
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This is the version needed by gtkmm3.

Signed-off-by: Daniel Lang <d.lang@abatec.at>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 DEVELOPERS                                 |  2 ++
 package/Config.in                          |  1 +
 package/pangomm/Config.in                  |  2 +-
 package/{pangomm => pangomm2_46}/Config.in | 19 +++++++++++--------
 package/pangomm2_46/pangomm2_46.hash       |  5 +++++
 package/pangomm2_46/pangomm2_46.mk         | 16 ++++++++++++++++
 6 files changed, 36 insertions(+), 9 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index b9156aeaab..27466de54a 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -650,6 +650,8 @@ F:	package/glibmm2_66/
 F:	package/libsigc/
 F:	package/libsigc2/
 F:	package/paho-mqtt-cpp/
+F:	package/pangomm/
+F:	package/pangomm2_46/
 
 N:	Damien Lanson <damien@kal-host.com>
 F:	package/libvdpau/
diff --git a/package/Config.in b/package/Config.in
index 14897df6c8..c7bb52d278 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1635,6 +1635,7 @@ menu "Graphics"
 	source "package/openjpeg/Config.in"
 	source "package/pango/Config.in"
 	source "package/pangomm/Config.in"
+	source "package/pangomm2_46/Config.in"
 	source "package/pixman/Config.in"
 	source "package/poppler/Config.in"
 	source "package/powervr/Config.in"
diff --git a/package/pangomm/Config.in b/package/pangomm/Config.in
index c23ac4aaa8..6ddad9e6ef 100644
--- a/package/pangomm/Config.in
+++ b/package/pangomm/Config.in
@@ -1,5 +1,5 @@
 config BR2_PACKAGE_PANGOMM
-	bool "pangomm"
+	bool "pangomm (latest)"
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # pango -> harfbuzz
 	depends on BR2_INSTALL_LIBSTDCPP # glibmm/pango
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # libsigc
diff --git a/package/pangomm/Config.in b/package/pangomm2_46/Config.in
similarity index 52%
copy from package/pangomm/Config.in
copy to package/pangomm2_46/Config.in
index c23ac4aaa8..772b523c83 100644
--- a/package/pangomm/Config.in
+++ b/package/pangomm2_46/Config.in
@@ -1,22 +1,25 @@
-config BR2_PACKAGE_PANGOMM
-	bool "pangomm"
+config BR2_PACKAGE_PANGOMM2_46
+	bool "pangomm (2.46.x)"
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # pango -> harfbuzz
 	depends on BR2_INSTALL_LIBSTDCPP # glibmm/pango
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # libsigc
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C++11
 	depends on BR2_TOOLCHAIN_HAS_THREADS # *mm/pango -> libglib2
 	depends on BR2_USE_MMU # *mm/pango -> libglib2
 	depends on BR2_USE_WCHAR # *mm/pango -> libglib2
-	select BR2_PACKAGE_CAIROMM
-	select BR2_PACKAGE_GLIBMM
+	select BR2_PACKAGE_CAIROMM1_14
+	select BR2_PACKAGE_GLIBMM2_66
 	select BR2_PACKAGE_PANGO
-	select BR2_PACKAGE_LIBSIGC
+	select BR2_PACKAGE_LIBSIGC2
 	help
 	  The pangomm package is a set of C++ bindings for Pango.
 
+	  This is the last version before the API and ABI change
+	  introduced in 2.48.0 which requires C++17.
+
 	  http://www.gtkmm.org/
 
-comment "pangomm needs a toolchain w/ C++, wchar, threads, gcc >= 7"
+comment "pangomm (2.46.x) needs a toolchain w/ C++, wchar, threads, gcc >= 4.9"
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
-	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_7 || !BR2_USE_WCHAR \
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || !BR2_USE_WCHAR \
 		|| !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/pangomm2_46/pangomm2_46.hash b/package/pangomm2_46/pangomm2_46.hash
new file mode 100644
index 0000000000..8d05dbc2ff
--- /dev/null
+++ b/package/pangomm2_46/pangomm2_46.hash
@@ -0,0 +1,5 @@
+# From https://download.gnome.org/sources/pangomm/2.46/pangomm-2.46.3.sha256sum
+sha256  410fe04d471a608f3f0273d3a17d840241d911ed0ff2c758a9859c66c6f24379  pangomm-2.46.3.tar.xz
+# Locally computed
+sha256  5bbcbb737e60fe9deba08ecbd00920cfcc3403ba2e534c64fdeea49d6bb87509  COPYING
+sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING.tools
diff --git a/package/pangomm2_46/pangomm2_46.mk b/package/pangomm2_46/pangomm2_46.mk
new file mode 100644
index 0000000000..1725158491
--- /dev/null
+++ b/package/pangomm2_46/pangomm2_46.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# pangomm2_46
+#
+################################################################################
+
+PANGOMM2_46_VERSION_MAJOR = 2.46
+PANGOMM2_46_VERSION = $(PANGOMM2_46_VERSION_MAJOR).3
+PANGOMM2_46_SOURCE = pangomm-$(PANGOMM2_46_VERSION).tar.xz
+PANGOMM2_46_SITE = https://download.gnome.org/sources/pangomm/$(PANGOMM2_46_VERSION_MAJOR)
+PANGOMM2_46_LICENSE = LGPL-2.1+ (library), GPL-2.0+ (tools)
+PANGOMM2_46_LICENSE_FILES = COPYING COPYING.tools
+PANGOMM2_46_INSTALL_STAGING = YES
+PANGOMM2_46_DEPENDENCIES = glibmm2_66 cairomm1_14 libsigc2 pango host-pkgconf
+
+$(eval $(meson-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

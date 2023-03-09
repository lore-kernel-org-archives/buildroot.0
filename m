Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB948C64EC4
	for <buildroot@archiver.kernel.org>; Thu,  9 Mar 2023 21:21:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 92C9F82246;
	Thu,  9 Mar 2023 21:21:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 92C9F82246
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id j3IdlSq3cmNT; Thu,  9 Mar 2023 21:21:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AC59482255;
	Thu,  9 Mar 2023 21:21:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AC59482255
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8D8401BF97E
 for <buildroot@lists.busybox.net>; Thu,  9 Mar 2023 21:21:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 676C482246
 for <buildroot@lists.busybox.net>; Thu,  9 Mar 2023 21:21:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 676C482246
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pZM49O1k02cx for <buildroot@lists.busybox.net>;
 Thu,  9 Mar 2023 21:21:00 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9125282244
 for <buildroot@buildroot.org>; Thu,  9 Mar 2023 21:21:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9125282244
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 814A086C9B; Thu,  9 Mar 2023 21:21:00 +0000 (UTC)
From: Arnout Vandecappelle <arnout@mind.be>
To: buildroot@buildroot.org
Date: Thu, 9 Mar 2023 22:18:43 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f91661108d85d4bb663fe555be82a246a7e6b027
X-Git-Newrev: 6e817622b812cf579061abd78f08af029eba72ea
X-Patchwork-Hint: ignore
Message-Id: <20230309212100.814A086C9B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gtkmm3: use correct versions of mm
 packages
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

commit: https://git.buildroot.net/buildroot/commit/?id=6e817622b812cf579061abd78f08af029eba72ea
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Many of the C++ wrapper packages had API changes. These changes where
never introduced in gtkmm3, meaning that older, but still maintained
versions are needed to build gtkmm3.

Fixes:
 - http://autobuild.buildroot.net/results/172/17263ac51f197031106eb7fd595126a2720f0397

Signed-off-by: Daniel Lang <d.lang@abatec.at>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 DEVELOPERS               |  1 +
 package/gtkmm3/Config.in | 16 ++++++++--------
 package/gtkmm3/gtkmm3.mk |  2 +-
 3 files changed, 10 insertions(+), 9 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 27466de54a..1dc085b87f 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -647,6 +647,7 @@ F:	package/cairomm1_14/
 F:	package/dbus-cxx/
 F:	package/glibmm/
 F:	package/glibmm2_66/
+F:	package/gtkmm3/
 F:	package/libsigc/
 F:	package/libsigc2/
 F:	package/paho-mqtt-cpp/
diff --git a/package/gtkmm3/Config.in b/package/gtkmm3/Config.in
index 3c1c6f36e8..6b924c856b 100644
--- a/package/gtkmm3/Config.in
+++ b/package/gtkmm3/Config.in
@@ -1,7 +1,7 @@
-comment "gtkmm3 needs libgtk3 and a toolchain w/ C++, wchar, threads, gcc >= 7"
+comment "gtkmm3 needs libgtk3 and a toolchain w/ C++, wchar, threads, gcc >= 4.9"
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
-	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_7 || !BR2_USE_WCHAR \
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || !BR2_USE_WCHAR \
 		|| !BR2_INSTALL_LIBSTDCPP || !BR2_PACKAGE_LIBGTK3 \
 		|| !BR2_TOOLCHAIN_HAS_THREADS
 
@@ -14,16 +14,16 @@ config BR2_PACKAGE_GTKMM3
 	depends on !BR2_nios2
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # pangomm, libgtk3 -> pango -> harfbuzz
 	depends on BR2_INSTALL_LIBSTDCPP # glibmm, libpangomm -> glibmm/pango
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # libsigc
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C++11
 	depends on BR2_TOOLCHAIN_HAS_THREADS # *mm/libgtk3 -> libglib2
 	depends on BR2_USE_MMU # *mm/libgtk3 -> libglib2
 	depends on BR2_USE_WCHAR # *mm/libgtk3 -> libglib2
 	depends on BR2_PACKAGE_LIBGTK3
-	select BR2_PACKAGE_ATKMM
-	select BR2_PACKAGE_CAIROMM
-	select BR2_PACKAGE_GLIBMM
-	select BR2_PACKAGE_LIBSIGC
-	select BR2_PACKAGE_PANGOMM
+	select BR2_PACKAGE_ATKMM2_28
+	select BR2_PACKAGE_CAIROMM1_14
+	select BR2_PACKAGE_GLIBMM2_66
+	select BR2_PACKAGE_LIBSIGC2
+	select BR2_PACKAGE_PANGOMM2_46
 	help
 	  The gtkmm3 package is a set of C++ bindings for GTK 3.
 
diff --git a/package/gtkmm3/gtkmm3.mk b/package/gtkmm3/gtkmm3.mk
index d717c08bd8..8bbcf224e6 100644
--- a/package/gtkmm3/gtkmm3.mk
+++ b/package/gtkmm3/gtkmm3.mk
@@ -11,6 +11,6 @@ GTKMM3_SITE = https://download.gnome.org/sources/gtkmm/$(GTKMM3_VERSION_MAJOR)
 GTKMM3_LICENSE = LGPL-2.1+ (library), GPL-2.0+ (tools)
 GTKMM3_LICENSE_FILES = COPYING COPYING.tools
 GTKMM3_INSTALL_STAGING = YES
-GTKMM3_DEPENDENCIES = atkmm cairomm glibmm libgtk3 libsigc pangomm host-pkgconf
+GTKMM3_DEPENDENCIES = atkmm2_28 cairomm1_14 glibmm2_66 libgtk3 libsigc2 pangomm2_46 host-pkgconf
 
 $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

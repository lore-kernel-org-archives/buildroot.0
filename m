Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4684DC5DF67
	for <buildroot@archiver.kernel.org>; Sat, 15 Aug 2026 17:22:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D691F605E5;
	Sat, 15 Aug 2026 17:22:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GYL_BKlGhBFD; Sat, 15 Aug 2026 17:22:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ED8776065E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786814554;
	bh=7TIx03u/XJlpyd+iru8EH6RHTF1SC/0E2xPDvbIpy90=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Fp4M3amWtZVRWmULBEP/lmwVbE7XYpg6TpV6NV9Tck9eHtLDEKRSwUOC6pfdQwdiG
	 vffIy69A+A+TadfyuOX8sKkTlRYkyEWZDR6BJeGiEj46oVTdkMPZw96TbFJ7SZQwE2
	 LtM/tlSNLBSn6tTfCDsy9U93WCpvnfEdhUINGTs7CC8b5JQsJFc1QPxxiG4PU9GVUq
	 cJVZ04kDXaA6NXuO7peErhedeLnBJH95L1JojJiWAkU3V1aDqsGGohDMphaEpk2Yqz
	 MtTze9s7Mb+r2rD0gSGq8Kxn9Q6Ts9SPK+qY/A57j9QAWDpqOW5SOtanOsXldBkA57
	 FHbAxUN1t4NAw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id ED8776065E;
	Sat, 15 Aug 2026 17:22:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2F73E336
 for <buildroot@buildroot.org>; Sat, 15 Aug 2026 17:22:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 21C266064F
 for <buildroot@buildroot.org>; Sat, 15 Aug 2026 17:22:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vZFZiu_zBSFp for <buildroot@buildroot.org>;
 Sat, 15 Aug 2026 17:22:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3FB31605E5
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3FB31605E5
 for <buildroot@buildroot.org>; Sat, 15 Aug 2026 17:22:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 985C98D7AB; Sat, 15 Aug 2026 17:21:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 15 Aug 2026 19:15:55 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e5116ed8c280e380dc78a1318aca02b527b21916
X-Git-Newrev: 328fa370f0bc45cbce22fa73263e2a2c3b597e07
X-Patchwork-Hint: ignore
Message-Id: <20260815172140.985C98D7AB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libdvdcss: needs gcc >= 8
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/328fa370f0bc45cbce22fa73263e2a2c3b597e07
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Buildroot commit cd3a2f0ff35346ad5fd6a9867113260addccf127 switched the
build system to meson which depends on c17:
https://code.videolan.org/videolan/libdvdcss/-/commit/9f16597859120b96006415c084039f63efc84b83#line_0cc1139e3_A5

Add the necessary dependency and propagate to reverse dependencies to
fix a build error caught by the Gitlab pipelines:

br-test-pkg/bootlin-aarch64-glibc-old/build/libdvdcss-1.5.0/meson.build:1:0:
 ERROR: None of values ['c17'] are supported by the C compiler. Possible
 values for option "c_std" are ['none', 'c89', 'c99', 'c11', 'gnu89',
 'gnu99', 'gnu11']

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/dvdauthor/Config.in                    | 4 ++++
 package/gstreamer1/gst1-plugins-ugly/Config.in | 4 ++++
 package/libdvdcss/Config.in                    | 4 ++++
 package/libdvdnav/Config.in                    | 6 ++++--
 package/libdvdread/Config.in                   | 4 ++++
 5 files changed, 20 insertions(+), 2 deletions(-)

diff --git a/package/dvdauthor/Config.in b/package/dvdauthor/Config.in
index 9ba5411d6b..23477e91e0 100644
--- a/package/dvdauthor/Config.in
+++ b/package/dvdauthor/Config.in
@@ -17,9 +17,13 @@ if BR2_PACKAGE_DVDAUTHOR
 
 config BR2_PACKAGE_DVDAUTHOR_DVDUNAUTHOR
 	bool "dvdunauthor"
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8 # libdvdcss -> libdvdread
 	select BR2_PACKAGE_LIBDVDREAD
 	help
 	  This option enables the dvdunauthor program, which requires
 	  libdvdread.
 
+comment "dvdunauthor needs a toolchain w/ gcc >= 8"
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_8
+
 endif
diff --git a/package/gstreamer1/gst1-plugins-ugly/Config.in b/package/gstreamer1/gst1-plugins-ugly/Config.in
index 54766ffa8c..aff495c1ac 100644
--- a/package/gstreamer1/gst1-plugins-ugly/Config.in
+++ b/package/gstreamer1/gst1-plugins-ugly/Config.in
@@ -35,10 +35,14 @@ comment "plugins with external dependencies (there may be more available)"
 
 config BR2_PACKAGE_GST1_PLUGINS_UGLY_PLUGIN_DVDREAD
 	bool "dvdread"
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8 # libdvdcss -> libdvdread
 	select BR2_PACKAGE_LIBDVDREAD
 	help
 	  Access a DVD with dvdread
 
+comment "dvdread needs a toolchain w/ gcc >= 8"
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_8
+
 config BR2_PACKAGE_GST1_PLUGINS_UGLY_PLUGIN_MPEG2DEC
 	bool "mpeg2dec"
 	select BR2_PACKAGE_LIBMPEG2
diff --git a/package/libdvdcss/Config.in b/package/libdvdcss/Config.in
index a8c3b84cf5..8e6f6ea984 100644
--- a/package/libdvdcss/Config.in
+++ b/package/libdvdcss/Config.in
@@ -1,7 +1,11 @@
 config BR2_PACKAGE_LIBDVDCSS
 	bool "libdvdcss"
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8 # std=c17
 	help
 	  libdvdcss is a simple library designed for accessing DVDs like
 	  a block device without having to bother about the decryption.
 
 	  http://www.videolan.org/developers/libdvdcss.html
+
+comment "libdvdcss needs a toolchain w/ gcc >= 8"
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_8
diff --git a/package/libdvdnav/Config.in b/package/libdvdnav/Config.in
index 77cba5f135..8276e466db 100644
--- a/package/libdvdnav/Config.in
+++ b/package/libdvdnav/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_LIBDVDNAV
 	bool "libdvdnav"
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8 # libdvdcss -> libdvdread
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_LIBDVDREAD
 	help
@@ -9,5 +10,6 @@ config BR2_PACKAGE_LIBDVDNAV
 
 	  https://www.videolan.org/developers/libdvdnav.html
 
-comment "libdvdnav needs a toolchain w/ threads"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
+comment "libdvdnav needs a toolchain w/ threads, gcc >= 8"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_8
diff --git a/package/libdvdread/Config.in b/package/libdvdread/Config.in
index 3579054158..efa86a4e38 100644
--- a/package/libdvdread/Config.in
+++ b/package/libdvdread/Config.in
@@ -1,8 +1,12 @@
 config BR2_PACKAGE_LIBDVDREAD
 	bool "libdvdread"
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8 # libdvdcss
 	select BR2_PACKAGE_LIBDVDCSS
 	help
 	  libdvdread provides a simple foundation for reading
 	  DVD-Video images.
 
 	  https://www.videolan.org/developers/libdvdnav.html
+
+comment "libdvdread needs a toolchain w/ gcc >= 8"
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_8
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

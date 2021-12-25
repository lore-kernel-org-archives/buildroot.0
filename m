Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25F10C433F5
	for <buildroot@archiver.kernel.org>; Sat, 25 Dec 2021 10:53:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 942BC82786;
	Sat, 25 Dec 2021 10:53:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yWAVtLHQRFRA; Sat, 25 Dec 2021 10:53:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DA5128142F;
	Sat, 25 Dec 2021 10:53:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 790341BF83E
 for <buildroot@lists.busybox.net>; Sat, 25 Dec 2021 10:53:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 74B4081431
 for <buildroot@lists.busybox.net>; Sat, 25 Dec 2021 10:53:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id krsGMkUaWNOn for <buildroot@lists.busybox.net>;
 Sat, 25 Dec 2021 10:53:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id A8D2881409
 for <buildroot@buildroot.org>; Sat, 25 Dec 2021 10:53:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 4F68182ACF; Sat, 25 Dec 2021 10:47:44 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sat, 25 Dec 2021 11:52:12 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fa360d506122f7083aca836696d72b0467656c30
X-Git-Newrev: d29d1368478df621c2426820e1a6019225467234
X-Patchwork-Hint: ignore
Message-Id: <20211225104744.4F68182ACF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ncmpc: bump to version 0.46
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

commit: https://git.buildroot.net/buildroot/commit/?id=d29d1368478df621c2426820e1a6019225467234
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- boost is not needed since
  https://github.com/MusicPlayerDaemon/ncmpc/commit/6eb958602091752c20e8dbb32041bedc637d24ee
- pcre has been replaced by pcre2 since
  https://github.com/MusicPlayerDaemon/ncmpc/commit/f2ea0d39a3d0ed20a958f7e7dd902de7ea2875b7

https://raw.githubusercontent.com/MusicPlayerDaemon/ncmpc/v0.46/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/ncmpc/Config.in  |  9 +++------
 package/ncmpc/ncmpc.hash |  2 +-
 package/ncmpc/ncmpc.mk   | 10 +++++-----
 3 files changed, 9 insertions(+), 12 deletions(-)

diff --git a/package/ncmpc/Config.in b/package/ncmpc/Config.in
index 0e062460a7..4155404fcf 100644
--- a/package/ncmpc/Config.in
+++ b/package/ncmpc/Config.in
@@ -2,11 +2,8 @@ config BR2_PACKAGE_NCMPC
 	bool "ncmpc"
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_USE_WCHAR # boost
-	depends on BR2_TOOLCHAIN_HAS_THREADS # boost
+	depends on BR2_USE_WCHAR
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # C++17
-	select BR2_PACKAGE_BOOST
-	select BR2_PACKAGE_BOOST_SYSTEM
 	select BR2_PACKAGE_LIBMPDCLIENT
 	select BR2_PACKAGE_NCURSES
 	help
@@ -16,7 +13,7 @@ config BR2_PACKAGE_NCMPC
 
 	  http://www.musicpd.org/clients/ncmpc/
 
-comment "ncmpc needs a toolchain w/ C++, wchar, threads, gcc >= 7"
+comment "ncmpc needs a toolchain w/ C++, wchar, gcc >= 7"
 	depends on BR2_USE_MMU
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
-		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_TOOLCHAIN_GCC_AT_LEAST_7
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_7
diff --git a/package/ncmpc/ncmpc.hash b/package/ncmpc/ncmpc.hash
index b8f79a70b5..a5d6698a61 100644
--- a/package/ncmpc/ncmpc.hash
+++ b/package/ncmpc/ncmpc.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-sha256  17ff446447e002f2ed4342b7324263a830df7d76bcf177dce928f7d3a6f1f785  ncmpc-0.45.tar.xz
+sha256  177f77cf09dd4ab914e8438be399cdd5d83c9aa992abc8d9abac006bb092934e  ncmpc-0.46.tar.xz
 
 # Hash for license file:
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/ncmpc/ncmpc.mk b/package/ncmpc/ncmpc.mk
index 9a394ba356..91859cbc24 100644
--- a/package/ncmpc/ncmpc.mk
+++ b/package/ncmpc/ncmpc.mk
@@ -5,11 +5,10 @@
 ################################################################################
 
 NCMPC_VERSION_MAJOR = 0
-NCMPC_VERSION = $(NCMPC_VERSION_MAJOR).45
+NCMPC_VERSION = $(NCMPC_VERSION_MAJOR).46
 NCMPC_SOURCE = ncmpc-$(NCMPC_VERSION).tar.xz
 NCMPC_SITE = http://www.musicpd.org/download/ncmpc/$(NCMPC_VERSION_MAJOR)
 NCMPC_DEPENDENCIES = \
-	boost \
 	host-pkgconf \
 	libmpdclient \
 	ncurses \
@@ -21,7 +20,8 @@ NCMPC_CPE_ID_VENDOR = ncmpc_project
 NCMPC_CONF_OPTS = \
 	-Dcurses=ncurses \
 	-Ddocumentation=disabled \
-	$(if $(BR2_SYSTEM_ENABLE_NLS),-Dnls=enabled,-Dnls=disabled)
+	$(if $(BR2_SYSTEM_ENABLE_NLS),-Dnls=enabled,-Dnls=disabled) \
+	$(if $(BR2_TOOLCHAIN_HAS_THREADS),-Dsignalfd=true,-Dsignalfd=false)
 
 ifeq ($(BR2_PACKAGE_LIRC_TOOLS),y)
 NCMPC_DEPENDENCIES += lirc-tools
@@ -30,8 +30,8 @@ else
 NCMPC_CONF_OPTS += -Dlirc=disabled
 endif
 
-ifeq ($(BR2_PACKAGE_PCRE),y)
-NCMPC_DEPENDENCIES += pcre
+ifeq ($(BR2_PACKAGE_PCRE2),y)
+NCMPC_DEPENDENCIES += pcre2
 NCMPC_CONF_OPTS += -Dregex=enabled
 else
 NCMPC_CONF_OPTS += -Dregex=disabled
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

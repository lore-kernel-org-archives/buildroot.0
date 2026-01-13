Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AA3AD30CC1
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 20:59:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 71C408229D;
	Tue, 13 Jan 2026 20:59:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dwGgZIqQEFNm; Tue, 13 Jan 2026 20:59:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 85F3B8233E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768337978;
	bh=IU1CTQnC1Arwsg+p2ijr3uHYY6okbir4owXJXHWrZbQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=bSMuVX/DvVh26ZnH8FI4oRt4Otk+lr9oym+D6/tmYiV8mEZk6Kk9CGjvQ5/uyB5FF
	 cElh1vadTwySQHLdjqRTE2/KhXaho/NwIJWsSpL/TMslqYB20Igl4Ig0cEa1UE9I3S
	 6HWUCr0lnB8/ob7E0Nm296NakWo8gUIeciMaMBwRim5q5S3BVpHak3EkeMtuUOlWDn
	 /GMft5asHENxQQePcJt0Gg3krj1zgPr3/eJj6WVw0Iw0P996DEyn5qwlQao9qUcSyY
	 6pcx90Cx0UkDpz+OEFdHu/7REDvVdxanMSqoL6+MCfnl0bo+i1o+xx0LwXIuH7De31
	 lTB32P8wdrnMQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 85F3B8233E;
	Tue, 13 Jan 2026 20:59:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id C98881CC
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:59:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C64B7407DB
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:58:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e9gXZDr1WGMy for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 20:58:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E9B8340790
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E9B8340790
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:58:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E8B5081382; Tue, 13 Jan 2026 20:58:46 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 13 Jan 2026 21:37:22 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 08ccc9f3bb27387c2273f0a389cb028be6a5a100
X-Git-Newrev: 293e47420884109c28401ed2b144ebd924198af9
X-Patchwork-Hint: ignore
Message-Id: <20260113205846.E8B5081382@busybox.osuosl.org>
Subject: [Buildroot] [git commit]
 package/x11r7/xdriver_xf86-input-synaptics: bump version to 1.10.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=293e47420884109c28401ed2b144ebd924198af9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://lists.x.org/archives/xorg-announce/2025-January/003578.html

Rebased patch 0001 due to upstream commit:
https://gitlab.freedesktop.org/xorg/driver/xf86-input-synaptics/-/commit/64407e809dd7a75516acd3178aa77db7dc04e19d

Switched _SITE to URL mentioned in latest release notes.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .../0001-build-get-rid-of-sdkdir.patch                            | 8 +++++---
 .../xdriver_xf86-input-synaptics.hash                             | 6 +++---
 .../xdriver_xf86-input-synaptics/xdriver_xf86-input-synaptics.mk  | 4 ++--
 3 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-input-synaptics/0001-build-get-rid-of-sdkdir.patch b/package/x11r7/xdriver_xf86-input-synaptics/0001-build-get-rid-of-sdkdir.patch
index 62950b0667..9e0eb29d04 100644
--- a/package/x11r7/xdriver_xf86-input-synaptics/0001-build-get-rid-of-sdkdir.patch
+++ b/package/x11r7/xdriver_xf86-input-synaptics/0001-build-get-rid-of-sdkdir.patch
@@ -11,6 +11,8 @@ appended in the target:
 Other drivers (e.g. keyboard) got rid of sdkdir. Do the same.
 
 Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+[Bernd: rebased for version 1.10.0]
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 ---
  Makefile.am          | 1 -
  configure.ac         | 9 ---------
@@ -34,9 +36,9 @@ diff --git a/configure.ac b/configure.ac
 index 970dd5f..574353b 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -55,11 +55,6 @@ XORG_DRIVER_CHECK_EXT(RANDR, randrproto)
+@@ -60,11 +60,6 @@ XORG_DRIVER_CHECK_EXT(RANDR, randrproto)
  # Obtain compiler/linker options for the Synaptics driver dependencies
- PKG_CHECK_MODULES(XORG, [inputproto >= 2.1.99.3] [xorg-server >= 1.12] xproto inputproto $REQUIRED_MODULES)
+ PKG_CHECK_MODULES(XORG, [inputproto >= 2.1.99.3] [xorg-server >= 1.18] xproto inputproto $REQUIRED_MODULES)
  
 -# X Server SDK location is required to install Synaptics header files
 -# This location is also relayed in the xorg-synaptics.pc file
@@ -46,7 +48,7 @@ index 970dd5f..574353b 100644
  # -----------------------------------------------------------------------------
  #			Configuration options
  # -----------------------------------------------------------------------------
-@@ -154,10 +149,6 @@ if test "x$have_libxtst" = "xyes" ; then
+@@ -159,10 +154,6 @@ if test "x$have_libxtst" = "xyes" ; then
  fi
  # -----------------------------------------------------------------------------
  
diff --git a/package/x11r7/xdriver_xf86-input-synaptics/xdriver_xf86-input-synaptics.hash b/package/x11r7/xdriver_xf86-input-synaptics/xdriver_xf86-input-synaptics.hash
index 97d55f2e2d..2cfb3d39ff 100644
--- a/package/x11r7/xdriver_xf86-input-synaptics/xdriver_xf86-input-synaptics.hash
+++ b/package/x11r7/xdriver_xf86-input-synaptics/xdriver_xf86-input-synaptics.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2022-July/003181.html
-sha256  b8fa4aab913fc63754bbd6439e020658c412743a055201ddf212760593962c38  xf86-input-synaptics-1.9.2.tar.xz
-sha512  6fd46505f22bba79f612fbd48dddd4818f7d874cc29caac71840744de27f1d224c68861e3a18d2a866b78178924d2f093f5260e27b221aa1fb17dbc09d66b649  xf86-input-synaptics-1.9.2.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2025-January/003578.html
+sha256  e0c26adb068edd0869f87a87f5e9127922d61c0265d7692a247a91a5cc1bb5c2  xf86-input-synaptics-1.10.0.tar.xz
+sha512  deb14ba039f423c4575825ecdeb74f31e30f044a4efc7dae9c1634f841dcf7066970cd470be7e63f68eccd4899e0434d602e59c297042cb2f38ff2a3a02d7e91  xf86-input-synaptics-1.10.0.tar.xz
 # Locally computed
 sha256  e14dc9a27158cadaeea8bcc2c70069762f05adb29030a444336bfde268751dc7  COPYING
diff --git a/package/x11r7/xdriver_xf86-input-synaptics/xdriver_xf86-input-synaptics.mk b/package/x11r7/xdriver_xf86-input-synaptics/xdriver_xf86-input-synaptics.mk
index 888f60b2fb..5a4e528b50 100644
--- a/package/x11r7/xdriver_xf86-input-synaptics/xdriver_xf86-input-synaptics.mk
+++ b/package/x11r7/xdriver_xf86-input-synaptics/xdriver_xf86-input-synaptics.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XDRIVER_XF86_INPUT_SYNAPTICS_VERSION = 1.9.2
+XDRIVER_XF86_INPUT_SYNAPTICS_VERSION = 1.10.0
 XDRIVER_XF86_INPUT_SYNAPTICS_SOURCE = xf86-input-synaptics-$(XDRIVER_XF86_INPUT_SYNAPTICS_VERSION).tar.xz
-XDRIVER_XF86_INPUT_SYNAPTICS_SITE = https://xorg.freedesktop.org/releases/individual/driver
+XDRIVER_XF86_INPUT_SYNAPTICS_SITE = https://xorg.freedesktop.org/archive/individual/driver
 XDRIVER_XF86_INPUT_SYNAPTICS_LICENSE = MIT
 XDRIVER_XF86_INPUT_SYNAPTICS_LICENSE_FILES = COPYING
 XDRIVER_XF86_INPUT_SYNAPTICS_DEPENDENCIES = libevdev xserver_xorg-server xorgproto mtdev
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

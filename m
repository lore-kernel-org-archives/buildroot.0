Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB3FFC3601E
	for <buildroot@archiver.kernel.org>; Thu, 10 Apr 2025 13:54:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 968A684737;
	Thu, 10 Apr 2025 13:54:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TQkHhMmdQR2w; Thu, 10 Apr 2025 13:54:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 94AB6820DA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 94AB6820DA;
	Thu, 10 Apr 2025 13:54:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id A3F74108
 for <buildroot@buildroot.org>; Thu, 10 Apr 2025 13:54:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9552561081
 for <buildroot@buildroot.org>; Thu, 10 Apr 2025 13:54:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3wlTWy3ZKHnV for <buildroot@buildroot.org>;
 Thu, 10 Apr 2025 13:54:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.18;
 helo=mout.gmx.net; envelope-from=ps.report@gmx.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 237656077E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 237656077E
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 237656077E
 for <buildroot@buildroot.org>; Thu, 10 Apr 2025 13:54:37 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost ([82.135.81.74]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MCKBc-1ttYyI3WqY-002Wtf; Thu, 10
 Apr 2025 15:54:32 +0200
Date: Thu, 10 Apr 2025 15:54:31 +0200
To: Quentin Schulz <foss+buildroot@0leil.net>
Cc: buildroot@buildroot.org, Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>, Marcus Folkesson
 <marcus.folkesson@gmail.com>, Quentin Schulz <quentin.schulz@cherry.de>
Message-ID: <20250410155431.2a343129@gmx.net>
In-Reply-To: <20250408-libcamera-qcam-v1-0-680c8a48dc17@cherry.de>
References: <20250408-libcamera-qcam-v1-0-680c8a48dc17@cherry.de>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.50; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Provags-ID: V03:K1:GkM9RvyuUkZvoIXwvPuIU4Hc+vTPNwZiHPR7TDpj5FmxK1q2l6X
 wi56ru3I+FWJfuDhC1nsTM4niG4uNBDqUIxf0XT03iaHS5caCXqomirDbSt2Voj9aNcA4M/
 1/xAheuWKMSt8ESQLhFJtXEXOkad6J7SQj4b5RclRG/YY5ZC0+uQgbede3fw+lGR+yeqzv4
 Abwlw8kFmLlNYuQsbjSYA==
UI-OutboundReport: notjunk:1;M01:P0:mgTLymiv5zc=;/iQzjTNCiRYdtaUGcQqjyDEpF+h
 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
 D35/KIcslhEQepmAiMm0wU=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.net; 
 s=s31663417; t=1744293273; x=1744898073; i=ps.report@gmx.net;
 bh=ZWYi1dIuB2tBBnnf0gFHPund1nwavrhsOacrlnbcjTU=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Type:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=Scyg47ZPGtupu/Z5LBfwTb9055hpBVj2cQK8U7ykhGLgBBu6DNnhEER1j2QDY3Qv
 Ai2H4O+DwRmgIy4cnAsygEznKq5QVKvXDDncUlIFARHhb3j3bNjpvvJV544UQcSN6
 V/dn3h0MBCgkQDSVyBqP7jmu946WP2nIlMTqUP7XZsJJ7iifJFhuRoVb7aGIy1Wt3
 Ve5RYOCFa0+CUNHEm5c4SBDI9kpRuqgUEYNmSsakGlDUWlmUcugPSAkKjC2zysvvd
 zwygmwYLS1yWdYrzHhp9T9CpAEfL7QS6OeK8ajXbH3vRjO4hS+1b8pQ5nkczYi1hj
 lZtbLF/zSWuv+H1fAw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.net header.i=ps.report@gmx.net header.a=rsa-sha256
 header.s=s31663417 header.b=Scyg47ZP
Subject: Re: [Buildroot] [PATCH RFC 0/2] add initial support for libcamera's
 qcam
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
From: Peter Seiderer via buildroot <buildroot@buildroot.org>
Reply-To: Peter Seiderer <ps.report@gmx.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Quentin,

On Tue, 08 Apr 2025 17:16:39 +0200, Quentin Schulz <foss+buildroot@0leil.net> wrote:

> This adds initial support for qcam example GUI from libcamera. It is
> based on Qt6 and uses openGL.
>
> Sadly, the qt module from meson is currently broken (see first patch in
> the series) and requires patching. Upstream isn't really happy with what
> I suggested but I haven't understood what they don't like about it so
> cannot currently suggest anything better, hence the RFC.

The following buildroot patch works for me (for the qcam case):

diff --git a/Makefile b/Makefile
index 5bf5abfe3b..8787a9065f 100644
--- a/Makefile
+++ b/Makefile
@@ -468,7 +468,7 @@ $(STAGING_DIR_SYMLINK): | $(BASE_DIR)
        ln -snf $(STAGING_DIR) $(STAGING_DIR_SYMLINK)

 # Quotes are needed for spaces and all in the original PATH content.
-BR_PATH = "$(HOST_DIR)/bin:$(HOST_DIR)/sbin:$(PATH)"
+BR_PATH = "$(HOST_DIR)/libexec:$(HOST_DIR)/bin:$(HOST_DIR)/sbin:$(PATH)"

 # Location of a file giving a big fat warning that output/target
 # should not be used as the root filesystem.


>
> While qcam currently renders the camera liveview, all characters of the
> GUI are squares. I have enabled fontconfig and UTF-8 locales but after
> building everything (though I dircleaned qt6base once), so not entirely
> sure what's missing or if it's PEBKAC, hence the RFC. Though that may be
> acceptable? Do not know. Would appreciate pointers on how to debug this
> (assumed) font issue.

Font rendering (and video output from a cheap USB cam) seems to work with
the following RPi4 defconfig (and additional 'dtoverlay=vc4-kms-v3d-pi4'):

BR2_arm=y
BR2_cortex_a72=y
BR2_ARM_FPU_NEON_VFPV4=y
BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
BR2_PACKAGE_GLIBC_UTILS=y
BR2_BINUTILS_VERSION_2_44_X=y
BR2_GCC_VERSION_14_X=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y
BR2_PACKAGE_HOST_GDB=y
BR2_GDB_VERSION_16=y
BR2_ENABLE_DEBUG=y
BR2_GLOBAL_PATCH_DIR="board/raspberrypi/patches"
BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
BR2_SYSTEM_DHCP="eth0"
BR2_GENERATE_LOCALE="C en_US"
BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypi4/post-build.sh"
BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypi4/post-image.sh"
BR2_LINUX_KERNEL=y
BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,576cc10e1ed50a9eacffc7a05c796051d7343ea4)/linux-576cc10e1ed50a9eacffc7a05c796051d7343ea4.tar.gz"
BR2_LINUX_KERNEL_DEFCONFIG="bcm2711"
BR2_LINUX_KERNEL_DTS_SUPPORT=y
BR2_LINUX_KERNEL_INTREE_DTS_NAME="broadcom/bcm2711-rpi-4-b broadcom/bcm2711-rpi-400 broadcom/bcm2711-rpi-cm4 broadcom/bcm2711-rpi-cm4s"
BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
BR2_PACKAGE_XZ=y
BR2_PACKAGE_STRACE=y
BR2_PACKAGE_DEJAVU=y
BR2_PACKAGE_MESA3D=y
BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_V3D=y
BR2_PACKAGE_MESA3D_OPENGL_ES=y
BR2_PACKAGE_QT6=y
BR2_PACKAGE_QT6BASE_GUI=y
BR2_PACKAGE_QT6BASE_EGLFS=y
BR2_PACKAGE_QT6BASE_DEFAULT_QPA="eglfs"
BR2_PACKAGE_QT6BASE_FONTCONFIG=y
BR2_PACKAGE_QT6BASE_HARFBUZZ=y
BR2_PACKAGE_QT6BASE_GIF=y
BR2_PACKAGE_QT6BASE_JPEG=y
BR2_PACKAGE_QT6BASE_PNG=y
BR2_PACKAGE_QT6BASE_WIDGETS=y
BR2_PACKAGE_QT6BASE_NETWORK=y
BR2_PACKAGE_RPI_FIRMWARE=y
BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI4=y
BR2_PACKAGE_RPI_FIRMWARE_CONFIG_FILE="board/raspberrypi4/config_4.txt"
BR2_PACKAGE_LIBEXIF=y
BR2_PACKAGE_TIFF=y
BR2_PACKAGE_LIBV4L=y
BR2_PACKAGE_LIBV4L_UTILS=y
BR2_PACKAGE_LIBXKBCOMMON=y
BR2_PACKAGE_LIBCAMERA=y
BR2_PACKAGE_OPENSSH=y
BR2_PACKAGE_BASH=y
BR2_PACKAGE_SUDO=y
BR2_PACKAGE_KMOD_TOOLS=y
BR2_TARGET_ROOTFS_EXT2=y
BR2_TARGET_ROOTFS_EXT2_4=y
BR2_TARGET_ROOTFS_EXT2_SIZE="256M"
# BR2_TARGET_ROOTFS_TAR is not set
BR2_PACKAGE_HOST_DOSFSTOOLS=y
BR2_PACKAGE_HOST_GENIMAGE=y
BR2_PACKAGE_HOST_KMOD_XZ=y
BR2_PACKAGE_HOST_MTOOLS=y

The UTF-8 locale warning vanishes if I start qcam with

	$ LANG=C.UTF-8 qcam

or

	$ LANG=en_US.UTF-8 qcam

Regards,
Peter

>
> I'm not planning on actively working on this as the only product we have
> that could use this is currently stuck on qt5 so cannot use new qcam and
> it would anyway only be for debug firmware releases. See this as a code
> dump essentially. If there are hints or limited work required to have
> this merged, I'll happily try to find time doing it but feel free to
> take over the series or disregard it entirely.
>
> This is based on top of
> https://lore.kernel.org/buildroot/20250404-libcamera-0-5-0-v1-0-e2ca9d029aeb@cherry.de/T/#t
>
> Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
> ---
> Quentin Schulz (2):
>       package/meson: look for qt6 tools on Buildroot host machine
>       package/libcamera: initial support for Qt6 qcam
>
>  package/libcamera/libcamera.mk                     |  5 ++
>  ...e-look-for-qt-tools-only-on-build-machine.patch | 56 ++++++++++++++++++++++
>  2 files changed, 61 insertions(+)
> ---
> base-commit: 43abcd4c7dd8ad65d2f2012f3d4292362550a3ed
> change-id: 20250404-libcamera-qcam-e8269c47e2f9
> prerequisite-change-id: 20250404-libcamera-0-5-0-b9ecf899ddb4:v1
> prerequisite-patch-id: 854e58d76fc57aa774ca0d315ecae56b67c00c8a
> prerequisite-patch-id: 4873ac99203f0d789d64aec048249d9ba6a15a82
> prerequisite-patch-id: c4d504c6563a911ba550be263063cfd7bf04bcbe
> prerequisite-patch-id: 4a74788db759d3b67650f1456ee4d64f9394f50a
> prerequisite-patch-id: 73a4b5a3204b1a901da74a3ffe1672055404dd2f
> prerequisite-patch-id: 90b567b9a37abb58747d965ea2e0fef41358844b
> prerequisite-patch-id: 946aac34b70f001c24fc6fe86caab759a4591359
> prerequisite-patch-id: cee428a4219c83704347f6f194694f21093034da
> prerequisite-patch-id: 6bbbdc80dc639a1b2918d79ae101e1030f3312bd
>
> Best regards,

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

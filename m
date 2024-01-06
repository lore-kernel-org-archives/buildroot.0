Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7D75C46CD2
	for <buildroot@archiver.kernel.org>; Sat,  6 Jan 2024 23:01:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8CB1960B3B;
	Sat,  6 Jan 2024 23:01:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8CB1960B3B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fFVf2v2XmRaW; Sat,  6 Jan 2024 23:01:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AE0A460AE5;
	Sat,  6 Jan 2024 23:01:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AE0A460AE5
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1A0321BF384
 for <buildroot@lists.busybox.net>; Sat,  6 Jan 2024 23:01:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E67A560AE5
 for <buildroot@lists.busybox.net>; Sat,  6 Jan 2024 23:01:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E67A560AE5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OoPGy_QqulzL for <buildroot@lists.busybox.net>;
 Sat,  6 Jan 2024 23:01:37 +0000 (UTC)
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com
 [IPv6:2607:f8b0:4864:20::22e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 93E1E6079E
 for <buildroot@buildroot.org>; Sat,  6 Jan 2024 23:01:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 93E1E6079E
Received: by mail-oi1-x22e.google.com with SMTP id
 5614622812f47-3bbc755167fso849498b6e.0
 for <buildroot@buildroot.org>; Sat, 06 Jan 2024 15:01:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704582096; x=1705186896;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gd6DHh6Xl7X9XRvA8JB2RiIjCEq72pNkoDXzY+cYHD0=;
 b=Y2nxDMSTwTw/JAE0vy3MR59AsU56lVQ10EXn2N/xfHOdlvWI9ggWdcR7Zd2X8k44V/
 eo/YUZ2CNaFmqoBBoLNo5pEx5SS7LjzABrRdXmFcx/CviQH8XMvp03HIpYnuOltZ7GP6
 HLL3rQ44LK8DcFNtFr8lR2YGs4GyGeJUFTLkMzI/nviNPQgE2xoOJsQIvWUJ700CG9jn
 p787ePFBCk+MEWR5/Iubiee3kfrcS7fr/iWPL4QopfOJueQD+IyQAIivBPbSpV4n8/cB
 k9DXWP04Dg9zW/u5aIL3vZQ02WM+MvuMTXlt3JjsCzQPSjBzRNSxisfHsupl3MJEKadK
 MzZw==
X-Gm-Message-State: AOJu0YylkM3318HdVtdsuav3D98jFNskpkkWyKFB/Hpo9lBfAkjQ43zr
 vRap8kdRuvCCTcYYHJ4x1UgIolWpKlhMAQSEHZvUytlN3z0=
X-Google-Smtp-Source: AGHT+IH/TSNgvwgwQY/YYwgCBBK6R+pYjVEkPRiEA9EukYHm92w0Q/kTb6k+ravaKTiuONX8k78ijQ==
X-Received: by 2002:a05:6808:3a14:b0:3bb:cddf:4258 with SMTP id
 gr20-20020a0568083a1400b003bbcddf4258mr2587950oib.62.1704582095696; 
 Sat, 06 Jan 2024 15:01:35 -0800 (PST)
Received: from desktop-oi0kn2b.lan (75-174-33-82.boid.qwest.net.
 [75.174.33.82]) by smtp.gmail.com with ESMTPSA id
 u22-20020aa78396000000b006d974fe1b0esm3501540pfm.7.2024.01.06.15.01.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Jan 2024 15:01:35 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sat,  6 Jan 2024 16:01:31 -0700
Message-ID: <20240106230132.423302-1-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1704582096; x=1705186896;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=gd6DHh6Xl7X9XRvA8JB2RiIjCEq72pNkoDXzY+cYHD0=;
 b=qVKOzcn+hZ5wJpeeIPySLZMRth8EYfQRFWEukwwrZuKKEeMMlqDcl3CCPwMbLBPURz
 HyPWeU2Z1gsOrJZ93oLtlt3esAMuHea8AyAWKewUwDplZOPpaauAsxra5J3cQEYfXSNX
 CIj4RMIzqWyodsEAJVqTpExZ8X3UYNDeXaFfQ=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=qVKOzcn+
Subject: [Buildroot] [PATCH v6] ivi-homescreen: new package
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
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Much like flutter-pi, this package is a Flutter embedder used to run Flutter
applications. However, unlike Flutter-pi, this package requires a Wayland
compositor to run, which flutter-pi does not support. Furthermore, flutter-pi
lacks several plugins and features that ivi-homescreen supports, such as:
  - Dart VM console redirection
  - DLT logging
  - Accessibility
  - Compositor region
  - Compositor surface
  - Desktop Window
  - Go Router
  - Isolate
  - Keyboard Manager
  - Layer Playground
  - Mouse Cursor
  - PackageInfo
  - Platform
  - Platform Views
  - Restoration

The following plugins and options are hardcoded to off:
  - Crash handler: Requires a newer version of sentry-native.
  - File selector: Requires the zenity package.
  - Firebase-core: Requires the firebase-cpp-sdk package.
  - URL Launcher: Requires a runtime-dependency on xdg-open.
  - BUILD_TEXTURE_NAVI_RENDER_EGL: Failes to build.
  - BUILD_TEXTURE_TEST_EGL: Fails to build.
  - ENABLE_AGL_CLIENT: Used for Automitve Grade Linux (AGL).

The ENABLE_XDG_CLIENT=ON option is a requirement to run Flutter apps.
If this option is disabled, ivi-homescreen segfaults when starting an
application.

Finally, there is a need for a patch that fixes the audio-players plugin:
If the audio-players plugin is the only plugin selected, several compilation
errors occure because of undeclared definitions, as the standard_method_codec.h
header file is missing.

Upstream-status: https://github.com/toyota-connected/ivi-homescreen/pull/133

This package has been tested on a x86_64 host with an AMD Ryzen 9 6900HS
with Docker 24.0.5:
  - The following distributions:
    - Fedora 39: Host system
    - Ubuntu 22.04: Docker
    - Debian 11: Docker

  - The following targets:
    - BR2_aarch64
    - BR2_arm
    - BR2_x86_64

With the following defconfig:
```
BR2_x86_64=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_GLIBC_STABLE=y
BR2_CCACHE=y
BR2_INIT_SYSTEMD=y
BR2_TARGET_GENERIC_GETTY_PORT="tty1"
BR2_SYSTEM_DEFAULT_PATH="/bin:/sbin:/usr/bin:/usr/sbin"
BR2_GENERATE_LOCALE="en_US.UTF-8"
BR2_ROOTFS_POST_BUILD_SCRIPT="board/pc/post-build.sh"
BR2_ROOTFS_POST_IMAGE_SCRIPT="board/pc/post-image-efi.sh"
BR2_LINUX_KERNEL=y
BR2_LINUX_KERNEL_CUSTOM_VERSION=y
BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.24"
BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/pc/linux.config"
BR2_LINUX_KERNEL_INSTALL_TARGET=y
BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
BR2_LINUX_KERNEL_NEEDS_HOST_LIBELF=y
BR2_PACKAGE_FOOT=y
BR2_PACKAGE_IVI_HOMESCREEN=y
BR2_PACKAGE_IVI_HOMESCREEN_DART_VM_LOGGING=y
BR2_PACKAGE_IVI_HOMESCREEN_DLT=y
BR2_PACKAGE_IVI_HOMESCREEN_XDG_CLIENT=y
BR2_PACKAGE_IVI_HOMESCREEN_AGL_CLIENT=y
BR2_PACKAGE_IVI_HOMESCREEN_IVI_SHELL=y
BR2_PACKAGE_IVI_HOMESCREEN_EGL_TRANSPARENCY=y
BR2_PACKAGE_IVI_HOMESCREEN_EGL_ENABLE_3D=y
BR2_PACKAGE_IVI_HOMESCREEN_EGL_MULTISAMPLE=y
BR2_PACKAGE_IVI_HOMESCREEN_ACCESSIBILITY_PLUGIN=y
BR2_PACKAGE_IVI_HOMESCREEN_COMP_REGION_PLUGIN=y
BR2_PACKAGE_IVI_HOMESCREEN_COMP_SURF_PLUGIN=y
BR2_PACKAGE_IVI_HOMESCREEN_DESKTOP_WINDOW_PLUGIN=y
BR2_PACKAGE_IVI_HOMESCREEN_GO_ROUTER_PLUGIN=y
BR2_PACKAGE_IVI_HOMESCREEN_INTEGRATION_TEST_PLUGIN=y
BR2_PACKAGE_IVI_HOMESCREEN_ISOLATE_PLUGIN=y
BR2_PACKAGE_IVI_HOMESCREEN_KEYBOARD_MANAGER_PLUGIN=y
BR2_PACKAGE_IVI_HOMESCREEN_KEY_EVENT_PLUGIN=y
BR2_PACKAGE_IVI_HOMESCREEN_LAYER_PLAYGROUND_PLUGIN=y
BR2_PACKAGE_IVI_HOMESCREEN_LOGGING_PLUGIN=y
BR2_PACKAGE_IVI_HOMESCREEN_MOUSE_CURSOR_PLUGIN=y
BR2_PACKAGE_IVI_HOMESCREEN_PACKAGE_INFO_PLUGIN=y
BR2_PACKAGE_IVI_HOMESCREEN_PLATFORM_PLUGIN=y
BR2_PACKAGE_IVI_HOMESCREEN_PLATFORM_VIEWS_PLUGIN=y
BR2_PACKAGE_IVI_HOMESCREEN_RESTORATION_PLUGIN=y
BR2_PACKAGE_IVI_HOMESCREEN_TEXT_INPUT_PLUGIN=y
BR2_PACKAGE_IVI_HOMESCREEN_URL_LAUNCHER_PLUGIN=y
BR2_PACKAGE_IVI_HOMESCREEN_AUDIO_PLAYERS=y
BR2_PACKAGE_IVI_HOMESCREEN_FLUTTER_SECURE_STORAGE_PLUGIN=y
BR2_PACKAGE_IVI_HOMESCREEN_GOOGLE_SIGN_IN_PLUGIN=y
BR2_PACKAGE_IVI_HOMESCREEN_GSTREAMER_EGL_PLUGIN=y
BR2_PACKAGE_IVI_HOMESCREEN_OPENGL_TEXTURE_PLUGIN=y
BR2_PACKAGE_SWAY=y
BR2_PACKAGE_SWAY_SWAYBAR=y
BR2_PACKAGE_SWAY_SWAYBAR_TRAY=y
BR2_PACKAGE_SWAY_SWAYNAG=y
BR2_PACKAGE_FLUTTER_GALLERY=y
BR2_PACKAGE_MESA3D=y
BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_VIRGL=y
BR2_PACKAGE_MESA3D_OSMESA_GALLIUM=y
BR2_PACKAGE_MESA3D_OPENGL_ES=y
BR2_PACKAGE_ACPID=y
BR2_PACKAGE_FLUTTER_ENGINE=y
BR2_PACKAGE_CONNMAN=y
BR2_PACKAGE_CONNMAN_WIFI=y
BR2_PACKAGE_CONNMAN_CLIENT=y
BR2_TARGET_ROOTFS_EXT2=y
BR2_TARGET_ROOTFS_EXT2_4=y
BR2_TARGET_ROOTFS_EXT2_SIZE="512M"
BR2_TARGET_GRUB2=y
BR2_TARGET_GRUB2_X86_64_EFI=y
BR2_PACKAGE_HOST_DOSFSTOOLS=y
BR2_PACKAGE_HOST_GENIMAGE=y
BR2_PACKAGE_HOST_MTOOLS=y
```

The image is then booted using qemu with the following
command:
```
LIBGL_DRIVERS_PATH=/usr/lib64/dri \
FONTCONFIG_PATH=/etc/fonts \
qemu-system-x86_64 \
  -enable-kvm \
  -M pc \
  -cpu host \
  -m 1024M \
  -bios /usr/share/OVMF/OVMF_CODE.fd \
  -drive file=output/images/disk.img,if=virtio,format=raw \
  -net nic,model=virtio \
  -net user \
  -device virtio-vga-gl \
  -display gtk,gl=es,show-cursor=on \
  -usb \
  -device usb-ehci,id=ehci \
  -device usb-tablet,bus=usb-bus.0
```

After logging in, type:
 - mkdir -p /tmp/sway && export XDG_RUNTIME_DIR=/tmp/sway && sway
 - bring up a terminal with `windows key + return`
 - Type `homescreen --b=/usr/share/flutter/gallery/release/`


Changelog:
- Removed how I tested the package in the commit log [Yann]
- Added the explicity dependency list of flutter and flutter-engine [Yann]
- Removed XDG, and AGL clients as options.
- Enabled XDG client by default.
- Added 0001-add-missing-headers-to-the-audio-players-plugin.patch
- Select BR2_PACKAGE_LIBCURL_FORCE_TLS and BR2_PACKAGE_OPENSSL if the
  BR2_PACKAGE_IVI_HOMESCREEN_GOOGLE_SIGN_IN_PLUGIN is selected. [Yann]
- Added dependencies of libegl, mesa3d, and libdrm if those backends are
  enabled. [Yann]
- Cleaned up licensing. [Yann]
- Cleaned up and reduced the amount of ifeq else endif blocks [Yann]
- Disabled the URL Launcher plugin.
- Added help menus to as many plugins as I could.
- Removed BR2_PACKAGE_IVI_HOMESCREEN_EGL_TEXTURE [Yann]

Adam Duskett (1):
  package/ivi-homescreen: new package

 DEVELOPERS                                    |   1 +
 package/Config.in                             |   1 +
 ...-headers-to-the-audio-players-plugin.patch |  82 ++++++
 package/ivi-homescreen/Config.in              | 268 ++++++++++++++++++
 package/ivi-homescreen/ivi-homescreen.hash    |  21 ++
 package/ivi-homescreen/ivi-homescreen.mk      | 135 +++++++++
 6 files changed, 508 insertions(+)
 create mode 100644 package/ivi-homescreen/0001-add-missing-headers-to-the-audio-players-plugin.patch
 create mode 100644 package/ivi-homescreen/Config.in
 create mode 100644 package/ivi-homescreen/ivi-homescreen.hash
 create mode 100644 package/ivi-homescreen/ivi-homescreen.mk

-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

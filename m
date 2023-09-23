Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94F6DCE7A88
	for <buildroot@archiver.kernel.org>; Sat, 23 Sep 2023 08:35:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2D9AF81E5C;
	Sat, 23 Sep 2023 08:35:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2D9AF81E5C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KTKe3SzNZ2qh; Sat, 23 Sep 2023 08:35:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 239BC81EFD;
	Sat, 23 Sep 2023 08:35:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 239BC81EFD
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 188AF1BF83C
 for <buildroot@lists.busybox.net>; Sat, 23 Sep 2023 08:35:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E571840446
 for <buildroot@lists.busybox.net>; Sat, 23 Sep 2023 08:35:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E571840446
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id j4Pf3RnA9eNj for <buildroot@lists.busybox.net>;
 Sat, 23 Sep 2023 08:35:11 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E61DA40220
 for <buildroot@buildroot.org>; Sat, 23 Sep 2023 08:35:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E61DA40220
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:94e1:f2dc:4d87:6249])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id B57DE13F880;
 Sat, 23 Sep 2023 10:35:00 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 23 Sep 2023 10:35:00 +0200
Date: Sat, 23 Sep 2023 10:35:00 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Adam Duskett <adam.duskett@amarulasolutions.com>
Message-ID: <20230923083500.GA1469982@scaer>
References: <20230919204252.2272594-1-adam.duskett@amarulasolutions.com>
 <20230919204252.2272594-7-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230919204252.2272594-7-adam.duskett@amarulasolutions.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1695458108;
 bh=M6oq7ZmHRHSYtKB2y8Xt36pd7JvU073lD9e60Za852E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Ypz8yi4nhSU1q7QFpf6Vayux210sCP/vr4NECygGsJ9abQjj3vrBY6Dxo8a1ebTtS
 sIhGDgjvfR5ulLd1xPt+W1NumiDji8IGXPAYR7cfLbidwM8v6Xv8DYAar5I0JD/lxq
 Wva8Bnhxq5c32smpYtAxNMkH5m0TrLUs4nLJ/IUlEXzbnNOOrqHm+GHo6hiQTNs8XM
 gJGqNw1Qkw2WrMVIAp5Od1mIfnJhLhL2MB12WIFLryx8c6SsSrU/skWRI3cxGSDLo6
 F4sucB1UgO5woWNYG8zqt49AvxdbgwqVJ0nRBPH504poXSEzvJqs8QBrt4z9LR8AlR
 +lClfo/RN1DOg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Ypz8yi4n
Subject: Re: [Buildroot] [PATCH v9 7/7]
 support/testing/tests/package/test_flutter.py: new runtime test
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
Cc: Asaf Kahlon <asafka7@gmail.com>, Julien Olivain <ju.o@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org,
 Michael Trimarchi <michael@amarulasolutions.com>,
 Angelo Compagnucci <angelo@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Adam, All,

+Julien for his expertise in graphics in runtime tests

On 2023-09-19 14:42 -0600, Adam Duskett spake thusly:
> This is a simple test that builds and runs the futter-gallery application and
> checks if the service is active.

This runtime test does not demonstrate a worlking flutter stack, because
the application in fact does not work:

    $ journalctl -u flutter-gallery
    [...]
    journalctl -u flutter-gallery --boot |cat
    Sep 23 08:18:24 buildroot systemd[1]: Started flutter-gallery daemon.
    Sep 23 08:18:24 buildroot flutter-pi[129]: [locales] Warning: The system has no configured locale. The default "C" locale may or may not be supported by the app.
    Sep 23 08:18:24 buildroot flutter-pi[129]: MESA-LOADER: failed to open vkms: /usr/lib/dri/vkms_dri.so: cannot open shared object file: No such file or directory (search paths /usr/lib/dri, suffix _dri)
    Sep 23 08:18:24 buildroot flutter-pi[129]: MESA-LOADER: failed to open zink: /usr/lib/dri/zink_dri.so: cannot open shared object file: No such file or directory (search paths /usr/lib/dri, suffix _dri)
    Sep 23 08:18:28 buildroot flutter-pi[129]: xkbcommon: ERROR: failed to add default include path /usr/share/X11/xkb
    Sep 23 08:18:28 buildroot flutter-pi[129]: keyboard.c: Could not create XKB context.
    Sep 23 08:18:28 buildroot flutter-pi[129]: user_input.c: Could not initialize keyboard configuration. Flutter-pi will run without text/raw keyboard input.
    Sep 23 08:18:28 buildroot flutter-pi[129]: egl_gbm_render_surface.c: Couldn't create GBM surface for rendering.  gbm_surface_create_with_modifiers: Invalid argument
    Sep 23 08:18:28 buildroot flutter-pi[129]: window.c: Couldn't create EGL GBM rendering surface.
    Sep 23 08:18:28 buildroot systemd[1]: flutter-gallery.service: Main process exited, code=dumped, status=11/SEGV
    Sep 23 08:18:28 buildroot systemd[1]: flutter-gallery.service: Failed with result 'core-dump'.
    Sep 23 08:18:28 buildroot systemd[1]: flutter-gallery.service: Consumed 4.144s CPU time.
    Sep 23 08:18:29 buildroot systemd[1]: flutter-gallery.service: Scheduled restart job, restart counter is at 1.
    Sep 23 08:18:29 buildroot systemd[1]: Started flutter-gallery daemon.
    Sep 23 08:18:29 buildroot flutter-pi[148]: [locales] Warning: The system has no configured locale. The default "C" locale may or may not be supported by the app.
    Sep 23 08:18:29 buildroot flutter-pi[148]: MESA-LOADER: failed to open vkms: /usr/lib/dri/vkms_dri.so: cannot open shared object file: No such file or directory (search paths /usr/lib/dri, suffix _dri)
    Sep 23 08:18:29 buildroot flutter-pi[148]: MESA-LOADER: failed to open zink: /usr/lib/dri/zink_dri.so: cannot open shared object file: No such file or directory (search paths /usr/lib/dri, suffix _dri)
    Sep 23 08:18:31 buildroot flutter-pi[148]: xkbcommon: ERROR: failed to add default include path /usr/share/X11/xkb
    Sep 23 08:18:31 buildroot flutter-pi[148]: keyboard.c: Could not create XKB context.
    Sep 23 08:18:31 buildroot flutter-pi[148]: user_input.c: Could not initialize keyboard configuration. Flutter-pi will run without text/raw keyboard input.
    Sep 23 08:18:31 buildroot flutter-pi[148]: egl_gbm_render_surface.c: Couldn't create GBM surface for rendering.  gbm_surface_create_with_modifiers: Invalid argument
    Sep 23 08:18:31 buildroot flutter-pi[148]: window.c: Couldn't create EGL GBM rendering surface.
    Sep 23 08:18:31 buildroot systemd[1]: flutter-gallery.service: Main process exited, code=dumped, status=11/SEGV
    Sep 23 08:18:31 buildroot systemd[1]: flutter-gallery.service: Failed with result 'core-dump'.
    Sep 23 08:18:31 buildroot systemd[1]: flutter-gallery.service: Consumed 2.401s CPU time.
    Sep 23 08:18:31 buildroot systemd[1]: flutter-gallery.service: Scheduled restart job, restart counter is at 2.
    [...ad nauseam......]

So, a few things about this:

  - "-vga std -vnc none" are not needed; whether specified or not has
    no impact on the test. And indeed, this is now n aarch64 machine,
    so not sure there's vga on that;

  - the locales issues is not major, we don't care much for a test; the
    keybioard issue should not be major either ("Flutter-pi will run
    without text/raw keyboard input");

  - the real issues I'm most afraid of, are the one about mesa failing
    to load the proper drivers, and/or that it can't create an EGL GBM
    surface; I think this is the real problem;

  - in the console, I notice "vkms_vblank_simulate: vblank timer
    overrun" bwing displayed quite a few times;

  - you're pointing the gallery app to /usr/share/flutter/gallery/release/
    but therat does not exist (what should it contain, btw?).

Can you look at that test, please?

Regards,
Yann E. MORIN.

> Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
> ---
> v8 -> v9:
>   - Changed to aarch64 to avoid problems with older versions of qemu.
>   - Added BR2_LINUX_KERNEL_NEEDS_HOST_LIBELF
> 
>  DEVELOPERS                                    |  1 +
>  support/testing/tests/package/test_flutter.py | 56 +++++++++++++++++++
>  .../package/test_flutter/linux-vkms.fragment  |  2 +
>  .../flutter-gallery.service                   |  1 +
>  .../systemd/system/flutter-gallery.service    | 11 ++++
>  5 files changed, 71 insertions(+)
>  create mode 100644 support/testing/tests/package/test_flutter.py
>  create mode 100644 support/testing/tests/package/test_flutter/linux-vkms.fragment
>  create mode 120000 support/testing/tests/package/test_flutter/overlay/etc/systemd/system/multi-user.target.wants/flutter-gallery.service
>  create mode 100644 support/testing/tests/package/test_flutter/overlay/usr/lib/systemd/system/flutter-gallery.service
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 48a4ec776a..f46d83679a 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -37,6 +37,7 @@ F:	package/flutter-engine/
>  F:	package/flutter-gallery/
>  F:	package/flutter-pi/
>  F:	package/flutter-sdk-bin/
> +F:	support/testing/tests/package/test_flutter.py
>  
>  N:	Adam Heinrich <adam@adamh.cz>
>  F:	package/jack1/
> diff --git a/support/testing/tests/package/test_flutter.py b/support/testing/tests/package/test_flutter.py
> new file mode 100644
> index 0000000000..e17ed9f659
> --- /dev/null
> +++ b/support/testing/tests/package/test_flutter.py
> @@ -0,0 +1,56 @@
> +import os
> +import time
> +import infra.basetest
> +
> +
> +class TestFlutter(infra.basetest.BRTest):
> +    config = f"""
> +        BR2_aarch64=y
> +        BR2_TOOLCHAIN_EXTERNAL=y
> +        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
> +        BR2_ROOTFS_OVERLAY="{infra.filepath("tests/package/test_flutter/overlay")}"
> +        BR2_PER_PACKAGE_DIRECTORIES=y
> +        BR2_INIT_SYSTEMD=y
> +        BR2_LINUX_KERNEL=y
> +        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> +        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.54"
> +        BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
> +        BR2_LINUX_KERNEL_NEEDS_HOST_LIBELF=y
> +        BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux.config"
> +        BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="{infra.filepath("tests/package/test_flutter/linux-vkms.fragment")}"
> +        BR2_PACKAGE_LIBDRM=y
> +        BR2_PACKAGE_MESA3D=y
> +        BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SWRAST=y
> +        BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_VIRGL=y
> +        BR2_PACKAGE_MESA3D_OPENGL_ES=y
> +        BR2_PACKAGE_FLUTTER_PI=y
> +        BR2_PACKAGE_FLUTTER_PI_RAW_KEYBOARD_PLUGIN=y
> +        BR2_PACKAGE_FLUTTER_PI_TEXT_INPUT_PLUGIN=y
> +        BR2_PACKAGE_FLUTTER_GALLERY=y
> +        BR2_PACKAGE_FLUTTER_ENGINE=y
> +        BR2_TARGET_ROOTFS_EXT2=y
> +        BR2_TARGET_ROOTFS_EXT2_4=y
> +        BR2_TARGET_ROOTFS_EXT2_SIZE="512M"
> +        # BR2_TARGET_ROOTFS_TAR is not set
> +        """
> +
> +    def test_run(self):
> +        timeout = 35 * self.emulator.timeout_multiplier
> +        img = os.path.join(self.builddir, "images", "rootfs.ext2")
> +        kern = os.path.join(self.builddir, "images", "Image")
> +        self.emulator.boot(
> +            arch="aarch64",
> +            kernel=kern,
> +            kernel_cmdline=["root=/dev/vda console=ttyAMA0"],
> +            options=["-M", "virt",
> +                     "-cpu", "cortex-a57",
> +                     "-m", "512M",
> +                     "-smp", "4",
> +                     "-vga", "std",
> +                     "-vnc", "none",
> +                     "-drive", f"file={img},if=virtio,format=raw"])
> +        self.emulator.login()
> +        cmd = "systemctl is-active flutter-gallery"
> +        output, exit_code = self.emulator.run(cmd, 10)
> +        self.assertEqual(exit_code, 0)
> +        self.assertEqual(output[0], "active")
> diff --git a/support/testing/tests/package/test_flutter/linux-vkms.fragment b/support/testing/tests/package/test_flutter/linux-vkms.fragment
> new file mode 100644
> index 0000000000..3fc7a5dded
> --- /dev/null
> +++ b/support/testing/tests/package/test_flutter/linux-vkms.fragment
> @@ -0,0 +1,2 @@
> +CONFIG_DEBUG_FS=y
> +CONFIG_DRM_VKMS=y
> diff --git a/support/testing/tests/package/test_flutter/overlay/etc/systemd/system/multi-user.target.wants/flutter-gallery.service b/support/testing/tests/package/test_flutter/overlay/etc/systemd/system/multi-user.target.wants/flutter-gallery.service
> new file mode 120000
> index 0000000000..40993fb16c
> --- /dev/null
> +++ b/support/testing/tests/package/test_flutter/overlay/etc/systemd/system/multi-user.target.wants/flutter-gallery.service
> @@ -0,0 +1 @@
> +../../../../usr/lib/systemd/system/flutter-gallery.service
> \ No newline at end of file
> diff --git a/support/testing/tests/package/test_flutter/overlay/usr/lib/systemd/system/flutter-gallery.service b/support/testing/tests/package/test_flutter/overlay/usr/lib/systemd/system/flutter-gallery.service
> new file mode 100644
> index 0000000000..88a2bcbf0b
> --- /dev/null
> +++ b/support/testing/tests/package/test_flutter/overlay/usr/lib/systemd/system/flutter-gallery.service
> @@ -0,0 +1,11 @@
> +[Unit]
> +Description=flutter-gallery daemon
> +After=dbus.service systemd-udevd.service
> +
> +[Service]
> +ExecStart=/usr/bin/flutter-pi --release /usr/share/flutter/gallery/release/
> +Restart=always
> +KillMode=process
> +
> +[Install]
> +WantedBy=multi-user.target
> -- 
> 2.39.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

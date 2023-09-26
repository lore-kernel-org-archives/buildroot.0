Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DC97E7E65E
	for <buildroot@archiver.kernel.org>; Tue, 26 Sep 2023 19:23:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2B69C60C05;
	Tue, 26 Sep 2023 19:23:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2B69C60C05
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zu6XXLE2PNs3; Tue, 26 Sep 2023 19:23:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E558F61059;
	Tue, 26 Sep 2023 19:23:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E558F61059
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E5E6B1BF2A6
 for <buildroot@lists.busybox.net>; Tue, 26 Sep 2023 19:23:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BEDA161059
 for <buildroot@lists.busybox.net>; Tue, 26 Sep 2023 19:23:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BEDA161059
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ed54ahTersNK for <buildroot@lists.busybox.net>;
 Tue, 26 Sep 2023 19:23:47 +0000 (UTC)
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 62EFF60C05
 for <buildroot@buildroot.org>; Tue, 26 Sep 2023 19:23:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 62EFF60C05
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:fa2:d20d:4ebf:d634])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id DBE862003DE;
 Tue, 26 Sep 2023 21:23:36 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 26 Sep 2023 21:23:36 +0200
Date: Tue, 26 Sep 2023 21:23:36 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Adam Duskett <adam.duskett@amarulasolutions.com>
Message-ID: <20230926192336.GT1469982@scaer>
References: <20230919204252.2272594-1-adam.duskett@amarulasolutions.com>
 <20230919204252.2272594-7-adam.duskett@amarulasolutions.com>
 <20230923083500.GA1469982@scaer>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230923083500.GA1469982@scaer>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1695756224;
 bh=0Q85CyH1OC+NONbsgswbDMf5e+UU+KBL5oyhVM/LnMY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=T+8PMAsuWKfVIPiR6sKxAs5mkqPRQOSPFibDOp87DumEhz/vtKGAhuC4Z7hOIyf5t
 mPfwo7odRHZGs/lCJEQ/4XNoxvAAh2q77HCPB7vrOCuCNBwooI1QrOJQJcY0h7jXQj
 1IQRYmprbo4+cZI3xIu3mvEyMIAAtuQrensdlEZxERFP5MOE6QdKOWIuZoFgukJ8Wx
 qrvbowsSHP9wbybp+kF8UwX1FhX8VCE9qfkTxFyd1tAj0zSriGwOjh1K2xNmftGXWt
 AYwsj+d1X8ctVzrIf67H8MBPOJKoxuO2yi6My7mFKij3YQ8uOfCJGQL6I+5lL4Hfth
 /n+iqZZfibEQQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=T+8PMAsu
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

On 2023-09-23 10:35 +0200, Yann E. MORIN spake thusly:
> On 2023-09-19 14:42 -0600, Adam Duskett spake thusly:
> > This is a simple test that builds and runs the futter-gallery application and
> > checks if the service is active.
> This runtime test does not demonstrate a worlking flutter stack, because
> the application in fact does not work:

Note: as discussed on IRC: the above was a bit rough, sorry.

I understand that you did manage to get a flutter stack working, and
this *is* impressive!

What I meant is that this runtime test does not demonstrate that,
unfortunately.

The CI/CD pipelines are running in containers that do not have access to
a GPU. Hence a runtime test that uses GPU passthrough as you initially
provided is not going to work. That is why I have been insistent on
doing a headless runtime test.

We do already have working runtime tests for graphical packages, like
the weston test. What those tests do, is run the graphical application
to test, and check that the framebuffer changes (by comparing the CRC
provided by the kernel, as we don't care about what is rendered, just
that "something" is rendered). This is what I would have expected for
the flutter test too.

[--SNIP--]
> So, a few things about this:
>   - the real issues I'm most afraid of, are the one about mesa failing
>     to load the proper drivers,

So I had a deeper look, and ran the weston test by hand (I had to fix it
while at it [0]), and noticed that weston whines about the exact same
drivers, yet works. So the issue about missing zynq and vkms is benign.

>     [snip] and/or that it can't create an EGL GBM
>     surface; I think this is the real problem;

So, the remaining issue is that flutter-pi can't t create a GBM surface.
This is very very similar to an old upstream issue, which got fixed a
year ago:

    https://github.com/ardera/flutter-pi/issues/269
    https://github.com/ardera/flutter-pi/pull/270

However, upstream did a big overhaul of the code recently, and the fix
got lost in the rewrite. Here's what I now came up with (patch against
flutter-pi):

    From 856f9849763535d62ed01b538ba23905875c93f4 Mon Sep 17 00:00:00 2001
    From: "Yann E. MORIN" <yann.morin.1998@free.fr>
    Date: Tue, 26 Sep 2023 20:31:17 +0200
    Subject: [PATCH] src/egl_gbm_render_surface: properly fallback to surface with
     no modifier

    In 869fa7fcfbeb, we added a fallback to be able to create an EGL sruface
    when the driver do not support modifiers, like the llvmpipe software
    renderer (or like some proprietary drivers, like the MALI ones), as
    reported in #269 [0].

    However, in c6537673c9b6, there was a big overhaul of renderer
    infrastructure. That commit lost the with-modifiers code path and only
    kept the without-modifiers fallback one (i.e. it only kept the call to
    gbm_surface_create(), not to gbm_surface_create_with_modifiers()).

    Then in b0d09f5032a4, the with-modifiers code path was re-instated, but
    in a way that made it exclusive with the without-modifiers one. That is,
    the without-modifiers code path was not a fallback to when the other
    failed.

    Re-instate the fallback mechanism as initially implemented.

    [0] https://github.com/ardera/flutter-pi/issues/269

    Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
    ---
     src/egl_gbm_render_surface.c | 6 ++++--
     1 file changed, 4 insertions(+), 2 deletions(-)

    diff --git a/src/egl_gbm_render_surface.c b/src/egl_gbm_render_surface.c
    index ce9e5e7..8a58667 100644
    --- a/src/egl_gbm_render_surface.c
    +++ b/src/egl_gbm_render_surface.c
    @@ -146,6 +146,7 @@ static int egl_gbm_render_surface_init(
         }
     #endif

    +    gbm_surface = NULL;
         if (allowed_modifiers != NULL) {
             gbm_surface = gbm_surface_create_with_modifiers(
                 gbm_device,
    @@ -158,9 +159,10 @@ static int egl_gbm_render_surface_init(
             if (gbm_surface == NULL) {
                 ok = errno;
                 LOG_ERROR("Couldn't create GBM surface for rendering. gbm_surface_create_with_modifiers: %s\n", strerror(ok));
    -            return ok;
    +            LOG_ERROR("Will retry without modifiers\n");
             }
    -    } else {
    +    }
    +    if (gbm_surface == NULL) {
             gbm_surface = gbm_surface_create(
                 gbm_device,
                 size.x,
    --
    2.25.1

With this patch, the application no longer coredumps, and keeps running.

As for the CRC of the framebuffer: without flutter-pi running, the value
is 0x4c4126bf. Starting the flutter application (and waiting quite a
bit), it suddenly changes to an arbitrary value! Stopping flutter-pi,
the CRC reverts to 0x4c4126bf. Starting again, new value! Note that it
can be like 10s or more before the CRC changes at application start.

So, to me, that means the application is now running! I have no idea what
is supposed to be displayed, but something is being rendered, and that's
all that matters!

Care to integrate that patch in your series, test in your actual setup,
see if it's possible to send it upstream, update the runtime test to
check on the CRC (instead of checkign the systemd unit status), and
respin the series, please?

(I'm on the move the next few days, but I'll be able to dedicate time
during the WE).

>   - you're pointing the gallery app to /usr/share/flutter/gallery/release/
>     but therat does not exist (what should it contain, btw?).

(blark typoes of mine). I must have messed things with another test,
because /usr/share/flutter/gallery/release/ *is* populated as expected.

[0] https://patchwork.ozlabs.org/project/buildroot/patch/20230926154703.160448-1-yann.morin.1998@free.fr/

Regards,
Yann E. MORIN.

> Can you look at that test, please?
> 
> Regards,
> Yann E. MORIN.
> 
> > Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
> > ---
> > v8 -> v9:
> >   - Changed to aarch64 to avoid problems with older versions of qemu.
> >   - Added BR2_LINUX_KERNEL_NEEDS_HOST_LIBELF
> > 
> >  DEVELOPERS                                    |  1 +
> >  support/testing/tests/package/test_flutter.py | 56 +++++++++++++++++++
> >  .../package/test_flutter/linux-vkms.fragment  |  2 +
> >  .../flutter-gallery.service                   |  1 +
> >  .../systemd/system/flutter-gallery.service    | 11 ++++
> >  5 files changed, 71 insertions(+)
> >  create mode 100644 support/testing/tests/package/test_flutter.py
> >  create mode 100644 support/testing/tests/package/test_flutter/linux-vkms.fragment
> >  create mode 120000 support/testing/tests/package/test_flutter/overlay/etc/systemd/system/multi-user.target.wants/flutter-gallery.service
> >  create mode 100644 support/testing/tests/package/test_flutter/overlay/usr/lib/systemd/system/flutter-gallery.service
> > 
> > diff --git a/DEVELOPERS b/DEVELOPERS
> > index 48a4ec776a..f46d83679a 100644
> > --- a/DEVELOPERS
> > +++ b/DEVELOPERS
> > @@ -37,6 +37,7 @@ F:	package/flutter-engine/
> >  F:	package/flutter-gallery/
> >  F:	package/flutter-pi/
> >  F:	package/flutter-sdk-bin/
> > +F:	support/testing/tests/package/test_flutter.py
> >  
> >  N:	Adam Heinrich <adam@adamh.cz>
> >  F:	package/jack1/
> > diff --git a/support/testing/tests/package/test_flutter.py b/support/testing/tests/package/test_flutter.py
> > new file mode 100644
> > index 0000000000..e17ed9f659
> > --- /dev/null
> > +++ b/support/testing/tests/package/test_flutter.py
> > @@ -0,0 +1,56 @@
> > +import os
> > +import time
> > +import infra.basetest
> > +
> > +
> > +class TestFlutter(infra.basetest.BRTest):
> > +    config = f"""
> > +        BR2_aarch64=y
> > +        BR2_TOOLCHAIN_EXTERNAL=y
> > +        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
> > +        BR2_ROOTFS_OVERLAY="{infra.filepath("tests/package/test_flutter/overlay")}"
> > +        BR2_PER_PACKAGE_DIRECTORIES=y
> > +        BR2_INIT_SYSTEMD=y
> > +        BR2_LINUX_KERNEL=y
> > +        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> > +        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.54"
> > +        BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
> > +        BR2_LINUX_KERNEL_NEEDS_HOST_LIBELF=y
> > +        BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux.config"
> > +        BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="{infra.filepath("tests/package/test_flutter/linux-vkms.fragment")}"
> > +        BR2_PACKAGE_LIBDRM=y
> > +        BR2_PACKAGE_MESA3D=y
> > +        BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SWRAST=y
> > +        BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_VIRGL=y
> > +        BR2_PACKAGE_MESA3D_OPENGL_ES=y
> > +        BR2_PACKAGE_FLUTTER_PI=y
> > +        BR2_PACKAGE_FLUTTER_PI_RAW_KEYBOARD_PLUGIN=y
> > +        BR2_PACKAGE_FLUTTER_PI_TEXT_INPUT_PLUGIN=y
> > +        BR2_PACKAGE_FLUTTER_GALLERY=y
> > +        BR2_PACKAGE_FLUTTER_ENGINE=y
> > +        BR2_TARGET_ROOTFS_EXT2=y
> > +        BR2_TARGET_ROOTFS_EXT2_4=y
> > +        BR2_TARGET_ROOTFS_EXT2_SIZE="512M"
> > +        # BR2_TARGET_ROOTFS_TAR is not set
> > +        """
> > +
> > +    def test_run(self):
> > +        timeout = 35 * self.emulator.timeout_multiplier
> > +        img = os.path.join(self.builddir, "images", "rootfs.ext2")
> > +        kern = os.path.join(self.builddir, "images", "Image")
> > +        self.emulator.boot(
> > +            arch="aarch64",
> > +            kernel=kern,
> > +            kernel_cmdline=["root=/dev/vda console=ttyAMA0"],
> > +            options=["-M", "virt",
> > +                     "-cpu", "cortex-a57",
> > +                     "-m", "512M",
> > +                     "-smp", "4",
> > +                     "-vga", "std",
> > +                     "-vnc", "none",
> > +                     "-drive", f"file={img},if=virtio,format=raw"])
> > +        self.emulator.login()
> > +        cmd = "systemctl is-active flutter-gallery"
> > +        output, exit_code = self.emulator.run(cmd, 10)
> > +        self.assertEqual(exit_code, 0)
> > +        self.assertEqual(output[0], "active")
> > diff --git a/support/testing/tests/package/test_flutter/linux-vkms.fragment b/support/testing/tests/package/test_flutter/linux-vkms.fragment
> > new file mode 100644
> > index 0000000000..3fc7a5dded
> > --- /dev/null
> > +++ b/support/testing/tests/package/test_flutter/linux-vkms.fragment
> > @@ -0,0 +1,2 @@
> > +CONFIG_DEBUG_FS=y
> > +CONFIG_DRM_VKMS=y
> > diff --git a/support/testing/tests/package/test_flutter/overlay/etc/systemd/system/multi-user.target.wants/flutter-gallery.service b/support/testing/tests/package/test_flutter/overlay/etc/systemd/system/multi-user.target.wants/flutter-gallery.service
> > new file mode 120000
> > index 0000000000..40993fb16c
> > --- /dev/null
> > +++ b/support/testing/tests/package/test_flutter/overlay/etc/systemd/system/multi-user.target.wants/flutter-gallery.service
> > @@ -0,0 +1 @@
> > +../../../../usr/lib/systemd/system/flutter-gallery.service
> > \ No newline at end of file
> > diff --git a/support/testing/tests/package/test_flutter/overlay/usr/lib/systemd/system/flutter-gallery.service b/support/testing/tests/package/test_flutter/overlay/usr/lib/systemd/system/flutter-gallery.service
> > new file mode 100644
> > index 0000000000..88a2bcbf0b
> > --- /dev/null
> > +++ b/support/testing/tests/package/test_flutter/overlay/usr/lib/systemd/system/flutter-gallery.service
> > @@ -0,0 +1,11 @@
> > +[Unit]
> > +Description=flutter-gallery daemon
> > +After=dbus.service systemd-udevd.service
> > +
> > +[Service]
> > +ExecStart=/usr/bin/flutter-pi --release /usr/share/flutter/gallery/release/
> > +Restart=always
> > +KillMode=process
> > +
> > +[Install]
> > +WantedBy=multi-user.target
> > -- 
> > 2.39.2
> > 
> > _______________________________________________
> > buildroot mailing list
> > buildroot@buildroot.org
> > https://lists.buildroot.org/mailman/listinfo/buildroot
> 
> -- 
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'
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

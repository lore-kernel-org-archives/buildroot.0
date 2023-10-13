Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD451CDB47E
	for <buildroot@archiver.kernel.org>; Fri, 13 Oct 2023 21:09:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6C68360F0B;
	Fri, 13 Oct 2023 21:09:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6C68360F0B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id m2LTwg8XtYcN; Fri, 13 Oct 2023 21:09:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 427C160F28;
	Fri, 13 Oct 2023 21:09:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 427C160F28
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id F1D7C1BF3C0
 for <buildroot@lists.busybox.net>; Fri, 13 Oct 2023 21:09:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C9E7441F29
 for <buildroot@lists.busybox.net>; Fri, 13 Oct 2023 21:09:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C9E7441F29
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LJmfFShav4iP for <buildroot@lists.busybox.net>;
 Fri, 13 Oct 2023 21:09:33 +0000 (UTC)
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E74C241E99
 for <buildroot@buildroot.org>; Fri, 13 Oct 2023 21:09:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E74C241E99
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2c50cd16f3bso8427201fa.2
 for <buildroot@buildroot.org>; Fri, 13 Oct 2023 14:09:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697231370; x=1697836170;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=KSK3FIgi+1xd9ZhH14p9jXc/kn3EiacUEvN8ag1pf7Y=;
 b=jd7yQUwZgopCNK5LfOorb5Zi2SSUQv2FsOSchQupgi1gkvGt5sp9JXxN9dTzrYbewu
 9l+8EX4sWFZ2wjIR5EBHH51zk+qIT8qtN2uk2MS07eB/OcT4zQV2yGNMe6cY7PvCkv7Q
 H5QAG1BUvpW0yOJivJkk3/1rzh7/DCbxQHWK9vhxkJPzwH1KCGwNy3Gq5fVPNeHWNpbx
 KuzK4FqC7HT2yLgYeOUfsXUTC0ND0Osw63fY5h2k4PSvw21TlMbrBL57IaFcONG1TLz7
 NxjpBdcXuvkwhkV7oCSpYo715CwcPaMZh3rCk/sFhARwYYN5uyymLovkq5zV0lvT8kxt
 BuNQ==
X-Gm-Message-State: AOJu0YzxmeCovNPe9vFNyvEc+4CYZ1W+62IbKGqDc5A1vCfIyoSfI71I
 v/b+eIX4qZKctHzm5AnSHKFm5m2bGg++po5ubWs4qcwzcTc=
X-Google-Smtp-Source: AGHT+IGbCenokGEAJgHn/nH8u+WbuXypZYEWhvn7DJF1M3ksOCXRbgbzNvWAdKEjuQJ/+40o7RjF6wnCidToGErBANM=
X-Received: by 2002:a05:651c:2108:b0:2c5:b87:39bc with SMTP id
 a8-20020a05651c210800b002c50b8739bcmr2072854ljq.1.1697231369489; Fri, 13 Oct
 2023 14:09:29 -0700 (PDT)
MIME-Version: 1.0
From: Zvi Vered <veredz72@gmail.com>
Date: Sat, 14 Oct 2023 00:09:19 +0300
Message-ID: <CABRndgyUFq2nfXU2Bi0o+aVjfuQ7eMtWbEFSJ1V9ipOHjaN_Aw@mail.gmail.com>
To: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1697231370; x=1697836170; darn=buildroot.org;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=KSK3FIgi+1xd9ZhH14p9jXc/kn3EiacUEvN8ag1pf7Y=;
 b=caewcplBoNMVd5j+cESDTCdOwZkQFg9V9iLl7AE6y/EPCTUuPAtKfvJuTFIS+LnMpW
 sKLztWUwks/74CnQCS0LucTIh2OVtaVsyZwGlvadunHBOv2ni3qO5ttbRxTCgc0hUups
 pOqhq8V94NYOz+knyhykrRMkQ0n2nNWb19JMAeeISP17yVBzEqNmT15rq0VPqotUmxYZ
 ACwV6yrXSNWnz1k6DY26GSCjitWAl0Pr+pOuaHnjiXjG5SqeblTPfy0Wm1ZkZx+NyiTN
 65ZOhhrVozmz/WJec5jV7Plq2RYO+0HfoM0kuiICXK9jA5wuq9vjUA2aEDmCkMTak1DG
 KRGg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=caewcplB
Subject: [Buildroot] buildroot 2021.02.1: black screen after Xorg launched
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

Using buildroot 2021.02.1 for x64 I built root file system that contain Xorg.
Right after Xorg is launched I got black screen.

According to Xorg.0.0.log (attached) there is no error.
I tried to run: xeyes and got:
Can't open display

I noticed the following lines in Xorg.0.0.log:
Code:

[     5.116] (==) No Layout section.  Using the first Screen section.
[     5.116] (==) No screen section available. Using defaults.
[     5.116] (**) |-->Screen "Default Screen Section" (0)
[     5.116] (**) |   |-->Monitor "<default monitor>"
[     5.117] (==) No monitor specified for screen "Default Screen Section".

On the same PC I booted Knoppix 9.1. Xorg works fine.

I noticed that Knoppix contains several files in:
/usr/share/X11/xorg.conf.d

But in my file system this folder contains only the file: 10-quirks.conf

Can you please advise what can be the reason for the black screen ?

Thank you,
Zvika

-------------------------------------------------------------Xorg.0.0.log
-------------------------------------
[     5.080]
X.Org X Server 1.20.10
X Protocol Version 11, Revision 0
[     5.080] Build Operating System: Linux 5.4.0-150-generic x86_64
[     5.080] Current Operating System: Linux buildroot 4.19.135 #2 SMP
Sat Aug 12 21:28:59 IDT 2023 x86_64
[     5.080] Kernel command line: BOOT_IMAGE=/boot/bzImage
root=/dev/sdb2 ip=:::::eth0:on
[     5.080] Build Date: 09 October 2023  11:15:40PM
[     5.080]
[     5.080] Current version of pixman: 0.40.0
[     5.080]    Before reporting problems, check http://wiki.x.org
    to make sure that you have the latest version.
[     5.080] Markers: (--) probed, (**) from config file, (==) default setting,
    (++) from command line, (!!) notice, (II) informational,
    (WW) warning, (EE) error, (NI) not implemented, (??) unknown.
[     5.080] (==) Log file: "/var/log/Xorg.0.0.log", Time: Fri Oct 13
23:00:12 2023
[     5.082] (==) Using system config directory "/usr/share/X11/xorg.conf.d"
[     5.083] (==) No Layout section.  Using the first Screen section.
[     5.083] (==) No screen section available. Using defaults.
[     5.083] (**) |-->Screen "Default Screen Section" (0)
[     5.083] (**) |   |-->Monitor "<default monitor>"
[     5.083] (==) No monitor specified for screen "Default Screen Section".
    Using a default monitor configuration.
[     5.083] (==) Automatically adding devices
[     5.083] (==) Automatically enabling devices
[     5.083] (==) Automatically adding GPU devices
[     5.084] (==) Max clients allowed: 256, resource mask: 0x1fffff
[     5.085] (WW) The directory "/usr/share/fonts/X11//TTF/" does not exist.
[     5.085]    Entry deleted from font path.
[     5.085] (WW) The directory "/usr/share/fonts/X11//OTF/" does not exist.
[     5.085]    Entry deleted from font path.
[     5.085] (WW) The directory "/usr/share/fonts/X11//Type1/" does not exist.
[     5.085]    Entry deleted from font path.
[     5.086] (WW) `fonts.dir' not found (or not valid) in
"/usr/share/fonts/X11//100dpi/".
[     5.086]    Entry deleted from font path.
[     5.086]    (Run 'mkfontdir' on "/usr/share/fonts/X11//100dpi/").
[     5.086] (WW) `fonts.dir' not found (or not valid) in
"/usr/share/fonts/X11//75dpi/".
[     5.086]    Entry deleted from font path.
[     5.086]    (Run 'mkfontdir' on "/usr/share/fonts/X11//75dpi/").
[     5.086] (==) FontPath set to:
    /usr/share/fonts/X11//misc/
[     5.086] (==) ModulePath set to "/usr/lib/xorg/modules"
[     5.086] (II) The server relies on udev to provide the list of
input devices.
    If no devices become available, reconfigure udev or disable AutoAddDevices.
[     5.086] (II) Loader magic: 0x5feb40
[     5.086] (II) Module ABI versions:
[     5.086]    X.Org ANSI C Emulation: 0.4
[     5.086]    X.Org Video Driver: 24.1
[     5.086]    X.Org XInput driver : 24.1
[     5.086]    X.Org Server Extension : 10.0
[     5.086] (II) xfree86: Adding drm device (/dev/dri/card0)
[     5.100] (--) PCI:*(0@0:2:0) 8086:3e92:1043:872f rev 0, Mem @
0xdd000000/16777216, 0xb0000000/268435456, I/O @ 0x0000f000/64, BIOS @
0x????????/131072
[     5.100] (--) PCI: (1@0:0:0) 10de:1b06:1043:85e5 rev 161, Mem @
0xde000000/16777216, 0xc0000000/268435456, 0xd0000000/33554432, I/O @
0x0000e000/128, BIOS @ 0x????????/524288
[     5.100] (WW) Open ACPI failed (/var/run/acpid.socket) (No such
file or directory)
[     5.100] (==) Matched intel as autoconfigured driver 0
[     5.100] (==) Matched modesetting as autoconfigured driver 1
[     5.100] (==) Matched fbdev as autoconfigured driver 2
[     5.100] (==) Matched vesa as autoconfigured driver 3
[     5.100] (==) Assigned the driver to the xf86ConfigLayout
[     5.100] (II) LoadModule: "intel"
[     5.101] (II) Loading /usr/lib/xorg/modules/drivers/intel_drv.so
[     5.104] (II) Module intel: vendor="X.Org Foundation"
[     5.104]    compiled for 1.20.10, module version = 2.99.917
[     5.104]    Module class: X.Org Video Driver
[     5.104]    ABI class: X.Org Video Driver, version 24.1
[     5.104] (II) LoadModule: "modesetting"
[     5.104] (II) Loading /usr/lib/xorg/modules/drivers/modesetting_drv.so
[     5.105] (II) Module modesetting: vendor="X.Org Foundation"
[     5.105]    compiled for 1.20.10, module version = 1.20.10
[     5.105]    Module class: X.Org Video Driver
[     5.105]    ABI class: X.Org Video Driver, version 24.1
[     5.106] (II) LoadModule: "fbdev"
[     5.106] (II) Loading /usr/lib/xorg/modules/drivers/fbdev_drv.so
[     5.106] (II) Module fbdev: vendor="X.Org Foundation"
[     5.106]    compiled for 1.20.10, module version = 0.5.0
[     5.106]    Module class: X.Org Video Driver
[     5.106]    ABI class: X.Org Video Driver, version 24.1
[     5.106] (II) LoadModule: "vesa"
[     5.106] (II) Loading /usr/lib/xorg/modules/drivers/vesa_drv.so
[     5.107] (II) Module vesa: vendor="X.Org Foundation"
[     5.107]    compiled for 1.20.10, module version = 2.5.0
[     5.107]    Module class: X.Org Video Driver
[     5.107]    ABI class: X.Org Video Driver, version 24.1
[     5.107] (II) intel: Driver for Intel(R) Integrated Graphics Chipsets:
    i810, i810-dc100, i810e, i815, i830M, 845G, 854, 852GM/855GM, 865G,
    915G, E7221 (i915), 915GM, 945G, 945GM, 945GME, Pineview GM,
    Pineview G, 965G, G35, 965Q, 946GZ, 965GM, 965GME/GLE, G33, Q35, Q33,
    GM45, 4 Series, G45/G43, Q45/Q43, G41, B43
[     5.107] (II) intel: Driver for Intel(R) HD Graphics
[     5.107] (II) intel: Driver for Intel(R) Iris(TM) Graphics
[     5.107] (II) intel: Driver for Intel(R) Iris(TM) Pro Graphics
[     5.107] (II) modesetting: Driver for Modesetting Kernel Drivers: kms
[     5.107] (II) FBDEV: driver for framebuffer: fbdev
[     5.107] (II) VESA: driver for VESA chipsets: vesa
[     5.107] (++) using VT number 1

[     5.107] (WW) xf86OpenConsole: setpgid failed: Operation not permitted
[     5.108] (II) intel(0): Using Kernel Mode Setting driver: i915,
version 1.6.0 20180719
[     5.122] (WW) Falling back to old probe method for modesetting
[     5.122] (WW) Falling back to old probe method for fbdev
[     5.122] (II) Loading sub module "fbdevhw"
[     5.122] (II) LoadModule: "fbdevhw"
[     5.123] (II) Loading /usr/lib/xorg/modules/libfbdevhw.so
[     5.123] (II) Module fbdevhw: vendor="X.Org Foundation"
[     5.123]    compiled for 1.20.10, module version = 0.0.2
[     5.123]    ABI class: X.Org Video Driver, version 24.1
[     5.124] (--) intel(0): Integrated Graphics Chipset: Intel(R) HD Graphics
[     5.124] (--) intel(0): CPU: x86-64, sse2, sse3, ssse3, sse4.1,
sse4.2, avx, avx2; using a maximum of 6 threads
[     5.124] (II) intel(0): Creating default Display subsection in
Screen section
    "Default Screen Section" for depth/fbbpp 24/32
[     5.124] (==) intel(0): Depth 24, (--) framebuffer bpp 32
[     5.124] (==) intel(0): RGB weight 888
[     5.124] (==) intel(0): Default visual is TrueColor
[     5.126] (II) intel(0): Output HDMI1 has no monitor section
[     5.126] (II) intel(0): Enabled output HDMI1
[     5.126] (II) intel(0): Output HDMI2 has no monitor section
[     5.126] (II) intel(0): Enabled output HDMI2
[     5.126] (--) intel(0): Using a maximum size of 256x256 for hardware cursors
[     5.126] (II) intel(0): Output VIRTUAL1 has no monitor section
[     5.126] (II) intel(0): Enabled output VIRTUAL1
[     5.126] (--) intel(0): Output HDMI1 using initial mode 1920x1080 on pipe 0
[     5.127] (==) intel(0): TearFree enabled
[     5.127] (==) intel(0): Using gamma correction (1.0, 1.0, 1.0)
[     5.127] (==) intel(0): DPI set to (96, 96)
[     5.127] (II) Loading sub module "dri3"
[     5.127] (II) LoadModule: "dri3"
[     5.127] (II) Module "dri3" already built-in
[     5.127] (II) Loading sub module "dri2"
[     5.127] (II) LoadModule: "dri2"
[     5.127] (II) Module "dri2" already built-in
[     5.127] (II) Loading sub module "present"
[     5.127] (II) LoadModule: "present"
[     5.127] (II) Module "present" already built-in
[     5.127] (II) UnloadModule: "modesetting"
[     5.127] (II) Unloading modesetting
[     5.127] (II) UnloadModule: "fbdev"
[     5.127] (II) Unloading fbdev
[     5.127] (II) UnloadSubModule: "fbdevhw"
[     5.127] (II) Unloading fbdevhw
[     5.127] (II) UnloadModule: "vesa"
[     5.127] (II) Unloading vesa
[     5.130] (II) intel(0): SNA initialized with Coffeelake (gen9) backend
[     5.130] (==) intel(0): Backing store disabled
[     5.130] (==) intel(0): Silken mouse enabled
[     5.131] (II) intel(0): HW Cursor enabled
[     5.131] (==) intel(0): DPMS enabled
[     5.132] (==) intel(0): Display hotplug detection enabled
[     5.132] (II) intel(0): [DRI2] Setup complete
[     5.132] (II) intel(0): [DRI2]   DRI driver: i965
[     5.132] (II) intel(0): [DRI2]   VDPAU driver: va_gl
[     5.132] (II) intel(0): direct rendering: DRI2 enabled
[     5.132] (II) intel(0): hardware support for Present enabled
[     5.132] (II) Initializing extension Generic Event Extension
[     5.132] (II) Initializing extension SHAPE
[     5.132] (II) Initializing extension MIT-SHM
[     5.132] (II) Initializing extension XInputExtension
[     5.132] (II) Initializing extension XTEST
[     5.132] (II) Initializing extension BIG-REQUESTS
[     5.132] (II) Initializing extension SYNC
[     5.132] (II) Initializing extension XKEYBOARD
[     5.132] (II) Initializing extension XC-MISC
[     5.132] (II) Initializing extension XFIXES
[     5.132] (II) Initializing extension RENDER
[     5.132] (II) Initializing extension RANDR
[     5.132] (II) Initializing extension DAMAGE
[     5.132] (II) Initializing extension DOUBLE-BUFFER
[     5.132] (II) Initializing extension RECORD
[     5.132] (II) Initializing extension DPMS
[     5.132] (II) Initializing extension Present
[     5.132] (II) Initializing extension DRI3
[     5.132] (II) Initializing extension X-Resource
[     5.132] (II) Initializing extension XVideo
[     5.132] (II) Initializing extension XVideo-MotionCompensation
[     5.132] (II) Initializing extension XFree86-VidModeExtension
[     5.132] (II) Initializing extension XFree86-DGA
[     5.132] (II) Initializing extension DRI2
[     5.137] (II) intel(0): switch to mode 1920x1080@60.0 on HDMI1
using pipe 0, position (0, 0), rotation normal, reflection none
[     5.144] (II) intel(0): Setting screen physical size to 508 x 285
[     5.214] (II) config/udev: Adding input device Power Button
(/dev/input/event2)
[     5.214] (**) Power Button: Applying InputClass "evdev keyboard catchall"
[     5.214] (II) LoadModule: "evdev"
[     5.214] (II) Loading /usr/lib/xorg/modules/input/evdev_drv.so
[     5.217] (II) Module evdev: vendor="X.Org Foundation"
[     5.217]    compiled for 1.20.10, module version = 2.10.6
[     5.217]    Module class: X.Org XInput Driver
[     5.217]    ABI class: X.Org XInput driver, version 24.1
[     5.217] (II) Using input driver 'evdev' for 'Power Button'
[     5.217] (**) Power Button: always reports core events
[     5.217] (**) evdev: Power Button: Device: "/dev/input/event2"
[     5.217] (--) evdev: Power Button: Vendor 0 Product 0x1
[     5.217] (--) evdev: Power Button: Found keys
[     5.217] (II) evdev: Power Button: Configuring as keyboard
[     5.217] (**) Option "config_info"
"udev:/sys/devices/LNXSYSTM:00/LNXPWRBN:00/input/input2/event2"
[     5.217] (II) XINPUT: Adding extended input device "Power Button"
(type: KEYBOARD, id 6)
[     5.217] (**) Option "xkb_rules" "evdev"
[     5.217] (II) config/udev: Adding input device Video Bus (/dev/input/event3)
[     5.217] (**) Video Bus: Applying InputClass "evdev keyboard catchall"
[     5.217] (II) Using input driver 'evdev' for 'Video Bus'
[     5.217] (**) Video Bus: always reports core events
[     5.217] (**) evdev: Video Bus: Device: "/dev/input/event3"
[     5.217] (--) evdev: Video Bus: Vendor 0 Product 0x6
[     5.217] (--) evdev: Video Bus: Found keys
[     5.217] (II) evdev: Video Bus: Configuring as keyboard
[     5.217] (**) Option "config_info"
"udev:/sys/devices/LNXSYSTM:00/LNXSYBUS:00/PNP0A08:00/LNXVIDEO:00/input/input3/event3"
[     5.217] (II) XINPUT: Adding extended input device "Video Bus"
(type: KEYBOARD, id 7)
[     5.217] (**) Option "xkb_rules" "evdev"
[     5.217] (II) config/udev: Adding input device Power Button
(/dev/input/event1)
[     5.217] (**) Power Button: Applying InputClass "evdev keyboard catchall"
[     5.217] (II) Using input driver 'evdev' for 'Power Button'
[     5.217] (**) Power Button: always reports core events
[     5.217] (**) evdev: Power Button: Device: "/dev/input/event1"
[     5.217] (--) evdev: Power Button: Vendor 0 Product 0x1
[     5.217] (--) evdev: Power Button: Found keys
[     5.217] (II) evdev: Power Button: Configuring as keyboard
[     5.217] (**) Option "config_info"
"udev:/sys/devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0C:00/input/input1/event1"
[     5.217] (II) XINPUT: Adding extended input device "Power Button"
(type: KEYBOARD, id 8)
[     5.217] (**) Option "xkb_rules" "evdev"
[     5.218] (II) config/udev: Adding input device Sleep Button
(/dev/input/event0)
[     5.218] (**) Sleep Button: Applying InputClass "evdev keyboard catchall"
[     5.218] (II) Using input driver 'evdev' for 'Sleep Button'
[     5.218] (**) Sleep Button: always reports core events
[     5.218] (**) evdev: Sleep Button: Device: "/dev/input/event0"
[     5.218] (--) evdev: Sleep Button: Vendor 0 Product 0x3
[     5.218] (--) evdev: Sleep Button: Found keys
[     5.218] (II) evdev: Sleep Button: Configuring as keyboard
[     5.218] (**) Option "config_info"
"udev:/sys/devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0E:00/input/input0/event0"
[     5.218] (II) XINPUT: Adding extended input device "Sleep Button"
(type: KEYBOARD, id 9)
[     5.218] (**) Option "xkb_rules" "evdev"
[     5.218] (II) config/udev: Adding input device Razer Razer
DeathAdder V2 X HyperSpeed (/dev/input/event4)
[     5.218] (**) Razer Razer DeathAdder V2 X HyperSpeed: Applying
InputClass "evdev pointer catchall"
[     5.218] (II) Using input driver 'evdev' for 'Razer Razer
DeathAdder V2 X HyperSpeed'
[     5.218] (**) Razer Razer DeathAdder V2 X HyperSpeed: always
reports core events
[     5.218] (**) evdev: Razer Razer DeathAdder V2 X HyperSpeed:
Device: "/dev/input/event4"
[     5.270] (--) evdev: Razer Razer DeathAdder V2 X HyperSpeed:
Vendor 0x1532 Product 0x9c
[     5.270] (--) evdev: Razer Razer DeathAdder V2 X HyperSpeed: Found
9 mouse buttons
[     5.270] (--) evdev: Razer Razer DeathAdder V2 X HyperSpeed: Found
scroll wheel(s)
[     5.270] (--) evdev: Razer Razer DeathAdder V2 X HyperSpeed: Found
relative axes
[     5.270] (--) evdev: Razer Razer DeathAdder V2 X HyperSpeed: Found
x and y relative axes
[     5.270] (II) evdev: Razer Razer DeathAdder V2 X HyperSpeed:
Configuring as mouse
[     5.270] (II) evdev: Razer Razer DeathAdder V2 X HyperSpeed:
Adding scrollwheel support
[     5.270] (**) evdev: Razer Razer DeathAdder V2 X HyperSpeed:
YAxisMapping: buttons 4 and 5
[     5.270] (**) evdev: Razer Razer DeathAdder V2 X HyperSpeed:
EmulateWheelButton: 4, EmulateWheelInertia: 10, EmulateWheelTimeout:
200
[     5.270] (**) Option "config_info"
"udev:/sys/devices/pci0000:00/0000:00:14.0/usb1/1-8/1-8:1.0/0003:1532:009C.0001/input/input4/event4"
[     5.270] (II) XINPUT: Adding extended input device "Razer Razer
DeathAdder V2 X HyperSpeed" (type: MOUSE, id 10)
[     5.270] (II) evdev: Razer Razer DeathAdder V2 X HyperSpeed:
initialized for relative axes.
[     5.270] (**) Razer Razer DeathAdder V2 X HyperSpeed: (accel)
keeping acceleration scheme 1
[     5.270] (**) Razer Razer DeathAdder V2 X HyperSpeed: (accel)
acceleration profile 0
[     5.270] (**) Razer Razer DeathAdder V2 X HyperSpeed: (accel)
acceleration factor: 2.000
[     5.270] (**) Razer Razer DeathAdder V2 X HyperSpeed: (accel)
acceleration threshold: 4
[     5.271] (II) config/udev: Adding input device Razer Razer
DeathAdder V2 X HyperSpeed Keyboard (/dev/input/event5)
[     5.271] (**) Razer Razer DeathAdder V2 X HyperSpeed Keyboard:
Applying InputClass "evdev keyboard catchall"
[     5.271] (II) Using input driver 'evdev' for 'Razer Razer
DeathAdder V2 X HyperSpeed Keyboard'
[     5.271] (**) Razer Razer DeathAdder V2 X HyperSpeed Keyboard:
always reports core events
[     5.271] (**) evdev: Razer Razer DeathAdder V2 X HyperSpeed
Keyboard: Device: "/dev/input/event5"
[     5.271] (--) evdev: Razer Razer DeathAdder V2 X HyperSpeed
Keyboard: Vendor 0x1532 Product 0x9c
[     5.271] (--) evdev: Razer Razer DeathAdder V2 X HyperSpeed
Keyboard: Found keys
[     5.271] (II) evdev: Razer Razer DeathAdder V2 X HyperSpeed
Keyboard: Configuring as keyboard
[     5.271] (**) Option "config_info"
"udev:/sys/devices/pci0000:00/0000:00:14.0/usb1/1-8/1-8:1.1/0003:1532:009C.0002/input/input5/event5"
[     5.271] (II) XINPUT: Adding extended input device "Razer Razer
DeathAdder V2 X HyperSpeed Keyboard" (type: KEYBOARD, id 11)
[     5.271] (**) Option "xkb_rules" "evdev"
[     5.272] (II) config/udev: Adding input device Razer Razer
DeathAdder V2 X HyperSpeed Mouse (/dev/input/event6)
[     5.272] (**) Razer Razer DeathAdder V2 X HyperSpeed Mouse:
Applying InputClass "evdev pointer catchall"
[     5.272] (II) Using input driver 'evdev' for 'Razer Razer
DeathAdder V2 X HyperSpeed Mouse'
[     5.272] (**) Razer Razer DeathAdder V2 X HyperSpeed Mouse: always
reports core events
[     5.272] (**) evdev: Razer Razer DeathAdder V2 X HyperSpeed Mouse:
Device: "/dev/input/event6"
[     5.272] (--) evdev: Razer Razer DeathAdder V2 X HyperSpeed Mouse:
Vendor 0x1532 Product 0x9c
[     5.272] (--) evdev: Razer Razer DeathAdder V2 X HyperSpeed Mouse:
Found 10 mouse buttons
[     5.272] (--) evdev: Razer Razer DeathAdder V2 X HyperSpeed Mouse:
Found scroll wheel(s)
[     5.272] (--) evdev: Razer Razer DeathAdder V2 X HyperSpeed Mouse:
Found relative axes
[     5.272] (--) evdev: Razer Razer DeathAdder V2 X HyperSpeed Mouse:
Found x and y relative axes
[     5.272] (II) evdev: Razer Razer DeathAdder V2 X HyperSpeed Mouse:
Configuring as mouse
[     5.272] (II) evdev: Razer Razer DeathAdder V2 X HyperSpeed Mouse:
Adding scrollwheel support
[     5.272] (**) evdev: Razer Razer DeathAdder V2 X HyperSpeed Mouse:
YAxisMapping: buttons 4 and 5
[     5.272] (**) evdev: Razer Razer DeathAdder V2 X HyperSpeed Mouse:
EmulateWheelButton: 4, EmulateWheelInertia: 10, EmulateWheelTimeout:
200
[     5.272] (**) Option "config_info"
"udev:/sys/devices/pci0000:00/0000:00:14.0/usb1/1-8/1-8:1.1/0003:1532:009C.0002/input/input6/event6"
[     5.272] (II) XINPUT: Adding extended input device "Razer Razer
DeathAdder V2 X HyperSpeed Mouse" (type: MOUSE, id 12)
[     5.272] (II) evdev: Razer Razer DeathAdder V2 X HyperSpeed Mouse:
initialized for relative axes.
[     5.272] (**) Razer Razer DeathAdder V2 X HyperSpeed Mouse:
(accel) keeping acceleration scheme 1
[     5.272] (**) Razer Razer DeathAdder V2 X HyperSpeed Mouse:
(accel) acceleration profile 0
[     5.272] (**) Razer Razer DeathAdder V2 X HyperSpeed Mouse:
(accel) acceleration factor: 2.000
[     5.272] (**) Razer Razer DeathAdder V2 X HyperSpeed Mouse:
(accel) acceleration threshold: 4
[     5.273] (II) config/udev: Adding input device Razer Razer
DeathAdder V2 X HyperSpeed Consumer Control (/dev/input/event7)
[     5.273] (**) Razer Razer DeathAdder V2 X HyperSpeed Consumer
Control: Applying InputClass "evdev keyboard catchall"
[     5.273] (II) Using input driver 'evdev' for 'Razer Razer
DeathAdder V2 X HyperSpeed Consumer Control'
[     5.273] (**) Razer Razer DeathAdder V2 X HyperSpeed Consumer
Control: always reports core events
[     5.273] (**) evdev: Razer Razer DeathAdder V2 X HyperSpeed
Consumer Control: Device: "/dev/input/event7"
[     5.273] (--) evdev: Razer Razer DeathAdder V2 X HyperSpeed
Consumer Control: Vendor 0x1532 Product 0x9c
[     5.273] (--) evdev: Razer Razer DeathAdder V2 X HyperSpeed
Consumer Control: Found 1 mouse buttons
[     5.273] (--) evdev: Razer Razer DeathAdder V2 X HyperSpeed
Consumer Control: Found scroll wheel(s)
[     5.273] (--) evdev: Razer Razer DeathAdder V2 X HyperSpeed
Consumer Control: Found relative axes
[     5.273] (II) evdev: Razer Razer DeathAdder V2 X HyperSpeed
Consumer Control: Forcing relative x/y axes to exist.
[     5.273] (--) evdev: Razer Razer DeathAdder V2 X HyperSpeed
Consumer Control: Found absolute axes
[     5.273] (II) evdev: Razer Razer DeathAdder V2 X HyperSpeed
Consumer Control: Forcing absolute x/y axes to exist.
[     5.273] (--) evdev: Razer Razer DeathAdder V2 X HyperSpeed
Consumer Control: Found keys
[     5.273] (II) evdev: Razer Razer DeathAdder V2 X HyperSpeed
Consumer Control: Configuring as mouse
[     5.273] (II) evdev: Razer Razer DeathAdder V2 X HyperSpeed
Consumer Control: Configuring as keyboard
[     5.273] (II) evdev: Razer Razer DeathAdder V2 X HyperSpeed
Consumer Control: Adding scrollwheel support
[     5.273] (**) evdev: Razer Razer DeathAdder V2 X HyperSpeed
Consumer Control: YAxisMapping: buttons 4 and 5
[     5.273] (**) evdev: Razer Razer DeathAdder V2 X HyperSpeed
Consumer Control: EmulateWheelButton: 4, EmulateWheelInertia: 10,
EmulateWheelTimeout: 200
[     5.273] (**) Option "config_info"
"udev:/sys/devices/pci0000:00/0000:00:14.0/usb1/1-8/1-8:1.1/0003:1532:009C.0002/input/input7/event7"
[     5.273] (II) XINPUT: Adding extended input device "Razer Razer
DeathAdder V2 X HyperSpeed Consumer Control" (type: KEYBOARD, id 13)
[     5.273] (**) Option "xkb_rules" "evdev"
[     5.273] (II) evdev: Razer Razer DeathAdder V2 X HyperSpeed
Consumer Control: initialized for relative axes.
[     5.273] (WW) evdev: Razer Razer DeathAdder V2 X HyperSpeed
Consumer Control: ignoring absolute axes.
[     5.274] (**) Razer Razer DeathAdder V2 X HyperSpeed Consumer
Control: (accel) keeping acceleration scheme 1
[     5.274] (**) Razer Razer DeathAdder V2 X HyperSpeed Consumer
Control: (accel) acceleration profile 0
[     5.274] (**) Razer Razer DeathAdder V2 X HyperSpeed Consumer
Control: (accel) acceleration factor: 2.000
[     5.274] (**) Razer Razer DeathAdder V2 X HyperSpeed Consumer
Control: (accel) acceleration threshold: 4
[     5.274] (II) config/udev: Adding input device Razer Razer
DeathAdder V2 X HyperSpeed System Control (/dev/input/event8)
[     5.274] (**) Razer Razer DeathAdder V2 X HyperSpeed System
Control: Applying InputClass "evdev keyboard catchall"
[     5.274] (II) Using input driver 'evdev' for 'Razer Razer
DeathAdder V2 X HyperSpeed System Control'
[     5.274] (**) Razer Razer DeathAdder V2 X HyperSpeed System
Control: always reports core events
[     5.274] (**) evdev: Razer Razer DeathAdder V2 X HyperSpeed System
Control: Device: "/dev/input/event8"
[     5.274] (--) evdev: Razer Razer DeathAdder V2 X HyperSpeed System
Control: Vendor 0x1532 Product 0x9c
[     5.274] (--) evdev: Razer Razer DeathAdder V2 X HyperSpeed System
Control: Found keys
[     5.274] (II) evdev: Razer Razer DeathAdder V2 X HyperSpeed System
Control: Configuring as keyboard
[     5.274] (**) Option "config_info"
"udev:/sys/devices/pci0000:00/0000:00:14.0/usb1/1-8/1-8:1.1/0003:1532:009C.0002/input/input8/event8"
[     5.274] (II) XINPUT: Adding extended input device "Razer Razer
DeathAdder V2 X HyperSpeed System Control" (type: KEYBOARD, id 14)
[     5.274] (**) Option "xkb_rules" "evdev"
[     5.275] (II) config/udev: Adding input device Razer Razer
DeathAdder V2 X HyperSpeed (/dev/input/event9)
[     5.275] (II) No input driver specified, ignoring this device.
[     5.275] (II) This device may have been added with another device file.
[     5.276] (II) config/udev: Adding input device Razer Razer
DeathAdder V2 X HyperSpeed (/dev/input/event10)
[     5.276] (**) Razer Razer DeathAdder V2 X HyperSpeed: Applying
InputClass "evdev keyboard catchall"
[     5.276] (II) Using input driver 'evdev' for 'Razer Razer
DeathAdder V2 X HyperSpeed'
[     5.276] (**) Razer Razer DeathAdder V2 X HyperSpeed: always
reports core events
[     5.276] (**) evdev: Razer Razer DeathAdder V2 X HyperSpeed:
Device: "/dev/input/event10"
[     5.276] (--) evdev: Razer Razer DeathAdder V2 X HyperSpeed:
Vendor 0x1532 Product 0x9c
[     5.276] (--) evdev: Razer Razer DeathAdder V2 X HyperSpeed: Found keys
[     5.276] (II) evdev: Razer Razer DeathAdder V2 X HyperSpeed:
Configuring as keyboard
[     5.276] (**) Option "config_info"
"udev:/sys/devices/pci0000:00/0000:00:14.0/usb1/1-8/1-8:1.2/0003:1532:009C.0003/input/input10/event10"
[     5.276] (II) XINPUT: Adding extended input device "Razer Razer
DeathAdder V2 X HyperSpeed" (type: KEYBOARD, id 15)
[     5.276] (**) Option "xkb_rules" "evdev"
[     5.277] (II) config/udev: Adding input device Razer Razer
DeathAdder V2 X HyperSpeed Consumer Control (/dev/input/event11)
[     5.277] (**) Razer Razer DeathAdder V2 X HyperSpeed Consumer
Control: Applying InputClass "evdev keyboard catchall"
[     5.277] (II) Using input driver 'evdev' for 'Razer Razer
DeathAdder V2 X HyperSpeed Consumer Control'
[     5.277] (**) Razer Razer DeathAdder V2 X HyperSpeed Consumer
Control: always reports core events
[     5.277] (**) evdev: Razer Razer DeathAdder V2 X HyperSpeed
Consumer Control: Device: "/dev/input/event11"
[     5.277] (--) evdev: Razer Razer DeathAdder V2 X HyperSpeed
Consumer Control: Vendor 0x1532 Product 0x9c
[     5.277] (--) evdev: Razer Razer DeathAdder V2 X HyperSpeed
Consumer Control: Found keys
[     5.277] (II) evdev: Razer Razer DeathAdder V2 X HyperSpeed
Consumer Control: Configuring as keyboard
[     5.278] (**) Option "config_info"
"udev:/sys/devices/pci0000:00/0000:00:14.0/usb1/1-8/1-8:1.3/0003:1532:009C.0005/input/input11/event11"
[     5.278] (II) XINPUT: Adding extended input device "Razer Razer
DeathAdder V2 X HyperSpeed Consumer Control" (type: KEYBOARD, id 16)
[     5.278] (**) Option "xkb_rules" "evdev"
[     5.279] (II) config/udev: Adding input device Logitech USB
Keyboard (/dev/input/event12)
[     5.279] (**) Logitech USB Keyboard: Applying InputClass "evdev
keyboard catchall"
[     5.279] (II) Using input driver 'evdev' for 'Logitech USB Keyboard'
[     5.279] (**) Logitech USB Keyboard: always reports core events
[     5.279] (**) evdev: Logitech USB Keyboard: Device: "/dev/input/event12"
[     5.279] (--) evdev: Logitech USB Keyboard: Vendor 0x46d Product 0xc31c
[     5.279] (--) evdev: Logitech USB Keyboard: Found keys
[     5.279] (II) evdev: Logitech USB Keyboard: Configuring as keyboard
[     5.279] (**) Option "config_info"
"udev:/sys/devices/pci0000:00/0000:00:1c.4/0000:05:00.0/usb3/3-2/3-2:1.0/0003:046D:C31C.0006/input/input12/event12"
[     5.279] (II) XINPUT: Adding extended input device "Logitech USB
Keyboard" (type: KEYBOARD, id 17)
[     5.279] (**) Option "xkb_rules" "evdev"
[     5.280] (II) config/udev: Adding input device Logitech USB
Keyboard (/dev/input/event13)
[     5.280] (**) Logitech USB Keyboard: Applying InputClass "evdev
keyboard catchall"
[     5.280] (II) Using input driver 'evdev' for 'Logitech USB Keyboard'
[     5.280] (**) Logitech USB Keyboard: always reports core events
[     5.280] (**) evdev: Logitech USB Keyboard: Device: "/dev/input/event13"
[     5.280] (--) evdev: Logitech USB Keyboard: Vendor 0x46d Product 0xc31c
[     5.280] (--) evdev: Logitech USB Keyboard: Found 1 mouse buttons
[     5.280] (--) evdev: Logitech USB Keyboard: Found scroll wheel(s)
[     5.280] (--) evdev: Logitech USB Keyboard: Found relative axes
[     5.280] (II) evdev: Logitech USB Keyboard: Forcing relative x/y
axes to exist.
[     5.280] (--) evdev: Logitech USB Keyboard: Found absolute axes
[     5.280] (II) evdev: Logitech USB Keyboard: Forcing absolute x/y
axes to exist.
[     5.280] (--) evdev: Logitech USB Keyboard: Found keys
[     5.280] (II) evdev: Logitech USB Keyboard: Configuring as mouse
[     5.280] (II) evdev: Logitech USB Keyboard: Configuring as keyboard
[     5.280] (II) evdev: Logitech USB Keyboard: Adding scrollwheel support
[     5.280] (**) evdev: Logitech USB Keyboard: YAxisMapping: buttons 4 and 5
[     5.280] (**) evdev: Logitech USB Keyboard: EmulateWheelButton: 4,
EmulateWheelInertia: 10, EmulateWheelTimeout: 200
[     5.280] (**) Option "config_info"
"udev:/sys/devices/pci0000:00/0000:00:1c.4/0000:05:00.0/usb3/3-2/3-2:1.1/0003:046D:C31C.0007/input/input13/event13"
[     5.280] (II) XINPUT: Adding extended input device "Logitech USB
Keyboard" (type: KEYBOARD, id 18)
[     5.280] (**) Option "xkb_rules" "evdev"
[     5.281] (II) evdev: Logitech USB Keyboard: initialized for relative axes.
[     5.281] (WW) evdev: Logitech USB Keyboard: ignoring absolute axes.
[     5.281] (**) Logitech USB Keyboard: (accel) keeping acceleration scheme 1
[     5.281] (**) Logitech USB Keyboard: (accel) acceleration profile 0
[     5.281] (**) Logitech USB Keyboard: (accel) acceleration factor: 2.000
[     5.281] (**) Logitech USB Keyboard: (accel) acceleration threshold: 4
[     7.160] (II) intel(0): EDID vendor "GSM", prod id 23353
[     7.160] (II) intel(0): Using EDID range info for horizontal sync
[     7.160] (II) intel(0): Using EDID range info for vertical refresh
[     7.160] (II) intel(0): Printing DDC gathered Modelines:
[     7.160] (II) intel(0): Modeline "1920x1080"x0.0  148.50  1920
2008 2052 2200  1080 1084 1089 1125 +hsync +vsync (67.5 kHz eP)
[     7.160] (II) intel(0): Modeline "1920x1080"x0.0  185.60  1920
2008 2052 2200  1080 1084 1089 1125 +hsync +vsync (84.4 kHz e)
[     7.160] (II) intel(0): Modeline "1920x1080"x0.0  325.08  1920
1944 1976 2056  1080 1083 1088 1098 +hsync +vsync (158.1 kHz e)
[     7.160] (II) intel(0): Modeline "1920x1080"x0.0  285.50  1920
1968 2000 2080  1080 1083 1088 1144 +hsync +vsync (137.3 kHz e)
[     7.160] (II) intel(0): Modeline "1920x1080"x0.0  235.50  1920
1968 2000 2080  1080 1083 1088 1133 -hsync -vsync (113.2 kHz e)
[     7.160] (II) intel(0): Modeline "640x480"x0.0   25.18  640 656
752 800  480 490 492 525 -hsync -vsync (31.5 kHz e)
[     7.160] (II) intel(0): Modeline "720x480"x0.0   27.00  720 736
798 858  480 489 495 525 -hsync -vsync (31.5 kHz e)
[     7.160] (II) intel(0): Modeline "1280x720"x0.0   74.25  1280 1390
1430 1650  720 725 730 750 +hsync +vsync (45.0 kHz e)
[     7.160] (II) intel(0): Modeline "720x576"x0.0   27.00  720 732
796 864  576 581 586 625 -hsync -vsync (31.2 kHz e)
[     7.160] (II) intel(0): Modeline "1280x720"x0.0   74.25  1280 1720
1760 1980  720 725 730 750 +hsync +vsync (37.5 kHz e)
[     7.160] (II) intel(0): Modeline "1920x1080"x0.0  148.50  1920
2448 2492 2640  1080 1084 1089 1125 +hsync +vsync (56.2 kHz e)
[     7.160] (II) intel(0): Modeline "1920x1080"x0.0  297.00  1920
2008 2052 2200  1080 1084 1089 1125 +hsync +vsync (135.0 kHz e)
[     7.160] (II) intel(0): Modeline "1920x1080"x0.0  297.00  1920
2448 2492 2640  1080 1084 1094 1125 +hsync +vsync (112.5 kHz e)
[     7.160] (II) intel(0): Modeline "800x600"x0.0   40.00  800 840
968 1056  600 601 605 628 +hsync +vsync (37.9 kHz e)
[     7.160] (II) intel(0): Modeline "640x480"x0.0   31.50  640 656
720 840  480 481 484 500 -hsync -vsync (37.5 kHz e)
[     7.160] (II) intel(0): Modeline "720x400"x0.0   28.32  720 738
846 900  400 412 414 449 -hsync +vsync (31.5 kHz e)
[     7.160] (II) intel(0): Modeline "1280x1024"x0.0  135.00  1280
1296 1440 1688  1024 1025 1028 1066 +hsync +vsync (80.0 kHz e)
[     7.160] (II) intel(0): Modeline "1024x768"x0.0   78.75  1024 1040
1136 1312  768 769 772 800 +hsync +vsync (60.0 kHz e)
[     7.160] (II) intel(0): Modeline "1024x768"x0.0   65.00  1024 1048
1184 1344  768 771 777 806 -hsync -vsync (48.4 kHz e)
[     7.160] (II) intel(0): Modeline "800x600"x0.0   49.50  800 816
896 1056  600 601 604 625 +hsync +vsync (46.9 kHz e)
[     7.160] (II) intel(0): Modeline "1152x864"x0.0  108.00  1152 1216
1344 1600  864 865 868 900 +hsync +vsync (67.5 kHz e)
[     7.160] (II) intel(0): Modeline "640x480"x120.0   52.41  640 680
744 848  480 481 484 515 -hsync +vsync (61.8 kHz e)
[     7.160] (II) intel(0): Modeline "800x600"x100.0   68.18  800 848
936 1072  600 601 604 636 -hsync +vsync (63.6 kHz e)
[     7.161] (II) intel(0): Modeline "800x600"x0.0   73.25  800 848
880 960  600 603 607 636 +hsync -vsync (76.3 kHz e)
[     7.161] (II) intel(0): Modeline "1024x768"x0.0  115.50  1024 1072
1104 1184  768 771 775 813 +hsync -vsync (97.6 kHz e)
[     7.161] (II) intel(0): Modeline "1280x960"x100.0  178.99  1280
1376 1520 1760  960 961 964 1017 -hsync +vsync (101.7 kHz e)
[     7.161] (II) intel(0): Modeline "1280x1024"x0.0  108.00  1280
1328 1440 1688  1024 1025 1028 1066 +hsync +vsync (64.0 kHz e)
[     7.161] (II) intel(0): Modeline "1280x1024"x0.0  187.25  1280
1328 1360 1440  1024 1027 1034 1084 +hsync -vsync (130.0 kHz e)
[     7.161] (II) intel(0): Modeline "1440x900"x0.0  182.75  1440 1488
1520 1600  900 903 909 953 +hsync -vsync (114.2 kHz e)

-------------------------------------------------------------------------------------------------------------------
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

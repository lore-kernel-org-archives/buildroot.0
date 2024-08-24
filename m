Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7D7CC52D6F
	for <buildroot@archiver.kernel.org>; Sat, 24 Aug 2024 04:35:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4B28281E4B;
	Sat, 24 Aug 2024 04:35:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uzzr_Na4o-Ao; Sat, 24 Aug 2024 04:35:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3996481E40
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3996481E40;
	Sat, 24 Aug 2024 04:35:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E60101BF28A
 for <buildroot@lists.busybox.net>; Sat, 24 Aug 2024 04:35:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D2AFB60610
 for <buildroot@lists.busybox.net>; Sat, 24 Aug 2024 04:35:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6sKaKq9fDO5M for <buildroot@lists.busybox.net>;
 Sat, 24 Aug 2024 04:35:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.238.66.15;
 helo=helium.openadk.org; envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3F87960609
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3F87960609
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3F87960609
 for <buildroot@buildroot.org>; Sat, 24 Aug 2024 04:35:50 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 2BFA53536963; Sat, 24 Aug 2024 06:35:48 +0200 (CEST)
Date: Sat, 24 Aug 2024 06:35:48 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <ZsljJIQp/OutgfPV@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 5.10.0-31-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1724474148; bh=07aTjHuBnFa2+BNEUJPOjjpAGz4/JeI204WtUwvOTXQ=;
 h=Date:From:To:Subject:From;
 b=EeW1oPWKJuFt7Kj54VAjVqcRkmh5EYEfqVkQyuBVJ/tmKJVUeRjDwshVf6QlOykQc
 KEfVdgtmeiVcLUwT79FLCJw3hbQnai9YYMByUOExlqsbDMXNUZRmkoQAFN+pSvS/iK
 3UG2b6IEcbfsAWPqn7Zc9Ju6qPDXqGe5bFFOUmDui0+w9+X7aFXyHQGIKsIGAX+lYw
 7ae8zyjsX7y3wuyrtA0daQq51kRMRKvsOI8AiTocgeY5t6xQlHE6mjIeCkucTTqNXz
 eSLobIF1xf0CB1OUchbEyh0U2mZGYWMKVpwoP5hId192XMVYJrJG3U1Fm7/39YR6UF
 XXgShO2P94glw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256
 header.s=2022 header.b=EeW1oPWK
Subject: [Buildroot] Xorg on RPI5
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

Hi,

does anyone use Xorg on RPI5?

I activated the vc4-kms-v3d-pi5 overlay in config.txt.
I have a /dev/dri directory on the device.
I am using Buildroot next branch.

But Xorg fails to start.

# cat /var/log/Xorg.0.log 
[   756.753] 
X.Org X Server 1.21.1.11
X Protocol Version 11, Revision 0
[   756.753] Current Operating System: Linux buildroot 6.6.28-v8-16k #1 SMP PREEMPT Fri Aug 23 10:05:16 CEST 2024 aarch64
[   756.753] Kernel command line: reboot=w coherent_pool=1M 8250.nr_uarts=1 pci=pcie_bus_safe snd_bcm2835.enable_compat_alsa=0 snd_bcm2835.enable_hdmi=1  smsc95xx.macaddr=D8:3A:DD:E2:F0:05 vc_mem.mem_base=0x3fc00000 vc_mem.mem_size=0x40000000  root=/dev/mmcblk0p2 rootwait console=tty1 console=ttyAMA10,115200
[   756.753]  
[   756.753] Current version of pixman: 0.42.2
[   756.753] 	Before reporting problems, check http://wiki.x.org
	to make sure that you have the latest version.
[   756.753] Markers: (--) probed, (**) from config file, (==) default setting,
	(++) from command line, (!!) notice, (II) informational,
	(WW) warning, (EE) error, (NI) not implemented, (??) unknown.
[   756.753] (==) Log file: "/var/log/Xorg.0.log", Time: Thu Jan  1 00:34:46 1970
[   756.753] (==) Using system config directory "/usr/share/X11/xorg.conf.d"
[   756.753] (==) No Layout section.  Using the first Screen section.
[   756.753] (==) No screen section available. Using defaults.
[   756.753] (**) |-->Screen "Default Screen Section" (0)
[   756.753] (**) |   |-->Monitor "<default monitor>"
[   756.754] (==) No monitor specified for screen "Default Screen Section".
	Using a default monitor configuration.
[   756.754] (==) Automatically adding devices
[   756.754] (==) Automatically enabling devices
[   756.754] (==) Automatically adding GPU devices
[   756.754] (==) Automatically binding GPU devices
[   756.754] (==) Max clients allowed: 256, resource mask: 0x1fffff
[   756.754] (WW) The directory "/usr/share/fonts/X11//TTF/" does not exist.
[   756.754] 	Entry deleted from font path.
[   756.754] (WW) The directory "/usr/share/fonts/X11//OTF/" does not exist.
[   756.754] 	Entry deleted from font path.
[   756.754] (WW) The directory "/usr/share/fonts/X11//Type1/" does not exist.
[   756.754] 	Entry deleted from font path.
[   756.754] (==) FontPath set to:
	/usr/share/fonts/X11//misc/,
	/usr/share/fonts/X11//100dpi/,
	/usr/share/fonts/X11//75dpi/
[   756.754] (==) ModulePath set to "/usr/lib/xorg/modules"
[   756.754] (II) The server relies on udev to provide the list of input devices.
	If no devices become available, reconfigure udev or disable AutoAddDevices.
[   756.754] (II) Loader magic: 0x55588d8010
[   756.754] (II) Module ABI versions:
[   756.754] 	X.Org ANSI C Emulation: 0.4
[   756.754] 	X.Org Video Driver: 25.2
[   756.754] 	X.Org XInput driver : 24.4
[   756.754] 	X.Org Server Extension : 10.0
[   756.754] (II) xfree86: Adding drm device (/dev/dri/card0)
[   756.754] (II) Platform probe for /sys/devices/platform/axi/1002000000.v3d/drm/card0
[   756.754] (II) xfree86: Adding drm device (/dev/dri/card1)
[   756.754] (II) Platform probe for /sys/devices/platform/axi/axi:gpu/drm/card1
[   756.762] (II) no primary bus or device found
[   756.762] 	falling back to /sys/devices/platform/axi/1002000000.v3d/drm/card0
[   756.762] (==) Matched modesetting as autoconfigured driver 0
[   756.762] (==) Matched fbdev as autoconfigured driver 1
[   756.762] (==) Assigned the driver to the xf86ConfigLayout
[   756.762] (II) LoadModule: "modesetting"
[   756.762] (II) Loading /usr/lib/xorg/modules/drivers/modesetting_drv.so
[   756.762] (II) Module modesetting: vendor="X.Org Foundation"
[   756.762] 	compiled for 1.21.1.11, module version = 1.21.1
[   756.762] 	Module class: X.Org Video Driver
[   756.762] 	ABI class: X.Org Video Driver, version 25.2
[   756.762] (II) LoadModule: "fbdev"
[   756.762] (II) Loading /usr/lib/xorg/modules/drivers/fbdev_drv.so
[   756.762] (EE) Failed to load /usr/lib/xorg/modules/drivers/fbdev_drv.so: /usr/lib/xorg/modules/drivers/fbdev_drv.so: undefined symbol: fbdevHWSave
[   756.762] (EE) Failed to load module "fbdev" (loader failed, 0)
[   756.762] (II) modesetting: Driver for Modesetting Kernel Drivers: kms
[   756.763] (++) using VT number 1

[   756.763] (WW) Falling back to old probe method for modesetting
[   756.763] (WW) Falling back to old probe method for modesetting
[   756.775] (II) modeset(G0): using drv /dev/dri/card1
[   756.775] (EE) No devices detected.
[   756.775] (EE) 
Fatal server error:
[   756.775] (EE) no screens found(EE) 
[   756.775] (EE) 
Please consult the The X.Org Foundation support 
	 at http://wiki.x.org
 for help. 
[   756.775] (EE) Please also check the log file at "/var/log/Xorg.0.log" for additional information.
[   756.775] (EE) 
[   756.816] (EE) Server terminated with error (1). Closing log file.

ls -la /dev/dri/
total 0
drwxr-xr-x    3 root     root           120 Jan  1 00:22 .
drwxr-xr-x   13 root     root          3640 Jan  1 00:22 ..
drwxr-xr-x    2 root     root           100 Jan  1 00:22 by-path
crw-rw----    1 root     video     226,   0 Jan  1 00:22 card0
crw-rw----    1 root     video     226,   1 Jan  1 00:22 card1
crw-rw-rw-    1 root     video     226, 128 Jan  1 00:22 renderD128

I am using busybox init, not systemd.

Anyone have an idea?

best regards
 Waldemar


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

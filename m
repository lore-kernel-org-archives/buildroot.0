Return-Path: <SRS0=tQX8=NU=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67FF1C432BE
	for <buildroot@archiver.kernel.org>; Sun, 29 Aug 2021 03:10:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E388360C40
	for <buildroot@archiver.kernel.org>; Sun, 29 Aug 2021 03:10:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E388360C40
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=steinkuehler.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A8A0C40402;
	Sun, 29 Aug 2021 03:10:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QAHHZrI4eTIu; Sun, 29 Aug 2021 03:10:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D4A6A40406;
	Sun, 29 Aug 2021 03:10:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7D3041BF963
 for <buildroot@lists.busybox.net>; Sun, 29 Aug 2021 03:10:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6939580DB2
 for <buildroot@lists.busybox.net>; Sun, 29 Aug 2021 03:10:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zu4t18_VChRJ for <buildroot@lists.busybox.net>;
 Sun, 29 Aug 2021 03:10:26 +0000 (UTC)
X-Greylist: delayed 00:06:41 by SQLgrey-1.8.0
Received: from mail.steinkuehler.net (unknown [70.184.225.181])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4C64280D7F
 for <buildroot@busybox.net>; Sun, 29 Aug 2021 03:10:26 +0000 (UTC)
Received: (qmail 21615 invoked from network); 28 Aug 2021 22:03:42 -0500
Received: from 152.ks.newtek.dhcp (HELO ?10.34.1.152?) (charles@10.34.1.152)
 by mail.steinkuehler.net with SMTP; 28 Aug 2021 22:03:42 -0500
To: buildroot@busybox.net
From: Charles Steinkuehler <charles@steinkuehler.net>
Message-ID: <f3bef982-d139-cd08-2477-33383a5d67ca@steinkuehler.net>
Date: Sat, 28 Aug 2021 22:03:40 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
Content-Language: en-US
Subject: [Buildroot] EGLFS Could Not Find DRM Device!
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

> Hello Scott,
> 
> On Wed, 18 Aug 2021 20:28:12 +0000, Scott Bartolett <SBartolett at thorlabs.com> wrote:
> 
>> Yes I have the BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTB_OVERLAYS enabled and rpi-firmware/overlays entry in genimage.  If I search the buildroot output folder I find this:
>>
>> ./output/images/rpi-firmware/overlays/vc4-kms-v3d.dtbo
>> ./output/images/rpi-firmware/overlays/vc4-kms-v3d-pi4.dtbo
>> ./output/build/rpi-firmware-1a46874494146f470d7a61b0b6f4f15a07dd8b35/boot/overlays/vc4-kms-v3d.dtbo
>> ./output/build/rpi-firmware-1a46874494146f470d7a61b0b6f4f15a07dd8b35/boot/overlays/vc4-kms-v3d-pi4.dtbo
>>
>> But I do not find those files anywhere on the target machine.  I am using a root file system overlay.  Might that be my problem?
> 
> The overlays are stored in the first/boot partition (vfat one where the dtb files,
> config.txt and cmdline.txt, bootcode.bin and start.elf and fixup.dat and zimage
> are found) and not on the second/root (ext4 one with the complte root file system)
> partition of the SD card...

Sorry to jump in, I'm new to Buildroot and this list but I am having the 
same issue: Using a RPi4 with the latest buildroot (master pulled from 
git) and no /dev/dri/ devices show up even though config.txt contains:

    dtoverlay=vc4-kms-v3d-pi4

...and the overlay files are present on the first (vfat) partition.

I started with the raspberrypi4_64_defconfig, switched to glibc, and 
added a few packages (mesa, kmscube, SDL2).

On a whim I switched init from the busybox default to systemd (which 
also pulled in udev), and *PRESTO* I now have a /dev/dri/ folder with 
devices (after once again adding the config.txt dtoverly line for the 
kms driver)!

Is there any documentation about the minimum environment needed to get 
the vc4-kms drivers running?  Do I need full systemd/udev, is mdev 
enough, or should devtmpfs be working but perhaps I'm missing something 
else in the rootfs image?  Is init maybe the problem vs. /dev handling?

-- 
Charles Steinkuehler
charles@steinkuehler.net
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot

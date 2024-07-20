Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2D95C3DA59
	for <buildroot@archiver.kernel.org>; Sat, 20 Jul 2024 12:34:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 62F5D6062C;
	Sat, 20 Jul 2024 12:34:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2GGboqVh16xP; Sat, 20 Jul 2024 12:34:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7E9F06062F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7E9F06062F;
	Sat, 20 Jul 2024 12:34:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5C4B31BF3F9
 for <buildroot@lists.busybox.net>; Sat, 20 Jul 2024 12:34:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5442C4059F
 for <buildroot@lists.busybox.net>; Sat, 20 Jul 2024 12:34:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cFdWwHIWkoZI for <buildroot@lists.busybox.net>;
 Sat, 20 Jul 2024 12:34:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.15;
 helo=mout.gmx.net; envelope-from=frank-w@public-files.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B41484059B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B41484059B
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B41484059B
 for <buildroot@buildroot.org>; Sat, 20 Jul 2024 12:34:22 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [217.61.156.75] ([217.61.156.75]) by web-mail.gmx.net
 (3c-app-gmx-bs02.server.lan [172.19.170.51]) (via HTTP); Sat, 20 Jul 2024
 14:34:20 +0200
MIME-Version: 1.0
Message-ID: <trinity-5c5ad72e-281b-4354-bf44-2eae6f8ae579-1721478860307@3c-app-gmx-bs02>
To: buildroot@buildroot.org
Date: Sat, 20 Jul 2024 14:34:20 +0200
Importance: normal
Sensitivity: Normal
X-Priority: 3
X-Provags-ID: V03:K1:3mq3qR9MyWXltNXuNhkSydmeiWzKC0FIy0X2ZlvWZW7yBInTlYVIc73USUYySmmjr0PBd
 ApVOuzhAYghjT69vgyKUp+3XLxb4vK1+SfadvN7FCgTYmHRYLP2NHes9xqmb+ArGsqlIlF58RAEV
 pStOZl+bEH3jspE6FmslRgymwmX86WSzVOU9PpWyZZDwsTupoLlyeEfEwIJJWz8FZ2tT2mPdI9rc
 vY5qyQAQwLNIVfsT3gbqI0seFM7UqjSuu34FA/BnQ/I18EKTqr8V4JyLcjkICj9SByOvMr04qO8y
 Zc=
UI-OutboundReport: notjunk:1;M01:P0:VR8SVPqS4Cw=;7m7HBTz3uHuoT40IhmEDUJ5guVw
 AlHhr8Z+b4uKBidm2LYDDWo0eSYvXVvTDBykzL45coOSKNyAdUl77mwD6WojlTXQ5Xl2cDCSw
 NG8Rt5lADfMBpNsUhnP9wS8aGBOA7gzMoVVYm9KSg0VocnZo4yGld3n2zKo4m6K/0V2+rDYYa
 8bfmKUq7sK5gN/6IGOSvgqxYUE0SraBFBqZwwxkmpslD3mRz29AgNU/XbTz2j2H3xpSg/vLog
 JqQjAZwCdD3jtQfaNZ9T8gR7V6TDHuCJjO4bSyf1I06seWrteqgWI/+kp1QFzZ0SPFLVjvUCf
 1f3RkFDkYgmD85kpPSAwLSLHE58DvkiDpUE/fNTeHc6Bsjn/sPakKjfxOJ6tXp9E/5rq6hUso
 mDEn0ylu2vWNBVqgSUW5NkWEVLTv/Wl+yyRv5BUhEoCOTszkV6wLfERHF8DVQkZLeQlSSlt1l
 EckgWRSP5a9Q13GdVh5IuVrWbsyTwYH3P4OEYxiwgFMWuq7rEkjmAoUp+Q8MfTTmgLS6a3tAh
 dJP23PeECjBZTofCf3PsATOQzc5Ow/LEBdyRofV3DBvHsNttXd4HsMfLdMjvzgFKUepoHXrN8
 CmkfxVJdYiqQ9hnmmEMKDwCXhMu3VfCt83IIhF9iXDs7h15ezyHMDwzAEsIXa+SreaYlM7HWY
 xE5KUpdtu453zkv8DSvMP9zolngNMNHyP2ixUbVmTQ==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=public-files.de; 
 s=s31663417; t=1721478860; x=1722083660; i=frank-w@public-files.de;
 bh=xMePxC8lpgovHCK7eOA2rwgV2HEr4AbeEi6HJz5N1Ck=;
 h=X-UI-Sender-Class:MIME-Version:Message-ID:From:To:Subject:
 Content-Type:Date:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=OhYbbU8ctguu5WF+ry2qT1tpjpaGMJC1R366vV9DkqHAd86a1BgqvurJa8xWtZep
 Wn1qMlszD36rKkr7nDUGTbHgZGItABewCDQKULVwYpaDxaTdLw7+KXob6/Lef67Yu
 XOtUbsbLirPUhb7w+JEfG5XGaf/jz6ok83zEWnwYoCnrYirXh5lVXQ0HGy86puQ8D
 n278F1yrw4cdkj4rWuOfzrdCa2H8hoK9EEi447i99wQZjd/QkMo3ajHXtvJRYckqr
 JCfcyhw7/7WuQ8elxBMdkOLFXe1QjGKaf/ikddBnpLlmd7Z+W8bGf2lmZgtGt7ty1
 9P7YpNVhpKMDZu3Nlg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=public-files.de
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=public-files.de header.i=frank-w@public-files.de
 header.a=rsa-sha256 header.s=s31663417 header.b=OhYbbU8c
Subject: [Buildroot] lvm2 seems to require systemd
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
From: Frank Wunderlich via buildroot <buildroot@buildroot.org>
Reply-To: Frank Wunderlich <frank-w@public-files.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi,

i try to build a buildroot (2024.05) initrd with lvm2 support

so basicly added these options:

#to select BR2_PACKAGE_HAS_UDEV
BR2_PACKAGE_EUDEV=y
BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
BR2_PACKAGE_LIBBLOCKDEV=y
BR2_PACKAGE_LVM2=y

build is fine, but i see this while bootup:

[    3.665010] udevd[1520]: failed to execute '/usr/bin/systemd-run' '/usr/bin/systemd-run --no-block --property DefaultDependencies=
no --unit lvm-activate-vg-nvme /usr/sbin/lvm vgchange -aay --autoactivation event vg-nvme': No such file or directory
done

i see the physical volume, but logical volumes are disabled

# pvscan
  PV /dev/nvme0n1p5   VG vg-nvme   lvm2 [<1.79 TiB / <1.78 TiB free]
  Total: 1 [<1.79 TiB] / in use: 1 [<1.79 TiB] / in no VG: 0 [0   ]
# vgscan
  Found volume group "vg-nvme" using metadata type lvm2
# lvscan
  inactive          '/dev/vg-nvme/var' [10.00 GiB] inherit

and so i cannot mount the logical volume

# mount /dev/vg-nvme/var /mnt
[  281.006375] /dev/vg-nvme/var: Can't lookup blockdev
[  281.011279] /dev/vg-nvme/var: Can't lookup blockdev
[  281.016202] /dev/vg-nvme/var: Can't lookup blockdev
[  281.021080] /dev/vg-nvme/var: Can't lookup blockdev
mount: mounting /dev/vg-nvme/var on /mnt failed: No such file or directory

any ideas?

regards Frank

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5381C3DA5D
	for <buildroot@archiver.kernel.org>; Sun, 21 Jul 2024 17:58:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 51DEE605DE;
	Sun, 21 Jul 2024 17:58:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EzJpstoQxHgs; Sun, 21 Jul 2024 17:58:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2828160602
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2828160602;
	Sun, 21 Jul 2024 17:58:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CB2A21BF2C3
 for <buildroot@lists.busybox.net>; Sun, 21 Jul 2024 17:58:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C575881000
 for <buildroot@lists.busybox.net>; Sun, 21 Jul 2024 17:58:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JbD0BfqlMlEA for <buildroot@lists.busybox.net>;
 Sun, 21 Jul 2024 17:58:43 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=176.9.89.163;
 helo=serv15.avernis.de; envelope-from=br015@umbiko.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3DB3180FFB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3DB3180FFB
Received: from serv15.avernis.de (serv15.avernis.de [176.9.89.163])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3DB3180FFB
 for <buildroot@buildroot.org>; Sun, 21 Jul 2024 17:58:41 +0000 (UTC)
Received: by serv15.avernis.de (Postfix) with ESMTPSA id 68E97BDE88AD;
 Sun, 21 Jul 2024 19:58:38 +0200 (CEST)
MIME-Version: 1.0
Date: Sun, 21 Jul 2024 17:58:38 +0000
From: Andreas Ziegler <br015@umbiko.net>
To: Frank Wunderlich <frank-w@public-files.de>
In-Reply-To: <trinity-8bdeb9c9-9a2d-407f-80d0-c4bc0847cb82-1721577033740@3c-app-gmx-bap52>
References: <mailman.12142.1721505316.24059.buildroot@buildroot.org>
 <f49923df9029dfb3217cb858d0be4f69@umbiko.net>
 <trinity-cf5cdaab-cad5-4928-9dea-541742606976-1721555640184@3c-app-gmx-bap52>
 <e00d6149cbd2bd2a5a672fcf0323c814@umbiko.net>
 <trinity-8bdeb9c9-9a2d-407f-80d0-c4bc0847cb82-1721577033740@3c-app-gmx-bap52>
Message-ID: <72a472b4614bd2ca6c652bfd6a2c171b@umbiko.net>
X-Sender: br015@umbiko.net
X-Virus-Scanned: clamav-milter 1.0.5 at serv15.avernis.de
X-Virus-Status: Clean
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=umbiko.net; s=mail; 
 t=1721584718; bh=9yJjy9eJoFw9ISsdvKbKC7IgylcNbKvD/GxefyQ/o7E=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References;
 b=HNAPFeTjhUnnc61mylaiS3TCQRxRvYcvPH2fykMTGBUdJ0CcpqW04V/9+MIae92Hh
 WQG8t+LZBqI54vED7pTt9/FfT60BxuV3QDaIt1IG38yyb3OVy1fnt/RWg9dItrIPhH
 mx3awI0PXRDtWw5wkNgwsqmpnhGeV2pZ7XIjUaeY=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=umbiko.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=umbiko.net header.i=@umbiko.net header.a=rsa-sha256
 header.s=mail header.b=HNAPFeTj
Subject: Re: [Buildroot] lvm2 seems to require systemd
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
Cc: buildroot <buildroot@buildroot.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Frank,

On 2024-07-21 15:50, Frank Wunderlich wrote:
> Hi Andreas
> 
> noticed some errors when calling the vgchange command
> 
> # /usr/sbin/lvm vgchange -aay --autoactivation event vg-nvme
>   1 logical volume(s) in volume group "vg-nvme" now active
> [ 8023.796866] udevd[1614]: failed to execute '/usr/sbin/blkid' 
> '/usr/sbin/blkid -o udev -p /dev/dm-0': No such file or directory
> [ 8023.808977] udevd[1610]: conflicting device node 
> '/dev/mapper/vg--nvme-var' found, link to '/dev/dm-0' will not be 
> created
> # lvscan
>   ACTIVE            '/dev/vg-nvme/var' [10.00 GiB] inherit

Your execution of vgchange triggers additional udev messages, that are 
not handled correctly. Try to find out what is missing and add it to 
your image; blkid, for example, is part of package util-linux.

The double-dash in vg--nvme-var looks strange: is this intentional?

> but i'm able to mount it
> 
> # mkdir /mnt/var
> # mount /dev/mapper/vg--nvme-var /mnt/var/
> [ 8514.687803] EXT4-fs (dm-0): mounted filesystem 
> be8b31d6-96e2-43a1-8416-a058972118b3 r/w with ordered data mode. Quota 
> mode: disabled.
> # ls /mnt/var
> cache       lib         log         lost+found  run         tmp
> #
> 
> how can i test the script? currently i'm in the initrd, so changing 
> anything will be lost on reboot, so i want to test the script before 
> putting it into the initrd.

I usually mount the target's file system via ssh://root@hostname in a 
file browser; that allows me to copy to and from the target machine. 
Script and configuration changes are made directly on the target system, 
and copied back to the development machine when everything runs 
satisfactorily.

> as far as i see the original call via udev contains some 
> systemd-specific params and environment-vars i do not know currently

They are probably safe to ignore; when in doubt, consult the systemd 
documentation. Evironment variables are extensively used within the udev 
context; I doubt that the called lvm2 tool makes use of them.

Kind regards,
Andreas

> 
> regards Frank
> 
> 
>> Gesendet: Sonntag, 21. Juli 2024 um 12:16 Uhr
>> Von: "Andreas Ziegler" <br015@umbiko.net>
>> An: "Frank Wunderlich" <frank-w@public-files.de>
>> Cc: "buildroot" <buildroot@buildroot.org>
>> Betreff: Re: Aw: Re: lvm2 seems to require systemd
>> 
>> Hi Frank,
>> 
>> On 2024-07-21 09:54, Frank Wunderlich wrote:
>> > regards Frank
>> >
>> >
>> >> Gesendet: Sonntag, 21. Juli 2024 um 11:17 Uhr
>> >> Von: "Andreas Ziegler" <br015@umbiko.net>
>> >> An: frank-w@public-files.de
>> >> Cc: "buildroot" <buildroot@buildroot.org>
>> >> Betreff: Re: lvm2 seems to require systemd
>> >>
>> >> Hi Frank,
>> >>
>> >> On 2024-07-20 14:34, Frank Wunderlich wrote:
>> >> > Hi,
>> >> >
>> >> > i try to build a buildroot (2024.05) initrd with lvm2 support
>> >> >
>> >> > so basicly added these options:
>> >> >
>> >> > #to select BR2_PACKAGE_HAS_UDEV
>> >> > BR2_PACKAGE_EUDEV=y
>> >> > BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
>> >> > BR2_PACKAGE_LIBBLOCKDEV=y
>> >> > BR2_PACKAGE_LVM2=y
>> >> >
>> >> > build is fine, but i see this while bootup:
>> >> >
>> >> > [    3.665010] udevd[1520]: failed to execute '/usr/bin/systemd-run'
>> >> > '/usr/bin/systemd-run --no-block --property DefaultDependencies=
>> >> > no --unit lvm-activate-vg-nvme /usr/sbin/lvm vgchange -aay
>> >> > --autoactivation event vg-nvme': No such file or directory
>> >> > done
>> >>
>> >> lvm2 installs a bunch of udev rules; one of them relies on systemd-run
>> >> to execute a command in the background:
>> >>
>> >> # pvscan will check if this device completes a VG,
>> >> # i.e. all PVs in the VG are now present with the
>> >> # arrival of this PV.  If so, it prints to stdout:
>> >> # LVM_VG_NAME_COMPLETE='foo'
>> >> #
>> >> # When the VG is complete it can be activated, so
>> >> # vgchange -aay <vgname> is run.  It is run via
>> >> # systemd since it can take longer to run than
>> >> # udev wants to block when processing rules.
>> >> # (if there are hundreds of LVs to activate,
>> >> # the vgchange can take many seconds.)
>> >>
>> >> ...
>> >>
>> >> IMPORT{program}="/usr/sbin/lvm pvscan --cache --listvg --checkcomplete
>> >> --vgonline --autoactivation event --udevoutput --journal=output
>> >> $env{DEVNAME}"
>> >> ENV{LVM_VG_NAME_COMPLETE}=="?*", RUN+="/usr/bin/systemd-run --no-block
>> >> --property DefaultDependencies=no --unit
>> >> lvm-activate-$env{LVM_VG_NAME_COMPLETE} /usr/sbin/lvm vgchange -aay
>> >> --autoactivation event $env{LVM_VG_NAME_COMPLETE}"
>> >> GOTO="lvm_end"
>> >>
>> >> > i see the physical volume, but logical volumes are disabled
>> >> >
>> >> > # pvscan
>> >> >   PV /dev/nvme0n1p5   VG vg-nvme   lvm2 [<1.79 TiB / <1.78 TiB free]
>> >> >   Total: 1 [<1.79 TiB] / in use: 1 [<1.79 TiB] / in no VG: 0 [0   ]
>> >> > # vgscan
>> >> >   Found volume group "vg-nvme" using metadata type lvm2
>> >> > # lvscan
>> >> >   inactive          '/dev/vg-nvme/var' [10.00 GiB] inherit
>> >> >
>> >> > and so i cannot mount the logical volume
>> >> >
>> >> > # mount /dev/vg-nvme/var /mnt
>> >> > [  281.006375] /dev/vg-nvme/var: Can't lookup blockdev
>> >> > [  281.011279] /dev/vg-nvme/var: Can't lookup blockdev
>> >> > [  281.016202] /dev/vg-nvme/var: Can't lookup blockdev
>> >> > [  281.021080] /dev/vg-nvme/var: Can't lookup blockdev
>> >> > mount: mounting /dev/vg-nvme/var on /mnt failed: No such file or
>> >> > directory
>> >> >
>> >> > any ideas?
>> >>
>> >> I would try to run vgchange manually to see if the setup works at all,
>> >> then create a /usr/bin/systemd-run script that is able to execute
>> >> commands in the background. Something like this (untested):
>> >
>> > i was able to manually initialize the lvm value after adding the
>> > systemd without init (running the command without prefix
>> > "systemd-run")...
>> >
>> > basicly with this command:
>> >
>> > /usr/sbin/lvm vgchange -aay --autoactivation event vg-nvme
>> >
>> > with init i had compile issues missing libmount, see my followup post
>> >
>> > now i have to remove systems from my initrd somehow to do further
>> > testing with only the eudev. any idea doing this without making all
>> > clear (or is this dropped when recreating the cpio file)?
>> 
>> Without running make clean, unwanted files need to be removed 
>> manually.
>> Buildroot creates per-package logs .files-list,
>> .files-list-{host,images,staging}, which contain the names of files
>> copied to the respective destination. Remove at least those from
>> .files-list to revert to a system without the package; preferrably 
>> also
>> those from .files-list-staging.
>> 
>> Kind regards,
>> Andreas
>> 
>> >
>> >>    #!/bin/sh
>> >>    prg=$1
>> >>    shift
>> >>    (
>> >>      $prg $@ < /dev/zero > /tmp/error.log 2>&1
>> >>    )&
>> >
>> >> Kind regards,
>> >> Andreas
>> >>
>> >> > regards Frank
>> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

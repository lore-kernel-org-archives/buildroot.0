Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13DCCC3DA5D
	for <buildroot@archiver.kernel.org>; Sun, 21 Jul 2024 15:55:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7BF0D80B7E;
	Sun, 21 Jul 2024 15:55:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gtq_s9TXTeH9; Sun, 21 Jul 2024 15:55:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 30DA280B52
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 30DA280B52;
	Sun, 21 Jul 2024 15:55:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 307641BF2CA
 for <buildroot@lists.busybox.net>; Sun, 21 Jul 2024 15:55:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 284F5605F0
 for <buildroot@lists.busybox.net>; Sun, 21 Jul 2024 15:55:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wUyTpX4CQR35 for <buildroot@lists.busybox.net>;
 Sun, 21 Jul 2024 15:55:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.22;
 helo=mout.gmx.net; envelope-from=frank-w@public-files.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 95D4B605E0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 95D4B605E0
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 95D4B605E0
 for <buildroot@buildroot.org>; Sun, 21 Jul 2024 15:55:46 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [80.245.75.169] ([80.245.75.169]) by web-mail.gmx.net
 (3c-app-gmx-bap52.server.lan [172.19.172.122]) (via HTTP); Sun, 21 Jul 2024
 17:50:33 +0200
MIME-Version: 1.0
Message-ID: <trinity-8bdeb9c9-9a2d-407f-80d0-c4bc0847cb82-1721577033740@3c-app-gmx-bap52>
To: Andreas Ziegler <br015@umbiko.net>
Date: Sun, 21 Jul 2024 17:50:33 +0200
Importance: normal
Sensitivity: Normal
In-Reply-To: <e00d6149cbd2bd2a5a672fcf0323c814@umbiko.net>
References: <mailman.12142.1721505316.24059.buildroot@buildroot.org>
 <f49923df9029dfb3217cb858d0be4f69@umbiko.net>
 <trinity-cf5cdaab-cad5-4928-9dea-541742606976-1721555640184@3c-app-gmx-bap52>
 <e00d6149cbd2bd2a5a672fcf0323c814@umbiko.net>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:c6vBfY+/jqbhRA376tRcRorAKyNuAochFksIIFsLUDuDi6chb5zIGeC5++VFJdUUyOAWV
 cbVzM3NFdIXd+lsSP5iy8hs1pIfhkZ5cHw1bv4yapcziaK1dL6bQz/GlbblbK9ZesiqkyWHB7Uo/
 ET+tTdYY4nvNRWWq4SXifX4Cz+S9jPksFCt7FGnpOnNdXjaKPaKyjVumm0rUNSespT9V84K4SNhI
 Ob2TrQ2uX3x9uBAoWfZXwT9jFwUDvOVyCJxzYcNqxWHv+ehCJqgtSxCnPZnNpmUputK9cDWOCJAl
 IA=
UI-OutboundReport: notjunk:1;M01:P0:YaHBiPlUo28=;8GFJ7B7OdUiV+3FRzUcWfHS5TZJ
 Tu2oPOQ76KIb1ZOtNJjSneUwwQnD6V/9wiXKe9APxf6B/Y5aY3DxyduG9NzwhSEukb0/+7Jpk
 xAlZRNpx+t7xdpTrZi2xVvl9IofHwURUeDBuxUglW/cKYu2hvEXAKnb3bmlwuXy6eSRYrvQDd
 fsMmP14t2K0YoNYFSprxjOxl/w1kpiYg51pqgdcFiiJE4IXiRUVjpBx5O64zO1ue/CTJzojhK
 7KHdiMFAeUyTnVLzSdp4UpumQur7c4Xui9/BmSqU8PA1v8/9RYql8eTGqpJHxCoKYY/qFYB2q
 2S7aAFu4xXoiE8FZ/vRaWQZu+cWTUdd0+DbLEfhzfj0oTOGUmpakbj/mX+HkCpLclFhZjw4+8
 fkQ79YLFkRNUClaENIOXDpdTo2okk+G3LSyWjq+7p7pV9T9JnyhAV07wAhM5GOVzxVRjSDqOu
 h40GV+JwhWzX97Sj0IWxdwRKqzpd4IQ/d5iPbNjOJH4Tps9CouYSxebvvrRh++VIVGxyBXJle
 3A2idQyhq03MTTCKH1Uymt6ltKEVMaosD0Qit5zH+GGCUnHUqcGbtf/NfdJ0I8zZFFVc9HNlt
 p097mP2ib0b4bOk+TFUsDmLuz68ahmpE3MIoaJpm4A1oiarHynZanbSiDcRpWL4yJ2qRE9cVF
 fwbQ0gMyG966YhbHBkYFhqXq7yDj1sFsMJ9sazRkBw==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=public-files.de; 
 s=s31663417; t=1721577343; x=1722182143; i=frank-w@public-files.de;
 bh=lZqwcXisbOPSIAePvOPaAdv9RzntFg0gHp7bmpBI3/A=;
 h=X-UI-Sender-Class:MIME-Version:Message-ID:From:To:Cc:Subject:
 Content-Type:Date:In-Reply-To:References:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=aGuz/auC71/P2IsXxrgX/4X4V07MoUxY4boVgHE8tpGQ36UKsc7sw5Dm6j/YRnDi
 gePd7NA0vqZzKnhzZ6+Rev5qUxKDRxIr0S+HZeGab3ivrWgZW/1EI+hE5T+3PltiU
 prqAInITAvAjmyel43I4QjtrF+CvdLdijoRvmDCwWgrtjgdJlhyhdauTHWqjj+8Cg
 89qgD8/AsxQYR1NxLurffHNZP0AaWdq091ryJEBvAHb3RCYAZrJ4K5pB2Pe7xr7jJ
 kBNKz2puV9aRApGcywHO7Sjrc1ZxkpXgvTpCGAW1FmbKCRwCi9PrDJVqWeiWsFqoI
 hAFckLZn4bVHwmgNZw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=public-files.de
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=public-files.de header.i=frank-w@public-files.de
 header.a=rsa-sha256 header.s=s31663417 header.b=aGuz/auC
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
From: Frank Wunderlich via buildroot <buildroot@buildroot.org>
Reply-To: Frank Wunderlich <frank-w@public-files.de>
Cc: buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Andreas

noticed some errors when calling the vgchange command

# /usr/sbin/lvm vgchange -aay --autoactivation event vg-nvme
  1 logical volume(s) in volume group "vg-nvme" now active
[ 8023.796866] udevd[1614]: failed to execute '/usr/sbin/blkid' '/usr/sbin/blkid -o udev -p /dev/dm-0': No such file or directory
[ 8023.808977] udevd[1610]: conflicting device node '/dev/mapper/vg--nvme-var' found, link to '/dev/dm-0' will not be created
# lvscan
  ACTIVE            '/dev/vg-nvme/var' [10.00 GiB] inherit

but i'm able to mount it

# mkdir /mnt/var
# mount /dev/mapper/vg--nvme-var /mnt/var/
[ 8514.687803] EXT4-fs (dm-0): mounted filesystem be8b31d6-96e2-43a1-8416-a058972118b3 r/w with ordered data mode. Quota mode: disabled.
# ls /mnt/var
cache       lib         log         lost+found  run         tmp
#

how can i test the script? currently i'm in the initrd, so changing anything will be lost on reboot, so i want to test the script before putting it into the initrd.
as far as i see the original call via udev contains some systemd-specific params and environment-vars i do not know currently

regards Frank


> Gesendet: Sonntag, 21. Juli 2024 um 12:16 Uhr
> Von: "Andreas Ziegler" <br015@umbiko.net>
> An: "Frank Wunderlich" <frank-w@public-files.de>
> Cc: "buildroot" <buildroot@buildroot.org>
> Betreff: Re: Aw: Re: lvm2 seems to require systemd
>
> Hi Frank,
>
> On 2024-07-21 09:54, Frank Wunderlich wrote:
> > regards Frank
> >
> >
> >> Gesendet: Sonntag, 21. Juli 2024 um 11:17 Uhr
> >> Von: "Andreas Ziegler" <br015@umbiko.net>
> >> An: frank-w@public-files.de
> >> Cc: "buildroot" <buildroot@buildroot.org>
> >> Betreff: Re: lvm2 seems to require systemd
> >>
> >> Hi Frank,
> >>
> >> On 2024-07-20 14:34, Frank Wunderlich wrote:
> >> > Hi,
> >> >
> >> > i try to build a buildroot (2024.05) initrd with lvm2 support
> >> >
> >> > so basicly added these options:
> >> >
> >> > #to select BR2_PACKAGE_HAS_UDEV
> >> > BR2_PACKAGE_EUDEV=y
> >> > BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
> >> > BR2_PACKAGE_LIBBLOCKDEV=y
> >> > BR2_PACKAGE_LVM2=y
> >> >
> >> > build is fine, but i see this while bootup:
> >> >
> >> > [    3.665010] udevd[1520]: failed to execute '/usr/bin/systemd-run'
> >> > '/usr/bin/systemd-run --no-block --property DefaultDependencies=
> >> > no --unit lvm-activate-vg-nvme /usr/sbin/lvm vgchange -aay
> >> > --autoactivation event vg-nvme': No such file or directory
> >> > done
> >>
> >> lvm2 installs a bunch of udev rules; one of them relies on systemd-run
> >> to execute a command in the background:
> >>
> >> # pvscan will check if this device completes a VG,
> >> # i.e. all PVs in the VG are now present with the
> >> # arrival of this PV.  If so, it prints to stdout:
> >> # LVM_VG_NAME_COMPLETE='foo'
> >> #
> >> # When the VG is complete it can be activated, so
> >> # vgchange -aay <vgname> is run.  It is run via
> >> # systemd since it can take longer to run than
> >> # udev wants to block when processing rules.
> >> # (if there are hundreds of LVs to activate,
> >> # the vgchange can take many seconds.)
> >>
> >> ...
> >>
> >> IMPORT{program}="/usr/sbin/lvm pvscan --cache --listvg --checkcomplete
> >> --vgonline --autoactivation event --udevoutput --journal=output
> >> $env{DEVNAME}"
> >> ENV{LVM_VG_NAME_COMPLETE}=="?*", RUN+="/usr/bin/systemd-run --no-block
> >> --property DefaultDependencies=no --unit
> >> lvm-activate-$env{LVM_VG_NAME_COMPLETE} /usr/sbin/lvm vgchange -aay
> >> --autoactivation event $env{LVM_VG_NAME_COMPLETE}"
> >> GOTO="lvm_end"
> >>
> >> > i see the physical volume, but logical volumes are disabled
> >> >
> >> > # pvscan
> >> >   PV /dev/nvme0n1p5   VG vg-nvme   lvm2 [<1.79 TiB / <1.78 TiB free]
> >> >   Total: 1 [<1.79 TiB] / in use: 1 [<1.79 TiB] / in no VG: 0 [0   ]
> >> > # vgscan
> >> >   Found volume group "vg-nvme" using metadata type lvm2
> >> > # lvscan
> >> >   inactive          '/dev/vg-nvme/var' [10.00 GiB] inherit
> >> >
> >> > and so i cannot mount the logical volume
> >> >
> >> > # mount /dev/vg-nvme/var /mnt
> >> > [  281.006375] /dev/vg-nvme/var: Can't lookup blockdev
> >> > [  281.011279] /dev/vg-nvme/var: Can't lookup blockdev
> >> > [  281.016202] /dev/vg-nvme/var: Can't lookup blockdev
> >> > [  281.021080] /dev/vg-nvme/var: Can't lookup blockdev
> >> > mount: mounting /dev/vg-nvme/var on /mnt failed: No such file or
> >> > directory
> >> >
> >> > any ideas?
> >>
> >> I would try to run vgchange manually to see if the setup works at all,
> >> then create a /usr/bin/systemd-run script that is able to execute
> >> commands in the background. Something like this (untested):
> >
> > i was able to manually initialize the lvm value after adding the
> > systemd without init (running the command without prefix
> > "systemd-run")...
> >
> > basicly with this command:
> >
> > /usr/sbin/lvm vgchange -aay --autoactivation event vg-nvme
> >
> > with init i had compile issues missing libmount, see my followup post
> >
> > now i have to remove systems from my initrd somehow to do further
> > testing with only the eudev. any idea doing this without making all
> > clear (or is this dropped when recreating the cpio file)?
>
> Without running make clean, unwanted files need to be removed manually.
> Buildroot creates per-package logs .files-list,
> .files-list-{host,images,staging}, which contain the names of files
> copied to the respective destination. Remove at least those from
> .files-list to revert to a system without the package; preferrably also
> those from .files-list-staging.
>
> Kind regards,
> Andreas
>
> >
> >>    #!/bin/sh
> >>    prg=$1
> >>    shift
> >>    (
> >>      $prg $@ < /dev/zero > /tmp/error.log 2>&1
> >>    )&
> >
> >> Kind regards,
> >> Andreas
> >>
> >> > regards Frank
>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

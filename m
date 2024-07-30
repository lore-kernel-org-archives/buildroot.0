Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D49CC3DA49
	for <buildroot@archiver.kernel.org>; Tue, 30 Jul 2024 09:50:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A0F71608F0;
	Tue, 30 Jul 2024 09:50:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id emd5fXgI9LqH; Tue, 30 Jul 2024 09:50:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3C8F4608F7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3C8F4608F7;
	Tue, 30 Jul 2024 09:50:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 282C01BF5A2
 for <buildroot@lists.busybox.net>; Tue, 30 Jul 2024 09:50:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 165F740609
 for <buildroot@lists.busybox.net>; Tue, 30 Jul 2024 09:50:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OlJe6vWDt2Kb for <buildroot@lists.busybox.net>;
 Tue, 30 Jul 2024 09:50:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.18;
 helo=mout.gmx.net; envelope-from=frank-w@public-files.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 43A23405D0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 43A23405D0
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 43A23405D0
 for <buildroot@buildroot.org>; Tue, 30 Jul 2024 09:50:12 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [157.180.227.129] ([157.180.227.129]) by web-mail.gmx.net
 (3c-app-gmx-bs45.server.lan [172.19.170.97]) (via HTTP); Tue, 30 Jul 2024
 11:50:04 +0200
MIME-Version: 1.0
Message-ID: <trinity-86e81e5d-18d4-4d6f-8df9-d69f9a24ac08-1722333004307@3c-app-gmx-bs45>
To: Andreas Ziegler <br015@umbiko.net>
Date: Tue, 30 Jul 2024 11:50:04 +0200
Importance: normal
Sensitivity: Normal
In-Reply-To: <9a6b9a74e11902c4dcc0d6b88c12251a@umbiko.net>
References: <mailman.12142.1721505316.24059.buildroot@buildroot.org>
 <f49923df9029dfb3217cb858d0be4f69@umbiko.net>
 <trinity-cf5cdaab-cad5-4928-9dea-541742606976-1721555640184@3c-app-gmx-bap52>
 <e00d6149cbd2bd2a5a672fcf0323c814@umbiko.net>
 <trinity-8bdeb9c9-9a2d-407f-80d0-c4bc0847cb82-1721577033740@3c-app-gmx-bap52>
 <72a472b4614bd2ca6c652bfd6a2c171b@umbiko.net>
 <trinity-5801e483-666e-4366-b968-4217269be7be-1721590668238@3c-app-gmx-bap52>
 <9a6b9a74e11902c4dcc0d6b88c12251a@umbiko.net>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:DQhP+v0PJGV48p7yk6j2/Cmf5L7XlyyKAIheFhXr87b8RTqUOHaXemWaefrATiV0+jb1i
 BhhghoRIPQl0oFgREH9bExoZAm8CGlDtgQ9hO8YoATDWS3B3g3vLZtJDKwG3Th34oUbhN0IfIDtt
 16n2pN4xPh4uwpsUv7kUP6ZXh3gkV+4o/9/90RK0/OJ7eor+JxewXQch/uOjodYzAKKub5Nnlimy
 dynSjpQzRi0J8FNEPcolVGROz7pyPA5RsfyBI7QFtVOMtF+mDw0uENJFdP6uzYymZGWdMdDxZ7wg
 q0=
UI-OutboundReport: notjunk:1;M01:P0:7K45ZPy/sy8=;7O6UaO0DEj8cPFrWiajdDXlFZ3a
 2NiqGtILJjJfhULWq+eQ9VrTrMnQ+BGM+9dUnwhYlc0bsg1V3c3JpIlTiO0OYtKhuvmQx1JXA
 gz6387d1dmQQYyJc4ndnwSHGrXud3m0m2dCAuf6TkfvAOnyFoy9MgKzpm0NBoj6CNn70tvgEy
 DMrQbfI8TP60l8+c/0KRfQUHdkjKuI9PlHPvgKdjwQubSitWw/XRTR302qMUo0zvj+s+OQrvt
 jVxju/ZzWBuoYJajf8N1DVhDYgpWmXEimA1NSVv5OLnlK6QBaLITnMCoq1DoY4utLCBR2kupg
 fZg9yYZZC/Ys6xzWF8teF7/pCFSBO2a/p8fX+HAwgX91cVGV9qzj8waBwDy1a/SNov/4+JUQA
 qVdbbhUpqlMbyXg6MdPzvAIEjnwu87MWlDiIVliwzSxLyjnHescYIPCFiQZwyqLPn7krY4SPx
 OQnrXU4VbChcf8+u9vWdFD7HD8mZsmCXz21VMgkvL4S6IDseHWjQ1JdIYg0M5/N4RueQ71D2y
 PSYD2kwmXdHTvge2lfXk3GKfhNBc0mtcVpo+0R2GqjWXJzVmK0R8p76z37RskLX/c7Xvo5ryr
 ZSGVtFLK+nA/RiPmKBY331UJPVhKE7FkZJ6u6wroxBu3EUbfqWKrkqX0+ShXmjB2a/s2jj4oT
 0+ila/GeELytRnGoRK0tP/Iv/KcO/M2GJxBC4xcIlw==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=public-files.de; 
 s=s31663417; t=1722333004; x=1722937804; i=frank-w@public-files.de;
 bh=RlTLyuIw+ZmXxk896Qa/JcDqVEu2zPaFyCwHXvrvw3w=;
 h=X-UI-Sender-Class:MIME-Version:Message-ID:From:To:Cc:Subject:
 Content-Type:Date:In-Reply-To:References:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=bwOCKY6t+HbjYcC8a8C+vm12CR+kffRscQc9EOnsDoBTEuqHeYLB580wD0vuDAft
 HYAiGiTTGsNYjG99j2IicgNYD7FGXjrDNtdNEWttJhXPDWw794qmPBr3iL+f1CSWd
 qxiSJ8BLOcHTAOhqQ8j6iL34Z9bXaHtbOHhux4Vua/C89M7BNwWNgl0zAMM3ZQ4GP
 ldY0T4boBgWG15SDm8FsQdiQjVRjRPfozCgn0Ep6cJzATwfE4SZLkHQJp/yk5ERhG
 +uArAIhClNXoRuOaLFirVZ6LnDwqPL3P2CghZco5znK8miy0XGtBuaIMuE/5UZ4L4
 GX7+TOXcPenYazsLcQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=public-files.de
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=public-files.de header.i=frank-w@public-files.de
 header.a=rsa-sha256 header.s=s31663417 header.b=bwOCKY6t
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

Hi

> Gesendet: Montag, 22. Juli 2024 um 07:15 Uhr
> Von: "Andreas Ziegler" <br015@umbiko.net>
> An: "Frank Wunderlich" <frank-w@public-files.de>
> Cc: "buildroot" <buildroot@buildroot.org>
> Betreff: Re: Aw: Re:  Re:  Re: lvm2 seems to require systemd
>
> Hi Frank,
>
> On 2024-07-21 19:37, Frank Wunderlich wrote:
> > Hi
> >
> >> Gesendet: Sonntag, 21. Juli 2024 um 19:58 Uhr
> >> Von: "Andreas Ziegler" <br015@umbiko.net>
> >> An: "Frank Wunderlich" <frank-w@public-files.de>
> >> Cc: "buildroot" <buildroot@buildroot.org>
> >> Betreff: Re: Aw: Re:  Re: lvm2 seems to require systemd
> >>
> >> Hi Frank,
> >>
> >> On 2024-07-21 15:50, Frank Wunderlich wrote:
> >> > Hi Andreas
> >> >
> >> > noticed some errors when calling the vgchange command
> >> >
> >> > # /usr/sbin/lvm vgchange -aay --autoactivation event vg-nvme
> >> >   1 logical volume(s) in volume group "vg-nvme" now active
> >> > [ 8023.796866] udevd[1614]: failed to execute '/usr/sbin/blkid'
> >> > '/usr/sbin/blkid -o udev -p /dev/dm-0': No such file or directory
> >> > [ 8023.808977] udevd[1610]: conflicting device node
> >> > '/dev/mapper/vg--nvme-var' found, link to '/dev/dm-0' will not be
> >> > created
> >> > # lvscan
> >> >   ACTIVE            '/dev/vg-nvme/var' [10.00 GiB] inherit
> >>
> >> Your execution of vgchange triggers additional udev messages, that are
> >> not handled correctly. Try to find out what is missing and add it to
> >> your image; blkid, for example, is part of package util-linux.
> >
> > i have already enabled util_linux
> > Symbol: BR2_PACKAGE_UTIL_LINUX [=y]
> > BR2_PACKAGE_HOST_UTIL_LINUX [=y]
> > BR2_PACKAGE_UTIL_LINUX_LIBBLKID [=y]
> >
> > so strange that blkid is not there, but it is in /sbin
> >
> > # which blkid
> > /sbin/blkid
> >
> > maybe a symlink needs to be created?
> >
>
> Sorry, my mistake: blkid is provided by busybox and busybox installs it
> in /sbin. Since this is a Buildroot feature (unless you activate
> BR2_ROOTFS_MERGED_USER), I would modify the udev rule.
>
> >> The double-dash in vg--nvme-var looks strange: is this intentional?
> >
> > as you can see above i used only one dash in vg-nvme, not sure why
> > another one was inserted here
> >
> > # pvscan
> >   PV /dev/nvme0n1p5   VG vg-nvme   lvm2 [<1.79 TiB / <1.78 TiB free]
> >   Total: 1 [<1.79 TiB] / in use: 1 [<1.79 TiB] / in no VG: 0 [0   ]
> >
> >> > but i'm able to mount it
> >> >
> >> > # mkdir /mnt/var
> >> > # mount /dev/mapper/vg--nvme-var /mnt/var/
> >> > [ 8514.687803] EXT4-fs (dm-0): mounted filesystem
> >> > be8b31d6-96e2-43a1-8416-a058972118b3 r/w with ordered data mode. Quota
> >> > mode: disabled.
> >> > # ls /mnt/var
> >> > cache       lib         log         lost+found  run         tmp
> >> > #
> >> >
> >> > how can i test the script? currently i'm in the initrd, so changing
> >> > anything will be lost on reboot, so i want to test the script before
> >> > putting it into the initrd.
> >>
> >> I usually mount the target's file system via ssh://root@hostname in a
> >> file browser; that allows me to copy to and from the target machine.
> >> Script and configuration changes are made directly on the target
> >> system,
> >> and copied back to the development machine when everything runs
> >> satisfactorily.
> >>
> >> > as far as i see the original call via udev contains some
> >> > systemd-specific params and environment-vars i do not know currently
> >>
> >> They are probably safe to ignore; when in doubt, consult the systemd
> >> documentation. Evironment variables are extensively used within the
> >> udev
> >> context; I doubt that the called lvm2 tool makes use of them.
> >
> > they seem to be systemd options which are not stripped by the script
> > yet which
> > will result in invalid call (imho only first param is shifted away)
> >
>
> RUN+="/usr/bin/systemd-run \
>    --no-block \
>    --property DefaultDependencies=no \
>    --unit lvm-activate-$env{LVM_VG_NAME_COMPLETE} \
>    /usr/sbin/lvm \
>    vgchange \
>    -aay \
>    -autoactivation \
>    event $env{LVM_VG_NAME_COMPLETE}"
>
> If you put a 'shift 5' at the beginning of the script, it should get rid
> of the systemd parameters. Alternatively, you could modify the udev
> rule.

I'm not sure how to fix properly....where should i put the script (it is called on bootup and there my changes done on runtime are dropped) and where to call it (imho it should be called by the existing udev-rule, right)?

how to fix the blkid properly (maybe add symlink)? but this has to be done in source too or while building.

sorry for my noob questions, but my buildroot-knowledge is only :)

regards Frank

> Kind regards,
> Andreas
>
> >> Kind regards,
> >> Andreas
> >>
> >> >
> >> > regards Frank
> >> >
> >> >
> >> >> Gesendet: Sonntag, 21. Juli 2024 um 12:16 Uhr
> >> >> Von: "Andreas Ziegler" <br015@umbiko.net>
> >> >> An: "Frank Wunderlich" <frank-w@public-files.de>
> >> >> Cc: "buildroot" <buildroot@buildroot.org>
> >> >> Betreff: Re: Aw: Re: lvm2 seems to require systemd
> >> >>
> >> >> Hi Frank,
> >> >>
> >> >> On 2024-07-21 09:54, Frank Wunderlich wrote:
> >> >> > regards Frank
> >> >> >
> >> >> >
> >> >> >> Gesendet: Sonntag, 21. Juli 2024 um 11:17 Uhr
> >> >> >> Von: "Andreas Ziegler" <br015@umbiko.net>
> >> >> >> An: frank-w@public-files.de
> >> >> >> Cc: "buildroot" <buildroot@buildroot.org>
> >> >> >> Betreff: Re: lvm2 seems to require systemd
> >> >> >>
> >> >> >> Hi Frank,
> >> >> >>
> >> >> >> On 2024-07-20 14:34, Frank Wunderlich wrote:
> >> >> >> > Hi,
> >> >> >> >
> >> >> >> > i try to build a buildroot (2024.05) initrd with lvm2 support
> >> >> >> >
> >> >> >> > so basicly added these options:
> >> >> >> >
> >> >> >> > #to select BR2_PACKAGE_HAS_UDEV
> >> >> >> > BR2_PACKAGE_EUDEV=y
> >> >> >> > BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
> >> >> >> > BR2_PACKAGE_LIBBLOCKDEV=y
> >> >> >> > BR2_PACKAGE_LVM2=y
> >> >> >> >
> >> >> >> > build is fine, but i see this while bootup:
> >> >> >> >
> >> >> >> > [    3.665010] udevd[1520]: failed to execute '/usr/bin/systemd-run'
> >> >> >> > '/usr/bin/systemd-run --no-block --property DefaultDependencies=
> >> >> >> > no --unit lvm-activate-vg-nvme /usr/sbin/lvm vgchange -aay
> >> >> >> > --autoactivation event vg-nvme': No such file or directory
> >> >> >> > done
> >> >> >>
> >> >> >> lvm2 installs a bunch of udev rules; one of them relies on systemd-run
> >> >> >> to execute a command in the background:
> >> >> >>
> >> >> >> # pvscan will check if this device completes a VG,
> >> >> >> # i.e. all PVs in the VG are now present with the
> >> >> >> # arrival of this PV.  If so, it prints to stdout:
> >> >> >> # LVM_VG_NAME_COMPLETE='foo'
> >> >> >> #
> >> >> >> # When the VG is complete it can be activated, so
> >> >> >> # vgchange -aay <vgname> is run.  It is run via
> >> >> >> # systemd since it can take longer to run than
> >> >> >> # udev wants to block when processing rules.
> >> >> >> # (if there are hundreds of LVs to activate,
> >> >> >> # the vgchange can take many seconds.)
> >> >> >>
> >> >> >> ...
> >> >> >>
> >> >> >> IMPORT{program}="/usr/sbin/lvm pvscan --cache --listvg --checkcomplete
> >> >> >> --vgonline --autoactivation event --udevoutput --journal=output
> >> >> >> $env{DEVNAME}"
> >> >> >> ENV{LVM_VG_NAME_COMPLETE}=="?*", RUN+="/usr/bin/systemd-run --no-block
> >> >> >> --property DefaultDependencies=no --unit
> >> >> >> lvm-activate-$env{LVM_VG_NAME_COMPLETE} /usr/sbin/lvm vgchange -aay
> >> >> >> --autoactivation event $env{LVM_VG_NAME_COMPLETE}"
> >> >> >> GOTO="lvm_end"
> >> >> >>
> >> >> >> > i see the physical volume, but logical volumes are disabled
> >> >> >> >
> >> >> >> > # pvscan
> >> >> >> >   PV /dev/nvme0n1p5   VG vg-nvme   lvm2 [<1.79 TiB / <1.78 TiB free]
> >> >> >> >   Total: 1 [<1.79 TiB] / in use: 1 [<1.79 TiB] / in no VG: 0 [0   ]
> >> >> >> > # vgscan
> >> >> >> >   Found volume group "vg-nvme" using metadata type lvm2
> >> >> >> > # lvscan
> >> >> >> >   inactive          '/dev/vg-nvme/var' [10.00 GiB] inherit
> >> >> >> >
> >> >> >> > and so i cannot mount the logical volume
> >> >> >> >
> >> >> >> > # mount /dev/vg-nvme/var /mnt
> >> >> >> > [  281.006375] /dev/vg-nvme/var: Can't lookup blockdev
> >> >> >> > [  281.011279] /dev/vg-nvme/var: Can't lookup blockdev
> >> >> >> > [  281.016202] /dev/vg-nvme/var: Can't lookup blockdev
> >> >> >> > [  281.021080] /dev/vg-nvme/var: Can't lookup blockdev
> >> >> >> > mount: mounting /dev/vg-nvme/var on /mnt failed: No such file or
> >> >> >> > directory
> >> >> >> >
> >> >> >> > any ideas?
> >> >> >>
> >> >> >> I would try to run vgchange manually to see if the setup works at all,
> >> >> >> then create a /usr/bin/systemd-run script that is able to execute
> >> >> >> commands in the background. Something like this (untested):
> >> >> >
> >> >> > i was able to manually initialize the lvm value after adding the
> >> >> > systemd without init (running the command without prefix
> >> >> > "systemd-run")...
> >> >> >
> >> >> > basicly with this command:
> >> >> >
> >> >> > /usr/sbin/lvm vgchange -aay --autoactivation event vg-nvme
> >> >> >
> >> >> > with init i had compile issues missing libmount, see my followup post
> >> >> >
> >> >> > now i have to remove systems from my initrd somehow to do further
> >> >> > testing with only the eudev. any idea doing this without making all
> >> >> > clear (or is this dropped when recreating the cpio file)?
> >> >>
> >> >> Without running make clean, unwanted files need to be removed
> >> >> manually.
> >> >> Buildroot creates per-package logs .files-list,
> >> >> .files-list-{host,images,staging}, which contain the names of files
> >> >> copied to the respective destination. Remove at least those from
> >> >> .files-list to revert to a system without the package; preferrably
> >> >> also
> >> >> those from .files-list-staging.
> >> >>
> >> >> Kind regards,
> >> >> Andreas
> >> >>
> >> >> >
> >> >> >>    #!/bin/sh
> >> >> >>    prg=$1
> >> >> >>    shift
> >> >> >>    (
> >> >> >>      $prg $@ < /dev/zero > /tmp/error.log 2>&1
> >> >> >>    )&
> >> >> >
> >> >> >> Kind regards,
> >> >> >> Andreas
> >> >> >>
> >> >> >> > regards Frank
> >> >>
> >>
>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

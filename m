Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B552C3DA61
	for <buildroot@archiver.kernel.org>; Sun, 21 Jul 2024 19:38:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0461C80E0E;
	Sun, 21 Jul 2024 19:38:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GjJsiYwDiABo; Sun, 21 Jul 2024 19:37:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 895C780FEF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 895C780FEF;
	Sun, 21 Jul 2024 19:37:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C96751BF2AB
 for <buildroot@lists.busybox.net>; Sun, 21 Jul 2024 19:37:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B4DB540154
 for <buildroot@lists.busybox.net>; Sun, 21 Jul 2024 19:37:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pNkrIbtvFH3Z for <buildroot@lists.busybox.net>;
 Sun, 21 Jul 2024 19:37:55 +0000 (UTC)
X-Greylist: delayed 13635 seconds by postgrey-1.37 at util1.osuosl.org;
 Sun, 21 Jul 2024 19:37:54 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D3B9140139
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D3B9140139
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.21;
 helo=mout.gmx.net; envelope-from=frank-w@public-files.de; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D3B9140139
 for <buildroot@buildroot.org>; Sun, 21 Jul 2024 19:37:53 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [80.245.75.169] ([80.245.75.169]) by web-mail.gmx.net
 (3c-app-gmx-bap52.server.lan [172.19.172.122]) (via HTTP); Sun, 21 Jul 2024
 21:37:48 +0200
MIME-Version: 1.0
Message-ID: <trinity-5801e483-666e-4366-b968-4217269be7be-1721590668238@3c-app-gmx-bap52>
To: Andreas Ziegler <br015@umbiko.net>
Date: Sun, 21 Jul 2024 21:37:48 +0200
Importance: normal
Sensitivity: Normal
In-Reply-To: <72a472b4614bd2ca6c652bfd6a2c171b@umbiko.net>
References: <mailman.12142.1721505316.24059.buildroot@buildroot.org>
 <f49923df9029dfb3217cb858d0be4f69@umbiko.net>
 <trinity-cf5cdaab-cad5-4928-9dea-541742606976-1721555640184@3c-app-gmx-bap52>
 <e00d6149cbd2bd2a5a672fcf0323c814@umbiko.net>
 <trinity-8bdeb9c9-9a2d-407f-80d0-c4bc0847cb82-1721577033740@3c-app-gmx-bap52>
 <72a472b4614bd2ca6c652bfd6a2c171b@umbiko.net>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:0T2kkgWcoUfXzAeNCcC5VocJ5svFLXGGs828Fpqwr+QJNZYde/4P8vKl+81XVartkSYWm
 AtYnmkxKlzQ19XFDE4MiZYNOR0booSc7EyXkpURqfGZbivgrc7NIKFJKDPVDLjNQYz4nFPc3inwS
 qe7DyWsuJQQbUqwYmxZ6ykcv+H0JvGGnSX4hKI/yhUaKCMzAGLLYIwF/C15cqxaeLvZ4x6fSLGFG
 nCLRQyp0i4aufRltXLIoFKJwIrMRKeYNiVmKOaJiuOJt+3mMMExvR9mAYH4R7VBbPHMVSrS5jq83
 A8=
UI-OutboundReport: notjunk:1;M01:P0:ltF1G9q8V5M=;vTj2dKNycbk/HYpCv6mwaTMGht4
 oFlEW6oVD2vi3/TdDOTxMLUG5tsG8bUxr2lji116c+W5t2yWNiYj5ztGDFoZzCvO0TrL6kpRd
 a6A0rMCCdzAGyigdb/oeEyI9IYX3EOgbvdK8f7in9vvPNFHIY35kFYRlECml5QnIiUg6Z3vln
 fG7dHtrvGi1uALqn3bQRhMaXEjxke6kfDyuUpjmIiX9G8SOrTW2zGS4uvexhz0U+MudhdZnxs
 LaZsdKveFKZC4FhgX+ya7Zx/5v5IhyyQaw5ywSzvIemjmuIcCKRUS7A8a6cKZe8byJmGotSFj
 lE+I0+yS/Sy1R/RuTNSK+czHVYk4h63Mn4zobcPOX/Law61eHF+FF2mEh3n+8lhNWfljvP233
 3T13MxpADRANqGiXrFpKfT0vHzmraz5u2p9Urz3PbAv/onz7aJAcIHX7lW86bUpF0WInFIQ87
 BgzSv4c/rKyDpfjiqcDSSxH/XgIibI6kLPCgX05U6O9lvs1KUYwTPSEQPJGw/sa8TFQ8UpPKa
 2n/spP6z3b8/30xLAryF8GlB8zNZpYeqW95MyCGqvpC5rCm5z5usvd1nrJjvD0U6FYsDuTfvk
 4/FfXfQ9pCC3oZaiBVzD7srSYBG9Qd6ikNHpp7WPLRS8Z2KhydyNRPYNssBbG48bZ0rVTpIQz
 p23T2TxbSfsoOhmUihqyYo1MqSGzVP5ZCrNDcK93hQ==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=public-files.de; 
 s=s31663417; t=1721590668; x=1722195468; i=frank-w@public-files.de;
 bh=+4ZKSM1o0JWzmai06ckeMHOs2URSooM5UAxOvPfb6eY=;
 h=X-UI-Sender-Class:MIME-Version:Message-ID:From:To:Cc:Subject:
 Content-Type:Date:In-Reply-To:References:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=IzmKpNniCjx8vREDRddA0T015T+lWXzfplZCTFF3CRlzLM3m/Qpcg+C8CNf6yNev
 9A5CtKerSsAJGemM8N2qVn+lfSKO7ZYMVtnnaa7GBeK4PJLFjc/9IQhk0xJPFAzCx
 OWzAmjSPs4NW5z9FkwmQ/km3Taluwe6SKWunQhYcNRb9U3DgzBmpeIbllOmNLsUd/
 BfixNcFZd3bRUVnCkTARLytj8Qs7eGj3H/7Yy3KFW7DbMMFUYafAl08aK5F0ljNMn
 nmxQzL55hL9AqmEziDZcCt2Xy4j+y+aWfbaf7DumhKG5sOFdA3DkaGq82oWrlzpCq
 z45Vt+g9EHqtMcs5yA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=public-files.de
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=public-files.de header.i=frank-w@public-files.de
 header.a=rsa-sha256 header.s=s31663417 header.b=IzmKpNni
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

> Gesendet: Sonntag, 21. Juli 2024 um 19:58 Uhr
> Von: "Andreas Ziegler" <br015@umbiko.net>
> An: "Frank Wunderlich" <frank-w@public-files.de>
> Cc: "buildroot" <buildroot@buildroot.org>
> Betreff: Re: Aw: Re:  Re: lvm2 seems to require systemd
>
> Hi Frank,
>
> On 2024-07-21 15:50, Frank Wunderlich wrote:
> > Hi Andreas
> >
> > noticed some errors when calling the vgchange command
> >
> > # /usr/sbin/lvm vgchange -aay --autoactivation event vg-nvme
> >   1 logical volume(s) in volume group "vg-nvme" now active
> > [ 8023.796866] udevd[1614]: failed to execute '/usr/sbin/blkid'
> > '/usr/sbin/blkid -o udev -p /dev/dm-0': No such file or directory
> > [ 8023.808977] udevd[1610]: conflicting device node
> > '/dev/mapper/vg--nvme-var' found, link to '/dev/dm-0' will not be
> > created
> > # lvscan
> >   ACTIVE            '/dev/vg-nvme/var' [10.00 GiB] inherit
>
> Your execution of vgchange triggers additional udev messages, that are
> not handled correctly. Try to find out what is missing and add it to
> your image; blkid, for example, is part of package util-linux.

i have already enabled util_linux
Symbol: BR2_PACKAGE_UTIL_LINUX [=y]
BR2_PACKAGE_HOST_UTIL_LINUX [=y]
BR2_PACKAGE_UTIL_LINUX_LIBBLKID [=y]

so strange that blkid is not there, but it is in /sbin

# which blkid
/sbin/blkid

maybe a symlink needs to be created?

> The double-dash in vg--nvme-var looks strange: is this intentional?

as you can see above i used only one dash in vg-nvme, not sure why another one was inserted here

# pvscan
  PV /dev/nvme0n1p5   VG vg-nvme   lvm2 [<1.79 TiB / <1.78 TiB free]
  Total: 1 [<1.79 TiB] / in use: 1 [<1.79 TiB] / in no VG: 0 [0   ]

> > but i'm able to mount it
> >
> > # mkdir /mnt/var
> > # mount /dev/mapper/vg--nvme-var /mnt/var/
> > [ 8514.687803] EXT4-fs (dm-0): mounted filesystem
> > be8b31d6-96e2-43a1-8416-a058972118b3 r/w with ordered data mode. Quota
> > mode: disabled.
> > # ls /mnt/var
> > cache       lib         log         lost+found  run         tmp
> > #
> >
> > how can i test the script? currently i'm in the initrd, so changing
> > anything will be lost on reboot, so i want to test the script before
> > putting it into the initrd.
>
> I usually mount the target's file system via ssh://root@hostname in a
> file browser; that allows me to copy to and from the target machine.
> Script and configuration changes are made directly on the target system,
> and copied back to the development machine when everything runs
> satisfactorily.
>
> > as far as i see the original call via udev contains some
> > systemd-specific params and environment-vars i do not know currently
>
> They are probably safe to ignore; when in doubt, consult the systemd
> documentation. Evironment variables are extensively used within the udev
> context; I doubt that the called lvm2 tool makes use of them.

they seem to be systemd options which are not stripped by the script yet which
will result in invalid call (imho only first param is shifted away)

> Kind regards,
> Andreas
>
> >
> > regards Frank
> >
> >
> >> Gesendet: Sonntag, 21. Juli 2024 um 12:16 Uhr
> >> Von: "Andreas Ziegler" <br015@umbiko.net>
> >> An: "Frank Wunderlich" <frank-w@public-files.de>
> >> Cc: "buildroot" <buildroot@buildroot.org>
> >> Betreff: Re: Aw: Re: lvm2 seems to require systemd
> >>
> >> Hi Frank,
> >>
> >> On 2024-07-21 09:54, Frank Wunderlich wrote:
> >> > regards Frank
> >> >
> >> >
> >> >> Gesendet: Sonntag, 21. Juli 2024 um 11:17 Uhr
> >> >> Von: "Andreas Ziegler" <br015@umbiko.net>
> >> >> An: frank-w@public-files.de
> >> >> Cc: "buildroot" <buildroot@buildroot.org>
> >> >> Betreff: Re: lvm2 seems to require systemd
> >> >>
> >> >> Hi Frank,
> >> >>
> >> >> On 2024-07-20 14:34, Frank Wunderlich wrote:
> >> >> > Hi,
> >> >> >
> >> >> > i try to build a buildroot (2024.05) initrd with lvm2 support
> >> >> >
> >> >> > so basicly added these options:
> >> >> >
> >> >> > #to select BR2_PACKAGE_HAS_UDEV
> >> >> > BR2_PACKAGE_EUDEV=y
> >> >> > BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
> >> >> > BR2_PACKAGE_LIBBLOCKDEV=y
> >> >> > BR2_PACKAGE_LVM2=y
> >> >> >
> >> >> > build is fine, but i see this while bootup:
> >> >> >
> >> >> > [    3.665010] udevd[1520]: failed to execute '/usr/bin/systemd-run'
> >> >> > '/usr/bin/systemd-run --no-block --property DefaultDependencies=
> >> >> > no --unit lvm-activate-vg-nvme /usr/sbin/lvm vgchange -aay
> >> >> > --autoactivation event vg-nvme': No such file or directory
> >> >> > done
> >> >>
> >> >> lvm2 installs a bunch of udev rules; one of them relies on systemd-run
> >> >> to execute a command in the background:
> >> >>
> >> >> # pvscan will check if this device completes a VG,
> >> >> # i.e. all PVs in the VG are now present with the
> >> >> # arrival of this PV.  If so, it prints to stdout:
> >> >> # LVM_VG_NAME_COMPLETE='foo'
> >> >> #
> >> >> # When the VG is complete it can be activated, so
> >> >> # vgchange -aay <vgname> is run.  It is run via
> >> >> # systemd since it can take longer to run than
> >> >> # udev wants to block when processing rules.
> >> >> # (if there are hundreds of LVs to activate,
> >> >> # the vgchange can take many seconds.)
> >> >>
> >> >> ...
> >> >>
> >> >> IMPORT{program}="/usr/sbin/lvm pvscan --cache --listvg --checkcomplete
> >> >> --vgonline --autoactivation event --udevoutput --journal=output
> >> >> $env{DEVNAME}"
> >> >> ENV{LVM_VG_NAME_COMPLETE}=="?*", RUN+="/usr/bin/systemd-run --no-block
> >> >> --property DefaultDependencies=no --unit
> >> >> lvm-activate-$env{LVM_VG_NAME_COMPLETE} /usr/sbin/lvm vgchange -aay
> >> >> --autoactivation event $env{LVM_VG_NAME_COMPLETE}"
> >> >> GOTO="lvm_end"
> >> >>
> >> >> > i see the physical volume, but logical volumes are disabled
> >> >> >
> >> >> > # pvscan
> >> >> >   PV /dev/nvme0n1p5   VG vg-nvme   lvm2 [<1.79 TiB / <1.78 TiB free]
> >> >> >   Total: 1 [<1.79 TiB] / in use: 1 [<1.79 TiB] / in no VG: 0 [0   ]
> >> >> > # vgscan
> >> >> >   Found volume group "vg-nvme" using metadata type lvm2
> >> >> > # lvscan
> >> >> >   inactive          '/dev/vg-nvme/var' [10.00 GiB] inherit
> >> >> >
> >> >> > and so i cannot mount the logical volume
> >> >> >
> >> >> > # mount /dev/vg-nvme/var /mnt
> >> >> > [  281.006375] /dev/vg-nvme/var: Can't lookup blockdev
> >> >> > [  281.011279] /dev/vg-nvme/var: Can't lookup blockdev
> >> >> > [  281.016202] /dev/vg-nvme/var: Can't lookup blockdev
> >> >> > [  281.021080] /dev/vg-nvme/var: Can't lookup blockdev
> >> >> > mount: mounting /dev/vg-nvme/var on /mnt failed: No such file or
> >> >> > directory
> >> >> >
> >> >> > any ideas?
> >> >>
> >> >> I would try to run vgchange manually to see if the setup works at all,
> >> >> then create a /usr/bin/systemd-run script that is able to execute
> >> >> commands in the background. Something like this (untested):
> >> >
> >> > i was able to manually initialize the lvm value after adding the
> >> > systemd without init (running the command without prefix
> >> > "systemd-run")...
> >> >
> >> > basicly with this command:
> >> >
> >> > /usr/sbin/lvm vgchange -aay --autoactivation event vg-nvme
> >> >
> >> > with init i had compile issues missing libmount, see my followup post
> >> >
> >> > now i have to remove systems from my initrd somehow to do further
> >> > testing with only the eudev. any idea doing this without making all
> >> > clear (or is this dropped when recreating the cpio file)?
> >>
> >> Without running make clean, unwanted files need to be removed
> >> manually.
> >> Buildroot creates per-package logs .files-list,
> >> .files-list-{host,images,staging}, which contain the names of files
> >> copied to the respective destination. Remove at least those from
> >> .files-list to revert to a system without the package; preferrably
> >> also
> >> those from .files-list-staging.
> >>
> >> Kind regards,
> >> Andreas
> >>
> >> >
> >> >>    #!/bin/sh
> >> >>    prg=$1
> >> >>    shift
> >> >>    (
> >> >>      $prg $@ < /dev/zero > /tmp/error.log 2>&1
> >> >>    )&
> >> >
> >> >> Kind regards,
> >> >> Andreas
> >> >>
> >> >> > regards Frank
> >>
>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

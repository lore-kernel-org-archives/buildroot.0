Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 281A6C3DA61
	for <buildroot@archiver.kernel.org>; Sun, 21 Jul 2024 09:54:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5984E4056F;
	Sun, 21 Jul 2024 09:54:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YTf1FG1y_hit; Sun, 21 Jul 2024 09:54:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D6A2840184
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D6A2840184;
	Sun, 21 Jul 2024 09:54:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 01A4E1BF31B
 for <buildroot@lists.busybox.net>; Sun, 21 Jul 2024 09:54:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E3A866074E
 for <buildroot@lists.busybox.net>; Sun, 21 Jul 2024 09:54:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wUlL7K1c4P-m for <buildroot@lists.busybox.net>;
 Sun, 21 Jul 2024 09:54:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.22;
 helo=mout.gmx.net; envelope-from=frank-w@public-files.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 68C8F605E3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 68C8F605E3
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 68C8F605E3
 for <buildroot@buildroot.org>; Sun, 21 Jul 2024 09:54:05 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [80.245.75.169] ([80.245.75.169]) by web-mail.gmx.net
 (3c-app-gmx-bap52.server.lan [172.19.172.122]) (via HTTP); Sun, 21 Jul 2024
 11:54:00 +0200
MIME-Version: 1.0
Message-ID: <trinity-cf5cdaab-cad5-4928-9dea-541742606976-1721555640184@3c-app-gmx-bap52>
To: Andreas Ziegler <br015@umbiko.net>
Date: Sun, 21 Jul 2024 11:54:00 +0200
Importance: normal
Sensitivity: Normal
In-Reply-To: <f49923df9029dfb3217cb858d0be4f69@umbiko.net>
References: <mailman.12142.1721505316.24059.buildroot@buildroot.org>
 <f49923df9029dfb3217cb858d0be4f69@umbiko.net>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:W5Uj2e3Ag4uwCoHEwP+5H+dm21kx55FGd2gbQVmWTV2T4oAIn6m6bvy5WXf25QENPUUZk
 pmlZvL3usfRwkDd52JyBkUt1XMK9ttUZnDInpFJ7sP65g9Yxd8b9kd19bS/lS8kMZlu5Z2FRRtZZ
 VC+mJce5IRY0/RbUh6gt5aioPomybPWSqdgCVVIeoYdFrjywKcmezhJOeBW05XHQxFrza/VX9rzE
 IdCG1uAQ1hDT6hv4kuOZfcwtLpmsx+IF/hM0VqeNjS3E0+abLYlPojs1ECFkQQ4PrM3OPF6OfjgZ
 jo=
UI-OutboundReport: notjunk:1;M01:P0:k7G5Ur9TuSI=;Pd1ks8TUmbYNDbBCSmtVum5a8B0
 1628PpKsohJPkWvVT/gHA5U+ZEru8XN7pGnlvCEpLFCDLjC2+j/Gv3mZOMGH5iEaa9sGc2Yx7
 gAwYzbaCVz8xcOZjWtvTyVLsWSIljKum6smGOpS099flYMRCFjRr6tEK5wCIyTr1L8eJOd2uN
 IXFNV0RIj+rd5r4OJehuqgfstLlgpk4zfuaM24Lz6TQgaAF2g5iNQ+x7q8CXFIAWLd8cC8+nw
 SOVa3vDj9L/NNIftuvEJmNiZsD6fOZG2RIVxXGnPExYzXVvsBOpgHXQg9V43+H44KxtnId7VT
 +bP0wrTjsq/7wYH+CjQPQVREK0AG7noLWtTrlZNDmkdcmervbKuZLltX0ysdP6+HXp8GFW07g
 gOQ6YocSpPbIZRf4T64d42/GOtVEYx66ywvkgQTDSJ7coO4FeWzwlVsqYVqNJYhciIOgR6unA
 35g0olt3bbtCL384gh5Rn3icptSSpC7rDE/vbQwOkYHw17za8aUiXbDBEBL1GcuDdMJPXwcGp
 C5foAIoOM9J8OzsStWbaomq5o2gNVo8aPeLu0VjwwqsE58jQ5kT/VvWVs9sXHy8uIoktvQoUQ
 klICbhjTWGXixsnz28MphZWVw9TsLcgBpXD6kkfgJAamPX2CAj+CaAwOLvoy9jAGidJeiGTk4
 hMSrVnaSib7kDDLT0Q6nOwaYW6xuGpH5h6nxSpHUVA==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=public-files.de; 
 s=s31663417; t=1721555640; x=1722160440; i=frank-w@public-files.de;
 bh=8d5Xm8h9W1fqn7RiMRB6FFMId8bU9ME0qv7HmH9wRy4=;
 h=X-UI-Sender-Class:MIME-Version:Message-ID:From:To:Cc:Subject:
 Content-Type:Date:In-Reply-To:References:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=aQMAwqqiZrpCr0gGodJIMDQvBq8pCdo8Oh6i16DOx5BWtz2I6Sg1ghFi+Q3XiUY7
 xr2Ah/owl11zBDMmSPxJi5mgeP0WljPgLXsJh1hYOKfz8XEc8cIl+wZqfUgitkn5l
 vQMMia/Cszyqiwg/TB9xRC8DDMhtJ2UcQBxHl7rJtgyMeHoBQr7vPuMNszAMijL/V
 C/eckTutBWnjbWFnKgg/QrDjc7Nm3b+5laQamXDWyrAlqk9JSURTReE/wfDkT849u
 r5Fr0Uc/ivZOEMPl+/ZVNRSzjoshVOpVAXjbb1UNnFjsB97swSvHrP9McTkALy06Q
 gkPJbQfyNnvqNHS1BA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=public-files.de
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=public-files.de
 header.i=frank-w@public-files.de header.a=rsa-sha256 header.s=s31663417
 header.b=aQMAwqqi
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



regards Frank


> Gesendet: Sonntag, 21. Juli 2024 um 11:17 Uhr
> Von: "Andreas Ziegler" <br015@umbiko.net>
> An: frank-w@public-files.de
> Cc: "buildroot" <buildroot@buildroot.org>
> Betreff: Re: lvm2 seems to require systemd
>
> Hi Frank,
>
> On 2024-07-20 14:34, Frank Wunderlich wrote:
> > Hi,
> >
> > i try to build a buildroot (2024.05) initrd with lvm2 support
> >
> > so basicly added these options:
> >
> > #to select BR2_PACKAGE_HAS_UDEV
> > BR2_PACKAGE_EUDEV=y
> > BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
> > BR2_PACKAGE_LIBBLOCKDEV=y
> > BR2_PACKAGE_LVM2=y
> >
> > build is fine, but i see this while bootup:
> >
> > [    3.665010] udevd[1520]: failed to execute '/usr/bin/systemd-run'
> > '/usr/bin/systemd-run --no-block --property DefaultDependencies=
> > no --unit lvm-activate-vg-nvme /usr/sbin/lvm vgchange -aay
> > --autoactivation event vg-nvme': No such file or directory
> > done
>
> lvm2 installs a bunch of udev rules; one of them relies on systemd-run
> to execute a command in the background:
>
> # pvscan will check if this device completes a VG,
> # i.e. all PVs in the VG are now present with the
> # arrival of this PV.  If so, it prints to stdout:
> # LVM_VG_NAME_COMPLETE='foo'
> #
> # When the VG is complete it can be activated, so
> # vgchange -aay <vgname> is run.  It is run via
> # systemd since it can take longer to run than
> # udev wants to block when processing rules.
> # (if there are hundreds of LVs to activate,
> # the vgchange can take many seconds.)
>
> ...
>
> IMPORT{program}="/usr/sbin/lvm pvscan --cache --listvg --checkcomplete
> --vgonline --autoactivation event --udevoutput --journal=output
> $env{DEVNAME}"
> ENV{LVM_VG_NAME_COMPLETE}=="?*", RUN+="/usr/bin/systemd-run --no-block
> --property DefaultDependencies=no --unit
> lvm-activate-$env{LVM_VG_NAME_COMPLETE} /usr/sbin/lvm vgchange -aay
> --autoactivation event $env{LVM_VG_NAME_COMPLETE}"
> GOTO="lvm_end"
>
> > i see the physical volume, but logical volumes are disabled
> >
> > # pvscan
> >   PV /dev/nvme0n1p5   VG vg-nvme   lvm2 [<1.79 TiB / <1.78 TiB free]
> >   Total: 1 [<1.79 TiB] / in use: 1 [<1.79 TiB] / in no VG: 0 [0   ]
> > # vgscan
> >   Found volume group "vg-nvme" using metadata type lvm2
> > # lvscan
> >   inactive          '/dev/vg-nvme/var' [10.00 GiB] inherit
> >
> > and so i cannot mount the logical volume
> >
> > # mount /dev/vg-nvme/var /mnt
> > [  281.006375] /dev/vg-nvme/var: Can't lookup blockdev
> > [  281.011279] /dev/vg-nvme/var: Can't lookup blockdev
> > [  281.016202] /dev/vg-nvme/var: Can't lookup blockdev
> > [  281.021080] /dev/vg-nvme/var: Can't lookup blockdev
> > mount: mounting /dev/vg-nvme/var on /mnt failed: No such file or
> > directory
> >
> > any ideas?
>
> I would try to run vgchange manually to see if the setup works at all,
> then create a /usr/bin/systemd-run script that is able to execute
> commands in the background. Something like this (untested):

i was able to manually initialize the lvm value after adding the systemd without init (running the command without prefix "systemd-run")...

basicly with this command:

/usr/sbin/lvm vgchange -aay --autoactivation event vg-nvme

with init i had compile issues missing libmount, see my followup post

now i have to remove systems from my initrd somehow to do further testing with only the eudev. any idea doing this without making all clear (or is this dropped when recreating the cpio file)?

>    #!/bin/sh
>    prg=$1
>    shift
>    (
>      $prg $@ < /dev/zero > /tmp/error.log 2>&1
>    )&

> Kind regards,
> Andreas
>
> > regards Frank

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

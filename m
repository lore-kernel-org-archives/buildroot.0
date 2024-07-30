Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59FF8C3DA70
	for <buildroot@archiver.kernel.org>; Tue, 30 Jul 2024 15:49:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5003A40362;
	Tue, 30 Jul 2024 15:49:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Wy6SKDu2Zuhx; Tue, 30 Jul 2024 15:49:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7F3284038B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7F3284038B;
	Tue, 30 Jul 2024 15:49:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 00ACE1BF399
 for <buildroot@lists.busybox.net>; Tue, 30 Jul 2024 15:49:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EE95E4038B
 for <buildroot@lists.busybox.net>; Tue, 30 Jul 2024 15:49:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V2TZWyjy0IGo for <buildroot@lists.busybox.net>;
 Tue, 30 Jul 2024 15:49:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.18;
 helo=mout.gmx.net; envelope-from=frank-w@public-files.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C6C3E40362
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C6C3E40362
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C6C3E40362
 for <buildroot@buildroot.org>; Tue, 30 Jul 2024 15:49:29 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [157.180.227.129] ([157.180.227.129]) by web-mail.gmx.net
 (3c-app-gmx-bs45.server.lan [172.19.170.97]) (via HTTP); Tue, 30 Jul 2024
 17:49:21 +0200
MIME-Version: 1.0
Message-ID: <trinity-590c1745-eb5b-44d0-85e8-84ee984959c0-1722354561678@3c-app-gmx-bs45>
To: Andreas Ziegler <br015@umbiko.net>
Date: Tue, 30 Jul 2024 17:49:21 +0200
Importance: normal
Sensitivity: Normal
In-Reply-To: <a9e107ca09cd66b65d918e91f50695f6@umbiko.net>
References: <mailman.12142.1721505316.24059.buildroot@buildroot.org>
 <f49923df9029dfb3217cb858d0be4f69@umbiko.net>
 <trinity-cf5cdaab-cad5-4928-9dea-541742606976-1721555640184@3c-app-gmx-bap52>
 <e00d6149cbd2bd2a5a672fcf0323c814@umbiko.net>
 <trinity-8bdeb9c9-9a2d-407f-80d0-c4bc0847cb82-1721577033740@3c-app-gmx-bap52>
 <72a472b4614bd2ca6c652bfd6a2c171b@umbiko.net>
 <trinity-5801e483-666e-4366-b968-4217269be7be-1721590668238@3c-app-gmx-bap52>
 <9a6b9a74e11902c4dcc0d6b88c12251a@umbiko.net>
 <trinity-86e81e5d-18d4-4d6f-8df9-d69f9a24ac08-1722333004307@3c-app-gmx-bs45>
 <a9e107ca09cd66b65d918e91f50695f6@umbiko.net>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:IZKb2NGSco9qBJNIj/GNCWPMpsP43229fv7Dz+Ym6vyphqNjkaaz5YRb+pPXFzR59YIaA
 h4+XVBFi0nuNNWlZPWenyMecMHb+Fh+2EvIoK0NupUYK6wd/9XqLC4MvNWcNjUw76MaeVnpImQoV
 kqK5bu5jU58EyijtWxiYbNBSs6yXTswJXG2/MHGX6UpwdCZJl6shsnUtngJ6n2di48eMyzFjhL3s
 gP4sukv4eaVcBKjdu4fy+BuSCd5r2NgRhwDGtnqEk6MyLvdHgmrav/fWk95kmQzUBJXJ8EhCgydr
 CA=
UI-OutboundReport: notjunk:1;M01:P0:7eKwqx7C00U=;Qalq8urZHJyo9Ie2Oo9itoZy/v+
 LCG+R1+Yy/tK81ZgXp5JzZo1LdM+knpTdONgFsnmyG9Dc5/q+GSUhSQjST/9XywRt7cMyEPnE
 3LINIbQRC1pMUhl+iedkZfMl2KYB/O2y7/9eDnW9e7utrxbG5ncZ++Wq5irivJaQN7dK4eC5G
 vKlZdV6EvEg8YXtXqECEV6v6NdT4o+jVDKqL1cDecWMlSilCH/2lC+YWu5G1rTC7SJ0KKx13N
 eAreyBxKt1gH99pxD8X/nP7WhCmPAh+D6Gf+uwSRguq/CvxDm42jCTpeqimwx7tIdMdju6h9c
 1Swmi0e069hspatcxmJhLLtyM7Z4CuXjGb3zOLuvR6M+WpNLBeoY2BzE04On2LGIh9yHbTj4A
 5KyYXkDSZ6PymjWyK0x/OAHQ+b5jhmy4TErL2rRz6L1p9GJZ8EKlBNilnoGS0ig9+pLjToxo6
 8hRMFvbgOms4S31y20QOOz6GbD8Wpf4zLNCXhsNw96jbASTDFfTwU9kn8TkboFHT0RyM0p8xQ
 gKnH/gncx7SCcbpskonUvEaZqoYIWe/gX7PPayA0EFJrWsJSsvCZ7wgTyn+NTNYkgaqdqII4g
 JTDhQ8ZK6QR3ldvmgGOXGM2VwSkJM75pdwSg2/GmJK8z+Q5sTZjl6kzfk21Kzec4KTmcArW2M
 x5+aWymORj9eU4FMB9x3P9pSVKb520AAgK/MnGMC4A==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=public-files.de; 
 s=s31663417; t=1722354561; x=1722959361; i=frank-w@public-files.de;
 bh=L3OEEjtyjo155glWd09VovhiQn2bU/k70nSxdKMxh+I=;
 h=X-UI-Sender-Class:MIME-Version:Message-ID:From:To:Cc:Subject:
 Content-Type:Date:In-Reply-To:References:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=oiCysWJoj6DHmrsgR1BBQ8Y0uw7LzGpgNob1u2LSi1QAODojfRjFJwrgzXUnCa71
 7A5H4SjHyz1n1tUp2BR5rzNsH35Yy0zSBoGnIsepgJVh6gMIjGk7mKQ9YRcUF5ulh
 Y5c7535hsHWTFyIepJq29RkbZuvrPW/bs2NdkN2IF5EDKiYvRbcFGbb8G7KGlwKRS
 RGzZZy/oVRUki7ZdREp6ODxQ5TMuUcs8K3jLUzfE54ZvJjaZ1fSHW2UECylEL3rYL
 A2SjAKJzRmMd/lS8+qQPCKU3yUvuFOn4zH0OCvJBA2lCCTgDf1bc8kX4qlzIc8/2q
 k+5sj60NoGdI6GEVPg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=public-files.de
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=public-files.de
 header.i=frank-w@public-files.de header.a=rsa-sha256 header.s=s31663417
 header.b=oiCysWJo
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

> Gesendet: Dienstag, 30. Juli 2024 um 13:39 Uhr
> Von: "Andreas Ziegler" <br015@umbiko.net>
> An: "Frank Wunderlich" <frank-w@public-files.de>
> Cc: "buildroot" <buildroot@buildroot.org>
> Betreff: Re: Aw: Re:  Re:  Re:  Re: lvm2 seems to require systemd
>
> Hi Frank,
>
> On 2024-07-30 09:50, Frank Wunderlich wrote:
> > Hi
> >
> >> Gesendet: Montag, 22. Juli 2024 um 07:15 Uhr
> >> Von: "Andreas Ziegler" <br015@umbiko.net>
> >> An: "Frank Wunderlich" <frank-w@public-files.de>
> >> Cc: "buildroot" <buildroot@buildroot.org>
> >> Betreff: Re: Aw: Re:  Re:  Re: lvm2 seems to require systemd
> >>
> >> Hi Frank,
> >>
> >> On 2024-07-21 19:37, Frank Wunderlich wrote:
> >> > Hi
> >> >
> >> >> Gesendet: Sonntag, 21. Juli 2024 um 19:58 Uhr
> >> >> Von: "Andreas Ziegler" <br015@umbiko.net>
> >> >> An: "Frank Wunderlich" <frank-w@public-files.de>
> >> >> Cc: "buildroot" <buildroot@buildroot.org>
> >> >> Betreff: Re: Aw: Re:  Re: lvm2 seems to require systemd
> >> >>
> >> >> Hi Frank,
> >> >>
> >> >> On 2024-07-21 15:50, Frank Wunderlich wrote:
> >> >> > Hi Andreas
> >> >> >
> >> >> > noticed some errors when calling the vgchange command
> >> >> >
> >> >> > # /usr/sbin/lvm vgchange -aay --autoactivation event vg-nvme
> >> >> >   1 logical volume(s) in volume group "vg-nvme" now active
> >> >> > [ 8023.796866] udevd[1614]: failed to execute '/usr/sbin/blkid'
> >> >> > '/usr/sbin/blkid -o udev -p /dev/dm-0': No such file or directory
> >> >> > [ 8023.808977] udevd[1610]: conflicting device node
> >> >> > '/dev/mapper/vg--nvme-var' found, link to '/dev/dm-0' will not be
> >> >> > created
> >> >> > # lvscan
> >> >> >   ACTIVE            '/dev/vg-nvme/var' [10.00 GiB] inherit
> >> >>
> >> >> Your execution of vgchange triggers additional udev messages, that are
> >> >> not handled correctly. Try to find out what is missing and add it to
> >> >> your image; blkid, for example, is part of package util-linux.
> >> >
> >> > i have already enabled util_linux
> >> > Symbol: BR2_PACKAGE_UTIL_LINUX [=y]
> >> > BR2_PACKAGE_HOST_UTIL_LINUX [=y]
> >> > BR2_PACKAGE_UTIL_LINUX_LIBBLKID [=y]
> >> >
> >> > so strange that blkid is not there, but it is in /sbin
> >> >
> >> > # which blkid
> >> > /sbin/blkid
> >> >
> >> > maybe a symlink needs to be created?
> >> >
> >>
> >> Sorry, my mistake: blkid is provided by busybox and busybox installs
> >> it
> >> in /sbin. Since this is a Buildroot feature (unless you activate
> >> BR2_ROOTFS_MERGED_USER), I would modify the udev rule.
> >>
> >> >> The double-dash in vg--nvme-var looks strange: is this intentional?
> >> >
> >> > as you can see above i used only one dash in vg-nvme, not sure why
> >> > another one was inserted here
> >> >
> >> > # pvscan
> >> >   PV /dev/nvme0n1p5   VG vg-nvme   lvm2 [<1.79 TiB / <1.78 TiB free]
> >> >   Total: 1 [<1.79 TiB] / in use: 1 [<1.79 TiB] / in no VG: 0 [0   ]
> >> >
> >> >> > but i'm able to mount it
> >> >> >
> >> >> > # mkdir /mnt/var
> >> >> > # mount /dev/mapper/vg--nvme-var /mnt/var/
> >> >> > [ 8514.687803] EXT4-fs (dm-0): mounted filesystem
> >> >> > be8b31d6-96e2-43a1-8416-a058972118b3 r/w with ordered data mode. Quota
> >> >> > mode: disabled.
> >> >> > # ls /mnt/var
> >> >> > cache       lib         log         lost+found  run         tmp
> >> >> > #
> >> >> >
> >> >> > how can i test the script? currently i'm in the initrd, so changing
> >> >> > anything will be lost on reboot, so i want to test the script before
> >> >> > putting it into the initrd.
> >> >>
> >> >> I usually mount the target's file system via ssh://root@hostname in a
> >> >> file browser; that allows me to copy to and from the target machine.
> >> >> Script and configuration changes are made directly on the target
> >> >> system,
> >> >> and copied back to the development machine when everything runs
> >> >> satisfactorily.
> >> >>
> >> >> > as far as i see the original call via udev contains some
> >> >> > systemd-specific params and environment-vars i do not know currently
> >> >>
> >> >> They are probably safe to ignore; when in doubt, consult the systemd
> >> >> documentation. Evironment variables are extensively used within the
> >> >> udev
> >> >> context; I doubt that the called lvm2 tool makes use of them.
> >> >
> >> > they seem to be systemd options which are not stripped by the script
> >> > yet which
> >> > will result in invalid call (imho only first param is shifted away)
> >> >
> >>
> >> RUN+="/usr/bin/systemd-run \
> >>    --no-block \
> >>    --property DefaultDependencies=no \
> >>    --unit lvm-activate-$env{LVM_VG_NAME_COMPLETE} \
> >>    /usr/sbin/lvm \
> >>    vgchange \
> >>    -aay \
> >>    -autoactivation \
> >>    event $env{LVM_VG_NAME_COMPLETE}"
> >>
> >> If you put a 'shift 5' at the beginning of the script, it should get
> >> rid
> >> of the systemd parameters. Alternatively, you could modify the udev
> >> rule.

got rootfs-overlay working so far

# ls -l /usr/sbin/blkid
lrwxrwxrwx    1 root     root            11 Jul 30  2024 /usr/sbin/blkid -> /sbin/blkid
# cat /usr/bin/systemd-run
#!/bin/sh
logfile=/tmp/error.log
echo $@ > $logfile
shift 5
(
        $@ < /dev/zero >> $logfile 2>&1
)&
# ls /dev/vg-nvme/
var
#

thank you very much for your work...maybe this can be added as a fix somehow?

if udev-rules need to be changed (have not done this, only added blkid symlink and systemd-run script), relatred files are

13-dm-disk.rules # blkid call

69-dm-lvm.rules # systemd-run call


regards Frank
> > I'm not sure how to fix properly....where should i put the script (it
> > is called on bootup and there my changes done on runtime are dropped)
> > and where to call it (imho it should be called by the existing
> > udev-rule, right)?
>
> The script might go into /usr/bin. Put all new or changed files in a
> separate directory, within a layout reflecting that of your root
> filesystem. Configure Buildroot's  BR2_ROOTFS_OVERLAY and these files -
> with their relative directories - will be copied to the root filesystem
> after build and before image creation. For examples, see [1].
>
> > how to fix the blkid properly (maybe add symlink)? but this has to be
> > done in source too or while building.
>
> Leave blkid where it is, modify the udev script and put it in your
> overlay filesystem. As Arnout suggested, reworking all of the udev
> scripts will probably be the easiest approach ...
>
> > sorry for my noob questions, but my buildroot-knowledge is only :)
>
> The Buildroot manual [2] is quite useful. Bootlin has some training
> materials [3] for general use.
>
> Kind regards,
> Andreas
>
> >
> > regards Frank
> >
>
> <cut>
>
> [1] https://buildroot.org/downloads/manual/manual.html#customize
> [2] https://buildroot.org/docs.html
> [3] https://bootlin.com/docs/
>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

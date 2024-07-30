Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C984C3DA7E
	for <buildroot@archiver.kernel.org>; Tue, 30 Jul 2024 11:40:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 39C0340636;
	Tue, 30 Jul 2024 11:40:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Wps3LnkXdGH3; Tue, 30 Jul 2024 11:39:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8F8B4405A2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8F8B4405A2;
	Tue, 30 Jul 2024 11:39:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A148F1BF405
 for <buildroot@lists.busybox.net>; Tue, 30 Jul 2024 11:39:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8CD7B40ABE
 for <buildroot@lists.busybox.net>; Tue, 30 Jul 2024 11:39:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T_7xxp5wr-q0 for <buildroot@lists.busybox.net>;
 Tue, 30 Jul 2024 11:39:57 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=176.9.89.163;
 helo=serv15.avernis.de; envelope-from=br015@umbiko.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 40D4640A5E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 40D4640A5E
Received: from serv15.avernis.de (serv15.avernis.de [176.9.89.163])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 40D4640A5E
 for <buildroot@buildroot.org>; Tue, 30 Jul 2024 11:39:55 +0000 (UTC)
Received: by serv15.avernis.de (Postfix) with ESMTPSA id 68B0DBDE8036;
 Tue, 30 Jul 2024 13:39:51 +0200 (CEST)
MIME-Version: 1.0
Date: Tue, 30 Jul 2024 11:39:50 +0000
From: Andreas Ziegler <br015@umbiko.net>
To: Frank Wunderlich <frank-w@public-files.de>
In-Reply-To: <trinity-86e81e5d-18d4-4d6f-8df9-d69f9a24ac08-1722333004307@3c-app-gmx-bs45>
References: <mailman.12142.1721505316.24059.buildroot@buildroot.org>
 <f49923df9029dfb3217cb858d0be4f69@umbiko.net>
 <trinity-cf5cdaab-cad5-4928-9dea-541742606976-1721555640184@3c-app-gmx-bap52>
 <e00d6149cbd2bd2a5a672fcf0323c814@umbiko.net>
 <trinity-8bdeb9c9-9a2d-407f-80d0-c4bc0847cb82-1721577033740@3c-app-gmx-bap52>
 <72a472b4614bd2ca6c652bfd6a2c171b@umbiko.net>
 <trinity-5801e483-666e-4366-b968-4217269be7be-1721590668238@3c-app-gmx-bap52>
 <9a6b9a74e11902c4dcc0d6b88c12251a@umbiko.net>
 <trinity-86e81e5d-18d4-4d6f-8df9-d69f9a24ac08-1722333004307@3c-app-gmx-bs45>
Message-ID: <a9e107ca09cd66b65d918e91f50695f6@umbiko.net>
X-Sender: br015@umbiko.net
X-Virus-Scanned: clamav-milter 1.0.5 at serv15.avernis.de
X-Virus-Status: Clean
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=umbiko.net; s=mail; 
 t=1722339591; bh=zSBmIq/kMNuElgFM79QsWsYLsX/d9VHSpxBhryoThHk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References;
 b=buNUJ68pkjhQOifzuPQ55XnvS1Lrt/Z0PfN381QdmSfsc4Bc5RcHYbbiDJOj3tcYd
 Q/+igL9VLJCievZFcMTXVRn2HzY7lxgRALfYW7XaYXPU3+HrhszLqtKUZfQ1/E6wJO
 qcj1vz96B1PfwX4T9iudPWH2LfYBNu+S1SuH+HCw=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=umbiko.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=umbiko.net header.i=@umbiko.net header.a=rsa-sha256
 header.s=mail header.b=buNUJ68p
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

On 2024-07-30 09:50, Frank Wunderlich wrote:
> Hi
> 
>> Gesendet: Montag, 22. Juli 2024 um 07:15 Uhr
>> Von: "Andreas Ziegler" <br015@umbiko.net>
>> An: "Frank Wunderlich" <frank-w@public-files.de>
>> Cc: "buildroot" <buildroot@buildroot.org>
>> Betreff: Re: Aw: Re:  Re:  Re: lvm2 seems to require systemd
>> 
>> Hi Frank,
>> 
>> On 2024-07-21 19:37, Frank Wunderlich wrote:
>> > Hi
>> >
>> >> Gesendet: Sonntag, 21. Juli 2024 um 19:58 Uhr
>> >> Von: "Andreas Ziegler" <br015@umbiko.net>
>> >> An: "Frank Wunderlich" <frank-w@public-files.de>
>> >> Cc: "buildroot" <buildroot@buildroot.org>
>> >> Betreff: Re: Aw: Re:  Re: lvm2 seems to require systemd
>> >>
>> >> Hi Frank,
>> >>
>> >> On 2024-07-21 15:50, Frank Wunderlich wrote:
>> >> > Hi Andreas
>> >> >
>> >> > noticed some errors when calling the vgchange command
>> >> >
>> >> > # /usr/sbin/lvm vgchange -aay --autoactivation event vg-nvme
>> >> >   1 logical volume(s) in volume group "vg-nvme" now active
>> >> > [ 8023.796866] udevd[1614]: failed to execute '/usr/sbin/blkid'
>> >> > '/usr/sbin/blkid -o udev -p /dev/dm-0': No such file or directory
>> >> > [ 8023.808977] udevd[1610]: conflicting device node
>> >> > '/dev/mapper/vg--nvme-var' found, link to '/dev/dm-0' will not be
>> >> > created
>> >> > # lvscan
>> >> >   ACTIVE            '/dev/vg-nvme/var' [10.00 GiB] inherit
>> >>
>> >> Your execution of vgchange triggers additional udev messages, that are
>> >> not handled correctly. Try to find out what is missing and add it to
>> >> your image; blkid, for example, is part of package util-linux.
>> >
>> > i have already enabled util_linux
>> > Symbol: BR2_PACKAGE_UTIL_LINUX [=y]
>> > BR2_PACKAGE_HOST_UTIL_LINUX [=y]
>> > BR2_PACKAGE_UTIL_LINUX_LIBBLKID [=y]
>> >
>> > so strange that blkid is not there, but it is in /sbin
>> >
>> > # which blkid
>> > /sbin/blkid
>> >
>> > maybe a symlink needs to be created?
>> >
>> 
>> Sorry, my mistake: blkid is provided by busybox and busybox installs 
>> it
>> in /sbin. Since this is a Buildroot feature (unless you activate
>> BR2_ROOTFS_MERGED_USER), I would modify the udev rule.
>> 
>> >> The double-dash in vg--nvme-var looks strange: is this intentional?
>> >
>> > as you can see above i used only one dash in vg-nvme, not sure why
>> > another one was inserted here
>> >
>> > # pvscan
>> >   PV /dev/nvme0n1p5   VG vg-nvme   lvm2 [<1.79 TiB / <1.78 TiB free]
>> >   Total: 1 [<1.79 TiB] / in use: 1 [<1.79 TiB] / in no VG: 0 [0   ]
>> >
>> >> > but i'm able to mount it
>> >> >
>> >> > # mkdir /mnt/var
>> >> > # mount /dev/mapper/vg--nvme-var /mnt/var/
>> >> > [ 8514.687803] EXT4-fs (dm-0): mounted filesystem
>> >> > be8b31d6-96e2-43a1-8416-a058972118b3 r/w with ordered data mode. Quota
>> >> > mode: disabled.
>> >> > # ls /mnt/var
>> >> > cache       lib         log         lost+found  run         tmp
>> >> > #
>> >> >
>> >> > how can i test the script? currently i'm in the initrd, so changing
>> >> > anything will be lost on reboot, so i want to test the script before
>> >> > putting it into the initrd.
>> >>
>> >> I usually mount the target's file system via ssh://root@hostname in a
>> >> file browser; that allows me to copy to and from the target machine.
>> >> Script and configuration changes are made directly on the target
>> >> system,
>> >> and copied back to the development machine when everything runs
>> >> satisfactorily.
>> >>
>> >> > as far as i see the original call via udev contains some
>> >> > systemd-specific params and environment-vars i do not know currently
>> >>
>> >> They are probably safe to ignore; when in doubt, consult the systemd
>> >> documentation. Evironment variables are extensively used within the
>> >> udev
>> >> context; I doubt that the called lvm2 tool makes use of them.
>> >
>> > they seem to be systemd options which are not stripped by the script
>> > yet which
>> > will result in invalid call (imho only first param is shifted away)
>> >
>> 
>> RUN+="/usr/bin/systemd-run \
>>    --no-block \
>>    --property DefaultDependencies=no \
>>    --unit lvm-activate-$env{LVM_VG_NAME_COMPLETE} \
>>    /usr/sbin/lvm \
>>    vgchange \
>>    -aay \
>>    -autoactivation \
>>    event $env{LVM_VG_NAME_COMPLETE}"
>> 
>> If you put a 'shift 5' at the beginning of the script, it should get 
>> rid
>> of the systemd parameters. Alternatively, you could modify the udev
>> rule.
> 
> I'm not sure how to fix properly....where should i put the script (it 
> is called on bootup and there my changes done on runtime are dropped) 
> and where to call it (imho it should be called by the existing 
> udev-rule, right)?

The script might go into /usr/bin. Put all new or changed files in a 
separate directory, within a layout reflecting that of your root 
filesystem. Configure Buildroot's  BR2_ROOTFS_OVERLAY and these files - 
with their relative directories - will be copied to the root filesystem 
after build and before image creation. For examples, see [1].

> how to fix the blkid properly (maybe add symlink)? but this has to be 
> done in source too or while building.

Leave blkid where it is, modify the udev script and put it in your 
overlay filesystem. As Arnout suggested, reworking all of the udev 
scripts will probably be the easiest approach ...

> sorry for my noob questions, but my buildroot-knowledge is only :)

The Buildroot manual [2] is quite useful. Bootlin has some training 
materials [3] for general use.

Kind regards,
Andreas

> 
> regards Frank
> 

<cut>

[1] https://buildroot.org/downloads/manual/manual.html#customize
[2] https://buildroot.org/docs.html
[3] https://bootlin.com/docs/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

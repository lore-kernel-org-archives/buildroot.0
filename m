Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1950BC4829A
	for <buildroot@archiver.kernel.org>; Sat, 10 Feb 2024 18:37:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B896F60646;
	Sat, 10 Feb 2024 18:37:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZIzIfrVdR1Xt; Sat, 10 Feb 2024 18:37:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CD6A46067A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CD6A46067A;
	Sat, 10 Feb 2024 18:37:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AD5011BF365
 for <buildroot@lists.busybox.net>; Sat, 10 Feb 2024 18:37:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A79BF833CD
 for <buildroot@lists.busybox.net>; Sat, 10 Feb 2024 18:37:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tR1isUaxDWVy for <buildroot@lists.busybox.net>;
 Sat, 10 Feb 2024 18:37:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:868:100:600::216; helo=shout01.mail.de;
 envelope-from=kilian.zinnecker@mail.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A45B4833CA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A45B4833CA
Received: from shout01.mail.de (shout01.mail.de [IPv6:2001:868:100:600::216])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A45B4833CA
 for <buildroot@buildroot.org>; Sat, 10 Feb 2024 18:37:26 +0000 (UTC)
Received: from postfix01.mail.de (postfix01.bt.mail.de [10.0.121.125])
 by shout01.mail.de (Postfix) with ESMTP id 9BBF9240D28;
 Sat, 10 Feb 2024 19:37:24 +0100 (CET)
Received: from smtp01.mail.de (smtp04.bt.mail.de [10.0.121.214])
 by postfix01.mail.de (Postfix) with ESMTP id 80A3D801CB;
 Sat, 10 Feb 2024 19:37:24 +0100 (CET)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp01.mail.de (Postfix) with ESMTPSA id 7EE25240A5D;
 Sat, 10 Feb 2024 19:37:23 +0100 (CET)
To: kilian.zinnecker@mail.de, buildroot@buildroot.org,
 Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 10 Feb 2024 19:37:22 +0100
Message-ID: <1956485.PYKUYFuaPT@laptop>
In-Reply-To: <b52d94dd-072c-42bc-8958-58141e8a20e2@mind.be>
References: <2716329.mvXUDI8C0e@laptop>
 <b52d94dd-072c-42bc-8958-58141e8a20e2@mind.be>
MIME-Version: 1.0
X-purgate: clean
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate-type: clean
X-purgate-Ad: Categorized by eleven eXpurgate (R) http://www.eleven.de
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate: clean
X-purgate-size: 1920
X-purgate-ID: 154282::1707590244-B77EF338-4BD8B222/0/0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=mail.de; s=mailde202009; t=1707590244;
 bh=hyTLQtXl60sWknBz3+ISk3wSGsae93h3h4acYVR2P6A=;
 h=From:To:Subject:Date:Message-ID:From:To:CC:Subject:Reply-To;
 b=R+nvgT/G9KLsr8tg6ts/VxTf7kmcEWGbCQf+SnlRdy7xOvmY6FA7dfEqskt/IRQAK
 9eIyGeQO/0QiZeMWLLdfl4adRWGTjIL7jNSYFc5kQgvzieoWfJ8mepnRVliBuSMqMQ
 bVX20/D3zRsTJ6+sJaD0fu9tSbPOkyqFLCP7Uv58yet7R5BxYyyWJUr4oUjZqobRqV
 dqz8Udw/rFTwdEkomB1ITzEwcPqL1gHf2milkDZj/V2b+5yyzg94lXwXsR7xPbEg+G
 wPSZ8tSFhQNWfkFCS36Bq6ZUwvvO7l2tlL3vZiGArO5NKuR7/i2dIO6IbHEAROIfaD
 Bt50JhPdFsRLQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mail.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=fail reason="signature verification failed" (2048-bit key,
 unprotected) header.d=mail.de header.i=@mail.de header.a=rsa-sha256
 header.s=mailde202009 header.b=R+nvgT/G
Subject: Re: [Buildroot] [help] configs/rock5b_defconfig: Switch to mainline
 kernel
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
From: "kilian.zinnecker--- via buildroot" <buildroot@buildroot.org>
Reply-To: kilian.zinnecker@mail.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Arnout, all,

I was told that from kernel 6.7 on the ethernet of the Rock5B is supported, so 
I switched to that version (precisely 6.7.4 currently).

>   Clearly, the rootfs is on mmcblk1p2, not mmcblk0p2. So if you have
> mmcblk0p2 on your command line, and rootwait, it will just wait
> indefinitely for the rootfs to appear.

Yes, correct, when I switch to mmcblk1p2 it works now! But I also switched to 
kernel 6.7.4 for now and switched the console in the bootargs to ttyS2 again.

> > [   31.717905] vdd_gpu_s0: disabling
> > [  115.285576] random: crng init done
> 
>   That's pretty late for the RNG to be initialized, you'll need the RNG
> seeder from userspace - but this is enabled by default in Buildroot I
> think.

How could I check that?

> > Of course it could be, that it is just not configured anymore to put a
> > shell on the serial interface, but I already tried to address that with:
> > 
> > BR2_TARGET_GENERIC_GETTY=y
> > BR2_TARGET_GENERIC_GETTY_PORT="serial2"
> > 
> > However, that did not seem to help. Could it be, that there is something
> > wrong with the SD card formatting? It at least complains about it, but I
> > am too unfamiliar with that, so I don't know whether it is a problem.
> 
>   That's normal. It's because the generated image is not the exact size of
> your SD card, so the backup GPT partition table is somewhere in the middle
> instead of at the end. You can run parted on your laptop after writing the
> SD card and before booting it to fix the issue. But it shouldn't make any
> difference at all for booting.

Thanks, I am not familiar with this and thought, it might cause some troubles.

Currently the Rock5B does boot now with the 6.7.4 upstream kernel, but 
ethernet does not work yet. I try to figure out how to get it working, then I 
will submit a patch.

Thanks for your help and best regards,
Kilian



_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

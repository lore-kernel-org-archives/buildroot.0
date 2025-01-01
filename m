Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0945DE7718B
	for <buildroot@archiver.kernel.org>; Wed,  1 Jan 2025 21:00:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C2537817A1;
	Wed,  1 Jan 2025 21:00:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kX3dmbnKBu2d; Wed,  1 Jan 2025 21:00:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C28D9817F2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C28D9817F2;
	Wed,  1 Jan 2025 21:00:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 713D5E0F
 for <buildroot@buildroot.org>; Wed,  1 Jan 2025 21:00:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 403A240197
 for <buildroot@buildroot.org>; Wed,  1 Jan 2025 21:00:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sz4xQgzdJzJF for <buildroot@buildroot.org>;
 Wed,  1 Jan 2025 21:00:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:868:100:600::216; helo=shout01.mail.de;
 envelope-from=kilian.zinnecker@mail.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 04A5D4011D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 04A5D4011D
Received: from shout01.mail.de (shout01.mail.de [IPv6:2001:868:100:600::216])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 04A5D4011D
 for <buildroot@buildroot.org>; Wed,  1 Jan 2025 21:00:10 +0000 (UTC)
Received: from postfix03.mail.de (postfix03.bt.mail.de [10.0.121.127])
 by shout01.mail.de (Postfix) with ESMTP id 379F7240CB2;
 Wed,  1 Jan 2025 22:00:09 +0100 (CET)
Received: from smtp01.mail.de (smtp02.bt.mail.de [10.0.121.212])
 by postfix03.mail.de (Postfix) with ESMTP id 0E9C326003B;
 Wed,  1 Jan 2025 22:00:09 +0100 (CET)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp01.mail.de (Postfix) with ESMTPSA id 3D48A24148D;
 Wed,  1 Jan 2025 22:00:08 +0100 (CET)
To: Han Gao <rabenda.cn@gmail.com>
Cc: buildroot@buildroot.org, Drew Fustini <dfustini@tenstorrent.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 robertcnelson@beagleboard.org, jkridner@beagleboard.org,
 Drew Fustini <drew@beagleboard.org>
Date: Wed, 01 Jan 2025 21:59:11 +0100
Message-ID: <3851039.kQq0lBPeGt@kilian-laptop>
In-Reply-To: <CAAT7Ki9Js9C47anbGWMZ--gu88w=k1yVSbU_HJ=T2N7+7n_DUg@mail.gmail.com>
References: <20241230224631.1080014-1-kilian.zinnecker@mail.de>
 <2292259.iZASKD2KPV@kilian-laptop>
 <CAAT7Ki9Js9C47anbGWMZ--gu88w=k1yVSbU_HJ=T2N7+7n_DUg@mail.gmail.com>
MIME-Version: 1.0
X-purgate: clean
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate-type: clean
X-purgate-Ad: Categorized by eleven eXpurgate (R) https://www.eleven.de
X-purgate: This mail is considered clean (visit https://www.eleven.de for
 further information)
X-purgate: clean
X-purgate-size: 1631
X-purgate-ID: 154282::1735765208-35D3689E-97C52BAE/10/3626336762
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=mail.de; s=mailde202009; t=1735765209;
 bh=qWtcaS1rCHBfNfvKlJWXut5w1LCfgVcRirKGXbZ8+iE=;
 h=From:To:Cc:Subject:Date:Message-ID:From:To:CC:Subject:Reply-To;
 b=I6NHtRZYCjHCz752d3LRsvTGL+CLtMj/usZk5VBPM5EHlLr61yRbGAo+kwc0rN4Iw
 hc5h5Ox5Nn6k9Cb+mzHD4E47JbYdk9hi7tSsa/bzxgXW8qX5f4VzjFgPINsArsqFf5
 qMYn2QFB5QAOYi2cbctNgSLmw/uzC3gk32jtKpdHSpPxxcgI6xFH21AtGmkvDPl/S1
 +WZ8TD/mxsskzuq+CdrF4ywBHJzitFIB61mCAdj2vs5jfJ3flfcpOaa6G3TKk7bDpu
 VvLbLW3kGZYK7THCSVD8/H9hflEmRIVx1HWj3AcCW8b4a8oO7lnlnrt8EtRiQH63EC
 XZmGokUMGq33w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mail.de
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mail.de header.i=@mail.de
 header.a=rsa-sha256 header.s=mailde202009 header.b=I6NHtRZY
Subject: Re: [Buildroot] [PATCH v5 0/2] Add board support for the
 BeagleV-Ahead
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Kilian Zinnecker via buildroot <buildroot@buildroot.org>
Reply-To: Kilian Zinnecker <kilian.zinnecker@mail.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Han,


> > 1) Are the xuantie binary blobs still needed? The light_aon_fpga.bin and
> > the
> light_c906_audio.bin?
> 
> The TH1520 chip is composed of E902+C906+4*C910V.
> The light_aon_fpga.bin needs to be loaded into E902 to manage power
> and assist in implementing S3/S4.
> The light_c906_audio.bin needs to be loaded on C906 and is responsible
> for audio related.

Do you happen to know what the license for these binaries is? The repository I 
currently use to obtain the binaries does not have a LICENSE file. But we will 
need one to get the board support added to buildroot.

> > 2) The revyos uboot seems to also need the reset-sampe device tree node. I
> 
> therefore added it via a custom device tree. However I still get the error
> message "## fdt has no reset_sample". Any idea, what could be wrong here?
> 
> Just a debug warning message.
> bootm.c#L173 call reset_sample

Actually also a fault on my side: I specified the wrong name for the device 
tree blob, hence it couldn't work. Now it works and the error message ist 
gone.

> This solution is not perfect. This solution assumes that hart 0 is the
> boot core,
> which is inconsistent with the solution of opensbi randomly picking a
> hart as the boot core, so a patch may be needed.
> 
> [1]
> https://github.com/revyos/thead-u-boot/blob/th1520/arch/riscv/lib/bootm.c#L
> 173 [2]
> https://github.com/revyos/opensbi/blob/9de52c0fdff78bf7f1d271b3bc07ec3bcd5c
> 3bf2/platform/generic/thead/thead-generic.c#L438C11-L438C26

Thanks for the insights! I just sent a v6 of the patches.

Best regards,
Kilian


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

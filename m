Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A23DE7718B
	for <buildroot@archiver.kernel.org>; Wed,  1 Jan 2025 17:14:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B3F7F81D11;
	Wed,  1 Jan 2025 17:14:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k7Gp0Iefgnuu; Wed,  1 Jan 2025 17:14:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A54C381183
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A54C381183;
	Wed,  1 Jan 2025 17:14:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id ECC5CF27
 for <buildroot@buildroot.org>; Wed,  1 Jan 2025 17:14:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C8066409BA
 for <buildroot@buildroot.org>; Wed,  1 Jan 2025 17:14:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G2zmlwR0vMNA for <buildroot@buildroot.org>;
 Wed,  1 Jan 2025 17:14:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:868:100:600::217; helo=shout02.mail.de;
 envelope-from=kilian.zinnecker@mail.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2B65540E1F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2B65540E1F
Received: from shout02.mail.de (shout02.mail.de [IPv6:2001:868:100:600::217])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2B65540E1F
 for <buildroot@buildroot.org>; Wed,  1 Jan 2025 17:14:22 +0000 (UTC)
Received: from postfix02.mail.de (postfix02.bt.mail.de [10.0.121.126])
 by shout02.mail.de (Postfix) with ESMTP id 4D105240DB0;
 Wed,  1 Jan 2025 18:14:20 +0100 (CET)
Received: from smtp01.mail.de (smtp02.bt.mail.de [10.0.121.212])
 by postfix02.mail.de (Postfix) with ESMTP id 1F35F240553;
 Wed,  1 Jan 2025 18:14:20 +0100 (CET)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp01.mail.de (Postfix) with ESMTPSA id C5C88241822;
 Wed,  1 Jan 2025 18:14:18 +0100 (CET)
To: buildroot@buildroot.org
Cc: buildroot@buildroot.org, Drew Fustini <dfustini@tenstorrent.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Drew Fustini <drew@beagleboard.org>
Date: Wed, 01 Jan 2025 18:13:21 +0100
Message-ID: <1907661.tdWV9SEqCh@kilian-laptop>
In-Reply-To: <Z3R34e8Z22ujM2mG@x1>
References: <20241230224631.1080014-1-kilian.zinnecker@mail.de>
 <3603154.iIbC2pHGDl@kilian-laptop> <Z3R34e8Z22ujM2mG@x1>
MIME-Version: 1.0
X-purgate: clean
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate-type: clean
X-purgate-Ad: Categorized by eleven eXpurgate (R) https://www.eleven.de
X-purgate: This mail is considered clean (visit https://www.eleven.de for
 further information)
X-purgate: clean
X-purgate-size: 3767
X-purgate-ID: 154282::1735751659-38D3C89E-DCE4D6E6/10/3626336762
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=mail.de; s=mailde202009; t=1735751660;
 bh=d1PX4ido+e4sEyfdeU40erRMMqcbQkp8HtadE+7nMYw=;
 h=From:To:Cc:Subject:Date:Message-ID:From:To:CC:Subject:Reply-To;
 b=rOKcdFdudkxnCZCRJwT45SxQAN5PYRNhpJf+NipJtPB+ljOWwy8uS1oqxJ4Zx1g1j
 4VH2EzW12dqB34ItBX5NMlqYE+hEx8PWnaw8XVR1kZEfZD6shBa10XWExgAIG2ABKy
 EmdmPZymPsMq8Eb+I9hSACUNhfi7AHM+LgUytcftNw4OqeUXySTxbz3MlSFZOV85FQ
 xA5Z5Mg61iSXICMK6gSXAac7QqrsLbRCkfFkdAoQz08YJYKnXZxbjtq1Wh71xZOqXx
 RrzBQ7HGmKJuFiiV3muKmRdK5xaniLW++errCYHuq4BEUZoBUFsS40lZoBDXyl61K+
 1HAybxoW0eEFA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mail.de
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mail.de header.i=@mail.de header.a=rsa-sha256
 header.s=mailde202009 header.b=rOKcdFdu
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

Hello Drew,

[--SNIP--]
 
> When the TH1520-based Ahead and LPi4a boards launched, there was a
> device tree node that was parsed by OpenSBI to start up the other harts:
> 
[--SNIP--]
> 
> The node was handled by OpenSBI in lib/utils/reset/fdt_reset_thead.c.
> The problem was that the design of this device tree node had flaws from
> the viewpoint of the device tree maintainers. Therefore, the upstream
> th1520.dtsi doesn't have the reset-sample node. One would need to keep a
> downstream version of th1520.dtsi that adds that reset-sample node.
> 
> However, this functionality was removed last year from OpenSBI, I think
> the change made it in the OpensBI v1.4 release:
[--SNIP--]
> 
> Thus for OpenSBI v1.4+, one must have an updated U-Boot SPL build that
> performs this reset functionality that OpenSBI used to. SPL is the early
> portion of U-Boot that does early setup like DDR training. There is a
> build of U-Boot SPL for the LPi4a from RevyOS that does this. However,
> I'm not sure about the status for the Ahead so I'll have to followup on
> that.

thanks a lot for your insights! I tried two things, but unfortunately so far I 
wasn't successful with either:

First, I made a patch which reverts the removal of fdt_reset_thead from 
OpenSBI and try to use that patch to bring back that functionality to OpenSBI 
1.6. However, turn out that down the road multiple further changes were made, 
which would have to be reverted. E.g., some structs and possible also code 
handling them, does not exist anymore in OpenSBI 1.6. So I think trying to 
bring back the functionality to v1.6 is probably the last resort if nothing 
else works. I also in general don't like this approach, because it likely will 
break if OpenSBI is eventually updated.

Hence, my second approach was to try to use OpenSBI 1.3.1 instead: I created a 
custom device tree containing the reset-sample not you pointed out. I then had 
to tackle a current issue revolving using a custom device tree and Linux 
6.12.x in buildroot (see [1]). However, there exists a working hotfix for that 
issue ([2]), so that is no problem at the moment. But unfortunately the 
OpenSBI 1.3.1 seems to be a problem. Uppon booting I get the error message:

init_coldboot: timer init failed (error -3)

Seems to be an error message thrown in sbi_init.c:

https://github.com/riscv-software-src/opensbi/blob/release-1.3.x/lib/sbi/
sbi_init.c#L342

Looking a bit deeper, it seems to come from a function 
"sbi_platform_timer_init":

https://github.com/riscv-software-src/opensbi/blob/
bd613dd92113f683052acfb23d9dc8ba60029e0a/include/sbi/sbi_platform.h#L581

I can't track further, as I don't know which "const struct sbi_platform *plat" 
is used here. However, seems like others had this issue in the past as well:

https://github.com/sipeed/LicheePi4A/issues/29

Their solution seem to be to switch to OpenSBI 1.4. However, I guess, then we 
will have the problem that the core 1-3 are not activate again? If we can't fix 
any of those two ways, then there might be still the revyos u-boot, you 
mentioned. Is it this one?

https://github.com/revyos/thead-u-boot

It does contain a commit indicating that it might also feature the BeagleV-
Ahead ([3]) and also has dts files for the board. What do you think, about 
these options? Do you know anything which could help patching OpenSBI 1.6, 
getting OpenSBI 1.3.1 running or using the revyos u-boot?

Thanks and best regards,
Kilian


[1] https://lists.buildroot.org/pipermail/buildroot/2024-October/765463.html
[2] https://lore.kernel.org/buildroot/
035d6d78-0a31-4083-8fa1-65f5be5f74b5@grenoble.cnrs.fr/
[3] https://github.com/revyos/thead-u-boot/commit/79454e91


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

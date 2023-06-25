Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FAF2EB64DC
	for <buildroot@archiver.kernel.org>; Sun, 25 Jun 2023 14:31:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D76294098B;
	Sun, 25 Jun 2023 14:31:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D76294098B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id koi6M-mrOFQJ; Sun, 25 Jun 2023 14:31:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D396640955;
	Sun, 25 Jun 2023 14:31:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D396640955
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1B7EF1BF3BD
 for <buildroot@lists.busybox.net>; Sun, 25 Jun 2023 14:31:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E83F440955
 for <buildroot@lists.busybox.net>; Sun, 25 Jun 2023 14:31:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E83F440955
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1tAnuVktWzjW for <buildroot@lists.busybox.net>;
 Sun, 25 Jun 2023 14:31:27 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 02E1D40104
Received: from shout02.mail.de (shout02.mail.de [IPv6:2001:868:100:600::217])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 02E1D40104
 for <buildroot@buildroot.org>; Sun, 25 Jun 2023 14:31:26 +0000 (UTC)
Received: from postfix02.mail.de (postfix02.bt.mail.de [10.0.121.126])
 by shout02.mail.de (Postfix) with ESMTP id A5C27A0481;
 Sun, 25 Jun 2023 16:31:24 +0200 (CEST)
Received: from smtp03.mail.de (smtp03.bt.mail.de [10.0.121.213])
 by postfix02.mail.de (Postfix) with ESMTP id 8B1C8A03C1;
 Sun, 25 Jun 2023 16:31:24 +0200 (CEST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp03.mail.de (Postfix) with ESMTPSA id 500AEA013C;
 Sun, 25 Jun 2023 16:31:23 +0200 (CEST)
To: "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Date: Sun, 25 Jun 2023 16:31:22 +0200
Message-ID: <13292600.uLZWGnKmhe@kilian-aisec>
In-Reply-To: <20230625130227.GL24952@scaer>
References: <5686076.DvuYhMxLoT@kilian-aisec> <20230625130227.GL24952@scaer>
MIME-Version: 1.0
X-purgate: clean
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate-type: clean
X-purgate-Ad: Categorized by eleven eXpurgate (R) http://www.eleven.de
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate: clean
X-purgate-size: 1346
X-purgate-ID: 154282::1687703484-B97F8647-2DAC0C95/0/0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=mail.de; s=mailde202009; t=1687703484;
 bh=DGEPJmGYDL9tWdePk43K2LqeyJ/6IJiTkkt3Z+XB+qk=;
 h=From:To:Subject:Date:Message-ID:From:To:CC:Subject:Reply-To;
 b=oA0kDk+dbSVPjZQQZqWtK3fq/nSTtv8z86WeQAOSIqiD/R2W1TRcZcDIP2Myh+FAH
 sU5qGyoamY4Q5HGfQXTd20TCwYxKY43heBEIezPQoJik6KpW++XJ4t1qsdYqoudvuz
 Fco1sKsoq+nmiIkD4zSIleRx5zfuMNClis0t/rOi/eB6IkaYFSqvFIYAbao6B6fBvX
 i/dy2YawIFpojLmpbccoJOEdxPrvbV7A/rGJ36K9I5xwjogC0EcGewevWAFRiVqoDM
 TLVQPG3aUDB/SYM+YQnOpF2lo7uvbp/3FD1kTodJipMoLqGJSTq2H2qfUIoKYjqydl
 JGfheSL6wC8sw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=fail reason="signature verification failed" (2048-bit key)
 header.d=mail.de header.i=@mail.de header.a=rsa-sha256 header.s=mailde202009
 header.b=oA0kDk+d
Subject: Re: [Buildroot] Problem: Setting Uboot custom version does not
 apply defconfig
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
From: Kilian Zinnecker via buildroot <buildroot@buildroot.org>
Reply-To: Kilian Zinnecker <kilian.zinnecker@mail.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Yann,

thanks for your answer.
 
>
> Looks like it is working as expected here, with this defconfig:
> 
>     BR2_aarch64=y
>     BR2_cortex_a76_a55=y
>     BR2_TOOLCHAIN_EXTERNAL=y
>     BR2_TARGET_UBOOT=y
>     BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
>     BR2_TARGET_UBOOT_CUSTOM_VERSION=y
>     BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2023.07-rc4"
>     BR2_TARGET_UBOOT_BOARD_DEFCONFIG="rock5b-rk3588"
>     BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
>     BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
>
Thanks, it does work now! I was missing the openssl dependency and had some 
other uboot settings, which I removed. However, I don't understand what 
exactly then went wrong, such that the uboot .config was not present ... well, 
it does work now :)

>
> Note that the build fails much later, because it can't find
> rockchip-tpl.bin; see tools/binman/missing-blob-help for some hint on
> how to fix that.
> 

Yes! Some ATF binaries are missing, which are provided by Rockchip as binary 
blobs. I am currently trying to prepare a buildroot package for those, such 
that the needed binaries are present for uboot at build. There is already a 
discussion about it, see email with the subject "Interested in board support 
for Radxa Rock 5b" on the buildroot mailing list.

Best regards and thanks alot,
Kilian




_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

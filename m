Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A80E9C433EF
	for <buildroot@archiver.kernel.org>; Sat, 30 Apr 2022 21:49:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 06791404CF;
	Sat, 30 Apr 2022 21:49:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bVJFOtUEAD-6; Sat, 30 Apr 2022 21:49:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EC4934026E;
	Sat, 30 Apr 2022 21:49:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AAE481BF94D
 for <buildroot@lists.busybox.net>; Sat, 30 Apr 2022 21:49:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 97A7360812
 for <buildroot@lists.busybox.net>; Sat, 30 Apr 2022 21:49:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id K2yHaUwJE-ID for <buildroot@lists.busybox.net>;
 Sat, 30 Apr 2022 21:49:31 +0000 (UTC)
X-Greylist: delayed 00:07:03 by SQLgrey-1.8.0
Received: from smtpcmd15177.aruba.it (smtpcmd15177.aruba.it [62.149.156.177])
 by smtp3.osuosl.org (Postfix) with ESMTP id F01346076C
 for <buildroot@buildroot.org>; Sat, 30 Apr 2022 21:49:30 +0000 (UTC)
Received: from [192.168.50.220] ([146.241.34.210])
 by Aruba Outgoing Smtp  with ESMTPSA
 id kurAnzKowQDqNkurAn6euT; Sat, 30 Apr 2022 23:42:24 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1651354944; bh=0o3M3OEOuuBE1CFqWIESP9Yca75te59m2pFVeBR9dKQ=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=g1iDRPAcGJPL1fJg1D8LpsQ+R/zSK5RZsQK/+1FmsHgoGenUXxgPs30fTu2KCUTsB
 G11e1mVFX6jiVx2Rhe/fl2cTqx/OWiO25U7AJ/2r0ws62S2WcHe1HAxVs5gRDGLJaa
 nC4589NcSgCwi+uvyfHAN2OgOmi04dAsc15uAi9hjMnS1878IUOdln+Hm2eqwyoITO
 nSTovPcQsUVDLACBQIT6NthdjUqXhgjSvvZ6kZa4C56lJAqTRtBQX1IIkNAnlnjFh2
 BSeUvDGkt4a3YTjd/GyT/6UYRvLnehUyMmXbUFqaajh7/5LKoIcnG7Bb5eJdEQjG4i
 IFkYtbpcll1cw==
Message-ID: <84cb64cf-fed9-fc33-a811-b6d60a8d49a3@benettiengineering.com>
Date: Sat, 30 Apr 2022 23:42:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Content-Language: en-US
To: Albert Jose Silva Tovar <albertsilva.26@hotmail.com>
References: <ROAP284MB12483B83EF9C7269C235ABD988FC9@ROAP284MB1248.BRAP284.PROD.OUTLOOK.COM>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <ROAP284MB12483B83EF9C7269C235ABD988FC9@ROAP284MB1248.BRAP284.PROD.OUTLOOK.COM>
X-CMAE-Envelope: MS4xfP6oDjeZQb6rtW5lSDUSVgSC0btv2Gv2QyQA3oDeILqkL9+ZaP80PBc1EPHOVLzgMsV8wonSZiVd1jmVUAA6or0Kk/g7HJPU/QV0mtSO4w65CsLRobBP
 TeEp0x59xojygeu+eCzkV7UWwRMxJsmoSGsx5aKW97mAhlBfXcbnaiCpdMdvSN1Gl7h5i9QBSa6KJuzp6Gq/yk4C1xec/8JXkA86NPpk8SfaY+gIRy7qCeBw
 b0tItAGxiA1Q4bUOIJ9NGfIOCl4zUwya959lNWOm3pU=
Subject: Re: [Buildroot] Pantalla tactil - hycon-hy46xx.c
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

Hi Albert,

I add Buildroot ML in Cc since it's in a good part Buildroot related and 
other people can help too,

On 29/04/22 14:28, Albert Jose Silva Tovar wrote:
> Good afternoon Julio,
> 
> I am writing to you because of a contribution you made on this website:
> https://github.com/torvalds/linux/blob/master/drivers/input/touchscreen/hycon-hy46xx.c 
> <https://github.com/torvalds/linux/blob/master/drivers/input/touchscreen/hycon-hy46xx.c>
> 
> I would like to ask you a question! I have a builroot OS and I would 
> like to integrate this drivers to it, the sources that you use, in 
> principle where would I have to put them or what would be the process of 
> adapting the driver?

I think you're using a Linux version without the hycon driver, so what 
you can do is to patch the kernel you're using by adding the patch to 
Buildroot for Linux.

So you have to:
1. clone kernel git and checkout the version you're using or directly 
use your own kernel repository if any
2. clone mainline kernel
3. extract my patches from the cloned mainline kernel with:
"git format-patch" command
4. copy the patches to your buildroot/board/company/linux like this:
 
https://github.com/buildroot/buildroot/tree/master/board/seeed/stm32mp157c-odyssey/patches
5. use the BR2_GLOBAL_PATCH_DIR variable in your Buildroot defconfig, 
like this:
 
https://github.com/buildroot/buildroot/blob/master/configs/stm32mp157c_odyssey_defconfig#L3
6. rebuild Buildroot

That is the way I would do it.

Which Linux version are you using?

Feel free to ask me more help also regarding the driver itself if you 
encounter problems with back-porting my patches.

Best regards
-- 
Giulio Benetti
Benetti Engineering sas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

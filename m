Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A66AC4332F
	for <buildroot@archiver.kernel.org>; Mon, 12 Dec 2022 15:41:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DCD5B410D1;
	Mon, 12 Dec 2022 15:41:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DCD5B410D1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pXnD2dFGa0JB; Mon, 12 Dec 2022 15:41:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B88A9410B5;
	Mon, 12 Dec 2022 15:41:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B88A9410B5
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3B56D1BF2B4
 for <buildroot@lists.busybox.net>; Mon, 12 Dec 2022 15:41:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 239A460D94
 for <buildroot@lists.busybox.net>; Mon, 12 Dec 2022 15:41:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 239A460D94
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4FUIJpYw9VJb for <buildroot@lists.busybox.net>;
 Mon, 12 Dec 2022 15:41:07 +0000 (UTC)
X-Greylist: delayed 00:08:11 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2F51A60D5B
Received: from mail-41103.protonmail.ch (mail-41103.protonmail.ch
 [185.70.41.103])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2F51A60D5B
 for <buildroot@buildroot.org>; Mon, 12 Dec 2022 15:41:07 +0000 (UTC)
Date: Mon, 12 Dec 2022 15:32:40 +0000
To: Peter Korsgaard <peter@korsgaard.com>
Message-ID: <_Xy-l8Ny6TGT7WRiixo_CPZYHzdUIuGYexyAlFzMnPCN0loQWU_ydtPGjnGDOAPHohUUzztFqL1rbhYa5bVk7cO2NN6fK_cUPe8cL4MiTMo=@troodon-software.com>
In-Reply-To: <87359lytkg.fsf@dell.be.48ers.dk>
References: <20221211201704.25858-1-indrek.kruusa@gmail.com>
 <87359lytkg.fsf@dell.be.48ers.dk>
Feedback-ID: 38965776:user:proton
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=troodon-software.com; s=protonmail3; t=1670859164; x=1671118364;
 bh=5U2dU2Edq5pF9C7JgiywjBVSqDdP9SYlH0wIroa5gj8=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=UYOsqbxbV9oYqJM5uuHwNYEQpOrsFrdg6Ujze+Jp8l6BvpMksuS7WrIzyY2r7IbFY
 z+g1WMhWCNQeSr8+uMZsULn6Uh5ThKXl9CVcuwsxg7pzdhpf+lO08l29HoWKdmn95N
 ntPDUMwHvzuFQUdJJ7KBRcBJ1GwsDWw2xLyYE9EvYzMGA+YoWFs9jlyf0VnfJz9nFb
 cNUvjTib7r5i8JCr1W+2DJaIuiOjIeszyvhsR/TE17QkbCOXRTQlkmcAaiHHyuLgDC
 +18DsfI0N5ZjrW4FPkPCz/R2rUzMvg6qvnz2rEhqx06+8wTGe5qMFLBQxUKWCmVxtY
 d18cPI8Jx6bBA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=troodon-software.com header.i=@troodon-software.com
 header.a=rsa-sha256 header.s=protonmail3 header.b=UYOsqbxb
X-Mailman-Original-Authentication-Results: mail-41103.protonmail.ch;
 dkim=pass (2048-bit key) header.d=troodon-software.com
 header.i=@troodon-software.com header.b="UYOsqbxb"
Subject: Re: [Buildroot] [PATCH 1/5] configs/nezha_defconfig: bump versions
 for uboot, sbi and linux kernel
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
From: Frank Hunleth via buildroot <buildroot@buildroot.org>
Reply-To: Frank Hunleth <fhunleth@troodon-software.com>
Cc: Indrek Kruusa <indrek.kruusa@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

> >>>>> "Indrek" == Indrek Kruusa indrek.kruusa@gmail.com writes:
> 
> > BR2_TARGET_OPENSBI=y
> 
> > BR2_TARGET_OPENSBI_CUSTOM_TARBALL=y
> 
> > -BR2_TARGET_OPENSBI_CUSTOM_TARBALL_LOCATION="$(call github,smaeul,opensbi,e6793dc36a71537023f078034fe795c64a9992a3)/opensbi-e6793dc36a71537023f078034fe795c64a9992a3.tar.gz"
> 
> > +BR2_TARGET_OPENSBI_CUSTOM_TARBALL_LOCATION="$(call github,smaeul,opensbi,5307908fb651a01cc6a2f3fd9fc7b9b471bbccb3)/opensbi-5307908fb651a01cc6a2f3fd9fc7b9b471bbccb3.tar.gz"
> 
> 
> Why still use this custom opensbi? There is D1 support in version 1.1 as
> mentioned on https://linux-sunxi.org/Allwinner_Nezha
> 

Just in case it helps, I've been testing both the Korsgaard and Kruusa patches on a MangoPI MQ Pro. This board is close, but not exactly like the Nezha, so I expect differences.

Using OpenSBI 1.1 results in a non-booting Linux kernel for me. Here's the error:

```
Unhandled exception: Store/AMO access fault
EPC: 000000005ff8f838 RA: 000000005ffb6346 TVAL: 0000000040040000
EPC: 0000000042e01838 RA: 0000000042e28346 reloc adjusted

Code: b383 0385 be03 0405 be83 0485 bf03 0505 (e110)
```

If I use riscv-software-src/opensbi master, Linux boots again. From my point of view, the Linux Sunxi wiki is correct that forks don't need to be used, but something appears to have been fixed after 1.1.

As a second note, I added the following based on the Sunxi wiki:

BR2_TARGET_OPENSBI_ADDITIONAL_VARIABLES="FW_PIC=y"

It's not clear to me that it makes a difference.

It doesn't seem right for me to add a Tested-By to the patch series since I have a different board. However, the Linux 6.1.0-rc3 update and U-Boot updates appear to be working well in my testing so far. My setup is closer to the Korsgaard patch set since I'm not using the HDMI output change. The OpenSBI issue with 1.1 is the only snag I hit.

Thank you both for your Nezha updates.

-Frank

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

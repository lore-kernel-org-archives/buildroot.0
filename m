Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 921B4C4332F
	for <buildroot@archiver.kernel.org>; Tue, 13 Dec 2022 21:39:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2FA5360FB8;
	Tue, 13 Dec 2022 21:39:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2FA5360FB8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JbXKJ_OW6f0B; Tue, 13 Dec 2022 21:39:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7943E60F49;
	Tue, 13 Dec 2022 21:39:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7943E60F49
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6073B1BF4E4
 for <buildroot@lists.busybox.net>; Tue, 13 Dec 2022 21:39:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3B6F281313
 for <buildroot@lists.busybox.net>; Tue, 13 Dec 2022 21:39:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3B6F281313
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bo_RTlVCK01l for <buildroot@lists.busybox.net>;
 Tue, 13 Dec 2022 21:39:23 +0000 (UTC)
X-Greylist: delayed 00:07:12 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 76A0D81248
Received: from mail-4327.protonmail.ch (mail-4327.protonmail.ch [185.70.43.27])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 76A0D81248
 for <buildroot@buildroot.org>; Tue, 13 Dec 2022 21:39:22 +0000 (UTC)
Date: Tue, 13 Dec 2022 21:32:00 +0000
To: Peter Korsgaard <peter@korsgaard.com>
Message-ID: <-RGRUyu_Rb7y4OO0GtQmXCmLMASiD2ZbUenzbGaZW9I6aHZhcsiY3yriYTsZDz1ZkKvVLOHm8Q_aFcGL9kz2kSIDqQqZFFyUydO3WHPibGI=@troodon-software.com>
In-Reply-To: <87pmcoy07y.fsf@dell.be.48ers.dk>
References: <20221211201704.25858-1-indrek.kruusa@gmail.com>
 <87359lytkg.fsf@dell.be.48ers.dk>
 <_Xy-l8Ny6TGT7WRiixo_CPZYHzdUIuGYexyAlFzMnPCN0loQWU_ydtPGjnGDOAPHohUUzztFqL1rbhYa5bVk7cO2NN6fK_cUPe8cL4MiTMo=@troodon-software.com>
 <87pmcoy07y.fsf@dell.be.48ers.dk>
Feedback-ID: 38965776:user:proton
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=troodon-software.com; s=protonmail3; t=1670967127; x=1671226327;
 bh=cj6kL4V5/L6EXG/hJfiC04eAGbdkBQkDXrSnrcUfHgg=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=itNEhOOx4Oy0PrtKSqTj79bKaWMeMD828DHZNwaQDMWtE80yxEmDitq72Zi9EmOp7
 xJpwTw1JLl2XqvGz362Cfw/WvlmAgyySYGOeYYjBgvK14x8w0m+yFYAs5pKI/+Q3nj
 ab0zQTFJBCEWPhyDjTVuCFIO4hSVuSl8QHoBiFNbdPB4QxAhSSuu2Et3g36RBy/MmJ
 sJZizCYH699lqML4ncv5ha25yg/vS/7j34szzqYHXy6nQM94Xh4TFOGujdd0gremVf
 byY0qXj33eGLsHOpQF88hFN0QspGvSONLDbaTFpLvxhTQ4SdMn+hfABdWc1yfZtE+s
 613SWzShijsMg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=troodon-software.com header.i=@troodon-software.com
 header.a=rsa-sha256 header.s=protonmail3 header.b=itNEhOOx
X-Mailman-Original-Authentication-Results: mail-4321.protonmail.ch;
 dkim=pass (2048-bit key) header.d=troodon-software.com
 header.i=@troodon-software.com header.b="itNEhOOx"
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

Peter, Indrek,

------- Original Message -------
On Monday, December 12th, 2022 at 12:56 PM, Peter Korsgaard <peter@korsgaard.com> wrote:
> > Just in case it helps, I've been testing both the Korsgaard and Kruusa
>
> > patches on a MangoPI MQ Pro. This board is close, but not exactly like
>
> > the Nezha, so I expect differences.
>
> > Using OpenSBI 1.1 results in a non-booting Linux kernel for me. Here's the error:
>
>
> Just to be sure, is this with the 5.19 based kernel we used to use
> (fe178cf0153d98b71cb01a46c8cc050826a17e77) or the "new" 6.1-rc3 based
> one (ca67838d84af4c9f85d06311c9e98e1adf46308f)?
>
> > Unhandled exception: Store/AMO access fault
>
> > EPC: 000000005ff8f838 RA: 000000005ffb6346 TVAL: 0000000040040000
>
> > EPC: 0000000042e01838 RA: 0000000042e28346 reloc adjusted
>
> > Code: b383 0385 be03 0405 be83 0485 bf03 0505 (e110)
>

I am able to run fine on a 512MB MangoPi MQ-Pro now. This is with the patches that were just merged and with the U-Boot defconfig and Linux DTS witched to the Mango Pi MQ-Pro options. 

I don't have an understanding of the store/AMO access fault above. I had an unintended change to my Linux configuration that just happens to require a later version of OpenSBI. I just wanted to follow up in case anyone stumbles on this thread that the simple U-Boot defconfig and dts switch to the MangoPi versions works.

-Frank
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

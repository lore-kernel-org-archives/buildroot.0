Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E869BC77B7D
	for <buildroot@archiver.kernel.org>; Sun,  7 May 2023 14:47:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 79DAB418AB;
	Sun,  7 May 2023 14:47:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 79DAB418AB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2QfevrjJMPkD; Sun,  7 May 2023 14:47:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7331A4187B;
	Sun,  7 May 2023 14:47:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7331A4187B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 355341BF2F8
 for <buildroot@lists.busybox.net>; Sun,  7 May 2023 14:47:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0E30460D76
 for <buildroot@lists.busybox.net>; Sun,  7 May 2023 14:47:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0E30460D76
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1WqkaErJQUxQ for <buildroot@lists.busybox.net>;
 Sun,  7 May 2023 14:47:36 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3F2B760C2A
Received: from mail.tkos.co.il (mail.tkos.co.il [84.110.109.230])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3F2B760C2A
 for <buildroot@buildroot.org>; Sun,  7 May 2023 14:47:35 +0000 (UTC)
Received: from tarshish (unknown [10.0.8.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.tkos.co.il (Postfix) with ESMTPS id 94A5C44064B;
 Sun,  7 May 2023 17:47:31 +0300 (IDT)
References: <20230507133235.584153-1-yann.morin.1998@free.fr>
 <20230507133555.GW252090@scaer> <87zg6g5i8e.fsf@dell.be.48ers.dk>
User-agent: mu4e 1.9.21; emacs 28.2
To: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 07 May 2023 17:44:25 +0300
In-reply-to: <87zg6g5i8e.fsf@dell.be.48ers.dk>
Message-ID: <874joo8agr.fsf@tarshish>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=tkos.co.il; s=default; t=1683470851;
 bh=cVY1L/jup2U8QkBlE9Dr5WmTiUXoDfi7i/1GD+dmHBU=;
 h=References:From:To:Cc:Subject:Date:In-reply-to:From;
 b=lvBIbLHWzRXrAt58vH/aDQPuYdUyjbBiq3wyf7yKf5kAkTaKEZSPax4BT0dorpFB4
 yPrLANpLGp3JFDShoOnr3eh7eCAm4sP5Tl2L7oJ8a9ZS5h1iwjUsO3NG7n4m9Pzctj
 fL8njgeaKLumRPWOc8iut09ac3FMXZ51drgjLODEV+ADrAzr7X77nCbdwadYhwkGKs
 7q9UtXp6aNFFetbcKOZcd8obR2wypJlIIOBprQMl+fkcZHVc8AOuLU/IVc4QjRZWu0
 YupmiBRPMscxPrlId2pwGkwWWgwY+tdwYarAaTtkathya3KoZFpSJLOAHueyNScJPs
 t+QbRQBwqKruw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=tkos.co.il header.i=@tkos.co.il
 header.a=rsa-sha256 header.s=default header.b=lvBIbLHW
Subject: Re: [Buildroot] [PATCH 2022.02.x] package/postgresql: fix licensing
 hash
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
From: Baruch Siach via buildroot <buildroot@buildroot.org>
Reply-To: Baruch Siach <baruch@tkos.co.il>
Cc: Maxim Kochetkov <fido_max@inbox.ru>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Peter,

On Sun, May 07 2023, Peter Korsgaard wrote:

>>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:
>  > Peter K., All,
>  > I know you just EOLed 2022.02.x a few days ago, but maybe a quick
>  > 2022.02.13 (or 2022.02.12.1) with just this?
>
> Perhaps, yes. I've applied the patch and will wait a few days to see if
> any other issues show up.

If another 2022.02.x release is planned you might want to consider the
libcurl security bump (commit 1e735c48372).

baruch

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

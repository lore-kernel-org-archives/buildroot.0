Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86E70C46CD2
	for <buildroot@archiver.kernel.org>; Tue,  9 Jan 2024 13:34:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 15CE841B5A;
	Tue,  9 Jan 2024 13:34:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 15CE841B5A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id L63VY1r5DYsV; Tue,  9 Jan 2024 13:34:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6689141B3C;
	Tue,  9 Jan 2024 13:34:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6689141B3C
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 48E2F1BF3A7
 for <buildroot@lists.busybox.net>; Tue,  9 Jan 2024 13:34:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 223CD610F4
 for <buildroot@lists.busybox.net>; Tue,  9 Jan 2024 13:34:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 223CD610F4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id w6uN8hvmLdeJ for <buildroot@lists.busybox.net>;
 Tue,  9 Jan 2024 13:34:43 +0000 (UTC)
Received: from mail.tkos.co.il (wiki.tkos.co.il [84.110.109.230])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DAB2660E6D
 for <buildroot@buildroot.org>; Tue,  9 Jan 2024 13:34:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DAB2660E6D
Received: from localhost (unknown [10.0.8.2])
 by mail.tkos.co.il (Postfix) with ESMTP id C79074403F1;
 Tue,  9 Jan 2024 15:32:28 +0200 (IST)
References: <20231203041841.492885-1-adam.duskett@amarulasolutions.com>
 <20231203041841.492885-2-adam.duskett@amarulasolutions.com>
 <871qaqbrfq.fsf@48ers.dk>
User-agent: mu4e 1.10.8; emacs 29.1
To: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 09 Jan 2024 15:33:40 +0200
In-reply-to: <871qaqbrfq.fsf@48ers.dk>
Message-ID: <875y02r5ow.fsf@tarshish>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=tkos.co.il; s=default; t=1704807148;
 bh=5w67bH25zFzNqew/tgWzYCug4wSYbQp0cHmZFCNWAzI=;
 h=References:From:To:Cc:Subject:Date:In-reply-to:From;
 b=kHINm5qZWhVbNyMC6y0eurxjBhvUtxWFtbMNIGanG8Tt0r50MRotzvh75b7vp2cVw
 i1AVcrdEZHyl/t7Eeq8mWDajJmRFg7gQZDjeNyAUhvY5Imioq+AoHHGryDAN2msiav
 BwzomHYsP6bZzmxSVsE6n74s2cJSFmMKcU+hjy72Z+sqpVBVdQZ07CMo3CbPG8TTT4
 cNc7fLd+OmCVce78fgpehrDuG9RWZnW4Kdfwg/GQp5LxGXfUarEz3LjulK2xyQcU59
 z2iAyO4MvjQkvM83cG6lDq/UV/mwSq856rI+gYyMsoVmwMw/6MqvGQsxxXN+jWAECF
 JuiOD8PA1NNQg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=tkos.co.il header.i=@tkos.co.il
 header.a=rsa-sha256 header.s=default header.b=kHINm5qZ
Subject: Re: [Buildroot] [PATCH 2/6] package/google-breakpad: disable uclibc
 support
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
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>,
 Pascal Huerst <pascal.huerst@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Peter,

On Tue, Jan 09 2024, Peter Korsgaard wrote:
>>>>>> "Adam" == Adam Duskett <adam.duskett@amarulasolutions.com> writes:
>
>  > The google-breakpad package uses stab.h which is not included in uClibc.
>  > Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
>
> Committed to 2023.02.x and 2023.11.x, thanks.

Not in 2023.02.x as of commit 34fee4fb35e04 ("package/php: bump version
to 8.2.14").

baruch

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

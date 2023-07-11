Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29437EB64DD
	for <buildroot@archiver.kernel.org>; Tue, 11 Jul 2023 21:03:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C7F72403A8;
	Tue, 11 Jul 2023 21:03:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C7F72403A8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nwh8gTkR5Zen; Tue, 11 Jul 2023 21:03:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AC6C540880;
	Tue, 11 Jul 2023 21:03:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AC6C540880
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3F8751BF48B
 for <buildroot@lists.busybox.net>; Tue, 11 Jul 2023 21:03:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 23318403A8
 for <buildroot@lists.busybox.net>; Tue, 11 Jul 2023 21:03:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 23318403A8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OvIelSbja-FQ for <buildroot@lists.busybox.net>;
 Tue, 11 Jul 2023 21:03:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B766C418F3
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B766C418F3
 for <buildroot@buildroot.org>; Tue, 11 Jul 2023 21:03:35 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 30D9F40003;
 Tue, 11 Jul 2023 21:03:32 +0000 (UTC)
Date: Tue, 11 Jul 2023 23:03:30 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230711230330.45b961b3@windsurf>
In-Reply-To: <20230705162011.1224688-1-bernd@kuhls.net>
References: <20230705162011.1224688-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1689109412;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oynWkvZRIzRo92VXt1DimTH/Gpl3ExzxgBy1tXxJuBg=;
 b=aIe3KnUtbDcPWGJFWMcnK5vl4xDPb5f1s7W9oR8OnFQHIqwMFyGbtwe+Y0beSRyFk/RKLs
 MrafK4efEZ8a1kF5rVxkuoS5IdG4XZcnoBncoxO8wdqD/INOTfsDTvVZMffu8PxMpu9E+f
 vXKY+ord7BsrHgWPbGTRHbKybrgM/TpfSTGL7CDEOTfkDgdR+QP0UIRqe71UYoSUQP8dOR
 AAfRuXUEgDm5XyC2EYgnLdO8u7JV7xTr2IX9Eg9/bSshfAQu1OXNdZcLf+GQadO4bI7F05
 e5cSog664UlnYlkxIFCBKBjf2y61rz49fhsvJvcyjzms/PGXrLcYLG3KUSQTXA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=aIe3KnUt
Subject: Re: [Buildroot] [PATCH 1/1] package/ffmpeg: force arm mode instead
 of Thumb mode
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Mahyar Koshkouei <mahyar.koshkouei@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed,  5 Jul 2023 18:20:11 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Fix the following build failure:
> /tmp/ccw5V2Ti.s: Assembler messages:
> /tmp/ccw5V2Ti.s:2013: Error: selected processor does not support `itt gt' in Thumb mode
> /tmp/ccw5V2Ti.s:2014: Error: Thumb does not support conditional execution
> /tmp/ccw5V2Ti.s:2015: Error: Thumb does not support conditional execution
> /tmp/ccw5V2Ti.s:2017: Error: selected processor does not support `it le' in Thumb mode
> /tmp/ccw5V2Ti.s:2018: Error: Thumb does not support conditional execution
> /tmp/ccw5V2Ti.s:2020: Error: selected processor does not support `it gt' in Thumb mode
> /tmp/ccw5V2Ti.s:2021: Error: Thumb does not support conditional execution
> 
> Fixes:
> http://autobuild.buildroot.net/results/3fc/3fc68f756cf1661673941c411c4a2477e901e361/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/ffmpeg/ffmpeg.mk | 4 ++++
>  1 file changed, 4 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

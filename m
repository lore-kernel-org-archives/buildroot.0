Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7399BC001DE
	for <buildroot@archiver.kernel.org>; Fri, 28 Jul 2023 19:26:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2DC8B84550;
	Fri, 28 Jul 2023 19:26:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2DC8B84550
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GZSFL0S8tgtj; Fri, 28 Jul 2023 19:26:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 63C6084558;
	Fri, 28 Jul 2023 19:26:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 63C6084558
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 790A61BF312
 for <buildroot@lists.busybox.net>; Fri, 28 Jul 2023 19:25:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 602FE401E1
 for <buildroot@lists.busybox.net>; Fri, 28 Jul 2023 19:25:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 602FE401E1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LSvrfBxPJj_l for <buildroot@lists.busybox.net>;
 Fri, 28 Jul 2023 19:25:52 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B5F5D40168
 for <buildroot@buildroot.org>; Fri, 28 Jul 2023 19:25:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B5F5D40168
Received: by mail.gandi.net (Postfix) with ESMTPSA id 85A08240003;
 Fri, 28 Jul 2023 19:25:48 +0000 (UTC)
Date: Fri, 28 Jul 2023 21:25:47 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230728212547.63324c77@windsurf>
In-Reply-To: <20230728180854.3808246-1-bernd@kuhls.net>
References: <20230728180854.3808246-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1690572348;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iCvjbsLwoe60GhHUgeOUT5+z4l8k3yLcPRyNdfAz2+0=;
 b=KbNX4KXSvgYvRQ9U6viuCrwwVvmQhBeHH7oXlAEhTyhfMFQLZh66rRbSRpJI6MlJMN/7ew
 LQ36h+LzosDJEpqnp774Qkb1tWqXtO80i/Qpy70u6bVO7ljy7V0sSXhVCH+Yvri9WJTgQE
 9GUryc9Uaj099YjwwvmO2WcpZCVnqpwO+7gz3USorZfmnY1asxMmBKA0ovccRv+M44GPQr
 M1UZ4ww1UHT6wF/wcnsp6rRxIel9Yo9NkTTmLWI7Gv5veRW1Te5RWKDuZXnQylvqf/C8dW
 Qx6p14/0RJAUHvAndAjnYngOJWNWPC8QBiFXnhvEKwr4642vjnsi/0l6nyYd/g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=KbNX4KXS
Subject: Re: [Buildroot] [PATCH 1/1] package/mpg123: force arm mode instead
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 28 Jul 2023 20:08:54 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Fix the following build failure:
> Error: selected processor does not support `smull r3,ip,r2,r10' in Thumb mode
> 
> Fixes:
> http://autobuild.buildroot.net/results/848/8484fc6be618f3edbf39a13928ab9a4b7b442235/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/mpg123/mpg123.mk | 7 +++++++
>  1 file changed, 7 insertions(+)

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

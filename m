Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14116E9D40F
	for <buildroot@archiver.kernel.org>; Wed,  4 Feb 2026 16:33:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C92FC60779;
	Wed,  4 Feb 2026 16:33:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f72v-liD5ga8; Wed,  4 Feb 2026 16:33:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E1C666079A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770222835;
	bh=CCIMrFiWtpT7ERbaqiQqpUw9ibZ2DhpeX1GW6acCt0g=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=KczXi4Ft8FmNtNS6EmUNfQeMXly4fyQONkkh3XYYSDVJGup64CNSaBczXI+2UooWx
	 Kk+JhV6uBpq2AQ7EbOsvxfuQ4o/GDGAtwZC4goIiPSJcpw6hE6XrIlmFPteaDPbKCj
	 b+U5e588rb700Ud0HRtZ68PNsjVu1J84hDoz15iGWuzV3iL1/MUoevz7NFki7NZjq2
	 y5iTgHAmLtZJVaTsfsvyS9kXIrqccqAn1cS1P8BUDuajudFRmM3bHDeumuBRuUTJ5G
	 eK7Sep6wMRskOYdhbdrGzVbvW5otgQHet5R2NZZ42DaZHCb7VoA+JOvviFUjcgeriC
	 6r2Y519CHk6vg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E1C666079A;
	Wed,  4 Feb 2026 16:33:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 507E4F5
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 16:33:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 49FA76079A
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 16:33:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gWgnphJTwm_S for <buildroot@buildroot.org>;
 Wed,  4 Feb 2026 16:33:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6C75360779
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6C75360779
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6C75360779
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 16:33:52 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 3E28B4E423F6
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 16:33:50 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 159F160705;
 Wed,  4 Feb 2026 16:33:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 70F52119A865B; Wed,  4 Feb 2026 17:33:49 +0100 (CET)
Date: Wed, 4 Feb 2026 17:33:48 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
Message-ID: <aYN0jqRLaX6HAfc8@windsurf>
References: <20251205181855.1699260-1-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251205181855.1699260-1-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1770222829; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 in-reply-to:references; bh=Cn3M8Ywe6HmPSjh2TG7j6ZLjdwj0HxZmXmpVthT/OKs=;
 b=xiR9m1VVsHBnPrrKv0SrCd26Uf6Sq0K6QYpJdw3uV3Vl2SLXHs9NWmcmqXMyX+iCNTFUrf
 4bJgCgPmpdYLZQEYqg/oY9SUqRbFiKg34D+yfhq9J4mn/07GLwdsXBqMduDtaAmtkmwCfQ
 3ileFuwCUrHZnXU29iviqVbJVhxTpZ4EFZwM6Pb8n5J38S/59tc6ferOto2pfU1oqaF3hJ
 suBksIwzlkR5S3kKxYIOpeVJdVoRuiO7whfaHkIcA9dji326eiqsloCo6jD/zOl8tbmygI
 55WBAIbIhzSPaKX8ZsXhSgPA09uwMz2d0nkAD9xpw7dGycS7XRzTVPSk13VLOA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=xiR9m1VV
Subject: Re: [Buildroot] [PATCH 1/1] package/lrzsz: fix build error
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Bernd,

On Fri, Dec 05, 2025 at 07:18:55PM +0100, Bernd Kuhls wrote:
> Fixes:
> https://autobuild.buildroot.net/results/2e3/2e33c61e1c9bee099f973c1e43b696c63e5eed4b/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Could you revisit this patch, providing the information that we expect
when fixing build failures? What is the build failure? When did it
start happening? Also, a fix that's not upstreamable looks strange at
first sight. Can we do better?

> +Adding ac_cv_header_stdc=yes to lrzsz.mk would also fix the build error
> +but masks the fact that the cross-compile environment is misdetected.

Not sure to understand this part. What does "masks the fact that the
cross-compile environment is misdetected" actually mean?

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

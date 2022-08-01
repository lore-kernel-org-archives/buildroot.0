Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 239F1C00144
	for <buildroot@archiver.kernel.org>; Mon,  1 Aug 2022 18:57:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A3B0F81AAD;
	Mon,  1 Aug 2022 18:57:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A3B0F81AAD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id u3Jbwx0YDMFt; Mon,  1 Aug 2022 18:57:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D5F4A81396;
	Mon,  1 Aug 2022 18:57:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D5F4A81396
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3A73E1BF337
 for <buildroot@lists.busybox.net>; Mon,  1 Aug 2022 18:57:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 151F281396
 for <buildroot@lists.busybox.net>; Mon,  1 Aug 2022 18:57:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 151F281396
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VEqhEltTqH9g for <buildroot@lists.busybox.net>;
 Mon,  1 Aug 2022 18:57:32 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 03F0E8138B
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 03F0E8138B
 for <buildroot@buildroot.org>; Mon,  1 Aug 2022 18:57:31 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id D98D81C0008;
 Mon,  1 Aug 2022 18:57:29 +0000 (UTC)
Date: Mon, 1 Aug 2022 20:57:28 +0200
To: Bernd Kuhls <bernd.kuhls@t-online.de>
Message-ID: <20220801205728.51ac113f@windsurf>
In-Reply-To: <eb4cf15f-6e4d-43ca-f34d-a391044f430e@t-online.de>
References: <20220731111240.12145-1-bernd.kuhls@t-online.de>
 <eb4cf15f-6e4d-43ca-f34d-a391044f430e@t-online.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1659380250;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tb25QjwssvZLJqATFpUrLYFRr9vrM5sZtlyibsxeoFs=;
 b=IQ9/VAuz16prodi3MCDl/u9zbiENA6hkuUCGW1iGrrebBgjpZ/izT41lweYeSGYtj6h4PB
 w4vGBgwKFluxeZX72lvvwQFEU84DlPcgpS7yYySxRCI4c9Q/3LU++BQH74LKr4OeaY5tvJ
 e7BMPN9/vwWNUE1ZfGwZhE04G3YUuNvN+wZAQFaX20q4upmgMqdxhF4rQN+idybzTZKXBu
 K5BJj3vBIZbcpgKBH6cR8RaAdsZS1YpbIfJq2RS8S01QBLa4EqcKOdMdXMTFca8oyKWZBU
 lewDKcFtdRVqAy280tUoH/1+DvRP4A0n5gM19bp6YIqn6z3lQbLMWTjnH0x4mw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=IQ9/VAuz
Subject: Re: [Buildroot] [PATCH 1/1] package/apache: ignore various CVEs
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
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Mon, 1 Aug 2022 20:05:23 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> my understanding of the CVE/CPE stuff is rather limited but I guess 
> these CPEs show up for us because the database entry does not contain 
> any version number:
> 
> cpe:2.3:a:apache:http_server:-:*:*:*:*:*:*:*
> 
> What about ignoring such version-less entries in buildroot?

No, this cannot work: at the time a CVE is added, it is sometimes not
known in which version the issue is fixed... because the fix may not
yet be in a stable release. So it is probably quite common to see a CPE
ID with "*" as the version, until the issue is fixed in an official
release of the project.

So ignoring version-less entries is really not a good idea, as we could
really miss a lot of real security problems.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

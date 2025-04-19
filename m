Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0ED2AC369C9
	for <buildroot@archiver.kernel.org>; Sat, 19 Apr 2025 21:48:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D5236606C1;
	Sat, 19 Apr 2025 21:48:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1a7Q7yU105Q5; Sat, 19 Apr 2025 21:48:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1AE94607EC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1AE94607EC;
	Sat, 19 Apr 2025 21:48:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id EB4C922F
 for <buildroot@buildroot.org>; Sat, 19 Apr 2025 21:48:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DC3FA6060D
 for <buildroot@buildroot.org>; Sat, 19 Apr 2025 21:48:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NkCQnk_AsrcD for <buildroot@buildroot.org>;
 Sat, 19 Apr 2025 21:48:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::223;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E97D3606C1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E97D3606C1
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E97D3606C1
 for <buildroot@buildroot.org>; Sat, 19 Apr 2025 21:48:19 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1ECF01FCE8;
 Sat, 19 Apr 2025 21:48:18 +0000 (UTC)
Date: Sat, 19 Apr 2025 23:48:16 +0200
To: Daniel Crowe <daniel.crowe@maxmine.com.au>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20250419234816.01fd7957@windsurf>
In-Reply-To: <20250331233726.3730509-1-daniel.crowe@maxmine.com.au>
References: <20250331233726.3730509-1-daniel.crowe@maxmine.com.au>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvfeeiudehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpefvhhhomhgrshcurfgvthgriiiiohhnihcuoehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepffegheffjeekgeduhffhveevffetueejiefftdffvdejffffiedukeevveevuddvnecuffhomhgrihhnpehrvggrughthhgvughotghsrdhiohdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdukeemkeeigegumedvuddttdemrgdttdhfmeehlegsfeemgehfvdemieefuggsnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdukeemkeeigegumedvuddttdemrgdttdhfmeehlegsfeemgehfvdemieefuggspdhhvghlohepfihinhgushhurhhfpdhmrghilhhfrhhomhepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefpdhrtghpthhtohepuggrnhhivghlrdgtrhhofigvsehmrgigmhhinhgvrdgtohhmrdgruhdprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhil
 hgurhhoohhtrdhorhhgpdhrtghpthhtohepjhgrmhgvshdrhhhilhhlihgrrhguudesghhmrghilhdrtghomh
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1745099298;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gA2X3MP40HpDbk0ogCE4+K5ro8FNP7F+KG9Sbl++t5Q=;
 b=i6vdQka4NXjhDdr1aAyVkoWWLvluBkFLMVheJHk67oVW80b1Y0ceR2u67/5vTmQ8Z1U70R
 wQfQcp20MdWarLYq9se2qoxh+Sukew1DwNt+y7LARIU+MHARVJKuHw4ZtpUVtpCtrATHmS
 cuOOnAkvdsssM33KPaoGNeFQKJkee1q6Bl1E+kThzhPl5T8B8LV0Cm+6HZ0PJgZZyUspg1
 8eGMDdxpotWU94eTf1ntKxC/rzNmuhkIpaGa1pgNwAL7sqv6Obyi9Chn6jbauIcmWtoZ28
 j/IHa28lhcE/6GFdLxxCUNF3wnM140cw9z7g6mgS5JPtYLWXoahhUqGDZ9X2YA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=i6vdQka4
Subject: Re: [Buildroot] [PATCH 1/5] package/python-cachelib: add version
 0.13.0
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

On Tue,  1 Apr 2025 10:07:22 +1030
Daniel Crowe <daniel.crowe@maxmine.com.au> wrote:

> Provides caching APIs.
> https://cachelib.readthedocs.io/en/stable/
> 
> Signed-off-by: Daniel Crowe <daniel.crowe@maxmine.com.au>
> ---
>  package/Config.in                            |  1 +
>  package/python-cachelib/Config.in            |  6 ++++++
>  package/python-cachelib/python-cachelib.hash |  6 ++++++
>  package/python-cachelib/python-cachelib.mk   | 14 ++++++++++++++
>  4 files changed, 27 insertions(+)
>  create mode 100644 package/python-cachelib/Config.in
>  create mode 100644 package/python-cachelib/python-cachelib.hash
>  create mode 100644 package/python-cachelib/python-cachelib.mk

Thanks for the patch! Two minor nits:

1. The commit title should have been "package/python-cachelib: new
package"

2. An entry should have been added in the DEVELOPERS file.

Other than that, looked good, so I've applied after fixing those two
minor nits. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

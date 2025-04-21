Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54D1DC369AB
	for <buildroot@archiver.kernel.org>; Mon, 21 Apr 2025 21:38:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 290426078A;
	Mon, 21 Apr 2025 21:38:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vcp5WDVEHHV8; Mon, 21 Apr 2025 21:38:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 63E5D60B17
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 63E5D60B17;
	Mon, 21 Apr 2025 21:38:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 834E11A0
 for <buildroot@buildroot.org>; Mon, 21 Apr 2025 21:38:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 68DF460B17
 for <buildroot@buildroot.org>; Mon, 21 Apr 2025 21:38:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JtySsvkYYfQm for <buildroot@buildroot.org>;
 Mon, 21 Apr 2025 21:38:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.197;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6516E6078A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6516E6078A
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6516E6078A
 for <buildroot@buildroot.org>; Mon, 21 Apr 2025 21:38:20 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id DADAE41CFD;
 Mon, 21 Apr 2025 21:38:17 +0000 (UTC)
Date: Mon, 21 Apr 2025 23:38:16 +0200
To: Guillaume Chaye <guillaume.chaye@zeetim.com>
Cc: buildroot@buildroot.org
Message-ID: <20250421233816.05d28323@windsurf>
In-Reply-To: <20250325102111.155721-1-guillaume.chaye@zeetim.com>
References: <20250325102111.155721-1-guillaume.chaye@zeetim.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvgeduleehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpefvhhhomhgrshcurfgvthgriiiiohhnihcuoehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepjedvjedvgfffveetieffudegieevleeigfffteefhefhtefhueelfeekjefgfedvnecuffhomhgrihhnpehgihhthhhusgdrtghomhdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdukeemkeeigegumedvuddttdemrgdttdhfmeehlegsfeemgehfvdemieefuggsnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdukeemkeeigegumedvuddttdemrgdttdhfmeehlegsfeemgehfvdemieefuggspdhhvghlohepfihinhgushhurhhfpdhmrghilhhfrhhomhepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvpdhrtghpthhtohepghhuihhllhgruhhmvgdrtghhrgihvgesiigvvghtihhmrdgtohhmpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhot
 hdrohhrgh
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1745271498;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=O+rHYhy+6zv2i5dtiWyhLscB3EOhrDi56ZLLgWR6t7k=;
 b=dHuRPCAER1qog1xHmsBMxeWrdT8Dz99sRJpZhbcAJXF6O95l1rpdU+INgkl68zCa8995nD
 ciFLkvgdzbHio3/o5J8Dl9GyQxDTZesRwA1l8mba/sSdjFQeQqWzEQSE/pJOEM6x8GHHtt
 STx9u4g9Jy+Vxh/DE5TjVuFXxOvhW33gEcn3QoJJH3vUWGjxPmp1R9sQ4Hk2ZKsXLtM+rW
 4WtYLdA+cW0uHP1v2ZjD4tUti0/zwmqlG++T/EU0aorm/16R8rLbFA2V2DF6WkCVfvHq3A
 wSvwI6Oyv5+AqNpJU3NtnL+xEVBBihWIAGSErldlcVrZzp/FLvPFWyLa7mCO6g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=dHuRPCAE
Subject: Re: [Buildroot] [PATCH 1/1] package/cjson: add a patch to
 cross-compile projects that rely on cjson.
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

Hello Guillaume,

On Tue, 25 Mar 2025 06:21:11 -0400
Guillaume Chaye <guillaume.chaye@zeetim.com> wrote:

> From: "Guillaume GC. Chaye" <guillaume.chaye@zeetim.com>
> 
> Signed-off-by: Guillaume GC. Chaye <guillaume.chaye@zeetim.com>
> Signed-off-by: Guillaume Chaye <guillaume.chaye@zeetim.com>

Thanks Guillaume. However, your commit log is empty, and it's not clear
what this patch is doing. What it is bringing or fixing?

> diff --git a/package/cjson/0001-Use-CMakePackageConfigHelpers-to-generate-config.cmake.patch b/package/cjson/0001-Use-CMakePackageConfigHelpers-to-generate-config.cmake.patch
> new file mode 100644
> index 0000000000..04248afbd9
> --- /dev/null
> +++ b/package/cjson/0001-Use-CMakePackageConfigHelpers-to-generate-config.cmake.patch
> @@ -0,0 +1,191 @@
> +From 2b0a994b5832439cf704147c5b485b9a4c7fbc24 Mon Sep 17 00:00:00 2001
> +From: Charles Chan <charles@zeerd.com>
> +Date: Fri, 22 Dec 2023 11:14:36 +0800
> +Subject: [PATCH] Use CMakePackageConfigHelpers to generate config.cmake
> +Signed-off-by: Charles Chan <charles@zeerd.com>
> +Upstream: https://github.com/DaveGamble/cJSON/pull/812/commits/2b0a994b5832439cf704147c5b485b9a4c7fbc24

When you add a patch, you need to add your Signed-off-by to the patch.
But really, we need more details on why this patch would be needed.

Before sending a patch, ask yourself the question: "do I provide enough
details to allow the maintainers who will review my patch to understand
why my patch is needed, and what it is doing". This will *tremendously*
help your patches in getting merged.

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

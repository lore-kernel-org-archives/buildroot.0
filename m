Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 525A3C4332F
	for <buildroot@archiver.kernel.org>; Sun,  5 Nov 2023 14:27:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 07CC941919;
	Sun,  5 Nov 2023 14:27:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 07CC941919
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id K4Vi2TkF-Sl7; Sun,  5 Nov 2023 14:27:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 52AA14191A;
	Sun,  5 Nov 2023 14:27:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 52AA14191A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A25BC1BF342
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 14:27:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7BBE04191A
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 14:27:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7BBE04191A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uhS3X1X24aHY for <buildroot@lists.busybox.net>;
 Sun,  5 Nov 2023 14:27:50 +0000 (UTC)
Received: from smtpdh20-2.aruba.it (smtpdh20-2.aruba.it [62.149.155.165])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8CD9441919
 for <buildroot@buildroot.org>; Sun,  5 Nov 2023 14:27:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8CD9441919
Received: from [192.168.50.162] ([84.33.84.190])
 by Aruba Outgoing Smtp  with ESMTPSA
 id ze5oq3HfydNYOze6NqIiSt; Sun, 05 Nov 2023 15:27:47 +0100
Message-ID: <885f9f4f-780a-4221-be62-f261be398d21@benettiengineering.com>
Date: Sun, 5 Nov 2023 15:27:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: buildroot@buildroot.org
References: <20231105142405.71631-1-giulio.benetti@benettiengineering.com>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20231105142405.71631-1-giulio.benetti@benettiengineering.com>
X-CMAE-Envelope: MS4xfO7USs3PfPAICi7zHnFhSnVBbB3DpOpY7j2CU6EqBJStbfEkUhnfN5f2R8s3UWy59wKqwXAI8ByWbs1R/be434vLxxs09geaIqVaVW44oUv5RGpJpgvx
 bZWQIULhKWDA4PbJBJs6ciPlbL/vrgsnCFVGPLFPDSGUvg3Ixk5v4TTR6jXT3k2S/MESO/TWPCVM5U6yQ0U7yQV4E56Dv/Sn2zi0YJBEhzww3nH+6ZjOYtgu
 IJ6UZhgNf+3mJ6QV/4I9wQs3L6yAzyHkTq+x/es7YTdzi6hsSiqyad7rDtb3/oepEjHT0eY/mfFPxLKWxgl2v6TOLJ0nZirR6nwKSSoCjUc=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1699194467; bh=db9MyQIx6dIZgzpmHcyncFgijccI6ID8z8mHKzlr0ZU=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=DzAZoUSSDYPV6npe4jTa8e/HhX75EQzsvTEvWvKvCQL5WnlWqQVOCsNSYUKofjYkK
 w75fjRC9DY3RBLBzh4FNUnnujBFN47ptG6qLgUp2xBRkFbfxvMLYWoSfEirbVwTr9i
 BRIBXQBOubglJQJwOfTilthyxvu9jvx1IjPcKz/BqzHcAEuszGH3HyRZm8CqBXKtWi
 Z4ugWK0vHyqye3ixuPA1yxX6ELs3dOJSYJfvbQZIyCGC5TF8W9Oa7KGX9Ce2xURfIo
 nDrRIm5UaZO+Xa+YK4bgitoDrVoNklO5AZ8ax4Lw7hR9CyNvXBhIV9CWwbRBU7vLO5
 7XnLY+2iJEypw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=DzAZoUSS
Subject: Re: [Buildroot] [PATCH] package/nodejs/nodejs-src: fix arch check
 on additional modules
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
Cc: Martin Bark <martin@barkynet.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Daniel Price <daniel.price@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 05/11/23 15:24, Giulio Benetti wrote:
> At the moment check-bin-arch script finds NodeJS modules containing
> prebuilt binaries for different architectures and build fails.
> So let check-bin-arch to ignore folder /usr/lib/node_modules by setting
> NODEJS_SRC_BIN_ARCH_EXCLUDE to it.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Suggested-by: Yann E. MORIN <yann.morin.1998@free.fr>

-- 
Giulio Benetti
CEO&CTO@Benetti Engineering sas

> ---
>   package/nodejs/nodejs-src/nodejs-src.mk | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/package/nodejs/nodejs-src/nodejs-src.mk b/package/nodejs/nodejs-src/nodejs-src.mk
> index 6fb550f158..8f934202b0 100644
> --- a/package/nodejs/nodejs-src/nodejs-src.mk
> +++ b/package/nodejs/nodejs-src/nodejs-src.mk
> @@ -244,6 +244,9 @@ define NODEJS_SRC_INSTALL_MODULES
>   	# help in diagnosing the problem.
>   	$(NPM) install -g $(NODEJS_SRC_MODULES_LIST)
>   endef
> +
> +# Exclude prebuilt binaries with different architectures and OS from check
> +NODEJS_SRC_BIN_ARCH_EXCLUDE = /usr/lib/node_modules/
>   endif
>   
>   define NODEJS_SRC_INSTALL_STAGING_CMDS

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

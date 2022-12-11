Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 523CFC4332F
	for <buildroot@archiver.kernel.org>; Sun, 11 Dec 2022 16:51:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 072ED813FE;
	Sun, 11 Dec 2022 16:51:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 072ED813FE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id C_ZXl3EeP1Cv; Sun, 11 Dec 2022 16:51:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2EC4A813DF;
	Sun, 11 Dec 2022 16:51:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2EC4A813DF
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5C9511BF2F2
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 16:51:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 304854026A
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 16:51:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 304854026A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Hj7M6TUP42oo for <buildroot@lists.busybox.net>;
 Sun, 11 Dec 2022 16:51:05 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 04B5740241
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 04B5740241
 for <buildroot@buildroot.org>; Sun, 11 Dec 2022 16:51:04 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 1B47BFF804;
 Sun, 11 Dec 2022 16:51:01 +0000 (UTC)
Date: Sun, 11 Dec 2022 17:51:01 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20221211175101.040ec1a4@windsurf>
In-Reply-To: <20221206220311.1350707-1-fontaine.fabrice@gmail.com>
References: <20221206220311.1350707-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1670777462;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=U8+GSGoy8qToUiViJ+P5MPf9AE1bwx9KFAsiwGwDUDY=;
 b=aPKpFmKAIJk2yd2CIPW54IE3sAhcTJv2eOGl7dznkkogAoHUZZrPqVJtX9WWazT/dPBdNi
 mUZL09RebXLitzlpG0qegUI1xLRaw7/wij+Alc7CNuIC67oDP6MzOX5HrqA++xtzuxqrnA
 YNMXX8gNn42MoKAr235M2mPHtM7dUdHchebDH6lZePqwOxGNOYgcrdDIZeH0m9YYJTcWjY
 YZvUULzviyZJh0UNG1R1h7640GhJrOOfLPDyzaw+T/3jc8z3/rsFhPI07L1du95X5z7vWj
 xwlW0UAsqY9WUz2NkO5XTCO+Q+K9SN4m75tuaTNaDRoVzfCqa6SPwR7Uhd/fEg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=aPKpFmKA
Subject: Re: [Buildroot] [PATCH 1/1] package/sscep: requires blowfish
 support in openssl
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
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue,  6 Dec 2022 23:03:11 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Enable blowfish in openssl to fix the following build failure raised
> since the addition of the package in commit
> 72fa60dc102679f51b228336ec38f5af78ff7646:
> 
> src/sscep.c: In function 'get_cipher_alg':
> src/sscep.c:123:24: warning: implicit declaration of function 'EVP_bf_cbc'; did you mean 'EVP_sm4_cbc'? [-Wimplicit-function-declaration]
>   123 |                 return EVP_bf_cbc();
>       |                        ^~~~~~~~~~
>       |                        EVP_sm4_cbc
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/55d2c481d8c148fb3bb61c1331340bcd71274553
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/sscep/Config.in | 1 +
>  1 file changed, 1 insertion(+)

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

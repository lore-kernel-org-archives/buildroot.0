Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD051C3DA4A
	for <buildroot@archiver.kernel.org>; Sun,  4 Aug 2024 00:47:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 209DA81257;
	Sun,  4 Aug 2024 00:47:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KVRVE47sR5VU; Sun,  4 Aug 2024 00:47:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5A06381253
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5A06381253;
	Sun,  4 Aug 2024 00:47:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 724061BF94D
 for <buildroot@lists.busybox.net>; Sun,  4 Aug 2024 00:47:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5F19B402A8
 for <buildroot@lists.busybox.net>; Sun,  4 Aug 2024 00:47:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sVshyPcemsMK for <buildroot@lists.busybox.net>;
 Sun,  4 Aug 2024 00:47:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.238.66.15;
 helo=helium.openadk.org; envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A256540147
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A256540147
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A256540147
 for <buildroot@buildroot.org>; Sun,  4 Aug 2024 00:47:36 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 234E4353649B; Sun,  4 Aug 2024 02:47:33 +0200 (CEST)
Date: Sun, 4 Aug 2024 02:47:33 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Message-ID: <Zq7PpfDy10IdabJK@waldemar-brodkorb.de>
References: <20240803155517.3499273-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240803155517.3499273-1-dario.binacchi@amarulasolutions.com>
X-Operating-System: Linux 5.10.0-31-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1722732454; bh=w+/EpWbjjq7D5SyHwmvRZsrukcfP9MdNJjtkaWPsuxE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pb7kxlBeRsXiBTCaPWZPWYru7Yy/aeIZyWh1VjHEzfo12HjYgJw5i+vWdkLhQdEHl
 1FnfsuYIOxqlli7klwQ7qLtUB5yJtIsTWLaISJ1y4LfLUUgH8Uxzz7fa8XjmCox8IE
 BWXbAW2wevrbAZ5G7dNWA2RggtNbnsP28Rj78kYb6foAx93yEABc00ytJYUzVcx8w8
 AaPfXy69PwiyrQkQVP9E0pSQgCLTosOdY/HiSdf4+JNTUT7igPi9VhDtEGNzCfj7jT
 bjqiXCvInqqM6gRDZYjZK0CLfiuAemu1LSZvzoEPTicvcWiSBXS0j/Y4eoMr2MuZ0C
 unY1oPGhrITzg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256
 header.s=2022 header.b=pb7kxlBe
Subject: Re: [Buildroot] [PATCH 0/3] tinit and stm32f746_disco_sd_defconfig
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
Cc: Damien Le Moal <dlemoal@kernel.org>, linux-amarula@amarulasolutions.com,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Dario,
Dario Binacchi wrote,

> This series is inspired by reading the following topic:
> 
> https://lore.kernel.org/buildroot/20230206230203.70e2dbd8@windsurf/T
> 
> Starting from that patch, and following Thomas Petazzoni's suggestions
> regarding the possibility of using a single minimal script without
> duplicating it within Buildroot, I developed these three patches.
> Meanwhile, the configuration for the stm32f746_disco board was useful
> for developing the display support for the board, which was later
> merged into Linux.
> 
> Dario Binacchi (3):
>   package/tinit: new package
>   configs/stm32f746_disco_sd_defconfig: new defconfig
>   board/canaan/k210-soc: use tinit as Linux init process

You can add a 
Tested-by: Waldemar Brodkorb <wbx@openadk.org> 
for your next patch submission.
I build and runtime tested the stm32f746 config.

In which version we will have display support for the board?
Are you also working on the missing ethernet part?

Thanks for the good work.

This board is used to test uClibc-ng ARM FDPIC support.
Sadly FDPIC support in buildroot never made it upstream. (hint :=) )

best regards
 Waldemar
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

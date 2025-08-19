Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21854CA0EEB
	for <buildroot@archiver.kernel.org>; Tue, 19 Aug 2025 12:25:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CE76281314;
	Tue, 19 Aug 2025 12:25:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WlFPnB-x5gUp; Tue, 19 Aug 2025 12:25:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0DCA1811EF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0DCA1811EF;
	Tue, 19 Aug 2025 12:25:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id D37C1E0A
 for <buildroot@buildroot.org>; Tue, 19 Aug 2025 12:25:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B453340852
 for <buildroot@buildroot.org>; Tue, 19 Aug 2025 12:25:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id us3h4wRqwmYq for <buildroot@buildroot.org>;
 Tue, 19 Aug 2025 12:25:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D86AC408DD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D86AC408DD
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D86AC408DD
 for <buildroot@buildroot.org>; Tue, 19 Aug 2025 12:25:39 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 1E7E34E40B96;
 Tue, 19 Aug 2025 12:25:37 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id D962360697;
 Tue, 19 Aug 2025 12:25:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id ED2101C228A1E; 
 Tue, 19 Aug 2025 14:25:34 +0200 (CEST)
Date: Tue, 19 Aug 2025 14:25:21 +0200
To: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
Cc: buildroot@buildroot.org, Adam Duskett
 <adam.duskett@amarulasolutions.com>, Dario Binacchi
 <dario.binacchi@amarulasolutions.com>, Jagan Teki
 <jagan@amarulasolutions.com>, Meena Murthy
 <meena.murthy@amarulasolutions.com>, Suniel Mahesh
 <sunil@amarulasolutions.com>
Message-ID: <20250819142521.36865a9c@windsurf>
In-Reply-To: <CAOf5uwm3V8hsY5YofupxYJufNqSMmAferLhtUrrMC6NtO6RF7w@mail.gmail.com>
References: <20250818213241.3270409-1-thomas.petazzoni@bootlin.com>
 <CAOf5uwm3V8hsY5YofupxYJufNqSMmAferLhtUrrMC6NtO6RF7w@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1755606336; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=CAg04mLxVk9oyzVXSkqw0liiakuXXQ1nQecR4jJ/eSI=;
 b=IJVThq7mY478hnTgl7NH1h8vYoAoX617FZtJE8IKvu5eU9G1dJuC/bDrx95TJkng142R35
 +tfI0ePlTsCgsGBavOMtxxgednvSnv3h77Wr0Q9VdF9h9KAeU4eWX0OWl3TdoQLxDocQDh
 iGNCD42nwNnA6ydMelj3bDTD2s0+RF6FxTCKdW7h+UGQnbDvrcqlN8oON4OcMhS+7sE++F
 bUYwQDJq+kVfzUWqT0EZb83b3K+lieqywbE9vSy0fA5dycN3Tjt67QsV5RLIpSzaZd6ScU
 vyu2XnpqbLtkAdqaimubAs0yL8cNLvezSPTCn6u2Ov4fzqpAsvOCnMLggqJ1AA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=IJVThq7m
Subject: Re: [Buildroot] [PATCH] configs/engicam_imx6*: remove defconfigs,
 broken
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

Hello Michael,

Thanks for your feedback.

On Tue, 19 Aug 2025 14:00:38 +0200
Michael Nazzareno Trimarchi <michael@amarulasolutions.com> wrote:

> We would like to fix them. We need a bit of time up to the end of September.
> 
> Can you please wait?

We have a release scheduled end of August, and those have been broken
for a long while. I looked, in January 2025 they were already broken,
and the maintainers of those boards normally received an e-mail telling
them they were broken.

You can check those jobs from January 2025:

            engicam_imx6qdl_icore | https://gitlab.com/buildroot.org/buildroot/-/jobs/8990262441  |      
        engicam_imx6qdl_icore_qt5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8990262446  |      
        engicam_imx6qdl_icore_rqs | https://gitlab.com/buildroot.org/buildroot/-/jobs/8990262448  |      
              engicam_imx6ul_geam | https://gitlab.com/buildroot.org/buildroot/-/jobs/8990262452  |      
             engicam_imx6ul_isiot | https://gitlab.com/buildroot.org/buildroot/-/jobs/8990262468  |      

So I'm not really willing to do yet another release with broken
defconfigs that don't even build.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

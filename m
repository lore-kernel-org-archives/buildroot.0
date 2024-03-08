Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE447C54E41
	for <buildroot@archiver.kernel.org>; Fri,  8 Mar 2024 21:48:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E3A2441CDA;
	Fri,  8 Mar 2024 21:48:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sPY8VMBJs1Pu; Fri,  8 Mar 2024 21:48:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8C22B41CDF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8C22B41CDF;
	Fri,  8 Mar 2024 21:48:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E7FB31BF995
 for <buildroot@lists.busybox.net>; Fri,  8 Mar 2024 21:48:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D294540AFB
 for <buildroot@lists.busybox.net>; Fri,  8 Mar 2024 21:48:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gtLX82iuWiNu for <buildroot@lists.busybox.net>;
 Fri,  8 Mar 2024 21:48:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.178.240;
 helo=mslow1.mail.gandi.net; envelope-from=luca.ceresoli@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org ABF24400EF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ABF24400EF
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by smtp2.osuosl.org (Postfix) with ESMTPS id ABF24400EF
 for <buildroot@buildroot.org>; Fri,  8 Mar 2024 21:48:38 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (unknown [217.70.183.194])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id 9E683C216C
 for <buildroot@buildroot.org>; Fri,  8 Mar 2024 21:45:50 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0649040004;
 Fri,  8 Mar 2024 21:45:43 +0000 (UTC)
Date: Fri, 8 Mar 2024 22:45:42 +0100
To: Neal Frager <neal.frager@amd.com>
Message-ID: <20240308224542.32753833@booty>
In-Reply-To: <20240304074140.1537910-3-neal.frager@amd.com>
References: <20240304074140.1537910-1-neal.frager@amd.com>
 <20240304074140.1537910-3-neal.frager@amd.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: luca.ceresoli@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1709934344;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BKCutA6430XoP2qJKwD8Wq8EoA8xbz1l5t2QEC1P1Rw=;
 b=oRl9aLxlWnri1JeDhd21MuanAUbcsoaGA4WHe2/uqQrhFwHNZPEH0qGY8KBo1hb944CZB+
 UcG2ifR2sOW6Ry62Bj3fSVDB+o7ihN40uxujhgTorPKJrXW/7S8stD0zMVRb6jTDM8yD2B
 qd946yuUHxpmVLe56nEe6OudCiudUMD9z7zckOGLP9NOH95fhcbF++Sld+QGujrSKXSPve
 siBFHIWfU2od+Z+Sq47067UzG8D8z5V4Q19e74LdUKU09GuunwVzIo3GjMSwZiItb2xFbV
 T+SxYzp9KSdFwWfThODllgRNYIG8UdbRhCjFKtzJpYG+5ivMKisXW5euYG7w4A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=oRl9aLxl
Subject: Re: [Buildroot] [PATCH v11 3/6] configs/zynqmp*: build pmufw source
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
From: Luca Ceresoli via buildroot <buildroot@buildroot.org>
Reply-To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: ibai.erkiaga-elorza@amd.com, michal.simek@amd.com,
 thomas.petazzoni@bootlin.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 4 Mar 2024 07:41:37 +0000
Neal Frager <neal.frager@amd.com> wrote:

> From: Neal Frager <neal.frager@amd.com>
> To: <buildroot@buildroot.org>
> CC: <luca.ceresoli@bootlin.com>, <thomas.petazzoni@bootlin.com>,  <peter@korsgaard.com>, <michal.simek@amd.com>, <ibai.erkiaga-elorza@amd.com>,  Neal Frager <neal.frager@amd.com>
> Subject: [PATCH v11 3/6] configs/zynqmp*: build pmufw source
> Date: Mon, 4 Mar 2024 07:41:37 +0000
> X-Mailer: git-send-email 2.25.1
> 
> This patch migrates the zynqmp config files to use the new
> zynqmp-firmware package for building the zynqmp pmufw from source.
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>

[Tested on Kria KV260 starter kit]
Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

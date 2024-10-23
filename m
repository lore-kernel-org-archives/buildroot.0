Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 807B3CF5398
	for <buildroot@archiver.kernel.org>; Wed, 23 Oct 2024 14:41:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2A1D8812DC;
	Wed, 23 Oct 2024 14:41:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qqmfJGmaPF4Q; Wed, 23 Oct 2024 14:41:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 392B8812E3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 392B8812E3;
	Wed, 23 Oct 2024 14:41:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5777A2072
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 14:41:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 45456812DA
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 14:41:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JkcGn44hwayv for <buildroot@buildroot.org>;
 Wed, 23 Oct 2024 14:41:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.193;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 29B20812DC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 29B20812DC
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 29B20812DC
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 14:41:35 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5480C240002;
 Wed, 23 Oct 2024 14:41:31 +0000 (UTC)
Date: Wed, 23 Oct 2024 16:41:30 +0200
To: Bryan Brattlof <bb@ti.com>
Cc: Bryan Brattlof via buildroot <buildroot@buildroot.org>, Xuanhao Shi
 <X15000177@gmail.com>, Anand Gadiyar <gadiyar@ti.com>
Message-ID: <20241023164130.5782d496@windsurf>
In-Reply-To: <20241023143301.3drgsivyp75xetm7@bryanbrattlof.com>
References: <20241010-uboot-bump-v1-0-287ffa07e49e@ti.com>
 <20241010-uboot-bump-v1-2-287ffa07e49e@ti.com>
 <20241022225528.1e4f17e7@windsurf>
 <20241023143301.3drgsivyp75xetm7@bryanbrattlof.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1729694493;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Kgr3kb/iwc7VSfUgB2w2JS6Lqu2MA3boW5VMclJ8Hlk=;
 b=SmAGCe+g5fQtv7bAtURQwRITt9jxPMK7WvCAUNAT2LVHB22zsn+M7yEaNYVtr4dTX1Vf+Z
 eFQLo1InYfcBakGsNKiq02ZWETo2zb+vWr628Mdm67k4prQj6j5QwFLB7GlntFEU/VL6ld
 Fq9iTKABha2gq/Af7cv5gvjkomk4stNJ2nfpVcjgP0rXQIPBzxmT/CyNPUD/jFlzOwi249
 fjwu7laVSZ5BfcA0Y30nxV8NtqYEHNMDrC9xCLos9DWVeglXWmIPNI0g8mXc2sNpNYpnBK
 fArs8M4ryHv7M0oE9k52jYY+8RDT/Xqk4T733XjNHToZqqXEIPPG7ku6J8b/8g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=SmAGCe+g
Subject: Re: [Buildroot] [PATCH 2/3] boot/ti-k3-r5-loader: add option to
 include GnuTLS
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

Hello Bryan,

On Wed, 23 Oct 2024 09:33:01 -0500
Bryan Brattlof <bb@ti.com> wrote:

> Yeah I probably should have given more detail in the commit message :)
> 
> I don't expect many boards to need this option in buildroot especially 
> if they target build systems which builds U-Boot themselves.
> 
> It's only really our reference boards and boards who are targeting the 
> SystemReady IR spec that need to encapsulate all the boot binaries to 
> take advantage of updating the binaries via the UEFI firmware management 
> protocol. 

But even in this case, you need mkeficapsule support in the Cortex-R5
firmware? That the main U-Boot needs EFI support, I can understand, but
the Cortex-R5 firmware?

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

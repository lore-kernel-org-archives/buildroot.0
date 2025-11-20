Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55DA3CFA441
	for <buildroot@archiver.kernel.org>; Thu, 20 Nov 2025 22:32:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6C1F481418;
	Thu, 20 Nov 2025 22:32:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WpJRwmlYRNxu; Thu, 20 Nov 2025 22:32:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9E2528131F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9E2528131F;
	Thu, 20 Nov 2025 22:32:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id B0B67122
 for <buildroot@buildroot.org>; Thu, 20 Nov 2025 22:32:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A24DE60A81
 for <buildroot@buildroot.org>; Thu, 20 Nov 2025 22:32:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Wu-WuoejDhJG for <buildroot@buildroot.org>;
 Thu, 20 Nov 2025 22:32:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9A97860A77
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9A97860A77
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9A97860A77
 for <buildroot@buildroot.org>; Thu, 20 Nov 2025 22:32:47 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id F26FEC111B0;
 Thu, 20 Nov 2025 22:32:22 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 343F1606F6;
 Thu, 20 Nov 2025 22:32:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 72ED610371BCD; Thu, 20 Nov 2025 23:32:42 +0100 (CET)
Date: Thu, 20 Nov 2025 23:32:41 +0100
To: Nevo Hed via buildroot <buildroot@buildroot.org>
Cc: Nevo Hed <nhed+buildroot@starry.com>, Nevo Hed <nhed+github@starry.com>,
 Thomas Perale <thomas.perale@mind.be>
Message-ID: <20251120233241.54d9b14b@windsurf>
In-Reply-To: <20251007174036.1178955-1-nhed+buildroot@starry.com>
References: <20251007174036.1178955-1-nhed+buildroot@starry.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1763677964; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=6s47PhYRJC3nCdFDGekv0t8CLzIXApwOinEl0y8A9TE=;
 b=d8X3pXiS5zUOEq14bnJD9NRg0Ikms4UcJdsnui65NynxXsjf0gNDTh/LWRI/vtrSB9IcaS
 2Ts/M6IZpqBTwjZzg3ASNW+16cdE0C0LAplbtbBGXeElrgJGheuPSMCLLx2xA3SSAakLim
 /Qy0SBEbi4W91XhYeVdEu90K+VuV/uJgtEjWplaTyrm+80zB8FkcePtZ7FqDjVgplZGoqe
 XJePJjGtSxorqPCl+OFC7L0UVPw94hlCRDOvnBzYj1bAUj3YD6tXn1Pi7e/090xa6XAqmi
 zFj1vtH1U1N2XMTvsE3wrjgpnz8Qn9u0BEtNzoJBSJvzDNlAIeKHU3DjGMSGHQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=d8X3pXiS
Subject: Re: [Buildroot] [PATCH] utils/generate-cyclonedx: fix monotonically
 increasing dependency list
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

Hello Nevo,

On Tue,  7 Oct 2025 13:40:35 -0400
Nevo Hed via buildroot <buildroot@buildroot.org> wrote:

> From: Nevo Hed <nhed+github@starry.com>
> 
> Having mutables as default args has unexpected behaviors.
> br2_parse_deps_recursively had a default arg `deps` initialized to the
> empty list (`[]`) except that on subsequent calls from `main` deps would
> already be populated from prior components.

Thanks for your patch! However in order to make it applicable, we need
you to add your Signed-off-by line.

Perhaps you could send a v2 of you patch with your Signed-off-by line
and the commit log extended with the reproduction details you shared as
a reply?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFED7CA0EFA
	for <buildroot@archiver.kernel.org>; Thu, 21 Aug 2025 21:12:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8734441AE9;
	Thu, 21 Aug 2025 21:12:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jHlOrx6IiN4i; Thu, 21 Aug 2025 21:12:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B1ED541AEB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B1ED541AEB;
	Thu, 21 Aug 2025 21:12:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id BF2CF1C8
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 21:12:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A597A847C1
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 21:12:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M2RCRntduMJh for <buildroot@buildroot.org>;
 Thu, 21 Aug 2025 21:12:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D37E2847BD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D37E2847BD
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D37E2847BD
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 21:12:08 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id C6A9F1A0971;
 Thu, 21 Aug 2025 21:12:05 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 8B497602A8;
 Thu, 21 Aug 2025 21:12:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 4D0AB1C22CDE0; 
 Thu, 21 Aug 2025 23:12:01 +0200 (CEST)
Date: Thu, 21 Aug 2025 23:12:00 +0200
To: Heiko Thiery <heiko.thiery@gmail.com>
Cc: buildroot@buildroot.org
Message-ID: <20250821231200.5d4d6e54@windsurf>
In-Reply-To: <CAEyMn7bv77W71n7NnFGXHY+aCV+Gw=xT07u6DauxOiTX9wZ_TA@mail.gmail.com>
References: <20250819075229.3286869-1-thomas.petazzoni@bootlin.com>
 <CAEyMn7bv77W71n7NnFGXHY+aCV+Gw=xT07u6DauxOiTX9wZ_TA@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1755810723; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=uAsZ80wLwmpnShQGtAooacMOdeQpraJc0N4rqBXelYY=;
 b=rlIyu0E9UfyicdiIIam2f+BP3xlmWzwF85khv7MAPmLble9eEVTNzuXgE9Czzmk1fCusfd
 dWCaSB2PrVIRR1AktqgAdAWkldglRJbjUei2KZnze/WboJx6BfSajaGRMo5pxfSq+vBgER
 KNZJMQOQ89TNQOMkyfVXMwcy4tY156IzRYaDlyRuk/rondrLKYfSuaFTRgEO+scUkFz/x3
 Ibn3zw8qPLHdFjjGN6voLSmlENcOpSWnJGn911v2AiPJXG04Kaa5hnEHa2DlY/2BiNqacM
 3E7mVCTBn3AS6FksYpg3Ku39WX0xOcc5AykgrqvRrZzSqin9ikoEYEATApI7rw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=rlIyu0E9
Subject: Re: [Buildroot] [PATCH] configs/kontron_pitx_imx8m: remove
 defconfig, broken
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

On Wed, 20 Aug 2025 08:08:44 +0200
Heiko Thiery <heiko.thiery@gmail.com> wrote:

> Since this product has been discontinued by the manufacturer, no one
> has any real interest in this
> defconfig, and I have no personal interest in it either, it can be removed.

OK, thanks for the confirmation.

Applied to master, thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

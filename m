Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18F6CC61DD6
	for <buildroot@archiver.kernel.org>; Sat, 29 Aug 2026 11:43:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E4C4340744;
	Sat, 29 Aug 2026 11:43:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FXbICPrxAMSd; Sat, 29 Aug 2026 11:43:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788003783;
	bh=rSVrBP9mJjuMEDq60FYKEt/FoA+BOZWWA1Dd3w9qCtA=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ZNmQnrSK/SJwL9ZZyoS4ldK89s9I9gkcgNDKIaAvpaZMPFnZ25gvO6J0CY41AfYTx
	 XdEowdsvbc29HASyIiKPewclq3SKGrHt2d8kMFRUTmb4j7EtogNHz/nEQEdpMFmTsa
	 uixL7/F/z8SDqU+E88isWczZ9mpLkb/dDSjd7U+8uAC9uWupHxPD8csItQRzvWYCQS
	 foduzWttgugOuyd8NpE8neaxNQg4wcpWPVTapRIwSO75m6XwWJwH3nOKXopULvOnEx
	 dXACKXhy1jjclBUsv0URif7r7GWGuVGdu88oWhOCPxxYanbsvKckdMnZ2tsqmX1Tc6
	 iELD+m+IPwW4g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AFF1C4070F;
	Sat, 29 Aug 2026 11:43:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id B4053336
 for <buildroot@buildroot.org>; Sat, 29 Aug 2026 11:43:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A618E605F3
 for <buildroot@buildroot.org>; Sat, 29 Aug 2026 11:43:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n4vJ8WlaaUU8 for <buildroot@buildroot.org>;
 Sat, 29 Aug 2026 11:43:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 98BF3605EF
 for <buildroot@buildroot.org>; Sat, 29 Aug 2026 11:43:00 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 439454E41398;
 Sat, 29 Aug 2026 11:42:59 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 03B676053C;
 Sat, 29 Aug 2026 11:42:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 12F8B11C78131; 
 Sat, 29 Aug 2026 13:42:53 +0200 (CEST)
Date: Sat, 29 Aug 2026 13:42:53 +0200
To: Waldemar Brodkorb <wbx@openadk.org>
Cc: buildroot@buildroot.org
Message-ID: <apLFfy3hJ6NSAWkv@windsurf>
References: <aoYrHjB83RoRdw1j@waldemar-brodkorb.de> <apLDmvqL1lzNhoH5@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <apLDmvqL1lzNhoH5@windsurf>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH] arch/or1k: fix uClibc issues with fenv
 enabled
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

Hello,

On Sat, Aug 29, 2026 at 01:39:26PM +0200, Thomas Petazzoni wrote:

> But more importantly, I don't see how your patch fixes the soft float
> situation. My understanding is that soft-float is the default on
> OR1K. Your patch doesn't change *anything* in soft-float
> configuration, it only passes -mhard-float in hard float
> configurations, and makes hard float the default.
> 
> How can your patch fix anything with BR2_OR1K_SOFT_FLOAT enabled?

Sorry for my mistake, but re-reading, I know understand:
BR2_OR1K_SOFT_FLOAT selects BR2_SOFT_FLOAT, and based on that uClibc
uses or doesn't use hard-float fenv stuff. That makes sense.

Still the patch seems incorrect to me, and should modify gcc.mk and
the toolchain external stuff instead.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E27DFCA1009
	for <buildroot@archiver.kernel.org>; Wed,  3 Sep 2025 19:30:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9D138845C6;
	Wed,  3 Sep 2025 19:30:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sEjV23bKhFJx; Wed,  3 Sep 2025 19:30:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A7949845CB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A7949845CB;
	Wed,  3 Sep 2025 19:30:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 65819439
 for <buildroot@buildroot.org>; Wed,  3 Sep 2025 19:30:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 575ED84598
 for <buildroot@buildroot.org>; Wed,  3 Sep 2025 19:30:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fFQeyKlPMezs for <buildroot@buildroot.org>;
 Wed,  3 Sep 2025 19:30:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4E42B8458F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4E42B8458F
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4E42B8458F
 for <buildroot@buildroot.org>; Wed,  3 Sep 2025 19:30:43 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 746394E40BDB;
 Wed,  3 Sep 2025 19:30:40 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 40E44606C3;
 Wed,  3 Sep 2025 19:30:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 5DBF71C22DA51; 
 Wed,  3 Sep 2025 21:30:27 +0200 (CEST)
Date: Wed, 3 Sep 2025 21:30:26 +0200
To: Philip Molloy <philip@philipmolloy.com>
Cc: buildroot@buildroot.org, Michael Hennerich
 <michael.hennerich@analog.com>, Philip Molloy <philip.molloy@analog.com>,
 Eric Le Bihan <eric.le.bihan.dev@free.fr>
Message-ID: <20250903213026.063200a4@windsurf>
In-Reply-To: <20250903135005.1803497-2-philip@philipmolloy.com>
References: <20250903135005.1803497-1-philip@philipmolloy.com>
 <20250903135005.1803497-2-philip@philipmolloy.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1756927838; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=F3Xr9CuxeXPXRZwqp3NV9XLyeogfqKskq20bvCUeRWc=;
 b=SzZh6yh4uLVpNmEE2EeHWKyIh7Gqzcps/wqdBoSfZEmN1LqUttGNH9T1zGb+BAgRIGZK2x
 XW2v0+CM+8/DwoapMNITNJGavUj/5N9LlLjys35XNX5JiesmMbVa2fFJddST5/KuGOrssY
 ljzOsppYnHfD8X9n9rnfGlxJgbI1zAMH8WB3Zs3otm0UJWxjOwkaL6sPm9Z3spEitb1OL2
 fX9Nb76eDj8rReFaw7iH1j8Di0HSq/fTnFK3Ae8D6pjdq3C+XawgWemd68N5pkHLrVUzSp
 a3UItxGT08DczQg7GXdKliJxtN2ht6TUrDC0a/U9Sq2WmocP2ZiBmVrgHz7ZYA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=SzZh6yh4
Subject: Re: [Buildroot] [PATCH v2 1/2] package/adsp-ldr: new package
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

Hello Philip,

Thanks for this new iteration! This looks a LOT nicer! I actually only
have one comment below.

On Wed, 03 Sep 2025 13:50:09 +0000
Philip Molloy <philip@philipmolloy.com> wrote:

> +define HOST_ADSP_LDR_INSTALL_CMDS
> +	# The U-Boot Makefile expects ldr to be installed as part of the toolchain
> +	# shipped with the CrossCore Embedded Studio SDK

I asked to have a comment here, so I appreciate the fact that you added
one. But nobody knows what CrossCore Embedded Studio SDK is. And
actually the reason is not really that. It is "just" that U-Boot
expects the ldr tool to be prefixed with the $(CROSS_COMPILE) value.
From the U-Boot Makefile:

Makefile:LDR            = $(CROSS_COMPILE)ldr

So, the comment should be just:

# The U-Boot Makefile expects ldr to be prefixed by $(CROSS_COMPILE),
# hence the rename to $(TARGET_CROSS)ldr

I guess this can be fixed when applying.

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

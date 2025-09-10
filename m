Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0B16CA101F
	for <buildroot@archiver.kernel.org>; Wed, 10 Sep 2025 07:51:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4F48682FEA;
	Wed, 10 Sep 2025 07:51:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TpCT-BWBNZL7; Wed, 10 Sep 2025 07:51:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AC41782F14
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AC41782F14;
	Wed, 10 Sep 2025 07:51:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id B381210E
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 07:51:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 99705411C5
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 07:51:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id btDJ-SWLJpQ2 for <buildroot@buildroot.org>;
 Wed, 10 Sep 2025 07:51:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=luca.ceresoli@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 71B3B41188
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 71B3B41188
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 71B3B41188
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 07:51:19 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id CC29DC6B3AC;
 Wed, 10 Sep 2025 07:42:40 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 76F23606D4;
 Wed, 10 Sep 2025 07:42:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 4C825102F2870; 
 Wed, 10 Sep 2025 09:42:37 +0200 (CEST)
Date: Wed, 10 Sep 2025 09:42:36 +0200
To: Neal Frager <neal.frager@amd.com>
Message-ID: <20250910094236.7c6de6c8@booty>
In-Reply-To: <20250831133526.332716-2-neal.frager@amd.com>
References: <20250831133526.332716-1-neal.frager@amd.com>
 <20250831133526.332716-2-neal.frager@amd.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1757490175; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=yAKOexknGcroNlaNqZGqSWfdLd4U3hcwtn4d495RPAc=;
 b=rmu6tcwdVtqUmvLF5tQs2FhK1maD6UqXhG2jM3FlEqfpW4dYPpBxbe1p4JvcVx7TuQTe3T
 H8yARZfYpdx0zPBNAetBy/gj1/MeeUe/oACpncUY2XAL4JU5A0sxQo1c2NLIPPUl/z0ziT
 CcSwqftC91whjVG/6990hPZIoDMOYwQeGzFYrRrJn6tBd6vijA37BixcOxeKWWNzzx9Q6a
 2pTZxSFSfo2Arbtw7XknmMlezg5O+bNpKFQ4I55+qF9ubRWnjKhflz7+HN+rPmV1JrfGLm
 tQ2c2EWf2ENKEPQUmvtUz7N/S/s45YrhR9R3liWy9ykCE2E5gxBlgSEzNkVFYA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=rmu6tcwd
Subject: Re: [Buildroot] [PATCH v4 2/2] boot/uboot: add cpu dependency to
 BR2_TARGET_UBOOT_ZYNQ
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
From: Luca Ceresoli via buildroot <buildroot@buildroot.org>
Reply-To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: martin.chabot@gmail.com, buildroot@buildroot.org, brandon.maier@collins.com,
 ju.o@free.fr, thomas.petazzoni@bootlin.com, michal.simek@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 31 Aug 2025 14:35:26 +0100
Neal Frager <neal.frager@amd.com> wrote:

> Since the Xilinx Zynq SoC family is always based on ARM Cortex-A9 CPUs, the
> BR2_TARGET_UBOOT_ZYNQ option should only be available when the BR2_cortex_a9
> option is selected.
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

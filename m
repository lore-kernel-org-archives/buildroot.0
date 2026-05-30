Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81F07CD6E49
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 17:40:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D60196F5D8;
	Sat, 30 May 2026 17:40:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cvnozuRPvSuW; Sat, 30 May 2026 17:40:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 38EC16F56A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780162840;
	bh=GxUymwT8hcX8irCg1Fucu5brJw5o6xoocJKcJijfgCU=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Oxq+VxfdwihxK1ARrzpu2QJWvKGMbwNOX0J5t8PekkvZ54SP/8cSabSmZViwtP/J/
	 VOv58m2yMM3pcbhYnoQjLYcMj+rCsQPMfwDAsFvH5zWCpp4j0YyGGLh4rqIskHw8gC
	 yD0Ci0gF+fvwp4XUaZCUgITzILU2bXJMhb2S4evcboisiUXiGDCRSqPvZWqQeS1eHd
	 zZI66GxGuxyLACUNQbsRrm+8nOiGpZok6Iwwn5aFoN5JsfWYh1PjLuFyiUeCn13q+v
	 m6Wh7+9pxt8YrI+1aietjLYYfuYta3vrt3rpteySRQVNgwTb1kj0P/nOegNqfcXWa7
	 B/KQvdZkPcHQA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 38EC16F56A;
	Sat, 30 May 2026 17:40:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id D9913F4
 for <buildroot@buildroot.org>; Sat, 30 May 2026 17:40:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BE98285384
 for <buildroot@buildroot.org>; Sat, 30 May 2026 17:40:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HaVLaviykPVN for <buildroot@buildroot.org>;
 Sat, 30 May 2026 17:40:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org CF11481F3A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CF11481F3A
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CF11481F3A
 for <buildroot@buildroot.org>; Sat, 30 May 2026 17:40:38 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id DFB311A374E;
 Sat, 30 May 2026 17:40:34 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id A07A46073B;
 Sat, 30 May 2026 17:40:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id CD20E10888CC7; 
 Sat, 30 May 2026 19:40:33 +0200 (CEST)
Date: Sat, 30 May 2026 19:40:33 +0200
To: Andreas Mohr <and@gmx.li>
Cc: buildroot@buildroot.org
Message-ID: <ahsgyVS7hNGl9oHC@windsurf>
References: <20260529182727.2044-1-and@gmx.li>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260529182727.2044-1-and@gmx.li>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1780162834; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 in-reply-to:references; bh=xyJOLFYJBn+PBnklBXKUOXO1NifFPY9t0aTwyL4rNNA=;
 b=NB08sx3XH2R9Lrtt6a8jTRRptRLWzjTIv2WChmGcoOUKdUGylkEdjhxFsoy4uzURw+t+3P
 6OP7gA7eMI248axd3I/++qfmBIIvqEBcNXkB1bxCC+x/airczzBUmO15MKRVTYODmkPK8n
 1sBKQZREBoqA2HMFpIW8VrRx7OZuZWHsKrVTK+LlmQCZLLFO6idBq7x4Eio5Wphq3pxO0g
 lT2+vhd2k8v3KVkPqonp8F9tEyorrKrUg1y4cbwDFSPRsqCady215lPZYKxclU5gAS7D3R
 NneJG0SlNHQf7i3Ul1QKewBP6s0pQaYAvpGDjWwhbcOVE9u2PvduWEvG4Siiqg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=NB08sx3X
Subject: Re: [Buildroot] [PATCH/next 1/1] package/tpm2-tss: add Mbed-TLS
 crypto backend support
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

Hello Andreas,

On Fri, May 29, 2026 at 06:27:27PM +0000, Andreas Mohr via buildroot wrote:
> Add mbedtls crypto backend support for lightweight build
> 
> BR2_PACKAGE_TPM2_TSS_FAPI depends on openssl explicitly
> 
> Rewrite fapi -> FAPI
> 
> Signed-off-by: Andreas Mohr <and@gmx.li>

Thanks, applied to next, after one change.

> +ifeq ($(BR2_PACKAGE_MBEDTLS),y)
> +TPM2_TSS_DEPENDENCIES += mbedtls
> +TPM2_TSS_CONF_OPTS += --with-crypto=mbed
> +else
> +TPM2_TSS_DEPENDENCIES += openssl
> +TPM2_TSS_CONF_OPTS += --with-crypto=ossl
> +endif

Changed to:

+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+TPM2_TSS_DEPENDENCIES += openssl
+TPM2_TSS_CONF_OPTS += --with-crypto=ossl
+else ifeq ($(BR2_PACKAGE_MBEDTLS),y)
+TPM2_TSS_DEPENDENCIES += mbedtls
+TPM2_TSS_CONF_OPTS += --with-crypto=mbed
+endif

My reasoning being: if a configuration exists with openssl and
mbedtls, it will continue to prefer openssl as the crypto backend for
tpm2-tss, and only configurations that only have mbedtls would use the
mbedtls backend. This preserves the existing behavior.

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

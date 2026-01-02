Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 746BEEED628
	for <buildroot@archiver.kernel.org>; Fri,  2 Jan 2026 17:56:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 82CFE60B68;
	Fri,  2 Jan 2026 17:56:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6vikF4MWIFzg; Fri,  2 Jan 2026 17:56:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B29BA607D8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767376606;
	bh=NJegdTqgKejcqbz3oMdBrJLABlVKXpG28gG3fy0K9pI=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ZGV1fmnnqtXqgNVTvZ0R1lNu9QpRdRkiXWsH6BfUPZozRapmYPNdIOEALHm4xButg
	 QJZW8dAy4SMPj9cmL8w2X4zVY7xbi19FiSZuIoC4ga6w2wMtSHPn2cdsVRvc+iQDp5
	 xKFw5/TNjLPhK0osy4MofYXZRJOVeacSXD3Rt2/LDoPhPkNLBnSB2rWyjW8x/cV6IJ
	 RNkPb8R0OEHNRf0LPN2GknNGDx9bD6yjDNPGEKVjqTTsIQvCrsdvqDYDJZIKZRXyKT
	 eXSv/KXY1UdeL87ui9ItIszMC1vYJOw4NVJJE4s0dQjcSso62N18gpqMbDeHCiMZBO
	 kgz1XcNr/vGbg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B29BA607D8;
	Fri,  2 Jan 2026 17:56:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 43961D7
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 17:56:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2A46F4035B
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 17:56:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IH5MfKik_mP0 for <buildroot@buildroot.org>;
 Fri,  2 Jan 2026 17:56:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 49DFC4034D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 49DFC4034D
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 49DFC4034D
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 17:56:43 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id C4DF31A25DC;
 Fri,  2 Jan 2026 17:56:41 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 95E4C606C7;
 Fri,  2 Jan 2026 17:56:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id DA1AB113B0440; Fri,  2 Jan 2026 18:56:38 +0100 (CET)
Date: Fri, 2 Jan 2026 18:56:37 +0100
To: Philip Molloy <philip@philipmolloy.com>
Cc: buildroot@buildroot.org, Michael Hennerich
 <michael.hennerich@analog.com>, Philip Molloy <philip.molloy@analog.com>,
 Eric Le Bihan <eric.le.bihan.dev@free.fr>
Message-ID: <20260102185637.1e768e37@windsurf>
In-Reply-To: <20250908115200.3295727-2-philip@philipmolloy.com>
References: <20250908115200.3295727-1-philip@philipmolloy.com>
 <20250908115200.3295727-2-philip@philipmolloy.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1767376601; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=6y+2lGL4xWLkY0/tWr1aUxDes+I9E+egEbzmyL4/VzI=;
 b=qVqmlymvERme4B7uQZf8N676buOkfMbDsW0UL04Sw2PaqB4lkoJf2i1ifebDbhLhDEuV+W
 ZtClqW7pw/k0kO2NqzxE6qiElxLprYVunX5puDnVfdiO1sJ61KdT95TugJ5oBc5+/yXK6G
 DL+TfUZZVtx/xEa8fCTsdcI/2SDrlocy7Bt9VT+Dl94m8brRtWgqQ0KLEHLeipgPK8NGOb
 uoksG/yHerh6FaR9HlNLtJQn+9QeaxYW0yM9OQBqGMI1PPX3tmVlwBui3DZwwmDe2UxOv+
 LrRpZHfNNsROobyLMy4mXV0X0MRPdHvpKdmd+NcOoERxRhTqingpbZbEEY1OZQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=qVqmlymv
Subject: Re: [Buildroot] [PATCH v3 1/2] package/adsp-ldr: new package
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

On Mon, 08 Sep 2025 11:51:59 +0000
Philip Molloy <philip@philipmolloy.com> wrote:

> +sha256  a1b1b5700b75e47bae7f656cd61f8c635f5d3c82a90e20dfe594e0a3315e4eef  LICENSE

This license file hash was incorrect, so I fixed it up, and finally
applied your patch!

Sorry for the long delay.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

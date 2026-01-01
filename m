Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A276EEEB57B
	for <buildroot@archiver.kernel.org>; Thu,  1 Jan 2026 09:49:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7BEF381E9C;
	Thu,  1 Jan 2026 09:49:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nUvvvMbVUrU7; Thu,  1 Jan 2026 09:49:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A445E821C9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767260989;
	bh=+he8RnLH3/pHb33p5sHr9vJPJUPDsrwHkm9/dsufkTo=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=NUkvFFR3rTwCplf4i3I92W5Mzny5Mxewne1G4Ir+BR2HcPQePeZOcF473rzFGzNIh
	 SvkFSoKGi8OKgQY/Fy8WJfpQA067T490juPDn1/GN4j3na/6tt1TH6s3fs1KrfJ37j
	 NjKoAMHXUV2R67lpGuEmIhqpCozEdICo11BMTac9GShsYmNljjXVpXCszWuw6AzINi
	 WLmMkgNWjospiCeuLjFxneoYrYOhSPW5t3OQzINNdgwELs7uOI1PnnAA6/bO4b0JFK
	 c7dCJg3hu0vUEfEgMNmTRaNRxdmEuQQQf5f8grs4w7daCJ9moHKgOTx6oi0yaIqJdf
	 mgkkRHe//wH2Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A445E821C9;
	Thu,  1 Jan 2026 09:49:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id AADFE206
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 09:49:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 921284081B
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 09:49:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oICw6zlKP-ae for <buildroot@buildroot.org>;
 Thu,  1 Jan 2026 09:49:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 70256404AB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 70256404AB
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 70256404AB
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 09:49:47 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id C4AD61A258F
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 09:49:45 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 9A514606B6;
 Thu,  1 Jan 2026 09:49:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id A333F113B071F; Thu,  1 Jan 2026 10:49:44 +0100 (CET)
Date: Thu, 1 Jan 2026 10:46:36 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, Marcin Niestroj <m.niestroj@grinn-global.com>
Message-ID: <20260101104636.45328ffa@windsurf>
In-Reply-To: <20251231211323.4175261-1-james.hilliard1@gmail.com>
References: <20251231211323.4175261-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1767260985; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=R0Dw0/xDcL51msadamIdYLxoN4LegFB7W2zRTu715FA=;
 b=PnHwxNFWPcrB4wM9VkhGY/uHPW2TbOahA2gNRU0v6itbRSaulXllQwNLWj3Ck53bdvOzII
 X4spn8FoMYJaOZinI1zF9LjK+g4GA+BHzs6kXQ1m4pn2rSIfAc8wYGClH91i2/2nOAoFGh
 baaKNKeBVay8n+cCOFtgqCRHYwYnXLL+QGP1kEd3YapjiXoWysyeC3XkWFLCDx8Fj4QSjr
 sfpIDaFRvqpmU2J41WWIcOaqjmzAnD1l7o+ddpgY0n1o1qCAwi+ZDfhnNnk65u2KAlJK/P
 YG04Y9AzyUop43v9CR+xMlP+8ZiCd8/DpXdcAkpTWCWRry0BWVXIwcOrqBuE8A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=PnHwxNFW
Subject: Re: [Buildroot] [PATCH 1/1] package/python-pytest-asyncio: bump to
 version 1.3.0
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

On Wed, 31 Dec 2025 14:13:22 -0700
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-pytest-asyncio/python-pytest-asyncio.hash | 4 ++--
>  package/python-pytest-asyncio/python-pytest-asyncio.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

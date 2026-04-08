Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2198810FC440
	for <buildroot@archiver.kernel.org>; Wed,  8 Apr 2026 20:41:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BC98260FBA;
	Wed,  8 Apr 2026 20:41:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k1GlDzeAVKDy; Wed,  8 Apr 2026 20:41:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 51A9960EFB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775680880;
	bh=thCosj45WJlUmF/kTlZjBAiIP7WavQzU2BoAMOlzjpk=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=bkTE89JU+r0ntkcWQ7J50Tfpi3sbwarX/w5oR8bXZz99tttnUeQhmSdh4GxZeTnlh
	 ww91AJgh/ssPJ/Gvh2CNIbqt+679MIROQ7/uHZr8PjuOpoWLu/6NAA2QrwtDh7rZ65
	 tKH0+f3vR0hk9nSfDExwfu0OsSxgxueLxENm8+gBiNrXkzQWBGBZMLuEV+/KBFZB3J
	 296F62DJ972guqNUHAil1ro5RcHmXMucHeYxSCL8GIUfXOZmPRNuDV5FWy2FDesLXH
	 FMeuYxv51dc+sgVzLtetbpK4/X6WO0PhGb5VED0AXFwZBqQ44vZqJ2HHaZyg4fQejI
	 JYq3Hq2vUw4Gg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 51A9960EFB;
	Wed,  8 Apr 2026 20:41:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id C7BA6237
 for <buildroot@buildroot.org>; Wed,  8 Apr 2026 20:41:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B95EC825D3
 for <buildroot@buildroot.org>; Wed,  8 Apr 2026 20:41:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YIxwnuEqnzn2 for <buildroot@buildroot.org>;
 Wed,  8 Apr 2026 20:41:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6C5A08254D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6C5A08254D
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6C5A08254D
 for <buildroot@buildroot.org>; Wed,  8 Apr 2026 20:41:17 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id A2ABD13F8C8;
 Wed,  8 Apr 2026 22:41:09 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 08 Apr 2026 22:41:09 +0200
MIME-Version: 1.0
Date: Wed, 08 Apr 2026 22:41:09 +0200
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org, Anand Gadiyar <gadiyar@ti.com>, Bryan Brattlof
 <bb@ti.com>, Xuanhao Shi <X15000177@gmail.com>,
 linux-amarula@amarulasolutions.com
In-Reply-To: <20260408174948.1069230-1-dario.binacchi@amarulasolutions.com>
References: <20260408174948.1069230-1-dario.binacchi@amarulasolutions.com>
User-Agent: Webmail Free/1.6.14
Message-ID: <2eaef1c2fc98d5056509d0fa72507498@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1775680875;
 bh=vtVNVZ6QOI0Fwi5U8MPHSSL0YxpHPHAs2na7Dg7K5is=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=QTo+IIUU+Ze1SrzmePcGOZCgnhTQB8r/y/H4Sa6kQe3SKx6q4g0vp/e80rWMb/yAV
 4Bq4RhgJUDS56Af5S6g938JQq0Lbj0EUAy29Rz0yZA0zG8bel3VL/eZUYimpuhNHTy
 Je4jbUTolWpLbTQb9YMFwzsA40mDnZah0/VxC2x9sc+4WcAdKE6UeJ+p+vDyEnfu25
 iJltbaSJ4SHITu8d5j+c1BuSTLVSgD1oQKa6hBh8kawY8fTGtAgRPNNFMseBBVSeAu
 BXn2edyhIXkTqXcSawGF1cQPxIS+At6umUPDfbq116jeEbW36JRakIoSV3YHX6IcMo
 hPHg4DetktECQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=QTo+IIUU
Subject: Re: [Buildroot] [PATCH 1/1] configs/ti_am62x_sk: bump U-Boot and
 Linux versions
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 08/04/2026 19:49, Dario Binacchi wrote:
> This patch bumps:
> 
> - U-Boot to version v2026.04
> - Linux kernel to version 6.12.80 (LTS)
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Applied to master, thanks.

Could you consider switching this defconfig to use Bootlin glibc stable
toolchain please?

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

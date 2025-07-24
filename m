Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28EADC87FC5
	for <buildroot@archiver.kernel.org>; Thu, 24 Jul 2025 19:48:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D0CC641B19;
	Thu, 24 Jul 2025 19:48:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XSmcTfEwEQxv; Thu, 24 Jul 2025 19:48:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D476F415C0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D476F415C0;
	Thu, 24 Jul 2025 19:48:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id D1347B83
 for <buildroot@buildroot.org>; Thu, 24 Jul 2025 19:48:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C2F7860767
 for <buildroot@buildroot.org>; Thu, 24 Jul 2025 19:48:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XovgKw4poPgm for <buildroot@buildroot.org>;
 Thu, 24 Jul 2025 19:48:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0D286606DE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0D286606DE
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0D286606DE
 for <buildroot@buildroot.org>; Thu, 24 Jul 2025 19:48:21 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id B42A713F880;
 Thu, 24 Jul 2025 21:48:17 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 24 Jul 2025 21:48:17 +0200
MIME-Version: 1.0
Date: Thu, 24 Jul 2025 21:48:17 +0200
To: Juan Pablo Montero Castro <juanpablo.monterocastro@nxp.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250722165119.1789576-1-juanpablo.monterocastro@nxp.com>
References: <20250722165119.1789576-1-juanpablo.monterocastro@nxp.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <73140e18d972cb9cf4f284e12b326b9b@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1753386498;
 bh=SEESF4smacfDOQrOAcCqLdFpU7eAEfEqwCac/iNecf4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=j5dnNvqlZc+oY89jcJXlKmT1wfxhNzFWDRq1Y0wyxWCe56A3wjrTByrDzYCVDKlW+
 l8Uc2bfrEJfPLGSHLkSP0yy39LoDLklRB5GQc0miy6uISdiN0zwxo6h4uXCdvK4nJc
 0l33HNrjsQLeaKjBmEmg++7+GcRX49fxuLvS2wL3owlCecCUSj16lg99OCwh/SMuWA
 2KNmeJnVCLixmCAjaetnSimfEvCqhH/bwyUx+2G7oexlGnJxMDomilEHzS99yPrSFW
 A4Nc+RFsHrGOwYzWywTvLcThw5X53apfaRiD/L13+7eyMqn+AUXVvHSGjVWOsMnB38
 4WA4fvn14MxLA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=j5dnNvql
Subject: Re: [Buildroot] [PATCH 1/1] configs/freescale_imx91frdm: new
 defconfig
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

On 22/07/2025 18:51, Juan Pablo Montero Castro wrote:
> This commit adds support for the i.MX 91 FRDM (Freedom) board.
> 
> The i.MX91 FRDM development board is a low-cost and compact
> development board featuring the i.MX91 applications processor.
> 
> See: https://nxp.com/FRDM-IMX91
> 
> This defconfig is based on freescale_imx93frmd_defconfig, introduced in
> commit 
> https://gitlab.com/buildroot.org/buildroot/-/commit/2e05f22ff862192a7e512d0db0486351bba94ae8
> 
> Compared to the original freescale_imx93_frmd_defconfig, this defconfig
> uses a Bootlin glibc stable external toolchain, to follow guidelines
> from: 
> https://elinux.org/Buildroot:DeveloperDaysELCE2024#Rules_for_defconfigs
> 
> Signed-off-by: Juan Pablo Montero Castro 
> <juanpablo.monterocastro@nxp.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F240C02180
	for <buildroot@archiver.kernel.org>; Wed, 15 Jan 2025 19:47:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5A9B74176F;
	Wed, 15 Jan 2025 19:47:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mcL2jDVRSqz9; Wed, 15 Jan 2025 19:47:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 59C8A4175F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 59C8A4175F;
	Wed, 15 Jan 2025 19:47:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 16A12B89
 for <buildroot@buildroot.org>; Wed, 15 Jan 2025 19:47:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1139C6109E
 for <buildroot@buildroot.org>; Wed, 15 Jan 2025 19:47:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OclFTszHT7PQ for <buildroot@buildroot.org>;
 Wed, 15 Jan 2025 19:47:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5698460E45
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5698460E45
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5698460E45
 for <buildroot@buildroot.org>; Wed, 15 Jan 2025 19:47:27 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id E03EE13FABB;
 Wed, 15 Jan 2025 20:47:17 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:58882])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 15 Jan 2025 20:47:17 +0100
MIME-Version: 1.0
Date: Wed, 15 Jan 2025 20:47:17 +0100
From: Julien Olivain <ju.o@free.fr>
To: Neal Frager <neal.frager@amd.com>
Cc: buildroot@buildroot.org, ibai.erkiaga-elorza@amd.com,
 luca.ceresoli@bootlin.com, brandon.maier@collins.com,
 thomas.petazzoni@bootlin.com, romain.naour@smile.fr, michal.simek@amd.com
In-Reply-To: <20250115095011.2469162-1-neal.frager@amd.com>
References: <20250115095011.2469162-1-neal.frager@amd.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <6352b069379cc3da31efa5ba1b92965a@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1736970445;
 bh=CLXYZgQqyxDGy/UJheeJlj9YAGbSpQs2NDI4WDnv5h4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=k2TzKK+PmEgMA7zNcYS7IOfFG9/fDizPqV5dTch+16xXpEMeM956Byd81JjVKRdef
 MSf89HO93DPO2FttZumrqyEI8F70Ato+U41IeM2e8kc9IBKKVFXVYEcP/XWL6yRF8o
 6pAWKWTo8zPScO5cr0Lcy1OYxNZ9DYtT6ZyRpUBqly6h+9fdl4xBLNo7BkRf7I4B27
 u1dgZwov9IAPcwuo/b+WIF54NrmwgV0WIxVCO8tpgc4xLPdA8kyNX441a9Od2MjSFg
 pczFpakNtIVl4kIh3fCWWWqbJVGPtZC0A2+AEqzaFvFkytc/rVYujTe+wAS25otNsI
 JLd4Ec7np/rxA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=k2TzKK+P
Subject: Re: [Buildroot] [PATCH v1 1/3] configs/zynqmp_zcu102_defconfig:
 bump to Linux 6.6.60
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 15/01/2025 10:50, Neal Frager wrote:
> This patch bumps the zynqmp_zcu102_defconfig to Linux kernel 6.6.60.
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

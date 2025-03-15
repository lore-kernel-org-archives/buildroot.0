Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E963C282EC
	for <buildroot@archiver.kernel.org>; Sat, 15 Mar 2025 00:41:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6B8A3605D2;
	Sat, 15 Mar 2025 00:41:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OLx3M61FMyya; Sat, 15 Mar 2025 00:41:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 94953605EA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 94953605EA;
	Sat, 15 Mar 2025 00:41:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5B58FC8
 for <buildroot@buildroot.org>; Sat, 15 Mar 2025 00:41:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4047983F0E
 for <buildroot@buildroot.org>; Sat, 15 Mar 2025 00:41:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ysUB7WIetUCe for <buildroot@buildroot.org>;
 Sat, 15 Mar 2025 00:41:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=vjardin@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org BF2B6847A3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BF2B6847A3
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BF2B6847A3
 for <buildroot@buildroot.org>; Sat, 15 Mar 2025 00:41:06 +0000 (UTC)
Received: from L25025.local (unknown
 [IPv6:2a01:e0a:2af:22b0:adce:9a58:bcbc:dc56])
 (Authenticated sender: vjardin@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 9A53B780331;
 Sat, 15 Mar 2025 01:40:58 +0100 (CET)
Date: Sat, 15 Mar 2025 01:40:58 +0100
From: Vincent Jardin <vjardin@free.fr>
To: Vladimir Oltean <olteanv@gmail.com>
Cc: buildroot@buildroot.org, Ioana Ciornei <ciorneiioana@gmail.com>, 
 Brandon Maier <Brandon.Maier@collins.com>, Julien Olivain <ju.o@free.fr>, 
 Romain Naour <romain.naour@smile.fr>, Akhilesh Nema <nemaakhilesh@gmail.com>
Message-ID: <7ppsoggazufebwywfwqqlkmssypneyqtmbg4tr4dx76o5dx7q7@iyndbkzeo2zl>
References: <20250302215219.1276480-1-olteanv@gmail.com>
 <20250302215219.1276480-6-olteanv@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250302215219.1276480-6-olteanv@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1741999265;
 bh=CQy3NI+WwfyvUnB/oxyNlMI+aVe8nDKx2G9jJp5bb54=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Fiahzz/mDBUqM20UNEtOV7KaVahMXozx0CcxmTLnyaFqsk+q8gF+9LjBOxa6jvRux
 Agmd06smb31m0ewVAoJoOP7GVKKqY3h15ElpqYHv2R7htG4Syoh1aipUo9/yBMVZh9
 Gtie05HLXBeFSfQ63sLWhoBzfXF86UEbkklIAVa7TrSoV5agGrDt2OGPNvPpp0MAFU
 iKOhFk+x1lFZrnSLnQBZj6FUggCJZk3//XJ78LkPyZMOhmDBQHs/dZSYkeDEjjR5e7
 eondnKFxyRWqtLeMM0P2BIa+YWl8VDt5xRLoi+p4TyVYQu3s9+7xMWtXC7UVWgw7B8
 513H9uE+AF56A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Fiahzz/m
Subject: Re: [Buildroot] [PATCH 05/15] package/qoriq-mc-binary: new package
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Vladimir,

On Sun, Mar 02, 2025 at 11:52:09PM +0100, Vladimir Oltean wrote:
> Add a package which deploys the NXP MC (Management Complex) firmware
> to the target. This is necessary for NXP DPAA2 SoCs (LS1088A, LS2080A,
> LS2088A, LX2160A).
> 
> Signed-off-by: Vladimir Oltean <olteanv@gmail.com>

See inline

> ---
> Change log:
> - Shorten help text a little bit
> - s/BR2_PACKAGE_QORIQ_MC_TARGET_*/BR2_PACKAGE_QORIQ_MC_BINARY_TARGET_*/
> +
> +QORIQ_MC_BINARY_VERSION = 10.39.0

The latest version is 10.39.103, let's use it.

> +QORIQ_MC_BINARY_SITE = $(call github,nxp-qoriq,qoriq-mc-binary,mc_release_$(QORIQ_MC_BINARY_VERSION))

best regards,
  Vincent
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4BB4C28B20
	for <buildroot@archiver.kernel.org>; Wed,  2 Apr 2025 06:46:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6C66A4126A;
	Wed,  2 Apr 2025 06:46:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Wsydj0Wy6QrN; Wed,  2 Apr 2025 06:46:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9D3D541275
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9D3D541275;
	Wed,  2 Apr 2025 06:46:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4DB7C117
 for <buildroot@buildroot.org>; Wed,  2 Apr 2025 06:46:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E69B5836F1
 for <buildroot@buildroot.org>; Wed,  2 Apr 2025 06:46:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YGTs7t_vYN_z for <buildroot@buildroot.org>;
 Wed,  2 Apr 2025 06:46:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0E9678375B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0E9678375B
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0E9678375B
 for <buildroot@buildroot.org>; Wed,  2 Apr 2025 06:46:07 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 4EBFC2003CE;
 Wed,  2 Apr 2025 08:46:01 +0200 (CEST)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:44912])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 02 Apr 2025 08:46:01 +0200
MIME-Version: 1.0
Date: Wed, 02 Apr 2025 08:46:01 +0200
From: Julien Olivain <ju.o@free.fr>
To: Meena Murthy <meena.murthy@amarulasolutions.com>
Cc: buildroot@buildroot.org, linux-amarula@amarulasolutions.com, Michael
 Trimarchi <michael@amarulasolutions.com>
In-Reply-To: <20250401095407.488618-2-meena.murthy@amarulasolutions.com>
References: <20250401095407.488618-2-meena.murthy@amarulasolutions.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <ad2e0671b29d4631aa255bdf573eb2f8@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1743576364;
 bh=RwHOj0KS3GUjIQ0EL6GxDDPy6zIDdx12zRZLvaG/yv0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=QiMdU56wRHv3LA8aaB6SWJBDA28P3WEo2tEn0To54YG5sNB5abG2GU+MNaXMf9n6/
 07G7u89tfIxqvv3rjDcN6D+iia+fI2FJZO3IAcYIIZQwXFgJLfWva0ulxke+WHMpHI
 f80DwTmjOrgmmI7QGTgdEs5zo/9IwDNzn4hZV0fOWsck+Iig2Jnmd3DkNJQ9bGKPlq
 XHCWVnSQ6cFlawlOBW/O7Pvg+VwO2SS+WdEfLcGU/OEMfJVCxcRAKi2pJUBcEtNljY
 E3TlpDWlfJvs1Qd3MQf+ZJApH+dYkI+M1bMoJtNET3zgfgvS3gO/8E4HJDs3acFeUK
 AZ9n4PL+qyQng==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=QiMdU56w
Subject: Re: [Buildroot] [PATCH v4] configs/engicam_px30_core_defconfig: new
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 01/04/2025 11:54, Meena Murthy wrote:
> Add initial support for Engicam PX30 SOM board
> with below features:
> - U-Boot 2024.01
> - Linux 6.4.16
> - Default packages from buildroot
> 
> px30 ctouch2 with 10 inches display
> 
> https://www.engicam.com/vis-prod/C-Touch-2-0-Carrier-Board/ \
> 	General-purpose-carrier-board-with-capacitive-touch-interface-EDIMM-20-compliant
> 
> Signed-off-by: Meena Murthy <meena.murthy@amarulasolutions.com>
> Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>

Applied to master, thanks.
For info, I also made two minor corrections. See:
https://gitlab.com/buildroot.org/buildroot/-/commit/6e6bd098c31cf981c1498f105cf35405e1518c4c

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

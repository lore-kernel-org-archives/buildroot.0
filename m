Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D47ECCF9F8
	for <buildroot@archiver.kernel.org>; Fri, 31 Oct 2025 22:05:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A7FFA61ADE;
	Fri, 31 Oct 2025 22:05:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g6qHXRXFkePH; Fri, 31 Oct 2025 22:05:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5EE4E61ADA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5EE4E61ADA;
	Fri, 31 Oct 2025 22:05:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id D13FBCD
 for <buildroot@buildroot.org>; Fri, 31 Oct 2025 22:05:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C2FE884886
 for <buildroot@buildroot.org>; Fri, 31 Oct 2025 22:05:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UrAxM__Qrbul for <buildroot@buildroot.org>;
 Fri, 31 Oct 2025 22:05:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B97FD8484E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B97FD8484E
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B97FD8484E
 for <buildroot@buildroot.org>; Fri, 31 Oct 2025 22:05:33 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 40D265FFC0;
 Fri, 31 Oct 2025 23:05:28 +0100 (CET)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 31 Oct 2025 23:05:28 +0100
MIME-Version: 1.0
Date: Fri, 31 Oct 2025 23:05:28 +0100
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org, Michael Trimarchi
 <michael@amarulasolutions.com>, linux-amarula@amarulasolutions.com
In-Reply-To: <20251031091211.2337622-1-dario.binacchi@amarulasolutions.com>
References: <20251031091211.2337622-1-dario.binacchi@amarulasolutions.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <b7980ffb77731070f62ed75c02f6072b@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1761948331;
 bh=MUYDGXZHi50188fBcowZxJgSPg+4dHvYLOajAihRtLY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=LHISJWCfMT42ce2MUc8o3w7Uu7Jg/WdWt96x6bH+kCNCypOJ80+JmGF91B5FGWNG8
 qYkPRNwEnlGvs4BgHrAlUTdFgjDpNL9GB/gDu3RIR4MiY+6ugazpOsMDKhehoV8Kzc
 gQ+YoQEp4x/BusXsxZnrqpfXpHXjbGvWxXbkJk517HAVuileVPPxnyin3q7MigEZS7
 Ar46XE0POy1nSB7bT0m7crNCQicHW0P8cK/o0B95BCj6FoC7fhmKzAwciv64iw8JWV
 BwFEJ/WOISkGkb2ABqhl4TEl2SVRVexGlpPcBxcLh87zOw8DLA22h2B6b/hgqrp652
 c0pagv+O8I2CQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=LHISJWCf
Subject: Re: [Buildroot] [PATCH 1/1] configs/imx8mn_bsh_smm_s2[_pro]: bump
 Linux to 6.12.56 and U-Boot to 2025.10
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

On 31/10/2025 10:12, Dario Binacchi wrote:
> The patch bumps the Linux kernel to version 6.12.56 and U-Boot to
> version 2025.10.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Applied to master, thanks.

Could you consider, in a followup patch, updating those defconfigs
to switch to external Bootlin stable toolchain, please?

See for example:
https://gitlab.com/buildroot.org/buildroot/-/commit/dd3ef914867dca5e429bb25ee14445fb0c87baa5

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

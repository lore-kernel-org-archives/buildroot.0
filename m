Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCDE5CA1012
	for <buildroot@archiver.kernel.org>; Wed,  3 Sep 2025 21:57:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A624E84A08;
	Wed,  3 Sep 2025 21:57:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cPFjZRX1Ne6x; Wed,  3 Sep 2025 21:57:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C9BAE84A03
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C9BAE84A03;
	Wed,  3 Sep 2025 21:57:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id A9D83930
 for <buildroot@buildroot.org>; Wed,  3 Sep 2025 21:57:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9054D41756
 for <buildroot@buildroot.org>; Wed,  3 Sep 2025 21:57:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MOxu-0Wti9nW for <buildroot@buildroot.org>;
 Wed,  3 Sep 2025 21:57:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B472D4171C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B472D4171C
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B472D4171C
 for <buildroot@buildroot.org>; Wed,  3 Sep 2025 21:57:31 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id D11C85FF88;
 Wed,  3 Sep 2025 23:57:26 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 03 Sep 2025 23:57:26 +0200
MIME-Version: 1.0
Date: Wed, 03 Sep 2025 23:57:26 +0200
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org, linux-amarula@amarulasolutions.com
In-Reply-To: <20250902205902.668394-1-dario.binacchi@amarulasolutions.com>
References: <20250902205902.668394-1-dario.binacchi@amarulasolutions.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <c4ffe2402b39a698eafb830a37e7b6d9@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1756936649;
 bh=AGQx7ezvyXdhJa8H7PUXSa1QLLHhAils4tUpokwH/K4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=IqUMENAdb0S4uBbB4JZZ64CIAX5e59YuaT5wDbucka0YSxRqJmM1CaC1xQzQ+tFX+
 EzdJoxBvzxlDtfTwrgulbvC30PFDqhgXeVTKbXjLGlY0mfMKwC7xwG8/freveL9tF4
 RTkZnuNoLZIu3YQ9OWTPVitAkpS8MCVw7V7x6d+TQNcVd53hMB9LS7vi7mUqejt46n
 og0BK5WpohuVlyVD+4LVoGaRu9Y9iOznEeyf6J8HTaiKtdHykD7FVXYMTPbSRPehK6
 x486tl6MvJuRIN7Zv3c+yxKj5d/IsiqM3O2QGaQNAmh/HQRtpYxeWcFFY1BfRcXuiU
 YetFVtUtsffRQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=IqUMENAd
Subject: Re: [Buildroot] [next 1/1] package/uuu: bump to version 1.5.233
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

On 02/09/2025 22:59, Dario Binacchi wrote:
> Release notes:
> https://github.com/nxp-imx/mfgtools/releases/tag/uuu_1.5.233
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Applied to next, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

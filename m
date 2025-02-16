Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5AC7C02198
	for <buildroot@archiver.kernel.org>; Sun, 16 Feb 2025 17:04:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9761B80DA4;
	Sun, 16 Feb 2025 17:04:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F_HHXmIIYB_v; Sun, 16 Feb 2025 17:04:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BBB9580DDB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BBB9580DDB;
	Sun, 16 Feb 2025 17:04:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 585FD72
 for <buildroot@buildroot.org>; Sun, 16 Feb 2025 17:04:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4622140144
 for <buildroot@buildroot.org>; Sun, 16 Feb 2025 17:04:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kETLwh4R5-9h for <buildroot@buildroot.org>;
 Sun, 16 Feb 2025 17:04:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 18D514018D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 18D514018D
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 18D514018D
 for <buildroot@buildroot.org>; Sun, 16 Feb 2025 17:04:11 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id BC4BBB0056A;
 Sun, 16 Feb 2025 18:04:07 +0100 (CET)
Received: from 2a01:e0a:485:b220:8213:2270:4a8d:a1d5
 via 2a01:e0a:485:b220:8213:2270:4a8d:a1d5 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 16 Feb 2025 18:04:07 +0100
MIME-Version: 1.0
Date: Sun, 16 Feb 2025 18:04:07 +0100
From: Julien Olivain <ju.o@free.fr>
To: Gilles Talis <gilles.talis@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250216153441.2706067-1-gilles.talis@gmail.com>
References: <20250216153441.2706067-1-gilles.talis@gmail.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <6b240cd5d5f4b93a5df3f56430579c31@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1739725449;
 bh=bFJEfNoN4cd7mfZwtfmSSzXKVTikHkFKraigkOskZmg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=n5cdOq59WkkR3lCGgHfZP7ZmcgxK3ci5QiosRe/ZPvr04G51YT2g/6/UQG4g1PFK4
 VcCOxgWjzVJzj8zl3LSzqu80JsgCRMXycszR973zXQ0x2N9AiB4Fk/uGC+yW5kjA/2
 v+6zpt0z4Gi1vMSE4kMPYHRH2lOMgjUWuGDgN/kVjjEiKbEvpotfY5LKst4ESZIu7r
 Ru3kAiVt6pog/uaqAo/I6AYD1yZ0oBZwCSid67qYOEUXwr+6VcFxgy4FDmPSN4lfX7
 L6PBMqjuALLY5EkexKXjoYaU3nWtD/ZLRDDe1i4wbEnva7GvgaEmWuojKjHwrkgVXU
 hcgz84cs9PnPg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=n5cdOq59
Subject: Re: [Buildroot] [PATCH] configs/friendlyarm_nanopi_r2s: update BSP
 versions
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

Hi Gilles,

On 16/02/2025 16:34, Gilles Talis wrote:
> - Switch to Linux LTS release 6.12.13
> - Switch to U-Boot 2024.10
> - Switch to ATF 2.12
> - Add BR2_TARGET_UBOOT_NEEDS_PYELFTOOLS option required to build U-Boot
> - Also fixes multiple occurrences of this issue:
> https://gitlab.com/buildroot.org/buildroot/-/jobs/9122556338
> 
> Signed-off-by: Gilles Talis <gilles.talis@gmail.com>

Long time no see in Buildroot! I applied this patch on master, thanks.

I also added the missing BR2_TARGET_UBOOT_NEEDS_GNUTLS=y due to the
uboot bump.

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

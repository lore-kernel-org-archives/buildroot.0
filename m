Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0231C021B2
	for <buildroot@archiver.kernel.org>; Sun, 23 Feb 2025 20:39:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 98C474068E;
	Sun, 23 Feb 2025 20:39:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bnS7bIqV8PKI; Sun, 23 Feb 2025 20:39:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8457540754
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8457540754;
	Sun, 23 Feb 2025 20:39:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 78061B88
 for <buildroot@buildroot.org>; Sun, 23 Feb 2025 20:39:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6687640754
 for <buildroot@buildroot.org>; Sun, 23 Feb 2025 20:39:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 686qwquZgsSc for <buildroot@buildroot.org>;
 Sun, 23 Feb 2025 20:39:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6C5994068E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6C5994068E
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6C5994068E
 for <buildroot@buildroot.org>; Sun, 23 Feb 2025 20:39:31 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 43FF72003BE;
 Sun, 23 Feb 2025 21:39:27 +0100 (CET)
Received: from 2a01:e0a:485:b220:8213:2270:4a8d:a1d5
 via 2a01:e0a:485:b220:8213:2270:4a8d:a1d5 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 23 Feb 2025 21:39:27 +0100
MIME-Version: 1.0
Date: Sun, 23 Feb 2025 21:39:27 +0100
From: Julien Olivain <ju.o@free.fr>
To: Marcin Niestroj <m.niestroj@grinn-global.com>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>
In-Reply-To: <20250217110132.3530960-1-m.niestroj@grinn-global.com>
References: <20250217110132.3530960-1-m.niestroj@grinn-global.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <ac0e7623f61ccf597304681d28d08dc2@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1740343169;
 bh=AHbsfhAN5SkTLKw+KBQt3ihCW9WCCD8HraVq2JZZKc4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=hr18AWq4LuoL8qnk2g+i5tn/AE/il+qSYsttCZ9xTdYnXlMS3VnpSXocJyqNi/yoz
 9psGDVGtMfqrXPBQtXAB0YNv4rEeZ/KsLrI/MfhR11b3Uov6DaF0ooBxWD15nMWh1s
 5E4lPskE2onAL3gZn/YLrX+SYMNElCvD6oys+oxMTGXd+jkTjJ28GsttFkm1EnvRF3
 qwSISaI57qMo8XPjYZ6c/EVF6h/fE11SEsoVDOFcp4LewQl+qXLaAvK2CJke9opAgq
 ekEVoerM0ZXmLFPu6c3Q9f/W19G2disPRwK94c+awRjz5uWvks5c3g/fCQVGGwe59c
 dnHHpEMrKsEFg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=hr18AWq4
Subject: Re: [Buildroot] [PATCH] package/python-dbus-fast: bump to 2.33.0
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

On 17/02/2025 12:01, Marcin Niestroj wrote:
> See [1] for changelog.
> 
> [1] 
> https://github.com/bluetooth-devices/dbus-fast/blob/main/CHANGELOG.md
> 
> Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

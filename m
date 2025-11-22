Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4811CFC522
	for <buildroot@archiver.kernel.org>; Sat, 22 Nov 2025 17:03:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E610B849AE;
	Sat, 22 Nov 2025 17:03:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SkHc-lziW3J2; Sat, 22 Nov 2025 17:03:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0DD5E84977
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0DD5E84977;
	Sat, 22 Nov 2025 17:03:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id A094D34E
 for <buildroot@buildroot.org>; Sat, 22 Nov 2025 17:03:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 92C9F41D13
 for <buildroot@buildroot.org>; Sat, 22 Nov 2025 17:03:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZSpmDTmdjcgE for <buildroot@buildroot.org>;
 Sat, 22 Nov 2025 17:03:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8D43C41CE0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8D43C41CE0
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8D43C41CE0
 for <buildroot@buildroot.org>; Sat, 22 Nov 2025 17:03:31 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 56A8F13F8A9;
 Sat, 22 Nov 2025 18:03:28 +0100 (CET)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 22 Nov 2025 18:03:28 +0100
MIME-Version: 1.0
Date: Sat, 22 Nov 2025 18:03:28 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20251122130847.2242703-1-bernd@kuhls.net>
References: <20251122130847.2242703-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <86773298f7aea6f32fa08f6f3498feb9@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1763831009;
 bh=FnMgLCgs6PpAqOD1luYDxJhQXSmiV0S8o+SmCO9BCCE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=hXL+1jKQa4u5crCqA+7oRYmsu+noCXjZ8ddPeG3bpcz/1CzYxLyjbRnpanDg+5qGf
 hu950vOTs36s5Pax1A0TgBjgEOspBUCkVT6a9bplEy4d0dl3RTcZBc+aRRCYqfavGG
 1rl0NT9LWSRfn5aE/n1+dUzSRf5D0jQNCy4C91lZ7gqAUcSZAI57TDbIP8YsUysLPp
 y5cJn+VETDewi4E8CNq4ah9diJIlmiE4d6abPosfzUFGELagOKJLAickYl7L/ZiVEV
 fCEqfKubCdPy2ZXtGXJseJK9vBOANKYoddU3+a66GVNaT2BpNGHxgzSyynbpMQukPx
 AlXQWHwGrfC4A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=hXL+1jKQ
Subject: Re: [Buildroot] [PATCH 1/1] package/yaml-cpp: fix build with newer
 gcc
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

On 22/11/2025 14:08, Bernd Kuhls wrote:
> Fixes a build error not yet seen by the autobuilders due to other
> packages failing before. Seen with defconfig:
> https://autobuild.buildroot.net/results/ebf/ebf9a81f7e225ecdab20bbad8ad8daa136fddb46/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

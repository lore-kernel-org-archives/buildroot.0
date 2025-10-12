Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B833CCD187
	for <buildroot@archiver.kernel.org>; Sun, 12 Oct 2025 16:21:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DA23C6059B;
	Sun, 12 Oct 2025 16:21:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ASfRs5iX7cw0; Sun, 12 Oct 2025 16:21:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1C878605DA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1C878605DA;
	Sun, 12 Oct 2025 16:21:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 199B6BC
 for <buildroot@buildroot.org>; Sun, 12 Oct 2025 16:21:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0B6E8406EA
 for <buildroot@buildroot.org>; Sun, 12 Oct 2025 16:21:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ozNJZdd4gUJl for <buildroot@buildroot.org>;
 Sun, 12 Oct 2025 16:21:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 952504067F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 952504067F
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 952504067F
 for <buildroot@buildroot.org>; Sun, 12 Oct 2025 16:21:48 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 32ED160132;
 Sun, 12 Oct 2025 18:21:44 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 12 Oct 2025 18:21:44 +0200
MIME-Version: 1.0
Date: Sun, 12 Oct 2025 18:21:44 +0200
To: Fiona Klute <fiona.klute@gmx.de>
Cc: buildroot@buildroot.org, Antoine Tenart <atenart@kernel.org>
In-Reply-To: <20251012123853.3862795-1-fiona.klute@gmx.de>
References: <20251012123853.3862795-1-fiona.klute@gmx.de>
User-Agent: Webmail Free/1.6.11
Message-ID: <f2e67403e34ae38b3d0bd3675d6c84f6@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1760286106;
 bh=FqY1wGonN4SooN/5JGc4seyPsdijAf8Qp2DAdelvzVc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=bKJMrjO8kQoYvj6DcalpIsNgCXrfdOORPEVkTkahZSSWXQrRK47003NXhXe0PlTi4
 m+wbbRdDZVBmtkX435miNCZGynq+zfV5+iOhXtkEDYO5KeNi3vnc5aTayX15PT6w5w
 22EKCZHJhQDNUNzAuacBPdRAOZSFXBzAy3HmTjPNJ6hyw42pMd142UMCBpbB0tLVPq
 ZrAzyFQIxdYIbdziv5IRrms6ZANEFmHRKquANvr1sVsMBz6OwVP8l6SSg7rtIkPEYT
 H5BDdAyEsOBlm2b02KEmfUuLqpuhRLYJzaASiVEfHKS/mZSpnBUukdF+Xi995E5ew9
 jD+3YgGfvqlBQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=bKJMrjO8
Subject: Re: [Buildroot] [PATCH v2 1/1] package/refpolicy: add option to set
 policy booleans
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

On 12/10/2025 14:38, Fiona Klute wrote:
> Policy booleans allow adjusting certain policy rules at runtime
> (including whether changing policy booleans is allowed). The new
> option allows setting their defaults at build time.
> 
> A monolithic policy (like built by package/refpolicy) does not support
> persistent changes to policy booleans, so changing the defaults is
> required to make changes across boots. Adjusting policy/booleans.conf
> after "make conf" is intended for that purpose [1, 2].
> 
> [1] 
> https://github.com/SELinuxProject/refpolicy/pull/355#issuecomment-792758725
> [2] 
> https://github.com/SELinuxProject/refpolicy/blob/4d97523c71603b12e92cf1b80cd0e01ac75bc067/README#L186-L191
> 
> Signed-off-by: Fiona Klute <fiona.klute@gmx.de>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

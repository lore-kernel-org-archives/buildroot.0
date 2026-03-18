Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C69310775FC
	for <buildroot@archiver.kernel.org>; Wed, 18 Mar 2026 18:11:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1D3B260BCB;
	Wed, 18 Mar 2026 18:11:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vrRM9WXlhSd0; Wed, 18 Mar 2026 18:11:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 51C3260BBE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773857474;
	bh=brM2WwCOgRcGDIvp1ie+WLX4LrLAdYvtLbbl2eR8wKs=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=hTrOazhCW08qM9LnbG2L17Nu88lYfgE2L00md1/yOWou+9PVsitI8xz4fuauJV8Dg
	 B95vQc1CBojMLLsm6/2kaSWLoLh8pJOkU2oxh9+QUKSw8kpsDMUyx4B1+VzyvRZW2x
	 9VQKubcWCSC57X2ltTafo0nIcdRizVcm6WsNx4Qlr41cYGJH6asxGVd+5WlflC4uji
	 CSoMGAKslZ70QUXY/bnvXheuyQWsMyJgl/ynoSj7y8UKu8oobRzc4spCkv+ACzerFO
	 zz+xqfrSa2sr63Vs054Yb713w3OkRAdZwD5RtGE7w7IRh1OAlUIbUn8Rim1AXj14RV
	 jGRCKAzd9tfLQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 51C3260BBE;
	Wed, 18 Mar 2026 18:11:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id B94491B6
 for <buildroot@buildroot.org>; Wed, 18 Mar 2026 18:11:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9F13C831F8
 for <buildroot@buildroot.org>; Wed, 18 Mar 2026 18:11:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id drfmsygyw2rg for <buildroot@buildroot.org>;
 Wed, 18 Mar 2026 18:11:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org DB4D88114B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DB4D88114B
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DB4D88114B
 for <buildroot@busybox.net>; Wed, 18 Mar 2026 18:11:11 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 1C3AEB00592;
 Wed, 18 Mar 2026 19:11:08 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 18 Mar 2026 19:11:08 +0100
MIME-Version: 1.0
Date: Wed, 18 Mar 2026 19:11:08 +0100
To: Francois Perrad <francois.perrad@gadz.org>
Cc: buildroot@busybox.net
In-Reply-To: <20260317070540.219669-1-francois.perrad@gadz.org>
References: <20260317070540.219669-1-francois.perrad@gadz.org>
User-Agent: Webmail Free/1.6.13
Message-ID: <f67d6489c4b49af6c5b03291e2a5cf65@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1773857469;
 bh=pIvIEn8FUeLybZzAi8Kxm5fuRnnjBdCskJvmL8e1UaE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=OLIm0ZlKIj1edr+VAEN5pmRQzVtgeJFZ/dCeYddQydmFs3PqHduG+5IrWaCfLRkFg
 uhaY4kxhq3n4AkN7JPmb/6bueKXgiCbNKnjQl5ogICqM4dG13H6HvwiAAjRJI3esR4
 dGUMNOdkgPYz/ffstgHAW09beOI4v0q9ErpBqZS7cuj1Pkt5Ahq1tFfnt8fl/mClRw
 +Hfclt3kbrnxCohx8la9PcIec4uahJK3RD1bxVAugNI4RQNgk+ACyidifLltj8f7vP
 VYRZ1I+tpoL7oxUYTszPYHOItKygo89Ykn1NgspjQG17YS7jnIPvH8xzl+n+cTUjEg
 CxLG1dCVuw02g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=OLIm0ZlK
Subject: Re: [Buildroot] [PATCH] package/janet: bump to version 1.41.2
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

On 17/03/2026 08:05, Francois Perrad via buildroot wrote:
> diff LICENSE:
>     -Copyright (c) 2025 Calvin Rose and contributors
>     +Copyright (c) 2026 Calvin Rose and contributors
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

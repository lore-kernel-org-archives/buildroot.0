Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E8C5CA601E
	for <buildroot@archiver.kernel.org>; Fri,  9 Oct 2026 19:32:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8F6468149C;
	Fri,  9 Oct 2026 19:32:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WfqpCHvFvl_B; Fri,  9 Oct 2026 19:32:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 80AB781496
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791574323;
	b=fkh5KxWl0PeQNgqyZgCcDIW7hmAQs6T8lGoTXUIJC0kiFmKfC2JTSnOz3Z2sVx8NcVl0
	 /haM/L9XJCQqGusvDydiF2SzyhAfX+unrr9rzYmFFiBuDuvOpVOR1lHE53c0UU04AKndt
	 kqYybv+S4YXOL/ScBYBkcaIhcWgcNSIEhBWK0Ju02K0NfddMDxXW8UeYxpKxcEpVJI20e
	 47U+j1PJRu7pnDkbb09IbAFIY57c+ynAFSgFerLxRyaEy15g8Qw7P6s7MIs+rdkumEMjI
	 zq8X0lJzzI9w3NnlpJanwQYGEkXDflJK4o5tUrTgFFdvduLip7Fj0fqgATVAbXU/DpA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791574323;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=shSVUqFS0dgA1LT7iHRwgEOhFzmZ3+tTRkOagviqbkE=;
	b=rHeFBPvAz8/AmgLVu3WzbFbnhWgc1bXZYiRzujGgtzyMrlLezKw3adUd/pxjuT19nRgl
	 tXQRrZaRjIJhk5jEqubUKz0kBYLZN/28UQIX0RMqbWaAEbJYTrcfbpoaa6oJWuPxUOS9X
	 tKSFpb7E+mlpaY6EIEmMgf3jUlCMgrJcmSxzcINQfNrubKwE/Jwd608RwZsUDPlMZ0clQ
	 p+ETPYlnbF+F4Z9+rNZhhaalpy3M2CpF87yzT1cT6bFzu/Pqc64Y5S+5aeuSwvP+wmVQn
	 rYgikC4DiMuNa4KLAMOPpwVLM59Hg/9hVmu1Q/AG+GzoMzeTm8CkyP8gj01ePg85mdA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791574323;
	bh=shSVUqFS0dgA1LT7iHRwgEOhFzmZ3+tTRkOagviqbkE=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=NQfcDvm47+mOtciSF4nm9IUY3xBwu2u/QBScixSuj6N+xgfmyRMIOrw021hH5xjkY
	 mzAbtFRIfCYhn2rCHf4SnkEzZ1iQuwUczwY2B04Q8uuWwUvxFt3qR2xrGm6BUzBwTH
	 J19PcLYanTNlqTA5HxxvUa0fufw/yZNX/Psyt/jYB0LN3arleDNKwKFnut6psB7r1R
	 a5YrBcyxTuukHYXK6KtcvhmCepKom/tDWEKKcBPEJO6VJndzbjGDileJ1pENiaHpRU
	 3WL26hIEuhQbvSqTyb75JzNz7rBA8NtJ+zFP5tnqpGdmQJ/IB+JSvCZ8ipiHwggKyI
	 IebaJkTutJUtg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 80AB781496;
	Fri,  9 Oct 2026 19:32:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id E9D8C13B
 for <buildroot@buildroot.org>; Fri,  9 Oct 2026 19:32:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CFEDA4070C
 for <buildroot@buildroot.org>; Fri,  9 Oct 2026 19:32:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 91WHpkkiimsj for <buildroot@buildroot.org>;
 Fri,  9 Oct 2026 19:32:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 7268640426
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791574321;
 b=fF2KejakNqlEYKI/7bT7bxsrjWRZC8RL2d7P8KRbcZ2GUJ5dPfqCfCXKGxYI4S5nICrs
 KNBJlA0DyWLr9RvmafXzS/BkyqoShhUAkuU4os7gNd7hW9BuOXaMKMDuq2Q6ivFlbxWZO
 5Fmxn0BPoFSeU/2bExOvoxOIyks9KhBrSAsWkEvEfUjuv1sLkWSujQXKPq7pmNa7dUcWc
 srL3unWoly593bdoKHBsjdJ2vemx58MitSnXGUgfTx2su+6Ym+SBjXHxCytozsRtCBKrz
 H4E+uvHAAWtGZ9H7TDMXXxmkAvrq8F1trgZJUJ1o2DeVaYLLViZB3OUNc56HM8iOT9g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791574321;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=ptVtRpCBZZt9ZnvQoEW+HARh+Aq7c2nBWBXAO2LDrjA=;
 b=cyCoUXacrdnzzhnwvjm3D43m64QwqUpOAohsfs57YV3ajTyERwYAh2vffgrIBbQRR2qF
 JLBM56/M793DEmOd8sAmxG03AJZwSDfPe0GPJTkwXu+IN0XstrhAcq82OMoBjIROWijtF
 oTEPoiowO/iFY99WEP5ezCNUzNMkSCGpdr/bATOi3PhP1NyWCrSU6Mhnw8GaeAGKyu7+A
 hSJAg2TG18dKRJvyDBfp37ReuhR5PMp8UVK6j73d9cJ7imvTgQ2ZQgAU+wL2w20M9m1Oo
 kjFcxLP/lCNP5Awxlt/d0ieuhAcTBsBMn8Dstz9pb1ffkRYKF7H/N/stW97RGk7Ue1A==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=free.fr;
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=iEeWY2Tg; 
 arc=none smtp.remote-ip="2a01:e0c:1:1599::12"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7268640426
 for <buildroot@buildroot.org>; Fri,  9 Oct 2026 19:31:58 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id D7CFA13F861;
 Fri,  9 Oct 2026 21:31:55 +0200 (CEST)
Received: from 199.151.230.94.awnet.cz ([94.230.151.199:53130])
 via 199.151.230.94.awnet.cz ([94.230.151.199]) by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 09 Oct 2026 21:31:55 +0200
MIME-Version: 1.0
Date: Fri, 09 Oct 2026 21:31:55 +0200
To: Yegor Yefremov <yegorslists@googlemail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20261009143448.1559850-1-yegorslists@gmail.com>
References: <20261009143448.1559850-1-yegorslists@gmail.com>
User-Agent: Webmail Free/1.6.19
Message-ID: <c9943c51166cb92aef6d98c4808b5993@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/shadowsocks-libev: update the site
 URL to shadowsocks-c
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

On 09/10/2026 16:34, Yegor Yefremov wrote:
> From: Yegor Yefremov <yegorslists@googlemail.com>
> 
> The upstream repository was renamed from shadowsocks-libev to
> shadowsocks-c. GitHub still redirects the old URL, but the README names
> shadowsocks/shadowsocks-c as the canonical repository.
> 
> The v3.3.6 tag points to the same commit in the renamed repository, so
> the tarball and its hash are unchanged.
> 
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> Assisted-by: Claude:claude-opus-5

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAFDCFDEE47
	for <buildroot@archiver.kernel.org>; Thu, 23 Apr 2026 19:55:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8AE644065C;
	Thu, 23 Apr 2026 19:55:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n_rmJojZM51d; Thu, 23 Apr 2026 19:55:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EC4B340396
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776974100;
	bh=Lte1GnVcKPq98jwXyy1KeVJdA78s6WCjs8rq03SUdTQ=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ErTzxBJcGgdTAjIdq73WgwMHj4wQOsboeN5WBuRinuXow2Px7NNjfG53N2WdACjpi
	 ny2fT9G6v5prmwx+7+xC/lEfeBkX6nigEdS2OnumXwID2AMj7wRpDW4R03rFl6Uolf
	 UXMB5nbsOlJ8zzwlhGatHYlFB4TMKGhbtdEizMf2oNjcuZSl1CAsns0j6i1YQOhs62
	 pW4FjEhle8JcX8mEt2dy0AsopeUOUpcxXetdmkH9wyltASdx2HuSmAtssIUepsUGul
	 oaTEY0LeU4UM29POk2IqrxZBbkUM69YhwmU+zEOolFZAi97PoLrxpK03y3Z6zrKkHU
	 2dtVKK6UlK1JQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EC4B340396;
	Thu, 23 Apr 2026 19:54:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5E5DE231
 for <buildroot@buildroot.org>; Thu, 23 Apr 2026 19:54:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5BC8180783
 for <buildroot@buildroot.org>; Thu, 23 Apr 2026 19:54:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jDtYnQ118xyA for <buildroot@buildroot.org>;
 Thu, 23 Apr 2026 19:54:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8850980781
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8850980781
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8850980781
 for <buildroot@busybox.net>; Thu, 23 Apr 2026 19:54:58 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 27878780368;
 Thu, 23 Apr 2026 21:54:55 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 23 Apr 2026 21:54:55 +0200
MIME-Version: 1.0
Date: Thu, 23 Apr 2026 21:54:55 +0200
To: Francois Perrad <francois.perrad@gadz.org>
Cc: buildroot@busybox.net
In-Reply-To: <20260422163125.5757-2-francois.perrad@gadz.org>
References: <20260422163125.5757-1-francois.perrad@gadz.org>
 <20260422163125.5757-2-francois.perrad@gadz.org>
User-Agent: Webmail Free/1.6.14
Message-ID: <e5de77bbe3a903ea9f6881e20ce47fd6@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1776974096;
 bh=t1GkVfljTcy01e1zUEva0kvFXGkdyJuiXunYWLcoLJQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=YDWIpz9mt1H/SGUFykJmS49gPTMvPqCqS/ylccuQRZ4PUer9CusmHiz6ti0WH/+VJ
 EPXRJGxX6MWQ770gA5s68REQqe+/9t0U46muD8uus/6i1UZxxlUZrU/rENxTg35+xT
 Ib+vHoMBHRknhKylCYnRJeWyQelGa89wizCvkFceKC40xvhnHc8L2PUuMCorNo1Rhq
 gg7rZmqN0GWjgvZPXWmbDybSyG5cNG0SDJqEK+W/cHfl3gm+QOaNTBrclLD0k74JbU
 PCLmFFGk9vwhNr2GVV1S8gMxmtQQyMfno6Nl0XvCLsMmfdPQHtkSe5BVV8sVtRz7rP
 WZemcEjk3a2yw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=YDWIpz9m
Subject: Re: [Buildroot] [PATCH v3 1/2] package/ficl: downgrade to version
 3.03
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

On 22/04/2026 18:31, Francois Perrad via buildroot wrote:
> see https://sourceforge.net/p/ficl/news/2025/07/ficl4-is-retiring/
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

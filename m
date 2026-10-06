Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D59CCA5FED
	for <buildroot@archiver.kernel.org>; Tue,  6 Oct 2026 20:36:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C973780F76;
	Tue,  6 Oct 2026 20:36:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eAjG2l-LoCOF; Tue,  6 Oct 2026 20:36:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 8B59280F70
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791319002;
	b=BsHOeXt7QWKQ8YsrIqbRq4yDxsrb4uTaoqBS0YC3Xppngm39+OyoC7bB09AGhuuIfziH
	 p/4TqfyAE1drdkZYkogQ2hlQ7nKUKDRkMWMixBOn/pLRsAVGgWKqBjBTk6K3rsI5OiiML
	 TiU1uQ22pThrdeCmzy6qg/KBhgdbkDjJh9nhgZMXEESybI6v2xitass8reD3Xxib5+Aoe
	 P92Yl6TzAahNk8U+ORbupNZ+Y1g7KLJ46MhwzA6VLM8yShw0w+ckrkhVl+EHBf+DaY1fO
	 EXblytzFJJSpqpn7t/ix+DVLA3BMAjnRUS65/kkmcrBaDrmp2DejJWTZVKVyySeYzug==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791319002;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=H6cuKQd1+/MU/VOh1DfWFDnKZq2pvHrhgjHZdDGByhw=;
	b=aYcoeZpl0ENA21Vr1TBkU0iWbzOMrMN7XICndJHat6eAQiStjUgVKnz4il0wzdvPfDjA
	 6bj1EVEefZW2I8Ju+NlxqGmwwDhVE1PMNYaXGoMYJfibPUPDk41KmJf9apDpu4nfKt5ZO
	 /JmsU0KAZ3VvzVXj6RoOhalaqZdxUkPcMh8cLL/QiV2kw3T+3zz55DL8zExDR2yJlaoV6
	 GHIJKpg20tGDxNIts63Jm4BjAtbe1P7ygonHeHuZ7XY/Gg3qzl3bcedUe9ZdVDihKYJhV
	 5J6v2ufTb9yJ5PGYV/zuopbF0+Ng9pTAlbc9HcBaA+UEN1eKsZWx/9vKOvSa9OY7zTA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791319002;
	bh=H6cuKQd1+/MU/VOh1DfWFDnKZq2pvHrhgjHZdDGByhw=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=hsPZKlqfgrJJ4Ld8IiEGCuQs2fYozbV+trJhyoXVefBkaTYeMmIJCHLY5AOd/DjVc
	 mPFx4B68xMixsiKu9ZcMixTwni7IsHFugCgmc+DTXgUj0yOrg6vWFRLRVkxkd80aJH
	 e/GYtcEZ0mBKJB9GEM+VpB/HIQdbEfBjG0aJiESiLqrdXq0lZ3fGQPKzy8EkZzjKJC
	 XbZs+PeDa88SlT7h408jdnGgbCks9MGIEDCQqsJvM4+CRl63kaL2tNC93sev61my2U
	 Zzktip6TvkTFznj06s5cPUGMo1dUSCSyRjUkCe2BODTeM5BiakBq0Qp9e7fbRbdLPP
	 f+BEPliRHCfww==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8B59280F70;
	Tue,  6 Oct 2026 20:36:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id AA4E42AA
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 20:21:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 906B840801
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 20:21:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VJ-kMoE5rdoE for <buildroot@buildroot.org>;
 Tue,  6 Oct 2026 20:21:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org BB2B4407FE
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791318063;
 b=AXgrunNQ2pfgja/9h1YGRZ1pnVdcaJlBsGLsxyapY4MzD7hE1AiXkFEkp4ghAB4p3cQy
 Clu8YUuMLl7lblEnSvynbah8NodLYnTKvWccSGMFSs2zg4LZUSXBTEmkhmxweWtBk3oYm
 KB7tU4A7I1qsDWsqz3NKMS+S6oYDHfZNXKe7sTyrgZL67rLb3N8fWf/UvdzQ3ebg3Sc1n
 c3ejhci1pKVo0XGBOovM4aAJJnq4lIZWCeg+nvCx5840KR0wZRqi+LkNfsg0QDUxVxb8O
 /GnK55SH1iRnRWjCn5CrGamQgKsucn2hhDgNSqC4Y7LecDZNE0UkX0fOKZLb9s5ZnsQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791318063;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=Gw9HVKujbCg8Bbp76n4eaIb0Iesmc4JsqVYpRYrPcJ0=;
 b=bmajyhA+JMbjp5rwPyRsMXFu2EBVDZRIWCz+XAWOwxDdjrOSW/gXQEcsaJyX8HunOQbA
 yNTzznpACcsKrqWPAg5hO8rENXla+re0bGteZkM246NpT2k/BxvBFfZmhG+mDH+cfk2oU
 GfgtV+R3uB58VjPwkbTVB137121CjNUXGWCevPVN2M5G/gESAJcpMUng4HIQ2AIpy6joz
 1b1ZYmf+MU1kGlqTRBpS9io9IW2uhak8Qp8U1wCPEgni+xlje8GSxg+vA1oWHAqltUJoV
 byW9yDE+1gCvfNZXO4xs5vG6AoDkmxMOxQ4Z7LHJWuegl11y7v9Dp7XbudbXgoCmx9Q==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=free.fr; 
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=nQspY+Kd; 
 arc=none smtp.remote-ip="2a01:e0c:1:1599::14"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BB2B4407FE
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 20:21:00 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 436DA5FFAA;
 Tue,  6 Oct 2026 22:20:57 +0200 (CEST)
Received: from 199.151.230.94.awnet.cz ([94.230.151.199:48716])
 via 199.151.230.94.awnet.cz ([94.230.151.199]) by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 06 Oct 2026 22:20:57 +0200
MIME-Version: 1.0
Date: Tue, 06 Oct 2026 22:20:57 +0200
To: Peter Seiderer <ps.report@gmx.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20261006194239.947480-1-ps.report@gmx.net>
References: <20261006194239.947480-1-ps.report@gmx.net>
User-Agent: Webmail Free/1.6.19
Message-ID: <981b8cc3ed6c5e7f2ea0ba0e99b97451@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH v1] package/openssh: security bump version
 to 10.6p1
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

On 06/10/2026 21:42, Peter Seiderer via buildroot wrote:
> - bump version to 10.6p1 (for details see [1])
> 
> [1] https://www.openssh.org/txt/release-10.6
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

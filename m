Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AC30F459EF
	for <buildroot@archiver.kernel.org>; Fri, 10 Apr 2026 16:36:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 53DA6411A2;
	Fri, 10 Apr 2026 16:36:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tPJY9tGWOUYi; Fri, 10 Apr 2026 16:36:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7C4CA411A3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775839003;
	bh=seLnaN5i7yCa8+QL/UjCsTiwrvPHG9AJd/wHAcNK904=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=f0vVed3XD+MvOuzc5RZcilu+KaN1mXGOxa5t+qx1cny1zh1SKfNjmAnAzJd6oLP/b
	 /NfXlTalgIM3CQfgUop5CMmEoXcRcnOST0ahPrmHNTBo/SirWrJhGXh3n5H3kbnu5l
	 fcL+MHXhjtlLkXEjy7DO31jWFZ8suyxMb+yIW/BqjMv4XYWh+fPt3/VUhkYC828rBR
	 GqwTiEmQMagZecKaADcPn6VoSnfsCkhuq2kEbBKpqNG6NhYzfOuJ6qLH6/qxdAw7hN
	 sae/HLQRKPF75HQxBKRoS7c7ZSCJXABTEuW1dAdUPJXaEZ7DNrl3FsPEJ0QlVIc0HZ
	 kQtV2r7rggBxQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7C4CA411A3;
	Fri, 10 Apr 2026 16:36:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id DAC271F6
 for <buildroot@buildroot.org>; Fri, 10 Apr 2026 16:36:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CD397411A3
 for <buildroot@buildroot.org>; Fri, 10 Apr 2026 16:36:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nNBfRmOQm73O for <buildroot@buildroot.org>;
 Fri, 10 Apr 2026 16:36:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org ECCD7411A1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ECCD7411A1
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp4.osuosl.org (Postfix) with ESMTPS id ECCD7411A1
 for <buildroot@buildroot.org>; Fri, 10 Apr 2026 16:36:40 +0000 (UTC)
Received: from [192.168.178.20] (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id DCF762C8013C;
 Fri, 10 Apr 2026 18:36:37 +0200 (CEST)
Message-ID: <41420683-9e63-45f5-beaa-155ee152f01e@bubu1.eu>
Date: Fri, 10 Apr 2026 18:36:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: yegorslists@googlemail.com, buildroot@buildroot.org
Cc: ju.o@free.fr
References: <20260410090649.3029441-1-yegorslists@googlemail.com>
Content-Language: en-US
In-Reply-To: <20260410090649.3029441-1-yegorslists@googlemail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1775838998; bh=2g5D1wlFbiY0hmRC8OGsn+MGIAY4iXJEbqQ4EtSLU8c=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To;
 b=e/xLRxZG8TtstTXKGSLsDJiR4R2EdxhtrPgDONd//t2z0EtODe8c7uReoggoGmhVm
 Ro8YW6fs8q9uXRotWPXdBgg11z2pUzNBHXKPJjbBVw4uPdJ3Uv3BbCH0B2WXAucqQb
 4LlirPtaRB0hCO6PfgeaLmRcWPHPAMjtiEoXMF1Fwy7btJqh0QERY+rseJoa4kLTAW
 1uLSdm04KpbDnqujs9A06sbxZ9WUVgKkje5Hh6VlaxjtZsly1wyjg+a1YetbiQXawG
 5GQZKnnCYU8SnSRs4v3u4acTL0+xd8E1pbMz9SOaOndsMLcspJx52xQsIpLcCzBvi9
 LnEtFGPebJibg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=bubu1.eu header.i=@bubu1.eu
 header.a=rsa-sha256 header.s=bubu header.b=e/xLRxZG
Subject: Re: [Buildroot] [PATCH] package/libftdi1: enable static only build
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Yegor,

On 4/10/26 11:06, yegorslists--- via buildroot wrote:
> From: Yegor Yefremov <yegorslists@googlemail.com>
> 
> libfdti1 provides configuration options SHAREDLIBS and STATICLIBS
> that allow any combination of static/shared libraries.
> 
> Fixes:
> https://autobuild.buildroot.org/results/d7b9a45ccffc1c9e3fd796c3e46ee396b7d88272/
> 
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> ---

Finally applied with a small change, see below.

>   package/libftdi1/libftdi1.mk | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/package/libftdi1/libftdi1.mk b/package/libftdi1/libftdi1.mk
> index 31ffa1aca3..0595ccf963 100644
> --- a/package/libftdi1/libftdi1.mk
> +++ b/package/libftdi1/libftdi1.mk
> @@ -13,6 +13,14 @@ LIBFTDI1_LICENSE_FILES = LICENSE COPYING.LIB
>   LIBFTDI1_CONFIG_SCRIPTS = libftdi1-config
>   LIBFTDI1_CONF_OPTS = -DDOCUMENTATION=OFF -DEXAMPLES=OFF
>   
> +ifeq ($(BR2_STATIC_LIBS),y)
> +LIBFTDI1_CONF_OPTS += -DSTATICLIBS=ON -DSHAREDLIBS=OFF
> +else ifeq ($(BR2_SHARED_LIBS),y)
> +LIBFTDI1_CONF_OPTS += -DSTATICLIBS=OFF -DSHAREDLIBS=ON
> +else

I changed this to an explicit

else ifeq ($(BR2_SHARED_STATIC_LIBS),y)

This pattern is also used elsewhere in the codebase already.

> +LIBFTDI1_CONF_OPTS += -DSTATICLIBS=ON -DSHAREDLIBS=ON
> +endif
> +
>   ifeq ($(BR2_PACKAGE_LIBFTDI1_LIBFTDIPP1),y)
>   LIBFTDI1_LICENSE += , GPL-2.0 with exception (libftdipp1)
>   LIBFTDI1_LICENSE_FILES += COPYING.GPL

Best,
Marcus
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

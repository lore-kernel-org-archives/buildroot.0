Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6845EEA71AF
	for <buildroot@archiver.kernel.org>; Sun, 19 Apr 2026 22:41:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1025F40A8B;
	Sun, 19 Apr 2026 22:41:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l9ANEUBzTQAn; Sun, 19 Apr 2026 22:40:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 38D1F40A8D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776638459;
	bh=5gZ/k8Hn1VfH1McJjKB+5TQwLmx9AOeLo6o1hRjnhnU=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=GJ+WjzoiYvKXoe5Kdl+GznkVwkrGvRwThSmI/IvT2yk12YwURP7yyXeitqT0IhO71
	 gZtar86FjkGG9H5T89sHUGBtxOWYZLaIOn0tJJaC3EV0L2DqRrctN6O8NdeO36RUCY
	 dEseSNzzuulHg8KGO+lmzbGEanQJLwPoN4gZSdLub+aPEOWMwklqCrFRSS1vNzz7p9
	 f0dA75Mx9jLzlv7+j9+bqXOxr0sMNSZF3Q2+m672KHrTKy1X7zpuOCNC0zJTNIRSri
	 mGpJYByXiykHTxJB/2F2YP8jlQ7FCkIga+kuq0yNs/ArzLYm4aT4hGgVx+BmMd7eUq
	 eorrUq/oes7JQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 38D1F40A8D;
	Sun, 19 Apr 2026 22:40:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id F0B0224D
 for <buildroot@buildroot.org>; Sun, 19 Apr 2026 22:40:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E02948136E
 for <buildroot@buildroot.org>; Sun, 19 Apr 2026 22:40:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id faeiNI4TqjqJ for <buildroot@buildroot.org>;
 Sun, 19 Apr 2026 22:40:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org ECA1A8109F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ECA1A8109F
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp1.osuosl.org (Postfix) with ESMTPS id ECA1A8109F
 for <buildroot@buildroot.org>; Sun, 19 Apr 2026 22:40:55 +0000 (UTC)
Received: from [192.168.178.20] (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 5B75E2C82975;
 Mon, 20 Apr 2026 00:40:53 +0200 (CEST)
Message-ID: <dac26baf-08c5-4938-bcff-ade69449051c@bubu1.eu>
Date: Mon, 20 Apr 2026 00:40:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org
References: <20260418144531.706692-1-ju.o@free.fr>
 <b51dc808-9b4c-49a8-8e5d-b759f2ddd856@bubu1.eu>
 <32a990a972991101fae28210e5d26645@free.fr>
Content-Language: en-US
In-Reply-To: <32a990a972991101fae28210e5d26645@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1776638453; bh=ss8FJxoCmo7ys1cSd2SnIUE/fLlbH/946LCzpqFU4Xg=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To;
 b=s+8kzo4hPgbIv7Xd6U+vsTUzsHXF+U5jt45FGiXJgFHsTrrk9TghrNi6oUewNof9I
 OC6ER/VmH5MUkBmdH/jZAIf4JzR3nIt9CUMcrGOVx6h1I5gfh4hZRzjwtb+3xpoo0Z
 2QMeyytdwK0m2F44fn/n8NJoPB/AFkEji4ukVG+WsjYvNb074YNhAl1efQWv0kyuBL
 ihkWt2qNLub0C+LzSfzMx6brItsxx6jXVMKD7YRH2VXT41vnnKHeRE4cu8E3TjtiZx
 swSG7PG5dM3fR5A2z72Hw0HFgGfvgjeINj6Aj2cWk72y5aliMpxDjf1Qq8sM4AkWSq
 BKfjXj1mREOew==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=bubu1.eu header.i=@bubu1.eu
 header.a=rsa-sha256 header.s=bubu header.b=s+8kzo4h
Subject: Re: [Buildroot] [PATCH 1/1] package/libjxl: security bump to
 version 0.11.2
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

Hi Julien,

On 4/19/26 19:10, Julien Olivain via buildroot wrote:
> On 19/04/2026 15:05, Marcus Hoffmann wrote:
>> Hi Julien,
>>
>> while testing this yesterday, I noticed that in the initial config I 
>> tried this, the build of highway failed:
>>
>> BR2_aarch64=y
>> BR2_cortex_a72=y
>> BR2_ARM_FPU_VFPV4=y
>> BR2_TOOLCHAIN_EXTERNAL=y
>> BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
>> BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y
>> BR2_PACKAGE_LIBJXL=y
>>
[...]
>>
>>
>> It works when selecting armv8-fp instead of vfpv4, so I suppose 
>> highway is just not compatible with vfpv4? I couldn't really find any 
>> docs about this though. I suppose we should make it depend on armv8-fp 
>> when building for aarch64 though?
> 
> For a Cortex-A72, neon-fvpv4 can be used only in Aarch32. See:
> https://gitlab.com/buildroot.org/buildroot/-/blob/2026.02/arch/ 
> Config.in.arm?ref_type=tags#L314
> This failure happens because this config is in fact Aarch64.

I'm not exactly sure I understand this part of your reply.

Cortex A72 with vfpv4 is used by the raspberrypi4_64_defconfig. I 
stumbled over this before and I think this should actually be using 
FP-ARMv8 instead? But it's also not really relevant for aarch64 anyway 
because gcc will infer the fpu type from the cpu type anyway? This is 
what I found a while ago at least.

But should this setting even be exposed in buildroot for aarch64 then?

> 
> It seems that the test at:
> https://gitlab.com/buildroot.org/buildroot/-/blob/2026.02/package/ 
> highway/highway.mk#L35
> should be rather be on BR2_ARM_FPU_NEON_VFPV4. That way,
> on Aarch64, highway will configure with -DHWY_CMAKE_ARM7=OFF.

I can confirm that the following fixes this:

--- a/package/highway/highway.mk
+++ b/package/highway/highway.mk
@@ -32,7 +32,7 @@ else
  HIGHWAY_CONF_OPTS += -DHWY_ENABLE_EXAMPLES=OFF
  endif

-ifeq ($(BR2_ARM_FPU_VFPV4),y)
+ifeq ($(BR2_ARM_FPU_NEON_VFPV4),y)
  HIGHWAY_CONF_OPTS += -DHWY_CMAKE_ARM7=ON
  else
  # Highway Armv7 Neon support requires in fact vfpv4 / neon v2. When we

I don't feel confident to submit that as a patch though, as I don't 
fully understand what's going on here yet.

> 
> Best regards,
> 
> Julien.

Marcus
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

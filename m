Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D125606A327
	for <buildroot@archiver.kernel.org>; Fri, 27 Nov 2026 11:02:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=nd8z/JOt;
	dkim=temperror header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256 header.s=2022 header.b=Iis5veay
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DAB0281236;
	Fri, 27 Nov 2026 11:02:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w-bi2yKcOSRD; Fri, 27 Nov 2026 11:02:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 0C0468122C
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795777340;
	b=INGXNTrLb+Ov0ZQK4cLK3uoXga4ho9FB68d8Hy7iZh//eWovKRLUOjW3XQofCH6xARwB
	 3e0PSRdzQHnWND1T+z00hQTZvoeNb52elV+3+JQc/iilueO1+XEeHuDFE/ViDMMrGEltA
	 Ix+fsOqgJVRsfJrelhkG7QSh3IWi9CfR7QvOI6JCuKqaUQe1N2V6LFW4Fvy6xrKgrzw29
	 FunXAsnPolfD4SUEf5G4MiWFYzZnDShteiK2ihzPrkw3kFNmgOmMnnJbpTj5m9V3Rya0N
	 epJOshN4vxAtA02CL0TJNEUp1Cbs7q+Y335kDnP4FFnPKRWrG6gUQ9eLQyKYzs374Og==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795777340;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:Date:From:To:Message-ID:References:
	 MIME-Version:Content-Disposition:In-Reply-To:X-Operating-System:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=L7b7RVdM4iNxjVjlldW1QM2faVuV0gvh7grX0KTGZZE=;
	b=E30h2uS3Exq8UDMKrHXkBNSxyaHa5EHTnpfkbx3sNH+qMmsV5ga4cKVCPWWUSY1D8616
	 s8oz+HRUAohq5B/eub5zpGGllwe4FB7bC/0v2SGuGY0sCJOlzndtLwGmjadVt6JpXN065
	 +UhVulgGsvHGjQ7j4rw5bIinmr/qCxi3y2QSU1gJXtrqy4mi+5Y6JMJmy/rOex6Rw7zI0
	 py5uriIQKE1WQfCkePOQWSOvd3LzIsrcgsd3YTxBnwAHinCF6UYPhgfbgkJv7lTPcM5Hi
	 s2aMQBLI2Ces1el6rRAO0LCqqNEtMgX5D/jmT8nXNCZ6ILmXeGdSbrpvhOUbbS8k8cg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	dmarc=none header.from=openadk.org;
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795777340;
	bh=L7b7RVdM4iNxjVjlldW1QM2faVuV0gvh7grX0KTGZZE=;
	h=Date:From:To:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=nd8z/JOtxTquu/neEm8i8BHyiin2dSfyzu/XKcp6FggPguuhUw0s/e+3u7Kv5Ezip
	 wtjOATEfEF73GqUMAiUXLDD6qnaqFB/yP0wfsGnivjcuRjlY75EAka5lWVVSGcTXim
	 u3QC7XKl2I6e+8CurXjOkulUmffrnKZCpUA/pAmACeM7r4wIW9//B4hzjErA4bfGxu
	 BQ6aqCYQmHxrOlpIq4nuSj8x/vyJPLoD9cyBxOxODsoSp0Lw9ijvJBiIRBqh88b8Yl
	 jg6TaQ/NdF3LfzaqtZTYsQoSw9vqmyb49pmVZrG/loTulFbKM8aIFJRFrkLRQAU1tR
	 3BuHzh/+ewjag==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0C0468122C;
	Fri, 27 Nov 2026 11:02:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 511D1266
 for <buildroot@buildroot.org>; Fri, 27 Nov 2026 11:02:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 36F408122B
 for <buildroot@buildroot.org>; Fri, 27 Nov 2026 11:02:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 89rh4BuezDTc for <buildroot@buildroot.org>;
 Fri, 27 Nov 2026 11:02:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 3A6018122C
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=89.238.66.15
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.238.66.15;
 helo=helium.openadk.org; envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none) header.from=openadk.org
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3A6018122C
 for <buildroot@buildroot.org>; Fri, 27 Nov 2026 11:02:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=openadk.org; s=2022;
 t=1795777334; bh=LpKrHy+hTaMrcp5W49VftryLJfzX3xZSFO6wN7ZzFJk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Iis5veay39CyN7HpIgjEuCeHCzzD3zV5PqMgFRSIX/t4S4VdLihxof35VoKU1w0y9
 VcH8wMXY5jUCpyHjKPlu+hzDHwArd0Gm3OaHCKBZCO/thf8X1Ii5/BOUgYn6j5YsGx
 jUlPkxEI03cNFdOP3p1jY0YiFmUTQeL0r7oA8rpuuNIVzvDLBE3EZSwZWzEMvouA6P
 qXPEBAYaPcSsQ24hfREHQXeYge212WSSugQ1K4WcJibzkiT5NTxgppi70kLGPYX1VF
 KvYOR7hTF3YRuF0PAYzB8p7F82ZdLc57HExKCldsJlqCnGwUxXpK17ramBBphKuH5E
 E6ZR9Xc0WggEA==
Received: by helium.openadk.org (Postfix, from userid 1000)
 id A4F9631E0AB1; Fri, 27 Nov 2026 12:02:14 +0100 (CET)
Date: Fri, 27 Nov 2026 12:02:14 +0100
From: Waldemar Brodkorb <wbx@openadk.org>
To: Yegor Yefremov <yegorslists@googlemail.com>
Message-ID: <awljNv6svGV1DBu1@waldemar-brodkorb.de>
References: <20261125114750.611805-1-yegorslists@googlemail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261125114750.611805-1-yegorslists@googlemail.com>
X-Operating-System: Linux 6.12.113+deb13-amd64 x86_64
Subject: Re: [Buildroot] [PATCH] package/chawan: fix build with uClibc-ng
 without fenv.h
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Yegor, all,
Yegor Yefremov wrote,

> The bundled QuickJS includes <fenv.h>, which uClibc-ng only provides
> with UCLIBC_HAS_FENV. Buildroot enables it for hard-float targets only,
> so the build fails with soft-float uClibc-ng toolchains:
> 
>   lib/quickjs/quickjs.c:33:10: fatal error: fenv.h: No such file or directory
> 
> Nothing in quickjs.c uses fenv.h, so add a patch dropping the include.
> 
> This issue has been present since commit 9ec34dc363d7 ("package/chawan:
> new package"), as chawan 0.4.4 already included fenv.h in its bundled
> QuickJS. It therefore affects 2026.11-rc1 and later; no maintenance
> branch is affected.
> 
> Fixes:
> https://autobuild.buildroot.org/results/2d0823849c690c6471249c066f20b9dc8460f25b
> 
> Fixes: 9ec34dc363d7db8d5bc460d2607b1facf2103961 ("package/chawan: new package")
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>

Works for me. 
Reviewed-by: Waldemar Brodkorb <wbx@openadk.org>

I am trying to get this upstream by reporting a bug without a patch.
It is just a oneliner, may be they will fix it.

best regards
 Waldemar
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

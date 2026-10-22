Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADDE8606A31A
	for <buildroot@archiver.kernel.org>; Thu, 22 Oct 2026 19:03:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=jo0khEv+
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 74A3E81498;
	Thu, 22 Oct 2026 19:03:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Hu5xj4t8liju; Thu, 22 Oct 2026 19:03:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 626A7811EF
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792695786;
	b=IIBCrF3kQXA/3aSdpEKCdPRjZwOIJa3g4JmeMWwqMvIg3EuQ+SVo4tfSMemyjGqs9VXr
	 neShVDjGU+oaNPZv/zJLONHyJfgG7IhkNBVXFIZP/RHkWY0Lslvrcn/7vEUckrzKk+nev
	 Mp60nZ+Xd9CtllfZPo3G/lVWUuykPTF83obAKur0SLS7iSjwx6n4Y7LD7AsWt5QaNO37K
	 AmXM52Sj0IRM5HAXqxOtjO/oERLBdloxyCozpJGASyeRMDuyeKyEkT4h5SCaGBqgbJZ/f
	 5yWvcfLRIbSmGvM/IGVzK2E4tbvKClbqouAbfE1m3ap9UhKid50nUsjmCtcTFF/Wonw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792695786;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=1FbF8qi7XpiLF1RT8olOFnt0YWKo6BVU4OKcPdrmtlk=;
	b=M8MPxJlUB8c+i03NkhKmEacWQx0zWK4g8zIsT+xnSbysAK0ELvRoKb8A1cSPb7XD59wh
	 2NJ8S//z3nLRT4ASMXFrUTlNAeI/sv1IO7ZbcUuCdX4HmXeHM+k4yPICFEy6O/QfitNVW
	 A/LPOQLhUx1thgHzehn4bY+lHVxinrVhx7Vnet8T5RGUK2rwYDMuW2KAKTx2zty5rYG/V
	 oJmFNxtqC3MMkxFiSkBTV2F/XyHT2PBJTLLrZYchjSnhVOQAlV5MsIiNGDeQg4oCLATgR
	 SmWYsXNWP28MSORSAQch7+n9eiQvGe8+TiBU5AM4VKfEb9qgyuOX7VM/orH4ymCJDsA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792695786;
	bh=1FbF8qi7XpiLF1RT8olOFnt0YWKo6BVU4OKcPdrmtlk=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=jo0khEv+aXqX61InfBFIBp6FWWeMjYYvMGHNVgZZJI2zc7WqUscFiUxvUo0Nu/qvJ
	 rZfmY/Iuv4C7MF2QbDMvWGoic9r4ShxQKaI++5ZgLywCk3WyVbQdAx5/kU6rDmZv2u
	 9K/ZCs7SoZTFImml58fC+PHCXJOGOT7plaWgVzGXAZxZnPoNzUAGlnygCYPVMC7To8
	 hayYjL3/x2QD0P/0KHwfdrXlr13lwERJCPdgg2A5vNyvVdKC0D5BNtN4U0QmKJZpqP
	 lSiN4fbLnNV9cCxB6R8rdHU6rmNNUWKSq2cHcdPdyAZMvuGVJJGm1vsl5fVPfrS2jQ
	 ylzc2hB57JY8Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 626A7811EF;
	Thu, 22 Oct 2026 19:03:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7234B2A8
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 19:02:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5454760881
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 19:02:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id skKAvsY16a1e for <buildroot@buildroot.org>;
 Thu, 22 Oct 2026 19:02:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org C42F360821
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792695774;
 b=dRPk9mrL+HBU5W1ifXWyu/hKz27QSAx8CKaXwQiVMYW5X+hAFeRlQCH2GnWlAeP+EboR
 MDNyUGaP+IMsqok72IxjvV/AgO5EXaDIlWcpnuqmCfKwsa6STPg1adMJpDQI80pRVCo+o
 Bp3xTVkX4ldTOOfzbTWwenmEkqE+D2rchnhKoKc42Urgt3PxgJVADLRC26Fqv0nz2sBz+
 OMqsvAG6F7VBen9mm502P3N2pd+P7r3ZSQtz0P8s5jOsL0jjywV1pnGfLjbqMMHTH6pDv
 eji3Hjfr7kYxusBRR9/R0W9NyApCyqlqF7hd57pacHxAfaKfUZI5WYxgYGZD4Z1gofQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792695774;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=t/YH13V1InIoEHgv+e40ddZ5cXZX/W3P6cA814QpeTo=;
 b=BftXH76JXosdZp+rLN0nGubGCNktSxAzIITAZiNKmcZHNEB+Hoh6t9USUnfb0PxKr7N5
 LlZpRO/Y8mipUoajrSqu0tUUmRsrVwqnNCpLGGQnvdQh6MYbycm+a1yfeuA1MWKQ7Io9v
 HZYYarORQITQ5F39bYndOUuPyI2ioZmb5sIX60BA/RI3zM3DKD+yuBbgoclIN9mh2E1ko
 ch4jc+Nu1dbfuzGB4kIGd3WR1WhRvHndvDom5lr5eppD610LBPiUgsOgkgr1fxFcFIk9K
 WLhJWHIgKyINDExB2IhzEVWNSonNrYsfTFTTBrwBA+s0WS87qDdYKrGjMgYDrn/4FkQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=Qkf8uykI; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C42F360821
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 19:02:52 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 16BCA1A12B7;
 Thu, 22 Oct 2026 19:02:50 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id CAF0160763;
 Thu, 22 Oct 2026 19:02:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 22FB710328DD0; 
 Thu, 22 Oct 2026 21:02:45 +0200 (CEST)
Date: Thu, 22 Oct 2026 21:02:44 +0200
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: bernd.kuhls@t-online.de, chrismcc@gmail.com, yann.morin.1998@free.fr, 
 buildroot@buildroot.org, fontaine.fabrice@gmail.com, markus.mayer@broadcom.com
Message-ID: <atpdnvOYg7Bhns1h@windsurf>
References: <20261022172753.1256542-1-florian.fainelli@broadcom.com>
 <atpJvzAWPfCcAFln@windsurf>
 <00959e65-921f-4fe0-8c3b-38961367fa5e@broadcom.com>
 <atpWByZNXAvK-Cgg@windsurf>
 <94786551-afda-4d20-b259-6ca2b8ffd05c@broadcom.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <94786551-afda-4d20-b259-6ca2b8ffd05c@broadcom.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH] package/linux-tools: fix PCI endpoint tests
 build with recent kernels
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-6.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,MAILING_LIST_MULTI,
	SPF_HELO_PASS,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Oct 22, 2026 at 11:35:08AM -0700, Florian Fainelli wrote:

> v2 explicitly passes the libraries to link against, so that should avoid the
> dependency upon the patch above.

Ah, indeed, thanks!

I've got some other issues with linux-tools:

ERROR: architecture for "/usr/lib/kselftests/net/lib/ynl/lib/ynl.o" is "Advanced Micro Devices X86-64", should be "AArch64"
ERROR: architecture for "/usr/lib/kselftests/net/lib/ynl/lib/ynl.a" is "Advanced Micro Devices X86-64", should be "AArch64"
ERROR: architecture for "/usr/lib/kselftests/net/lib/xdp_dummy.bpf.o" is "Linux BPF", should be "AArch64"
ERROR: architecture for "/usr/lib/kselftests/net/lib/xdp_metadata.bpf.o" is "Linux BPF", should be "AArch64"
ERROR: architecture for "/usr/lib/kselftests/net/lib/xdp_native.bpf.o" is "Linux BPF", should be "AArch64"
make[1]: *** [package/pkg-generic.mk:386: /home/thomas/buildroot/all/output-all/build/linux-tools/.stamp_installed] Error 1
make: *** [Makefile:83: _all] Error 2

But these are not related to the pci endpoint test, so I'll
investigate :)

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

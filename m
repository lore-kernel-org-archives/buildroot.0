Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED902C55174
	for <buildroot@archiver.kernel.org>; Sat,  8 Aug 2026 15:55:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B07FD80EB0;
	Sat,  8 Aug 2026 15:55:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2skpSa_E7Z9g; Sat,  8 Aug 2026 15:55:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0218C80DC5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786204544;
	bh=ophKZzDfOvdrOwCYfJ1g0Rkb27kzXmG6mTljHKDUo6A=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=oBVWQnjU/bt2gy37BwyK/zwse1AIKslK5pt3PRhiq0ZecLtkeW+0L3LH+ZjUscf/B
	 GX7+/4M5SdiU8nLbZxTK8CMbVRbZvSXvbPTjS1shpR8BHQbmZioWqMP7HaeinQn6Le
	 te67eeAjZgnmemh77YmogY13Denjm+olKCj8XDBMoVN6ANI9v+5asL6s1tlDu0j0AK
	 gxsalu5EYiTFfYH5WcH1vtv9DtbdP43g8LCymFiAIt/oFvV91LAJzhTwDH5o/CYQiI
	 ryNQ9ACnelgVgvmw22GIlNIPPZix0pMmSKH43jHseff4Na/F4UDe8QLpNmlQAqwvYQ
	 BQzdg5LeSolhg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0218C80DC5;
	Sat,  8 Aug 2026 15:55:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id B4BAF282
 for <buildroot@buildroot.org>; Sat,  8 Aug 2026 15:55:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9AD5A80DC5
 for <buildroot@buildroot.org>; Sat,  8 Aug 2026 15:55:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SwMIC6dW8psv for <buildroot@buildroot.org>;
 Sat,  8 Aug 2026 15:55:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 56A9C80DC2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 56A9C80DC2
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 56A9C80DC2
 for <buildroot@buildroot.org>; Sat,  8 Aug 2026 15:55:41 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 31ADAB00576;
 Sat,  8 Aug 2026 17:55:38 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 08 Aug 2026 17:55:38 +0200
MIME-Version: 1.0
Date: Sat, 08 Aug 2026 17:55:38 +0200
To: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20260420190748.181272-1-chakrabortyshubham66@gmail.com>
References: <20260420084407.37993-1-chakrabortyshubham66@gmail.com>
 <20260420190748.181272-1-chakrabortyshubham66@gmail.com>
User-Agent: Webmail Free/1.6.17
Message-ID: <726a7477ae55f591603ba638352293a7@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1786204539;
 bh=XdLoiBvHPk7b4F000iTBMBtjXSuVjEQQT3m2MYNVQig=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=tl7q/CKN/tu3Dm65HZat9iTzgVuZQaF4Or7v9T1QoM3WNiKPKpphbBKzwnd43X9O4
 h1pPXXNXL7thja2U8bnCkQa53sbCzk/co11MadstKh4zE7eztzVlpmpF+2c7kAciQ5
 wmxcJBWThG2tP1T67KUBCvM0U9HtWUktNmS91HXuiufs3vEqUP+Jx0xIRveFo6kZvM
 SMg7df+ACDykjjQcGGYuKsXlqWUV4ZtU+wGr78WIJ2UPKvZhOl1t9wwBY3ospWjg1T
 ZfvJVqjbu7ATcoop/Uj5kHIpAgUzleCY21j0u1Z3O3GKNEDTlAylXObcW32c6GX/s5
 d8IilYEYaj6Zw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=tl7q/CKN
Subject: Re: [Buildroot] [PATCH v2] package/botan: security bump to version
 3.11.1
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

On 20/04/2026 21:07, Shubham Chakraborty wrote:
> - Update BOTAN_VERSION to 3.11.1
> - Remove 
> 0001-Add-more-value-barriers-to-avoid-compiler-induced-side-channels.patch
>   as it is already integrated upstream in this version.
> 
> Fixed in 3.11.1:
> - CVE-2026-35580: Resolve certificate verification bypass bug 
> introduced
>   in 3.11.0 (GH #5500)
> - CVE-2026-35582: Resolve TLS 1.3 client authentication bypass (GH 
> #5599)
> 
> Fixed in 3.11.0:
> - CVE-2026-32877: Fix a heap over-read during SM2 decryption (GH #5450)
> - CVE-2026-32883: Fix an OCSP response forgery vulnerability (GH #5449)
> - CVE-2026-32884: Fix a name constraints bypass for DNS names (GH 
> #5448)
> 
> - Remove the --disable-altivec configuration option as it has been 
> removed
>   from the Botan build system in version 3.x
> - Optimize the --disable-neon logic using the yx pattern.
>   In Botan 3.x, the --disable-neon flag is specifically targeted at the
>   arm32 architecture. Furthermore, Buildroot's BR2_ARM_CPU_HAS_NEON
>   variable is only defined for 32-bit ARM, which previously caused a
>   false-positive --disable-neon flag to be passed on AArch64 builds
> - Update license.txt hash in botan.hash due to the copyright year 
> update
>   to 2026
> 
> https://botan.randombit.net/news.html#version-3-11-1-2026-03-31
> 
> Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83BFB606A332
	for <buildroot@archiver.kernel.org>; Fri, 13 Nov 2026 09:39:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=n4yF5JwH
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 450FF40D64;
	Fri, 13 Nov 2026 09:39:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j3_5j6JFnk1J; Fri, 13 Nov 2026 09:39:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 5475340D83
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794562783;
	b=TVaNJr5tHuaMg3jlyp1XP6gyi+m5FvclcHo30YN8tAKr28eYD48d8XQeFBj47Tguo/4d
	 4USd3mPg1Fr0yccknlTWjTTwhR5y41+EV6A/XbW9wunGeYBybH6Gd9wa4ljAWYUCdCtQF
	 titI2WLyncTGxWazHxn+qWtIE46NnsZ2i8dvcKMG/orcNZ7Xa6Xo8qi4fJKUak7j1EAgG
	 89VmllHkHWNWGGA4PebPrTDUW3+IiaK4YwUjR5H2CtVNjh7aj5xQr1wM8IW/PVUy5NIxs
	 QI7s2HlhsOqd7X42FeauiQk55/9rLhFLRl71N9kNIt+L5Yxj6EjYLbmxcnxUjeTQnvg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794562783;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:To:Cc:References:
	 Content-Language:In-Reply-To:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=RdwNR1CXzI/uRHgCtwACRcQZpTWCrdmbO6yf2KLMkgg=;
	b=RJv73Hnn0bf2nLL0wJP5rsmTjfeSh77C7/oHY/Xumn4v3mIoDa+NivA2Jkz+7hDNNE/w
	 v7vUqStKLeWIWOz2LPT+29PVhmQGjdr07PHpOxfkr3rlgRz8WlpWPlA0On2M6LDMSjBrA
	 xcDwBkhevr21CB93q8FSEbKOOwI46jHr1MlfPRzwXndpsKv1A6CKI3uvTEplglDeMj4Lo
	 TYK4JDmo28aw9SurTeh4rOzhIugZ8Q3iByP6jz/5bMwi/dhj4bR50syQ4uUxv+axmUVtM
	 +Ua8Dj75yaLGuwS4wgWnoIP5Ge0BZWXjyFlDHWULMBSKRAw82GB+hKln3KdTjhsKkKQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794562783;
	bh=RdwNR1CXzI/uRHgCtwACRcQZpTWCrdmbO6yf2KLMkgg=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=n4yF5JwHks7p9aCTbmAoC7hcx73t2c1W9HXlNB0ZFhPaLl6fzUiMMUVSMV4XXODmC
	 UVBKXpdtmGGOPR+5ApBEsEhynLSbFCvZe+AL//Bx6QgwfoJcbIHqWFT9KRWVCZLaJM
	 F+7Azo8YdXGDj9VN3zgCC3FowXSNJhCfviuLQRweq21sG+Nxknb/78gVoRbWkNH0TA
	 4HJUDwCYhaDsy75zgfJ7qYcW25r3HuxP1AZr8tCNDim1uJO+HfI9TGxdiZqky6PPfA
	 cAeEHSkFUADqmYEjTg4JaH1JPde2kM00lkrEak7mzSu7oYqVe8SJWhlpu+IZpuxGPm
	 M7qvjH2H97B0w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5475340D83;
	Fri, 13 Nov 2026 09:39:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7D5601A6
 for <buildroot@buildroot.org>; Fri, 13 Nov 2026 09:39:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6481B40D83
 for <buildroot@buildroot.org>; Fri, 13 Nov 2026 09:39:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ilWQYjBYRzl5 for <buildroot@buildroot.org>;
 Fri, 13 Nov 2026 09:39:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 5224340D64
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5224340D64
 for <buildroot@buildroot.org>; Fri, 13 Nov 2026 09:39:38 +0000 (UTC)
Received: from [192.168.178.20] (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id E83FD2C84EBE;
 Fri, 13 Nov 2026 10:39:35 +0100 (CET)
Message-ID: <21a007cd-64c6-43c8-a29d-35a0994542c2@bubu1.eu>
Date: Fri, 13 Nov 2026 10:39:35 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Yegor Yefremov <yegorslists@googlemail.com>, buildroot@buildroot.org
Cc: Norbert Lange <nolange79@gmail.com>, Sen Hastings <sen@hastings.org>
References: <20261112173719.4063790-1-yegorslists@googlemail.com>
Content-Language: en-US
In-Reply-To: <20261112173719.4063790-1-yegorslists@googlemail.com>
Subject: Re: [Buildroot] [PATCH] package/systemd: fix build with libressl
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-12.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/12/26 18:37, Yegor Yefremov via buildroot wrote:
> Since systemd 258, the target build no longer passes -Dopenssl=, so
> meson auto-detects OpenSSL. systemd requires openssl >= 3.0.0, which
> the openssl.pc from LibreSSL (version 4.x) satisfies, so when libressl
> happens to be built before systemd, openssl support gets enabled and
> the build fails on OpenSSL 3 only headers:
> 
>    Run-time dependency openssl found: YES 4.3.4
>    ...
>    ../src/shared/crypto-util.h:39:12: fatal error: openssl/core_names.h: No such file or directory
> 
> Explicitly enable openssl support only when libopenssl is the selected
> provider and disable it otherwise, as is already done for the
> dns-over-tls option. As systemd-importd requires openssl support, make
> it select BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL like homed, repart and
> sysupdate already do.
> 
> This issue has been present since commit c38d7326e093 ("package/systemd:
> bump to 258.3"), which dropped -Dopenssl=enabled/disabled from the
> target configure options together with the gnutls support, and also
> switched importd from libgcrypt to openssl without forcing libopenssl.
> It therefore affects 2026.02 and later, including 2026.02.x.
> 
> Fixes:
> https://autobuild.buildroot.org/results/a37f44f3df16d4f49297b2a24bad20b0ad603ef1
> 
> Fixes: c38d7326e093f45252c01e241d0faf6b04023e02 ("package/systemd: bump to 258.3")
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> ---
Applied to master after slightly clarifying the systemd openssl 3 
dependency, thanks!
Marcus
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

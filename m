Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24D89CA5FF0
	for <buildroot@archiver.kernel.org>; Mon,  5 Oct 2026 16:48:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C475A405D6;
	Mon,  5 Oct 2026 16:48:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0v6MPs2vMowa; Mon,  5 Oct 2026 16:48:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org E55BC4057D
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791218924;
	b=jKyBm456rWyplFZKHZwpxU2FSIgoGEwFYECRMI6RYMuUV5WBdNvPkatPjqZiB0t9bsGZ
	 3ARxuyFVzLrc6Eu5I3lT+tmKoXtiwzsz+gptbgVSmXwmhac/kwwFOOFTyKEZy4GoG+MuH
	 fk6mpLs8yNuYOut2fApsA2JZ3BcqrPCTglme9qe0wTnFlC62iRJk72aMXVXTb3RcDI8gX
	 skc4479W8iK8yedscYTJLpo6XUIIV8eognfVV0DENxQOCnUHNz6gObw+vuhau3vVfyZfI
	 jEnbxf6GkaeAV+snOjkMKOobrSJolI2Qxk2/n+g+eMt+eYf3QnJKVaXF0Q2lxIL3UQg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791218924;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:To:
	 In-Reply-To:References:User-Agent:Date:Message-ID:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=s3icA7a9Q6iXvThiOOE5n3r4h3XK0sHT/vyAD2Lg3ig=;
	b=YXRA/YZd4GpV5/rNeihfYfRr3vk/Pmz+cnGbpnHmrAXkfvz+SBP5lVhX3pAi1etlQvNy
	 2KakVNfB+WxsblTsCxCxT2mMJByKDPVmKB8VIM5vWEyEKanvcxSBj/vLCb09bniLWSFh+
	 scj0C6+UR4vdRASqsLwdD1MoEMBYK8zmH8C4482Rvz1hU5TiDNvHI8+ffp4F7NjSdq66S
	 mZcQHKiWHzlxXR/VH0vAyloU1L/sQdKb0HE9tfWeCFhqFB0q0t9a66Dxu8uW6QcxWklx1
	 /3vPLiJizvUgi+RO6SFr7Ddd979FJkkricbuEIembW9Wzkwhw5xSkrY1APaAtce2Ycg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791218924;
	bh=s3icA7a9Q6iXvThiOOE5n3r4h3XK0sHT/vyAD2Lg3ig=;
	h=To:In-Reply-To:References:Date:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=BJ1+pI7q5Hm4VXEfyyQLfOssb7Aea9Texw+gCwHmdUKcL9rQJUr/wZ+GqyrzCwbyp
	 KB1FP25buUWimI3ijWPuaz2dbU1xccSy44SpqeB+sLYkDPZi9pREXupCRrZkXGt5mC
	 JC9zoR8/d8ZC2cFEADHqwAJ8DlDHfWSKeY/Q/3I9q/VV2py1AoqTM7wZjnaKCddbfg
	 gph9sRCx7NAh0li4mCEA+wtU15PaBb0Mystdzc6x7jeetmmakKGTfvuuSGjxn+t0y9
	 Uf9S/poM8qwlog15EdB5BWSzn4nvnU6wtPzK3HX9Kg6fEjp+qn7jCaOpuBlDaH80U6
	 8wADwaUmNEvUg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E55BC4057D;
	Mon,  5 Oct 2026 16:48:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id CDF4F1A6
 for <buildroot@buildroot.org>; Mon,  5 Oct 2026 16:33:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BF173406AB
 for <buildroot@buildroot.org>; Mon,  5 Oct 2026 16:33:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wPuYtT-Yr-Oa for <buildroot@buildroot.org>;
 Mon,  5 Oct 2026 16:33:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 35786406A7
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791218022;
 b=NO3+HQcp+caDFVhpuIP42mCY4xB3FtPZ/9BBmuS4dXjT340ypajvw/wAlEcT6dmCCpcr
 C/fQhFdnCmFGgjzg+ailwIiYDCa+K2AMLum+IAlGSbG8lCOj6IyLIehQM/NotwXZ5bSPw
 hhhziK1uJgpKGuP/2Zd/XMYMUvz3NG5aVwM+Lg2gnCFng+FOJFXRZ/TJeLyIH9g2pK7ac
 CdUSCsyfFznpoR2pIF8exlyRWzXBXPHcWqIVYx37zLYW524kbAUfpFMsPvDyzY7r0lU/7
 j3QUkla1ji9+001khPUmwYxRqAfjQcNy/bpnxXDFcGVLO+aqz7rBF6Hk7QKwy4zUL1g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791218022;
 h=Received-SPF:Received:DKIM-Signature:From:To:Cc:Subject:In-Reply-To:
 References:User-Agent:Date:Message-ID:MIME-Version:Content-Type;
 bh=KtMt46fwVVws3/rb7WTjclSB7xtU9DCy20xnTb0Kr5E=;
 b=Oc4iXq7y39bawcgSFvUKB7GlwdAony+PTFt1m/bMVOrHh3ePjKZCWke//IkgSGF8T6Qo
 NZex7qoJqN4JQUrV9gHCglrVyPlmSgTul4DAJeVX5lVHQYQyHZc0w9B5w86r7SquDKmUc
 skYSqGQ/F4iuSn4YOv0v3b1cuX/I84oy0+rnObH4D8L4mDSflti/7SD1fXxPoAPBBzJwL
 GUx3aksW1UMbHlEQiGwWopJ5EGWOvrSLZJ5W5zA6xuH9+dKtbA4WkYHQwqxoKRVFJuq3x
 fZcXLOQ5Y8kVi7LSiVA0tqr+efsCGZodxgfHPSBrFdO09q2ptVIqqDmLYZU6jZSAlnw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=tkos.co.il; 
 dkim=pass header.d=tkos.co.il header.i=@tkos.co.il header.a=rsa-sha256
 header.s=default header.b=sxIkt2uo; 
 arc=none smtp.remote-ip=84.110.109.230
Received-SPF: Permerror (mailfrom) identity=mailfrom; client-ip=84.110.109.230;
 helo=mail.tkos.co.il; envelope-from=baruch@tkos.co.il; receiver=<UNKNOWN> 
Received: from mail.tkos.co.il (unknown [84.110.109.230])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 35786406A7
 for <buildroot@buildroot.org>; Mon,  5 Oct 2026 16:33:41 +0000 (UTC)
Received: from localhost (unknown [10.0.8.2])
 by mail.tkos.co.il (Postfix) with ESMTP id BA5C3440774;
 Mon,  5 Oct 2026 19:32:37 +0300 (IDT)
To: Michael Nosthoff via buildroot <buildroot@buildroot.org>
In-Reply-To: <20261005092033.925097-2-buildroot@heine.tech> (Michael Nosthoff
 via buildroot's message of "Mon, 5 Oct 2026 11:20:32 +0200")
References: <20261005092033.925097-2-buildroot@heine.tech>
User-Agent: mu4e 1.14.2; emacs 30.2
Date: Mon, 05 Oct 2026 19:33:37 +0300
Message-ID: <87o6d83y5a.fsf@tarshish>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/libabseil-cpp: require wchar
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
From: Baruch Siach via buildroot <buildroot@buildroot.org>
Reply-To: Baruch Siach <baruch@tkos.co.il>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Michael,

On Mon, Oct 05 2026, Michael Nosthoff via buildroot wrote:
> absl::StrFormat() unconditionally includes <cwchar>. So a toolchain
> with wchar support is required.
>
> Fixes:
> https://autobuild.buildroot.org/results/948/948463b01ce52456179b06ae17d4ace9a823f92b//
>
> Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
> ---
>  package/libabseil-cpp/Config.in | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/package/libabseil-cpp/Config.in b/package/libabseil-cpp/Config.in
> index feb4963042..739e6d279e 100644
> --- a/package/libabseil-cpp/Config.in
> +++ b/package/libabseil-cpp/Config.in
> @@ -13,6 +13,7 @@ config BR2_PACKAGE_LIBABSEIL_CPP_ARCH_SUPPORTS
>  	default y if BR2_sh
>  	default y if BR2_sparc || BR2_sparc64
>  	default y if BR2_x86_64
> +	depends on BR2_USE_WCHAR

New dependencies must propagate to all reverse dependencies,
recursively.

Also, dependencies comment below needs update.

baruch

>  	depends on BR2_TOOLCHAIN_HAS_UCONTEXT
>  	# absl/base/internal/direct_mmap.h only implements DirectMmap()
>  	# with mmap2 for the o32 ABI on MIPS, and its 64-bit fallback

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B51E8606A31A
	for <buildroot@archiver.kernel.org>; Sun, 15 Nov 2026 09:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Q/7h568O
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5A2A081097;
	Sun, 15 Nov 2026 09:49:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7EzKHshK_5li; Sun, 15 Nov 2026 09:49:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org C32E480F0E
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794736146;
	b=Q5w36MCOa3u8aMMkKRI4LLKnBWrK6pbGeCtffMZWuq1EdZfwmp2RWJVCIzrbPJQstHPR
	 LUOeoo9cHffGFMoEr7pabg1Whe5056bl3/oAKzKbJjpaKm3GbU/7uvr96MKGSgW2uRR67
	 BxNkwz1k9jQ9u/icQexNpLnuk8BSbbGQyOVd1j+b2P2DkDOU6qf/VIt/k+20Kr0RNkH/w
	 UJ5IFnXeKFReVGGwlR4CIB6lQisJbINoc4G+nM9lj3ZDn0d/6hZ+YXLo8Kn5Sv93Xr6My
	 VyECCiiNWircRQBxamvH/Kjbd/cyDCRHUoPNnDePL3URua3G5pksxOPEM1+BM7J1ckw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794736146;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=dXHpjumU0VkVtnRS225sIN9vJsj/Zen8dSEdQWbX6ig=;
	b=lSObHAsCtoL/AssEbGkYehOrX6OQlskzTdCsuIzNXj28mD3Mzocz4ceeJqoWs+GbnR6M
	 wOr9QDsPtaK9qWvtm0uTGWRDogAWlkCR/JGbyXFwednwlpWPXdnpWyt2Xu2XQDW2q18L5
	 7PyInXN10Z/pwId/X236JL+s5Cc6CIK+ePAM1VJfB/E+5iIFhVRchXnhTJEerbxWIRVTy
	 BESLTWSIFgIfkmkhzDuX3ia6AhV6zAn1mozSgp/lWt+OWWg5QSeAGNX1ECLcgvB3z7UJH
	 Bj+iGFN8jA6iMEXAxKz+kYj/vQrqJ7ug61A9EOkw6QUeulxXmMqQh5Cq1OeVN0EOhhw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794736146;
	bh=dXHpjumU0VkVtnRS225sIN9vJsj/Zen8dSEdQWbX6ig=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Q/7h568O6bORjS0utzb5TNfMd4huK2kXjGAsGWXN9OfLv3UvuSyCG0b9Ez5YIFW4r
	 RS99NojcoRbuajPL7l1YPEmc71kbqJuAeWvSEBkV4FpEt81byW+4dok92zpOY/sjEW
	 jlxSirS49jkZ6I3SzgrRFn9A1YIG44ljM3jDY9Rnko4nOlnLu9FN0Bs2UwDnChqiv8
	 R+gKNVSxCS/XTMNO/TyXOg58VraEblwimhyalWbUNVP2Hj256mtLSgdlmHJ8xflfdu
	 +3IvAWgKg25D3gUFvO8jHF2q11cvjc4mLwki2tEoyUKvWSLdSI8GU4UUlhtp0j+39S
	 47hMo8KFwmP/A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C32E480F0E;
	Sun, 15 Nov 2026 09:49:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 95EF71A6
 for <buildroot@buildroot.org>; Sun, 15 Nov 2026 09:49:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7F821405F1
 for <buildroot@buildroot.org>; Sun, 15 Nov 2026 09:49:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ioXyFpTe8b8b for <buildroot@buildroot.org>;
 Sun, 15 Nov 2026 09:49:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org B44B6401F0
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B44B6401F0
 for <buildroot@buildroot.org>; Sun, 15 Nov 2026 09:49:01 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 2F8094E415DF
 for <buildroot@buildroot.org>; Sun, 15 Nov 2026 09:48:59 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id EECB860238;
 Sun, 15 Nov 2026 09:48:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 95F0911BC0029; Sun, 15 Nov 2026 10:48:55 +0100 (CET)
Date: Sun, 15 Nov 2026 10:48:54 +0100
To: Yegor Yefremov <yegorslists@googlemail.com>
Cc: buildroot@buildroot.org, Julien Olivain <ju.o@free.fr>
Message-ID: <avl_jpXx2ArJxs_D@windsurf>
References: <20261115065803.1426249-1-yegorslists@googlemail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261115065803.1426249-1-yegorslists@googlemail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH] package/musl: fix build for POWER10 and
 later
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
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sun, Nov 15, 2026 at 07:58:03AM +0100, Yegor Yefremov wrote:
> When targeting POWER10 or POWER11, gcc generates pc-relative code by
> default, and the resulting C functions do not preserve the TOC pointer.
> musl's powerpc64 assembly calls or tail-calls C functions assuming the
> TOC-based ABI (bl without a following nop in crt_arch.h, b __dlsym in
> dlsym.s, b __setjmp_toc in setjmp.s/sigsetjmp.s), so the linker cannot
> insert the needed TOC save/restore stubs and linking libc.so fails:
> 
>   dlstart.c:(.text+0x24): call to `_dlstart_c' lacks nop, can't restore toc; (toc save/adjust stub)
>   ld: final link failed: bad value
> 
> Build musl with -mno-pcrel for POWER10 and POWER11, so musl itself is
> built as TOC-based code. Applications can still be built with
> pc-relative code and link against it.
> 
> The issue has been reported upstream [1], as musl does not accept
> AI-assisted patches.
> 
> This issue has been present since commit 3523e1ac79c1
> ("arch/Config.in.powerpc: add Power10 CPU type"), which made it possible
> to build musl with -mcpu=power10 (and later power11, added by commit
> da1b45dd00fd ("arch/Config.in.powerpc: add Power11 CPU type")). It
> therefore affects 2026.08 and later, including 2026.08.x.
> 
> Fixes:
> https://autobuild.buildroot.org/results/1342da7c9258a93eada96f92f53a643e316ce7f6
> 
> [1] https://www.openwall.com/lists/musl/2026/11/15/2

Funnily enough, I had already reported the issue to upstream musl:

  https://www.openwall.com/lists/musl/2026/11/05/3

> Fixes: 3523e1ac79c15c5199a15589692e269191abd546 ("arch/Config.in.powerpc: add Power10 CPU type")
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>

Applied to master, thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

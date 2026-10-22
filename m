Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEF44606A31A
	for <buildroot@archiver.kernel.org>; Thu, 22 Oct 2026 21:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=j7OaTUe9
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CD78960883;
	Thu, 22 Oct 2026 21:45:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id snW5B2VSou7F; Thu, 22 Oct 2026 21:45:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org DAA56608AA
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792705555;
	b=n5FN8D70Lfc59WkoVsoVpsASzJO1EzgxMjlkl3hSJ+oHNN2zXpF1l86lDJqNsAi0+jhc
	 R4GL2s7qm3xxJGhr2j7R0snmhg7zoiErpkAG8oGsmzW9R4ql23OcWFraCEoy4IApgUIFn
	 GBk8fycH69Z0mKDUhHgXSsf5J4Bm9kombiyxhAEdHSzaQx1FSVBI9alAPzJdXBP4cgYU4
	 jsa45FFfEld7YtPWIdKZaufLW8gG1lsfIiEO24XBS+jibcGgclIQNVt/KnExfcM3zAlfm
	 PKZyr7sp6VlQuRWESIJ6PnEJLMbPA83r/Cu/QxCI0Ot6luwrj8A6nAUfg7b2sjxfgbg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792705555;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=SLep1dagN6i7ZjIloHzwkAgop6qeu3jNkvI+uPe/ORc=;
	b=XzLFr6RBTg4v2xTUzK6nDFDSTsbHcrwJ7ZQ5s5gM+RfDaVKU7681h63LzGca/VtwSTNA
	 SaHVwQDpO7z+PaDp2otE308HSOH1GRlrB3Yd/AiCrdF2EUS4IWtqTAncYKxccjQP/bYjP
	 OvZg4T0z1vfJcFVofaVoWtX+o4RpRQQ8dLtaqklWT3lGF5VYday4JhyG/CJ7npZC+0v0P
	 3ETfuxfiFaupQFNoVhRWk8NUTqa0H7NOzLUnoQApAoXUPJgmF8znj78U/LywEGMd33EwI
	 MvzdWwHKTN1tUIJ5GxggCSMZpX1IVd7jFXD31CglnDUp3vOTOUHqlx4Lc5BJM+9VfyA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792705554;
	bh=SLep1dagN6i7ZjIloHzwkAgop6qeu3jNkvI+uPe/ORc=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=j7OaTUe9M5TzlaivMm5VS2rzCDE/ewgbRyqd+tjxWNBot6o95/gBanHPGLh3GiNG4
	 DwC69ZCESwkmyRZxCuBFTvVrxC2CVbpgjgrdQ5jzqwmBojGHiIP88wsmpB3HL6+AK6
	 hUQv2Y9tL0OAwRIqG4YNNAIYny80QpL41n60RtdWT7ExFB+AAr2EVNTkhipNrwE4MB
	 bjEULOxQAbFEV9tGQNTUN9f+RsSCpVBVGfovhA7axHOnTiqtQip3gA9kDZNJNAgBWT
	 ZlvHVGh1WwMT5enk0wg/2IbHEpG+aVXqvLeQXqpdu40BOkFsM9CDPIYx6pmkiLbhJb
	 ojsz5J6YyMwZg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DAA56608AA;
	Thu, 22 Oct 2026 21:45:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id CB7433C1
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 21:45:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B1194608AA
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 21:45:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X-PAisZSaraf for <buildroot@buildroot.org>;
 Thu, 22 Oct 2026 21:45:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 2D91E60883
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792705552;
 b=O1dMRazBPedq65OTBL3sMl6RTRrCoWIr0OuiblusT+k0k/hgZasFkORnlOC1Rh1cH9FA
 39AS9pqmOx4nQIuQZudhHkf/1tqj+rSd4zc72ntVPcSMtncJIT7AFuKLeccjjBDqNAGxI
 xHbPwFprwoQGTpPLvjTjUNb3LjBiBg6Qs+49zipj+o3CF5wV2R24iqhU/gZS1ZL3woowT
 c7nWxMoGVbj34sJpHu3LdOTmkqReejLkWGPZqTLvr4lEhEMazZ1OIlyJTB62lhnKAnm/i
 0mySBc6SCEjccM14FRrH2SjFQ99yRxWbnieoR4+fIMpFRGi8XV0fYMebVRhxOmHwkew==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792705552;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=IvHtZTmP9U53FK1hyxvsnIqapiKdMnL1649pe8vDu9U=;
 b=rCp6uAY3Z8toj7bx2Jo/RdPtLl14HbMUNQE5BoMqkJSi8VYrSJSN+olia2JlmUGCzDkb
 EvmgREXznlewDBXIbShombeNzqepOBar6SWXeUqTLbINAELyrgd4aO3BM4/FiMRg1TR34
 QnJLcwSKzYTZiFP3TLIr8wka/dqppkR6SZMDmwORoMUWhXk9eG/I12VkuN/LwyaSQDm9Y
 NQmFED7QgjAy56KZt8CQA2H/qy1iZo96NHkVtUHrMgEFNDmRRLgTo4em7HhwSU8wOqIXi
 MYEhCZTPBWw9pX00cnpqLPB+fcxJJvx1hCLX8x+qRfBokjH3vtYek79RN20oq9O4F9Q==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=K9kMyWsY; 
 arc=none smtp.remote-ip=185.171.202.116
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2D91E60883
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 21:45:50 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 97318C51457
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 21:46:47 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id EBAAE60763;
 Thu, 22 Oct 2026 21:45:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id DDDD210328501; 
 Thu, 22 Oct 2026 23:45:42 +0200 (CEST)
Date: Thu, 22 Oct 2026 23:45:41 +0200
To: Yegor Yefremov <yegorslists@googlemail.com>
Cc: buildroot@buildroot.org
Message-ID: <atqD_rfy-x1S0X7A@windsurf>
References: <20261008075224.3992252-1-yegorslists@googlemail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261008075224.3992252-1-yegorslists@googlemail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH] package/zlog: bump to version 1.2.20 and
 switch to the CMake build
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
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Oct 08, 2026 at 09:52:24AM +0200, Yegor Yefremov via buildroot wrote:
> zlog ships two build systems: the hand written makefiles used so far and
> a CMake one, which 1.2.19 reworked. Switch to the latter and use the
> cmake-package infrastructure, because the CMake build not only installs
> zlog.pc like the makefiles do, but also the CMake package files
> (zlogConfig.cmake and friends), so that dependent packages can use
> find_package(zlog) and the zlog::zlog imported target.
> 
> Dropping the custom build and install commands also restores the ability
> to build zlog in parallel, as the makefile build had to be serialized
> with MAKE1.
> 
> An out of source build is needed, as zlog rejects an in source one since
> 1.2.19: CMake would generate its own makefiles over the hand written
> ones that are part of the source tree.
> 
> -DZLOG_WERROR=OFF disables the -Werror upstream turns on by default,
> following the usual Buildroot practice of not letting a new compiler
> warning break the build.
> 
> zlog uses C11 atomics since 1.2.19, and 1.2.20 adds 64-bit ones, which
> need libatomic on e.g. ARMv5:
> 
>   libzlog.so.1.2.20: undefined reference to `__atomic_store_8'
> 
> So depend on BR2_TOOLCHAIN_HAS_ATOMIC and link the library against
> libatomic when the toolchain provides it.
> 
> The CMake build installs the same set of files as the makefile build did
> (zlog.h, zlog-chk-conf, libzlog.so.1.2.20 and libzlog.a) plus zlog.pc
> and the CMake package files. The soname is libzlog.so.1.2 with either
> build system.
> 
> Changelog: https://github.com/HardySimpson/zlog/blob/1.2.20/Changelog
> 
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>

Applied to master, thanks!

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

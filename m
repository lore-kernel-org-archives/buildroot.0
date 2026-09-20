Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B27BC982D8
	for <buildroot@archiver.kernel.org>; Sun, 20 Sep 2026 13:45:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5AA1F40CDE;
	Sun, 20 Sep 2026 13:45:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bq16PIa75vZa; Sun, 20 Sep 2026 13:45:23 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 75FB140D04
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789911923;
	b=nDT259wgxreOcTdOg8MbSjVMnIG6qRIqkJVelZu0EqBS7cG2fxL0dlXN64TCFlbOAiQy
	 nlUYftjO3TmFG1PbTreqlwitFBcpBZA52ErBLae/md3z7Udzoe4KXxv5ZDhiM1EySWgoX
	 joZCIv/v/+IeznjcI1V7+Oj8Q7HO+i0F7tiBbaafDSWK+7acwRpaJXpU/pqb9/AePy/74
	 0d+lM3eFg0F9G8yugDWNAKdEgHenDSzvaBoQsXLT/3xenc1d2bsmadNoItDmoLdQL0gv/
	 dTkq990Rb22KGVT/8sb4JVA0cW6W/sTBAIeKvrdHz7we++tPM12PL0c4YDhR1HrUDeg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789911923;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=B6UXbch5R4PO/vx5shegTQfXjts9OD4/QJ6QZKcqlAg=;
	b=mVj/2gkqY91nbXCsnGuB7pJCjTpOzWPQa+nFDJl2S8rV+/Yey4F1Ew0jxPQB/REYdxh0
	 6ElLB/pLoKNbMDDXNrtUPCMOvIN3pC2DVT41EciP1c0PrSJ/lo2COW5Z7zkJSvuEPU99Q
	 mlkqNSzcR1J7BDktOxHxcL4SYOuHe9aCuxQHKYcVSg63ztrTBC0pVXJ4YTZKMHvA4A7jk
	 Yt5ylAXLNQqQRPZz+mmzNDhz3yTgPTF8VSxgqCi9PYXkNzBaeVbdSM0ewHJpT8h+paOdi
	 AcjXy8wnoqtT1alUIe3nEAZaTInf8x3TO7yW3UPkReRo0wBcCppX0ncFdy+ElAEdQRQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789911923;
	bh=B6UXbch5R4PO/vx5shegTQfXjts9OD4/QJ6QZKcqlAg=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=KuoJEXnsGE72TgcngVcWqRIcutCvPgXM/YponLOXo8aPzKQATqY6XZrZ8G8+TkOpV
	 pwYhd+Yx9QP6VUzHlNB5IBDzXxvVuxOwq7O6Y8rhCDVNCNN7NL6hWwGpzxt2P2194f
	 Q/fesxyNuYpfE7ojQoEgs4TlXCXb0MnaNTXPHaAoS6wJ+NkJL5Z1kBTpuefm+he8II
	 s2EZR9NWB+b7VSshHC6u3NTBBWjJElWGdbt14ijgpA2fjbsINhbIYSZvSTCi1fALx7
	 AMsZNniFzZvCb336oRe7hcD7ydcroCDtCl8lyrBzNQmKvFLfCtxo2XHgbEvt6kzjqD
	 yy1BiJQfNENsA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 75FB140D04;
	Sun, 20 Sep 2026 13:45:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 35EA83AF
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 13:45:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1B46580F35
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 13:45:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 69mu7FOG7-5n for <buildroot@buildroot.org>;
 Sun, 20 Sep 2026 13:45:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 44A4F80F31
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789911920;
 b=LoBhsRZF5K3T2480aTuSncFtDajP099481oma5NifDsMwzAgFXOlNfWRZ0aoeim3lcsA
 OR68imTeuew7MUVYxleNGj4CIANymoVAablx3T7Av9o7nhNEJgSejrlMDnw9u7sE5ipQT
 thQHu3L9FXMRjHxKPOPXTYDtOfVAvXLOdHprodmSOhOkNChT4VxTxJdJOtUh1iQZTK9hH
 Btd5dQgYTxAMj+mPveuL0PCG5nAdXcVBy+YBqv6Mnu6PSMTSwHJ5Ag54ZSPBoDa0HOA4c
 9cvm9EJbwQGUvOn35F82PZ5vTfjFSPj4PNgeO2WFB0VfX8nVcpS7X3yS3gkae7dPAmA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789911920;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=zH6cXyXUjst10IFO3Bixx3LiPWTZoYQ+bt0/iHXR2Ro=;
 b=j8jkIrvwgoTQAk+TfugyRJ8alSIRyaKeLiWry3r8dCUwtciAuobMc8ukFF2IT9FJNr73
 pUQy6gcJ9DB5blWISc/VO/AYdYCj08pw7GH3kRsK5qMkpEdCovuN4tgO02o6d6usG7XyU
 u0xR1QH2sv4z1PZmd181Itc6DAqcWAhmMRYq9dv4G2WR7M3VMRknTPTNctyBcrxEw+JqN
 QH5smsxIFTJP0ZGlHT2G5+q0DiCbIFFZJblE9qQJh0GOQm8Y5HPDjWO9kVhRUt426Ohc3
 fOV4wiv5w3PovLQj2dQyueuYfCeDeUI2zECDiB49zc5zzgsP+15oo6ZQLYvyN1aowHQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=bluoQzlB; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 44A4F80F31
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 13:45:19 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id AF5704E40922;
 Sun, 20 Sep 2026 13:45:17 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 7D4066033F;
 Sun, 20 Sep 2026 13:45:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 211651032906C; 
 Sun, 20 Sep 2026 15:45:15 +0200 (CEST)
Date: Sun, 20 Sep 2026 15:45:15 +0200
To: Yegor Yefremov <yegorslists@googlemail.com>
Cc: buildroot@buildroot.org, Pierre-Jean Texier <texier.pj2@gmail.com>
Message-ID: <aq_jZkrdAW8uhOCa@windsurf>
References: <20260917125242.1307618-1-yegorslists@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260917125242.1307618-1-yegorslists@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH v2] package/stunnel: fix build on ARM Thumb-1
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, Sep 17, 2026 at 02:52:42PM +0200, Yegor Yefremov via buildroot wrote:
> From: Yegor Yefremov <yegorslists@googlemail.com>
> 
> stunnel's configure unconditionally probes -fstack-clash-protection
> using AX_APPEND_COMPILE_FLAGS. The probe compiles a trivial conftest.c,
> which succeeds, so the flag ends up in CFLAGS. However, on ARM Thumb-1
> gcc implements stack clash protection through -fstack-check=specific,
> which it refuses for any real function body, so every source file fails
> to build:
> 
>   stunnel.c:1003:1: sorry, unimplemented: '-fstack-check=specific' for Thumb-1
> 
> Force the corresponding autoconf cache variable to "no" on Thumb-1, in
> the same way cmocka already works around this gcc limitation, and
> consistently with the existing -fstack-protector-strong override.
> 
> Fixes:
> https://autobuild.buildroot.org/results/3d691184ba83ba4d881632f2b2bb4da5aa50f491/
> 
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> Assisted-by: Claude:claude-opus-5

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

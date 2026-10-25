Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACDE5606A31A
	for <buildroot@archiver.kernel.org>; Sun, 25 Oct 2026 20:49:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=CHyb1lxM
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8430280DB1;
	Sun, 25 Oct 2026 20:49:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6Xxp5fZ-PkqP; Sun, 25 Oct 2026 20:49:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 9192380DB2
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792961353;
	b=PvGfyMQcy0j9dhgStnjfEecHfMXrzMFRAog1k2wKsz5i9m20VXt24hSfP+vQyW0xQbG9
	 XGECah7LF7IcPFTmDt3LCjTiDI6pyGe7f0b8pg5BeflANsApRGnjsfxaSdl1T7Gu4kAr7
	 i8kPaqqZlGfQirKBOxKozL11N7BZN5kko+XxefIDMPRKthLEE3Pat9klDtK4X9vqt0z0L
	 f9k8YFusHat62jX4Q62ietZ4AaCwDweR7PmEPDHF41+a3loVJhaaDc3XKX5siioukLgap
	 L2/tQknffI27YNaLDT+gqAQvMXS2nvzzDCo2QLts3p41mzE5P3FKPF5gWH5DOKd87uw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792961353;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=KiLc0BtGeD6uFnRaPXesJHlBZJIKJ5QTusGAARSm6+s=;
	b=bj/GR8HzJ/vvxDSBTm53GZgK0AvRP6oHfRl2OdbPd+M2CE6+XpzjkHzhqltC5P2gkC8b
	 fG/n2PoSnTcLaxYv91x4+WOHjkh2037WzPRK50xXh1U0VnwWf/C/bIF26UAy2DDnZWSds
	 Uh77t/ngw7+gvdn/9JQr5NNcGoOSlydgEKoPOFuIjL84HAHx/Q0rjqSv4sdODNX92unni
	 g5BXs6fKTMee26fZihkhhK3QrNDXQ5UqHsYkjpGYOyxVA6X2Gf5BlbbSg1MZIuGK5fqC/
	 d3KkFIIu9AUAgwl2Yu4fTgwUReHlFjTHLDNjixbzi5/3G8B2LPRWQooELmMwB3wG8pQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792961353;
	bh=KiLc0BtGeD6uFnRaPXesJHlBZJIKJ5QTusGAARSm6+s=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=CHyb1lxMqBhzu+vMuI+tuzPnQW8qOniPsCjVZCLKV8xEtfSgKlrGeW8LQWbpEbdD7
	 n9eF+f4S+E5vbQCEgJmHW07FBWF9W9sD18pk2z0QOCCFDuBRVKTK2pfi7f1QAoHpG/
	 psm21qVE2fYgn1dCM0G1Rn4VsazGBF6pY9TuFVsDrJ404qlnH+hztBwkOn8CwOFk3X
	 U7yczQ2l+q6N5ahkCrFkgECfdoUcpmcmTbT2Vtes88Mups64LlmmImDc4adRgw7n8m
	 /H4HEmuf0ShZFz8S6PRv/FroKFJTzXrwZOm2bFLlNcJQNK3nwC9hJl85gPwsrxa/42
	 k8c3XD0tJp3oQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9192380DB2;
	Sun, 25 Oct 2026 20:49:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 49FF2356
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 20:49:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EA09880C0C
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 20:49:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GvvDWQps0pF5 for <buildroot@buildroot.org>;
 Sun, 25 Oct 2026 20:49:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org ABC0680BE9
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792961350;
 b=LDURdeA76WjiTrow6Jd0Myngj9O1c81LPXDP5w1wlUA36E0rI+smO5oDIEKkKtGf+Zvp
 dryNpi2VPtCm1dpbYSOOyEE2pBRmCHoaHa2eDArz0TaZlW5HQtmaNczNb9QUGoiALns51
 UXPjdfWni6nc3dRSGwWrSdq4/7i955uaTDbRjjSBDyMWkFLfh/XiATW6MBeBmBzZFrCG/
 CQl2OemINkmFr3mFb8EHbI26a/0yrMzGSZDe+T4/LSh755jPXgnPx790bp09Axu+YbeZv
 lrAE56dwKYfNHVuSdTFuzhbx6BG8AnZ2UlM4+zEpe70LyJ0w/78U9u8ByqCl4WEtONA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792961350;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=9sNngr9chTtegcTPZBVUPes+/TEMIkRv//C1P26h7Rk=;
 b=H4w0SjWVjsHTjDYGM9w8H6NB4+hLoE1+9rfi9MQOVKodQuomm074z1SGdodIU7AWseOo
 NiO14ZaEFW+Gxb3Q3sJuM6aBczCwpkAFNCsRzXxTOeXlwftxGUIGijKn61Q4qxUjEOtWA
 32EXAiD1BA4dIuxKUxwOLIPhhaSYx5T3YTcT+LqB0w0QOVzuI8TJxfobeXSPbcT2witRj
 hN6KeEmf365ichS3icLdGfyhZi4I7G4a/K1DYST6E+qY7e8e4slW5N1P4Vww4nIkGkTTF
 HdXDjSMkD/+gmtChnI4ZL7Up8cYtnTVm+m/YxtNTH7uzFXaMfbHwt18C9GF3kPBT0KQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=cXCj9KuD; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id ABC0680BE9
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 20:49:08 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 408294E41308
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 20:49:06 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 026C260740;
 Sun, 25 Oct 2026 20:49:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id ACAA11032902C; Sun, 25 Oct 2026 21:49:04 +0100 (CET)
Date: Sun, 25 Oct 2026 21:49:03 +0100
To: Yegor Yefremov <yegorslists@googlemail.com>
Cc: buildroot@buildroot.org, 
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>
Message-ID: <at5rOEEPBPmmYSjV@windsurf>
References: <20261024215009.1004860-1-yegorslists@googlemail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261024215009.1004860-1-yegorslists@googlemail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/2] toolchain: introduce
 BR2_TOOLCHAIN_HAS_GCC_BUG_104820
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
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,WEIRD_PORT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sat, Oct 24, 2026 at 11:50:08PM +0200, Yegor Yefremov wrote:
> -fzero-call-used-regs is broken on MIPS before R6, which still has the
> hi/lo registers: gcc either rejects -fzero-call-used-regs=used for
> functions using them:
> 
>   sorry, unimplemented: argument 'used' is not supported for '-fzero-call-used-regs' on this target
> 
> or, depending on the code, the ABI and the optimization level, ICEs:
> 
>   during RTL pass: zero_call_used_regs
>   channels.c:437:1: internal compiler error: in int_mode_for_mode, at stor-layout.cc:408
> 
> This has been reported upstream, and is still present in gcc 15.3.0:
> https://gcc.gnu.org/bugzilla/show_bug.cgi?id=104820
> https://gcc.gnu.org/bugzilla/show_bug.cgi?id=104817
> 
> MIPS R6 doesn't have hi/lo and is not affected.
> 
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>

Series applied to master, thanks!

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

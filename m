Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B3CB606A31A
	for <buildroot@archiver.kernel.org>; Wed, 21 Oct 2026 18:47:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=aznsOcsG
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 375444190A;
	Wed, 21 Oct 2026 18:47:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OS7OtHomrw2D; Wed, 21 Oct 2026 18:47:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 6B00A4F8A8
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792608387;
	b=JMr/yycO+8Iuj/CxmMmJJBuOiWpyvSDh4GRGWZY42TH3tqxA90sMgO20kqsu8GC7YMs8
	 w/OkHLbWeLjkwB+jggCvUOwxcqJdklxZ3PHSqInUVm++nVCFSm7890hQ4W6c1KxG6UIwR
	 NPlZh3sQ80a4ok8wSudqkjPFSoQj5HalWTWKy89bvu+DTjJ/PoEyMTUYlpYIsWwv/n199
	 030qEeRgbZtV1eWEuY21OJIgYU3w8J2++T7KNd6tDNm2Bjx/y69nipBcZQ7DTYLbVfFKb
	 Skqq5wDuXmA9wH18WmnyZdvw13umK2zEu1E2pGdtDruKtB4RupWqsTtLVNmBcBzX//w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792608387;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=LUBQYH/eJAyuTC64lMBhGZRUaAU0QdNSAeVwi9HYgsQ=;
	b=Ktc2ncRsZBan5q5nSCdWBggSdo3NjqsLTv0oGxhIhOW7DlTNtj4wQFtiEuPzDgNujXn+
	 cMa+J2qUosglABC4obrCIVJVHKD/MPC6UmK4Si/QIrPiT4qCJbfqRiYTAJorSmroUzxn4
	 mcsPvVJ4Kavm9WaN0mIljfoGaWhOCOiJq/aYpgb88buLD6/TQlVkJFUfWkxSxQNx8mgHJ
	 MmvoxLnUYrniw9/woSPAivC8LbYLmb9oECvIZoRJZQ08pBVlaoLnBCzocg/UJGCPcZ9Fy
	 nG7l7p7oBaLJeOKAVryWYZGA72fsMaTQmimgdnqY4otBEYaBAxvLhJw/sBAwJzf2pmQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792608387;
	bh=LUBQYH/eJAyuTC64lMBhGZRUaAU0QdNSAeVwi9HYgsQ=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=aznsOcsGfTOU6SV6r6FcsWZ4hP6H842XCRDorLyGXArbNTgKUcKd05JFbjo56rdT4
	 d4gZKcBiaIrQf7MAt6XFxsVTgWiMq7L1tqYi1WElyg4ewa51nk+7RM6bPxALJJUUWC
	 RSmH9VCPLgA5QCGD3X478RP29zyrPwyKyijbO+EGqtP4XxIF9JI1CMASkc0K1jTh5p
	 IwIroCR690kT8v95g0Q7zvROLUxFaSdTtqsKdI+1KPKVfbwRoyr0aKZY31krfELP6f
	 56lDFRdDyLHL+vvv0MgA1R3D/y0x2958uNXumdt3NAuzFHG6NDzrj4uRXHV5+WMfxP
	 OhVFCtu++cd+A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6B00A4F8A8;
	Wed, 21 Oct 2026 18:46:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id AB8A195C
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 18:46:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9D03840474
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 18:46:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v6y5hABRPUKj for <buildroot@buildroot.org>;
 Wed, 21 Oct 2026 18:46:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 0DF7540403
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792608384;
 b=kj1P4sZMBMcbyZtUywEFFXL45WCikkz4as+v/LGIUAZrQRZ0xshixyFofYwZUoNEFCg1
 EqbtSDLikmaTqipjevIhnpeo+tO5M4BqbQ1kbMroE3A9cVSzzpHzKNwDabVo0m4z5GpIz
 h75hj/pLFBDkKwShYT4MPgBVlS2V5xiqSGj9Gi8/E5gRSwBgWLlNsNzMeVXHn/jw+eSF9
 vowZO/k0aBr5Arf806Pw3PocqQSIjqitHINQ1bs7+0GE/X96Z7fD57q/6VjjIcW7XWp8m
 6aHlLDPmLdjm4JNeeu+g2EBqlNQrSkxEw5dOGoej2P0Fen04BEUuxqpviZBJGJFAOiw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792608384;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=tlmL+DrK0i0QUPagxk4Z2yyhhp4QoBfSq2TMUQeVMww=;
 b=ks2LK4w3oP87AKWcXT6iuN6ZJZFjBUduwdEecwPfAuOpnPoxp75jucQzlelbs9Ll4s9w
 9S1jWElXI3xVKoqo+5BquiESsXysJ6h27ZweYA70EZlFkfzEhkitS62kW8ujHfZ/JtzVS
 CA9g/Pw+ypsdcxta5TtfepYj/+047P9kxmNIkxselIVzvQm3ZQ6o6gxOn2MVnfgIXJFOx
 a9fHJuvI5Y7qQ4ASNVgBV+hMFcrEVEXjpWzsD932xvc1UOG3UVsK2YxfFmd4NgQR1F8QQ
 K6OtSnjrZPjYcjQjY3W7iaaDKkW53TGVzShz11oDUfvEp4JyaK3cAtHSHw9S/QvMslw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=Im8sQSnT; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0DF7540403
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 18:46:23 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 9FA181A12B1
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 18:46:20 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 5DEDF606E3;
 Wed, 21 Oct 2026 18:46:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 80F58103289F5; 
 Wed, 21 Oct 2026 20:46:15 +0200 (CEST)
Date: Wed, 21 Oct 2026 20:46:14 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
Message-ID: <atkIH64LJ8KOg8sZ@windsurf>
References: <20261021184139.1135207-1-bernd@kuhls.net>
 <20261021184139.1135207-2-bernd@kuhls.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261021184139.1135207-2-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 2/3] package/xxhash: fix prefix in
 libxxhash.pc
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
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hello Bernd,

Wow, the timing is crazy, I sent the same patch at:

Date: Wed, 21 Oct 2026 20:35:32 +0200

Just a few minutes before you did!

On Wed, Oct 21, 2026 at 08:41:38PM +0200, Bernd Kuhls wrote:
> PREFIX defaults to /usr/local according to
> https://github.com/Cyan4973/xxHash/blob/v0.8.3/Makefile#L549
> 
> libxxhash.pc contains "prefix=/usr/local" without this patch causing a
> build error with libplacebo when xxhash was built before libplacebo:
> 
> Run-time dependency libxxhash found: YES 0.8.3
> Configuring config.h using configuration
> Configuring config_internal.h using configuration
> 
> ../output-1/build/libplacebo-v7.360.1/src/meson.build:247:6: ERROR:
>  Include dir
>  /home/thomas/autobuild/instance-0/output-1/host/i686-buildroot-linux-gnu/sysroot/usr/local/include
>  does not exist.
> 
> Fixes:
> https://autobuild.buildroot.net/results/344/344af8504a77ae96e4009d76a77572180cf49b14/
> 
> No changes were made in upstream libplacebo to src/meson.build since its
> addition with commit 006aab8d64d2179d77df9a696b3fd8636f541640 so a
> backport to LTS branches should be considered.

libplacebo doesn't matter here, what matters is xxhash, placebo
failing is just one illustration of the libxxhash.pc issue. So the
research on since when the problem exists should have focused on
xxhash, not libplacebo.

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

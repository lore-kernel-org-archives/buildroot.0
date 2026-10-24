Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C695606A31B
	for <buildroot@archiver.kernel.org>; Sat, 24 Oct 2026 21:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=BGCPFsvY
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5F3794056C;
	Sat, 24 Oct 2026 21:23:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KUSJfeKeb3BK; Sat, 24 Oct 2026 21:23:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 7A24240582
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792877032;
	b=jSSTUmUwbk79zvYU1rSfwkjkxQHbumzqKs3dUrW5wFXUripJ9ARGmleUPGD6UE6y2RZ8
	 js7TFbQHK1Sq+yEHZK60+Tas5FzQAFJcfKR+5gDPw/bRBpI2QqC2carC8HyilWWE30+mB
	 qs71wp5JV2B9/2HwYwy679TRZzhFd5tYWVgh2iSmHE6KjYKDtr3utApARIbI2O6FXqvUs
	 j9oBGnzDBdGGFYpfhuBnP/55iQHmHmd/SJPZJ4IXc3q+jf4vWgq7X0ULOKpggUIbPlNEW
	 sGNK+RKuSS4u9BtL4B4KYaCkVXK+xufhlmCgjDSJNsWP9anFNCaohzmz4G78l8TI41w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792877032;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=e7mdBTmLiQ+Dlzh94KG/mdjX43LkCuKPMFPBVUK/NJ4=;
	b=E3cwiLaC5LIAmU9hJbnEOcK7erG1V+9e6hltIYJ0mcDHAMfRvWZekGnLsg+hwhAdh0pA
	 oCXncbhPCZwZdC4PotVLfq0C9hNF+8Kez9E4JOyuCBp7JWudGZTja5fdTUy8PdmsR/DMT
	 0mQqSduWxSiWsrXJpauhlujHUR2t56nRyfaZKdjvX/OrFinPzms7H8yt9c0gyBsWVlO4R
	 ojQ8eX2/B9P/Hzp7uV/MdiKEloOKOSYfl5Xa2feUn+ej6ZTw2vHzLUa2lpjNUQkrhWHxP
	 DQJrSSqGNV5yYUDRIeucCjeVFbWpv74+CfXhZxDQBzGx8boNR6fYk67DseAxGrL9FjQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792877032;
	bh=e7mdBTmLiQ+Dlzh94KG/mdjX43LkCuKPMFPBVUK/NJ4=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=BGCPFsvYumi0pXvh6SMvsbYb9zGiY148+EIH3k9CSFtjcx1iYNloZcaxa3pFi/gCF
	 fLLe2tvDE6ap7fxe1zV5zbWOkeQnsnJyusJoKQzoB5vWlz//YP8D0t69BMsxTGkRCN
	 B7mcRICLwtRdE0d2MR4vkcHUecTkAPiCVi5ohEpCe08G1SrZvH757GBsuRGLgQvTWz
	 fIqU3hMtqJlI3uIN2cytKUqbX6GGs3PnN4aN4wzJ07F+aUy9aj9wezuft0uOKLKyGL
	 BBkyK27OFKrnd/7a7f7PA6HONH5Wo0gnpZ9C1lQB+KPUR74lrBkfk3IVe9zEi+xjAB
	 3Pnzz0aXIXTGA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7A24240582;
	Sat, 24 Oct 2026 21:23:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 15DCC380
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 21:23:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F04A340079
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 21:23:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uec5mQgxHCz1 for <buildroot@buildroot.org>;
 Sat, 24 Oct 2026 21:23:49 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 95D224006B
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792877029;
 b=UVnxD0JLXpSM4amPHVX0KyKLw+05ab5lyuuQQbpwI3Lvd5YJZleyD8ORR6SxUlw579cY
 DpcAZFrHgIvG8crn3jv74GDeUtiAxTIMGy6kxe+owviZzhF1JNZ6yyvZzpRwSqvojQkQx
 dMzJadnQMhQjTOvSIGpg47ecImPLwesaAXNRzNhVkM/PXew0kv3ja2/NubRHVMmaG0yuO
 H6FqpygEQW5sPhGQX43LI5XJwjqeeIFxWrcH/wX7v8ztRDKNSwyb1h7LPlc1d0nkEjutt
 x4oNsBjIhDG1QG4IXUj6GoYVBUc/FbW9MgkTmOJmMhGxvgL4AQvF6OLsHYce4tAO6Ww==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792877029;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=xR0RUgi4FfouG8YPPyJeiRNNDYZsCxw37ymkQtMA4Pw=;
 b=F4ugA2Yz86twtvlPCFDwd2B2i3ZJWxZGfvS1eshFJv0mT41Ibyhv0qPz758Tvm59yBJx
 4tJFgivgT560X6W7E1dPgWVWT9wY/AhSgsRjbjeR0L6N4DyK5FLHBUMw7Pet0121WeR6Z
 qRsoCROJLMKl7zISE+EQar5reAXkDUxevDwKkoqy5B3swz2jZU+7HMRsvxTMGLSy34Bj4
 w1AW3AgvEJmjjejNEm3meUZlnw47feacpq4sB5tjrlsk17fAe7kT2wocN08C3ePexKHkL
 Y3ybymKEK/D2qOPfWWYp5kgvpGEjqqVmsQMPqZGdNpjhu8XxxbutpTYHGppkoFMNDuQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=CZuCeYwa; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 95D224006B
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 21:23:49 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id A304F1A1320
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 21:23:47 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 7190C60769;
 Sat, 24 Oct 2026 21:23:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id C374F10328DD2; 
 Sat, 24 Oct 2026 23:23:46 +0200 (CEST)
Date: Sat, 24 Oct 2026 23:23:46 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
Message-ID: <at0h3ttqRJA42dJC@windsurf>
References: <20261024210307.2815833-1-bernd@kuhls.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261024210307.2815833-1-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/1] package/rust-bindgen: bump version to
 0.73.2
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
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sat, Oct 24, 2026 at 11:03:07PM +0200, Bernd Kuhls wrote:
> https://github.com/rust-lang/rust-bindgen/releases/tag/v0.73.2
> https://github.com/rust-lang/rust-bindgen/compare/v0.72.1...v0.73.2
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

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

Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C7E9606A31A
	for <buildroot@archiver.kernel.org>; Sat, 24 Oct 2026 21:03:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=rL2NQ9uN
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 476FD6064D;
	Sat, 24 Oct 2026 21:03:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aa1QbQaLVdCp; Sat, 24 Oct 2026 21:03:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 2025460628
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792875784;
	b=WsR0eKg5Fe2q3NUaU30KTM7717BN27fiCREWgyc+cJKFoNaNRMn5St9GxGSj54g4fyru
	 igVQQra38kUfCxkxVSoZ08rcvMfvGaUp7JM19BrD2w0Lo1qhW/TiGn9WQVIb0HXa7zIOV
	 ELYIzBE/X0U50cq0Ecsz/oXCMKdDO12aRmMnxoqNY+Uknv2Ldq/KwQVmeAkCvfNEDFG4a
	 ctuOIlPkoP9TCU354jWMVSnoFrsnPdhM0FC1PA66zBRRRE4F92BbZFQs26fT7CUMZ8ZOb
	 W03A7vOvvMpF6xXv52lbvtwDSyabPoywUBbAQnE2QQec5kLe8BeM/w+u2b7xtRys1BQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792875784;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=I2t29tUfZxPldBYytwZSO0meJvtV/Kzk/wRlx0JOm4c=;
	b=esGy53G/QssZOAk/+NancBCg/XX9AUMk0hNCAQIdd5mM/AxBRcU2ir3vICVK0flxe7o/
	 HdAl2AxCEuPwjHmdU/m6RnslVx6lPJya6bdjtG6uIEmbxqWzUbnPMfw8OZ8UAEb81Vp+p
	 hMurX0PFq2UZGT52X5lEx/TAo0ulM91v6TJYMN5NEuOkLCOgfviFHCFuhliCQt/gePkGb
	 0xUv32O37dUMv26l+7kdNlxZdyNW4xk04h/Li4iLir5Npf0qOQp5TlenSVwmLy9Rzr0bq
	 CnyTMbBJcrauop3YcenjDE5atsK1CwpbTXPyGOb2/BOxZcXKh2+clFQ1E6SCntkFLng==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792875784;
	bh=I2t29tUfZxPldBYytwZSO0meJvtV/Kzk/wRlx0JOm4c=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=rL2NQ9uNsAXWKd0p83eXxWWtxprM/0MOiFK3pJKARyPTDx8MsBE+O2niwcfAq2g2m
	 GPkgdtDxsuwxbc1s+c/ydUyOEFAdHV5kaZ+HZhiCrrVwQjYvtYR72iOUCbSocdpiaS
	 ROM0rKzSkGZ57hgM3Npq4oGlo/Kwy8WVDENvgoOQ5+cXFET4VNk2vpuq6HwenozMGo
	 tB+s1etBt8CPceeBSQMPLRuS/TfhBrBKmQl5QpSSsCI8zFzLYuxqViv8MasTuqAQ6x
	 17Fj186Yv9sb6kWHFYVUPwOMpl3wuRQI3o/utvgQIXOv04eoae3i4eOl1Vfo1nmOF9
	 UPkKY9k9sqBbQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2025460628;
	Sat, 24 Oct 2026 21:03:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id BD1D3765
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 21:03:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AED82400B0
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 21:03:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pu04X8OooRIz for <buildroot@buildroot.org>;
 Sat, 24 Oct 2026 21:03:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 200BA400AF
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792875781;
 b=Wh7JdqmZH8RcExsYSpzK56Huq/7RwVtiknUe1HZM7j952+60S65i2q9V1krMlykdGZEe
 jGjMAJwEM+MfqdUDTlTQ5d7Jkxlb1IZyNx4y0iT5Vc58wak2s82KhQ6Uy7a1WD+Fup2KB
 /uGqJktFPSJICPsS7CTR+5b6ApYu2j7/vVNdKxGMuqNaA089XnONsYb5Emyynyun6bDla
 WIyVWrR9kQ/YAMtEfMNDNN1+pqbCtE595keIGx1I05hYEUxJMlhkpm5CSdJo182IZVD6j
 gSVO3xuORwxdn0RkZCwxY3rskP4OibkaHmv25D4rkrnPJkR1ogCwKMhMKJmr/IGzGJg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792875781;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=T5nlc/sEXlifFF4HasPHmPXuElJ5eVvqNQk77YN2D4Q=;
 b=WVH4JbJv/isQHJVhmZy8keJs42o96Clvx59FvUT8q7RoLmDt6hrZ+ZP4M7Bqwb4F9f1x
 7ERsoqRrVTsWpvTvWbPhzxSTYoto4xYbD3i1g/EjZatamkdPtpHczma+MG9HBn/Zp8ZPR
 5C89+H7kHhu5G940as62pSWvZPwHwjbT/4Pl4NMReZrtBsYu1rvrWYCdhtf+wvqmq1Rij
 fMO7y33RC63OY8Wsq8i+bTiJ774Thf7mssYDDSOs8qyOh+Vc/13WCJv9GL4dQ6F1K7KTL
 OfPWjU4Mg/zigP/+vads95yEjnm67QLmz9jCxYEJKEj5zBsj40s+X874X5ifW7FbDDA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=S8sj5DZc; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 200BA400AF
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 21:03:00 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 6723D1A131A
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 21:02:58 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 2253760769;
 Sat, 24 Oct 2026 21:02:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 105FF10329032; 
 Sat, 24 Oct 2026 23:02:56 +0200 (CEST)
Date: Sat, 24 Oct 2026 23:02:56 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
Message-ID: <at0c-TlnkFFlfoM5@windsurf>
References: <20261024200728.3386039-1-bernd@kuhls.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261024200728.3386039-1-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/2] package/intel-mediadriver: bump version
 to 26.4.1
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

On Sat, Oct 24, 2026 at 10:07:27PM +0200, Bernd Kuhls wrote:
> https://github.com/intel/media-driver/releases/tag/intel-media-26.4.1
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Both applied to master, thanks!

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

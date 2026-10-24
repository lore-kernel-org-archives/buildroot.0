Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EA3B606A31A
	for <buildroot@archiver.kernel.org>; Sat, 24 Oct 2026 21:05:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=sPbMOaNi
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E005B406EA;
	Sat, 24 Oct 2026 21:04:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zjaaB3izxsIp; Sat, 24 Oct 2026 21:04:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org A9E18406E5
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792875898;
	b=R8vWo2emg61AvkcJbFIjRiXZvHunbmye7xKBC/dXwUPaVBQEsu1178SCoWcU2G4yR3aw
	 Ne2x0xRpx4dvQYPuOJadtlpmq8SaAkuE/FNjaLPbWiORUn5pxaY8+5otzNxOHT7VVgH4L
	 qCfxGD6/8y2Sd3/SylqCbAu1BTbh/ahYxETXFC9hGrHA974L20BjajIj5x8YyCH7yt6Ew
	 gKDKeXipEJ/sFvJnvHV2XS0+ri00Ypqsb/bC8O7v0CdmpzXMeAvN3/fJBcDTpXHFjRHoG
	 3JtBZmJGojuTy8Hr9nzpS0Cr+b8ItDkdEQeP46OcAF0nkcoh5d/yX/6XZvuKg+gM8Zw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792875898;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=DwlaGjBOUTHOFqRqKzZriBfvHCcamP71TJqTz4JQYJI=;
	b=AQqqT4PM1Vw4J/XPFtaEZOzU/qqHfLP5ZzWO5qDiS7DxJF66mhz9PwHFA1oXMWQ+NBgV
	 yPjwkHqH/9LKVGEKwSrVPGVLEuGVPXkbF0UNhaE6IGkK5pWNzKSr+tTfgSBHn9zRvwG2L
	 F5OTO6sojAtaSvHCaq9JLIRXpodjsXE7z1vUYtGvqQMpwbOTmcgEQYznaqkwuWl1yNE6k
	 z0Qhcy+bw0XBROX2+yDbL51Ua3NmKkwPxEnMfziuGNGVh4J2YdPA0L/Jy0Xxsu7+yPrRE
	 fKJftHcwVO7ab+ctt0ll+4xZzXfvvV3JY3qvRm8737NaM7Dv8zREghDbfShBptVd0Rw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792875898;
	bh=DwlaGjBOUTHOFqRqKzZriBfvHCcamP71TJqTz4JQYJI=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=sPbMOaNi8/fjZedb1Iezxuj/Tg/MZJn7HZes+0DSiXZaw4sJc1E9CtUTfsMGBTEdM
	 LhqzovN8a+YyNYSwe2PdAQaouJgZtMec0YPbMHXpX+Q1uasQxbtiX5bIttbsemqIMM
	 BDslzwd8hXn6cCz76pLGiLehaSZvwMjZmoKSgreD9sr5+f6molUy3Ufud/GSGFiV/w
	 rPjBwoLxlOHfcUYxHDOIDl+WhowbYTbJxdculNReOuHCk+43bvUJdHV6n4F+Nx+qZq
	 u77ah7EtMwpIOdrkEaQ1b10vj5MEoillyduWcRJf3DxsF+Gslw63fdLpAY6NYZWgQA
	 g7tCOjFdaMQxQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A9E18406E5;
	Sat, 24 Oct 2026 21:04:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 155D92F5
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 21:04:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EE2E36062A
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 21:04:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GF1sZXKf9PTu for <buildroot@buildroot.org>;
 Sat, 24 Oct 2026 21:04:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 9F6CF60626
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792875895;
 b=m3kL1UaJPRLU+vOWUiTI+i10HuO+N3nJw9U86H8vB/TTVp4axNWlHj6QpNpI5fTi5JWe
 lN8AGQTsjEvBhDSgHmEI6GWeYR3FV5n2qz4jnPg1XarVWUJBinRBxpJxLYKGzWtm1binm
 7AbK+ClaMG41VSx1nhBiHsilyxAkEBLu0pi2CyLvM0z+5PiDBVQyyJ+1pighe1XeKT5lU
 v9OQQA5fDkGhaUJhgBaK5oMzybjS53JYsmkzWJ8WoOr8cCDyC2xt9DRQ2X/KJaJb2xxUQ
 DY1an47klynaQN6kjeQ7//Yq32TPTX7YqKlU1dMxLsgJiEO6yFE80kzLgrEvuqSU01w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792875895;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=QoXdWYBPpA008qNcCeWtOQWgL4KapSWo/k/byPJDvHo=;
 b=Iui/5m5JewVv9doqHjiOXMurISMIp2/1/uq/qaFWq+LZQP0GeA+mVJ7+9K+J14kJ9nPD
 Gzc8Qy880UmWe8xU7nQi7Toqwfg7eMuQgbilsiQioti311/Q7x8iwuHsinzv6sabXMYZc
 GoKymGym+ckW2YMXC++LslBd2iVV0P33lgNl6MbcWlcayV/hdfOjEXAklKsIzAM4mTMab
 aVAwGXw2Q2O49aMrmD7QNHFCXsauofeDgadQ+7xNGuR2oyTH9byxop4mFl9lWGfQZr6Tv
 emgf22lYzqodhNeyMM6iOHPi+1xh/A7GxLc0TCTrehTwGyxbaDA8NdgcDZ8uViVRRPQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=PItv1Fh5; 
 arc=none smtp.remote-ip=185.171.202.116
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9F6CF60626
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 21:04:55 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 73FC5C6344F;
 Sat, 24 Oct 2026 21:05:53 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 0ED2E60769;
 Sat, 24 Oct 2026 21:04:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 0319010328DD2; 
 Sat, 24 Oct 2026 23:04:51 +0200 (CEST)
Date: Sat, 24 Oct 2026 23:04:51 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
Message-ID: <at0dcDB6zStp_sG0@windsurf>
References: <20261024184247.3282648-1-bernd@kuhls.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261024184247.3282648-1-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/1] package/strace: bump version to 7.3
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

On Sat, Oct 24, 2026 at 08:42:46PM +0200, Bernd Kuhls wrote:
> https://github.com/strace/strace/releases/tag/v7.3
> 
> Removed patch which is included in this release:
> https://github.com/strace/strace/commit/ade09b7ac2dba43d7d9097a9c9cb8f6517393d9e
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

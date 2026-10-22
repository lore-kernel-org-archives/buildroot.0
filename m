Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16EFE606A31A
	for <buildroot@archiver.kernel.org>; Thu, 22 Oct 2026 20:58:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Q89YG1xn
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id ABF5F80D0B;
	Thu, 22 Oct 2026 20:58:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2pskr8tupB2H; Thu, 22 Oct 2026 20:58:50 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 2A70980C9A
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792702730;
	b=JoFr0vt3JoIoUlTs2CNFINNUp0uaZ9xoi4znibrG5qe11zquimQjcJWVG+E6URx/mSGf
	 Hzt8IY8MNX1iJd57VxcRCSHq7bdxUdo178w5m7kubTB86dB+rgH8GAfstrdFyhHymgHZH
	 ieM+LjD79LexCHvXvv7u39M4MMx+v9q9fkAox/RZ7AaP7WlIT7Vg3DcQbn/LJIJMrW8gh
	 ZxEz2Hj3q5gEABtpwE+dauyJGiWQoOi6mBeC4ClXy3Wfo4FnP0UydpIyXvO8kPezFp1Y4
	 STHFoZSWXTkGL7tx8kG5qQfT8vwowRKt7ED3zZPPW2hs7J9/fcl3sfneZpp5/oNz9Hw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792702730;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=VeHvIKuUtI05FYEyedM+sIAYkHAjnUCaFGifWF3efRc=;
	b=HCNxhlWy1bwxGpVCGxAOgS26d7kx3f4Y4z+lSbBzV6CXF3uu7JqAStAd1cqEr1lUbTGP
	 VxHL7J+wy9xWABSDNmzP7lA3bsLdPo/XFrtauJ0v3q5XuksFqnpApdHojiZ2j/l+MTkv6
	 HnpkbDW0/4rDk2gimu1NFLZv/v9SmBz6iP4akxoSYQA0SDC7vSEc/FggVyCtoOQieiJsY
	 kG5TcyOG2KglOfyXr0+2MuUuzZ9A0uat9UU9qnAf+OMS3x02IZyPr8oRGif+zLvyhBqkO
	 C9te+Vuw1QyvlQkydQm4ADr1i6fGMne+1hI1t4Y+HPVBcdBQOMAmQRX/gcKEdH/OBTw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792702730;
	bh=VeHvIKuUtI05FYEyedM+sIAYkHAjnUCaFGifWF3efRc=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Q89YG1xnAeQPDKCOdUvmZTP3OZ+6dSFYgRV4ejFwLARhZpSCRam3ymaDsLgGWr2Nc
	 WZF6cudubv7NO/QArORKt1izPiLjLOjmt91DW5ddZ0e8sLEYBEnSYkfkF36Tjz9H7C
	 wS7Oun9Yhm45Eh4QxOELpwyYaCQxGWRO68sIhekD8llLxBVq5d/rBripOcC/LhaBTR
	 4sVBC1nxBH/ScMEss40KtRuA1scGprQo1JuacN5x+b2Rwn/gmDKJkgvBhXZSoIh3UZ
	 tgJCcd9iPpQfOlbSVT1TZ4ZAH1CR8H/sDyFrLWPKs7xM4ZD3iqphcHzWmyB/XqUnxd
	 5CKVaBWvzr72w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2A70980C9A;
	Thu, 22 Oct 2026 20:58:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4B2C53A4
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 20:58:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3CF814062F
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 20:58:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Xf_aZ5zpaE1a for <buildroot@buildroot.org>;
 Thu, 22 Oct 2026 20:58:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org F3C2E405BB
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792702728;
 b=N4hpmNqnVxoTGnR8gU752jexsuf8hed6btBZ+OnZ6q0GhbIzZwAbUNioyQclwBcPq/EM
 OzFUxoJpO6tg02MquW0avZbeumF9clWY+W2Y6K1V1ZpFDUYa2Zw1ha7JR50HEKxZJqQsR
 sKbUp49/bEEHVlSHy7uCIWKYe5T6Lwmwt28nyi1WCWSdc5Az4CA289hk9tr6ECHdrdm4w
 otgLDKMTSlJZ9Gom3OlgUluXVSffjE82cu9H8UcGa7eng4UUc3IBKVx1EsBD2lkgzXImX
 kWD8LjkN/8OJX8dlLETY3eGj/c5X26bnHRJ5DuOE/DnN1YGi551UoFKowk2cq2ah7gA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792702728;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=Zoi00a5vBhqTxR+jgzaySdimLCeOTLZHi47kNpd/1lo=;
 b=P9FxPtpZir8GymYABmvDRl5wqb4hG+8CtcXNfKuz6GNg6KI2NZqIBXemcaaT6MSCd5iJ
 Lf8u8HBtkJ+9a3mh4JPz/4Ha83dIkNqGV2Uz1bTXqQfBH9mrq0Vgo7mudBmYSK/zFBK6B
 vD0w5NzpYJhftTkXXSbANvuOHjqTSZ3jErz8m7rWfRA8dOWf40uwuQ4tj7guwTK0cGkPK
 fwfWwGuQW1XXJpJZKzD33wBNoJ5Os9eh0xwjOEPLT051pUsv4a3IOxuGYtcI3klByC0gD
 Hsr75GRdyndqYFr25ztXo8WqMbbFWRD2gMnL6wwcRUtexbcRZ9bUeeRaEEnTjRxBMwA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=TFZyhaob; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F3C2E405BB
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 20:58:45 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 490F84E412BD
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 20:58:43 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 0B5C960763;
 Thu, 22 Oct 2026 20:58:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 94A2F10328DD0; 
 Thu, 22 Oct 2026 22:58:37 +0200 (CEST)
Date: Thu, 22 Oct 2026 22:58:36 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>
Message-ID: <atp4-cbVd9uL394P@windsurf>
References: <20261022202805.1466157-1-bernd@kuhls.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261022202805.1466157-1-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/1] package/python-certifi: bump version to
 2026.10.19
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

On Thu, Oct 22, 2026 at 10:28:05PM +0200, Bernd Kuhls wrote:
> https://github.com/certifi/python-certifi/compare/2026.10.18...2026.10.19
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

Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB8FD606A323
	for <buildroot@archiver.kernel.org>; Tue, 27 Oct 2026 16:27:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=EAEe7Fhs
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B91C180FBC;
	Tue, 27 Oct 2026 16:27:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iU6ZFmxtbRtG; Tue, 27 Oct 2026 16:27:34 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org E42F280F91
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793118454;
	b=NCX0f+mSknMFG4R2PF2bVWqJNjYSAXKqSYxO1Sd5r8rZrhIaRsRe8Uj0hckVE+Bx2FRz
	 Wn97XycFfQVNlWfveFob4tGJG0xrgJ3N+PAwoU50JZYZy3A6Wy7avphiWmFx16jQxvRLJ
	 7MjYk4uiRM4mp833unPqaQLviN2bXYpx5hAvAmkkT88OvO6xfAD37JoAFDfpjRO3vDj9p
	 /APsdCZcj47dUN0etTnhIlO0I2ed76sSyB6hibTIEwWcl+I4s5RXO1cUKrFbUygXmABzh
	 K8uwOsNQiTt/KpqsTGGMr1jFnujUbeeq7F8o9DlJZmScuySrtclNzWfZ0kv+5uuenNw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793118454;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=E9ymPigtkCoxJTOcKKtxS6BTg4xXu+x4yD8aNLs4oII=;
	b=ZtQYTvl1YaBRvq+UhV3SYWp5KiWGd3WiBtgVx3Mrsdn0XOO+XOuOZepVAmyElO9EbPzz
	 FvJgRX2zjGf+9aTA0mxGKM7qFyR1e1eemVwUkTgfQxak3lkMi74CRq1vvvPrjXR7o3zkn
	 T3ldI/ANiyCH6AxYhuqAvgoqJ+XeQ8yFvzDg7a/F0dOmyRaM8D/Mvj7h3nI+yvvD4Gr8X
	 6PEoG6NJhfvsomizXwDzOBrp3r2hqRjwgRrG72ZxjiXunB7LkzAxE9SAIogBhFSUa0AK0
	 rHth4JoFEroSIZWzYl3w8JGNte6r1oeIYEUvtZgUeJIgW/j2FRsYyHXw3SWEDnmO9og==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793118454;
	bh=E9ymPigtkCoxJTOcKKtxS6BTg4xXu+x4yD8aNLs4oII=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=EAEe7FhsDDx2mScH9Ey9+Oh3yQgCTM5UpwBkhlGlv9XJR5CDXZ0L5IOwv5QQVvuJc
	 MbBcx7A1ULdreaWaAKsQlAGFqdc0Jr5BPQCCcw7NpIZwEZr4iW04CuVwGdztBG8kGv
	 AjfFmAhYkZBru9paNsLKN+BQcUQ1SoMN36XS8IvSI6rLVf6TdwFnK8QE0PBEmyp4kO
	 05PvFKR8fAQUdm4XnG26J/lJwc31r2IaqG47zTApFFiZMZoGpTipvLDD3W13FNNkIx
	 ZoG2ciyR4LpzoKePDCjsMkzyldYr9+5NdHFXhcK1n8XtbAzamQpDhxPgP2/ZnhzlY1
	 J9W4MPnqd+ETA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E42F280F91;
	Tue, 27 Oct 2026 16:27:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 73E5F72
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 16:27:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 59C1580F91
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 16:27:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NvPW13gPzy8d for <buildroot@buildroot.org>;
 Tue, 27 Oct 2026 16:27:31 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 4492380F92
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793118451;
 b=R05pQUwZ2X88EAq9xiXF65JdRpaYsiw5uslep9A99vJKMzr74aR0wr0Tr36MfyB3vAgv
 4Z1U2zIFa5ICLSMHGuGVeoCrsJBqvJc/WH8WNrkH9Y8lpC6A2PUzi7ZpBRsfx2pxpin9F
 MLupxCa8oEYlrG7opWKIMb0l235bSEmCJ+mnnVwV2c3bm7+j2x4xUTCBOMPKLjQHDzA9S
 NuS9GyIciIfzv5GLQEVDF6mB9aMBhz6bJW98GRrppnZOsE4TYvRfcbFPETm6IFUoWvbNy
 dGCv1cWJ85k5KG6zqa8QqUuClyO5k75rLIGvI87rMlSBYgDGBcSOF+OGz6FMFwoPiEw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793118451;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=sh5asUemNtVVrC6fStChmEHcUszii+6TE14fyKTFIwc=;
 b=OS5FPklD8zMTN0hkd93A0XomBWTSh1lVjtvKdOYo6zNYnXsr0UVbfUWtF7C/8TH/PAmp
 rmvZ9jWQUk0FwvJB//XSXtI48T6tSJ1eLCVuhNXYajAmgPXmTcfTAbeJhCa7gSZzOieHB
 KHyMWCgZepT0jUEMTI+nfB+AWFUdP+38UiW73AoOuw4ufBJ2xo13tK5Nvb31gY7Ba4Ggh
 RqJeLtiJUPq5r+14BVhrOoGX6Bc1T+yieBbrTtRu9mRhYn7ugtZReJ6HjZz00jhuLaUrm
 kisd7gpYk04+cHVLa0J3eHq+w24ZpSX3YW0Ea0T59tFK8TODQ6iejbP6T7o9eYG0kYQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b="dJ+G/5Ef"; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4492380F92
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 16:27:29 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 9E0614E41349
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 16:27:27 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 62F3C603BD;
 Tue, 27 Oct 2026 16:27:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 3621F1032906B; Tue, 27 Oct 2026 17:27:22 +0100 (CET)
Date: Tue, 27 Oct 2026 17:27:20 +0100
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org
Message-ID: <auDQxqNkGAR3F3JJ@windsurf>
References: <20261027144159.1097876-1-dario.binacchi@amarulasolutions.com>
 <20261027144159.1097876-2-dario.binacchi@amarulasolutions.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261027144159.1097876-2-dario.binacchi@amarulasolutions.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 2/2] package/drogon: fix build with LibreSSL
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

On Tue, Oct 27, 2026 at 03:41:58PM +0100, Dario Binacchi wrote:
> The trantor library bundled in drogon 1.9.14 fails to build against
> LibreSSL, because it uses SSL_CTX_set_cert_cb(), which LibreSSL does
> not provide.
> 
> Add the patch submitted upstream, which disables that call when
> building against LibreSSL. The patch description explains the details.
> 
> Fixes:
>  - https://autobuild.buildroot.org/results/f1c7a336f3fabb2d2a2793930573b69bc47c3ee7
>  - https://autobuild.buildroot.org/results/795c9ab125a029f0d90a267147cb6d6d80887688
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

I am not super comfortable applying this one, I'd really like to see
upstream's feedback before applying. Of course, if another Buildroot
maintainer is comfortable with what the patch is doing, don't hesitate
to apply.

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

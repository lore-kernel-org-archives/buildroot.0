Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F6A3606A31A
	for <buildroot@archiver.kernel.org>; Sat, 24 Oct 2026 21:27:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=mMLvgz5r
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 55F5460619;
	Sat, 24 Oct 2026 21:27:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UNbUtStiwaPS; Sat, 24 Oct 2026 21:27:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 612BB6061C
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792877231;
	b=scojxXAh4mWRJqeZLqb+GoFadfHZiOexK7lPsU3m/lXNSL4TSwRiC5XTEhwfVxq8xkf8
	 adroNRG1N6pBbYZc21sNhguLf4lIrZtlpaYsdrA4eZY14ApmUDW+nvb6M5u9qoYsqNReW
	 61/6/hRZT0b8azIsl3HUFkn/6Es8I/LkdpJ75NUYeqSuSQXaGJ3vSP0lqjvbRct5Xl/8a
	 2VY/IbvVNbAuoWThxQnT4VtlZtdA5NYx4Ikef7Ge5OwQpPYxRLm0pqUbQflX3i0aF6p/I
	 BcjGV7hyoc9SP5K8+rTQLTVURdzv8v8nOPCPv+AbuJ2JJumolCX683CQOGxb1QFR2UQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792877231;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=oyuoWEHoYYQEafVQB0nJuxeoo+4vCIeDjprBQ2QkId8=;
	b=KzDMl2MpEy1ID7pNpjQzSh1eolz8F5gqam0vugr//F4yGpMrGgdarz4mHh2uEGa5h+He
	 isvJLXhpRMyUUydPE9AjLPl3Iq0PyTHTpCp/hHbesxu68YGj8RwIek57VSnVOV6OvK3fY
	 QDZDPSRBlENlmvQk5cdRPWh2tM5TINpLTvlj5i6bQIrDUqg52pwx9fB3BNfHILok1u3R3
	 7RHnNrKgONRyLZz2VafXpwPb7QN6WfVWyRrdYL0bqx89UTDZ6TsOEFw+B4OZ6KH0OhhtH
	 71bSSN1qY0F20HoXYk4D3WN671NL++iZsQKB0LJaMif6ZcwyALDtMVob82VOla0p8bQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792877231;
	bh=oyuoWEHoYYQEafVQB0nJuxeoo+4vCIeDjprBQ2QkId8=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=mMLvgz5rPR5w6/aX2/NoOih1udTKKtZ3+iRFBzTpyuKnMM3weqy4Mavfmwc58Q0ad
	 OUlSuXdUDACgnV3mTADMKstwcwBe6kNKkTX5swpUDO6MuRaJzXf2lRvd7i0r/M50Ri
	 jQSC8oY2HhgYflG0mbAGqVeC1t1YsbRGM601IkhtGPzhSiS1ynKrSHnrXHjQIpE06J
	 0B7vApZRglymjAZCrRNf+qoyXE9kRZv4kDlNjxK2iiMnDXtKf1vnw+ZEaZZee8WCYb
	 D1699CQ+Qz7tnaKO45O8UQxBOzE/807TOternW4Gqm4CZQkpput9tVSGOtL51tHdZV
	 DqRH+gJBlIgSw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 612BB6061C;
	Sat, 24 Oct 2026 21:27:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 00EAC43
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 21:27:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E71874006B
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 21:27:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kyVMhAsZsQmd for <buildroot@buildroot.org>;
 Sat, 24 Oct 2026 21:27:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org F35E040079
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792877229;
 b=Hgf/zrmitRNfGXB+8rAmLaKHZRtyAgpIBaL6YDUMHOsk/2CuTA9NTat8w7Y99wjxEf2F
 RNyCcK/dv6DAGCUsNuj3PMeN6zm8T8sPKlthHetngZZK87lkVmkuO7SmppQvXqC9BG4Ly
 MlTuLX6FcF1pKCiVEWqrYhqzkC1QD7872t0xYZ+sgGWAiREvnrIFGRz99qXUqSeu58Zf+
 RWH6wwJpHT1g8y7xRX+z+87rdqsIK1HjKNcMRhZUSv6+bW5lyHgY0SreQIgSdLZZwh4Al
 OXcsqR0+xTkR8JGIiMWZSmjLQ5YQJBm9G4CDV/ivXNAo4ODmOdZbWUMioHqQ7oLF+Lw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792877229;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=PYSKNgywqb3wbpdnydpW/rMKETeSYviZDdIl/AgDKm8=;
 b=qovc9CwmjhcgHX2BjngE7wJU2HTpunsM6phlBXvDn2RwBtEFmVVwtzH73A1g8aOl75Bj
 CcwFjhNsH/PPc2EAuOxQInNcCqYfIFDyQ7+C01jG5+G/WdGVPneJFCY1rqEdHigkNSplh
 wccAVGlIFmI9d/EcZgHR6eHl2JE14IizWCqvg80zumqrMz2ayljBfeuR5KyPZT3qpTBwu
 go/BsztoU9Fby23Py7Pc6CHeVWGGzaozHEByE4dWqy1Dg7f7fxHCkyLyKKlEGaZAYls7z
 MYelWW3b6W47qA0jmokYkL35UvzJLV3qOHD0KOzKk/ikigErOSSmTvXSHLO3FShxwIQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=mnGG8Eus; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F35E040079
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 21:27:08 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 04E421A1320
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 21:27:07 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id B925460769;
 Sat, 24 Oct 2026 21:27:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 50C7C10328DD2; 
 Sat, 24 Oct 2026 23:27:05 +0200 (CEST)
Date: Sat, 24 Oct 2026 23:27:04 +0200
To: Arnout Vandecappelle <arnout@rnout.be>
Cc: buildroot@buildroot.org, Julien Olivain <ju.o@free.fr>, 
 Thomas Perale <thomas.perale@mind.be>
Message-ID: <at0igCDR4XVy1Qs-@windsurf>
References: <c3ab76847e4dd0d716ea7cbaeeb5e8fa@free.fr>
 <20261024170830.543982-1-arnout@rnout.be>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261024170830.543982-1-arnout@rnout.be>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [RFC] Makefile: do defconfig with /dev/null instead
 of .defconfig
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
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sat, Oct 24, 2026 at 07:08:30PM +0200, Arnout Vandecappelle via buildroot wrote:
> For `make defconfig`, we use a .defconfig file. This is inherited from
> the kernel, which has a different defconfig for each architecture. The
> kernel defconfig passes ARCH on the command line rather than in Kconfig,
> and defaults are very different for different architectures. In
> Buildroot, we don't have that, instead we have a .defconfig file which
> only has the default architecture. And it's not actually a defconfig,
> it's a very old full .config where only the first part is kept.
> 
> Since we have architecture-independent defaults, and any architecture
> specific things are expressed with "depend on" and an occasional
> "default ... if ...", we don't need this infrastructure at all. We can
> simply make .defconfig an empty file - the BR2_arch choice has a default
> and that's all we need. And we don't even need an empty file, we have
> /dev/null to do that job.
> 
> Use /dev/null for the "defconfig" target if no DEFCONFIG is given.
> Remove the now unnecessary .defconfig.
> 
> Note that this also makes one hunk of
> support/kconfig/patches/01-kconfig-kernel-to-buildroot.patch redundant.
> Let's not do the effort of removing it now, we can remove it if it
> causes issues when updating the kconfig infrastructure.
> 
> Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>

Tested-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Acked-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

(Since this is RFC, I'm not applying right away, just voicing my
approval for this change.)

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

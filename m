Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D8F3606A31A
	for <buildroot@archiver.kernel.org>; Sat, 24 Oct 2026 21:23:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=pcZ3YI8d
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 891A76061F;
	Sat, 24 Oct 2026 21:23:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bfaC6w-K_BUp; Sat, 24 Oct 2026 21:23:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 2801760619
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792877026;
	b=F+v/mlkP/WlgRueV82/vqDK7kdvKglKPQnA1wdtqHLiX6FggODcZoO1b/Sg5gW1nMorW
	 LoJ1WQCcyMzDZhlzJErVQX5IIS1ee+PLViN1emufYc4MMRL6QgvJhaR3qbo+qu4sRiEq6
	 d4WMI6danC+CCSRMZS7ti6/ktBSmLBtbxy952cA+TOsEcmwIMd61VpmTySVb8VYH7UqpA
	 7Wb2OWmy+gGj8gdSEpKq11I5rOpof8eapAgXJysr7kn3L21PEmxDPwpsAl9AkuOC0Ixay
	 l5IgHMupdm+UvWgLf+2uslAVUJdh3qm6Cn9lqnxiyeU93haixUMj2fYgZEGGbsVapxA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792877026;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=OQ9wshYCIU0ZAUtDydkrBB/1dSSsr/VIXhtWdfXVd24=;
	b=DOqtOxa0MAhAg8TDEq0Qn9TSo76/HNHUJpfi1LBRg/aKPmq1GGarpg/uboGYae0/6BKR
	 wGstkUeqemoA9jvubQ9oYZVc1EgmSCB6gEHsH3o7lxaGWHozC8xbCSnqkjii0LpAXuAio
	 Y2ITO9coyp6Co8EbX0HiqpIUo2cU4jr8SJmrBioaaLgzqDTvpygE2h3MplMC+3efCiHy9
	 2aN8TJmzC9YnDyhChTUgiaO7zmLCQHPP6Emc2EvvAIqhZ7Hw0G0YB9068fDXVMT4f0flu
	 Hdu+jQiuxvDBfwK76s0oSI++Q+QlwpS8qL4spD9ORRBgzgAm3O6Su24fZw24Cwkcu3w==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792877026;
	bh=OQ9wshYCIU0ZAUtDydkrBB/1dSSsr/VIXhtWdfXVd24=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=pcZ3YI8dZmYK38afiXNB/h0uo61j6VSI/dcENbhdvQZ56NdRfCMVBznPgmMMCbEV3
	 dPNrcGReThn4H4GTFlUBgjXTYpRAAdUHTpZvjb+u8Iy6r1lQmgMwYXBRYzfNAxsJZ3
	 639sWyfVA/rCqhmFXjrguNq6p/Cy1l3NLgnthe/2dipb8cR8nrzbio15rcJLS8hssj
	 Ihkq/r/bvJ8UqU7t/g1vONAj+MwMT/I+vqRUOjIZKGR052zGX/j+rLq3gTuljc7FbQ
	 w3zBhYvnoJU4sJo7HQRAIHG3axqWTucHLKT0f1rp5iJiJbjS7PvpnZ5U/xz3wggIfQ
	 oXL8cl0B0QhiA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2801760619;
	Sat, 24 Oct 2026 21:23:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9713E2F5
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 21:23:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 946AB403B3
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 21:23:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cgMAy4BfcYUv for <buildroot@buildroot.org>;
 Sat, 24 Oct 2026 21:23:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 4D9304069F
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792877023;
 b=qBTeSV08jbo7m3XUDVjrSqBQT8lewnPnicxX2Q5tfks5uS8aT+P/jlgHDlzNaI00Slkj
 CD+0CfERrlCkskxbebT7PxnImyzIwAk2DYgVEH33SHKutDL4ngkIpabGX3DOajzFCC1Tr
 qiV3wfacedeytSJbxX43/gBjpJpuUCpsAuZqozhJPCvbq2XTWc/aJClnZrt8kaUXtSkK3
 oObvsCHaIkp3BwfBGIoSFKd1IhO1G5sVww7GoFekY5RfHl27UXFsdzlVbgPxrQX/UWb7C
 cPullxmEvlaGl67swoRCprf/6xqR5Q8IV5CeMLwSnTSRddF+ZLfEi8YhRWdX7Mv7akw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792877023;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=kq7KqPxDC8TIMG4BIZ7arpqw9+xCwbYFQvC2Z53tSPg=;
 b=YpykmZ2Dv4Z6nRu7VOLujnb3hZfMDPw5NqO0ACcPUX+mjD91XPUN9SbWH9F5AluVyrbZ
 JDcjtoeWwMye5Mx+Y7Ak3VXxMoaJcEr1sz+h3Dm5pWozU38gnk6SI2Aw1fSaWRVKxvDmS
 pLVWYxVPO7o/Y/1lx31kt9/fPutGwqnpbAee4eciz5O5F37qz96McB9Gsd8ZgT8muNeLn
 BS0hlqrenwCqXp9EzMN1S3SujJQfYZAHwZcc9/ov4VdvHi0Lzhju4Y4+8z7DHP4Y1s0Q8
 MIt0hhDebDDs+9PU1tCujGxZkMKS/+ybQ53wx2gyvfYFsQgYm0irRpZ1hYww3yVRZRQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=NhHCM78R; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4D9304069F
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 21:23:42 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id B35354E412ED
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 21:23:40 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 6BF3460769;
 Sat, 24 Oct 2026 21:23:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id A489E10328DD2; 
 Sat, 24 Oct 2026 23:23:38 +0200 (CEST)
Date: Sat, 24 Oct 2026 23:23:37 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Eric Le Bihan <eric.le.bihan.dev@free.fr>
Message-ID: <at0h1ffuPFumXZlR@windsurf>
References: <20261024210136.2815609-1-bernd@kuhls.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261024210136.2815609-1-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/1] package/{rust,
 rust-bin}: bump version to 1.99.1
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

On Sat, Oct 24, 2026 at 11:01:36PM +0200, Bernd Kuhls wrote:
> https://blog.rust-lang.org/2026/10/15/Rust-1.99.1/
> https://blog.rust-lang.org/2026/10/01/Rust-1.99.0/
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

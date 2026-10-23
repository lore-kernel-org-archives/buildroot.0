Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DB3C606A324
	for <buildroot@archiver.kernel.org>; Fri, 23 Oct 2026 07:29:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=l9bPh+nq
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 58D90811C9;
	Fri, 23 Oct 2026 07:29:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R7M-BAXmYror; Fri, 23 Oct 2026 07:29:31 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 778EC80F47
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792740571;
	b=PedmXpaZvE1kF+otnJgnfIjONMENon0R1EIJLW4hNrBgguq22AVNl0hy8App7GVEci5Z
	 y/E4bbYYP+iD+ZR4umfZcX/FJW/AABS9H9nk/3/kyEHpptKDINQtDPkVp0frdaStgGBqz
	 PcHZq2gbX4Bb/NLPD8trL2aSa4l38/pK3oc/iIrwb7anLDFHLB467zqGtC+kLg1jOBXpv
	 APB+jvNqizgWcDwKDm1QKiU2lzWpuRonnUKkqE+tOE/nuOJYCv55YPUlRC5iubxEo81VQ
	 VJ8wqbo2JrOT2Fft6UwImWFnG/8Mn31Yum2kMysdLyfxORuJZvmN2TV46zhNUBhbmoQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792740571;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=cWCAloqIyJVQcqqJHmKNyiSJ8MdLpFr0Jl4q6T/fSFM=;
	b=hy0KUE1j3JTekiRBayR8B+qwhkI4HeYTf3zEl9o3MVBcIl7NoBBV7WrM9wFbtFSt8F+Z
	 Y1qaPh9ma4g6ggPhgi5+Tr1Q2h83OB4FP3kQ202+/on0vZaY5pUbiVLeu/KpbA+0GFLQs
	 ojtNIUjVejdZkDnrz1kM6skfdxFuJ1P1Toh2BwU4gEw8rRwgnhNArp7F1ivQkpk9cHva2
	 2o4qiH8OYp9e6QhW9h/hAOVEN2dDAD8L/xvP5KwfIIO/UEcf6bvHEI5ybUg/4wVzLOoNx
	 OTvjUAldh+gdcw+qAnOhV6K5RanFvK3B5otIBWTGOrno6vNlzLq3je+jliLNbTujhvg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792740571;
	bh=cWCAloqIyJVQcqqJHmKNyiSJ8MdLpFr0Jl4q6T/fSFM=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=l9bPh+nqEGe++UVBTGLRZdgRcSGk3vmDMSLh/0ws58sLAhsf5aXMNnKPEF3Gt65o2
	 H4Xaz5oW+W1BdmS2vNzMSiRnN7xru6vmwyBMeVpiecbwnCebegOEF758vXCko/y+Gm
	 lmeq//BjEItoYSWGbdsTk8HkPIJbjx1ufiE4MfUyrsAw3UVaiR63gVKRIHHeXuHopR
	 /PUPF9y2vJogNpWaXCESdklWvCEd39dmmhxCXO1kXIDMSYjznOqwfIfqQ6ZJY6Qca8
	 QHBOnzd3D/P6F19osv9ITqRPBFT5JPlyAzP1zjxdJs37r3Efo2WINAIJBq9pHHPnRL
	 I/rWtyAhIvfnw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 778EC80F47;
	Fri, 23 Oct 2026 07:29:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 234C249D
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 07:29:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 092ED4008A
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 07:29:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sCGIaJVyAVTq for <buildroot@buildroot.org>;
 Fri, 23 Oct 2026 07:29:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 8BD264004A
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792740567;
 b=LvhgwQqNUYToZYtbo3E1kGGCxQeJ9OoHMQph2kdMV2Q4btS+I2A6mZMt55ZNqbPaB8Ey
 Ay9mQAW9WtqkjEzi45hp8DRxV/rN22AM7zUaIga5+Xv5qvbukiFFBo0kZj7OJ2mfV5yu9
 cEwnCyl31n4bb2RaEUjspwymrK0Dn+QCH/E0Ha4V56XZNskHITJkWuz/Ftsf9Gd9icpe7
 QmkAKuFqYGN+5BrRQhSrZIbdJ+b5wydpdHuepDCGuSBqjLYA4xaepqRW77d8M0eFAmE0t
 SBsrwSXKgfkoT1cF5+Iz+OSLsCjMPb6Fq610q8ZW5TNT9Q3HxfT1GGMCtNl5NmjzHCg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792740567;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=Jw3myej/n2Wu2ALtf4o1J3LwgUt1koG/6RFAiKyYTJ4=;
 b=UsxUP+5FNHegsvDI5891flcf5uID8+EzYkZ3kTcbT+o8Sn6GDfcP4/RU5OD/YvZdCUmo
 60V0F5N7C5c5QNC/ZVkeO/M22U6D04IjmBZGff2fus8uTIUR88ONo+rxRYs1mI255zsx5
 U6qdJxlYrFOSi1iXEsYMPLTHcd0MebDOCAcEicfZVmNbvi2v72nqa0J36xlQSW270mnmy
 WQOJulDqrx7oiNaZk5n2p7HtxToJXJSKL0qQI7/9eUA+kOFnoOrv1jcrpQHC5i+/9ltik
 Aj0xNODisDla8QVCqov3roviVayCq5i9K5IRxWpj0k4CTT1hAkQlqGwGEooJr3ZDQSw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=1uxvx9HY; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8BD264004A
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 07:29:27 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 676634E412CD;
 Fri, 23 Oct 2026 07:29:25 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 360D460398;
 Fri, 23 Oct 2026 07:29:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 5330210328F2E; 
 Fri, 23 Oct 2026 09:29:23 +0200 (CEST)
Date: Fri, 23 Oct 2026 09:29:22 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Daniel Lang <dalang@gmx.at>
Message-ID: <atsMz1RyXnFKGPXM@windsurf>
References: <20261022213719.2452014-1-bernd@kuhls.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261022213719.2452014-1-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/1] package/llvm-project: bump version to
 23.1.4
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

On Thu, Oct 22, 2026 at 11:37:19PM +0200, Bernd Kuhls wrote:
> https://discourse.llvm.org/t/llvm-23-1-4-released/92564
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

Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A3A1606A31A
	for <buildroot@archiver.kernel.org>; Sun, 25 Oct 2026 17:39:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=cn34EvrX
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 47A9160608;
	Sun, 25 Oct 2026 17:39:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R6zfqZd8jKuh; Sun, 25 Oct 2026 17:39:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 200F1605FD
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792949984;
	b=p2b8QlDGQMoHtZMCHldLyp/iFaMTgY+eWD8NV66M4PzhKdjqEc974GFK+eSK8L/f+22c
	 SVdxNmQYsS1Hk+ZBtdUL184zQMhLHZRsm2y+z7OpQmDT7BcDu1mQqjV3gZDGSEg1fBc0x
	 PnBlmh/9LCadcFp2fMXlW/C9g6qjrPC/v7TgdqwusYWNuPqPrSP1W9oOXk4kCgMdBvdGQ
	 MlEzLt2FhIP4b8RGyN/vpYBn2QblP+v4cv9sJL4xEltUzliilQ2T/+vok7lTipth0J7Ac
	 o9DgrKWLT4Kti8HLsOCOMZqrnap0nTyUt/HSKX53b8a9eNKeSWmfakyD/bes4/je3Cg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792949984;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=ywyONzxYC//Sq85LsQIME0y0FbrDJVWGx6i8YqvCUoQ=;
	b=SIMZvymbsxPuR0Ctin3CQVgnpGLBb8PQe6/N9VODzHWViMnvvXY4Ubylye2NQZCh6WJZ
	 xdJLdkaaQFOxwi3zU1LTtOmOENjc8jgmncNpF9+Zrw/7Wv27Mq/FmLiEQpkSFbAizMpP7
	 lyJ3K13rrVk+Ou2G1RMUoJL75Wt3kLl7k5gNYfQcgbBgFzmYFtwcrQkBYRMiWPN/1dBDc
	 8ayhmwf2VmhLe4q9RGEWdOhVrFA6w2Pqg67zovMKbKAvENtlGTY0bsrcb7MPEDd/DHDgg
	 TsKC9tc0DKodh4gvLajWef9Jvtl4zXVUnhbnQiPGBwoMV62NhC+2NZI/YxVb8u+HphQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792949984;
	bh=ywyONzxYC//Sq85LsQIME0y0FbrDJVWGx6i8YqvCUoQ=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=cn34EvrX773A/Ynz877A82ZM88wWAWbmv6L5u/mEVgHnIA/vl4J9nUheEcyozW/AK
	 FIHlSnshLs71p6rKWL/W75kWqkjxvVigav65fMA14VGqtCARG/a76XRAYQPzVvto8Q
	 8zcwtB02YcKjwbiimc+7TQd/k3FrWEOpdBCamCl7IxdsCiK6086NIrHdUKqCH8tndQ
	 EJ9uuTd06D6JV83/2u9wdxV8Pc8e5q4cdZEYDs5Y5O08RnXe2RJIAnrxTT0y4zndWu
	 gZf2L7qjpFk154TCLZRdvwfHSsftRxxww1KQup8dn4zSH4YSLV/QRloPOdSJFoVr+T
	 klI/C6sxtMI5g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 200F1605FD;
	Sun, 25 Oct 2026 17:39:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id D25B1235
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 17:39:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B82764009C
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 17:39:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i4kXur8tQQ6y for <buildroot@buildroot.org>;
 Sun, 25 Oct 2026 17:39:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org BF96340057
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792949981;
 b=rqFLPeOv5WA4BrMxYHSYcF/kvVVV2dumU0pyNSnhMSiJnFKqLv43cw34uYSUEUV6WV3o
 197mCAL8t/QFP+5gYpUzUQc+mAEd68nVc7CDZlBGJWI5wqWOIcx21o6HT9cGcXqQEX9s7
 SLUJEiE4qsmHXxZyyMELK4Pti3AJUdcqDrpHFBYpP4QFq9+WMkQZijAnGrV5EAx1jpOqY
 cXlpO8aoGKdW2WmFViwzppgh9yq8Zgk3U1olSV/Ra9zmXfAZe9rNYFUxytCsO1GZ8RI51
 AK2BO7kucKmYLBf94Fuwg7Rz/q/WLIKMgjQPpBW5aJodWWkssCbEuy+fB1PdEQaveNQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792949981;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=Jv628KB0FMHnzq7tyTlR0Rhk6QrLNdx3nmMDD5XK/wY=;
 b=H/Nv8GNWyRlYjJonzDwdlVMHWOxPSpRvcJSzT1j6IzcDOpgTtRHk26gbSulwMDChbiIh
 KDPguBOIl9Ww04i4WZiNJcabcwP/rre6X9AhGcY2HnUn/SwTueIFoh4OrsH2K4hefkxJ+
 a64ZD/97Pwr27C7kCd36fGq9o7kPKLXhLOgfH0ik8m15UeiZNOmen0kGPVMz46DDUubdy
 nNz1BI8ce4AC3V8Qqi7MGXXXU++E6QIe6a9dTG49pDce5T0MBetgROEbZYX17PEpz2NAE
 KMui3vlnxFyDl9evEVavRJaeyYbH4WCgXs5zDCarJROwoGGAnVsFKDCH3u3HinAZeaw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=N73K6H3L; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BF96340057
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 17:39:39 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id D23F11A1341
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 17:39:37 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 9F67B60740;
 Sun, 25 Oct 2026 17:39:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 9283B10328E76; Sun, 25 Oct 2026 18:39:35 +0100 (CET)
Date: Sun, 25 Oct 2026 18:39:34 +0100
To: Titouan Christophe <titouan.christophe@mind.be>
Cc: buildroot@buildroot.org, Stefan Hager <stefan.hager@ginzinger.com>, 
 James Hilliard <james.hilliard1@gmail.com>
Message-ID: <at4-0j70MtxXzqrP@windsurf>
References: <20261025110324.2226886-1-titouan.christophe@mind.be>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261025110324.2226886-1-titouan.christophe@mind.be>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH] package/xnnpack: add support for aarch64
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

On Sun, Oct 25, 2026 at 12:03:24PM +0100, Titouan Christophe via buildroot wrote:
> XNNPACK officially supports aarch64, so it can be added to
> BR2_PACKAGE_XNNPACK_ARCH_SUPPORTS.
> 
> Because some NEON intrinsics calls are flagged as type incompatible by recent
> GCC versions, do not consider them as errors. This issue was already
> noticed and reported upstream some time ago; and this is the recommended
> fix from upstream. See https://github.com/google/XNNPACK/issues/7733
> 
> Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>

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

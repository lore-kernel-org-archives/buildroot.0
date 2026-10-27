Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6651E606A31F
	for <buildroot@archiver.kernel.org>; Tue, 27 Oct 2026 20:45:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=SYko7AJ2
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4651E4065B;
	Tue, 27 Oct 2026 20:45:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FLZ7uCbK-4Lc; Tue, 27 Oct 2026 20:45:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 182EF40651
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793133922;
	b=Etx1nvNnhKIV/mDMCOpSIZxOIXQF+WuApizF5daFlVUo8nTHXv7/P16Og+HtGaA4kfP4
	 SizSLV9i3oXv46Eaxm511DKRc6cEZjEFin06JMffcaE7kCV+OGs/kO0ySM08gFdN81hoG
	 wklpdXVyK5h18+SsoDs1+PF4zgcZqgaFXbi/VEc+ejuJZuywaYB+VCeGh3gRVNLslY1+e
	 xeY+q5GL/UlBFAndJAkcLT5RLK337gqk/9qwPydto5a8m0NgPvg+U/3RrJCUwvZNdR3zX
	 0SbO5X0VIxhTQTgo1kRZBY4J3/xip2KdymwiMeMa2ThAin1wNdQga5VPaESxR9NQvmQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793133922;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=RQEo7rcUC3Kfu8FGWi6N5cjGvKVSMz15E/gy4K2Yshw=;
	b=lGL3fc5Yaj9xh4bsrUBsA1NXp/jF2+YPZKSrjdBcEAQ67XeBAUSA9OMWvFea8TsFxQff
	 3k+f+HMOccKD2ircnpBKq4W5r2Qt2cDI5Pw/OHThljH6+pqlAslBbdfPyFjWuWdgpfD1o
	 gbm0Gyaes/z69RVx5O9+40eZHJ+GvyuMeJ3w/4+jvVhyxxtMsjmmJpLVQXZpt1W2VYxzE
	 ThmrxSS7X4hXoKSZ7JCZSjl4Ls204bpTiw5q4P24RVBJZRClkbzlj4L8lmtg9WOcBI5Fy
	 IGFTHB8D9TcoRPzeB/kYiRhgMboN07QOui8Vvu61OLQzdKXu598jh510b4ajZ+IIRrA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793133922;
	bh=RQEo7rcUC3Kfu8FGWi6N5cjGvKVSMz15E/gy4K2Yshw=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=SYko7AJ2I86OwkKFoWeNyHUcAiLYqNBovT9YL07aZXwsTYfuHLhSaEIw6DM19n4Jz
	 PZRZM4MvK5/OEU3HcsVSkq8PKiUC0lyK+qJu+EciGvqLdkVmY5lGY3iNBSfqTpy1R+
	 8jgD0c3V15BmEezQ/wp1G/RbJ7khpVYp2DOIqCvAqyzj4ZQMHbrHnLIQPvABhToQKr
	 fWXsm4hOQCkHnt3HLroSBv9Ztp7Iw4lPOZ5XqRbSeE9+NWrLcSvfeSGrt7qNRMYb5U
	 NudBlwCReFyvS2GSIsRsHlI34dZLFdyoAOwmCWWVxkKr8SPguNuutO5mq80K5Lujhy
	 Rj8bjKqiKOYIw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 182EF40651;
	Tue, 27 Oct 2026 20:45:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2DC284BC
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 20:45:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1392880D9E
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 20:45:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uQoI5Y0SiJWp for <buildroot@buildroot.org>;
 Tue, 27 Oct 2026 20:45:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org C249280D98
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793133920;
 b=CKaGI9BtElJOOdMDslYrHmuTTww4p83fxPrtMWw5eiPmNyOFp6/YyCqHKg2Um3/tZuhe
 vfD8dSBXo57MPO5teugjwSosEQQydfBm55PP2OqKfaAhl6kQAYbhI6yUzI1NWNb4mFw/s
 caDh++FvRjVeRVv2bEh9Jjm4KBnj6Rw97DhVi380txFPETQBwitIPlPJ1WfD6xwt737Bi
 07fyG+8XHw2ax4a8lJV+N6eL1Gk+B7G7OsVfIASNQtMZ01XR01Mx6OTaLH+Gzrg1zeUci
 nrJb9aAgRYsOunxe2WKMSzMZcUFzJL9u+jqNP+Lync09iVHboCPMZ20wp7lsxpBwWwQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793133920;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=gJqpJl95ufSWQ28lmTkxVp4y7ve+0VsSHc3dBxFnSHA=;
 b=MnBPE9zUQzqKRJ9/UpQpvHvsxCzqB1kVwYhZURYX84s8l8a/zJINoi9KtqoYHoE4WVzG
 oQrSosr1tKPaLZQXcrS1vDOW08SMWI8X+8Q+bn0kTZykRHv+mrRGi0hgYkWwJIvhcVAVm
 NlTzfOrQC+eNZo0PY5hwBxMuRsjrZhj4Kd+5mkJRCmxAWbCHLfBMcG4W/jm7URl8TrLdv
 HTK16fpI4y8Y/z1Th+v6J2SZ6Jd8Sxxn1q4AtnsxKMpMsFNy5dFqhKgXWTwIfsu8jH9zY
 PXNasnmmPZAzGutmLdAP2q90LJexZQYNSJtOpvjkS2MeyEW7udYPxhyIS56bzfDAifg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b="R5D/PQmr"; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C249280D98
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 20:45:19 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 850A64E41348;
 Tue, 27 Oct 2026 20:45:17 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 594AA603BD;
 Tue, 27 Oct 2026 20:45:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 4B674103290AC; Tue, 27 Oct 2026 21:45:12 +0100 (CET)
Date: Tue, 27 Oct 2026 21:45:11 +0100
To: Adam Duskett <adam.duskett@amarulasolutions.com>
Cc: buildroot@buildroot.org, Angelo Compagnucci <angelo.compagnucci@gmail.com>
Message-ID: <auENU7ogLELMqpQk@windsurf>
References: <20261027164013.1602502-1-adam.duskett@amarulasolutions.com>
 <20261027164013.1602502-12-adam.duskett@amarulasolutions.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261027164013.1602502-12-adam.duskett@amarulasolutions.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH v2 12/14] test_mender/post-build.sh: add
 rootfs image checksum for bootstrap artifact
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

On Tue, Oct 27, 2026 at 05:40:09PM +0100, Adam Duskett wrote:
> Just like the generate_mender_bootstrap_artifact method in
> board/mender/x86_64/post-image-efi.sh, calculate the rootfs-image checksum.
> 
> Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>

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

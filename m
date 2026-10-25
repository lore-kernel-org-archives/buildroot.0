Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 700AA606A31D
	for <buildroot@archiver.kernel.org>; Sun, 25 Oct 2026 14:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Yg9msHj+
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B5429812D2;
	Sun, 25 Oct 2026 14:01:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QDQP2rYrZQ6g; Sun, 25 Oct 2026 14:01:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org E2B6681217
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792936876;
	b=adcliDx13Ij906H5d/rwqmDrjq4wfAbgA3VhUbcXXriAOQm6+Krn8SPQJr4G3M8WqE7V
	 keRU2fE+rxmtTfEJPKclQLhg4X3huG1HBIJiUO4alkxMkiK+QUz5wgbGAWODEoMArHgD6
	 lJbJqvYOfcZkmFdWNuBcQGsa5sCpYX8TILg3P3bMZW/dH/PUCcPJ7218oGVucYVCshNxg
	 mbiMAQz9hzH54KcFUz/1KaCkZ+/afpD+xCIYyYVaMd6V4vhz8NQ94FvR94zRt29F81LGj
	 UU74CEP2t4+JYePLW2y0jGju0IgrwTXnFRkPvkQT/u84bUUJobua99t8KxtSj3539ig==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792936876;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=Ct5+QqUKt7H2XmRVNAHdK0evzLn5urgzKtuJM3JuYn8=;
	b=rkZeVBdvZSMw3KtRfKQsL6UkuX9D6ZYJ3n62B+nxcLoO8DBHzfBf9TOOSxVbub0AAwWL
	 2jWrVM60n1AdAFsj5+emS0uRw49pExy5BXMDLqRkxyrKf/NyczPUz9Car8i2JnxrPtZI+
	 nlxIpXREcpiJhAudpZkxvRhVsiPle0WUcrENajKakGzt2mWmq5ykDn9sGpz9+CStEVfLl
	 2uXhuAEhEnOjKHPsc0sSAk1WLeb7wd+7Ck3/LfyXZHXmRotZvsIqwvq5hap8IQOuSexkj
	 /1XYILArw4sNXgOyDKoIYfBWPdo6uvJoSWS1rxGdubeam6EXUxCk0QCPdhoQENPkfYQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792936876;
	bh=Ct5+QqUKt7H2XmRVNAHdK0evzLn5urgzKtuJM3JuYn8=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Yg9msHj++c/kWYfubgnZlCpHjtpZ5wU7tyb+MNfp/DdYBYwqtM+iEduOqD/SG6yVS
	 a6mgIaOznbGCltKyIftf/59A0jteJ9i8HQpcjZK38wSUEJB1949V5WxflF8VRhXAk+
	 pwMgX8NjtdP8ubJ2GyCmoFk8LV4qPXoP/VDfZ8CECRCywdNXQgWz44RCcloEnaO6p3
	 LFUwq6Qp/ehQpIAi3fFtKojq1qft/MXh/7SqpdvuUbPp0lv9uEJPhu3+N3x2ARY+rP
	 qa/cVpJ+++RrxNhPANW1EBsy4vkAYF4lZUr/wFXwQSoMF9xU9hTWo0ZY70Z41BYVD0
	 HeQr1CqX/eCAA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E2B6681217;
	Sun, 25 Oct 2026 14:01:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id BBDD23AF
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 14:01:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A15854008E
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 14:01:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ObWrEPdByzXN for <buildroot@buildroot.org>;
 Sun, 25 Oct 2026 14:01:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org E37BD40057
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792936873;
 b=OdMu5bjZDlhNdsc3tpDcHZdgffROZJotgADAXI62Ad8cfCgm9yHJcL5a+9MVGlr2N5do
 Xd5PSR+DlooGhOppfdHyi5LvJFWdkup838raAhG1BER9Nx0ZjuHeQdz1ax0T6lfA3cvCA
 WUaEarXBZrqCcyoTpOAMu+9ZQbOwVxQml72Tys6w+Ps2d4w75OIV3HnvoL+qb4gkX0dhK
 LqVHfKV+Q10xaF8EI5C/6olkxnc5eY5Usoi7p6fNXM/+dWfdVK/4fhu9jd6+XN8Mzx1pL
 0k3OsuCXTdffCbM2RNwYVpJjFVaUA+AgHUXnCQxfn9dSTrChp47hXAPerv0x5T/C3BQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792936873;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=g6umuxMqrWSN+lAEPSLbAbpRDYPSw+5OPpsGUvpUrL8=;
 b=Y1XkydRBcmsUUxDIa6POqp3SVTaEkhlZJZNjB7FcrVjVt74MFzyr5qOqztgbylK/wT0+
 BC4Lo5Lbft1L2vj7xNF4rbb8K6dPV8V6N7kO+DqB8c9PUTMlAEGZSZ8MEBRnFci8petpT
 VE0Su7EF5Am75mo9/ZkElEquolWd8sZbWSXEPtKc/xxZaRhOM/A6IQKYxWrZP8YYAKj9o
 MjG6QcQjQ7WjxIVU1kLpswrbDRhGM0s2Jh7p7Ob3NX4l2KsoHsyKP9IIBJBtTKnJNZK9y
 gCKTLsy7bc5NCM1Z6MU3RKr/lP+vf3u6Tu79Zi+aWS313s8W5FOAxnitcHP19y9sH4A==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=FS4tIJw1; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E37BD40057
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 14:01:11 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 46D841A1341;
 Sun, 25 Oct 2026 14:01:09 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 0C6FD60740;
 Sun, 25 Oct 2026 14:01:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id C380C103289AE; Sun, 25 Oct 2026 15:01:06 +0100 (CET)
Date: Sun, 25 Oct 2026 15:01:05 +0100
To: Fiona Klute <fiona.klute@gmx.de>
Cc: buildroot@buildroot.org, Meena Murthy <meena.murthy@amarulasolutions.com>,
 James Hilliard <james.hilliard1@gmail.com>
Message-ID: <at4LLnOcAa5j3RdB@windsurf>
References: <20261024215330.2067282-1-fiona.klute@gmx.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261024215330.2067282-1-fiona.klute@gmx.de>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH v2 1/2] boot/uboot: make binman dependency
 on host-python-pkg-resources optional
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
X-Spam-Status: No, score=-6.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,MAILING_LIST_MULTI,
	SPF_HELO_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hello,

Some very weak/minor suggestion below. Honestly not super important.

On Sat, Oct 24, 2026 at 11:53:29PM +0200, Fiona Klute wrote:
> +if BR2_TARGET_UBOOT_USE_BINMAN
> +
> +config BR2_TARGET_UBOOT_BINMAN_NEEDS_PKG_RESOURCES

I would prefer: BR2_TARGET_UBOOT_BINMAN_NEEDS_HOST_PYTHON_PKG_RESOURCES

> +	bool "Binman needs pkg-resources (U-Boot version < 2025.10)"

And here:

    bool "binman needs host-python-pkg-resources"

i.e:

- not uppercase binman
- mention the full package name instead of just pkg-resources
- keep the U-Boot < 2025.10 info in the help text only

> +	depends on BR2_TARGET_UBOOT_USE_BINMAN

"depends on" redundant with the fact that we are inside a "if
BR2_TARGET_UBOOT_USE_BINMAN...endif" block.

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

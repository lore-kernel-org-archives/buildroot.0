Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E65ED606A32E
	for <buildroot@archiver.kernel.org>; Tue, 24 Nov 2026 22:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=hy63AUrg
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 73F4180D81;
	Tue, 24 Nov 2026 22:45:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4T2vf0p_GiIA; Tue, 24 Nov 2026 22:45:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 008CB80D09
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795560311;
	b=kUkuldjuIfB9ORRhp1Hcth3Ax3Lu5xKHrwuRtNzkIYzXlR63nVdrp5smnvbtIS+KzE7n
	 uQiMFsHkNTtKLKV/3chkdq9cFZ31ev+dkAOP3ZNp1tewENnnfane87Inr1mK/I8V/dMys
	 p/RPnlsRwufKYpilP5bI+1O0OHouVxWmpARroHZ8JHz6c1GERf+VyCDk0oc5oWnbMk5m+
	 9m4DxGRwjl/tjQ25mpeH/CzQtvDy9B3FtOF3X7cypaa43lMDpKIaeWdz1WhYvnG03eNld
	 rbt6hRUQAU6Q/QPlGGt+j4OmdafmBn2ngy8V+OP8AjpbLvAg9L1Hp9OEYGuwzBcMIJA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795560311;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=eSV6CMsWiju3mueSyI591SuMaFcUXThJIu2sL2O6P+k=;
	b=l/ak6eTpzwudsPYLs4b5V9M/1k2SA0fHaxaw6nKGxXOBW8DcGYdzhZsgWTYqWbzcziLv
	 FVsMx9rjO8EnAo2KmE3NC+DD8JhCUKihLful0bYQVwudpQyjIIqaUsJbd64V5Ng1Of1mv
	 uyQC0v/Y8ppGEA/nZcBMjAkz4oiV+/TjlrJk8HV2JSMMe+qsTY12XmvgFV31aWfJGZcTW
	 a0No1z7axJmqRMPh5z63weU31liTbTluKdY0MC2giRMiXoDNIqyMARSXWBlHmmk9MDn9r
	 s1zOgG4CQa4cHw2NElCDAODbEt9Ca0U5QZFBEv/NDrxkGFzSLQ+Kwhbk0s3PfL4cGWg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795560311;
	bh=eSV6CMsWiju3mueSyI591SuMaFcUXThJIu2sL2O6P+k=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=hy63AUrgeqyFv69dJ7tZtwiznytEab4KCnRj9OhDcFM8dz2onU3jMYcBn0rv+vqGD
	 r9RGEOB1HbO+ICIJKUm2sVfrEC0P2iRCC2B3po15JTq8SEAO4v7S57DjG1azBS/eXC
	 jBaSlEZ+aInmdMljpWeegdEPJ06fXubJ84B7tlK3USPJ+4E0oz3+z+27w1mYTMYwk/
	 KUMogH6Q5VPuSp08MDezHckWuNtMax9SW9gahw0Gx2ehhH7SpimbzQ1geEHsfU3mvq
	 lcm8myloPagNpSKQsrfW1tXa4doDaQqKSGlk65+gs2JMzrFe6ApPtyEN8Gl2g962rT
	 jK0x//brd5A9w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 008CB80D09;
	Tue, 24 Nov 2026 22:45:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8D26910B
 for <buildroot@buildroot.org>; Tue, 24 Nov 2026 22:45:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 73A1840180
 for <buildroot@buildroot.org>; Tue, 24 Nov 2026 22:45:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7NRufvcYo6tX for <buildroot@buildroot.org>;
 Tue, 24 Nov 2026 22:45:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 2EC4B40071
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2EC4B40071
 for <buildroot@buildroot.org>; Tue, 24 Nov 2026 22:45:06 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id BEB424E41753;
 Tue, 24 Nov 2026 22:45:03 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 72B25601E1;
 Tue, 24 Nov 2026 22:45:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id AD3D111E69BBE; Tue, 24 Nov 2026 23:44:56 +0100 (CET)
Date: Tue, 24 Nov 2026 23:44:55 +0100
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org, Thomas Devoogdt <thomas@devoogdt.com>
Message-ID: <awYTTu91gumY6nzc@windsurf>
References: <20261124172410.1613827-1-giulio.benetti@benettiengineering.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261124172410.1613827-1-giulio.benetti@benettiengineering.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH] package/librdkafka: fix build with LibreSSL
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

On Tue, Nov 24, 2026 at 06:24:10PM +0100, Giulio Benetti wrote:
> librdkafka doesn't support LibreSSL, since it uses OpenSSL functions that
> LibreSSL doesn't provide, so the build fails with:
> 
> src/rdrand.c:81:23: error: implicit declaration of function 'RAND_priv_bytes'; did you mean 'RAND_pseudo_bytes'? [-Wimplicit-function-declaration]
> src/rdkafka_ssl.c:1269:9: error: implicit declaration of function 'SSL_certs_clear' [-Wimplicit-function-declaration]
> src/rdkafka_ssl.c:1679:21: error: implicit declaration of function 'SSL_CTX_use_cert_and_key'; did you mean 'SSL_CTX_use_certificate'? [-Wimplicit-function-declaration]
> src/rdkafka_ssl.c:1773:9: error: implicit declaration of function 'SSL_CTX_set_cert_cb'; did you mean 'SSL_CTX_set_verify'? [-Wimplicit-function-declaration]
> 
> So let's enable SSL support only when BR2_PACKAGE_LIBOPENSSL is selected.
> 
> Fixes:
> https://autobuild.buildroot.org/results/fb7/fb71058572ec270c46ff5de542c186c73bc06ceb/
> 
> Co-Authored-By: Claude Opus 5.5 <noreply@anthropic.com>
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Could you provide a Fixes: tag that points to the commit that
introduced this issue/regression?

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

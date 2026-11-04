Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9594C606EEA3
	for <buildroot@archiver.kernel.org>; Wed,  4 Nov 2026 22:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=E6ILHjfE
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 724D581292;
	Wed,  4 Nov 2026 22:21:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id czWUFnba16M0; Wed,  4 Nov 2026 22:21:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 8C7FB81062
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793830887;
	b=pnH4HSiCB9V9GilfUdOYjcnh9/qV5i0CDYROcRfESbIhXc6FpL7HwNgc0192JqW0ztFw
	 vKx+2h+gJ+kw01XbLVkNYHWz76rAsMZN0U/DJnZ4FcQ3xF4hU0gbcGY+PSbsrFmSz9X9I
	 q+IR6LkYp0c8G1eBjAtSZt7mr9k+qVO+WgeZxsJSvqQhL0IDwA+QNehpaQya2LV1j+hFM
	 U+4NqtpuYk5pWMl+C/lSvlVDikMiwuxT5Ocr0qYktPwerW+R5GWMuwqrSWR0ayJ6Grvhn
	 V20g6kAZBxxlhtJVfrWQIRA1P158WRq98b3RasqEMycsdshNldnpYks1tGGN9vc8zLg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793830887;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=aR0gEZCn3QSThWiiYH5bXpqajVADnqAK1VnrKrfAvO0=;
	b=LcDhKHLE6I9J17L0frb4zyGq0OKB9iu2lJZ4DGfggXksbnRML2XYG1Wqix5ILOY7KHCE
	 gyZ5A3fNeBY7fY7SkKKfMO5/9YJJS8pNK4tUiUwZ442ACMtpAW/r9nMQJLpoHMH0WpOxS
	 KIZndqit9hRprIIjuYR8Llq3RUl/cNAziqXaKJvIJDuVO0HYvJW2JSIXUdbs+OHLFJHoe
	 V2TnRERrCT8OEAz4bB8U4Iy0fXg2F83JMB0aczc05g5ERQVvK9K60h5biW8fnZLTsJpTK
	 NBVTVRSCyZbr2OFvAtaV7erwpVzU3m0mwMDdQ//Eux5dCG+fPLuinVYAzAEQDefx2pw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793830887;
	bh=aR0gEZCn3QSThWiiYH5bXpqajVADnqAK1VnrKrfAvO0=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=E6ILHjfEmKWxRLb4w+X1D8G74WnoAgzF3TrbkMY6G6MUnKV/d6sBq92EukvbiR93C
	 ixHDsMJ+Ah3VVelRkdRdG7eMnsLyf+P7jLrfcS7aIkCdyDKh//onvWdK+5gKUh9s6M
	 EiKHslkWN0TzpYvxgNuhgY4WFyrykI9OYY1PQ2wpwezcaEQzluYzafObDOCboHtpll
	 WQl/njcDCombM9bv+D8uzVMaTtTBb193T6tTB7Z7G5KuaEExvpUura4R/EM3QUyqA/
	 mYidX1q4gq++VyP6XaQV5/9HNx3RV8xSuHvMnuIjSMNjjJwAhu6SiqrXwYylBoC8fk
	 W4ZTYTfniTn5w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8C7FB81062;
	Wed,  4 Nov 2026 22:21:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9A9E3362
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 22:21:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8BB2181285
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 22:21:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6QDGiCBzGGMU for <buildroot@buildroot.org>;
 Wed,  4 Nov 2026 22:21:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org B9D8181062
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B9D8181062
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 22:21:25 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id CDC3F4E403FF;
 Wed,  4 Nov 2026 22:21:23 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id A6DC85FD65;
 Wed,  4 Nov 2026 22:21:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id DE16C1032925B; Wed,  4 Nov 2026 23:21:22 +0100 (CET)
Date: Wed, 4 Nov 2026 23:21:22 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
Message-ID: <auuv39EV37KOCV62@windsurf>
References: <20261102181345.3238554-7-james.hilliard1@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261102181345.3238554-7-james.hilliard1@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH] package/python-zeroconf: bump to version
 0.153.0
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

On Mon, Nov 02, 2026 at 11:13:38AM -0700, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

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

Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0B58606A332
	for <buildroot@archiver.kernel.org>; Tue, 24 Nov 2026 22:45:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=AMcF+PDj
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 87BD9404EC;
	Tue, 24 Nov 2026 22:45:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NbpNOmzQeco1; Tue, 24 Nov 2026 22:45:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 9F39B405A9
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795560353;
	b=Zrl1gWobFOuJhN9rnOtyI/9xscfDBPP3t0m2s08/HnURuHfx0LEH3mf+Z7/M0tJO29Vy
	 j2ktRuCRTKC3VcfPsRjzYa0t0waJbLtrM7HZM7IsM4WaRWnGsheOOizaOfTqRnUkaGsZW
	 iUAB1po8mDv6hPGgSJXxIFe96hQyrXROs9TR9oJrRujfqzGPW8O0tM1pYrIdbZfESZslk
	 jbTkvlNALVt2z5/SuEFN+byLqzuz2p/YvBA7KTxQv6zmUSbzKPVttqxEDCINxCW2MCi60
	 cFfmVnsHcYYliFDBZlWMPxxNsXolnSAkFIcNd2sK+tSyYjN2eTj9rnAH0/9YeifzWmA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795560353;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=EishUaLplsW5G2saG909hn1JMbudv+sO/w1AbXI1Xu4=;
	b=RkZhy6WXBrJLncodEsLHRqXypUXh47Zyx4lVnugP9/j8WHM9lJYk+XPWy715TfHBXaYD
	 cc2/X65EzFGEu6dvr1+7Q+Gz/uNRsl7iu2eKLdXGB1N/0N7Ig501j/iHHV41XZJHhpW8J
	 5/1r0AiorVCCH8We4VB+WwM2j21ckjQcSZFAf9op4eIiWNIKbXaYQIzlDbkmDAd5u24pZ
	 1K0H+HKifYDwiHIBPwRtzhukIfGrEOTQ/W8G936fnZ39m6uR1SpH/qiPV2l129MSRry7a
	 gI+UU8tcjXBKmNj2zmNqOtrmOFUvM53P1W/21hGac34Qlkkd6Opza/3qV11HIds4H8Q==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795560353;
	bh=EishUaLplsW5G2saG909hn1JMbudv+sO/w1AbXI1Xu4=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=AMcF+PDjjXRzcMh+l7sjCG9bRNR5ZhnM0CoVaH7I2TZ8+ufjzjP3QtdT6NBRza/BD
	 BHA9rwE7osdNoFV8sfge6YjtvkuBHBcjo8ml1oP7ez8zWWDiFMEFM3zShYu/sd97+O
	 EvlX4CxjbZ/fpil6NUiz+ChJiAt84bXBX9uJx/38ynqiSabe0LVKklue6CZ05za2Qu
	 RhOb7mv0r5TFq5ggebpCWdRWgwiJd/xenEJxftHcXsPAgByI6ZcxuSrryTEbPcYg2Z
	 09Zwx3r+HuRE0p7OU9A2qzMXx5MnDe5VVSkKC+ni7FHsN6saMjvFPGaMSr8CgD2kbD
	 Fu39fhx/Hm02Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9F39B405A9;
	Tue, 24 Nov 2026 22:45:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 52CC310B
 for <buildroot@buildroot.org>; Tue, 24 Nov 2026 22:45:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 448F4405A9
 for <buildroot@buildroot.org>; Tue, 24 Nov 2026 22:45:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9xjGoun30Q8s for <buildroot@buildroot.org>;
 Tue, 24 Nov 2026 22:45:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 89F8F404EC
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 89F8F404EC
 for <buildroot@buildroot.org>; Tue, 24 Nov 2026 22:45:50 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 480BF1A17CF;
 Tue, 24 Nov 2026 22:45:48 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 1D82B601E1;
 Tue, 24 Nov 2026 22:45:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 384A711E69BBD; Tue, 24 Nov 2026 23:45:43 +0100 (CET)
Date: Tue, 24 Nov 2026 23:45:42 +0100
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org, Philippe Reynes <philippe.reynes@softathome.com>
Message-ID: <awYTfr2ZjwGaRYZw@windsurf>
References: <20261124172410.1613810-1-giulio.benetti@benettiengineering.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261124172410.1613810-1-giulio.benetti@benettiengineering.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH] package/ibm-sw-tpm2: disable -Werror
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

On Tue, Nov 24, 2026 at 06:24:10PM +0100, Giulio Benetti wrote:
> Upstream builds with -Werror and with BR2_OPTIMIZE_G gcc spots a false
> positive -Wmaybe-uninitialized, so the build fails with:
> 
> Unmarshal.c:4248:43: error: 'startSize' may be used uninitialized [-Werror=maybe-uninitialized]
> 
> Since upstream appends CFLAGS after its own flags, let's pass
> -Wno-error through CFLAGS to avoid this kind of build failure.
> 
> Fixes:
> https://autobuild.buildroot.org/results/ff4/ff4d551f62bdfcb5b828f8b1d910e8cc348da36d/
> https://autobuild.buildroot.org/results/777/777bb0433d1a5529235162f301be2c32e377e957/
> 
> Co-Authored-By: Claude Opus 5.5 <noreply@anthropic.com>
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Could you provide a Fixes: tag that points to the commit that
introduced the issue/regression?

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

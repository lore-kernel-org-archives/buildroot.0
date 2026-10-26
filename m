Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F181606A31B
	for <buildroot@archiver.kernel.org>; Mon, 26 Oct 2026 08:12:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=rT2NXFRd
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2937480DBA;
	Mon, 26 Oct 2026 08:12:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9RtITobI20NV; Mon, 26 Oct 2026 08:12:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 5C09580DA7
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793002339;
	b=hABWhp2mClWcbKXsT7WHlvQUWg+Pjgxj553eRBvZd0Nq+Jc159Ojyt9EhjmsZm6hwjAr
	 4TtolDB5ES+SMgSNASkGh2f04mYoYtopi5rQu4fegvvCPaoQznRrEqoIq8+xjOcHtqEM0
	 FHqTN3/442XIrtNWfFWZ8u5+S3mUTRJan8YqU687f3EUVT+uK6zRGlD+GtMXhKcGFPa/W
	 qQ5SMwxBG5OfKS8IpK+jorYUZJ0KRv1YNVeUlp27oib+TciQqjQTRZ9xIBrMqjM3iZUjj
	 jd37BOVtUiPIE+EHkyDGgVYC+OmkzyaIxfBrIyRyvauoInL9hkMA1QmNa79dZRAl7Ww==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793002339;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=xnCq8ULA0+xQejsMIWshpwl0QRPgxV/RPloRTcr57SE=;
	b=TDaylQGsKQkAVpu/jSqVC3NgPXotRv2NkR8EUb4vcijc3Z4X7br0O0F4cqwpbHS2gIR5
	 dPCP6Q7ZjKP7mgLZMk9vw3t0yY3vb8sDErUSjNIoejj0AmZjJbYSeTseaN5beviuMBNGj
	 3HI+pxs0P30KTxWXLB026DgpHP3GgnP8AG13dEldpkTOdYX2REiPbhSR3n+NI/gQs8KvY
	 vgGzp9EnRVdWBodV+Oo7c1M+BLOSr0NenYRWJF39bYy/gubmXuuTMHKw97Q+xAknm6YvJ
	 T6w1jP5hAZwQDiDmt1kF8YWVh1ZGp/W+3P0MSOIPvehs2aZnmyrjVQlwxWiRP54s/5w==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793002339;
	bh=xnCq8ULA0+xQejsMIWshpwl0QRPgxV/RPloRTcr57SE=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=rT2NXFRdLrHd/6MoGmujUfCd7wAJUGjhVwYqi+/21almMqisCbzjJu3UL352M06t7
	 Ur5VG2FbA5pFNF/JNd5oflKNooRRcYsH8Er4JKwQL4nOBkjs43GZCVEub9Dbi0soko
	 1RhhRR8C3DI6r1++edq+qbheo6DTcPi0QGYKlezHIa8N1YAGZQ0YG+NHXBgWEYuuY6
	 Oc7RxwNpQ6uABUmxX9HeodiZvQ5crs1AZMFxIjUq3A3AR4QeNo/6K7LYZYV8AlAuYA
	 SuS0uBf7JZfwIER1CDXSYb90DSLZJtsV4ME75U4yqXJXINjgQaPiWOI1ROyFrtxxz3
	 4fSF6kum9ppZA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5C09580DA7;
	Mon, 26 Oct 2026 08:12:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 39744235
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 08:12:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 16358605FC
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 08:12:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OYT1kyNRVulT for <buildroot@buildroot.org>;
 Mon, 26 Oct 2026 08:12:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 25299605FA
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793002337;
 b=BWi5/vmsBYxdgckf9YLihmHmIekK02mjPX+/x4VlaMUrrpJI2brM6S7wt0YEH3hVHWP9
 mcYFjXEUNCXm0G/6fBT75ylmHkKdyF4KsAhgj4yUYGsoY4Qdp5MH3nzHIxCek9kX9ad7j
 v9a2Rjte/uhAWuYNbE5ke1Bf359sevdXE+wqbzbFbwMtQdqkRsBstYgWCuPFZ9TsRwpSk
 MsOX5Kln2VmP+h+KFRSv849GqwVFUDPP88GQFOxiCEFNGLA1S76Df2mCJc92Zd3SbzrP9
 XN8fT3BPhzclykPrRnsD0bdIkU2F+JkpfziaTiFNYjBLPrmM9gSD1PL8hi8N/jqanpQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793002337;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=mw4sm1D9YjmjudtJPFi4/qDa6q6MVo0blQ7efWmNDro=;
 b=fH6/cgf7g0zZzg68Zya7b4/HXJVfXPkEV5Cbc9N8xTcrmi1tTsPQ+XfJd5jl19qyoQrl
 fXmKEUOdKWNMq0flRMeR2gr1AfyKPlOlDeW+04lOxM0GPIFtmgwPJZcOzqqwgx5LNGc/r
 Yha83mH5hEvdSAUxjrCofeTXMAzYPxzN0D/ZOF7oKUfue8B5ZHaM0yA+gqGHyxUfLTC0g
 bdqfS2tw7AGvys5+ivt7BcckID+EXsYr7s5mIhlt/qwwBhVij0nmt82cHICPXG28ULU91
 kCP2y8BsNKcji2jclVilvW/eCLYYsqvEzAGOjfCKZeAy4IUXxHZtjc5aejjeLG4/ulw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=PyMYaD7R; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 25299605FA
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 08:12:16 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 1C0831A132D
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 08:12:15 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id DD04760740;
 Mon, 26 Oct 2026 08:12:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id B934C10328E76; Mon, 26 Oct 2026 09:12:13 +0100 (CET)
Date: Mon, 26 Oct 2026 09:12:13 +0100
To: Peter Korsgaard <peter@korsgaard.com>
Cc: buildroot@buildroot.org, Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <at8LWhYereuFXDbx@windsurf>
References: <20261026063627.1896640-1-peter@korsgaard.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261026063627.1896640-1-peter@korsgaard.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH] package/rtl_433: bump version to 25.12
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

On Mon, Oct 26, 2026 at 07:36:26AM +0100, Peter Korsgaard wrote:
> And drop now upstreamed patches.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

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

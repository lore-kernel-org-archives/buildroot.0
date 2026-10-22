Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D75B606A31A
	for <buildroot@archiver.kernel.org>; Thu, 22 Oct 2026 11:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=b1kXcFK/
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E7F9B60896;
	Thu, 22 Oct 2026 11:29:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4pXvsJvFhXwN; Thu, 22 Oct 2026 11:29:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 111E460719
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792668581;
	b=OsjjpGKmX67sDGEvo8U90REMLUUtzoPpKLy2aiEoU+GSkhRLiIobTByrQ+CCVyTqaDv2
	 2L3LHsxy3kIRXHDwIQiiOxAUEnpKwCneCzjLEAkrlIjESXAGoGvwQZQSXTjrfnzOREjmX
	 6c8j7ZJNrMVojMM53TbIAhl/qCQHls4LwcnyYuZbetmRN+5gkUBaEN3KA5Af7jfBU3d3O
	 csmfa5yxONNW2x7YY6fUQiIjVIY+drJWohBZOTqCTRkSZpp+JQOOdZSPaJTYFr6eKzYcd
	 z9AO9gAyVWtOqsOZDDNnjRYqXqpXPT4ZLjwRTDB1N4JMW8URUgOSgH+j7TbAXJ8vtPw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792668581;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=SMn3WfNI4+fe8npZ6Q4yf2OFFZbDKMrsFETzZ1Bd9yo=;
	b=tFacVDVeCj1DKB9JIE7fg5j5ZbkBHqHcMie3RbJOx3cUTOOS/r6tvNcAn3NoX0BaZhfr
	 uKUb55h/+soVbpJAvoVCQDeo8+LwRqQx2h72obShkPe49KCJYaW1vuBHKodJRHqPguTBM
	 1OZBWSGPZeZIjLAloOdOwMjNu7UMNzxGFvTCsQ+q7JmGflLQI6Dfde/+8coHX2+Z5Ux5Q
	 3szZUfR8x3XQkVtNJTCDvWLjX4fOqeB+4Id8vdLyPtDkegJYwWPuRD/CvAHITENETS7D9
	 4crN4mt9wuMlAYT1eXMXaxHEdH04IFPIOF/cLzebp1ayhxvlb2BkeiDoLgRe7H/qnsw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792668581;
	bh=SMn3WfNI4+fe8npZ6Q4yf2OFFZbDKMrsFETzZ1Bd9yo=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=b1kXcFK/wnU7PfSYz1A3QKvyYHCwCpWkP9pDA9PDnzAwj/WpjbdaOr1MRTHs/9mqe
	 ddctq6a2JmidNSE2KGkpLaOVO3y7GHXW90Fpfu9zLumTyFM/vMEvs56JIOYPXYQKxD
	 qr2y0QY1B9h8ir6yZZ67HGovaIdskZTNQM5EG3YA+prZio7kMhNqkxmDftYn/ejsez
	 Tug/dul/Ty9b2qZeEcUAe6UrBfQqM4Ijo7BbuuJZ7APwf5BAmITTGMue/9L1sUBMe3
	 tLzzjwZBteIHJbSA/PEeVpnrgL67XKD2V7ACRdKZdEU8wDyZuzDfzp/qAH1MwgleOu
	 U7T2Ae4K9J/Qg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 111E460719;
	Thu, 22 Oct 2026 11:29:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id E50073A4
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 11:29:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D73E960719
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 11:29:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mXnicujcS34m for <buildroot@buildroot.org>;
 Thu, 22 Oct 2026 11:29:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 52CE46070D
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792668578;
 b=rvVh7jeMqgIlBDkI3nRfcg7w1D8PMJLV21x6KHaCUV2eKEOG0C/EyfrPqFezCw99ZZc6
 3aV256mGo8akXorjWkzcWyLNaRnQZnCjs/Tkh3Xgh1+xT3ge5n6OvV0ajJ/6QHRUNF76q
 yWEbgqTHsZnE6kT//XEjP2+m+FLgW/gPf4/Mf1GnwDtFKKGI3Ry7V+lmItSEYvEtLKqwD
 VxPAG8SwW6W6t/qJJZfqA+j0PYRSpZN6J3qmeyMn0U8/O+HcS5ec1Blu8U2p0NYzNm642
 DpjNC/Ezi0inJ/CAKyXjbbYbt/JBG85I2kHLMpCNsD1GG12ZMpvtnTxrTYMMVBSl5HA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792668578;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=aeIVkFW5tAteyPIA8DLKnMLlvN7MPSkLgpOyKDIIH4I=;
 b=mjMJawnWL4mqqb3ndB601tWQEav+z5kMQitxkarnTs0ATCLoSUrw1mL0KEElH9ptrmoZ
 JDkcSJKL9XmME5VvdmBBSi3eIskPwfAyF1U/B4Pa3xJLAWVVAobPXM/hOuHJ1U/T9CSuU
 DrI/O7i+xyTQer+2zgnvUgc9IVg8RyeuT5w9J7JEkMI3bCw4es18wapu+JF1vIpu5KB06
 j6umXobJep0MChlPyRFT2RL6ulN+PNAXRIvkuBGNH/aZV2NvmZko6YdDvSB1UH4R/zQQF
 dLuvfzRsIr4ujjNwGcHAp7TCy/8eNMNQLchf6oPudqRaJEkJ+OjKefj2UFx6tCU1VXg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=u+hH7mW8; 
 arc=none smtp.remote-ip=185.171.202.116
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 52CE46070D
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 11:29:37 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id CE79AC58472;
 Thu, 22 Oct 2026 11:30:34 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 766AF60360;
 Thu, 22 Oct 2026 11:29:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 8BB4F10328EC8; 
 Thu, 22 Oct 2026 13:29:34 +0200 (CEST)
Date: Thu, 22 Oct 2026 13:29:33 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
Message-ID: <atnzfzaDFOtqR5Oz@windsurf>
References: <20230713075740.328213-1-james.hilliard1@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230713075740.328213-1-james.hilliard1@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH v2 1/1] package/strace: use bundled headers
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
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Jul 13, 2023 at 01:57:40AM -0600, James Hilliard wrote:
> There is a bug in the configure script, while we could apply the
> upstream patching fixing this bug the better solution is to switch
> to using the bundled headers instead.
> 
> The reason for this is that strace needs the headers of the running
> kernel rather than those that were used to build the toolchain.
> 
> The running kernel is often more recent than the one used in the
> toolchain so we do want to use the more up-to-date headers.
> 
> As such we should use the strace bundled headers as they will be
> the most up-to-date headers.
> 
> Details: https://github.com/strace/strace/issues/253
> 
> Fixes:
>  - http://autobuild.buildroot.net/results/867/8675aeca53653d9d792182be61a28ea550dc530d
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

As reported in the discussion, the root issue was fixed in strace 6.4,
to which we updated a long time ago, so I believe this change is no
longer needed. I'll mark this patch as Rejected in patchwork.

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

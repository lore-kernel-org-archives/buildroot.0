Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7535E606A31A
	for <buildroot@archiver.kernel.org>; Tue, 27 Oct 2026 16:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=YIKlmDh7
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D366380F88;
	Tue, 27 Oct 2026 16:25:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a1i1ILABiDYz; Tue, 27 Oct 2026 16:25:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 5618880BB7
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793118318;
	b=L8MrVMWuPDdHzSEpk2inHa4qhDgpqa3xIYENYsVcUZXol2U5usOza2g0i8JGLVFoxSS6
	 YXKxX4wipM8MWQONlCaWEyNO3Yvdd2NSVHNd5fstFSlFGfHOUdottEYdHhjYWD4j7SmnR
	 bHna4TBN3BURnjanNj4mbcRmv6ipOpIt0i2Rs9ElplD7L0bSOlNxOAJMid0QKwqA2uSoF
	 wh/UukSX/TWuj7ORZ02kMCJUQgPs0bRw09WsmstkvGdft7f9cc+7ylG2BOc1tzlAYXwfY
	 Jy2whaeR9dyjbMRA1gRttRFvBsw2Op3Nm4zkPF8RGJxt2GNKJ8nJrzmXrve2u87th6A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793118318;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=TsYhz4wyVahXWgZktEher/Ek1UN9+AVbI0d5ryZf+I0=;
	b=qo7Nq9GPNjym15mNeGMfs6uc7a51YT/wMlond7x7IoU3Z3GHwBHZThKxU3+/ibSAY/N0
	 +If91OwSUFz4vieYH6CFVWtEP16bujFKsLpdmh0F1CFo5FjI1l5rxm8NF1U43aFdS6gT0
	 FmSF39aHBOwQ0AeCuIbY9hGeD+grBPH7iHPvxmBLgnnvzCyKb58mpdfE+ow3cWgKLOPUi
	 HkNPXeToKWI+tQMgB9OyP/dnzpavMZ6WMlqWJezh4DLRcK/mzXd8yplcHObNMmHIIEbOT
	 fYXvuUOTm04EuuHqzp9zz9CTJZsFGi1I1tKu9w3I1jzDNl9VMJwKXlckj+86es8NEpA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793118318;
	bh=TsYhz4wyVahXWgZktEher/Ek1UN9+AVbI0d5ryZf+I0=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=YIKlmDh7XrR7/94rcAmxSBoWsk8JTxfwwDRIAvW2sk8VAxaEvrIOxfe9Rh1Rplt1R
	 4FdBc3CoCFlZAWuAlKKvdcxRMqyAP0h6KZYGNYil8QQXy7oh+iVm8jh2p3t0tXkJtj
	 ZEvrYLk9Kj9vUjoth05BJKOkXft5tzbEUg6KoVHsMMsm01WpbQslCiz+rqKFoPuhkk
	 XFyEwAcukm2UEVV9dEySFntKCP5z+JlRg25iPi84oc4zBNhb9UYNY40gceDbLAKAiF
	 Vno0tWEnzfniBVo0k4JpY+NyBOtTcUNCJBJYSXV7xTKyRyhZ0O/N2/wEtSgse1vD7A
	 j+9Hk5M5mNGow==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5618880BB7;
	Tue, 27 Oct 2026 16:25:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 77C81A32
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 16:25:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 69C31400E9
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 16:25:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wSiPP1YI0J9q for <buildroot@buildroot.org>;
 Tue, 27 Oct 2026 16:25:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org DC40F40076
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793118315;
 b=UV0xPlRhdRDk4o/n9N6N/7M17bFf/MxYh2wOpNacNEhlZVKTcrQJPfMzM6VUmKaMjf0n
 vLjs0nBtEYmfhEIGGwKVkaVksGSeXLQYF4XsuwXTp02XfXGuO/8LHcl8KzSK0+rrj2zOa
 4/1q30BzJ13nW+ftbeurFRp/oAQRIV3/WX18NB+F+LF68oVrpJM/b11annYrVz2tCQ4sw
 FIl8s+F9k0d8+3vJ7+kbPW4Wg37CISdCyNDFHpy8HxQ9b3mCtyrTNc11yDg4zO4RmEPy0
 4bidKYnA/Ms9aE+dph/Lkrc5aqC4/pXjLBOcPGqvKDLMgoOy9QuDXbWgpPt53duSrDA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793118315;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=8M7pMVBgl5Eeg7OK95YsGN3CKCbawR0F0VnUMyU9rwA=;
 b=VD2W+09jf2AerL3UN3p+Oa6jZMLwFSl++UfDv8yAglH26Agoh1aE5kSGQlb3aHHRgEu9
 CgYGrhIlr0E+NZGxyELUbru+rnOMVlmCnSt0WMIjokdhiHm9dBtIaMXUM0OHrs5OMgt4q
 N965ATccqz9XzSkOGWo97SpG85Hd3D52rUvXuM+7VUTP+AvXlmS5hG4QTQ0vFnY6Vb72j
 p4mBI02sGBj+KdUlcE561ag2NmvyILKDzk8BcDwlw8ZdqBvIBPlc58aauurICUVhXgipu
 WECKUR9uX23wWqAFrRGvFrxhY1wIoaDne+326Vj05CMG6qRA29OSCgG5kd1yGS8MWFQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=NBcevBc5; 
 arc=none smtp.remote-ip=185.171.202.116
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DC40F40076
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 16:25:14 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 4CE08C79AB6;
 Tue, 27 Oct 2026 16:26:13 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id B72F8603BD;
 Tue, 27 Oct 2026 16:25:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 995851032906B; Tue, 27 Oct 2026 17:25:09 +0100 (CET)
Date: Tue, 27 Oct 2026 17:25:09 +0100
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org, Luca Ceresoli <luca.ceresoli@bootlin.com>
Message-ID: <auDQX-IOAqg4kuVQ@windsurf>
References: <20261027155339.1566596-1-giulio.benetti@benettiengineering.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261027155339.1566596-1-giulio.benetti@benettiengineering.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH] package/rtl8188eu: bump to version
 2026-10-27
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

On Tue, Oct 27, 2026 at 04:53:39PM +0100, Giulio Benetti wrote:
> This version allows to build up to Linux version 7.2.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

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

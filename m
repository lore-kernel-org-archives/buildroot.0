Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAFBCCA5FCE
	for <buildroot@archiver.kernel.org>; Sun,  4 Oct 2026 16:08:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 76D8C80DC4;
	Sun,  4 Oct 2026 16:08:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GnXYK5gi3YJe; Sun,  4 Oct 2026 16:08:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 3DAB480DB3
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791130096;
	b=cnA97EQHCC2qtrcMV5bQ3EurFDTZq0HMYWXS3Sdyz3jLwdzMqSp7KfFc94XVdY3fZvOh
	 z+MlIFup4oFr1R2G907NUlMLnO0abXkP45Nc+HtzCKlS+VkQ6u1gABYkIirk6Z3/SA7ZX
	 BoFFa5R+Vc7X2GnsVShnXFP218bdoteyyITo3tKw2bQHADCtTvDd3fdJAYVR61c0XEQyp
	 vquDu7B7Fa3SlyVqjzZDntPU7MdofDMbXkINpSm0hvBntsl+2GUrirvRGy4rnw3MtO/N1
	 tDEn5f5Yo4KMyF5Ux4eEu5CbK5kSqemOYSkT0+eaWNqTMfA8dQwcrlyhXVJO3J3MKOw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791130096;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=jlO48pOhcd5CzEqMubDt9IqMSvWDEaro0DdczmYfKiw=;
	b=TEoKfYGi1S1rOHH6H0A/Bpfn4YTWEuhccmgVCEPz2eJRWN2c/0J2pbOh2UByvqlOfv+P
	 CXCdQPDKN++ZGQ4q+ZNsrhh6Av6XXPiYroxRK2Ea8Egi+tIU3+rMO0gjjAytV3dQLXUVX
	 B6ZXEHxoW/RAUso03yeyPBYMrzLKqIAU4ba8PeHStS/puyoulDO34fSyOdCbMxcddmGJO
	 G+mqaa7F6Ytwg3jUsXFGj+a5ukLavIa94QsSeVocZpav/VG3ob2dDDO62KT5zvsWkHRvu
	 VM2mDEFk4C2N47phMsOojnq3pLQhgktOv+3UXQTMyEMGGREnXLnfXjqcME0HxXgcW+A==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791130096;
	bh=jlO48pOhcd5CzEqMubDt9IqMSvWDEaro0DdczmYfKiw=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Ub0RJoxb+IMvfN5vurRTU9vGXFMa4QY+tXbzLGRtfno23PEEgXz6bM+eQ3H2iWaVF
	 mhNqzAbgh+fpvbSDz+R8JSaDp4/9Uc/KTDyeNfySnxxSenyAdWFUNpm1QQuylnR5iS
	 Caz2o5gIMwea4Sj8O5yJOpr7eNEYl+i+gLG4R4DveZPVJfbXxTOyct9GADfxF4fxoq
	 XbrRe2ORTxi41/+WA77SwUjbIAjb0f1WOiVdbHkRmUPgRKVW4caXGWTFQKH8fhOIv2
	 DgxK4IdyxsqCt1GgmQ/EEKRCy6ucjxC1RK6gYYtzHHouWySW8XRekCz7OSMEt6a8AA
	 iIx/EFHtxqBFQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3DAB480DB3;
	Sun,  4 Oct 2026 16:08:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5CEDE34E
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 16:08:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4EEC1606FA
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 16:08:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XheJ0uQpes8M for <buildroot@buildroot.org>;
 Sun,  4 Oct 2026 16:08:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 66699606D5
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791130086;
 b=T4hs+RvHrHSG5z8wuYhQ62NL3RTxgzl6byzwkhr+F6gFKlQ6YOs22UMrrPqrjNLuf8fk
 ImOdhR517P1HuGf4omYOI0ZjvXuzYRGINAHVBqrz04xjVapc+az7pFrE9SJhakna+Sa+l
 JwdxuJRgszI5CmmT7byqJkMHoBkUb8zw+ZZToSoZ1+usluCUsL+9LWcV7svvofjsAkG1B
 DieLn7Qdc2bmuXMh2c4wxvaNegclcAsPQtXXXrqcXcMKEPwPOuzv1k5KXOYxMG2US3quN
 9ORHswSp0C1pPeFwEuIqqqomrg425gFg69fkSFxHv9mmopc5NaqSHAurz8FQAsls/og==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791130086;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=ARQlrCdNBGXFHz+oBKfImnnbnALwDo2jt7dVC3m7Q14=;
 b=DqWb5Bj6QdYFemYUd0zfdUjlmEb4yY9JTaTSOjjoUmE50F0qhf/aZhvfQCEnfz7eW4ii
 nrfA+nDB8xrK/8aOUirEAZqO/5h7u75XIrqkYXxztaIM/xQlRBXrXuvDQBiczATNLKODL
 aOOvd8fGtk2lGpGIeFNbPsDf8u0d5V125jS1HT0TuH/X6Ooh4LVgC9dq1Cw7p4LMCtTko
 XeCr1MpJUOfENHXnikH+oUwxJx8Ftv/PY8IdKFa11swBla5Tv1UEg8N2i70VQRx4XNeCa
 7A5qkWoCYSAC0DlBCk32iPprEpQoYMNRNy8lxUsXEkpf5XRTLVYXJUvirffKeSb/FMg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=fXKWzf8H; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 66699606D5
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 16:08:05 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 362251A1133
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 16:08:04 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 05326604FE;
 Sun,  4 Oct 2026 16:08:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 35A59103281F4; 
 Sun,  4 Oct 2026 18:08:03 +0200 (CEST)
Date: Sun, 4 Oct 2026 18:08:02 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
Message-ID: <asJ51tVbhtOB7DRr@windsurf>
References: <20261003210833.735937-13-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261003210833.735937-13-james.hilliard1@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/1] package/python-proto-plus: bump to
 version 1.29.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, Oct 03, 2026 at 03:08:03PM -0600, James Hilliard wrote:
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

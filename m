Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 078D6606A31A
	for <buildroot@archiver.kernel.org>; Fri, 23 Oct 2026 18:41:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=fpb56vlP
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CE466606E0;
	Fri, 23 Oct 2026 18:41:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 11tsU9HWU5ox; Fri, 23 Oct 2026 18:41:50 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 719F9608E6
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792780910;
	b=jrXv9j29obTMdodHGgKM0KwVxMtNdgAHwl678M0SCxz1/x0BpMJfYcgZT5mrDZ36wJKW
	 7FaH6blz0oNFHdnrfjvKztYgreDY7NtReu8HPBAgTJf2BOzKiU33+9SptgwFAOLT+SkZX
	 ZkVJJWWzfFx28OD3p27+ycjTcY4yBzo8WRQPBf45z+uRpECktN/wKc04jib33SMU0RWwB
	 x/HGLWvIXIrSk/7uplTW+0+B9ZQwzhvcfXpirJPD/MkMj9R/KEVOyTmSDSJauR3s+mRnZ
	 qFbxBbgI1G39MGO+Gq/KrArllMv+6cMOb9TEHI2AGbugdeeDjA5v7MxysaGuMf+v4LQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792780910;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=maPhcDxt2E/CTXLdICxI53WqkbYnDhVHRjnafgH6boM=;
	b=oO9jGjGZxfvIs+2e9kFYiGk2/PBPsBONIhR02qfXGd+HSda2wSPq+EIuuhYM54lK/5Wv
	 geKsCUL7ZTVIV+R2EdBnC0W8Uw3QbopgBxEFhMF/vncrQcnF+Nq8y1dWiUbFQt+EaRBkJ
	 H0xbkBqAlYDoae+VSI298qxeSUPqTuQTWirE1qHY/Flzypk2X45X6QWmlQj6tb/PEw3cK
	 o62+uWHRGfZIlDNXUJ0C0OjGPPgUa1oaafb4ikNh5o7dTQFYI1YUbEEeSVryym7AAsDbT
	 39i5CGETGw3E/u5MCxrkLvjLWEUW/8Mqb8v7PvVvNwbN17/zXrgc3GnlT1q38z3Xpcg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792780910;
	bh=maPhcDxt2E/CTXLdICxI53WqkbYnDhVHRjnafgH6boM=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=fpb56vlPyvbBGx8F+NyZo9HGoqreU/ASyDShqgfXn7C2GqbNIOdHTOCabr78Dt2h0
	 PMQERlm9mvKb1jzGkSEhpF9w48cTseYguMwQYVq9NwjWzfuqCZ+HAZfayagmm+F7hq
	 1qVvDDfqf6iF2J2g01jdm01l73tPGVFoAA7jKGW9aviclzeEirYmzkfGqA7jJhSFht
	 h3u+m0XObJITrqsl3bQPmBqfvjXtkd6yA+OzvG0A2IUsYifCmKHBb84fKvAO+tKFRq
	 lCEa4fweTlKournR0wtzV3HeNB+1ZPQTArvS7tLbo4xfg7Kjn8rKkhTVtgV3q0TGez
	 wd7R9MTAsdURw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 719F9608E6;
	Fri, 23 Oct 2026 18:41:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4FF07235
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 18:41:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 34BC140A42
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 18:41:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h22jeYdx1qKC for <buildroot@buildroot.org>;
 Fri, 23 Oct 2026 18:41:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org A2EE840A35
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792780907;
 b=pho1hBg0HpV3J/Ju6ee10cWIDRsZlXptzCbnPV++EF7Qs9y0lhIuXXGq475nG48UQoxa
 Z0KGRm4hzTBcXSVZoRQ41dxNs/iYtakpGJJdgAabJQV/Yr+tVbB2XCpe6KPr6XlvtYdsU
 +exaax4C3VGqXs98AfIlIbV56eA0j5cSV9Hkoi/tqzPniiYEi19bIUCsHe4ZJxOuTSl5y
 3FaiZHcbuFYzSM3SdPzb8b/t609rVn0xnnqocmyYfDJkakveTUT8PxfeEXC2uiUIU0m3c
 F+nMpWujOzEqHHF0HMe1OYjXbtCUf+tAf8amB4ItqGWEqHMaHau7KK+FW2ulujiYVKw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792780907;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=WK6ptcXVJItev0Sy0Olcml7PFOGCGlFvzewOpje5TB4=;
 b=L4nG1QGgrgeYgYpi6RZHOiQih+9mVrsK2+IchXR/gLlUjl9d6Ln7F1s8ICzxxX76vDaJ
 wEpDkiImr6NZxjfYThAfOwP2aG6+XnGxufPLfQweP1yHAD8dX8l457RsJf/pqPJ+9cIZU
 4+h1w4fESiTwUBpy87PsNRpCqBg9B/do0ee/GWViF2iTh60l7fv/3T1+J0it/5oErQUaB
 XyLA9Xxm90ck8M+INCRo1X8QP3ccy41V0vrgYTZRIE3ONMjYjGboXWFGpFvtCodULt4ot
 UCKVBubO6I2yFSEp+z2ZFH9QIyVZgS4iRgSTrX6fGigpdxtOyjlapGGHSWOSdyakmSA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=VvYPww89; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A2EE840A35
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 18:41:46 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id E6A034E412DC;
 Fri, 23 Oct 2026 18:41:43 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id A754460398;
 Fri, 23 Oct 2026 18:41:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id E819B103284BB; 
 Fri, 23 Oct 2026 20:41:38 +0200 (CEST)
Date: Fri, 23 Oct 2026 20:41:38 +0200
To: Waldemar Brodkorb <wbx@openadk.org>
Cc: buildroot@buildroot.org
Message-ID: <atupnhi22O6wWwIz@windsurf>
References: <aq4_lUtScguSDLRY@waldemar-brodkorb.de> <atfRLgIqqBBd6TuN@windsurf>
 <atfrauVhAXrHeul4@waldemar-brodkorb.de> <atsOH2BI10KVAnRX@windsurf>
 <atszrpfaNpx3zWmi@waldemar-brodkorb.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <atszrpfaNpx3zWmi@waldemar-brodkorb.de>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH v2 2/2] package/chawan: new package
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

On Fri, Oct 23, 2026 at 12:15:10PM +0200, Waldemar Brodkorb wrote:

> >     arm      |          chawan-0.4.4          | NOK | https://autobuild.buildroot.org/results/35f6ff053723bf0d16ac5b425cf943bac01a4418 |
> 
> chawan needs fenv.h, which is only available for a hard-float
> uClibc-ng toolchain. Here arm soft-float is in use. How should I fix this? Any
> suggestion?

So far we have ad-hoc dependencies in each package, so as a initial
fix I would suggest to do the same: exclude architecture/toolchain
combo that don't provide fenv.h.

On this initial fix is done, a better handling of fenv dependencies
would be nice. If you "git grep -i fenv" in Buildroot, you will see
that we have lots of packages that have custom dependencies to
workaround fenv availability issues.

Having in toolchain/Config.in some nice BR2_TOOLCHAIN_HAS_FENV_xyz
options (my understanding is that it cannot be just a single
BR2_TOOLCHAIN_HAS_FENV, because there are multiple exceptions, and
some architecture/toolchains support some which are sufficient for
some packages, but lack others which are needed by other packages).

> >     or1k     |          chawan-0.4.4          | NOK | https://autobuild.buildroot.org/results/2aa8986b4161c9ce25d4bddf8c29d1b204893e0b |
>  
> OpenRISC is not supported. How would I express this in Config.in?
> Any suggestion?

As usual:

config BR2_PACKAGE_CHAWAN_ARCH_SUPPORTS
	bool
	default y
	depends on !BR2_or1k

config BR2_PACKAGE_CHAWAN
	bool "chawan"
	depends on BR2_PACKAGE_CHAWAN_ARCH_SUPPORTS

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

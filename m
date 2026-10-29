Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BF10606A31C
	for <buildroot@archiver.kernel.org>; Thu, 29 Oct 2026 21:12:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=QHMS5p2T
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2A77660A7D;
	Thu, 29 Oct 2026 21:12:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ak_KGFy_zqgr; Thu, 29 Oct 2026 21:12:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org BB63960A78
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793308345;
	b=ZZz71+foG05CiznNhG3FADnZB5fFrZqQU4xBfySexdCcOVtgGYQPyocZjZoS/aj9BHWI
	 QTSYKCSPL4+Vq+7fsNBPjpiuBJRplZhXqdWk7ns+yAm6N2hZ7qKKq4UuTXXFadGBs9yF/
	 oOaI6b+Dcwe/A/Q3dXAmihLD6/S2DPGk2EHGTHqIbZHUeuaX7Fje91oQGxxmceyckoQG8
	 si9YzAL2hx69jvY5gi/kexijIASA7a0GLd6u+YcDCswzonpFnpwC/1wvp505hqfW8e/U2
	 qcqUozw2pVUHuMVyE5lW5NGLsLklJ/97a2i/yF2xs5sn+yavLTDxXRjYPtbriPMV/BA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793308345;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=4GLShPDw3ZBIQGvMKnBDaS5+DvoreGMYr40gS72/utI=;
	b=lBArs2LW/L1EWRAwg6faAuZNZl/GMnOfPR2nzl8/iAGjZcb4Ud4h7dihzTZ8KXBfr38w
	 0uJq1rON8nR8ZX+i+M0sn5bOZNP/KKu7vatEoB4Afe+HONj4IrCCZA+zt6lbfESXbnCnI
	 diaxwwJi1sFCpNhiqH6DgBOM+vVBMP0RxfjABtZI6SPnYD5/SP4FUwlSkoHFN1Coxt6c8
	 g4Or+57uPWyTvJq4fcQmJNlqotYDILkYB97i0YfKw58TtfSMywmUSIe0zh8zx82jMe219
	 SsPpvl1Hws2D+wNVhFFDXc/aea1dHElUtnNhngbPYnikPx0MO/Z2bCZEuXmYC2AKv/w==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793308345;
	bh=4GLShPDw3ZBIQGvMKnBDaS5+DvoreGMYr40gS72/utI=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=QHMS5p2TIOU7QzLACPfqQyWnHP2MKcvCmOW107FJgzjM5bTlOvNdUVfj+gBCoktnI
	 QjO95Tu9tbJRqTfx0E3hHbLNfX6lCnxpLIapeSm4gl5iwhRNyauq9BcAj4PFd0mJeL
	 wWMWKnjGGfl+qDCd1t/N5cHSip4qmVLdBjI8vnkQr0YQ5/ukKNEdZJvs8iBpnuBjm2
	 MuzVaS1/k8KOnMYyqh+ZUNisQpuS5vDzAYKHAB1CxeQJWM6Dfd6wPNHHSTfsRt2+oa
	 hjCdMbsj7PrKUmSfGkAMUaTH7zPKB5XO8IC2Jd2A7b1D2j/fxc5PLdk/CQPNommf+S
	 5IoqoXJSV+o3A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BB63960A78;
	Thu, 29 Oct 2026 21:12:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id B278CD36
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 21:12:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9959B40A6F
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 21:12:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0bLmMUFfnkkI for <buildroot@buildroot.org>;
 Thu, 29 Oct 2026 21:12:23 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 21323407B3
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793308343;
 b=BkYLmLYkE0f1jQzRIu2SgdrvdZMtTdq+SmIJS3oCn852TxIb+cyoSYZQCvLUpFJ/2exE
 F/yA2ZYxw3pVW47VKrPaBczOMcbr4YW0kjohk7hmwfakueP3BZrhE/1oXbmzwocyf4Huj
 +bQJROgMjQaGaYYE1ukmPUx5IWWw1mSU5U8c4k1wTWqlid99t1TC47oSDOpIMmNXbRbdG
 YVj4/KniwzmfuLdzenqYOCbUYGLIiZjS2d3hPbpidyljQ3e/oxf57FTjA8XQ8sRkYrA9F
 sxH11zOkebNtOu6c+uJZYoQJ1kJA6OEDr6B34Sb3uAU1LJ8Wjn93MTcaLL1B6N8tVMQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793308343;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=OBLzBsAuUS5N7PAGCJ9yBoSI5JPIXPpWppbOUXlBReI=;
 b=IZSZo+eVY69ZsJ3iZE0F/iPu2PZMKcUcUbFt9ssRH5pdRhuEigDYvCo3OZ8KEJLgqIdS
 xWDOK41v/LW8YAgRY3xifoTZmpvfcRgjGWpGMFAnZQBy7YbUTM/wLIjqtEs7SzHakeehE
 jte8xbYJJzMCdMUJtxQV23Yx2JcT//0O+6NoWH6Rt74doczCg0HDArhkPQFJ585S2jnfZ
 oIS0Y/nUf6aBoFUybY5Wq8zPYoE0tPwCWacyGTXQPN+QeQvx2sYLPkw0K4PmOC3X5ajJ1
 tUEJ/bSXmVWT6vATmZALIM6ZYa8ZpGqI63NWHkv10+75DwHTElYEfZC3OYLgppCEO/w==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=uxEDcNXH; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 21323407B3
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 21:12:21 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 7BDE54E41399;
 Thu, 29 Oct 2026 21:12:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 41F3B6076A;
 Thu, 29 Oct 2026 21:12:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 87D2C103287DA; Thu, 29 Oct 2026 22:12:12 +0100 (CET)
Date: Thu, 29 Oct 2026 22:12:11 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <auOzktFWazi2guZ8@windsurf>
References: <20261029204953.1447140-1-bernd@kuhls.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261029204953.1447140-1-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/2] package/ncurses: install wide-char
 headers in usr/include/ncursesw/
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
Cc: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Oct 29, 2026 at 09:49:52PM +0100, Bernd Kuhls wrote:
> Python 3.15 changed its ncurses wide-/non-wide-char detection and now
> relies on detecting the correct headers:
> https://github.com/python/cpython/commit/383c7bd38a5f0923db48f67fda9d852d189921e6
> 
> Buildroot toolchain x86-64-core-i7--glibc--bleeding-edge-2026.08-1
> contains the non-wide-char version of sysroot/usr/include/curses.h
> which overwrites the wide-char version provided by the ncurses package
> during the configure/rsync stage of the python3 package in the case of
> BR2_PER_PACKAGE_DIRECTORIES=y. The toolchain package is sorted alpha-
> betically after the ncurses package.

I am wondering if this is not a defect of the Bootlin
toolchains. Their sysroot should be "pure", i.e not be polluted by
extra libraries. I'm actually confused why we have ncurses in the
target sysroot in the first place, I see no reason for that.

So if that patch is solely to fix this issue with Bootlin toolchains,
I would rather fix the toolchains.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

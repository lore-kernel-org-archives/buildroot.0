Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D40E606A31A
	for <buildroot@archiver.kernel.org>; Thu, 29 Oct 2026 21:49:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=VNQmw61x
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6CB278107C;
	Thu, 29 Oct 2026 21:49:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R4319LW3d58P; Thu, 29 Oct 2026 21:49:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 4E69F80BF3
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793310564;
	b=pPnEP+3YPgwpGYciriJ/j3LF/2HhiPBWyTFJId5ozjSLfh5Mi+GrQ9DZI7W0WUYl5CC3
	 SADA8pviPMDNDhuKIOS3F7+nT+gzAwjyrWbYjCiw4uALVsH7dMtPTHgsnYhfjrnM7OUu3
	 TVqe6oubgFryeSETOmtBzR8eHPslki7GFD5JgJV1wj9jh2jXhzAxijxbWYBL8vZNmt5m1
	 /rEm9eLd4mPyf2mF3n87duzCtRpa04C/FdSWKvgfqjA1+ILU9Pc8xfx6e8QndE0mgcJRZ
	 nx5uQ5Al2WR81Q4+CnrUbxlv0Ar9c6Dl45mnMU2mnZPXzrvcdzcE5u1HWA0tm04ia3g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793310564;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=7w2kMfV8eIrkm0UOIlIoKakkKx9gITVBs60puhCRAnE=;
	b=A1hi7o8YlC/+8DjP52foXNe/uELN7Cqphy4XSamqX/xDpo+bCnNGSuAp47JtMm8cXAD/
	 b1K1MSys+Vrjm22si5mb+z4+rL68D0AcSXaS6lz4AAWz7d/PadE2nPCtgpIECM2wfIl5G
	 b2GDadOze6R0e5tWKaEgI+Vb0b2V9tIUvmUES/TDpFy2yWvNqcnNSbUKkrWrYUFQ5M7Ty
	 t6oCzYqV+GQjIbzXdEstqd4JzCM60hTIsnMSREKviJ1+wiZIHf2uZ9n8Get64cU6+uAIi
	 z+r8xRCO3hjlH+O6Vmi5CDZ/bO+o4i6Iji/bCH+sqcUV6AO7pFQepKnx3Da4/55MKlQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793310564;
	bh=7w2kMfV8eIrkm0UOIlIoKakkKx9gITVBs60puhCRAnE=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=VNQmw61xjByx6FF5JNvmvaAjROAkrZveR1T/Fy4ucZsqwBFttDbHCUHekLUQRwC89
	 /2slzXopOp6dIBzRZS9S7t/kETdpT9Dd6MT6TxIROooDNaX0fUArYaHr8sd08qCP7l
	 8sFMgs8nqDTr5H9oPaCY86/qnc/x18EwZQXdX6/R6COkOsHNfPAWXmuyBG0DFzMhU+
	 fjI55l5UsuhW0+037P/clUKsucIXA+hbNcOZo3nkYNPVNGgaXcNEhpIfhrln+sXSbK
	 K4sNS15YsR/pmzqrF1/G1lg/oVjQxuiE8Dk0KIuB72WO5NV/aS7bk59oP+8663tEQb
	 jmhtu3EZpn+iA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4E69F80BF3;
	Thu, 29 Oct 2026 21:49:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2584B1DE
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 21:49:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1736740276
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 21:49:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pjTgXoJofl0z for <buildroot@buildroot.org>;
 Thu, 29 Oct 2026 21:49:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 7113340176
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793310561;
 b=IoaxPkLrkhz/TAv6vzdPHHoSp580dXLygSwI2zMQpl26B4OFmbUmxq6EL0MHhjFVSh+U
 lGyj7V8jjJkeaQTCDkdPmq+lwIgQ1omeAhBG7+oCiwVqA7c7/bJycs4q6xaPSpqU6Bh40
 IJ792sEI9yiwRZLeqjgdKteMUwpU8W9/p1NTjkDRVkqCOQ/jOoqIInFTAB3cZBS+uWskt
 vUk2VQg7kmjM7ieBw/sARu6vJCzT51hEdd4d5sE4srJddCNbsMJ5ACmnD829YUR4bUUoG
 CHcYbfxVOOogJCiDwKFvjm14A395v7GoF2CnSTZF2tHksOSFCVFnucVuQMTHvgLeL6A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793310561;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=/Ca99OBJO/8+4cdC0h2CSUVdqX/eGe328Gx+a8HhtMM=;
 b=FMKV28SyfjD2gpv29nYUrbSjZ5V0q/qO95srK0SvWeTgSZhNT0bWh59VwMiL4fvd9nUb
 6q5r4Y8xA98V32CF7OxuRN4S0jI+7l0yMjUyHziHWhcxL5xh8dooEgqUZp4I0JrGJ53en
 YUWkViSH/QSb6iFiK5xDtutufiMhi7a8aicy7ikD95QSCXBYHRPZUm5JeVEN5WisRZ3yc
 SFLzacaoUtDVm0gf/u6cXtJrfqefXtvuTlrX3vluczqDqjgaNu6s0PTEQADn+wrOS2jTQ
 ynt/z5nZJ4VkVAg1uzvEmhkCq/BLjxoOvhHwoqNujQDbl5yMSoOim9OiCuKyameamvA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=zALLNaSo; 
 arc=none smtp.remote-ip=185.171.202.116
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7113340176
 for <buildroot@uclibc.org>; Thu, 29 Oct 2026 21:49:20 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 1C728C49F4A;
 Thu, 29 Oct 2026 21:50:20 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 75BBC6076A;
 Thu, 29 Oct 2026 21:49:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id E8C89103290DC; Thu, 29 Oct 2026 22:49:11 +0100 (CET)
Date: Thu, 29 Oct 2026 22:49:11 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@uclibc.org
Message-ID: <auO--UQbUihysaGa@windsurf>
References: <20261029204953.1447140-1-bernd@kuhls.net>
 <20261029204953.1447140-2-bernd@kuhls.net>
 <auO2ugenOrGrEKGM__30665.5666836136$1793308450$gmane$org@windsurf>
 <pan$ae294$bd983f48$791067ea$427f8b9c@ID-313208.user.individual.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <pan$ae294$bd983f48$791067ea$427f8b9c@ID-313208.user.individual.net>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 2/2] package/python3: bump version to 3.15.2
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
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Oct 29, 2026 at 10:33:19PM +0100, Bernd Kuhls wrote:

> yes, I mentioned the new series in the work item:
> https://gitlab.com/buildroot.org/buildroot/-/work_items/
> 193#note_4120357815
> 
> so he can use the newest python version for testing.
> 
> My personal repo does not contain any python-related bumps anymore so I 
> will try to help Vincent in the coming days.

OK, but what bothers me is that your submission is presented as if it
is ready to be merged while in fact it isn't as this bump breaks a lot
of Python packages. I am fine with work-in-progress patches being
submitted, but they should clearly be marked as such, and the
remaining work to be done made clear in the patch description.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

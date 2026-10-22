Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFC5B606A31B
	for <buildroot@archiver.kernel.org>; Thu, 22 Oct 2026 21:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=DdGkDA18
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AA609409C6;
	Thu, 22 Oct 2026 21:00:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id usDJxwqvK10V; Thu, 22 Oct 2026 21:00:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 8B2264095C
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792702818;
	b=n4o4rRVExmK2dcl4Dx4eXFLRMKezW9VFCvaSQIhUyts8j4IlmFdKKWryUrqhLZrP2yPK
	 0iMcKEJPYVasO+hH52ICq/wz2KvKh6X+QPivZ+PyELzoqsYL+lnXfeI+Fihq3HOMCaVe/
	 C8xfI1ddBqvCZzDq3lKSLJ39P5cTgpaehlABMJ2ctRyKOZKuBFIbyhCwbxQfy1SB+q5iv
	 ut2fmVPFDiw/3Zg02+sr4gPnxIbyE417gBxAxNNgQaUHosboUZTrTZD08q6xoVbPtIetR
	 hrgSqcOvVdzNvpTAs370jGjVZpNP+7416/9CG/XcsP3TfYb06GymzT1n1gAbWRtkgzQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792702818;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=6yZ6fdap30djrWOfdO9M5QwhO/bPKwAnoqfFDIfRmpk=;
	b=KEaIRc8uPFTITWZygHfnayRME1aW2T+uiVmsmIOqRVW0imRiJBbq51/gMo5ZCblP/frc
	 n8wmO1djRX7n4zn7CLfpHkA7I/Cx4IZ2IxqLwQZysxMJtC88tDRPmjq6ZlUgJ7AvkkLRD
	 3PJ4GmY+/ZgJigt3GMw5NYVXT4uvbsMn9pYnLEUjMXflTuUkMUJf8cPnQdbTSD5YhVqxX
	 Bu/i3oiEvziJssrAEIftheBxOzm4p2A1hml4RwvF4ElrBuVkl+cRUd/yz2AIBwngjPdRx
	 SyYca5s9PvonmQwJjvou/DJJCEeKKN9v03h+DnvyjIe865r0JorQh08VqFCaafSjP+A==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792702818;
	bh=6yZ6fdap30djrWOfdO9M5QwhO/bPKwAnoqfFDIfRmpk=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=DdGkDA18Xh0IpVzDQkEidKipJPC813P37NIH1NiM5uDM1YFGqHG1GLb8rfAU3KZtt
	 q0XD2GQS20Puko7ZGc0SOvl6ZzfIRYAF8giHgjMuZx1eWLDz2wAIEKspkWunj+cGti
	 NRhK3N2W1PutQp+ay13RgdlhxdxtyIv2PfdqXbsArVY8jZq5JyOC3SyhnmQ5p/Ql+s
	 7lUO8XyLX29UIRauo5YHlBd9tofxo82YMkGlrIJZodvSWCv1smRgj+Or0FcCiwaHuG
	 KalxicrMUFn63vpyMuA8t3ybEEi+bH+eIbDXudKaMWRNa4gAlmNWOQ4OQLmU8reMKU
	 hyRDYnbIAAbfA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8B2264095C;
	Thu, 22 Oct 2026 21:00:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 177263C1
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 21:00:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 099036080C
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 21:00:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oAYi8CtFs4Ts for <buildroot@buildroot.org>;
 Thu, 22 Oct 2026 21:00:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 85F5F607E7
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792702815;
 b=C38cJz4scSgHWdJgADEP41nLhXyiz8AFdluoxKqOilagz2foLrMuvjIwV3TKfOhpp6E9
 5LFCFA4vHnJ0tzxsUxtTlzl1EExiCqwRk7ObYNvXJ6ylvilXDWv7DtMktmlszbJbankeB
 iIxNyCnRtEnQY9R4K3KJ3qhyxO5ovM35HbRhoIVor2jPL2qQ3KbCWoTFLN3vpq8HDCxWP
 AUtqB2qCW6Nk7wiCksfo1SMPja7hGE8esqcCcQ82m59tHV0yRzzahRChuN+qwRLGRXqU3
 1Q+Nns8LycUBeINBrQiTpkZz4CTAykHF1bHROY/Yi+nLJIsn9+/BbV6zUJdOevurFOw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792702815;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=zlIFHQTAa5NbKpqPlPvwMbsaAIK2enLfr6cwMD4ONGQ=;
 b=ZS1y4H9p76vA9Emi72AHoNbpzvmhdU1tURdeJEbm3x2rjVTmEFV3ASp5ZeOFBdraOe5+
 9Bk1ESYhBuyQja+zneEuLp4eZPhnxoLFIHuMd3rLda9rAPa6DkZ1KM2TUuFTSJCdz4ZIM
 7ZTM6HFVzZa9NMKKxe/Asf1Fn4pBPIW99CYJIxE2vfnral3Qodn17joOlfig9eyxOVm02
 +NCtwNorpy+FQC/imEX6hST5NtUWsKap3k4ecSgsUupEStucVgDVy7Dsxp/qvfuuyfC0F
 Scs4I/RrGNtkMM7pE9+c6LzGPCdfeukEAG/++qC17SLbmfM1z8n4Z/6euxcATLtBTlA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=aZhDDQxq; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 85F5F607E7
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 21:00:14 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 30B104E412BD
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 21:00:13 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 0525360763;
 Thu, 22 Oct 2026 21:00:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id EB94B10328501; 
 Thu, 22 Oct 2026 23:00:07 +0200 (CEST)
Date: Thu, 22 Oct 2026 23:00:07 +0200
To: Pedro Aguilar <paguilar@paguilar.org>
Cc: buildroot@buildroot.org, Julien Olivain <ju.o@free.fr>
Message-ID: <atp5VOxDUIBhdsj9@windsurf>
References: <20261022163857.11112-1-paguilar@paguilar.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261022163857.11112-1-paguilar@paguilar.org>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/1] package/libunistring: bump to version
 1.5
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

On Thu, Oct 22, 2026 at 06:38:57PM +0200, Pedro Aguilar wrote:
> https://savannah.gnu.org/projects/libunistring/
> 
> Signed-off-by: Pedro Aguilar <paguilar@paguilar.org>

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

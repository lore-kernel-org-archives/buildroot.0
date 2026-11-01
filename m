Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FB8F606A324
	for <buildroot@archiver.kernel.org>; Sun,  1 Nov 2026 16:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=TEkPDNMW
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2787040619;
	Sun,  1 Nov 2026 16:21:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BJfgkHQgQ1tt; Sun,  1 Nov 2026 16:21:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 488F6405F6
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793550103;
	b=bjBeap6mtoLXfvvvtFmSkTODGuxcce9sf2iAaa1QYe5kOpIAXQ91fRBdEvasnC3MPLMh
	 Isw1zDIk9mkRf3ZB5aeOe0gQvSVQXtl/064prdM163ifUJgEJBaaEF2bdYdytjQ+9hhz1
	 oUHyzqQEtXjA8T4rsmB9H0EL+5Fhl/v1DeNsqvRrlTsJa2/pSEsosTwRdFU0LngMViRRT
	 waOHyMDTaP2eMNZSviuxQUGI2IpYrlOkDYlhiPiVtPDbzlAz+drnaAm4B9fu8YOVtj985
	 nChcAhmBAfAZZyBYAOzRl4Usdmr049EQWwmIbjINLhT44ruJWGfwEpK2SHm4Ldd3gXg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793550103;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=DwBAqYtZtJvZmgHRmiYLYUkvu6TGZWpd9tvSPqq3KRE=;
	b=NWWCUF1raiPbP+S0hmoJOlQCl/0hpF9F3I3OWvErNT1TgkmCFSoOQyJM2Slg3K8nW4YF
	 iUkHu1XlrTu4y3FtTUlcp19RycziyozQWtvFOZkMrnJBLZ+rE7aOhkTHOpAfskAt6DDNT
	 6S1h3K8sPLTxQZ2d9RVMfX+4ACTOszKc5R4s/1vX+6VZ1jlqtIYwju43gIWYYVYP+I3wb
	 Ng4RHZvwNNftK1K2istJ1sWw1h1DP/D2LjwwkjitcHhVYg9YEw9qCo0EBetrzJeGFC7XA
	 zv4yQ5jT9QKanUfwdx4cVHSHJksTUfuxgVw5LJ8tkPVr9MXBb9skMBnDvDK9ie3N6Qw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793550103;
	bh=DwBAqYtZtJvZmgHRmiYLYUkvu6TGZWpd9tvSPqq3KRE=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=TEkPDNMWRVG6MAXarnTs5nUg3/deJHLOJSGjdctZfR3wfDLGB2+pY5VSYZbCm8o+M
	 5ZP4bo3bTks+IjKugJHZ9UdkhCma6Uf7yXij2gbMLietP1gbzEOOmra2CmYi2BM8iq
	 V9DeTXsdk5YrxVakUFt2wLwXS5SqPcQM61ZbjMhisRNMgfeFjZb5L87pPSdNRtRWqF
	 hzVDmCo0lUupbXZqS1hhGS7xVNfm03Uybd82J3tBAT2l5wJ6ulkQEiR0H0tjNpbOUJ
	 +h8nYScmyr/zl3uBRbCqdiY9PTvOfVb/296xq1ZuiVBwpB7C+5SkIVVWqFtJJdNXrT
	 hbG1/w4+Loc4A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 488F6405F6;
	Sun,  1 Nov 2026 16:21:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id F32F73A7
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 16:21:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D906E405F6
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 16:21:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y1Qmv65OafEX for <buildroot@buildroot.org>;
 Sun,  1 Nov 2026 16:21:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 4CE10405F5
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793550100;
 b=g4ImXlt3UYiEX14rF1TThbDzNJbId4jymyLuN5MAc9TsHd/GqRFsXW0V9Z3i0lNPT/p/
 05OvPb57jPfX3y90w/P943c03bXDMkRBFCOzA5FoobJsGpHim6l28QuKFeNYJDVViM9sj
 5fA6GUNSxMk9va+/3ygXWRzzN6vX0PbE8BCIroilNbmIMpNVbb0+T/9+Xdi7UELsNu76b
 d5VbFAdDsE+wUTWnSKjy5eVFXzh2s0d/BZMCOV9Q/6rS3nzwUABPtKJzRVfByHauTDBkI
 Qg9z35V3jufYKDDReb6K12EEw2Gp/edW39e1A0LIMdRLRCrpUOm1EV7WA2zxD4eu2dQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793550100;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=s2aNm51U8HGeB1vacczpW1rLopSILpt/JRbOi5IOCAE=;
 b=tZHwXPxO75FhIU4fSwedqvCD7Pg9yxZEizq7AnAJxlJpltBPw/Km+5E7hNVIg3x2qDLo
 BBPdghzcyn+R/NWsxAri/Fuj14BZJdm6VVDhtorF78y9lN6AcHE79fCxnaceoGlkacPF0
 c/j0xyW4PmPqZFVZ1EqkBk4fZ3pv22EZNxuK+IsoQRXrX/3gb6QYElx0s5c46lN6fhX1q
 FfRP/RymW+nmvrLGWxLUrAfJwo+STVJAlo/QBZL1I2X8YECZuxeTlcX13lSPenF1vpIyR
 nGMtMMMGKluGjp2ByIB/sNnfV2W1MwCFtji3rYAFp05nEIl1UJX61PbPK/vbQO28QRQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=ZbLJfesX; 
 arc=none smtp.remote-ip=185.171.202.116
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4CE10405F5
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 16:21:36 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 7270AC49F76
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 16:22:37 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 9EE9960750;
 Sun,  1 Nov 2026 16:21:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 982101032912A; Sun,  1 Nov 2026 17:21:32 +0100 (CET)
Date: Sun, 1 Nov 2026 17:21:31 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
Message-ID: <audnBM3mbusqcYIr@windsurf>
References: <20261101104910.1700974-1-bernd@kuhls.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261101104910.1700974-1-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/2] package/kodi-inputstream-adaptive: bump
 version to 22.3.24-Piers
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
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sun, Nov 01, 2026 at 11:49:09AM +0100, Bernd Kuhls wrote:
> https://github.com/xbmc/inputstream.adaptive/releases/tag/22.3.24-Piers
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Both applied to master, thanks!

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

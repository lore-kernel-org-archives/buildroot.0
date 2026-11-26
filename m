Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D04DF606A31E
	for <buildroot@archiver.kernel.org>; Thu, 26 Nov 2026 20:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=hZ34kh88
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8CE1960B0C;
	Thu, 26 Nov 2026 20:23:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fuFTnP7iLdQH; Thu, 26 Nov 2026 20:23:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org BB95360AE4
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795724587;
	b=C+MnAWqQol2CfxeBFynbvxaX9Xpr3h5Ek0jqGkUDpNGRopz5ZYWQsiLwJKpj6k6Vs1pO
	 W8mQkY0IP05/87Aysjat57C+UqrCPmhhGvIblHwgWlLsTxnMkFQKyvYXSEkM/YbVuqD28
	 sA4IoB6/UJ+9leU1uFkFZZu8qTNkKGEHlkzOMqrfen8tHgysXGXa+1Rt8ua0duZz61nj4
	 T7GiPT76jYEtp/PGFkKEmm+o2PRxRLq4fk0c+KmRDMv2SCbfjnME5XLCnBL0E1G26qYhm
	 pAW99Se6uZjnSiTtsfPLgKmrFpL+/euTyMaoquo3Wl4+V8ATT1ezdt8c9eGUJQAFrJQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795724587;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=YigC3cV36b+D1X9PLPHN2AESiYO0aPESKffFDESK3pA=;
	b=rJ0P5iwCE/XYIq6jynqFfeMRHexrLsmM5mWrlm+miz/JC3NQe9pX9JSuDhigrhXP/ZnD
	 gvOED+oVw26fhpsHR0w26rW1zj6ywNgBJM5v2zfX8aSyE72e+TrMXjJ/RKEghYdoKPseX
	 CUt0GJevqZSRl4vFLUA4VbYZw9ekP+UpisZ0M+w6uWe3ALfl9hpiNSlEt0KrqoYqdX+f1
	 arRxiVbJ7nZEsEgjJwzI1IWwN0qkaSeLJQRnIVM45+KZ/1/hpj376U/1sQgQm2R8itb7V
	 FYMMoP6TIBFXJocpr9fRmmjajxL9oogbMmAVqwyjQWWIcTWeyjFPU9Labg6qzPscZPQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795724587;
	bh=YigC3cV36b+D1X9PLPHN2AESiYO0aPESKffFDESK3pA=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=hZ34kh88X9GjzkMsoySjmleWnPeulK4z7Juz1xadxjl0JnCrTsEJa6bhvInRFwJ+7
	 hA7AEy+6duaev4sat1B33nY6i368EfHCUIIRzgB5Pout8YFDGIzeHPIcnyuqwX3O0C
	 JMAVeRaHnmbOXRFtzem7TMh8STkYica6yfNNa9rLoVNW/Fp6kNlD74nSuX4ZD2QdTJ
	 lmecHPuemd0WNPT2YrRC5TdhBGrofrfSgpQW0J+OmxKlnhIkcZQwSR4WGCH3pmDspM
	 uwlDeYIb6+YJRDkSzYQ/oM+cxJ5KdfydUex1LR9ixzaUqTcfP0XYpRB2HRAXJPq8yH
	 zsNm8uLGkJXxA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BB95360AE4;
	Thu, 26 Nov 2026 20:23:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 52767266
 for <buildroot@buildroot.org>; Thu, 26 Nov 2026 20:23:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 43FA260AE4
 for <buildroot@buildroot.org>; Thu, 26 Nov 2026 20:23:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kjItqNJA9k91 for <buildroot@buildroot.org>;
 Thu, 26 Nov 2026 20:23:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 35A6560AAF
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 35A6560AAF
 for <buildroot@buildroot.org>; Thu, 26 Nov 2026 20:23:03 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 9FE215FFBA;
 Thu, 26 Nov 2026 21:22:57 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by localhost with HTTP
 (HTTP/1.0 POST); Thu, 26 Nov 2026 21:22:57 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Thu, 26 Nov 2026 21:22:57 +0100
To: Peter Korsgaard <peter@korsgaard.com>
Cc: buildroot@buildroot.org, Romain Naour <romain.naour@gmail.com>, Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20261126174957.3194898-1-peter@korsgaard.com>
References: <20261126174957.3194898-1-peter@korsgaard.com>
User-Agent: Webmail Free/1.6.22
Message-ID: <2a5aaac91fa2fadbedbe77da634469d7@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/{glibc,
 localedef}: security bump to version 2.44-92-gc7f65355ef
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 26/11/2026 18:49, Peter Korsgaard wrote:
> Fixes the following security vulnerabilities:
> 
> CVE-2026-100290: Double free after allocation failure in regcomp and 
> regexec
> https://sourceware.org/git/?p=glibc.git;a=blob_plain;f=advisories/GLIBC-SA-2026-0028
> 
> CVE-2026-115819: scanf %s and %[ one-byte buffer overflow in wide 
> character
> conversion
> https://sourceware.org/git/?p=glibc.git;a=blob_plain;f=advisories/GLIBC-SA-2026-0027
> 
> CVE-2026-121758: ISO-2022-CN-EXT decoder may read past input
> https://sourceware.org/git/?p=glibc.git;a=blob_plain;f=advisories/GLIBC-SA-2026-0030
> 
> CVE-2026-126765: Double free after allocation failure in glob
> https://sourceware.org/git/?p=glibc.git;a=blob_plain;f=advisories/GLIBC-SA-2026-0032
> 
> Commit 2.44-49-g6b48c0b29 has now also been marked as fixing 
> CVE-2026-86805,
> so add an _IGNORE_CVES entry for it.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

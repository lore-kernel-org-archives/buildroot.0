Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB9B7606A326
	for <buildroot@archiver.kernel.org>; Sat,  7 Nov 2026 11:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=ars3NhzW
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 93B374078D;
	Sat,  7 Nov 2026 11:13:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Tr4_pQAejXlv; Sat,  7 Nov 2026 11:13:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org AF6D24077E
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794049984;
	b=tFsw6tM8E+83XLLaXPneIwXpnEwciesHMPLsxuE1a62brw8NvPG7+mP3OM4ThM3J8hqy
	 gl1jJ3VfB3eliwzO0CBbThfLv7fE1ZUGU7nSzuryMdprr2FqOEUZ8vTKrOfc17obj0Ia8
	 n3cdLkY/qaitjbd/h354A7E/ykUGYC8OnkYcxeim5Ru+820mdEbu794JoPEVZ/1HZhRzX
	 jCaUAuM8FPGQtGn/ZUBFNZptpMD5Jj6XNkKYa+VAUyQp34W4yjXXjh1TUddKgDewJycCz
	 ZE0AsWGuXs79FaxCamTsPIWnMzugBHk8Ur0NXsU+HVbG3hKeXXb3HaV/B32GRkS8NjA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794049984;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=Anl+eg3vqSnoAWzpkjxcF58vHD34r8jcbU+xoXLgOxQ=;
	b=HINtuzbdsWRaAqPFXwpOUunvyKR14h5OFcUPhLTgSmyrpMxLMgCjRZuitrVGSipzVGvZ
	 cA5En9lbCkc0keurjbyBY2JQw6C1pvMkb8RWcQf8ERXsuiUyti7nyuJuxD6F5BJC82xgp
	 JTrZvC2WDDv03E14mGpwgV3/YS6Ch50flLNG2vhjwnIOXc+Nl2sMHaR2MuwQWpPHLc2uy
	 sxztJDnFXPT3/7pEekUlMzswzTcRa9zZBCtX/F49+85s3jViNVE7wXtduWtnZ3lBEOwhq
	 fkiNsgQI1tcUMqVdy11PO+Hey3XCXOhtOhCzaczv7hTqCJB2sK27yJHqgfFhQXv/wlg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794049984;
	bh=Anl+eg3vqSnoAWzpkjxcF58vHD34r8jcbU+xoXLgOxQ=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ars3NhzWApEETMzNH1SU3pSdFm18v/JAj/YNZEds19L6HL7+bUpVjmai/RvLtIC+L
	 vcu+Qu9e3pkwZlouhBzU15eXRY5Jgs+qJ5KbCrUjtGL5DyGmXE+NZIqt/7Ukb0eJPH
	 shzj9OngRjTNM03rMOhoLIMdKtLQuP3+vwFvZ23NCr2xeBqOvAlzI1iEgxwVway8WC
	 Ugb+hQ2A8iRbNXExsFYPfOt4axa6+Ao812eGdHAydAfOAqqHlcibtKZNAt8JwyP5U6
	 LeG+Rn2maXPJaK5Z9oyX8j52eznjdR4s6z9v2zT/bbMttiiVsPyqXM8w9ZvRBgVLO3
	 Gvfbc9AENVs9A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AF6D24077E;
	Sat,  7 Nov 2026 11:13:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id BFD0934D
 for <buildroot@buildroot.org>; Sat,  7 Nov 2026 11:13:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A617B4077E
 for <buildroot@buildroot.org>; Sat,  7 Nov 2026 11:13:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SzuvRmK1_9Gh for <buildroot@buildroot.org>;
 Sat,  7 Nov 2026 11:13:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org D65314077C
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D65314077C
 for <buildroot@buildroot.org>; Sat,  7 Nov 2026 11:13:01 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 69C762003D0;
 Sat,  7 Nov 2026 12:12:58 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 via
 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr with HTTP (HTTP/1.0
 POST); Sat, 07 Nov 2026 12:12:58 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Sat, 07 Nov 2026 12:12:58 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20261107081017.16144-1-bernd@kuhls.net>
References: <20261107081017.16144-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.20
Message-ID: <6dd9e18c3701d678eaf6877c5e65529c@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/1] package/kodi-inputstream-ffmpegdirect:
 bump version to 22.2.11-Piers
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
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,TVD_SPACE_RATIO
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 07/11/2026 09:10, Bernd Kuhls wrote:
> https://github.com/xbmc/inputstream.ffmpegdirect/releases/tag/22.2.11-Piers
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

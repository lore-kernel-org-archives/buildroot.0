Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB492606A32D
	for <buildroot@archiver.kernel.org>; Thu, 12 Nov 2026 20:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=g6AHxZb+
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7AF108174B;
	Thu, 12 Nov 2026 20:24:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9vU7gLKDUpM4; Thu, 12 Nov 2026 20:24:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org A79F38168D
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794515096;
	b=Af2aQCAcnGm/yL+6mTiPahfSL8lEeW/WJXlLnNRTrFfbSkCFipV2MLBcDjbnHg6Qr5Sm
	 xl4WSIHLEocr25d8mwaTn7DsqytvMeLWYsIrfV1enbG+Zo1coUy7oPqMpYqL+GkxO8Tay
	 MQxgy5ZZgfUq9IoXdQhZsbMHnOTT4WlyOiTB6hwGlQDmKX7TgpigR36AYO6E4UB/VufVe
	 d1J5CLvusgmGdpsn0NlID2tgasCrdKXXJ0KY+JJB/rIHX8ObzaUxLEz3grU/p7HoezCUB
	 MYtqplaIpDL/mqDbRAkwFWTldq80xrejS9vbaHNDu2ylr0IlQ4lhVReX/Lj3TQLBaEg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794515096;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=7Gxu10UhR6+DDRoO1cIOl+rNo1eR8dcBZQRqxHRNw90=;
	b=WLwsUKR6jJUGXnCe+3wTzYZhLW0zOzzRKgQD3vkEKfRy9F1yWmMzdjMD0KvCMnAvGTVN
	 AVGdlo9lTrmfmnJm/MMeIC9gtVSfae/q2iU0du3hAeWI0wCY/L6BQg4mIC90mPjD2PIc+
	 oAFGDOFipSzHlE0EnKjXbRoTOqXPpKp9XjwH8P/v58iIvNTnTOfelAijrhHheYuEVZDQE
	 j3pp1dQGrlTi/e+tamFY425uCovaziXN4QtSIhNGelY03EeS0vCOltNNC69KIbZrw1jD7
	 f3GDGE+k+Llm8MtW5b5FyjdvBPLZZKt3GCKznxvWD2vVWJ7+XygFDEcdTasxdXsRoTA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794515096;
	bh=7Gxu10UhR6+DDRoO1cIOl+rNo1eR8dcBZQRqxHRNw90=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=g6AHxZb+Y8H2HN/kdWQnYDGq9cdW7zgB1NHFoIBrS5Mm1Ig5mq6sIV+6Ws3zvnFx+
	 GrpjQEkiUZy2ybEryCF859wvfTuLC/4Qy9RB8ulOCut45QcZiWecOwHHf0nVx5YaJT
	 zbm+OXe9G4+OktMJHe8ePo4GpI/YVXiwkcPJsvYSPFHuN3GjwQYemTpNdSRXQNihGm
	 I12jy3yWRBMX5dDzBm5hT4TNJJMbCsifyeetmHZf4Kfw8C/Qm6VzulrHebGgpf6rAz
	 xOsI/Xha2uFTYru6D4epFYs6nn53dg4DRSBtq5DJETzNTbCdPq6e6RO8RkPvN97w9u
	 LFgSyKfX70B3g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A79F38168D;
	Thu, 12 Nov 2026 20:24:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 155F7F46
 for <buildroot@buildroot.org>; Thu, 12 Nov 2026 20:24:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0712D8168D
 for <buildroot@buildroot.org>; Thu, 12 Nov 2026 20:24:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yAz2Qf4p7vJX for <buildroot@buildroot.org>;
 Thu, 12 Nov 2026 20:24:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 1B96081689
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1B96081689
 for <buildroot@buildroot.org>; Thu, 12 Nov 2026 20:24:54 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.4])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id F38255FFAA;
 Thu, 12 Nov 2026 21:24:50 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by localhost with HTTP
 (HTTP/1.0 POST); Thu, 12 Nov 2026 21:24:50 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Thu, 12 Nov 2026 21:24:50 +0100
To: Peter Seiderer <ps.report@gmx.net>
Cc: buildroot@buildroot.org, Bernd Kuhls <bernd@kuhls.net>
In-Reply-To: <20261112192007.1759828-1-ps.report@gmx.net>
References: <20261112192007.1759828-1-ps.report@gmx.net>
User-Agent: Webmail Free/1.6.21
Message-ID: <72f87bf56cf1afe42bde3658c9fe1c52@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH v1] package/apr-util: bump version to 1.6.6
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

On 12/11/2026 20:20, Peter Seiderer via buildroot wrote:
> - bump version to 1.6.6 (for details see [1])
> 
> [1] https://archive.apache.org/dist/apr/CHANGES-APR-UTIL-1.6
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

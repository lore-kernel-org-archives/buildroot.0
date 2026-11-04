Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D657606A844
	for <buildroot@archiver.kernel.org>; Wed,  4 Nov 2026 22:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=WhgNdPjJ
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 28904607D5;
	Wed,  4 Nov 2026 22:33:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mmGm44TSotVe; Wed,  4 Nov 2026 22:33:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 0434E6081E
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793831598;
	b=O5tYLW28aF8f0BayNF1PcvwWn2yY/OicZODfK1EsoctunX2KTsLX7YQona5AEp8unj1E
	 Lat3LFuWmJPf/rQetdx0XnEYlERgWCop/tFWj5/6W2uCWnBRtZVzSSIhTJj2mI28si0sc
	 7vHdBBcvaHuKxyfgEgQW/PpC1NWw3VGavWwIeIANQomoBXnWOyVERmc+MyOk173V4cWCr
	 sH+yRlZnghFuWwFPAltQfrGk4GJrebUm+NguXRRb+C4T7IQDVNlVzUdMgaEBcWP4fcYWe
	 VOz+NfZfgGvMwMF2q6gAimOJ0hkZIxDijOmhnGBpKc1GyHZ0+1t32/FDsFwipAyj5IQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793831598;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=EKw76r+vL3OCU9UtlSsFlbXz2bu7IfGDqrS/vUHt49s=;
	b=NgcNTtSuSckP86t3NkJ/V7VGy4KaJP8rc2pvNbxmmiEpah1m5pqdEAq1EQjZVJOXu7YT
	 WwTyQzh5Csh/Tkl++tQNuDKJ8IlB/Km1J3MfS7l9p8aLpOQxcOIXPra1wCjvSyWGvlB3+
	 XDUHs0uB9EqTJYlACmWI/XpW0nNm0iv8Rea76BHcckNk693OZXTXiH3ilAw9HMTG3oz5F
	 /hIFRNPhMYwMF7yF2i3QmXFioIVI1BHQI1+h4GGcRmTitaHhTq63tBCUN5q4uJiT91Gaf
	 tw+VQ2JqLGIp9F0FJK3eAyvty0uPnUloNaM4h18vLtEpX2Bx94cOvp9KVWTibxmkSLw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793831598;
	bh=EKw76r+vL3OCU9UtlSsFlbXz2bu7IfGDqrS/vUHt49s=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=WhgNdPjJJZVXAfmm06cejzWxGbwzwUp7L6FFaizCEaOCEzVbCz/uC3DuOCd/dkaEi
	 nAI0wTI7jm5kiEl9n0OXwkgG5oJcJDX6YyixwBLtTxK/G57SmaOa9JBVn8ZZ1iC3Jp
	 VbJWOJ/mnY3xLgOM8nrguEJecSoeRRGxgcFp+qz+neUHbQS6qVeoHAJcJjCs7p4ePN
	 Ka9nH60upLsllOMjlfXqGAd0+zr+RTRfG1bejffIHT8GUvzKDzp0CqBMzbxOobEqc7
	 lp5N79QuazQbrHVGtwJ7sSN7wJstGqQSWqKtuzDWWdilY5K/qTMKhObJ54qo4UyoEX
	 C0S05Arb4/7zg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0434E6081E;
	Wed,  4 Nov 2026 22:33:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 75924362
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 22:33:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5ADE240867
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 22:33:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cuDvjB9zhQyN for <buildroot@buildroot.org>;
 Wed,  4 Nov 2026 22:33:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org F420940866
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F420940866
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 22:33:13 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 78F634E403FF;
 Wed,  4 Nov 2026 22:33:11 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 4981D5FD65;
 Wed,  4 Nov 2026 22:33:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 5662110329262; Wed,  4 Nov 2026 23:33:07 +0100 (CET)
Date: Wed, 4 Nov 2026 23:33:07 +0100
To: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Cc: buildroot@buildroot.org, Jesse Van Gavere <jesseevg@gmail.com>, 
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>
Message-ID: <auuynxTCce3WsdjI@windsurf>
References: <20261102085501.2118632-1-angelo.compagnucci@gmail.com>
 <20261104210907.3544694-1-angelo.compagnucci@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261104210907.3544694-1-angelo.compagnucci@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH v2] package/qt6/qt6coap: new package
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

On Wed, Nov 04, 2026 at 10:09:07PM +0100, Angelo Compagnucci wrote:
> Qt CoAP implements the client side of the Constrained Application
> Protocol (CoAP), already available for Qt5 as qt5coap.
> 
> Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>

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

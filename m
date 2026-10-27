Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F0C1606A31D
	for <buildroot@archiver.kernel.org>; Tue, 27 Oct 2026 19:55:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=qyPaqWdB
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 459C1606E3;
	Tue, 27 Oct 2026 19:55:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OU7KDsPVVyX5; Tue, 27 Oct 2026 19:55:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 72BB0606A8
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793130943;
	b=C56oHOnvr6jLQdsMiZknkez3XKCJzjOD5QLn7ZWrs7nd8dwUO9wBHtZNdpQh08m+lDbm
	 GjQLupiJJk7t9aYoOQDrCcvuYCDZHuaLXpUItnjwV3tXXyhFd9iVyTob+c2YHJt1hWGjw
	 o5jg6Xw7b6yAMB55uWk2FDYp+IozRc7l7NlkaF/EpF5wS7bQ/li7Njd46vvMVYY+MDnmt
	 etnkezxIwJcf7HpZCoa2rlTgwAH2PBzAGDzHjevW2kHDod/7v2coWAT6iMT07qnTfvXOw
	 T6wlnibM1x3+3ud9ySz9Jr6WcsyzF0yTX/aCtFdn574hVbV4zF9fnn60SjLriHuNqZg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793130943;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=SnOmVI2Vx4GO7ITRbdyg1ktfG/6dnLyaMuQBfoNtMMw=;
	b=RgE+f4qmBaQQo+yg5GRp7gmbN0DHNBYHWe6hQiB9U7hC9dNyWb2NiRj2dpDu+vCRAZ0z
	 tdPYEV3FDToOKjUhU/hX5JRmzG7V5SFLaRZU5T16J6IqRD/l4wE9/zm2AfTBG490fxniv
	 KVVD8AQNz5+13ZjsoJTxwsfOfeD0UhWwa9C/sJ5pmUT272e7zegJTpS5B/6tJpWDn+ERf
	 FzWBihdcT1II7yVUp+70gQb8p9yu1EPtwJWungpaKJsPfBEMD9Xn8W++RnE3G+pXNetDT
	 YDc0JhA2MXmupw4s1qjm3nnJAWGkEHCL5FhYpR6LMceQyRbBmPL0KvDoc4C8RhiDfTA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793130943;
	bh=SnOmVI2Vx4GO7ITRbdyg1ktfG/6dnLyaMuQBfoNtMMw=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=qyPaqWdBezcHI+Cj0nX5bTYEfCdGgrV/phk2ygRstDPBpZRFdspYqIj9U8a3ksaZQ
	 8++Q9RyomFAX/V2PESgQKfFaH6shdFpCGoyIgNNkkzNejM+lcUn6jkx+WSOUBcx/rA
	 1bssh3eLK5ZFbiLD1izyoNveyma6L1bDXmFXranDLsQrb0kAJde6F0c2bi1VWO/rLR
	 8IuwJQQ/GVr0FxsYKzg1l1lHw5V9WQ2RLdTQC/YQStRG5xSnTY/YAXS44shfhqEOCv
	 lL0/FUU27TUPEqdT8VICuNp2XF4csnEwTkLto+q+Qn7jstAWRkwaIifCxYmVy98EK5
	 jlRShpyosyznQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 72BB0606A8;
	Tue, 27 Oct 2026 19:55:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3468E529
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 19:55:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1A36B606A8
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 19:55:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PRVkZnUyNEc1 for <buildroot@buildroot.org>;
 Tue, 27 Oct 2026 19:55:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 2B5B260653
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793130941;
 b=ObxhRy30YWmqIvsdcgZ0NE2MGcnVRksSlJ4TCLcr9xSjBuaUdkRFZwz85D4tBDcjwE9S
 czfjnGNJzYURZd76aHkmS9UpHzzVPFLa2XV/p5nn+gKeR3XcjMubPsMforbbuMVOFy5wK
 JsXBJ7omZPOLgtaCfKR0T6iJSKzGe2m6SgOO2UUnIIdexJj/91+qVpAMJ9XxiqKhuhZz3
 gQMP/bzgXiJiieguu01tewl1GR+oBig2LmNivOHzYsO05O3AY3xUcpu6N9Vk+Z9dbxQKG
 bC82x45qzo1j2Bnuv71gYLylrhgQPL27Kb8Qc4AeUW3hXp1BANTrArrhWC9d2n+M2bg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793130941;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=l809K+BBJq1sXZh+Aaeumf0LCHca0dYkAeygbChVzD0=;
 b=VDNzeLcEV2BGjz1kgzEMsZiDjevykrLySNPrQjpw+6jyyofUNDOJ+0RuTNscv3MSRRpA
 z7JCoxEVkA23a9Mbick6hsV2hXPOJWZM04a3KxZzQBFtxZ524v6dTxNOxS6HNNEqflMkP
 Vtf9FDT3hdz4SnMK7SlFV8oaekik1xR6FSNA008uuAMRiLuvQPHj07FbYIk6ldLLOmrc6
 yrfVRM36SB+fvGwclUJNuvi2CF815dyLpiG762oLLqtjRxLeRhxDSl1cswvxOKNkAFL/w
 TblAcBv88pMAgUwWtXizEhq8uUe/31JYmKNUeMgmtH9aPMq/TxGFnQD7eaQ5L03BAOQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=GnjIMmCE; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2B5B260653
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 19:55:40 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id DE59B4E41336;
 Tue, 27 Oct 2026 19:55:38 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id AB188603BD;
 Tue, 27 Oct 2026 19:55:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 80A80103290A5; Tue, 27 Oct 2026 20:55:33 +0100 (CET)
Date: Tue, 27 Oct 2026 20:55:32 +0100
To: Adam Duskett <adam.duskett@amarulasolutions.com>
Cc: buildroot@buildroot.org, Angelo Compagnucci <angelo.compagnucci@gmail.com>
Message-ID: <auEBsIjES8TW4YGW@windsurf>
References: <20261027164013.1602502-1-adam.duskett@amarulasolutions.com>
 <20261027164013.1602502-4-adam.duskett@amarulasolutions.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261027164013.1602502-4-adam.duskett@amarulasolutions.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH v2 04/14] package/mender-grubenv: bump to
 version 32e10c0b
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

On Tue, Oct 27, 2026 at 05:40:01PM +0100, Adam Duskett wrote:
> Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>

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

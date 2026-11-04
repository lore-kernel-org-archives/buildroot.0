Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB408606D4F0
	for <buildroot@archiver.kernel.org>; Wed,  4 Nov 2026 21:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=B1mNuGTz
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B05176078E;
	Wed,  4 Nov 2026 21:37:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O9-PUGhYZaSF; Wed,  4 Nov 2026 21:37:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 8D19E607B4
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793828236;
	b=Kh2bPgURcIwIxZjZeCTVMsPk9CLcWleHpf+F3mPXzdPB/jVM4kIdNCxVw3vJbWe0DOYJ
	 tIpiBYUL1sSmm1S5uLiX4R3QORTgT4oiRv0f78549o8tfLffd+CRrfv4SddYr+nL8+19V
	 gNKvJqFIge7lzwKNN0TVk8Rv9s0MEXINunmd/vAouMSm3PmgnXxOrfsrVdIgpZCOrjqsB
	 gVLqGjlSaZdMe6dh1m8gVS4L12LXu3WmItQzlTDA+jssF7AfhRdqk5NPFpMApzEmJIkzP
	 ZX1VR49vwTi4BmgNB1f3XmkGf8PbjMH7NUI0vhdy5xa2nF1gDKZP4b6ifIzQCUXcpIA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793828236;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=ysH5DQGLef+tYyaqEloNN4lwj2II6O1j7QNyOr2Ow0M=;
	b=eD7ZYKo4V85qPsr2XiHJxc1Lk0Oa4VAtr/acJ03X9ULQWjptYwhJWmLjipk84bBKNxMd
	 Te3J2xXfWpLb9GqOfaO+y9tWCrPvZRHtdZVVvwsqLcmQvVTnomlZ4X28GK8SSjChT7LOc
	 AXVXUWTD0BFW00Lp4kxQDQ7+YdgtK0SEYWHLLUsAUGeORnyOe6ZHsBnVMjnsNjU6pdUVS
	 hxFolngKzVxxi5vnA+YB1ZG+wDMc7aofWpQH5N0MztBRuhaZ2dlwxo1X5kS51E3jcCoWL
	 Wp70G7YujWb57g5IwaTY5XnS/9K88IP0IQbi+bDIX9R6UzLOYnD44FdrBHBaeakQJrw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793828236;
	bh=ysH5DQGLef+tYyaqEloNN4lwj2II6O1j7QNyOr2Ow0M=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=B1mNuGTzOu139Fnv3/IYVX/y27bNY7i3K9znTDAgsZNs8PH/wiV4dTcVzk/RXh1oo
	 A7Ru0XOFGGsyKx3HIKmBJZ6Ef3wZb9+TekLz69S4Uq53mYvOJP2524Y1BBKEE8Ewpe
	 xK7Z7Lmr8d6VXgyGBkD3wHm5sQY1w4XAghL/grIsHk7fQYOytHBlrQ6KH/XLe6c5QI
	 DzUcTGhyF0OxjBnSvws6LIHj4+TNOrAUETQ6RYghKvoac0MDyqgHvgFpBpXMTwYFMv
	 1X+BOaH6ZioNrL83JrGEdIbqBUL3WEyUscT4DaqyDLCAesgRxHtiDbFTyCMySYcCld
	 9kaLe6DiNQs5A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8D19E607B4;
	Wed,  4 Nov 2026 21:37:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 359FC177B
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 21:37:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1B58C8081C
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 21:37:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Bzl7ZorPIqo9 for <buildroot@buildroot.org>;
 Wed,  4 Nov 2026 21:37:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org AACFE805E1
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AACFE805E1
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 21:37:12 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 02CC64E404ED
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 21:37:10 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id B9F675FEEB;
 Wed,  4 Nov 2026 21:28:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id CB0DA10329206; Wed,  4 Nov 2026 22:28:00 +0100 (CET)
Date: Wed, 4 Nov 2026 22:28:00 +0100
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org, Louis Aussedat <aussedat.louis@gmail.com>
Message-ID: <auujXQ5XDf31yUNP@windsurf>
References: <20261103102152.4140664-1-giulio.benetti@benettiengineering.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261103102152.4140664-1-giulio.benetti@benettiengineering.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH] package/rtl8189es: fix build failure up to
 Linux 7.3.0
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
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Nov 03, 2026 at 11:21:52AM +0100, Giulio Benetti wrote:
> Fixes:
> https://autobuild.buildroot.org/results/63c3a272019d0a84b89933ae174c85a2db46c454
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

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

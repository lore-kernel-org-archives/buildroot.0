Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D4DA606A31E
	for <buildroot@archiver.kernel.org>; Thu, 26 Nov 2026 22:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Fd87QsQ4
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6B1A0811E3;
	Thu, 26 Nov 2026 22:00:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8w0JPJB_N41l; Thu, 26 Nov 2026 22:00:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 49932811C5
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795730428;
	b=Ivz7RCqmPq2kTmjd2WoQiSomCn8miMLg/4jCiQMZ6LYPhxkGs/8tMvaBQHQSWR1AGmYw
	 0Cf+VThXDQBzk0cuCH4+xOuk6yYn4Ey1zgh79pybnZU3vwN41+tmOzMUl8CmkosqoCTFS
	 W9aOlEYBBtX/gxXrCG4HiHy/QWit7wi3xyXICcn3OqwJ0JUvpYAucp+iIa1NAx1a2rcDa
	 vTNU4XdzsVoOytIeDix0Jj4nBy1t4pbyPWgxWGTXKbjrb6SW96m8ZGq9Ld2b0tisfherl
	 pGD2BRPByHy7ywktd5CrO2+VBT3XqGNKb1yBc0pqKdYrtN3kN9n5mhoaf3k/rOUB4QA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795730428;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=OowN470IebAHwVXUOlW4cNPGJQvmlPX678X/7Q9KfiY=;
	b=EEOFQuKQrxR1I8G3zhlnl9S0F5JMK5IduF8KcIEJiLjGHRhOUhQxh+mP/iTaoM0dmjax
	 EGsyZZYN1agpo0g2UVcOSurfkFVcyC43szyhDmzMNQ81BRe2T3DenKiezWVCBixL6+/fi
	 fgQ3qF9LFxzVAAMeJIEN0HrTa1HobDXY4BCrZM68HflOd1XU3c3VXktBysTppmz5cjqTv
	 1C7B7ieoEfr85ce5DwvOQ9QklMxWHnacsM1q5kpn9WE8RHjmISgDhMIBs5UvaIVnpm88a
	 hoaeedzBV+NMtWoUYJY0rLzZvUH0p0Juc7uhPYgW/4s2TOikBDPZf+mTHb95UXjp2dA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795730428;
	bh=OowN470IebAHwVXUOlW4cNPGJQvmlPX678X/7Q9KfiY=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Fd87QsQ4FO9QsEcV8kok+sTQvsF36d9lg6GbaUOiroau+6FzoD7ZXei5ioEcfK7ti
	 nmfRfyiJN9jfWpX1dEjev5W5FrSx+R7uQyJoLnsTleMgh0sresv9O9YkwsWSXpjQDi
	 Yma/tYTWOeGFF7/xAdu6q7yLSk3e03X9GXQTKBELUwgiX4LvnyVWWsCujQ4Vzz5xK8
	 OLXBc6RlbVrHhp5+9I3iUFjdN1qTnbgJFDsmxvZxHSn/NDkTxG6b15XNkO17yJyt/G
	 qnHXNMftP/SEYnFSGsO+QNF9M30BNsQNZwqzZTazd43ZBHRUQEt4cq/7Cz/Ra96hO+
	 RGXqEB91OE6bg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 49932811C5;
	Thu, 26 Nov 2026 22:00:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id ECA391AB
 for <buildroot@buildroot.org>; Thu, 26 Nov 2026 22:00:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DE31560A8C
 for <buildroot@buildroot.org>; Thu, 26 Nov 2026 22:00:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nhdfBvEluyeY for <buildroot@buildroot.org>;
 Thu, 26 Nov 2026 22:00:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 6756260A6A
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6756260A6A
 for <buildroot@buildroot.org>; Thu, 26 Nov 2026 22:00:24 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id D89891A1826
 for <buildroot@buildroot.org>; Thu, 26 Nov 2026 22:00:21 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 9E34C60558;
 Thu, 26 Nov 2026 22:00:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 28AF411E69117; Thu, 26 Nov 2026 23:00:15 +0100 (CET)
Date: Thu, 26 Nov 2026 23:00:14 +0100
To: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Cc: buildroot@buildroot.org, Fabrice Fontaine <fontaine.fabrice@gmail.com>, 
 Arnout Vandecappelle <arnout@rnout.be>
Message-ID: <awir56QrHKGPzMXr@windsurf>
References: <20240306145531.1413586-1-fontaine.fabrice@gmail.com>
 <20261123181215.2805909-1-angelo.compagnucci@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261123181215.2805909-1-angelo.compagnucci@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH v2] package/capnproto: update ucontext
 handling
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

On Mon, Nov 23, 2026 at 07:12:15PM +0100, Angelo Compagnucci wrote:
> From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> 
> musl workaround for getcontext/setcontext is not needed since commit
> eaeba56aa2d21f1d264c7e361731808e3f072d9d
> 
> Moreover, select libucontext if possible to get full ucontext support
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> Co-authored-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
> Tested-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
> Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>

Applied to next, thanks!

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

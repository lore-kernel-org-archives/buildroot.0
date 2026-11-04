Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 828F8606C5AD
	for <buildroot@archiver.kernel.org>; Wed,  4 Nov 2026 20:53:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=ELz6lVXe
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 63276408B0;
	Wed,  4 Nov 2026 20:53:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CtXcSG_bEigo; Wed,  4 Nov 2026 20:53:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org C356140893
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793825587;
	b=EfhjskBurB/ZyVLiVNIJSY6euCIVwJYvtbKIL0cz5/lFmTfolPV8ec5hhNzDSR6emb8I
	 5kcXPuX5x+PqtnUOiTFHQq0NKWKL7oaXfidCEN74cFZHRyhGGrCXs1I2rnbWv7EpbxXQM
	 rQi7v2JgVeUbxaAdfkAa0Tovneg479ibGZM3DdW+3bJYLOm/WSNq54WXhn0dcqaT72BGc
	 cUqWjkg5d5LNpP0X7cQqCVRQgWof9R/HYasmwvo8PYo/6TuG4C7Q5CB84sgQ8TEYsj8/a
	 9jfmXA3FjTTZPqg6WyOvtRoRI+RTx+SJK+GwXJ/9VAKYN3wzqAaLtTXHRsdPmoKbKHw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793825587;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=HB4OlVGv5+gYYAtWgfpapG0GVH4GecMekx5htNNC/Kw=;
	b=aiUwfB+JOFbn7cJ/4nnNyUS8U2GB5l08mY8Sw0q5Cks/WVJ1/oql7qAukuwmaOPbw/kK
	 BGbm5oji93QmZoAuLmQMX2WXvsYib7YsnhQR8iyDkAnAZ2ZjXFY3TFjlG+I/UEhP0CaNB
	 0BGg+I4Gr8xBPiXRCC+azu7GumJCbdN50Zqzb7rmFfGTorfqj6tnuVsjcBdbXzLYJnK+k
	 xs/DDgNXVaT34LXAZbaPut3jKXR1V4WU7Bj0Kkd5BwpMtnVjg1rglHGOcG+Lw7IJox7Z4
	 mLuf8Wd/grAM2RAZPsQSHUSAwQ4pXeEyVjyPosrj5RxPQh2doPmrXDIKWIULDkW3k1w==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793825587;
	bh=HB4OlVGv5+gYYAtWgfpapG0GVH4GecMekx5htNNC/Kw=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ELz6lVXePLga8VuGfdowVwjsASuP3hmnBLQXDoH2fhNK+42I/wCJZsPOQRQtaj5xA
	 A73JPRZDThKS99ehVnCmSg/V8FX+lwuKaLE70Qykqiik7DAeDktE4qkorsVLT1Jdbc
	 fNIQrj4MOrV95SnAUOeZRRtcoJS9NaFHqK6qfJWX8q3OlrqDqROOw9ZwiRoB7W/f8V
	 167TSJRZ16L+3m8bsW25uGg3zXfYFZn+eSyB78sm613eWjdJgsrFKddOM7asbHFNTB
	 n1WWZJdlVOAc8femGYlEDkBI8cuoGU8ks+YnEkP0Sb5dyyEoDhyTCaNOG+kErcBYd5
	 eXqKRVHrHZ4Zw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C356140893;
	Wed,  4 Nov 2026 20:53:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id E315CAFC
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 20:53:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D49C34013C
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 20:53:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b0OYI6QG4EkF for <buildroot@buildroot.org>;
 Wed,  4 Nov 2026 20:53:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 512004008E
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 512004008E
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 20:53:04 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id C5B8AC6914C;
 Wed,  4 Nov 2026 20:53:00 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 72C495FAD2;
 Wed,  4 Nov 2026 20:53:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 3D9341032925B; Wed,  4 Nov 2026 21:52:56 +0100 (CET)
Date: Wed, 4 Nov 2026 21:52:55 +0100
To: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Cc: buildroot@buildroot.org, Fiona Klute <fiona.klute@gmx.de>
Message-ID: <auubI87hohwsCWIn@windsurf>
References: <20261104140941.2752868-1-angelo.compagnucci@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261104140941.2752868-1-angelo.compagnucci@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/2] package/httpdate: new package
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
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Nov 04, 2026 at 03:09:40PM +0100, Angelo Compagnucci wrote:
> httpdate synchronizes the system time using the Date header of HTTP and
> HTTPS servers, which is useful on networks where NTP is blocked but web
> access is permitted. It is the successor of htpdate, from the same
> author: it delegates the network transport (HTTP, HTTPS, HTTP/2,
> proxies) to libcurl, and estimates the time from several servers.
> 
> Like the htpdate package, add a SysV init script and a systemd unit,
> running httpdate with the arguments of HTTPDATE_ARGS, that can be
> overridden in /etc/default/httpdate. As httpdate does not write a
> pidfile, it runs in the foreground (-F), and start-stop-daemon
> backgrounds it and writes the pidfile.
> 
> https://github.com/twekkel/httpdate
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

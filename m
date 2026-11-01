Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03AB5606A324
	for <buildroot@archiver.kernel.org>; Sun,  1 Nov 2026 17:57:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=rSnmCvr5
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3ABD6405B2;
	Sun,  1 Nov 2026 17:57:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BlH4SX-Pds3D; Sun,  1 Nov 2026 17:57:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 4438840523
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793555826;
	b=exra+BWzjz+vKVJcr2VWoWJTVJrYVmkzUlyISnuYL2nbWdycj7YYwnmtCet0pwiulVWV
	 0g65yIyGTNdLux7I6Q9IN6CIaOhh1ed6XV64a90avginvdHOEITlf8W/J8pwgPGx9408c
	 32lERp/t2MfxYXgWibA/Sg5ZygRg5JrBmFlRlcdPqPdbeQ41u86fGsm/cP5q168TtoaQs
	 75S+xjczR4+HRZ+TqeqJ8ZRosL9wPRr3VfbVklYhgC9Io1ESjxeZmzwbDVqaCueeX5JcZ
	 PCb++6AYZR8mex9AbsVE/SRzn1NFuXMLo4cEK4QKlexdSajZtAH9XVFRHaE7TTrD7uw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793555826;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=BwE22jyJ+4Y5HbOXJAiocmhEBxJ/K8hg/wPkEysIJUg=;
	b=tYIHcHE8MqhGl0YEcpctEhLSKk4LoI7Drvw3gPhj1xVnntJD1GkdaXZ5dkZ0qMIqEarY
	 JusvtG3GjK/uPPAJCqhEHg51NYjj4FKzvMe817G/uVIHr76aViQ9NxfM4oOWlrEwDvgZD
	 fg43kG95YTf92AWtEL/2GXY/onUo90QKUQv62GGy3foC2MwWYE3WsQmqHg+NTP/B4Zfow
	 L75kauRAJ78MgONkwvQlLQxnQc+K9RYOqlj0vMIfwG0ymWfJL1tBTm0836lx8yqYIyD2f
	 XQeVydWHuNQ/nB5qcbLFbB1A6PoQjZxbhm4eM/dd1ilw0KztV24vj4O9icITUkuRwgA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793555826;
	bh=BwE22jyJ+4Y5HbOXJAiocmhEBxJ/K8hg/wPkEysIJUg=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=rSnmCvr5UO4wjTA3oh7cTUXeQRp51e7XeRokxi8dTncywyYFsd4DRtIdx+2sclRaj
	 jJLzr1BcqAV4xJElToMpDulg3vLUe+UKV8dkGwr6wFwGyTl3TY8eIt1sovIhc6Wz5h
	 tIu6jDSwkE7AFDqLJK46Kqcbx8mymhtwCciLyFL4fwXkwQi9IShPkNsePjsRdQyzsY
	 ocfUbWQrAX1sz0KhIzjvSTF6X/P3rTkezbsYJP/TBFfjqs3sgZCaJnasOscKLvBmtR
	 1C9TLIThNqMX0pdccec9s38sMKOKa2HkignSH8utU1jWG6OdvHZLS2YCj/4UBWTLaZ
	 hOHIdUBMUcqbg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4438840523;
	Sun,  1 Nov 2026 17:57:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6BD822AC
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 17:57:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5220060612
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 17:57:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SFP6QH4gqs22 for <buildroot@buildroot.org>;
 Sun,  1 Nov 2026 17:57:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 1B94C60602
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793555824;
 b=qGF/MOWwaYb9YJied+5aj9mAfAFNT3FCc1ZjTR3YVPQ9Ap++Ifh0YgmJMTHZ73d4SOpd
 TLfbU8OLOkIrKdM0dRvLSwsYKpnE1XV77tiIQwfEmNZXMDWrWGXEz8Lbl1e06PO214H/F
 aH9YVcb850F35zB2D7VjaUrJqGcKxXTWXrQrufmtaCqyY7BcXI9yKFs6t1VcjG1+ihaPi
 IySOyFO0epWLFBfQEWbJdw3tINnvyUa7TYl1COpCmXVxNXCm3hbs3Yz3d2Z1Y4hK8KSTX
 WrNoEXtsf2SudtcU9z/tP0ckioLVJ0xRE7CMY4003MdTdqFFdQrGcCN8tPtVFjpCzWg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793555824;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=HREQ2f+qGex4TBBXXJ+430M9DP3+NidT/y2a9ud0yhg=;
 b=Q8jrJqxv94bjQcbOBW2vNneQtqOKK9tsleTe4qzHf7OFkPthzZwSZ46376ZDJMIOpNbE
 laoj6gih7j/Upa5c1pFrJJdC39aK2H2vNvx7Zo3JYLnZe9WJrfRUl4Ax31mU0jpd9vtKr
 3MXKoIl4z60sF0jLcqUdMtplE30UAP7dTVvXawhoUWpwHZCUX34hhR8XCDIcT376D+UMN
 g9vEVRWJnLxgMp93wzaejVv/MY5kPyNJ1H+orecEX1s+RzmQh4OD/ROCMi/Tw2m5lK1KK
 slb0azt0c1RKPJkWaBmRNLSmD7t7cOatYtKUrXKKWtuZKmhjRpwcHAYlvnqacZT7gUA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=Zx82y0F+; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1B94C60602
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 17:57:03 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 6CD674E41323;
 Sun,  1 Nov 2026 17:57:01 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 375EC60750;
 Sun,  1 Nov 2026 17:57:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id E05C51032855F; Sun,  1 Nov 2026 18:56:59 +0100 (CET)
Date: Sun, 1 Nov 2026 18:56:59 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: marcus.folkesson@gmail.com, buildroot@buildroot.org
Message-ID: <aud9F_e8B9t0EkGA@windsurf>
References: <20261101104535.1696412-1-bernd@kuhls.net>
 <2f4dbf0e-3bea-487a-9be7-bd6dcab47971@kuhls.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2f4dbf0e-3bea-487a-9be7-bd6dcab47971@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 4/6] package/libcamera-apps: bump version to
 1.14.0
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
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sun, Nov 01, 2026 at 06:38:11PM +0100, Bernd Kuhls wrote:

> the package should be restricted to rbpi:
> https://github.com/raspberrypi/rpicam-apps/pull/827#issuecomment-3018166853
> "To be honest, I doubt rpicam-apps would work on any other platform."

Well, then our libcamera-apps package should select in libcamera the
RPi support to make sure it is enabled?

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

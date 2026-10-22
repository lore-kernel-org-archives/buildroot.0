Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF9A560A260F
	for <buildroot@archiver.kernel.org>; Thu, 22 Oct 2026 18:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=MB98bXlu
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 29DCF60821;
	Thu, 22 Oct 2026 18:31:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Yq-2c8nnzI7g; Thu, 22 Oct 2026 18:31:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org DDEF7606C4
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792693865;
	b=j3ApWCw45zQ+yooP5+1xEEgSd+V46bISVj1F7nJIscgFiARkKWkt9zAOvhpiRB0obaJp
	 ybQhcHDMFHtuxEz58GtCJJTWwtryrFVKR0MVI3r8C5P4JSNyxOMBbfGZZfplrY8153R8E
	 jv9UOJerQdH+iEfMH1XDcGRYSRl8wMxplKafiPfCNTsZS/ToizTkgD6IcOceCOsS21d/S
	 FEV9xL9QfWr3pWKwchjPxpDFinuuVM/GWOhPWZ5Xs9e0ZZ9H3hUP4M0MCc133d8t5egTN
	 y+nDy9MV/w20+YsNx5lkPhAkqsfwKrckgyAvJUrzFuP+V8NrfOb0LYlM8cmdkwRwNTw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792693865;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=XTKxaFooBrdlapwEvELqeHPslS31JzWBlQcPBbr+K7o=;
	b=jbxo+VhXiJPcpWZ9XSgezmhvJ9upJi21iyv1HtkZxXrjtQVpdDgCZ1cJWOxyZsUb+Luz
	 KDCQN45HycPby2G6WHL4E+36HGI/wrxCz0CtbfKgAuPzPFVTAVcq01H7Q2XtF6xKF8PZP
	 qF3dxxRxjaY8n01tyqlOrMTRG5Oum444Y3hgtNI56cyKuP7euCcgYkuZ6/O864kczHE8S
	 kN/xwXFR90dhdU9I5XQCIXEP//XlVYwKGQxL+qUA7BxfY3TLtVL+OYm28/bP9zjify7vk
	 Xkw4RQ+5qkzqFtYSx1guGREHjgxTg3PpzX/ZLNCIfjTH7Sx4BM0DTX5sh7aR4GMrwSg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792693864;
	bh=XTKxaFooBrdlapwEvELqeHPslS31JzWBlQcPBbr+K7o=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=MB98bXluzxvgcV+LJOv/srlii9B4vptfVZH6whyw6Zn23+Vy9gNJ0agKt4Y/RIm8u
	 MY4OxW99MQoC2BUJ2CVAq33bOkHjk75j64/o3keverAjiV/niI3pmHlCnNPnTp2jP4
	 RgcTPkgHVIN8NW/gXInN0gIL5Bs7lJeFyCDkjToq59l5z1WkH/gmu1iniwORKjn/6z
	 y6xP67gZAh5631YlG01VaSl4OiM21O6Yvy79dvsD9sp0oQfITTLYbgoBOlF4Lc4nt8
	 BkYM1m49wtCeQ3KnGIEqDRjwQdO1CDarfnyQ252x/tNsixgKM9LtWduUeVFm0v7E4V
	 xljN9XDDUaXLw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DDEF7606C4;
	Thu, 22 Oct 2026 18:31:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id EEE164BC
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 18:31:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D4A98606C4
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 18:31:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x0ophIzFJjeo for <buildroot@buildroot.org>;
 Thu, 22 Oct 2026 18:31:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 425A0606A5
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792693861;
 b=tMd2j2hEdoaLS+Ep+qjNnTf6149ao/bdJz71zFOjG0TRofggGFfCy5CLuwWl2wjGGR09
 kKXqimO96jsg1YT9A+eMd7DzERBRBXaW4F4TWguKpcnly4Qz4MMSEIIwubWHgAk9E5X8q
 GU0DG3XN/vZqlPR01fUDHr4yq6YlTVWxlkWzq9AeAnAR0jNytDCTVZLA/ONhhSIXn3EuM
 WfaOnzR6DmPmU2VDIXKOY8wGQQJC6C15NlKe/BYq/jkevFaj7FQJT2uK0OUza7Omyg9Hx
 RkbQ0dfou5cH26z+gg+xhTk2nTx+H/p4olthTtlhgrFVG3KJomovEbBWL41auqRnxWA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792693861;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=j+pXiifekIj72Dn2mw2JpSqbz/d2LEa5YWamj3g4kp0=;
 b=POVoTaRHaOYK7NNjW8X9eLrJyehZJXCMevj6q6sr7eLAYQruPFXWFGsWvVgyrzXlyO4t
 dsBUJUbiDY6rilXuwa+QUPvBBmDOcKvJhp2B3WWtozaght33QZakm7VcbQvvBbeSbYe+E
 qti5FQfQfuMM9N6psEqVi7KwhSXXaEF0P0doKwviFtVF0lvtejIfmXBQZI4/VSq1+SDJ7
 lSLIQGqnoyWQ27+F6leXt2qBR2NaZvnGpP5dsPOJzD4TTUqQkXsB+ZdirBAyRuBwlhcDr
 JsksDNPqg+MqHfJyzmOfDI4jA+CWiOVN7tcgxtfPvXwWlFyS9i0iIrRHyQnm7VbDwrA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=W+qqOqFG; 
 arc=none smtp.remote-ip=185.171.202.116
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 425A0606A5
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 18:31:00 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 1FB8EC5847C;
 Thu, 22 Oct 2026 18:31:57 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 98EC660763;
 Thu, 22 Oct 2026 18:30:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id B333C10328501; 
 Thu, 22 Oct 2026 20:30:50 +0200 (CEST)
Date: Thu, 22 Oct 2026 20:30:49 +0200
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: bernd.kuhls@t-online.de, chrismcc@gmail.com, yann.morin.1998@free.fr, 
 buildroot@buildroot.org, fontaine.fabrice@gmail.com, markus.mayer@broadcom.com
Message-ID: <atpWByZNXAvK-Cgg@windsurf>
References: <20261022172753.1256542-1-florian.fainelli@broadcom.com>
 <atpJvzAWPfCcAFln@windsurf>
 <00959e65-921f-4fe0-8c3b-38961367fa5e@broadcom.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <00959e65-921f-4fe0-8c3b-38961367fa5e@broadcom.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH] package/linux-tools: fix PCI endpoint tests
 build with recent kernels
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
X-Spam-Status: No, score=-6.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,MAILING_LIST_MULTI,
	SPF_HELO_PASS,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Oct 22, 2026 at 11:02:41AM -0700, Florian Fainelli wrote:

> > Hm is this thread dependency new? With the Linux 6.14 change, or
> > unrelated?
> 
> I looked at the Makefile and because it linked with libpthread I assumed it
> needed it, but the source code reveals that it does not actually, just sent
> this out:
> 
> https://lore.kernel.org/all/20261022180022.1282641-1-florian.fainelli@broadcom.com/

Saw your patch. Problem is that all kernels from 6.14 to 7.4 at least
will require pthread to build the pci endpoint tests. So in the end, I
suggest that we keep your thread dependency.

Not a big deal as 99.99% of people will use a configuration that has
threads enabled. Better that than having random build failures from
time to time in our autobuilders.

> Yes we certainly can do that, it's more concise, v2 on its way.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

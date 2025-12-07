Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 890BDD2CE17
	for <buildroot@archiver.kernel.org>; Sun,  7 Dec 2025 14:35:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BBA1E608F6;
	Sun,  7 Dec 2025 14:35:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ooejaEmSMkOQ; Sun,  7 Dec 2025 14:35:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3B958606D9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765118124;
	bh=b/lvIlpoIKlywNVLdLCmQKC/p5QdGh+UGNWt9nuTWGY=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=rpcfQtV2O6Mbmj+dB1QTel2zYWOvs4Qj6JERnxiP9uSbfBkHUotGPLpWsXrNPQ7K7
	 BVzUZf2DrN9+Mc+PRDW4M4hmoT3cvW379KLX5DqC4/ioEMcOr5MDtNcKknwiBoSy8o
	 iYa4PF28X8WuxzOtdNKKlEow3r9XtYEi2lr/Bs2nEcvJTdQd4tMBk+fkEPgvaTsGtC
	 xQlXExm9apZ1h63QU+OTL5TLuH6StoMJiV5NsBE1BYQue5p1WKc27QmIvV5GJ9oh/V
	 jHX/4Trhj07MJy/62CxxC5XkoByb3vbarNU9Aro0kCg2NiCzxXLN5qc2oPlBIILDV7
	 Tl6WI7IyfliMw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3B958606D9;
	Sun,  7 Dec 2025 14:35:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 35CDEE7
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 14:35:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 193944061A
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 14:35:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Nht6LorXzTiu for <buildroot@buildroot.org>;
 Sun,  7 Dec 2025 14:35:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1024540186
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1024540186
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1024540186
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 14:35:20 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 3D1A94E41AC4
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 14:35:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 07913606D3;
 Sun,  7 Dec 2025 14:35:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 39C56102F2368; Sun,  7 Dec 2025 15:35:18 +0100 (CET)
Date: Sun, 7 Dec 2025 15:35:17 +0100
To: Raphael Pavlidis <raphael.pavlidis@gmail.com>
Cc: buildroot@buildroot.org
Message-ID: <20251207153517.1a3388bf@windsurf>
In-Reply-To: <20251003135120.1221002-1-raphael.pavlidis@gmail.com>
References: <20251003135120.1221002-1-raphael.pavlidis@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1765118118; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=gsWJWn6+9If1DbEOrba19pvr1uMErJl4o1spKmbqo2U=;
 b=ya0V94+3oGfJYOWexR3H7+PfA+z1J+qNMAkvAA9nN5WBft43iB0+fymfQZ1O2DFwKJg2Oy
 +pNvZuKQ0UZsR2bbYpmQBWkXFBX0TilI+RvvaDZ7jPnX9P+xWuyVr422G4sHf8Dqxn322K
 wGb/9sQmLDPHKYAzGvdtmTyeCIoN7xkrTv/UAjaWksD+tzLAoWghPbTyXwODzwIXk+ppze
 XMrnoyDiersrC2KZDVJBl5svVeXhgnxRxet3hzh1NY2NfX594pjbcygN7vwGi52nHMJvVg
 M+1xUhjsG8BpYJ+iniyr4j31EUXkfAXmh3D4GlTGSvKkFZPj+/OPSyopwNW2Fw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=ya0V94+3
Subject: Re: [Buildroot] [PATCH v1 1/2] package/wayland: make libdrm and
 xlib_libxshemfence optional
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Raphael,

On Fri,  3 Oct 2025 13:51:19 +0000
Raphael Pavlidis <raphael.pavlidis@gmail.com> wrote:

> To build XWayland with the DRI3 extension requires libdrm,
> xlib_libxshmfence and libepoxy. This is the same as with the glamour
> extension. Therefore, make the libdrm and xlib_libxshemfence optional
> and merge the checks together.
> 
> Signed-off-by: Raphael Pavlidis <raphael.pavlidis@gmail.com>

You sent a new iteration of PATCH 2/2 in this series "package/xwayland:
add nettle and libmd as sha1 libraries", but you did not resent this
PATCH 1/2, which is rather confusing.

Also, this PATCH 1/2 basically undoes what commit
797de283c7ae9b99e4d2366cf142b2bc8b2f2a84 that made libdrm a mandatory
dependency to fix a build issue. Can you provide some explanation on
what happened? Was 797de283c7ae9b99e4d2366cf142b2bc8b2f2a84 incorrect?
Has something changed upstream? Did you double check that the config
causing the build failure of 797de283c7ae9b99e4d2366cf142b2bc8b2f2a84
still builds properly after your proposed change?

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

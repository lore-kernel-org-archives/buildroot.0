Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3590CA5FE0
	for <buildroot@archiver.kernel.org>; Fri,  2 Oct 2026 19:40:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AC0E260D70;
	Fri,  2 Oct 2026 19:40:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u5gMR6cEYr_8; Fri,  2 Oct 2026 19:40:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org C373C60659
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790970015;
	b=Oa6JVMl+tQV8IYut1KeFXu2j/hOYf6DShjJoaxSzjlHebAOJh8/phojPJkLXkSz93fMl
	 5IP3AfIZpg7VUoUkM6boCejawDgsxfxD2Q87+6GHtXiplWqL0buWE3Glh+n6U3CHacxBU
	 rSsovNlPOsB8thEsuUOAANGe0GpGJzoJxPX5sp1tQZ4gyD27UIpHQq2O65MsMWnbLC4ju
	 Z3JMzijXC2swsqWyY1YqqPI8K3+4PQR1UqnP0t6HdiRPCQJ3wA6TR1xbDxf1AW2x2Tv8K
	 xhnwki4W1G6XdiMQYf30K1ajeSYQ6cEa5faXWYoLyIOYsorTaywhD7zaVpYSH0vTpUA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790970015;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=CaeD6nJvKd5oA8bXP3jsDPX8A+G/CfQtME6ks5YLYO8=;
	b=Z8JzgCXbZRBnoAZifGScVZjdc37p3425V97TywefNmanfErmiMv1VFriiINXMHestf5e
	 YbT6e7CfSNn5IX8xTMztqKg/WL8qw+6E3IQLpkdTtV/50Tb9czYvmx4Pls0tQ94ML63E7
	 sHyZvwSxvo5SjbjTLuSWb5bghO1LENrmmDMYEWtMIe63SAPRsiVDOcHYnSpgnv0UaXOrj
	 d/NiZB9Qbd3gzGf8PmCNKgHPuGDkRhUpXuli0/NDSIHKZ2vRal/qMX3QnDTF1TBKkn+1B
	 D3/q0EsX9r43H/6ri1V8VBKZJOJPHYqE12Lz+sEta+4kxSGjCeHmuV9LU3JqJ/ydl5A==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790970015;
	bh=CaeD6nJvKd5oA8bXP3jsDPX8A+G/CfQtME6ks5YLYO8=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=SPXVO/mRJivt97CQ7j6To0eASdVPpQWPcUXkYOUndjtCb1o0iXxKCqIypYcZItSDc
	 jiWSW4/5r1LILLQTI5cKLB/Q24WF/m3KYkiHMnxp5QHdrPPTZi8DOyKUxgAxgYVYnB
	 DXzRzmu7NfAbg/O1mByBOlSE/hDn6TjDIFtzoUwgoljoMLRTvNZvu99/K3iWIDuTaN
	 TsWO899+Kd7keE3mSppDStRkzhW7qpEHn2kGxRtrog1UiRQdHgEG0Il4qiXLSppTzF
	 rwKTG7MD15YF8LsvHkPAkLvb7EqpVgRuGro5K3Hy1X1PYCz3HgV6ephEt7R4qJSIXH
	 te28xJYG305ug==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C373C60659;
	Fri,  2 Oct 2026 19:40:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 479671D2
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 19:40:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2B5CB811FD
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 19:40:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N3ikGxRVrRU4 for <buildroot@buildroot.org>;
 Fri,  2 Oct 2026 19:40:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org CB50A81198
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790970012;
 b=i5VU9K69h/6vEy2LgwtsrPvGXcBgIA63sT6RSebN2cju4oHQ4o7BlJIbeB4gF9UoNeH0
 QQh/joxzT+eipaPm0erRvYa+b8ZcuyJYaUCbt2fZQZNb6w03CAP+5jGrZahk0GpMfEKbp
 dMISM0FQlYCgyQJm4D4PE64PhbVsG5wxSxBbkulWEXH0iGZf9B0Jg/YmK+oyNAR9Fc+AA
 j7QBfZws+SiU35cDUYiIcMCuzBXzbALO1T4OulxLH9xzoC1dn1ZmxKDNPpUtlqLpqrONj
 nnHr7VIqqWxWVkFzE1z3dn+CG+m1GBPLI/iF4KQW2N2/IIOIchqeetBSZBaAl0HNgeQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790970012;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=Rr+uUjnp9r27wSzVs6gMtlhKvTTxK5SowzVx9F1eicg=;
 b=JH4uREXESKEho3n4zNpH3ZUCTwgYJYeSHioTgPMpWRbCBY+yPLLaPimzR4TgQBdE02H5
 DbvSs444OtuLZAqHjHPxSMNdiNKxf8pQ4rTg10WZ+Rh0f979uliqUtLEacAxMtejvPOY4
 Hpjyw7mEhBD2FWgAWhFEOz3mpJoQj1JE2Rk2yA894ebsnchQ2Dmr6PcfJiCz4h2oDR4kA
 hIgXTIb+WPh3J0KSVjdi1mmB/hlvs2hwNgVHDIds6XtcHM3+aSnd2d74LPTksJsFxvkAo
 BcrLwmMUk1O5P75Ycxq6S+dKXotEZj+WsdjFmSWCj8MqE7sITKs43/lxdvNmAdj4F4w==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=hVpE3mgN; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CB50A81198
 for <buildroot@busybox.net>; Fri,  2 Oct 2026 19:40:10 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 10F924E41113
 for <buildroot@busybox.net>; Fri,  2 Oct 2026 19:40:09 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id C9A76603DC;
 Fri,  2 Oct 2026 19:40:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 29E75103281E6; 
 Fri,  2 Oct 2026 21:40:03 +0200 (CEST)
Date: Fri, 2 Oct 2026 21:40:03 +0200
To: Francois Perrad <francois.perrad.86@gmail.com>
Cc: buildroot@busybox.net
Message-ID: <asAIfRgs93f2AZDX@windsurf>
References: <20261002191941.95919-1-francois.perrad.86@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261002191941.95919-1-francois.perrad.86@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH v2] package/kbd: bump to version 2.10.0
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

On Fri, Oct 02, 2026 at 09:19:40PM +0200, Francois Perrad wrote:
> remove upstream patch
> 
> Signed-off-by: Francois Perrad <francois.perrad.86@gmail.com>

Hum, are you sure you tested this?

>>> kbd 2.10.0 Patching

Applying 0001-libkbdfile-Require-dlopen-and-memfd_create-for-libra.patch using patch: 
patching file configure.ac
Hunk #1 succeeded at 85 (offset 4 lines).
Hunk #2 succeeded at 267 (offset 4 lines).
Hunk #3 succeeded at 293 (offset 4 lines).
Hunk #4 succeeded at 315 (offset 4 lines).
Hunk #5 succeeded at 330 (offset 4 lines).
patching file src/libkbdfile/Makefile.am
Hunk #1 FAILED at 10.
1 out of 2 hunks FAILED -- saving rejects to file src/libkbdfile/Makefile.am.rej
patching file src/libkbdfile/elf-note.c
make: *** [package/pkg-generic.mk:239: /home/thomas/projets/buildroot/output/build/kbd-2.10.0/.stamp_patched] Error 1

Could you have a look?

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

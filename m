Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6048A606A319
	for <buildroot@archiver.kernel.org>; Thu, 22 Oct 2026 11:09:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Nw1EM7PT
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2F1D381271;
	Thu, 22 Oct 2026 11:09:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QkaoGVP-kwGs; Thu, 22 Oct 2026 11:09:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org A99868121E
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792667353;
	b=TTDZUW+C700p/rl0b1jeVftoGEcQ4J80+96G4Qb2J++8hhgcHbWe9m4oYTvC1A8wwtTz
	 OxOBE5HhX7/huJ7vOOvAXMHMD1uh80Lbmcyqz3DK8OyCwsaOF5GlRpJldrQetSvl8nqVY
	 70OUDx38MsREzwXT6vFd71t8773+rLKwjHLGea5hkupBpBkM3bKMWmoBg4QkoFhdnIJTP
	 eyIG5dphKVZKXkRiuXuebLECdX1nWAEO81qpE2vwOCRbAjpa6uox8od+4CT7maBB69PeM
	 rdg7gwpPs2d/MGIeKFBVVDIG+VFF4J5qSmloJgZ95d7oFGe/KBDEf/1ia3BmBGzC70g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792667353;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=QLGcLAlq/nEHAgatoAs81qIQo5Z+gE2zfL/4GajweEU=;
	b=Yu3znSCOl4czT12yFO0rShqegA7y+GURw2TqdiAknH6Axq8l3NltUjNy8iOv1/367mpb
	 Bb6Ofpgek+MGgKFfIm7O2cXEd/ZS2g1TeuPflyXn7Pz6sD9d+G+i6nGXjyQc/xKSrP62e
	 nbDhY9I5Xd4OfJ2hyf1IUH6x4cYS7kZJovIOK+aca7pz8YTI8W99GenN9Gw3hzrgQQ5Bx
	 xPPuSW6Da/ECq9rrQKC7NI6WqHRbUMT+vxLSkts+/ZmC7N6KOhg/wY3/MZZjxUg30QtDM
	 sIZtoq6rbB8ocISIrfLrtFj9vmTARTU0XwC2ZL38NLgrJcmnviBtTYvQ2JVdoEiRXfA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792667353;
	bh=QLGcLAlq/nEHAgatoAs81qIQo5Z+gE2zfL/4GajweEU=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Nw1EM7PTRFXeYrmkOH+m3Q523teYUPJovvnkRxJ3esQYCC6BvCYO6I/MSDgXWLy+A
	 XP2HXypnrdT+Fekin0bVtLQeLdr2X1/xI5ZospiKv7KJm91CnhErjqQwr/pzULrsm7
	 s4RRl8/96J8g1h6w4otrZP1/ajf2Yq3JJd4m2m3XsbGhFPNDKDifniWV24GafQyRG/
	 lPKkQwtPe/4er3OllyGPx6wgV1koQoiV01Ul3wFYecADmb7TK6KmhjQ/FlE15q+07g
	 XpSZnEv4yX/D8q8N7HUBl5/XwkIZ9Ft+UqQuNF3srfpeRXVsyYCHgjPkw2BQSkpx1T
	 IoKYZd6axy0ag==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A99868121E;
	Thu, 22 Oct 2026 11:09:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id E5C30371
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 11:09:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CB53840409
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 11:09:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PNJZ6sYnYsGS for <buildroot@buildroot.org>;
 Thu, 22 Oct 2026 11:09:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 20BC7400B8
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792667350;
 b=WEykZN1ndI34yGFA/xRgZXsSzJQJQYLk/s+RlNDUX28cfAjAVN6vW/28KRRoF+D+ApdI
 a2Vup2AmxcWhI9t6MyaNy3bjAIFXv8HKKuSh61ALCALbxvO2sY8zA3kO8cs3g4OuALIz6
 UPn/60afh91rZWUuNNAM/VgBHkQ29xAjBuZpi2TfkUpxKeF78QByM2b3gpoIAkzFL3oSQ
 KXrVnXHVCsIgV1FASVsQ4PYsauaEvEppTKtz46kPAzobubkJ4kPtiifaqGN5rIVlnXv5A
 4kRKAjerjHxzVjJoyCIIEwyuPCrPqDAAVSgEx82jQTgppZx6vqwhBLQRBulCe5qQilw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792667350;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=MnovHRLHRg2px3xHln5inJ40Dn7jY0pmKY/KQoINOQw=;
 b=qPc13OPMAYk1srtmOubXkppu9fETuJxpZh3UwSFpqfqEIYz/TKFDUe0itpPzgkijqfsX
 K7vHGI6pT2bX7aZBn+o8PhUGzANT/TDyd70c/sy8jd6SRG8FY58RGbLwlYvjVZWgYdMGv
 FCVhP4CkDjynFepXQbbMh/Mc0gzRcA0D36WF05sxtDiQTrViRn47L4r6N+CfrNZw+UKxv
 ql/g7rsNB+zyZgLPmBlpXjo9uGZhiptVbUI2293TO78T7MYto1AqXq8TmQI742yZwKlb1
 MpNItLGU47mn7MJr1KkPifDGnWQ6KiAJe247SjtuP8KM7R0mIoFErtPtNZP+2BNIbwg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=XeLTOF0t; 
 arc=none smtp.remote-ip=185.171.202.116
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 20BC7400B8
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 11:09:08 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id C142FC58472
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 11:10:05 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 49E2B60360;
 Thu, 22 Oct 2026 11:09:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 0075710328E44; 
 Thu, 22 Oct 2026 13:08:58 +0200 (CEST)
Date: Thu, 22 Oct 2026 13:08:58 +0200
To: Florian Larysch <fl@n621.de>
Cc: buildroot@buildroot.org, Martin Bark <martin@barkynet.com>
Message-ID: <atnudFwiU5Typ174@windsurf>
References: <20261021223000.26513-1-fl@n621.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261021223000.26513-1-fl@n621.de>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/1] package/ca-certificates: security bump
 to 20260816+nmu1
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

Hello Florian,

On Thu, Oct 22, 2026 at 12:29:58AM +0200, Florian Larysch wrote:
> This invalidates the compromised eMudhra intermediates by blacklisting
> the roots that signed them[1][2].
> 
> Changelog: https://salsa.debian.org/debian/ca-certificates/-/blob/5bee010adca85eb867534f6445735ad5cc0dc6f3/debian/changelog
> 
> [1] https://emudhra.we-have-a-problem.com/
> [2] https://groups.google.com/a/mozilla.org/g/dev-security-policy/c/0R3XLJL6FuE
> 
> Signed-off-by: Florian Larysch <fl@n621.de>

I ended up applying this version of the fix, even though your patch
was actually not very good, to the point where it was working at all:

- The URL in the .mk file was wrong, so downloading couldn't work
- The hash file had not been updated with the tarball change
- And there was a license file change, requiring the license file hash
  to be updated as well

I fixed all of those issues, and applied to master. Thanks!

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

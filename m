Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CE5B606A321
	for <buildroot@archiver.kernel.org>; Mon, 23 Nov 2026 20:50:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=enXU/q8n
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3C0D16070A;
	Mon, 23 Nov 2026 20:50:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l35IqfP5H_Vr; Mon, 23 Nov 2026 20:50:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org C91656067E
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795467015;
	b=K/vnGC6NsMLuwgEzkJbvhTFV4Yr/pkqzCblw8szjdnksozaxWqR/9fC3hbQV3ZHSDwtY
	 iTBruOKOpB6zDQb5SZEBcDz5q3pPP998VIf32Z0x3EA3S/MMpECBT7UeGt+lYp4vJx+Sn
	 GDHMPLvL5C6b47NCP1M4c+vv2HPe+ZIfm1KY6b7f/KHs/Ca75UhaK5HLVb1P7PiKfkqil
	 e1IXvuOO/6V1xUJqOAg+wMjAaJtmTqqkhwjN3CKj949IMK+HlXE6yQzSm0q/sijT+v2n8
	 QbtBOV0rM6hsvP2xiz6v1dvgttmCJX9Kj/lgDM35XtPom3TvL/rPEe+gjpDmpi7BPbw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795467015;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=MZeKdGt8nFWMuw5qottn0RTnsYPTqbmbCAvcJ3vBolQ=;
	b=DzXKomh7gPIrnYpcs8NZvpCIvY0l12NsWENwByRHbifm50efdvwEbBWe8jZFZ+bBC+Pe
	 wv2tP8IY6QbAP/iNNC2dSwb0PvasF2N7GMENN4Ha5T0eec6PBkTDiCrS6wQ9uomXj//Cz
	 MVEzxVSQL/a+BJsg/9VypaosKiVrKdAhNAPJTw1Lf8Gz0T4p7bUX66zayGDXZuU0WOZrx
	 TriuZFFYcdezGlLnPecgpPpY0KQ4NMyddTVN9eq1LcDA0dHoZnm7kSN+fdqaFP9nbjaJ3
	 +kaGx9KNAg8Yu1lUCdhjamH5dOGoTxBOY4aL0H/Umuo0h0hcUzEswEarv9CDNstfrAQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795467015;
	bh=MZeKdGt8nFWMuw5qottn0RTnsYPTqbmbCAvcJ3vBolQ=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=enXU/q8nQfySL1+khqSbYXM+abuLMXW4Idysrf7IGP+vcmaPjrNYCYmGAm/1E4HWb
	 9ssx6+hMdb0uJl1xD+1VFBCmpSPihWXwZJjr89keh+sSC8xag0Z7tNYs8IdJ0jpWT8
	 0qmjRng1tKReKSV5IgUQuFhZM3eLnUOfBthjj6Ah5BSDx7Pn6iMX7nPnS0MnCsDUsM
	 r8TWxrR2MPbQUtNOdJclsBKJhMxFiR6X2uXnAeWwF74Co7dMmfCzegprflSrzZFmHg
	 wLJZglQbxpma5Df0R4GtXCrf0TxRinlth84gZUjTrrkShFFYcYFnKi7YZVwuHbgHsZ
	 Bl2NTzTFCTZ9g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C91656067E;
	Mon, 23 Nov 2026 20:50:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 72878371
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 20:50:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6FCE64061A
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 20:50:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id flsMM43ejCcX for <buildroot@buildroot.org>;
 Mon, 23 Nov 2026 20:50:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 1AD37405AE
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1AD37405AE
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 20:50:11 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id D01901A17A2;
 Mon, 23 Nov 2026 20:50:08 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 95A41601E1;
 Mon, 23 Nov 2026 20:50:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 62CA911E6AA1B; Mon, 23 Nov 2026 21:50:03 +0100 (CET)
Date: Mon, 23 Nov 2026 21:50:02 +0100
To: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Cc: buildroot@buildroot.org, Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <awSm7MZrcquARolf@windsurf>
References: <20240509204218.77779-1-fontaine.fabrice@gmail.com>
 <20261123202502.3419375-1-angelo.compagnucci@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261123202502.3419375-1-angelo.compagnucci@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/1] package/libp11: fix enginesdir
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
	SPF_HELO_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Nov 23, 2026 at 09:25:02PM +0100, Angelo Compagnucci wrote:

> I think this patch can be dropped. As Thomas expected, OpenSSL defines
> enginesdir relative to ${libdir} again. Master has OpenSSL 3.6.5, and
> its exporters/pkg-config/libcrypto.pc.in has:
> 
>   enginesdir=${libdir}/...
>   modulesdir=${libdir}/...
> 
> So pkg-config returns both prefixed with the sysroot, and the readlink
> and sed are needed again. fe7ad9e3a2 ("package/libp11: bump version to
> 0.4.18") applies the same stripping to modulesdir.
> 
> Not Applicable: https://patchwork.buildroot.org/project/buildroot/patch/20240509204218.77779-1-fontaine.fabrice@gmail.com/

Thanks, patch status updated.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

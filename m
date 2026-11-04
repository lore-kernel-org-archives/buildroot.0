Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB014606A847
	for <buildroot@archiver.kernel.org>; Wed,  4 Nov 2026 21:18:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Gus7r8pC
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E6FD66080B;
	Wed,  4 Nov 2026 21:18:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jEyipNmhN1Ni; Wed,  4 Nov 2026 21:18:31 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 72CD46061C
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793827111;
	b=qhkue2Nm4l7CEGjn5lEOm2qL2dSB9Yr36qzJm3XCXHNqN3YmSuiK2vNWxHfD7mN471//
	 9hgG2IJyiVhsZrfNdmNw3JAEWeRXt83RiFqc0aUL46EbljGZcUmxbaYjKZG6R1JpEty4E
	 v/Z4lewNM2WavrYtD64VkiCru8NwDaMP6sR96cUdO371LnPxb9fmgy4MgfWuppt9kJIBK
	 KqX8x2hIibHNtuYUcom2qPV2D/jDOunwsM4M1dsUhKcw01F3N3ZRJpvTjE7R6gZ231nHp
	 LIAI/GZOXQNS+vDvoToISEQx+KYH/NscZJE73sNR/CMOgAC7wdvRILp64TMdwovMxlQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793827111;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=+p5KCz6Wa61crrBblokUXvaOFFRSStXlKEmG7sepIPo=;
	b=DWQ3SGP4ksiBiQHv+s4kd7A0Nch3Q24YCe8PPtnfCGEJRT4KbMMv6sW/2m3B3a/fTGoj
	 hTV+sLWtngFbDqO5nx+bmJY08/XXOZ53r9inKGGvlVvkYXFkYEglljErBxR4/eEoUwwG8
	 WFex5ndQNqsl/Q5qpUOI9roknx9pE3+hMVzQDw+MTW5XBKDspVvTVfwq9ZDfHfol67yYB
	 Mw/5HgTFuCySSeGU0HTquB5pDSc4taLdhSMaCSFVwK8Ic4aA+iG8PomtK2pBxRctFfSkl
	 QDBQoKKip/axIXh7RaigtSkyfpg3z/wqiFN2sDlg0GEoEr04HW0aTGo8/t2yJ59vUHw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793827111;
	bh=+p5KCz6Wa61crrBblokUXvaOFFRSStXlKEmG7sepIPo=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Gus7r8pCYA942Z1MXHNsrWyhmSRMSzl+4wv6sBbbLvbQYRsHJHttyv3HNLSLY5M+j
	 dNLpwq5ruDMuYdg3OujQqhYzYcFEbzIlFoj8t/HNswPaS0QqR0/iV64gAw9NziPkCo
	 eJXpCKlTiTEhBsGSdCeSXR1/+JNggQva2lpAxaVsgXuP8MAr6uSVRUVjuWP2eKXRei
	 nEPsRNrnJFSV6nmIwpWybl75aaaBPqzoL1ItX/IfNK8VSRmeryZ1x4K9baFppQravm
	 dp4oVMif58BR/fSS2+F8sd1MgWLGjf+RJ7Kpezm8+7aZWOG8dm/YvEbSNLyAnyZhsm
	 +cxs0iUzK229w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 72CD46061C;
	Wed,  4 Nov 2026 21:18:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id D1EC6362
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 21:18:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C3B1840217
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 21:18:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KdrFzBMe3Smx for <buildroot@buildroot.org>;
 Wed,  4 Nov 2026 21:18:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 5D18C4008E
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5D18C4008E
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 21:18:27 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 768971A03B7
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 21:18:25 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 434C75FD65;
 Wed,  4 Nov 2026 21:18:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 18FA710329206; Wed,  4 Nov 2026 22:18:23 +0100 (CET)
Date: Wed, 4 Nov 2026 22:18:23 +0100
To: Andreas Ziegler <br025@umbiko.net>
Cc: buildroot@buildroot.org
Message-ID: <auuhHB85gBELOTv5@windsurf>
References: <20261103040947.211239-1-br025@umbiko.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261103040947.211239-1-br025@umbiko.net>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/1] package/mpd: update version to 0.24.18
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

On Tue, Nov 03, 2026 at 05:09:46AM +0100, Andreas Ziegler wrote:
> Bug fixes plus libupnp version adaption - Buildroot uses 1.14.25,
> which is usable.
> 
> Version 0.24.18 change log: 
> 
> * protocol
>   - "albumart": don't climb above the music directory for CUE tracks
> * database
>   - proxy: fix playback of CUE tracks
>   - simple: reject playlist entries which climb above the music directory
>   - simple: improve symlink checks
>   - upnp: support libupnp 1.18 (and 1.14.26 to 1.14.29)
> * storage
>   - nfs: fix use-after-free crash bug after disconnect
>   - nfs: fix crash after directory listing cancellation
> * archive
>   - iso9660: limit nesting depth and detect directory loops
> * decoder
>   - mpg123: fix "cannot seek!" error
> * output
>   - osx: follow the default device after it has changed
>   - wasapi: fix race crash bug
> * mixer
>   - alsa: fix data race which could set the wrong volume
>   - sndio: fix data race
>   - software: fix use-after-free crash bug
>   - wasapi: fix crash bug
> * Android
>   - fix crash bug
> 
> Signed-off-by: Andreas Ziegler <br025@umbiko.net>

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

Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54E93606A335
	for <buildroot@archiver.kernel.org>; Mon, 23 Nov 2026 21:50:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=I9yvKMjM
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2B1A940760;
	Mon, 23 Nov 2026 21:50:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TCIGANimMwHA; Mon, 23 Nov 2026 21:49:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 29C17406D8
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795470599;
	b=n/UWSe6pzCtQ7B/JWrMle+gkMrOf6W8O33IkXRaUS0BxruL3SJ5f2a3yjI5hilmoATxM
	 bl9dIJm6S+5qiRqFLjfbsYHEnlcyVvB6aIcqb5nVYCg9lH3km2gZNLjSsDzHQ7yp+RLfH
	 H9jBhL833JyyPpA1TbjPaVi+gWvjLADuFGiEc0VQutCR/3tyfRRv3eeKkdmgWIT6JtJL8
	 Jby15npQ56gseCHcB7PlHwoh63xHA7WyIfkTyYrRZj6LtvQMnMPKnowT3F3m3Rxp2xEcY
	 xmLu1mUQilADzvw0LIKjCHlY4N3hwTJXpNXFgvx3/wQF297O5dUADddBc24V4sJYfqw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795470599;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=zwNEeDvOVusmeAQdo4z61AwnLFJmDlMP+yRvpV7l7Zk=;
	b=S71pBMt4avc/3DgnDhuoJ6+09h9GpUscdpwgF4oOULI1P50o77FPvfY9tDEv13vAKxZ9
	 ekcHoF2oy4e6if5B/byxLlcurp6Sw4zXNRc494Z7FUxzGmrNS/vPbayPLYfsqp9YEqdpd
	 2zn6IfQtSpXkeJhbASrYnOGQ+jN11E3ufkoBE+SNCpdRSGrklN3ZwHVTY9aMH0EHUp8X6
	 9N7adkCbAXxLPRbDT79t1DnsSOTc3MfV5y5rY93i9T0V+xaKsWMOAFhX57f7wF1j62Nki
	 LslJQ7Z26DgQluhtYJOvDGls1bPu6Q/GKOajmB9okC9P2hHbG0eFKlmBlnu8wh0M5Bg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795470599;
	bh=zwNEeDvOVusmeAQdo4z61AwnLFJmDlMP+yRvpV7l7Zk=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=I9yvKMjMRGPOfBQtQnSr9/vg1lNNWwTp9g1Yq42WF8dvL1citf3L0RYrvVME0Lw1a
	 hOFCMlqS2KZuKEgcNk5HJLs1scp5n04C92B4AmusKCJkXVeNndY7JF6KBomY5//1uE
	 DymR8/W3H9HgII7ng9YlyCVXt//ENeytywiuLiOLNTPYe1mUO9XfQ/6Xi7W+2ekwPg
	 0WxME7MXWQm9R3W/3GHD7Ydfq707QYfTJWE+cmiaWKWRQVdbdv9BboEuXBSx9FWSvW
	 SLX828DuF+d2p17jM1hVKqCul0v8IjZolo+hm0lK7gTXYG+yzwsADoGeyxMvUrK7n+
	 H0i8+Kk/dT39w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 29C17406D8;
	Mon, 23 Nov 2026 21:49:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id A37D1311
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 21:49:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 395F680DC8
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 21:49:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9jdAfW8GNmvf for <buildroot@buildroot.org>;
 Mon, 23 Nov 2026 21:49:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 3DB3E80D6E
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3DB3E80D6E
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 21:49:54 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 104B04E4160E;
 Mon, 23 Nov 2026 21:49:53 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id D13D760480;
 Mon, 23 Nov 2026 21:49:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 7E45A11E6AA58; Mon, 23 Nov 2026 22:49:47 +0100 (CET)
Date: Mon, 23 Nov 2026 22:49:47 +0100
To: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Cc: buildroot@buildroot.org, Baxiche Su <baxiche@gmail.com>, 
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>
Message-ID: <awS0v6v1hjVPwTEH@windsurf>
References: <20261122205404.3669909-1-angelo.compagnucci@gmail.com>
 <20261123212022.3748880-1-angelo.compagnucci@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261123212022.3748880-1-angelo.compagnucci@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH v2 1/2] package/qt6: drop hashes of removed
 license files
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

On Mon, Nov 23, 2026 at 10:20:21PM +0100, Angelo Compagnucci wrote:
> qt6languageserver, qt6mqtt, qt6opcua and qt6websockets have a hash for
> LICENSES/Qt-GPL-exception-1.0.txt. Upstream removed this file from
> these modules:
> 
> - qtwebsockets: in 6.8.1;
> - qtmqtt and qtopcua: in 6.8.2;
> - qtlanguageserver: in 6.10.0.
> 
> None of these packages lists the file in its _LICENSE_FILES, so the
> hash is never checked. Drop it.
> 
> Fixes: ecea4d94ac676ae9e66ce3e8799c0ba7dc14cc96 ("package/qt6: bump version to 6.8.1") [2025.02.x, 2026.08.x]
> Fixes: 5ae304d96cb7c4df040ba1bdfedfb09b3d5a3417 ("package/qt6: bump version to 6.9.1") [2026.08.x]
> Fixes: 1ef39b9196e0a5979581187f15fd665ca390c2a0 ("package/qt6: bump version to 6.8.4") [2025.02.x]
> Fixes: 05cd38635a1c2a8e6c44170b5eae8488b0c7a104 ("package/qt6: bump version to 6.11.1") [2026.08.x]

Sorry, but this is not clear to me. Does this mean that some of
license files were gone in 2025.02.x, but others in 2026.08.x? Then
shouldn't this patch be split into several patches, so that we can
backport to 2025.02.x the patches that make sense?

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

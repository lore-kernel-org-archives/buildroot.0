Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF3D3606A31B
	for <buildroot@archiver.kernel.org>; Mon, 19 Oct 2026 16:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=j35eql4j
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9FA3D606AA;
	Mon, 19 Oct 2026 16:59:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LDzUbky7ZtIN; Mon, 19 Oct 2026 16:59:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org BAC33606B1
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792429178;
	b=gECJG5QF/F8qLol0Zayj88KAQ+U9XqKO6YgYyZlLcpUiBCBJHYtMw5dxJg/kutrtWndf
	 ibntidMyWjc9MsvNUvvAnat9LTiAlmvchf7jz5JLjo3wDBBcsaXr1domWQgpisLY9EQu1
	 Pzf4zPtXeEyuYq0H+L/9TjvX+X4a44++5isRPwA3yqIsrz966W7ogB85mEjgT+hdUksfe
	 +i5ZzWkvKbxA8G2DIMDoT14HKReg/xDJebDwmWpt1ACsL3RkbNuNbtii/2I8tLg0/kN+k
	 ykc7FZVH5tvG2HxPzy3qtWUJ1fJfG5qIepkw0dwlLwkV5kh/BCwyB6Dlj3k9hrP9ULQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792429178;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=NQ2dA3D2xcnpwfLSzJ2Yha/r8+aDEhceBR4hfv+RNX0=;
	b=gB99xJivReeY1PUPKmr6qdGLsxJhS9pshFg3Vy2hHeOwtp969nSoa0VMhnUNQQNXx7HV
	 UIK7TnSNhXiqq8+0HFQvy9jeL0sfxbPy9lHw99tIEpjNP94yNgijc2SbDN7jY38nX6twH
	 GbgYbcZKWjfjGKJaacML3G1hLY9Hlki1OCpNqMtBKNlYKYULW6c5uJXM+xw23SxdaXR+H
	 5OdY7Yu4uXAV8z7+aJ0iXTnwt7AYl4FffqYaRvd2wmq6j+YuRyTJWbOywCpDqa1OKrDNQ
	 DnzkFsQRcnh4J+OSe0ZoJnHY/oiCwJ7DULKadid+yK/kQv+Bfwy+BMF9imACRfGrczw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792429178;
	bh=NQ2dA3D2xcnpwfLSzJ2Yha/r8+aDEhceBR4hfv+RNX0=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=j35eql4jCNpqhYNUQJCgT8v3M0AWXIrUtwCWHIsyIuRO0pi1cldNsODWl6tqYDT6c
	 0xsZSkuTpoKdowy6jMa2rklMQm0ZAQ5H8qtH9dxOEV34mkA704U987yyV3uV2twWm5
	 rd7804VZCyHVnjp2ok0ctshKtzL/RVTaKFw50eZD6g1wnLBJgVOFiGrb+t9jsHsOqt
	 APkNP78JaCaNjx0pDcX4luUXwyK9C/kV2w0z6yNXzGDZZY84ABHIadKjxgazO6/Xj5
	 TCDKwFtpE3e9t8V0q0+RSQAkHRxNY7ha8VkjO15oI+J3/hbeuNDHUA1o1I1aqaT4wa
	 XAhBMrtuMrm9w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BAC33606B1;
	Mon, 19 Oct 2026 16:59:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0857223A
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 16:59:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 05B5C80D92
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 16:59:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CqRuUJUWPHld for <buildroot@buildroot.org>;
 Mon, 19 Oct 2026 16:59:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 1D90B80D6F
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792429177;
 b=OGAY8O7apI2Sc1fjoa1Mi+WmseT2N+1zdSVdajiVwQVjuhRchZ0k5ovwUmf7q0yfqE4S
 2MNZyGTmyqvQubqtx7jj1MHIopBQqrX/tcHfyS70qff5/v2sRYaLR9NSQX3gOHfRCCxDb
 4zCx+wTir3ShONmBJO4EIp9kcCpdmvnOAg0zxdwdwtue3d1t1mk91IVq/s9PS/XFw1LHM
 DL8dg1zWAMKXXs474H9xSDuQ5ym4I8W9Cj4mbuc5BU+VSVZAI5LrdwtKPRB2ebLxxYK9u
 KT9/kzU7uEUGqoBMZESzobS8dloMLaZeZj36NcI6FWCHYtnlToiuCQz9pT/sFAenvig==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792429177;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:Content-Transfer-Encoding:In-Reply-To:
 X-Last-TLS-Session-Version;
 bh=Qygs2K1KNo2ozrwaFRSws+8h4oKKjJL17d7GH0DBHNk=;
 b=PqVLTN1y0oERIkAr0SxyIBtaA2/AloQl6n6EO8LbqDyFDRwZXn5oVJhz90w2OfoN53WH
 qDN0RIhD3S/ecm1B3taQaK9bfA+jiIntBFqqtSxxnwe9aAZ+SK4a8XAssnQz9ourgFjPz
 CaKYnam+t6bbjurVi3sulcwrYMKqDO6omFWwMJxFLtjFJUN6b8iB09F0aTSFGQpaQrYCP
 n3Z9BvV5JkEkEMxzGuDOM6oZbqCTTgLQQIgO8swVYw2hi4MeBOn3vE43tjWPOVdVnHf4e
 8kRIcRL38Q3GmNTbD0A+73FEwer3mntbHyxbMC16GgCXtsnd5zwQmzdGjSlPBBmRmEQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=oMsYn6sV; 
 arc=none smtp.remote-ip=185.171.202.116
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1D90B80D6F
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 16:59:36 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 48E58C5CD5B;
 Mon, 19 Oct 2026 17:00:33 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 2552760582;
 Mon, 19 Oct 2026 16:59:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id EC3A610328429; 
 Mon, 19 Oct 2026 18:59:29 +0200 (CEST)
Date: Mon, 19 Oct 2026 18:59:29 +0200
To: Alexis =?utf-8?Q?Lothor=C3=A9?= <alexis.lothore@bootlin.com>
Cc: buildroot@buildroot.org, 
 Ricardo Martincoski <ricardo.martincoski@datacom.com.br>
Message-ID: <atZMbZkyz2RaIUJ6@windsurf>
References: <20261019-fix_crng_init_slow-v1-1-48ad2d5008d6@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261019-fix_crng_init_slow-v1-1-48ad2d5008d6@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH] support/testing: use host entropy for ARMv7
 emulation
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Oct 19, 2026 at 05:39:54PM +0200, Alexis Lothor=E9 via buildroot wr=
ote:
> When running tests depending on entropy pool being ready on armv7 (eg:
> test_openscap.py, which runs the 'oscap' binary, which tries to get
> random bytes, even with simple commands), the test may fail on timeout
> due to the entropy pool not being ready; this is confirmed by the test
> being blocked until "crng init done" line appears in the kernel logs.
> =

> A solution could be to just increase the test timeout to a value large
> enough to make sure that the entropy pool will be ready in most cases,
> but it may be hard to find a value that fits all use cases, and all
> tests depending on entropy being ready would deserve the same fix.
> =

> Another solution is to replicate what commit 7acb32dabb80
> ("support/testing: add builtin armv5 kernel 4.19 with entropy") did: it
> added the virtio-rng-pci argument to allow the guest machine to use host
> entropy. The armv7 kernel used for testing seems to be built with the
> relevant virtio configuration to allow a similar pass-through, so pass
> virtio-rng-device to armv7 kernel when running tests.
> =

> Signed-off-by: Alexis Lothor=E9 <alexis.lothore@bootlin.com>

Applied to master, thanks!

Best regards,

Thomas Petazzoni
-- =

Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

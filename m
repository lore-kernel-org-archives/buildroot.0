Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58E96606A31A
	for <buildroot@archiver.kernel.org>; Fri, 23 Oct 2026 18:36:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=VfCORcWE
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 52D4381636;
	Fri, 23 Oct 2026 18:36:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9BnTuvAXpXO2; Fri, 23 Oct 2026 18:36:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 9C86281553
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792780574;
	b=MtAKAzWYiWlvIA6aswgyvi+HTKkMSbsS9EVTgXesTnxVL/zcOQninLxuzVl0WZGGM227
	 dqAan7O32/AnX76zGUOODdfGs24U/vna3RNChXFq+pwaTkHMGw1cfZqG3SwnK3vs7Mbbu
	 5wtzpwSw4+1uzLcc6LY3KrU4qHnn6pU1ekdXcTTGE880HuxmPQGJK5w8Ovy19chJdi5sS
	 7QVXfHWGsX/WoxJoC7BnrKpFgHtujq38k3znYq/UlWIRgCLnL6GMGVlYhAwIUGdP/Sp6U
	 voPTiwX2Rib87TDfDRUdR4oAvHBOZ6xhEeA/2aTjrBrjG/8ulOIm+T0t1A5/g05ZKzA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792780574;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=3g1C2eVeH9aAGVTXeTj8IX/TMmL/MimM4iDql1N0O4M=;
	b=Sogxmkza+TE8AQEwicXJ/EHV5kRdfuUy6jNV+QnDZCW39dY8iwb3PblW+YvpIXYNmZ4F
	 UEEXH0KJLDIWrdJufIz5lQ9x/TYYinhGHaPE5ONImfpyzYeoW6u6PEKS8W2pH8as9P6oV
	 b+8nUEqDbIseVf2EWPsH1RLekXm1ZdOy0PDZ48nWf9xBWbIOL6zorsXcm09x8IaGBE1uR
	 NM3KOo2SQldcFMt4qz0/nqRWAF2nZtjp/tAlSMTzBpSa8Txp0Un3+MGi2ouoKEqEjoR9G
	 wzeIlvNIXSvgCCBGxAZbIG76v5F4yUH4jhVzk2Rxc072/+w8wn8YrAirYB2GIOrRQHg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792780574;
	bh=3g1C2eVeH9aAGVTXeTj8IX/TMmL/MimM4iDql1N0O4M=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=VfCORcWEgWyQtzLoQDMW6lHkAmMQUMck3fvmcxXSqQDpVDZX29SfHp0/3rLuqzl/N
	 t4ZQEK2sXEnkcpClZLori76gLDwUT3b3ei5Qzyy36ippXB9w3WuF2SUL3YoAdpB2t5
	 eI3fi4GBSC4sBAHc/e4ML5nnErp7A6tu72qw5kc7fwEQBZr/E3q7cktQDGMRBJGwZ3
	 OUpRsyFX871Sa+TQCZmYMlrIYZA5c1cTVY0sPuqHPqU8iIHKvlTIC+N8CLpo4/Qynb
	 RxB6VYsDUp3Lc6hsI5DD9L+Qpu2a3YHlZjHJbyg4LfrcxcmGg4Pw1xcA3CtSlr1ZDb
	 sm7IzDNdCgjHA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9C86281553;
	Fri, 23 Oct 2026 18:36:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id C3C5F388
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 18:36:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B52B840061
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 18:36:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mIPfNDPe00B6 for <buildroot@buildroot.org>;
 Fri, 23 Oct 2026 18:36:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 0417340059
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792780571;
 b=HLl2QrpYToYV0HpJPwXgXbEu+lnw5JDLpqHLymtS+kwYrg/G3NBRL11SQM5XllYq123n
 nIxwsumOaEeOQ2isNaRZxj43jRTmMaRcbQ72bhUsz1fmDV/zG4k0V7VNz289E8Cp7yZuS
 2gFhjCiyMbFS7PzfLuL6dupr4OKNx+x+g3JPTly6wvWrwMRJV+Q2pYVl7A5dcxp4HO+Yp
 yjZEZ23zCH+9qCG4LCjs1dBlN+7An4zmQYlQGkZfh4Nbjs7aIb+sQ3tShpGeA2k//PrK1
 f6+KifgIos15jx1VbnH/j9bhmz6DjPb5tg/m7YiD1FiDwcEGt/08Hvf9gcjWLc7XHhQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792780571;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:Content-Transfer-Encoding:In-Reply-To:
 X-Last-TLS-Session-Version;
 bh=5ZfddNk4I5p/xKDu8rffYxXLsxKURPlA9d37aAme0Ys=;
 b=BkOeE0A7o9DV8U2yK/bJaBFoJQtRAvOEb8HHEwrVAkdWU0SVU4ABiPbA5C1z25SExX00
 CBVDOEITJuwxkmt2M4WmOauDLvNhJ4reCkZd+CXqbjAB+yqRfzMdv6bBeoA4/Fy1H8Cjc
 dEu4mZ9YUR4xIbAUj66Swcr7TK9hc7W3JBIY8m032Q04IMLng+J1wtJ2VdpB7rJq8jiCT
 /FxtUULr0/rxA3Cqbel1fuGU5nJqapO8accmJdwUFGOaL9v6CHKvleXKUErkMn9JuBXj6
 kHxffjwZiywXK3qoFyP9BuAIH+TfGGfnviiiFaYQzS7qpfhGTo42gIeWlrfoxNYIUkA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=qMQlqmvE; 
 arc=none smtp.remote-ip=185.171.202.116
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0417340059
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 18:36:09 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 1FDA7C51465
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 18:37:07 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 0EEF760398;
 Fri, 23 Oct 2026 18:36:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 6934010328BF4; 
 Fri, 23 Oct 2026 20:36:00 +0200 (CEST)
Date: Fri, 23 Oct 2026 20:35:59 +0200
To: Nevo Hed <nhed+buildroot@starry.com>
Message-ID: <atuo_VcpmUsyejXE@windsurf>
References: <0100019e947c6908-6c76a09a-23cf-406f-82ce-3889dd5dd255-000000@email.amazonses.com>
 <as3sjbzkJ8Teyy8t@windsurf> <87ld81ua4t.fsf@dell.be.48ers.dk>
 <as4sQrV4YU97glMl@windsurf>
 <CABGDZCnqoR7oO_H_dCVUz80An9eixZzXHEk_bEnjC9DEBzHKUA@mail.gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CABGDZCnqoR7oO_H_dCVUz80An9eixZzXHEk_bEnjC9DEBzHKUA@mail.gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH] package/umtprd: expose package build options
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
Cc: Paul Cercueil <paul@crapouillou.net>, arnout@rnout.be,
 buildroot@buildroot.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-6.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,MAILING_LIST_MULTI,
	SPF_HELO_PASS,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Oct 23, 2026 at 12:14:40PM -0400, Nevo Hed wrote:

> So if you guys=A0think its cleaner and easier I can replace this whole pa=
tch with
> the addition of:
> =A0 =A0 ifeq ($(BR2_PACKAGE_SYSTEMD),y)
> =A0 =A0 UMTPRD_BUILD_OPTS +=3D SYSTEMD=3D1
> =A0 =A0 endif

Sounds good to me!

Thanks!

Thomas
-- =

Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

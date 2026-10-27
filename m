Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A858E606A322
	for <buildroot@archiver.kernel.org>; Tue, 27 Oct 2026 08:27:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=bwdRRdYf
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 81BC940604;
	Tue, 27 Oct 2026 08:27:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xjhJKl-bjps1; Tue, 27 Oct 2026 08:27:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 97C454061D
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793089622;
	b=ZnDTkTJyNzV5uKaVMttGga6Po7eizdoMMwybHIaXJSrBSx4jk7W/6h8FEUhX5RDfBEC6
	 3HbaMQIZLxDiOt3DicvorTd3uMZ97yDL7jzkMWIo1WJ8bMfmEUJwvpMvloxvAOCPSGtAF
	 KBNVGqqc12Vmr+jYMH7xZgt/ZQeDL7huTV6ywt8CWKYlfQX35TQiIz4vb0kYtEWmKZb7g
	 biN1Iu2/rYTMI3MyOWCP0v1Gp8TKfZHb54dxSD0OrEd3oz41gmswHsGHMNSYWg7kpN8Up
	 pzeTG6qk/uTCg5olKr82UO5butVRuTAiGCvskvVJ3r+dyESjVmB85HWhrQEgcOPZnpQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793089622;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=FSJARg90DJ/MNCJ9kuq0JtQm0krL7Nk1nfhgyAemxr0=;
	b=dMHUX96Ni8GOTOFYd9KB5/XHHEhXDBoxOz9iUy6XqiqxTcOfTB4EIxitpYreVtaaFNlN
	 qQfhK6tE2lQhwIfHv78JlpAPiw2Vj4OjbadbuqjK3v5NMd/BTuUHa7xlNIc9FmdwfglnJ
	 W2kWP/mohASo9gCwn2LsBrUdLckJF4lAUxH1efCrlYO8Xdwkx4l663l4Mg4c96ENgnNpR
	 2FMNqCP3uikapUJm1laI5KNE7H8Rff2Dhgl7mea3sLvkz2iXcjiph4628d0Lofm3z5jZm
	 rLEC4T8rqEbUfxoayFMRkyg4BzNQg+ZsTZsiOh9yDTnb+B3ba5lecrlJL8OwPJyofeA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793089622;
	bh=FSJARg90DJ/MNCJ9kuq0JtQm0krL7Nk1nfhgyAemxr0=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=bwdRRdYfF8rOwKkNgFZNfpBz8rCZEj6hc/fEL8HKA8KgnjUTF714bKUHepnqzx6i8
	 4RNIKbCIy5j+2qpcqbmGUi+XZn72Cpp6JM1wfWu8DiJBKUFhPjiNq/kywyb5FLRdg5
	 i5fonfZa04pHW3PUX75gMTUvsdL/TqB5xldnMJGR7gi+uqIafoMS+VMDcK/cpceYNt
	 vv9eu4/maW/IYbB7zSgLv8C8Npp5uuG3aneCeKiDxABTeXjYrc2neC5ZBkl7deMXtL
	 mOF56BvcZfFaB0NqN1ajJl6gkyxswh34Ten3pEhmEF9rowXZarDSP4vwd1/KEdX3Xa
	 pkzTeaW8rcwxQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 97C454061D;
	Tue, 27 Oct 2026 08:27:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2EEDF356
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 08:27:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 20AC840621
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 08:27:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MRFM6V0z_wND for <buildroot@buildroot.org>;
 Tue, 27 Oct 2026 08:26:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 7CD7640692
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793089619;
 b=aW0xN2QHga6amwG5IS4ALqa3nRaofRKWMYqaAp0aQ4bYA2PNr7nNYKog0cU8gqBQ4Svf
 zVL455xg5R21PLuwLLk5pl4sqzkCpTI30xC5e9TZ+PC+xwitMpP78C7y+/Z3dYScjuITw
 YOaGw909AQOejCIUi1/axWL2oKU/3nM3SE/g6QKEHkhdi6g5E2D1IVsjzAsCQlQAqWdBs
 9RrJnt5sopmpTUWNBHv4biv43wUpTd507bJWgO7rVf31M7H/XhYgcSDur3rwYqHfyWBRK
 Km3mzmn8+xyYDfyoQHiI6+duuiWH+iVIXwPsvcVXxiiPr1kgM7njX8lYCODJOahrbvg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793089619;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=Elo7Zkr0bvl0jv0dWjF/MerQBQzq5xfYwBV1VUTHQUc=;
 b=BK5u8cy5DHnOtBKlRMat4gIFG/QIhLkIUTypX4X+CC8w/kL9wgZD8Gs2LIit4jvRqKVb
 5XKR006spBJ+eNHcPnMfKHPcsOLUhOflnyxdVKdw2UpVu9xN0N+RxcJnatR79kFEmPAcQ
 B/CyLcm2Ru/fHbEqlqHpY6tGlMpD+I/xVsKOnJdxGmpo+2cu88LTQOvi+Ae3xij839Q2e
 Q236psO4czwRvyRhP1s1H/NQAbeG/ywwXt505oNY2VctYV7mxcndlW4hUhIHDAob4biXc
 Munz8MJ9RFlFOSeENjNUEXI4ZyXKlA9UUX0KvkhPqxGQUIfkaK5Bw8cNEt/BnpUh11A==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=vdxrqg1i; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7CD7640692
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 08:26:58 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id E3F164E41336;
 Tue, 27 Oct 2026 08:26:55 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 943CC603BD;
 Tue, 27 Oct 2026 08:26:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id AA4631032900F; Tue, 27 Oct 2026 09:26:49 +0100 (CET)
Date: Tue, 27 Oct 2026 09:26:48 +0100
To: Arnout Vandecappelle <arnout@rnout.be>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>, 
 buildroot@buildroot.org, Eric Le Bihan <eric.le.bihan.dev@free.fr>, 
 Gary Bisson <bisson.gary@gmail.com>,
 =?utf-8?B?SsOpcsO0bWU=?= Pouiller <jezz@sysmic.org>, 
 Bernd Kuhls <bernd@kuhls.net>, Thomas Perale <thomas.perale@mind.be>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Refik Tuzakli <tuzakli.refik@gmail.com>, 
 Francois Perrad <francois.perrad.86@gmail.com>,
 Petr Vorel <petr.vorel@gmail.com>, 
 Spenser Gilliland <spenser@gillilanding.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>, 
 Pascal de Bruijn <p.debruijn@unilogic.nl>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Romain Naour <romain.naour@gmail.com>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>
Message-ID: <auBf7VXw8uPQfI2X@windsurf>
References: <20261023214807.2151753-1-florian.fainelli@broadcom.com>
 <at0YSHfI0gcUfMtX@windsurf>
 <fceb1e19-e9d3-4342-b1c3-d10e175dc47d@broadcom.com>
 <b8668097-6cd6-49b9-befd-c0ae3f99514f@rnout.be>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b8668097-6cd6-49b9-befd-c0ae3f99514f@rnout.be>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 00/23] Support building the Linux kernel out
 of tree with LINUX_OVERRIDE_SRCDIR
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

On Tue, Oct 27, 2026 at 09:14:26AM +0100, Arnout Vandecappelle wrote:

>  BTW, the original idea was to always have a separate source and build
> directory (where the source would be under output/source and the build
> remains under output/build). For the (hopefully few) packages that _don't_
> support out-of-tree build, we'd rsync from source to build.

That was the original idea indeed.

That being said, I don't think the number of packages that don't
support out of tree build will be just "a few". I suspect that the
significant majority of generic-package packages will not support out
of tree build. So for those, we would now rsync, while we currently do
not have to.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D744D606A31F
	for <buildroot@archiver.kernel.org>; Wed, 28 Oct 2026 19:27:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=b+5OKoX3
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AAA7D40142;
	Wed, 28 Oct 2026 19:27:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DuLTuPkUWjgY; Wed, 28 Oct 2026 19:27:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org C03004047E
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793215625;
	b=J7izxMV2cp+ByZ9fzgIwtW8VrmAEm/qU6ZydWwYKo0wZIA4MUlhf4uOVbcD8Qft4A6or
	 nFwyr/3THKWv/LP7lu/CXqzsbKG0daOQ8GhXkhYSAkKZNbZdDmUt6Zj5w79rotoznVJy7
	 5+7Z2A+/wZYrf0jsX93JMK2hDsNi+q6+GkLDwP6gRZglxzR2rFB5KlkOk18ogGJa+28Ub
	 VYWM0TCD+olKE9a8T+QgbleNuUpeQ+uJOyXCqDo95m0UkZUGhmqrOKGycMd9pGmNoVpWP
	 6e+CXkE8rS6wM99Isgo3O23nw6DygzzAbsRsTmwQ8dR+YFYPvsQBnHRzwv7P+XHBbHg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793215625;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=K8PVQLPc0hkGzv3Fy8aTZB77RJ7hWl7y5OevNlofkcA=;
	b=nz0xD4QdFZ73eFqicvQbzUOrr565kJLIecT/7F8/8SQr7c05us0GxAM7yCTNyLV18QcL
	 Rv1wLOd2flEctcnk71I4gDpsc0OXvHb1Sr3QA4J8ibYxsHdy2OMmP9s5TkED2MRKH9YzW
	 370QwMT4HzNe8TPTsB3wmCRnitK9mDuXXJkuENnDk//2CnG3BeQ4Mp5+ZR/1emLK7tLYp
	 i+IL7EOB7avQ7/kc8odxscJDMpV0Or7DIPmRvVjoxBckzjF4uIYC7CAEHN9ejpKOcBVz5
	 3uyxPuMux5klPHU3yUoLNiStdsbWn+NKIPwbPbvghESE2expP/Z/iWGVVagQwNOCbPw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793215625;
	bh=K8PVQLPc0hkGzv3Fy8aTZB77RJ7hWl7y5OevNlofkcA=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=b+5OKoX3fHkROgx7uNTZw3Jz+53BaFJ0BlFhRvVhUfgM5FYh4kgxRJw7DtKnBpLNe
	 T1hJqWlmmFRPgiZEPlF5ddPIWjndeG4JJgcbLsaOH4WTqvfcT9PqcAnBBIXOZVTN3y
	 puI2e9ZeZl4X9VPHqnYx/JE/kwW8ax6w29u6PPG4Q31cuG/pGfKqZUiuzk1gBo4Rv9
	 n6TkBcSuxQwfl3fC4V/1wD3UPNloUh/JISWoAcYQAiyO4oNFuMiGvILoWMXtdlEP01
	 rHlp/2M+O7aZb1eGQBdAfi3W5OC/xWlmFvOU2iLwJd+WjLTzjd+CN+X2R5T4DxWPRV
	 e7h7maQ7Qo3qA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C03004047E;
	Wed, 28 Oct 2026 19:27:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id D4C26380
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 19:27:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BAA3E605D7
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 19:27:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9dlr78N6Xhik for <buildroot@buildroot.org>;
 Wed, 28 Oct 2026 19:26:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 7641B605D2
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793215618;
 b=AFThizwWHXPDpiycbc+oref8nDH20kdetsZR1zWZ1JESqMwpDcrB1e8ec0YHzG2UhcVs
 hfGJQ5e9EF5d7+4iFHzLRpVSzh97FISRRWXMZ1ZnXZ6Vn1Vyl7pXm3S/egFnKapGSHcya
 oU2J2l+7aE7j/UajtghuHoCEctC7Kh+bci/DNjgNpAZgJi4YX+Ba0ZkHHavtmw1Yg/mn+
 vhRKWyIf/TatmQfDAseiYmMSfPXR4G6Vo0b4CFuoyTOlKNnBJbYMUehBP1aV7crxYyPI1
 Ym12fdmSop2Ug4aKsBj5v+WgXpavjchmHM4+y9gx+fmBTl6V+JzY1j3qGmpjHBc6sZg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793215618;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=0BEG+F7S5dzo3GRZWsdvL7xOFntqZbInC5BGrZmQrys=;
 b=DGAQTzFuWgddFYVPGRJAPliQuLRGWCiNeekgfWgmmqYHk7sxGIAOcoGgcxWa+Y3NVjje
 TzndZqXNk76yeP4gsNFXvMct+WAZ+H6DlnzF2ubw5aT7lpbyIHlmnYgLqZnZ/4W7HTTpf
 xIciGpuaBQQvDX+qqu5hh15fwxMQbYHjVC7aaQYY3M0PvGqb+gSdIIWRPpB85w0nw/SCI
 jMZlqsdwB/pLMxmKTLLk3EssbG5ql+Crw4ZUrXwID3FZeiUrGuTPaIcskJxcoLYekamZx
 rOMdp7HmHs5ZBs0568rjXm6al1ueHip7RPfgdyGldyG2SFl0bJYXXqil+Xi/CofmDSA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=rcbV2V4X; 
 arc=none smtp.remote-ip=185.171.202.116
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7641B605D2
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 19:26:56 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 887CDC4FED5;
 Wed, 28 Oct 2026 19:27:56 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 7B50060769;
 Wed, 28 Oct 2026 19:26:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 9CF49103290E8; Wed, 28 Oct 2026 20:26:51 +0100 (CET)
Date: Wed, 28 Oct 2026 20:26:51 +0100
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Fiona Klute <fiona.klute@gmx.de>, 
 Arnout Vandecappelle <arnout@rnout.be>, buildroot@buildroot.org, 
 Eric Le Bihan <eric.le.bihan.dev@free.fr>, Gary Bisson <bisson.gary@gmail.com>,
 =?utf-8?B?SsOpcsO0bWU=?= Pouiller <jezz@sysmic.org>,
 Bernd Kuhls <bernd@kuhls.net>, Thomas Perale <thomas.perale@mind.be>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Refik Tuzakli <tuzakli.refik@gmail.com>,
 Francois Perrad <francois.perrad.86@gmail.com>, 
 Petr Vorel <petr.vorel@gmail.com>, Spenser Gilliland <spenser@gillilanding.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Pascal de Bruijn <p.debruijn@unilogic.nl>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>, 
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>
Message-ID: <auJMa5u8OoHrgJkm@windsurf>
References: <20261023214807.2151753-1-florian.fainelli@broadcom.com>
 <at0YSHfI0gcUfMtX@windsurf>
 <fceb1e19-e9d3-4342-b1c3-d10e175dc47d@broadcom.com>
 <auCcCZK-kGH25_uM@windsurf>
 <092b4771-dc93-49eb-9803-ccfcf9ccea2b@rnout.be>
 <8605bc8e-8711-4764-8262-f37a1f32adeb@broadcom.com>
 <auD5d-yrritLxAfN@windsurf>
 <d32b0f06-9105-4ee5-99ef-84a6fdda0e41@gmx.de>
 <auI8BTyNtvmooUTW@windsurf>
 <8389fc2e-4265-4d12-8123-2fa6a05f2361@broadcom.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8389fc2e-4265-4d12-8123-2fa6a05f2361@broadcom.com>
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
	SPF_HELO_PASS,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Oct 28, 2026 at 11:34:32AM -0700, Florian Fainelli wrote:

> For generic-package, it already works the way you describe it, with the need
> to add <PKG>_SUPPORTS_OUT_OF_TREE = YES to get out of tree builds, only
> Linux does that for now.
> 
> For autotools-package, we could add this hook:
> 
> $(2)_SUPPORTS_OUT_OF_TREE ?= YES
> 
> and a package can opt-out with setting that to no, however I would probably
> take that as a second step, rather than as part of this patch series in the
> interest of keeping it easier to review and test.

Yes, sounds good to me.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

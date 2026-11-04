Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53CCC606A31B
	for <buildroot@archiver.kernel.org>; Wed,  4 Nov 2026 17:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=j2OUpvZr
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3163780D16;
	Wed,  4 Nov 2026 17:25:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Frc3whwZOMQD; Wed,  4 Nov 2026 17:25:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 65DEC80D81
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793813129;
	b=QtV1b/uCQUpOUyP9gtB5PHTb2Pun8NVlEDlv4Twz2RkMtSOnT+v9wYET6afm6v5665K0
	 Yr45AEVdf45ofyJ8/h5CMB2TexXIlzcxh7AQoKKictv65rWp08iT0u/BK4y2oJDRHTAjz
	 dxtYD4ORMtdGaFF7RJENY0VK6qbyWlf4tyYeUXNk4NnLj3NOqTN4DzQ+199c6JvHPvMUT
	 phbicDnWcO/Jzid3sHalN3JYLbxSHh9SI3pgLE8Ac6zCmQk2SNIOUK63P4rUcFGG+Wxgx
	 wgCupxHvCJQWt/G/5jYrbWUSjY9/eEOOzfhNskv9FB5EpKqoxG0MmltkKWFzsxfdyXw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793813129;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=9gY6tbg9JIK69/Y6A6+pnzXKS6chQh/qjT1G0aGDxqw=;
	b=kynAH6S2dKc8BdXWc1g38BzlVrv8KzI+O2niyBfnOhZPuaWhLnDI1DbHFf6HlshXoW5p
	 kfW28Ben//NsDkdF0uHhnerQ/lBA8MqyN/839SLX1760rk/S15DK//zbUPuXOvdDySxMQ
	 I5vBO6TSsxfIvx/7/t4wQxXCgAKlghze5vbZQpZI6wz8713LL27dc7770bM7WlSnS4Y26
	 H2bBNO3fqoYNIv22bVMoxvlxQvXK0vFSnFddsM2LqdO7nqBuMQ2lW9p+JS0ZMvFH3emk8
	 6RlqxStl9BhRllg/RhGNCOzfnMP2IQeauX1yjg1lrjZQ8BlBG334Wwl3RNK2RwiaNug==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793813129;
	bh=9gY6tbg9JIK69/Y6A6+pnzXKS6chQh/qjT1G0aGDxqw=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=j2OUpvZrfNA0ji+UtpzXwCUnvkLBk89D0EQzPwKENmzyjeROvl9ZWg/QMgHf78Wvo
	 uhMTdawirn5QSV9yNAV2/wxbJlHz7T+QcaQgXvsPg+Zy3WPSrFFiei58GiPCgPZYUE
	 MZ5NMeNPBgrouQPgjF/js1H0YRuw3nIdgzkjGPgx0ZwqUsvgWUkU27fTqr+beRXdYx
	 Ci54N+9EZCqge/XZiqGerPjfcQBPzvwZLFhJSNm7/ehRYyioi8yuZes3BnBIJ7l92D
	 BfW8KJrQrJmuLuxtZ1KdMOf/p1dLAokUt5g/vlr0E06TDFWGMAhqQcPZ7m+r8R6mwR
	 1OAyqCPmX6j/g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 65DEC80D81;
	Wed,  4 Nov 2026 17:25:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 109482B6
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 17:25:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 01BDC80D16
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 17:25:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HEIgUnE73mgz for <buildroot@buildroot.org>;
 Wed,  4 Nov 2026 17:25:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 2FB1780BE9
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2FB1780BE9
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 17:25:26 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id D8A0260145;
 Wed,  4 Nov 2026 18:25:20 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 via
 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr with HTTP (HTTP/1.0
 POST); Wed, 04 Nov 2026 18:25:20 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Wed, 04 Nov 2026 18:25:20 +0100
To: =?UTF-8?Q?Rapha=C3=ABl_M=C3=A9lotte?= <raphael.melotte@mind.be>
Cc: buildroot@buildroot.org, thomas.perale@mind.be,
 titouan.christophe@mind.be, Francois Perrad <francois.perrad.86@gmail.com>
In-Reply-To: <20261103091139.168897-1-raphael.melotte@mind.be>
References: <20261103091139.168897-1-raphael.melotte@mind.be>
User-Agent: Webmail Free/1.6.20
Message-ID: <9f6b6e8d8c8e6bec860555bf41d69d0a@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/1] package/perl-mozilla-ca: security bump
 to version 20261020
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gMDMvMTEvMjAyNiAxMDoxMSwgUmFwaGHDq2wgTcOpbG90dGUgdmlhIGJ1aWxkcm9vdCB3cm90
ZToKPiBWZXJzaW9uIDIwMjYxMDIwIGRlbnlsaXN0cyB0aGUgZW1TaWduIEVDQyBSb290IENBIC0g
RzMgcm9vdCwgdG8gd2hpY2gKPiB0aGUgY29tcHJvbWlzZWQgZU11ZGhyYSBpbnRlcm1lZGlhdGUg
Q0FzIGNoYWluIChbMV0sIFsyXSkuCj4gCj4gQ2hhbmdlczoKPiBodHRwczovL21ldGFjcGFuLm9y
Zy9yZWxlYXNlL0xXUC9Nb3ppbGxhLUNBLTIwMjYxMDIwL2NoYW5nZXMKPiAKPiBbMV06IGh0dHBz
Oi8vZW11ZGhyYS53ZS1oYXZlLWEtcHJvYmxlbS5jb20vCj4gWzJdOiAKPiBodHRwczovL2dyb3Vw
cy5nb29nbGUuY29tL2EvbW96aWxsYS5vcmcvZy9kZXYtc2VjdXJpdHktcG9saWN5L2MvMFIzWExK
TDZGdUUKPiAKPiBTaWduZWQtb2ZmLWJ5OiBSYXBoYcOrbCBNw6lsb3R0ZSA8cmFwaGFlbC5tZWxv
dHRlQG1pbmQuYmU+CgpBcHBsaWVkIHRvIG1hc3RlciwgdGhhbmtzLgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1
aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2J1aWxkcm9vdAo=

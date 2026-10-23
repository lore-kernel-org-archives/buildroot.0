Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68AA2606A31A
	for <buildroot@archiver.kernel.org>; Fri, 23 Oct 2026 09:35:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Mo2ZHyVe
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3CB7440907;
	Fri, 23 Oct 2026 09:35:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5TewePT1rXXz; Fri, 23 Oct 2026 09:35:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org DED004072F
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792748128;
	b=MmhYLP8+N7cxqwK2sLen+kwKL0ioDFrxRg1vg4UfB/6b9Mh5FAMKYr1XOeRxO8VMmL44
	 TSrqR78OzkwoFZSSqR2uyqZedACRCECPM5xsdfK/eZpMbrZjTiWn8cs5YA5CBRvXPxFqb
	 jPq+QhJ9lVlLxlnQiCGM5wcD6aTQ9FTiV3+si+TdTeW8bIws7tQ5q5ZnfQfZDlOjkTKUO
	 noRg6TjaQiWsRJNaeia9VN7Tf4AWRzuIs8qrbw4P8Rsp4bbRceL/cpVLJEkGS9cZQiOFd
	 7FUKa+DKTWLpfg0J8gujfQ+i1f6U0npBYSjONb10pqFx0bHDGasGUI5kgEJnCb04P0Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792748128;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Message-ID:Date:MIME-Version:User-Agent:To:Cc:
	 References:Content-Language:In-Reply-To:X-Last-TLS-Session-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Transfer-Encoding:Content-Type:Errors-To:Sender;
	bh=2Y/OEV4iBrjLMJbX6nQvmG8P6kN0Ygywt03gRqty3pE=;
	b=T3nK5BSBUUuEohbqg6OGegnopMGl8jFNic+V9NZi4jSxQZbOk7kQoUrhaB2cMxXemj7M
	 W3Yyk1gkpRqJR4Q2RxCF3ymr0yhTT1pFrG5fFBWTyEzqgb1YZDnbLz8TXyvZf83Vwn6qk
	 xT013phNyq7lU8xCMNdOk+4bs0tgEArSt17kRk7+JSpa9r27xI4U2PBBoCUJeEWp6SjNo
	 MFw9xh7u/AMwg6Jn+SnlWgK9/9+mklZQ+6hdnFriyPaQ6csZhgzh7yEl2TlIfIuCUrLjM
	 q/V7BCy89ugUTlRAjXasiAjA0gXAK2GXgkAT4FabwHuoxwzqjAW//eUSXoEMFqvQ+Bw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792748128;
	bh=2Y/OEV4iBrjLMJbX6nQvmG8P6kN0Ygywt03gRqty3pE=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Mo2ZHyVexTjjEt/wXsdUDUY/bLQqO+OyVpZlzvXmdyILRTke8TZy/k20wsj/jrEpC
	 8biaCGZoMJptkffkUN6Kw4hrpf9rIklA8odV++Y0TB7jTHxSXrNsILwZXpbUlRc2gG
	 OSWZlJ6Wp1V2K37Y/jTtXwWSoSTb/EgXjmqJHcJqKgaQZZIbD+Q2YYQIoDCfURfCus
	 SGprlOGWI98/xg2pC41ZeADVcDue4kUo+9JPAoTIIBokjWM/tH1Wf0CKMO9CGuwNfO
	 gnnIZ+mu3A+TbAoOwZIpO+mWnqr7oUeTRWY4auDwxU5Mhmv3vzy2dLlDk4q1OpQZ8w
	 iIRrExbju/9AA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DED004072F;
	Fri, 23 Oct 2026 09:35:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id BE3443C1
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 09:35:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B01EC40099
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 09:35:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f7w2SrTSmP3z for <buildroot@buildroot.org>;
 Fri, 23 Oct 2026 09:35:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 5A9FE40122
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792748125;
 b=i+R/Bo95gSWfCgjdUQhjsgjDPEhKLUyXVghNQWXi0mXKDSmG7t0JKwoyCBkZ6saDiHjO
 GIaKFxYGgIlSgISw3eKx+lZk7xtFvR+4A2Bzeak3ZIb0zKJAJVPtOJz2xe+MU0hT6lY9b
 /nidzVPYZb+88LI1wJFDzWb6kcx4hbmu3/rq2i/mr1g2ED8Eojy8ItT5C/ggApw1Kb3Ms
 uBrC+JSzZdzNrleBzlFNPPqC5FJFG0IMkFEMk1iPm1GPS5kW+4YuSm/I07tQkvFDLk5bR
 LAy5yOtAwiU2yaC56+HkLKZU25wMsIPSF7eS7x0OUtc+MNrnl3r03S7PBhnjqfIYPdA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792748125;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Message-ID:
 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
 X-Last-TLS-Session-Version;
 bh=eJboRJ2YLJyZS4OSInizuQ/atrfJ0esL6/v3eKcgY9Y=;
 b=JHJCjBijZVJXOWTsrhqVmiU6Z13Tr9FPxvaYd6hbOMFhoDbNbsASwM+1l+7h3mfw6rI7
 teV/8Py2jkzuoIp0ZziWgmutNA8wC9pNHU+x5Lgf2Eg/M044j0D2dZDfpcSQmwEYyJKpl
 xMfqIQRnBV7daoNZUzhBF34llOc2MClcYKiL1K1BiL48ujPV8LShypZ4CSQzXCAyhw9EX
 W+4z1J9CcuWrm2n9C+7MzjoxFX8JZAyw5Te3a9E/KtmXL/8n6ow7CBkoAL40Sj8islldR
 qxm6vcWMqn/STKFk4Z1aWRhJSf10jI7BXgIkznArxpYw8KZF5C4sVzI1IgfpAaZqekQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=z9ki6z01; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=kory.maincent@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5A9FE40122
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 09:35:24 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id D7BB14E412D2;
 Fri, 23 Oct 2026 09:35:21 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id A461360398;
 Fri, 23 Oct 2026 09:35:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id BA7DA10328501; 
 Fri, 23 Oct 2026 11:35:18 +0200 (CEST)
Message-ID: <294717a0-f196-41ce-8637-44aaa3db4fe7@bootlin.com>
Date: Fri, 23 Oct 2026 11:35:17 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Betterbird (Linux)
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 buildroot@buildroot.org
Cc: Dick Olsson <hi@senzilla.io>, Sergey Matyukevich <geomatsi@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-amarula@amarulasolutions.com
References: <20261022151358.2260712-1-dario.binacchi@amarulasolutions.com>
 <20261022151358.2260712-5-dario.binacchi@amarulasolutions.com>
Content-Language: en-US
In-Reply-To: <20261022151358.2260712-5-dario.binacchi@amarulasolutions.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 4/6] boot/stm32-ddr-phy-binary: new package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Kory Maincent via buildroot <buildroot@buildroot.org>
Reply-To: Kory Maincent <kory.maincent@bootlin.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

CgpPbiAxMC8yMi8yNiAxNzoxMywgRGFyaW8gQmluYWNjaGkgd3JvdGU6Cj4gVGhlIEREUiBQSFkg
ZmlybXdhcmUgYmluYXJpZXMgb2YgdGhlIFNUTWljcm9lbGVjdHJvbmljcyBTVE0zMk1QMiBTb0Nz
Cj4gYXJlIG5vdCBwYXJ0IG9mIHRoZSB1cHN0cmVhbSBURi1BIHNvdXJjZXM6IHRoZXkgbXVzdCBi
ZSByZXRyaWV2ZWQgZnJvbQo+IGEgc2VwYXJhdGUgcmVwb3NpdG9yeSBhbmQgYXJlIHBhY2tlZCBp
biB0aGUgRklQIGJ5IFRGLUEuCgpSZXZpZXdlZC1ieTogS29yeSBNYWluY2VudCA8a29yeS5tYWlu
Y2VudEBib290bGluLmNvbT4KClRoYW5rIHlvdSEKLS0gCkvDtnJ5IE1haW5jZW50LCBCb290bGlu
CkVtYmVkZGVkIExpbnV4IGFuZCBrZXJuZWwgZW5naW5lZXJpbmcKaHR0cHM6Ly9ib290bGluLmNv
bQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRy
b290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1
aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92DDEC35FE3
	for <buildroot@archiver.kernel.org>; Sun, 15 Sep 2024 03:07:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E5C484044B;
	Sun, 15 Sep 2024 03:07:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ckZpDSvnqkLs; Sun, 15 Sep 2024 03:07:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0696740359
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0696740359;
	Sun, 15 Sep 2024 03:07:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D33C61BF25F
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 03:07:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C2EA681E48
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 03:07:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O2UGXlK1cQzu for <buildroot@lists.busybox.net>;
 Sun, 15 Sep 2024 03:07:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::22d; helo=mail-oi1-x22d.google.com;
 envelope-from=christian@aperture.us; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1A39F81E39
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1A39F81E39
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com
 [IPv6:2607:f8b0:4864:20::22d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1A39F81E39
 for <buildroot@buildroot.org>; Sun, 15 Sep 2024 03:07:52 +0000 (UTC)
Received: by mail-oi1-x22d.google.com with SMTP id
 5614622812f47-3e03d17365bso1948735b6e.1
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 20:07:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726369671; x=1726974471;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IHvCAMq2H2L/0aiPsBlH3ZG7NYE1lFwD9GOWoM1RTxg=;
 b=Voq9kBLr8qzYJ7YkiC43asoQ5wY4ov19s//8C+WZF3tQajmSxpFnbLIH9LwtIHY6Z8
 nRj6TQtKpFlESibA2gt+BK0l6gK6sxiFuVpSdGXfon4RwC07C67bPHp7DacDPCq352eW
 iKFmDjp+WebutBc2g+hta4SPaY8P2jPPZB+B+AAoeiaLLdQS0Nw7dKguORbNgJoDwBCv
 m5BeMr/FQ3t5cjDCoDfeuUAWuwkKNRrLsj81vJFuk8pQBHYRMMjH4ePbAwK1FPxfYbVx
 7Kz1DOlRKclvaUL2wFsXmv5DFDBeAhplSAixEB2fPpzuEkuaE4Mtb/obNdOWBExzSDLA
 y2xw==
X-Gm-Message-State: AOJu0YyOPf41O1c9bcpBLPkJSAcMYP+UDFVBcTM4MxD4XleKGmW03h8u
 AAJNHfjSugAZ+m1DB87++32pS1J0tfTr2ohZgbroxyGk7jpRKb+bqhvkz9GSAQh9k5cAw0TcE67
 wpuTwFw==
X-Google-Smtp-Source: AGHT+IEA2kInV4lBUV3+9xS8kYPy6O4aoXcQJ0qK9mkqYUYNXIpQT/2O2O7IGMfufnrdmOBwRxdfwA==
X-Received: by 2002:a05:6808:3994:b0:3e0:3946:b92 with SMTP id
 5614622812f47-3e071b28ccbmr6447221b6e.45.1726369671290; 
 Sat, 14 Sep 2024 20:07:51 -0700 (PDT)
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com.
 [209.85.160.47]) by smtp.gmail.com with ESMTPSA id
 006d021491bc7-5e3b0d7ce80sm480958eaf.11.2024.09.14.20.07.49
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 14 Sep 2024 20:07:50 -0700 (PDT)
Received: by mail-oa1-f47.google.com with SMTP id
 586e51a60fabf-277f0540c3aso1735421fac.3
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 20:07:49 -0700 (PDT)
X-Received: by 2002:a05:6870:972c:b0:270:4d48:6be2 with SMTP id
 586e51a60fabf-27c3f411895mr6845729fac.26.1726369669106; Sat, 14 Sep 2024
 20:07:49 -0700 (PDT)
MIME-Version: 1.0
References: <CAEpB38MKaFVyTLAwjsT6uGEU+w7L9MpUg31Oftqb9oaP2DNPiA@mail.gmail.com>
 <20240914110036.13d08b21@windsurf>
In-Reply-To: <20240914110036.13d08b21@windsurf>
Date: Sat, 14 Sep 2024 20:07:37 -0700
X-Gmail-Original-Message-ID: <CA+h8R2ouJqmjxHv_DswDwOMuJO1Pv9=_3p4uxdNYGR3H=GFbFw@mail.gmail.com>
Message-ID: <CA+h8R2ouJqmjxHv_DswDwOMuJO1Pv9=_3p4uxdNYGR3H=GFbFw@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1726369671; x=1726974471; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IHvCAMq2H2L/0aiPsBlH3ZG7NYE1lFwD9GOWoM1RTxg=;
 b=m0z4rIQwlsViaU52FCcU7+1PqdMvd0azH/LLz8ra7r8lFIPv+19lqhLbQ28tfdg4Ej
 PfSvyfubqpPsCsjkrH+2Te9M8QNktmeD8PV8U8jHN+HSHMxQ5I1twCQlAQ4r4jYrN+Dt
 mb4KUuBcygarxuTaE9+GnqHmsUS8NfVw7Xo0gTE5xGm4zvJFAkS2DuLUfg2pKJ80Isv5
 TkbyHMLMWXP9yyiCgXf+5u1JP8I+ZiJE9hF9xeah+BF8t4IXefHtGqMaNplpjuMr5c9E
 kH6dopyyAxWqzlA3AWNswyYCyKhlqoFrpdiiPKLthukaaaOoYq9ffgsImeMl+S0HGG5+
 y+DQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=aperture.us
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aperture.us header.i=@aperture.us header.a=rsa-sha256
 header.s=google header.b=m0z4rIQw
Subject: Re: [Buildroot] [PATCH v1 1/1] package/go: security bump to version
 go1.22.7
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@aperture.us>
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Christian Stewart via buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgVGhvbWFzLAoKT24gU2F0LCBTZXAgMTQsIDIwMjQgYXQgMjowMOKAr0FNIFRob21hcyBQZXRh
enpvbmkKPHRob21hcy5wZXRhenpvbmlAYm9vdGxpbi5jb20+IHdyb3RlOgo+IEkndmUgYXBwbGll
ZCwgYnV0IHlvdXIgcGF0Y2ggd2FzIGJhZGx5IGxpbmUtd3JhcHBlZC4gQ291bGQgeW91IG1ha2UK
PiBzdXJlIHRvIHVzZSAiZ2l0IHNlbmQtZW1haWwiLCBvciBhZGp1c3QgeW91ciB0b29saW5nPwoK
R21haWwganVzdCBkZXN0cm95cyB0aGUgbGluZSBsZW5ndGggaXQgc2VlbXMuIEl0J3MgaGFyZCB0
byBzZW5kCnBhdGNoZXMgb3IgcGxhaW50ZXh0IGVtYWlscyB2aWEgZ21haWwgYXMgaXQgd3JhcHMg
YXQgNzhjaGFycwoKV2lsbCB0cnkgdG8gZmluZCBhIHNvbHV0aW9uCgpUaGFua3MsCkNocmlzdGlh
bgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJv
b3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVp
bGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=

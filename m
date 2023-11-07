Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0F5AC4332F
	for <buildroot@archiver.kernel.org>; Tue,  7 Nov 2023 07:49:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5E6834059B;
	Tue,  7 Nov 2023 07:49:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5E6834059B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id om2Y8voOKCGw; Tue,  7 Nov 2023 07:49:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8B46740A0F;
	Tue,  7 Nov 2023 07:49:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8B46740A0F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DF2C31BF396
 for <buildroot@lists.busybox.net>; Tue,  7 Nov 2023 07:49:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C2F6F40A0F
 for <buildroot@lists.busybox.net>; Tue,  7 Nov 2023 07:49:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C2F6F40A0F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XmWvv_5o26wd for <buildroot@lists.busybox.net>;
 Tue,  7 Nov 2023 07:49:45 +0000 (UTC)
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com
 [IPv6:2607:f8b0:4864:20::b30])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 769C84059B
 for <buildroot@buildroot.org>; Tue,  7 Nov 2023 07:49:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 769C84059B
Received: by mail-yb1-xb30.google.com with SMTP id
 3f1490d57ef6-da30fd994fdso5556080276.1
 for <buildroot@buildroot.org>; Mon, 06 Nov 2023 23:49:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699343384; x=1699948184;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=viHis71nDPUQfSRa/52ZaAgS52u5oSM8d7oswYeI9bM=;
 b=Qz8QzbIRd6GEcvwhLAb3Lijd2GLTKedjAGYm/3XrQsggkSsWP9NXOOuPGzW/9LbnR5
 Ee4SKvQ0qmFA/8yKVBPEVf3p0pbHB1NfooZYodB1M5z58w6tjdK9/ijeaYiUDpl3Kl2+
 jTIJyD1S4O4g5TJFx8+cYqiQYR3+4hBxGc5svhY0ZMJHgpl5I1kXNK2lO2aS/mO9ELgC
 ZBTpc4L8VFQ2BG0V2mb76ms4VnQ4CRZswh6XBBA9TuOKL6uOwjYCqClOowACo8x2Uo45
 E7b9L2OShqNFxmDJLbhvLlNMcXxpYLMUOzjVBjLpLV0099UBHAqQ7yAukx3nPJF7jvuv
 HPbQ==
X-Gm-Message-State: AOJu0YwL5E/umUAo+zPxmmB3uqMEEj1VIz6d6JDHV3rCb7aPmvAC0jL8
 Ezk7mcrMkwYHBta5L79b3rsibKmsMz17oA9FDxL6MVS/Cn3xbXj0OmltOg==
X-Google-Smtp-Source: AGHT+IENQkzuch9EbENYDj8Mu4jORm/297yY7xqoFKhdh8ZydYr3hqekMJn/uTgJjyeEnbLAS3Slqv5saeCUBRCWhPc=
X-Received: by 2002:a25:77cf:0:b0:da0:3e30:49bd with SMTP id
 s198-20020a2577cf000000b00da03e3049bdmr1539557ybc.24.1699343384322; Mon, 06
 Nov 2023 23:49:44 -0800 (PST)
MIME-Version: 1.0
References: <20231106180304.1835179-1-dario.binacchi@amarulasolutions.com>
 <20231106221135.6ae84287@windsurf>
In-Reply-To: <20231106221135.6ae84287@windsurf>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Tue, 7 Nov 2023 08:49:33 +0100
Message-ID: <CABGWkvoa=FroYqpRQt3YKoWQfF3SkkDu9WNv0A8z35vhb56dLQ@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1699343384; x=1699948184;
 darn=buildroot.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=viHis71nDPUQfSRa/52ZaAgS52u5oSM8d7oswYeI9bM=;
 b=g1Nil3hV6vIj484m+uBBGvCHUrdkytd1d0FBxtzjwGSU3drPt/3LS512fi9HNz20At
 fyHKls7tG7Dgf4sTPtrNEN9y0FT511mFDeI014K/OOxE/JWlHuexq+TFSd0rYzz7YCr7
 pe8KCNXaG/YaDd0MIVUG4RPHg/Lprxvtu+F+g=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=g1Nil3hV
Subject: Re: [Buildroot] [PATCH 1/1] package/uuu: bump to version 1.5.139
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gTW9uLCBOb3YgNiwgMjAyMyBhdCAxMDoxMeKAr1BNIFRob21hcyBQZXRhenpvbmkKPHRob21h
cy5wZXRhenpvbmlAYm9vdGxpbi5jb20+IHdyb3RlOgo+Cj4gT24gTW9uLCAgNiBOb3YgMjAyMyAx
OTowMzowNCArMDEwMAo+IERhcmlvIEJpbmFjY2hpIDxkYXJpby5iaW5hY2NoaUBhbWFydWxhc29s
dXRpb25zLmNvbT4gd3JvdGU6Cj4KPiA+IC1IT1NUX1VVVV9ERVBFTkRFTkNJRVMgPSBob3N0LWJ6
aXAyIGhvc3Qtb3BlbnNzbCBob3N0LXpsaWIgaG9zdC1saWJ1c2IgaG9zdC16c3RkCj4KPiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBeXl5eXl5eXl4g
V2UgYWxyZWFkeSBoYXZlIGhvc3QtemxpYiBoZXJlCj4KPiA+ICtIT1NUX1VVVV9ERVBFTkRFTkNJ
RVMgPSBob3N0LWJ6aXAyIGhvc3Qtb3BlbnNzbCBob3N0LXpsaWIgaG9zdC1saWJ1c2IgaG9zdC16
c3RkIFwKPiA+ICsgICAgIGhvc3QtemxpYgo+Cj4gU28gZG8gd2UgbmVlZCBvbmUgbW9yZSB0aW1l
Pwo+Cj4gVGhpcyBjaGFuZ2UgaXMgYWxzbyBub3QgbGlzdGVkIGluIHRoZSBjb21taXQgbWVzc2Fn
ZS4gSXMgdGhpcyBqdXN0IGEKPiBzcHVyaW91cyBtaXN0YWtlPwoKWWVzLCB5b3UncmUgcmlnaHQu
ClNvcnJ5LgpJJ2xsIHN1Ym1pdCB2MiBmaXhpbmcgaXQuCgpUaGFua3MgYW5kIHJlZ2FyZHMsCkRh
cmlvCgo+Cj4gVGhhbmtzIQo+Cj4gVGhvbWFzCj4gLS0KPiBUaG9tYXMgUGV0YXp6b25pLCBjby1v
d25lciBhbmQgQ0VPLCBCb290bGluCj4gRW1iZWRkZWQgTGludXggYW5kIEtlcm5lbCBlbmdpbmVl
cmluZyBhbmQgdHJhaW5pbmcKPiBodHRwczovL2Jvb3RsaW4uY29tCgoKCi0tIAoKRGFyaW8gQmlu
YWNjaGkKClNlbmlvciBFbWJlZGRlZCBMaW51eCBEZXZlbG9wZXIKCmRhcmlvLmJpbmFjY2hpQGFt
YXJ1bGFzb2x1dGlvbnMuY29tCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCgoK
QW1hcnVsYSBTb2x1dGlvbnMgU1JMCgpWaWEgTGUgQ2FuZXZhcmUgMzAsIDMxMTAwIFRyZXZpc28s
IFZlbmV0bywgSVQKClQuICszOSAwNDIgMjQzIDUzMTAKaW5mb0BhbWFydWxhc29sdXRpb25zLmNv
bQoKd3d3LmFtYXJ1bGFzb2x1dGlvbnMuY29tCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxk
cm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVp
bGRyb290Cg==

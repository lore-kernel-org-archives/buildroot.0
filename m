Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B436CC27C55
	for <buildroot@archiver.kernel.org>; Fri,  7 Jun 2024 06:52:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5AA5F42457;
	Fri,  7 Jun 2024 06:52:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1_6rvPe3CT4V; Fri,  7 Jun 2024 06:52:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2A4214245B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2A4214245B;
	Fri,  7 Jun 2024 06:52:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2F6071BF4DB
 for <buildroot@lists.busybox.net>; Fri,  7 Jun 2024 06:52:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1AF754245B
 for <buildroot@lists.busybox.net>; Fri,  7 Jun 2024 06:52:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xNF7ZaIBeZM9 for <buildroot@lists.busybox.net>;
 Fri,  7 Jun 2024 06:52:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=gael.portay@rtone.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7A37E42457
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7A37E42457
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7A37E42457
 for <buildroot@buildroot.org>; Fri,  7 Jun 2024 06:52:21 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4210aa00c94so16530535e9.1
 for <buildroot@buildroot.org>; Thu, 06 Jun 2024 23:52:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717743139; x=1718347939;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :content-transfer-encoding:mime-version:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=QB5fsDUBwPd63qOCMOiu0WJgI89QBu1JiHuZxqBjaTk=;
 b=UyDVzwkU7C78xSyxmCMfFOhSlHfsEo4Cq18D5YMphxwiCHRiXTZqdefMXUIHe0tqJj
 ab78Yhe4ncbdF2b/dQWJeXppCrhFyFab068+1oFM3CSmQkrssviY5i4oeiXCOyiLm+MB
 8aijE7PW0JeM6r9BdKyry0Gq62VZw74+EDAERRqkasYSmInm1GQy04kI0canA7cOu+GS
 uLb4KWxMyTN9nwlRZicyz5Z0VB70VM1UIJC9ndHC484gGqv5OkWld50BxwJfq6kIZKIF
 zKMTEbFFbAJ3XciZU5l+0nA+oEOlTc3qwQuBYJeO3zK1fRusumOBW0eHOEewYISKDEIr
 TYDw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVgC6Wj7pc9RoodIkWF1ITtGu0gMQ5RDz7kKYhpvO2AaRRoh01QJHokATujOlD1xztDZmjvv2FPx5D5gAYb8g0TPPerjDT+/Q==
X-Gm-Message-State: AOJu0YzO7K/8Z5gIWYChREivoAcNYxjvTgi8o3hsHpp4xXW4aqGiIPtW
 /qxM6TJIVuSGcnz7QGNLYhDa1uoMC6xyqmEmmS6Kaq4wEdmEIeapzd9mC2W2n6j+SMAq1RGY2dH
 iQoU=
X-Google-Smtp-Source: AGHT+IEssxqlEJyFcrJp43Pyu2v1HpHotXZdZk6ZzE73eorDwnyHllRGAmjOdJMhV71sN+OeepjXXA==
X-Received: by 2002:a05:600c:1d8d:b0:421:55a1:afc2 with SMTP id
 5b1f17b1804b1-42164a37103mr14676705e9.38.1717743139201; 
 Thu, 06 Jun 2024 23:52:19 -0700 (PDT)
Received: from localhost ([2a01:e0a:ce:f2f0:2a6b:35ff:feb8:77d9])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42158148f43sm77483635e9.33.2024.06.06.23.52.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Jun 2024 23:52:18 -0700 (PDT)
Mime-Version: 1.0
Date: Fri, 07 Jun 2024 08:52:18 +0200
Message-Id: <D1TL4FV7LWLX.3HU142WOJPYGA@rtone.fr>
From: =?utf-8?q?Ga=C3=ABl_PORTAY?= <gael.portay@rtone.fr>
To: "Athaariq Ardhiansyah" <foss@athaariq.my.id>, "Yann E. MORIN"
 <yann.morin.1998@free.fr>
X-Mailer: aerc 0.17.0
References: <20240427020431.415608-1-gael.portay@rtone.fr>
 <ZmHF4fZb6N9kZ8OR@landeda>
 <8cc5e464-b748-4b81-8b2d-74417b5a3f8d@athaariq.my.id>
In-Reply-To: <8cc5e464-b748-4b81-8b2d-74417b5a3f8d@athaariq.my.id>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rtone.fr; s=google; t=1717743139; x=1718347939; darn=buildroot.org;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :content-transfer-encoding:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QB5fsDUBwPd63qOCMOiu0WJgI89QBu1JiHuZxqBjaTk=;
 b=d/fDzzeCn+9/3zfW4I5dtThvugjMzRE7jYUFyFqgLItsn1bTQmT82FU9v06+zuD0su
 1npySyhS1W6QsY0Bsb50ye+Wb52P0BcAKLHQTEeI5xlv5YeUeQavxiNn1Wx2g+Di2vG4
 Xo88WmdbqMHSGoNbry/Ws4FJxn2L2waDVvIc0=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=rtone.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=rtone.fr header.i=@rtone.fr header.a=rsa-sha256
 header.s=google header.b=d/fDzzeC
Subject: Re: [Buildroot] [RESEND PATCH v3 1/1] configs: add raspberrypi 5
 defconfig
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
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>,
 Martin Bark <martin@barkynet.com>,
 Julien Grossholtz <julien.grossholtz@openest.io>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gQXRoYWFyaXEsCgpPbiBGcmkgSnVuIDcsIDIwMjQgYXQgMjozNiBBTSBDRVNULCBBdGhh
YXJpcSBBcmRoaWFuc3lhaCB3cm90ZToKPiBIZWxsbyBZYW5uLCBHYcOrbCwgYW5kIGFsbAo+Cj4g
VGhhbmtzIGZvciBmaW5hbGx5IGFkZCBSYXNwYmVycnkgUGkgNSBzdXBwb3J0LiBJIHdvdWxkIGxp
a2UgdG8gcmVtaW5kIAo+IHlvdSB0aGF0IHRoZXJlIGlzIGEKPiBsb3Qgb2YgYnVnIGZpeGVzIHNp
bmNlIGN1cnJlbnQgcnBpLWZpcm13YXJlIGNvbW1pdCBpbiBidWlsZHJvb3QuIEhlcmUgaXMgCj4g
dGhlIGZ1bGwgaGlzdG9yeSBvZgo+IHRoZSBmaXhlczoKPgo+IGh0dHBzOi8vZ2l0aHViLmNvbS9y
YXNwYmVycnlwaS9maXJtd2FyZS9jb21taXRzL21hc3Rlci9ib290L2JjbTI3MTItcnBpLTUtYi5k
dGIKPgo+IFRoZXJlZm9yZSwgSSByZWNvbW1lbmQgeW91IHRvIGJ1bXAgcnBpLWZpcm13YXJlIHZl
cnNpb24gYW5kIHVzZSBMaW51eCAKPiB2Ni42LiBJIHNlbnQgYQo+IHBhdGNoIGZvciB0aGlzIGJl
Zm9yZSBHYcOrbCdzIHBhdGNoIGdvdCBtZXJnZWQuIFBsZWFzZSBsZXQgbWUga25vdyBpZiBJIAo+
IG5lZWQgdG8gcmViYXNlCj4gYW5kIHJldmlzZSB0aGUgY2hhbmdlcy4gQ2hlZXJzIQo+Cj4gQmVz
dCByZWdhcmRzLAo+IEF0aGFhcmlxIEFyZGhpYW5zeWFoCgpZb3UgbWF5IGNvbnNpZGVyIHRoZXNl
IHBhdGNoIHNlcmllWzFdIHRoYXQgYnVtcHMgdGhlIGtlcm5lbCB0byA2LjYuMjg7Cml0IG5lZWRz
IGEgcmViYXNlIGFuZCBhbiB1cGRhdGUgZm9yIHRoZSBwaTUuCgpbMV06IGh0dHBzOi8vcGF0Y2h3
b3JrLm96bGFicy5vcmcvcHJvamVjdC9idWlsZHJvb3QvY292ZXIvMjAyNDA0MjcwMTQwNTMuNDEw
Nzg5LTEtZ2FlbC5wb3J0YXlAcnRvbmUuZnIvCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxk
cm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVp
bGRyb290Cg==

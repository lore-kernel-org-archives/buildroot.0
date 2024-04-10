Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 535CDCD11C2
	for <buildroot@archiver.kernel.org>; Wed, 10 Apr 2024 22:06:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E999E60EA5;
	Wed, 10 Apr 2024 22:06:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w5XZfvxvJZV3; Wed, 10 Apr 2024 22:06:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E115760EA9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E115760EA9;
	Wed, 10 Apr 2024 22:06:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 83D331BF40A
 for <buildroot@lists.busybox.net>; Wed, 10 Apr 2024 22:06:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7B18A60EA9
 for <buildroot@lists.busybox.net>; Wed, 10 Apr 2024 22:06:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iGaqFxnX1zum for <buildroot@lists.busybox.net>;
 Wed, 10 Apr 2024 22:06:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::22a; helo=mail-lj1-x22a.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 45A9A60EA5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 45A9A60EA5
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 45A9A60EA5
 for <buildroot@buildroot.org>; Wed, 10 Apr 2024 22:06:18 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-2d88a869ce6so48975971fa.3
 for <buildroot@buildroot.org>; Wed, 10 Apr 2024 15:06:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712786776; x=1713391576;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hEeESuywlMXdFMKkmnLz1WVG+eD7TtLO0Boj6vclynQ=;
 b=MhGt0O0Kc34a/ecv5bzAW7DF/s1O9a7VaYb4TRF7RQ++ljrGAC5VxtqVh6iMcLhR/q
 y6Bpxd0tfFyXtxQz4lrxcjAB8NnbMHJkUSX7Hh7vkS2KcoIcZ4aiUvjWgbqGkoy4e4bS
 tzqeP+clT13bzDxW0bMchNF+dmfkokMFSFJO6CMYods1EBnhdn3CdPl2HpD/WY63/qGI
 6WJQomr/JTr7khqrHGYPVs9tLsTNEeuJTSGznsY8Y4o6WbdcZqvRCR8sCQUgGc7X50Dd
 5/CoUDo5qqHmA81k/hPF1wmTk7GfyncAaaHu7Dt9zBRJked9NOyVBerGx8aZrFe8HreE
 zMeA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX3OFuJJmbHHe03d0gIDe0U6JhQWMUUlxmaqjzkYml45+yYqf2PyxUXABneBMaCFdjdPaxHDfxT31tiG7biKjVCoAJEvwJ98g==
X-Gm-Message-State: AOJu0YzXdpbvM08w2a+1thmeyAaxRLtaipXQwWUVGz9Paf6ONoBQcj5o
 dNajUrECXtU7NtHkCGG9TnVjhfvTp9WaJLk/6NtEg0XbfoF1QOKabes1q+45XNzcCaa9H/y7dRl
 5
X-Google-Smtp-Source: AGHT+IGToSCpj0T2Iw4TPbmiNy+7rWhiCcZkkajG226rP/x2u6FXiLiVrb1/2NKnHtjizUKwHXsqHA==
X-Received: by 2002:a2e:9b56:0:b0:2d6:ecb1:ffb3 with SMTP id
 o22-20020a2e9b56000000b002d6ecb1ffb3mr2656573ljj.25.1712786775823; 
 Wed, 10 Apr 2024 15:06:15 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:e3ef:2d7a:4131:71f?
 (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
 by smtp.gmail.com with ESMTPSA id
 jh4-20020a05600ca08400b004147db8a91asm3435291wmb.40.2024.04.10.15.06.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Apr 2024 15:06:15 -0700 (PDT)
Message-ID: <40416bec-130d-4fd0-80c7-3fdfcc47257d@smile.fr>
Date: Thu, 11 Apr 2024 00:06:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Heiko Thiery <heiko.thiery@gmail.com>, buildroot@buildroot.org
References: <20240404081714.1190807-1-heiko.thiery@gmail.com>
 <20240404081714.1190807-3-heiko.thiery@gmail.com>
Content-Language: fr, en-US
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <20240404081714.1190807-3-heiko.thiery@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1712786776; x=1713391576;
 darn=buildroot.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=hEeESuywlMXdFMKkmnLz1WVG+eD7TtLO0Boj6vclynQ=;
 b=2uZz1AD3S0ooaiURAp7QZ8iWzX2b6Mr8pkOodhpzcD0sdfGF8bDxQMebayPtrvjnfn
 46zZp525DlUnLvJElqkEwOYBqHDBzBsY4OhEJlIOos8riN5ztD+Yr8yhSV7e0t6ntXsf
 4mgiyRS0sEAGs8+e13XDUaFSuks7eoxJu/7B0Jk0HUJSnU3qq3OU8PmC1Yri2nb2ELbk
 3cB2HdHhiGHfJS+FeY8bDevhaMLvkXVFWmLu3y6CxoAgQTLiq6fcLLvLqiSC0qfny2j4
 Y2bnGD2VqWZIvb55tpai49oplRaqNNyLtrPPc6Ay5d7IRYDbTa07qWNDV502MzhknJ4F
 vlww==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=2uZz1AD3
Subject: Re: [Buildroot] [PATCH v2 3/3] uboot/uboot: add new dependency to
 yamllint
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
Cc: michael@amarulasolutions.com, Michael Walle <michael@walle.cc>,
 Asaf Kahlon <asafka7@gmail.com>, Xuanhao Shi <X15000177@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Andreas Dannenberg <dannenberg@ti.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gSGVpa28sCgpMZSAwNC8wNC8yMDI0IMOgIDEwOjE3LCBIZWlrbyBUaGllcnkgYSDDqWNy
aXTCoDoKPiBTaW5jZSBVLUJvb3QgMjAyNC4wNCBbMV0gYmlubWFuIGFsc28gdXNlcyB5YW1sbGlu
dCBhcyBkZXBlbmRlbmN5IFsyXS4KPiAKPiBbMV0gaHR0cHM6Ly9zb3VyY2UuZGVueC5kZS91LWJv
b3QvdS1ib290Ly0vY29tbWl0LzEwZmVlODhkNDJmCj4gWzJdIGh0dHBzOi8vc291cmNlLmRlbngu
ZGUvdS1ib290L3UtYm9vdC8tL2Jsb2IvdjIwMjQuMDQvdG9vbHMvYnVpbGRtYW4vcmVxdWlyZW1l
bnRzLnR4dD9yZWZfdHlwZT10YWdzI0wzCgpTYW1lIGNvbW1lbnQgYXMgZm9yIHRpLWszLXI1LWxv
YWRlci4KClRoZSBzZWNvbmQgdXJsIGlzIG1pc3NpbmcgaW4gdGhlIGNvbW1lbnQuIE1heWJlIHlv
dSBjYW4gYWRkIGl0PwoKQmVzdCByZWdhcmRzLApSb21haW4KCgo+IAo+IFNpZ25lZC1vZmYtYnk6
IEhlaWtvIFRoaWVyeSA8aGVpa28udGhpZXJ5QGdtYWlsLmNvbT4KPiAtLS0KPiAgYm9vdC91Ym9v
dC91Ym9vdC5tayB8IDMgKystCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEg
ZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvYm9vdC91Ym9vdC91Ym9vdC5tayBiL2Jvb3Qv
dWJvb3QvdWJvb3QubWsKPiBpbmRleCAxNDUwMmQ0ZGIyLi4yNmI5YWZkYjAwIDEwMDY0NAo+IC0t
LSBhL2Jvb3QvdWJvb3QvdWJvb3QubWsKPiArKysgYi9ib290L3Vib290L3Vib290Lm1rCj4gQEAg
LTI3OSw3ICsyNzksOCBAQCBpZmVxICgkKEJSMl9UQVJHRVRfVUJPT1RfVVNFX0JJTk1BTikseSkK
PiAgIyBodHRwczovL3NvdXJjZS5kZW54LmRlL3UtYm9vdC91LWJvb3QvLS9ibG9iL3YyMDI0LjAx
L3Rvb2xzL2J1aWxkbWFuL3JlcXVpcmVtZW50cy50eHQKPiAgVUJPT1RfREVQRU5ERU5DSUVTICs9
IFwKPiAgCWhvc3QtcHl0aG9uLWpzb25zY2hlbWEgXAo+IC0JaG9zdC1weXRob24tcHl5YW1sCj4g
Kwlob3N0LXB5dGhvbi1weXlhbWwgXAo+ICsJaG9zdC1weXRob24teWFtbGxpbnQKPiAgVUJPT1Rf
TUFLRV9PUFRTICs9IEJJTk1BTl9JTkRJUlM9JChCSU5BUklFU19ESVIpCj4gIGVuZGlmCj4gIAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290
IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxk
cm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 642E8C433F5
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 20:44:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1AE6881442;
	Sat,  8 Jan 2022 20:44:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id v9mJXMK7yIxZ; Sat,  8 Jan 2022 20:44:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 844E180D8A;
	Sat,  8 Jan 2022 20:44:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A29331BF847
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 20:44:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 80A3460745
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 20:44:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=smile-fr.20210112.gappssmtp.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id E7YVS6ltTi7n for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 20:44:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 07C0C6059D
 for <buildroot@buildroot.org>; Sat,  8 Jan 2022 20:44:51 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id v6so18367880wra.8
 for <buildroot@buildroot.org>; Sat, 08 Jan 2022 12:44:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=IPaHMzGTvsNQXyONujq4Vqxql4MYpLHx0pMznoKHr8g=;
 b=qrL7x7AJGlYYyTIPWGlTVG7OHdzrG1vaSUEDDStd/sxetm18DJ6nRhqbdWjYf+K4o/
 fZbv4m5zFNWOa7dPEsMX9HaN8WQlfbzr/OfiAbEVquSEEGGMRvYIodu/67SYep45PGfc
 HvBZXZ1DoUkL5dmh3U+neQ0ZrnX+gFmOliBQ7ICtV4t3UWmt3u9iiyx+yCeZV3AvutHR
 UaqPc0XEplZejJU/HEonJRj69/sdaHV0R4+Vccks1kqpalv3PLkAs/gKiNmCkrbtx8sx
 P65LKiaeoo6nyi2F+mFQCDOpiyp1dODvx0TrRZ4yIV49OE8/IGPrOk1Q0SfVm0FECyjT
 3bLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=IPaHMzGTvsNQXyONujq4Vqxql4MYpLHx0pMznoKHr8g=;
 b=L4UrYaOYMp+VyCCQ4cU9CigBCeP4cA6sWf8b3GuVKcSa5qg9rOo5zVgcokcXU1VKgy
 Xan4aq71gQaakFEGB1FhAwEkzH43ZR7UgcPMp/2s32V137x2mAvpcMJaTRu0kFYe3g0Q
 Q+3Bdsp+KS+hFQv1YDbAiXW9ZDbBjUt4yO3ldu2D8mn5wF79Pr9YJbeyy9BdZDqpfvOz
 IcJHwzmTeAf37B5SrjRbNN7izjx1Ev92aEnBtyDq/MEOJeJm+EiToadNzpv3cnEtRPiS
 g7XoWC6j1OSvNyEYrsqCxI0MsMLRq1bnQYLrCTZk7mBRZBTkwsAur6JSuPr1GNtwfpVi
 g7VA==
X-Gm-Message-State: AOAM532x8u8gW+sJfZCe1pSCbSXuXbvpzyxjgw9LghF2FwW1MoBs13n8
 rGd78vTDmi5+J6dI5Ty7p4bPcA==
X-Google-Smtp-Source: ABdhPJyAwT3X/Gs5TVvtseKpJp/Ysiyw/HloMPqEBl+G0RtH0u0818KE1/VZLCrRLVGnZDqp2sKMNg==
X-Received: by 2002:a5d:43c5:: with SMTP id v5mr4568785wrr.232.1641674690065; 
 Sat, 08 Jan 2022 12:44:50 -0800 (PST)
Received: from ?IPV6:2a01:cb05:8f8a:1800:1c97:b8d1:b477:d53f?
 (2a01cb058f8a18001c97b8d1b477d53f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:1c97:b8d1:b477:d53f])
 by smtp.gmail.com with ESMTPSA id l7sm2409706wms.1.2022.01.08.12.44.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 08 Jan 2022 12:44:49 -0800 (PST)
Message-ID: <04eb7314-3beb-c40f-483d-aa142f63a0c6@smile.fr>
Date: Sat, 8 Jan 2022 21:44:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: fr
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20200830100058.4180798-1-fontaine.fabrice@gmail.com>
 <20200830100058.4180798-2-fontaine.fabrice@gmail.com>
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <20200830100058.4180798-2-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH/next 2/2] package/libcap: drop host-libcap
 dependency
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gRmFicmljZSwKCkxlIDMwLzA4LzIwMjAgw6AgMTI6MDAsIEZhYnJpY2UgRm9udGFpbmUg
YSDDqWNyaXTCoDoKPiBob3N0LWxpYmNhcCB3YXMgYWRkZWQgYXMgYSBkZXBlbmRlbmN5IG9mIGxp
YmNhcCBpbiBjb21taXQKPiBlZmFlNjA1Yzg4ZGViMTVkOWM1MGZkNjdiZGQ4MGY0NmE3OGIwNmMx
IHdpdGhvdXQgYW55IGV4cGxhbmF0aW9uIGluIHRoZQo+IGNvbW1pdCBtZXNzYWdlLiBEcm9wIHRo
aXMgZGVwZW5kZW5jeSB0aGF0IGRvZXMgc2VlbSB0byBiZSBuZWVkZWQuCgpJIGRvbnQgc2VlIHdo
eSBob3N0LWxpYmNhcCB3b3VsZCBiZSBuZWVkZWQgdG8gYnVpbGQgbGliY2FwIGZvciB0aGUgdGFy
Z2V0LgoKbGliY2FwIGluIFlvY3RvIGRvZXNuJ3QgYWRkIGxpYmNhcC1uYXRpdmUgaW4gZGVwZW5k
ZW5jeToKCmh0dHBzOi8vZ2l0aHViLmNvbS9vcGVuZW1iZWRkZWQvb3BlbmVtYmVkZGVkLWNvcmUv
YmxvYi9tYXN0ZXIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGliY2FwL2xpYmNhcF8yLjYyLmJiCgpU
aGlzIHBhdGNoIG5lZWRzIHRvIGJlIHJlYmFzZWQgb24gbWFzdGVyIHNpbmNlIGhvc3QtZ3BlcmYg
aGFzIGJlZW4gYWRkZWQgcmVuY2VudGx5LgoKQmVzdCByZWdhcmRzLApSb21haW4KCgo+IAo+IFNp
Z25lZC1vZmYtYnk6IEZhYnJpY2UgRm9udGFpbmUgPGZvbnRhaW5lLmZhYnJpY2VAZ21haWwuY29t
Pgo+IC0tLQo+ICBwYWNrYWdlL2xpYmNhcC9saWJjYXAubWsgfCAxIC0KPiAgMSBmaWxlIGNoYW5n
ZWQsIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9saWJjYXAvbGliY2Fw
Lm1rIGIvcGFja2FnZS9saWJjYXAvbGliY2FwLm1rCj4gaW5kZXggMjA4ZjhlYWRlMS4uZWFkNWEx
N2RjYyAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL2xpYmNhcC9saWJjYXAubWsKPiArKysgYi9wYWNr
YWdlL2xpYmNhcC9saWJjYXAubWsKPiBAQCAtMTAsNyArMTAsNiBAQCBMSUJDQVBfU09VUkNFID0g
bGliY2FwLSQoTElCQ0FQX1ZFUlNJT04pLnRhci54ego+ICBMSUJDQVBfTElDRU5TRSA9IEdQTC0y
LjAgb3IgQlNELTMtQ2xhdXNlCj4gIExJQkNBUF9MSUNFTlNFX0ZJTEVTID0gTGljZW5zZQo+ICAK
PiAtTElCQ0FQX0RFUEVOREVOQ0lFUyA9IGhvc3QtbGliY2FwCj4gIExJQkNBUF9JTlNUQUxMX1NU
QUdJTkcgPSBZRVMKPiAgCj4gIGlmZXEgKCQoQlIyX1NUQVRJQ19MSUJTKSx5KQo+IAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxp
bmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5v
cmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK

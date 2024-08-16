Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07E56C3DA4A
	for <buildroot@archiver.kernel.org>; Fri, 16 Aug 2024 05:32:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 86594840CD;
	Fri, 16 Aug 2024 05:32:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JhqLYTmF39H1; Fri, 16 Aug 2024 05:32:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7F3E0840E3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7F3E0840E3;
	Fri, 16 Aug 2024 05:32:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1083E1BF4D5
 for <buildroot@lists.busybox.net>; Fri, 16 Aug 2024 05:32:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F035E60698
 for <buildroot@lists.busybox.net>; Fri, 16 Aug 2024 05:32:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iQDA9S6IiKUO for <buildroot@lists.busybox.net>;
 Fri, 16 Aug 2024 05:32:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=gael.portay@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 153FF60655
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 153FF60655
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 153FF60655
 for <buildroot@buildroot.org>; Fri, 16 Aug 2024 05:32:49 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-42809d6e719so11786625e9.3
 for <buildroot@buildroot.org>; Thu, 15 Aug 2024 22:32:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723786368; x=1724391168;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :content-transfer-encoding:mime-version:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=JGADJdy4B2FPl8a4wIRfKMEF+kIc2ethPBqAopo88hw=;
 b=NUfZYhvNi+nBMaKyw0AK8xkcr/0noXs9QDM7kthkFIG0a7kORw0aZ+yX1G0u0CWIa6
 Qn6xIounKFXj3TkRlnK4JTpttyh15R58+MpUCOKkX1d4LlxKVrf8ideI/SDOtievwiuh
 QzamHAstLu/MWACjyXwzTKQsWZ97jyVrgoeRVxMjsWclOHxHVdbZzl35NH1v87MX1LtF
 skjkp/IWt9yJi6vuOvBb6/Fm7OowrEVKQyO4srTLrX4kCdUX071fohbsbMsPcOKhgZ32
 FhYTOLcM/MKWKJy8QM+AagWuR3yydnO2Frijz+0PSW2lBL4cW/A4eJSjvmJJ8xkevdU9
 9pFA==
X-Gm-Message-State: AOJu0Yw09vwG0I91k35pRvJBz5tmsr+8YRDH721+o5CV4gYpsk8ICzlC
 T/IOjPuZPpqqoJY/0aSUYUHjzQWLkKbjY+lMBTMw2/Zcr3q+BNrr
X-Google-Smtp-Source: AGHT+IGWA5Mh9KeANSWLBq1p3pco23h2n6XD3KahXooY7+DZ7LykD0E8yqxkTRO15mbPBvUzq0bFeA==
X-Received: by 2002:adf:e74e:0:b0:368:665a:4c64 with SMTP id
 ffacd0b85a97d-37194314cc0mr764063f8f.5.1723786367682; 
 Thu, 15 Aug 2024 22:32:47 -0700 (PDT)
Received: from localhost ([2a01:e0a:ce:f2f0:2a6b:35ff:feb8:77d9])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37189849697sm2829218f8f.37.2024.08.15.22.32.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Aug 2024 22:32:46 -0700 (PDT)
Mime-Version: 1.0
Date: Fri, 16 Aug 2024 07:32:46 +0200
Message-Id: <D3H39OJA2KL8.3JP77WTKETT55@gmail.com>
From: =?utf-8?q?Ga=C3=ABl_PORTAY?= <gael.portay@gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
X-Mailer: aerc 0.18.2-0-ge037c095a049
References: <20240809112739.690823-1-gael.portay@rtone.fr>
 <20240809112739.690823-2-gael.portay@rtone.fr> <Zr5h96HMGi0zDS6L@landeda>
In-Reply-To: <Zr5h96HMGi0zDS6L@landeda>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1723786368; x=1724391168; darn=buildroot.org;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :content-transfer-encoding:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JGADJdy4B2FPl8a4wIRfKMEF+kIc2ethPBqAopo88hw=;
 b=HSgchtqWNXT3gxkYs/BpOaptN+KKKwFrq9JE2jxM6vLgMA8/kN2u0GsBeSoP/w5exS
 J6hX/HTmjqgqrM/+rVcMuD1UjIULqyYGDeppxKbem1ON+WiC++mK1CE7WPVGyvM3vvCv
 ZU9u2Yok0Z3lXTuSFIG6A6pNvT+mSUjcxacwJ/w9oEAScri8LViCY7lNkJ7vajiivULG
 1YnM3VHPnbH8kzJ3D0k6tXrlbfX/C4LuXm/OFCSm0Oq9YpgbZgIbHA2klH8frLNjGh4H
 jrXis5IgnWe2PlGRlrme9OxN3gsaf7EvwcwVO7RM+lQSw7x4iisTmVR27Iuyqft64/zj
 Yxkw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=HSgchtqW
Subject: Re: [Buildroot] [PATCH v2 1/3] board/raspberrypi*: remove
 unnecessary symlinks
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
Cc: Julien Grossholtz <julien.grossholtz@openest.io>,
 =?utf-8?q?Ga=C3=ABl_PORTAY?= <gael.portay@rtone.fr>,
 Martin Bark <martin@barkynet.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gWWFubiwKCk9uIFRodSBBdWcgMTUsIDIwMjQgYXQgMTA6MTUgUE0gQ0VTVCwgWWFubiBF
LiBNT1JJTiB3cm90ZToKPiBHYcOrbCwgQWxsLAo+Cj4gT24gMjAyNC0wOC0wOSAxMzoyNyArMDIw
MCwgR2HDq2wgUE9SVEFZIHNwYWtlIHRodXNseToKPiA+IFRoZSByYXNwYmVycnlwaSBzeW1saW5r
cyBpbiBib2FyZCBoYXZlIGFwcGVhcmVkIHNpbmNlIGNvbW1pdCA3YTBjMTM0ZTdjCj4gPiAoYm9h
cmRzL3Jhc3BiZXJyeXBpOiB1cGRhdGUgaW5zdHJ1Y3Rpb25zIGZvciBSYXNwYmVycnkgUGkgMik7
IGV2ZXJ5IG5ldwo+ID4gZGVmY29uZmlnIGFkZHMgaXRzIHN5bWxpbmsgc2luY2UgdGhlbiwgYW5k
IHRoZXkgYXJlIHVubmVjZXNzYXJ5Lgo+ID4gCj4gPiBGdXJ0aGVybW9yZSwgdGhlIGNvbW1pdCA0
N2RhNTVmOTY5IChjb25maWdzL3Jhc3BiZXJyeXBpOiBhZGQgaGFzaGVzKQo+ID4gc2V0cyBCUjJf
R0xPQkFMX1BBVENIX0RJUj0iYm9hcmQvcmFzcGJlcnJ5cGkvcGF0Y2hlcyIgdG8gZXZlcnkgZGVm
Y29uZmlnCj4gPiB3aXRob3V0IGRpc3RpbmN0aW9uIG9mIHRoZSByYXNwYmVycnlwaS4KPiA+IAo+
ID4gVGhpcyByZW1vdmVzIHRoZSB1bm5lY2Vzc2FyeSBzeW1saW5rcyBpbiBib2FyZC8gYW5kIHVw
ZGF0ZXMgdGhlCj4gPiByYXNwYmVycnlwaSBkZWZjb25maWdzIGFjY29yZGluZ2x5Lgo+Cj4gVGhl
IHBvc3QtaW1hZ2Ugc2NyaXB0IHVzZXMgdGhlIGRpcmVjdG9yeSBuYW1lIHdpdGggd2hpY2ggaXQg
d2FzIGNhbGxlZAo+IGFzLCB0byBwaWNrIHRoZSBhcHByb3ByaWF0ZSBnZW5pbWFnZS0qLmNmZyBj
b25maWc6Cj4KPiAgICAgNSBCT0FSRF9ESVI9IiQoZGlybmFtZSAkMCkiCj4gICAgIDYgQk9BUkRf
TkFNRT0iJChiYXNlbmFtZSAke0JPQVJEX0RJUn0pIgo+ICAgICA3IEdFTklNQUdFX0NGRz0iJHtC
T0FSRF9ESVJ9L2dlbmltYWdlLSR7Qk9BUkRfTkFNRX0uY2ZnIgo+Cj4gU28gYnkgcmVtb3Zpbmcg
dGhlIHN5bWxpbmtzIHdoaWxlIG1ha2UgdGhlIHBvc3QtaW1hZ2Ugc2NyaXB0IHRvIGFsd2F5cwo+
IHVzZSB0aGUgc2FtZSBmaWxlLgo+Cj4gRXhjZXB0IHRoYXQgdGhlcmUgZG9lcyBub3QgZXhpc3Qg
YW55IHN1Y2ggY29uZmlnIGZpbGUsIHRoZXkgYXJlIGFsbAo+IGdlbmVyYXRlZCBmcm9tIHRoZSB0
ZW1wbGF0ZSBieSBodGUgcG9zdC1pYW1nZSBzY3JpcHQgaXRzZWxmLgo+Cj4gU28gdGhpcyBpcyBh
bGwgYSBiaXQgbWlzbGVhZGluZy4gSSB0aGluayB0aGUgcG9zdC1pYW1nZSBzY3JpcHQgc2hvdWxk
IGJlCj4gc2ltcGxpZmllZCB0byBub3QgZXhwZWN0IGEgcGVyLWJvYXJkIGdlbmltYWdlLmNmZywg
YW5kIHVuY29uZGl0aW9uYWxseQo+IGdlbmVyYXRlIG9uZSBmcm9tIHRoZSB0ZW1wbGF0ZS4KPgoK
T2gsIG5pY2UgY2F0Y2ghCgpJIGFtIG9uIEhvbGlkYXkgc3RhcnRpbmcgYnkgdG9kYXk7IEkgd2ls
bCBmaXggdGhpcyBvbmNlIEkgdG9vayBieQpkZXNlcnZlZCBicmVpemggb2YgYWlyIChlYXJseSBz
ZXB0ZW1iZXIpLgoKPiBSZWdhcmRzLAo+IFlhbm4gRS4gTU9SSU4uCj4KClJlZ2FyZHMsCkdhw6ts
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9v
dCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWls
ZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==

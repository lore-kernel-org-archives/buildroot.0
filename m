Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07482C25B08
	for <buildroot@archiver.kernel.org>; Wed, 17 Aug 2022 19:35:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 92E0C82F13;
	Wed, 17 Aug 2022 19:35:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 92E0C82F13
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ox9OZ1kvl4oz; Wed, 17 Aug 2022 19:35:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BAABB828EF;
	Wed, 17 Aug 2022 19:35:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BAABB828EF
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 088051BF47E
 for <buildroot@lists.busybox.net>; Wed, 17 Aug 2022 19:35:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D7484828EF
 for <buildroot@lists.busybox.net>; Wed, 17 Aug 2022 19:35:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D7484828EF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cFIeJzP3yQ1o for <buildroot@lists.busybox.net>;
 Wed, 17 Aug 2022 19:35:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EB1ED828C5
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EB1ED828C5
 for <buildroot@buildroot.org>; Wed, 17 Aug 2022 19:35:15 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 ay39-20020a05600c1e2700b003a5503a80cfso1412675wmb.2
 for <buildroot@buildroot.org>; Wed, 17 Aug 2022 12:35:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=kABDJ6OUBmRcrSxtPOnywWz8LrpBHp8vFyuthmzd1yI=;
 b=2O3arHWCigl72IWonuUUyWyTHepgTl7ZM9sTZNzKyJ6VcCnAoAay+ctRbNakaQre0x
 9HATLG+dReyVu2L37haneDAvGxrmpgwDWng+h/9yTMOokvCuPotvS+GAI432wpgIxX6u
 59q5z1mJ6VlRxuF7gdFALmLNGZIRkc/CGlQwmMtOxUcTykSrLpGtP9YykuCODBMUXQ+S
 KT1MBkqw83iA/a2nasi2SRW/bTIb41mWWakvqapuOOqoAa1E6WzwRlGggxgGzIwtgn0E
 4oNlZHSVZmxLP8XWScCRgznlUpxqQ32l8HdeV2CooX4Ep/H3vroNEzw1TpeUPrBcMWdV
 dLOg==
X-Gm-Message-State: ACgBeo0qk+g/y6OcE34sbadmjWRoyf4vARNERF+4VaF9HbtB740RxDDN
 HpqpwpMr7RbWW7IfDr8i3lA=
X-Google-Smtp-Source: AA6agR7WgalkYOvU1SXzH+bhfAGZH+NR69AYxduEJUFt5Y8oJ5573A4LnMqURAvFPQ0Nfmiqtrs9EA==
X-Received: by 2002:a7b:cbd0:0:b0:3a6:9f6:a3e8 with SMTP id
 n16-20020a7bcbd0000000b003a609f6a3e8mr3001656wmi.13.1660764914044; 
 Wed, 17 Aug 2022 12:35:14 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521?
 (2a01cb058f8a18003dbee9eed79eb521.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521])
 by smtp.gmail.com with ESMTPSA id
 az36-20020a05600c602400b003a5fa79007fsm3297216wmb.7.2022.08.17.12.35.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Aug 2022 12:35:13 -0700 (PDT)
Message-ID: <fb8ee027-b516-39e6-7029-3286f3961332@gmail.com>
Date: Wed, 17 Aug 2022 21:35:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Content-Language: en-US
To: Peter Korsgaard <peter@korsgaard.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20220815202955.2216503-1-thomas.petazzoni@bootlin.com>
 <20220816210334.GP2854108@scaer> <87bksjc1ji.fsf@dell.be.48ers.dk>
From: Romain Naour <romain.naour@gmail.com>
In-Reply-To: <87bksjc1ji.fsf@dell.be.48ers.dk>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc;
 bh=kABDJ6OUBmRcrSxtPOnywWz8LrpBHp8vFyuthmzd1yI=;
 b=KX5gmj9/z/1A7c39WsjHH5pmOEp+6GeTP4Rg4/AQu2h0PjKkRMFUXp5avwjrMkeY1T
 lPQ/aFnU966uXTbYC5ulTQ2Qyxppo8exmO+QwE86qAndKIIElo2VnlGfcMiqx2mtY7Gd
 kOE4yh6C9Ywo7F4dDuhFrdNukA6HhJf/RRcxPHUmKPDp2v43/y0fo0DuO60kP7DBH/oG
 c4IcnRe023zbB0nWGSd+d5ybhrRmNfleqMXMQHSsHYjDI7mnJfJN9kaQ/h0dX5GyJl3b
 KHbUHqELgtSzT1xPIgMti/QABiwHn5jlySDrtADitayjN7GTaf8RfBbbPGIYnIj+YgUH
 22wQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=KX5gmj9/
Subject: Re: [Buildroot] [PATCH next] toolchain/toolchain-buildroot: default
 to glibc as the C library
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Buildroot List <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8sCgpMZSAxNi8wOC8yMDIyIMOgIDIzOjM3LCBQZXRlciBLb3JzZ2FhcmQgYSDDqWNyaXTC
oDoKPj4+Pj4+ICJZYW5uIiA9PSBZYW5uIEUgTU9SSU4gPHlhbm4ubW9yaW4uMTk5OEBmcmVlLmZy
PiB3cml0ZXM6Cj4gCj4gID4gVGhvbWFzLCBBbGwsCj4gID4gT24gMjAyMi0wOC0xNSAyMjoyOSAr
MDIwMCwgVGhvbWFzIFBldGF6em9uaSB2aWEgYnVpbGRyb290IHNwYWtlIHRodXNseToKPiAgPj4g
VGhpcyBpcyBwZXJoYXBzIHRoZSBtb3N0IGNvbnRyb3ZlcnNpYWwgY2hhbmdlIGZvciBCdWlsZHJv
b3QgdGhhdCBjYW4KPiAgPj4gYmUgd3JpdHRlbiBpbiBhIHR3by1saW5lci4KPiAgPj4gCj4gID4+
IEhpc3RvcmljYWxseSwgd2UgaGF2ZSB1c2VkIHVDbGliYyBhcyBvdXIgZGVmYXVsdCBDIGxpYnJh
cnksIGFzCj4gID4+IEJ1aWxkcm9vdCB3YXMgY3JlYXRlZCBpbml0aWFsbHkgYXMgYSB0ZXN0LWJl
ZCBmb3IgdUNsaWJjLCBhbmQgYWxzbwo+ICA+PiBiZWNhdXNlIHVDbGliYyBtYWRlIGEgbG90IG9m
IHNlbnNlIGZvciBlbWJlZGRlZCBMaW51eCBzeXN0ZW1zLCBkdWUgdG8KPiAgPj4gaXRzIHNtYWxs
ZXIgc2l6ZSBhbmQgZmluZS1ncmFpbmVkIGNvbmZpZ3VyYWJpbGl0eS4KPiAgPj4gCj4gID4+IFNp
bmNlIHRoZW4sIHRoZSBsYW5kc2NhcGUgb2YgZW1iZWRkZWQgTGludXggc3lzdGVtcyBoYXMgY2hh
bmdlZC4gRXZlbgo+ICA+PiB0aG91Z2ggQnVpbGRyb290IGhhcHBpbHkgc3VwcG9ydHMgcmVhbGx5
IGxvdy1lbmQgZGV2aWNlcywgdGhlIHZhc3QKPiAgPj4gbWFqb3JpdHkgb2YgQnVpbGRyb290IHVz
ZXJzIGFyZSBxdWl0ZSBjZXJ0YWlubHkgcnVubmluZyB0aGUgcmVzdWx0aW5nCj4gID4+IHN5c3Rl
bSBvbiBhIHJlYXNvbmFibHkgcG93ZXJmdWwgcGxhdGZvcm0sIHdpdGggc2lnbmlmaWNhbnQgYW1v
dW50IG9mCj4gID4+IFJBTSBhbmQgc3RvcmFnZS4gSW4gdGhpcyBjb250ZXh0LCB0aGUgYmVuZWZp
dHMgb2YgdUNsaWJjIGFyZSBubyBsb25nZXIKPiAgPj4gdGhhdCBtdWNoIHJlbGV2YW50LCBhbmQg
Z2xpYmMgY2F1c2VzIGxlc3MgInRyb3VibGVzIi4gVGhlcmVmb3JlLCB0aGlzCj4gID4+IHBhdGNo
IHByb3Bvc2VzIHRvIHVzZSBnbGliYyBhcyBvdXIgZGVmYXVsdCBDIGxpYnJhcnkgd2hlbiB1c2lu
ZyB0aGUKPiAgPj4gaW50ZXJuYWwgdG9vbGNoYWluIGJhY2tlbmQgaW5zdGVhZCBvZiB1Q2xpYmMu
Cj4gID4+IAo+ICA+PiBPZiBjb3Vyc2UsIHdlIHdpbGwga2VlcCB0aGUgc3VwcG9ydCBmb3IgdUNs
aWJjLCB3aGljaCByZW1haW5zIGFuCj4gID4+IGltcG9ydGFudCBDIGxpYnJhcnkgY2hvaWNlLCBm
b3Igc3BhY2UtY29uc3RyYWluZWQgc3lzdGVtcywgb3Igc2ltcGx5Cj4gID4+IGZvciBhcmNoaXRl
Y3R1cmVzIHRoYXQgYXJlIG5vdCBzdXBwb3J0ZWQgYnkgZ2xpYmMuCj4gID4+IAo+ICA+PiBTaWdu
ZWQtb2ZmLWJ5OiBUaG9tYXMgUGV0YXp6b25pIDx0aG9tYXMucGV0YXp6b25pQGJvb3RsaW4uY29t
Pgo+IAo+ICA+IEFja2VkLWJ5OiBZYW5uIEUuIE1PUklOIDx5YW5uLm1vcmluLjE5OThAZnJlZS5m
cj4KPiAKPiAgPiBZZXMsIEkgd2lsbCBiZSBhIGJpdCBzYWQgdGhhdCB3ZSBkZW1vdGUgdUNsaWJj
LW5nLCBidXQgbGV0J3MgZmFjZSBpdDoKPiAgPiB0aGUgd29yZCBtb3ZlcyBvbiwgbGV0J3MgbW92
ZSBhbG9uZy4KPiAKPiBBZ3JlZWQuCj4gCj4gQWNrZWQtYnk6IFBldGVyIEtvcnNnYWFyZCA8cGV0
ZXJAa29yc2dhYXJkLmNvbT4KPiAKVGhlIG5leHQgbW92ZSBpcyBwcm9iYWJseSBpbmNyZWFzZSB0
ZXN0aW5nIHdpdGggZ2xpYmMgaW4gdGhlIEJ1aWxkcm9vdCB0ZXN0c3VpdGU/CgpBY2tlZC1ieTog
Um9tYWluIE5hb3VyIDxyb21haW4ubmFvdXJAZ21haWwuY29tPgoKQmVzdCByZWdhcmRzLApSb21h
aW4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRy
b290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1
aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK

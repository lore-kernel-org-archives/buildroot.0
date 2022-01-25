Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37B99C433F5
	for <buildroot@archiver.kernel.org>; Tue, 25 Jan 2022 21:13:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C94D7401D8;
	Tue, 25 Jan 2022 21:13:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id W9BlEPG9Sijr; Tue, 25 Jan 2022 21:13:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D0271401ED;
	Tue, 25 Jan 2022 21:13:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B36D31BF599
 for <buildroot@lists.busybox.net>; Tue, 25 Jan 2022 21:13:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B00A482890
 for <buildroot@lists.busybox.net>; Tue, 25 Jan 2022 21:13:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OWZMp4yzC8ig for <buildroot@lists.busybox.net>;
 Tue, 25 Jan 2022 21:13:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7C26F82882
 for <buildroot@busybox.net>; Tue, 25 Jan 2022 21:13:04 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id p15so33582618ejc.7
 for <buildroot@busybox.net>; Tue, 25 Jan 2022 13:13:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language
 :from:to:cc:references:organization:in-reply-to
 :content-transfer-encoding;
 bh=sXZfJ7MjXy8U8OX67hO4NiE1iANuSyWUUSuAugu9Jgg=;
 b=O0WV05f4lHdUEOFl7Osa62aKHa1YYTTKqsip3DMi34bQgdYznc2j4ocQ8xD/WBdXsg
 xUK3yrULrMpzzU8yXX27+kBby4vG3sAm15ITbZtXKPPwTQsDZ74eJWJQojyLPtUr24E2
 UkqdsbMggSVxdlcVlBOcz3r0aSuHBlXZBIgbmL2OHcqt7kp/K9qpwTYUCh+E8boVrwuA
 dQIWTLfLnIBu+5cWcOYWjC5LakvYygedr/r2BtfhJGF5bgdniQ+jVq3bf5+4Sg0pWbY+
 VcMAI3/0L1KdhWvQHCpziFU0aYmYNURfqA8BejdxsGE1nupDpsfbqs+s9wkAcbsEjwLj
 RRcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:organization:in-reply-to
 :content-transfer-encoding;
 bh=sXZfJ7MjXy8U8OX67hO4NiE1iANuSyWUUSuAugu9Jgg=;
 b=r6YpE3z3R0qLIHm225BYTjYdF2adAUT4/sJ096sAq8EXM4AuURB2SDDzifpdoTPQi2
 ddKe7/VNIjYP77W9VtLKKWHzatmvvgZOJbSHYcM7ysAl7XZJAgQ38STdiyNsXd04Swbv
 8J2RmSqCy/uVKogiCb3oXCqxynyM/ShOJNRVbzvNGyH8rZoFFCixOE5qClNULJB9IaGb
 kzsCSBAB8oZ/Z4r99UKuH6r5OudCRzge68Q9vE34ZNNNhCA+dbFs7QlWH9qpMIpkqogc
 Tbh0drJOM0vZGHBZd67g849dKtp99duyHqLE5hKamc7iF5FFB3YsiVWVBVLOkf4wqlAf
 wIng==
X-Gm-Message-State: AOAM532ks8qTxidUw1lFOmvZEtnMDMid0YVCD47e8VUHyaLRNIFuxOQt
 1fgErv5/ZHwkz17/3a1UZaApCw==
X-Google-Smtp-Source: ABdhPJyYRR/1EaDw49kyt+FWgmC2J4h6PMGeqOfKiUb4wRFBhz98KNVWt48utUpPsHjCnGFp741uIQ==
X-Received: by 2002:a17:907:1c8a:: with SMTP id
 nb10mr17553308ejc.5.1643145182623; 
 Tue, 25 Jan 2022 13:13:02 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id e15sm8768852edy.46.2022.01.25.13.13.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Jan 2022 13:13:02 -0800 (PST)
Message-ID: <0ff95c8d-0967-e5aa-bb9f-d0d6fe8c1b33@mind.be>
Date: Tue, 25 Jan 2022 22:13:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-GB
From: Arnout Vandecappelle <arnout@mind.be>
To: Norbert Lange <nolange79@gmail.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20201017221743.160029-1-nolange79@gmail.com>
 <20201017221743.160029-2-nolange79@gmail.com>
 <20220109151653.GC1477939@scaer>
 <CADYdroOukmBWuv749KyKoLe7=icsN3Cogp1EATm3RbjmwYMDMA@mail.gmail.com>
 <a648c373-3b9f-bae5-96dd-e51760619ced@mind.be>
Organization: Essensium/Mind
In-Reply-To: <a648c373-3b9f-bae5-96dd-e51760619ced@mind.be>
Subject: Re: [Buildroot] [PATCH v2 2/4] package/gcc: use binutils wrappers
 for target libs
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
Cc: buildroot@busybox.net
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Ck9uIDEwLzAxLzIwMjIgMTE6NDMsIEFybm91dCBWYW5kZWNhcHBlbGxlIHdyb3RlOgo+Cj4KPiBP
biAwOS8wMS8yMDIyIDIyOjA4LCBOb3JiZXJ0IExhbmdlIHdyb3RlOgo+PiBBbSBTby4sIDkuIEph
bi4gMjAyMiB1bSAxNjoxNiBVaHIgc2NocmllYiBZYW5uIEUuIE1PUklOCj4+IDx5YW5uLm1vcmlu
LjE5OThAZnJlZS5mcj46Cj4+Pgo+Pj4gTnJvYmVydCwgQWxsLAo+Pj4KPj4+IE9uIDIwMjAtMTAt
MTggMDA6MTcgKzAyMDAsIE5vcmJlcnQgTGFuZ2Ugc3Bha2UgdGh1c2x5Ogo+Pj4+IFRoaXMgd2ls
bCB1c2UgZ2NjLWFyLCBnY2Mtbm0gYW5kIGdjYy1yYW5saWIgaW5zdGVhZCBvZiB0aGUKPj4+PiBu
b3JtYWwgYmludXRpbHMgdG9vbHMuIFRoZSBkaWZmZXJlbmNlIGlzIHRoYXQgd2l0aCB0aGUKPj4+
PiB3cmFwcGVycywgZ2NjIHBsdWdpbnMgd2lsbCBiZSBhdXRvbWF0aWNhbGx5IHBpY2tlZCB1cCwK
Pj4+PiB3aGljaCBtaWdodCBiZSBuZWNlc3Nhcnkgd2l0aCBzb21lIGZsYWdzLgo+Pj4+Cj4+Pj4g
U2lnbmVkLW9mZi1ieTogTm9yYmVydCBMYW5nZSA8bm9sYW5nZTc5QGdtYWlsLmNvbT4KPj4+PiAt
LS0KPj4+PiB2MS0+djI6Cj4+Pj4gKsKgwqAgT25seSBzZXQgdGhvc2Ugd3JhcHBlcnMgaWYgZ2Mg
NC43IG9yIG5ld2VyCj4+Pj4gLS0tCj4+Pj4gwqAgcGFja2FnZS9nY2MvZ2NjLm1rIHwgMyArKysK
Pj4+PiDCoCAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspCj4+Pj4KPj4+PiBkaWZmIC0t
Z2l0IGEvcGFja2FnZS9nY2MvZ2NjLm1rIGIvcGFja2FnZS9nY2MvZ2NjLm1rCj4+Pj4gaW5kZXgg
MTE0YzI4ODdhMC4uYTI0ZmZlM2VlMiAxMDA2NDQKPj4+PiAtLS0gYS9wYWNrYWdlL2djYy9nY2Mu
bWsKPj4+PiArKysgYi9wYWNrYWdlL2djYy9nY2MubWsKPj4+PiBAQCAtOTksNiArOTksOSBAQCBH
Q0NfQ09NTU9OX1RBUkdFVF9DRkxBR1MgKz0gLVduby1lcnJvcgo+Pj4+IMKgIGVuZGlmCj4+Pj4K
Pj4+PiDCoCAjIFByb3BhZ2F0ZSBvcHRpb25zIHVzZWQgZm9yIHRhcmdldCBzb2Z0d2FyZSBidWls
ZGluZyB0byBHQ0MgdGFyZ2V0IGxpYnMKPj4+PiAraWZlcSAoJChCUjJfVE9PTENIQUlOX0dDQ19B
VF9MRUFTVF80XzcpLHkpCgogwqBUaGlzIGlzIGFjdHVhbGx5IG5vdCBuZWVkZWQgLSB0aGUgbG93
ZXN0IEdDQyB2ZXJzaW9uIHdlIGhhdmUgZm9yIHRoZSBpbnRlcm5hbCAKdG9vbGNoYWluIGlzIDgu
CgoKPj4+PiArSE9TVF9HQ0NfQ09NTU9OX0NPTkZfRU5WICs9IEFSX0ZPUl9UQVJHRVQ9Z2NjLWFy
IE5NX0ZPUl9UQVJHRVQ9Z2NjLW5tIAo+Pj4+IFJBTkxJQl9GT1JfVEFSR0VUPWdjYy1yYW5saWIK
Pj4+Cj4+PiBTbyB3ZSB3ZXJlIGEgYml0IHNrZXB0aWNhbCBhYm91dCB0aGlzIG9uZS4KPj4+Cj4+
PiBGaXJzdCwgd2UgYmVsaWV2ZSB0aGF0IG9ubHkgdGhlIGZpbmFsIGdjYyBzaG91bGQgYmUgdXNp
bmcgdGhvc2UuIEluZGVlZCwKPj4+IHdlIGRvIG5vdCBuZWVkIG11Y2ggb2YgdGhlIGluaXRpYWwg
Z2NjLCBleGNlcHQgbGliZ2NjLmEsIHdoaWNoIGFueXdheQo+Pj4gZ2V0cyBvdmVyd2l0dGVuIGJ5
IHRoZSBmaW5hbCBnY2MsIHNvIHdlIGRvIG5vdCBjYXJlIHRoYXQgdGhlIGxpYmdjYy5hIGlzCj4+
PiBidWlsdCB3aXRoIExUTyAoYW5kIHRodXMgdGhlIGdjYyB3cmFwcGVycykuID4+Cj4+PiBTZWNv
bmQsIGdjYyBpbml0aWFsIGlzIG9ubHkgdXNlZCB0byBidWlsZCBnbGliYywgYW5kIGFzIHlvdXIg
cGF0Y2ggNAo+Pj4gc3RhdGVzLCBnbGliYyBtdXN0IG5vdCBiZSBidWlsdCB3aXRoIExUTywgd2Ug
d2UgYWxzbyBkbyBub3QgY2FyZSB0aGF0Cj4+PiB0aGUgaW5pdGlhbCBnY2MgdXNlcyBpdHMgd3Jh
cHBlcnMgdG8gYnVpbGQgbGliZ2NjLgo+Cj4gwqBBbHRob3VnaCBJIG1heSBoYXZlIGJlZW4gdGhl
IG9uZSB0byBtYWtlIHRoaXMgb2J2c2VydmF0aW9uIHRvIGJlZ2luIHdpdGgsIEknbSAKPiBzdGFy
dGluZyB0byBjb21lIGJhY2sgb24gdGhhdC4gRXZlbiB0aG91Z2ggaW5kZWVkIGl0IGlzIHByb2Jh
Ymx5IG5vdCB2ZXJ5IAo+IHVzZWZ1bCB0byBhcHBseSB0aGUgd3JhcHBlcnMgdG8gZ2NjLWluaXRp
YWwsIGl0IGRvZXNuJ3QgaHVydCBlaXRoZXIuIEFuZCBieSAKPiBwdXR0aW5nIGl0IGluIF9DT01N
T05fQ09ORl9FTlYsIHdlIG1ha2Ugc3VyZSB0aGF0IChhbG1vc3QpIGFsbCBvZiB0aGUgb3B0aW9u
cyAKPiBhcmUgdG9nZXRoZXIgaW4gZ2NjLm1rLiBOb3RlIHRoYXQgLS1lbmFibGUtbHRvIGlzIGFs
c28gaW4gQ09NTU9OX09QVFMuCj4KPj4+Cj4+PiBUaGlyZCwgc2hvdWxkbid0IHdlIGJlIHVzaW5n
IHRoZSB0dXBwbGUtcHJlZml4ZWQgd3JhcHBlcnM/IE9yIGRvZXMgaXQKPj4+IGp1c3QgaGFwcGVu
cyB0aGF0IGdjYyB3aWxsIGludGVybmFsbHkgYWRkIGl0cyBidWlsZCBkaXJlY3RvcnkgdG8gUEFU
SCBzbwo+Pj4gdGhhdCBpdCBjYW4gZmluZCB0aGUgdW4tcHJlZml4ZWQganVzdC1idWlsdCBvbmVz
Pwo+Pj4KPj4+IEZvciB0aGF0IGxhc3QgcG9pbnQsIEkgYWRkZWQgZ2NjLWFyLCBnY2Mtbm0sIGFu
ZCBnY2MtcmFubGliIGluIG15IFBBVEgsCj4+PiB0aGF0IGFyZSBqdXN0IHNpbXBsZSB3cmFwcGVy
IHNjcmlwdHMgdGhhdCB0cmFjZSB0aGVpciBiZWluZyBjYWxsZWQsIGFuZAo+Pj4gdGhlbiBjYWxs
IHRvIHRoZSBhY3R1YWwgZ2NjYS1yIGV0IGFsLjoKPj4+Cj4+PiDCoMKgwqDCoCAjIS9iaW4vc2gK
Pj4+IMKgwqDCoMKgIG1lPSIkezB9Igo+Pj4gwqDCoMKgwqAgbXlfbmFtZT0iJHswIyMqL30iCj4+
PiDCoMKgwqDCoCBmb3VuZD1mYWxzZQo+Pj4gwqDCoMKgwqAgZm9yIGkgaW4gJCh3aGljaCAtYSAi
JHtteV9uYW1lfSIpOyBkbwo+Pj4gwqDCoMKgwqDCoMKgwqDCoCBpZiBbICIke2l9IiAtZWYgIiR7
bWV9IiBdOyB0aGVuCj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZm91bmQ9dHJ1ZQo+Pj4g
wqDCoMKgwqDCoMKgwqDCoCBlbGlmICR7Zm91bmR9OyB0aGVuCj4+PiDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgbWU9IiR7aX0iCj4+PiDCoMKgwqDCoMKgwqDCoMKgIGZpCj4+PiDCoMKgwqDCoCBk
b25lCj4+PiDCoMKgwqDCoCBpZiAhICR7Zm91bmR9OyB0aGVuCj4+PiDCoMKgwqDCoMKgwqDCoMKg
IGV4aXQgNDIKPj4+IMKgwqDCoMKgIGZpCj4+PiDCoMKgwqDCoCBwcmludGYgIllFTTogd3JhcHBl
ZCAlc1xuIiAiJHttZX0iCj4+PiDCoMKgwqDCoCBleGVjICIke21lfSIgIiR7QH0iCj4+Pgo+Pj4g
VHVybnMgb3V0IHRoYXQgdGhlICdZRU06IHdyYXBwZWQnIHN0cmluZyBvY2N1cnMgbm93aGVyZSBp
biB0aGUgYnVpbGQKPj4+IGRpcmVjdG9yeSAoc28gaXQgZG9lcyBub3QgZW5kIHVwIGluIGNvbmZp
Zy5sb2cgb3Igd2hhdGV2ZXIpLCBhbmQgaXQKPj4+IGRvZXMgbm90IGV2ZW4gYXBwZWFyIG9uIHRo
ZSBzdGRvdXQvc3RkZXJyIGVpdGhlci4KPj4+Cj4+PiBTbyBJIGFtIHdvbmRlcmluZyBob3cgd2Ug
Y2FuIGV4ZXJjaXNlIHRoZXNlLi4uIEFueSBoaW50Pwo+Pgo+PiBDYW4ndCB0ZWxsIGFueW1vcmUs
IEkgd2VudCB0byBjcm9zc3Rvb2wtbmcgZm9yIHRoZSBjb21waWxlciBzb21lIHRpbWUgYWdvLAo+
PiBzbyB1bmxpa2UgbXkgb3RoZXIgcGF0Y2hlcyBJIGRvbnQgdXNlIHRoZW0gYW55bW9yZS4gPgo+
PiDCoEZyb20gbXkgbWVtb3J5LCBpdCBhZmZlY3RlZCBzb21lIG9mIHRoZSBhZGRpdGlvbmFsIGxp
YnMgZ2NjIGJ1aWxkcywKPj4gbGlic3RkYysrLCBzb21lIHNhbml0aXplcnMgbWF5YmUuCj4+IHRo
ZXJlIHdhcyBub3QgYWJzb2x1dGUgcGF0aHMgb3IgdHVwbGVzIGFzIHRoZSB2YXJpb3VzIHN0YWdl
cyBzaG91bGQKPj4gdXNlIHRoZSB3cmFwcGVycyBmcm9tIHRoZSBwcmV2aW91cyBvbmVzLiBJIGJl
bGlldmUgdGhlIGZpbmFsIGNvbXBpbGVyCj4+IGlnbm9yZXMgUEFUSCBhbmQgdXNlcyB0aGUgc3Rh
Z2UyLWNvbXBpbGVyIHdpdGggYWJzIHBhdGggdG8gYnVpbGQgdGhlCj4+IGluY2x1ZGVkIHRhcmdl
dCBsaWJyYXJpZXMuCj4KPiDCoFRoYXQgaXQgZG9lc24ndCBsb29rIGluIFBBVEggaW5kZWVkIHNv
dW5kcyBmZWFzaWJsZS4KPgo+IMKgSG93ZXZlciwgd2hhdCBpcyB2ZXJ5IHN1cnByaXNpbmcgaXMg
dGhhdCBHQ0MgZG9lc24ndCBhdXRvbWF0aWNhbGx5IHVzZSB0aGUgCj4gcGx1Z2lucyB3aGVuIC0t
ZW5hYmxlLWx0byBpcyBwYXNzZWQuIEJlZm9yZSBibGluZGx5IGFkZGluZyBzb21lIHJhbmRvbSAK
PiBvcHRpb25zLCB3ZSB3YW50IHRvIHJlYWxseSB1bmRlcnN0YW5kIHdoeSBpdCBpcyBuZWVkZWQs
IGluIGNhc2UgbWF5YmUgdGhpbmdzIAo+IGFyZSBhbHJlYWR5IGJyb2tlbiBpbiBzb21lIG90aGVy
IHdheSwgYW5kIHRvIGJlIGFibGUgaW4gdGhlIGZ1dHVyZSB0byBtYWtlIAo+IGNoYW5nZXMgYW5k
IHVuZGVyc3RhbmQgaWYgdGhleSdyZSBPSyBvciBub3QuCj4KPiDCoFRoYXQgc2FpZCwgSSBoYXZl
IGNoZWNrZWQgYW5kIGluZGVlZCwgd2l0aG91dCB0aGVzZSBvcHRpb25zIGl0IHNlZW1zIHRvIHVz
ZSAKPiBwbGFpbiBhciBpbnN0ZWFkIG9mIGdjYy1hci4KPgo+IMKgU28gSSBsb29rZWQgYSBiaXQg
ZGVlcGVyLCBhbmQgZm91bmQgdGhpcyByZWFsbHkgb2xkIGJ1ZyBhYm91dCBlbmFibGluZyBsdG8g
Cj4gZm9yIGxpYmdjYyBbMV0uIEl0IHJlZmVycyB0byBhIGJ1bmNoIG9mIG90aGVyIGlzc3VlcyBm
b3VuZCB3aGlsZSBkb2luZyB0aGlzLgo+Cj4gwqBGb3IgbWUsIGhvd2V2ZXIsIHRoZSBjb25jbHVz
aW9uIGlzIHRoYXQgdGhlIHBhdGNoIHNob3VsZCBiZSBhcHBsaWVkLCBidXQgd2l0aCAKPiBiZXR0
ZXIgZXhwbGFuYXRpb24uIFRoYXQgd2F5LCB5b3UgY2FuIHNldCBCUjJfVEFSR0VUX09QVElNSVpB
VElPTiB0byAtZmx0byBhbmQgCj4gZ2V0IGFuIExUTydlZCBsaWJnY2MvbGlic3RkYysrL2V0Yy4g
SWYgTFRPIGlzIG5vdCB1c2VkLCBpdCBkb2Vzbid0IGhhcm0gdG8gdXNlIAo+IHRoZSB3cmFwcGVy
LgoKIMKgSSBzdW1tYXJpemVkIHRoaXMgZGlzY3Vzc2lvbiBhbmQgYXBwbGllZCB0byBtYXN0ZXIs
IHRoYW5rcy4KCgogwqBSZWdhcmRzLAogwqBBcm5vdXQKCgo+Cj4gwqBUaGVyZSdzIGp1c3Qgb25l
IGxpdHRsZSBjb25jZXJuIHRob3VnaDogSSB0aGluayB0aGUgd3JhcHBlcnMgYXJlbid0IGV2ZW4g
Cj4gZ2VuZXJhdGVkIHVubGVzcyBMVE8gaXMgZW5hYmxlZC4gQnV0IHRoYXQgcG9pbnQgaXMgbW9v
dCAtIHNpbmNlIEdDQyBOICh3aGVyZSBOIAo+ID4gNC45IGFuZCA8IDkpLCBMVE8gaXMgZW5hYmxl
ZCBieSBkZWZhdWx0LCBhbmQgd2UgZG9uJ3QgcGFzcyAtLWRpc2FibGUtbHRvIGlmIAo+IExUTyBp
cyBub3QgZW5hYmxlZC4gSW4gb3RoZXIgd29yZHMsIG5vd2FkYXlzIHRoZSBCUjJfR0NDX0VOQUJM
RV9MVE8gc3ltYm9sIGlzIAo+IHVzZWxlc3MuCj4KPgo+IMKgUmVnYXJkcywKPiDCoEFybm91dAo+
Cj4KPiBbMV0gaHR0cHM6Ly9nY2MuZ251Lm9yZy9idWd6aWxsYS9zaG93X2J1Zy5jZ2k/aWQ9NTk4
OTMKPgo+Cj4KPj4KPj4gSSBhbSBqdXN0IHN1cmUgaXQgd2FzIHZlcnkgZGVsaWJlcmF0ZWx5IGRv
bmUgKnRoaXMqIHdheS4KPj4KPj4gTm9yYmVydAo+PiBfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwo+PiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4+IGJ1aWxk
cm9vdEBidWlsZHJvb3Qub3JnCj4+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2J1aWxkcm9vdAo+PgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qu
b3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9v
dAo=

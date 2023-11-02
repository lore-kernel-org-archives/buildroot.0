Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B88EC4332F
	for <buildroot@archiver.kernel.org>; Thu,  2 Nov 2023 23:44:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E93AC614A4;
	Thu,  2 Nov 2023 23:44:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E93AC614A4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6HRKqFd4EKSq; Thu,  2 Nov 2023 23:44:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4D6446F563;
	Thu,  2 Nov 2023 23:44:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4D6446F563
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EF7861BF398
 for <buildroot@lists.busybox.net>; Thu,  2 Nov 2023 23:44:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BD8A54F114
 for <buildroot@lists.busybox.net>; Thu,  2 Nov 2023 23:44:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BD8A54F114
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id A7VRA9xVvcJK for <buildroot@lists.busybox.net>;
 Thu,  2 Nov 2023 23:43:59 +0000 (UTC)
Received: from smtpdh18-2.aruba.it (smtpdh18-2.aruba.it [62.149.155.133])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 066A84F0A7
 for <buildroot@buildroot.org>; Thu,  2 Nov 2023 23:43:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 066A84F0A7
Received: from [192.168.50.162] ([84.33.84.190])
 by Aruba Outgoing Smtp  with ESMTPSA
 id yhLvqJewppdQyyhLvqN4i2; Fri, 03 Nov 2023 00:43:56 +0100
Message-ID: <e52ca4e8-7651-4de3-b793-cafc6d6c9881@benettiengineering.com>
Date: Fri, 3 Nov 2023 00:43:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20231031120713.678783-1-giulio.benetti@benettiengineering.com>
 <20231101152114.GE114892@scaer>
 <26fabf07-fc17-421b-9cbb-fb721bf63374@benettiengineering.com>
In-Reply-To: <26fabf07-fc17-421b-9cbb-fb721bf63374@benettiengineering.com>
X-CMAE-Envelope: MS4xfPTgYT5UrMj3TqAVPOYGVZ2CtHEd6sCLIHL4E3frUe86Xahnf6mvVb8Vwi8hYo5b59ZZqUgVz65w2nd/zyCouKVxmcaWf1zBB7aXPcmKV29W8VG4l5B1
 fkfppHL+ppzVr8C3oPmP8bpXR5l9Hzvt4+hP9hciT3BDgSX1srHRFCE3qJsBqCLKQX2SL1y+ZZBdqC+R/w7HTV7WgYZ7utFkb3+OfDxdC8rCR2i2hue1Elcu
 1p96OW4n3Pd8sTJ9SJXp/wPSTOGt4lSciJ9u2wujrLg0SxT1GBOfCcrtuVCyB7CrUO+lw7U7CVm4GHG/LSthucdMp/Ax7mP4C32unlr2VIn3wJDBYgqJepv3
 LYdVKadj
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1698968636; bh=JdH/4rhyiIb64pxjVsbs1QNh/Yf+82taN1aQHl0KkMk=;
 h=Date:MIME-Version:Subject:From:To:Content-Type;
 b=CAfrVt8uv/pyXblW7nyXqJo8bewxWwcoY2Eq7JolpRIzdzjk3g/W3v5qDZ3zWl5kv
 bBRbOQmO+YSVFuC+TCDBK1pZPvuyWoZEASq1hkrcBkXvFqdjaANaQ9CFwutp5c/cvS
 PvcaxESMv5aveIu5ND86aG8CJ7GTux1CnlwXOIN9JY4VY27O3DbQAckMiQ8/6TW4R9
 LIZl0JkYCPCiCSPr9dxyHXVH6LvkPy8dwlOpQT40i4j+Cb3Xjj6P12o0JbuqmV0yA6
 xsuUOrLzYVY9OdtiQsyv9FnVhiFvO4dKb8217FVpaHGAX7NwH/mA5cpxaYgs/nTXzb
 Gw4PtO8COdpUg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=CAfrVt8u
Subject: Re: [Buildroot] [PATCH] package/nodejs/nodejs-src: remove .node
 files with different architecture
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
Cc: Daniel Price <daniel.price@gmail.com>, Martin Bark <martin@barkynet.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gMDMvMTEvMjMgMDA6MTYsIEdpdWxpbyBCZW5ldHRpIHdyb3RlOgoKWyBTTklQIF0KCj4+IFRo
ZXJlJ3MgYWxzbyBiaW5kaW5nLmd5cCB0aGF0IGxvb2tzIGxpa2UgaXQgbGlzdHMgd2hhdCB0byBi
dWlsZCB1bmRlcgo+PiB3aGljaCBjb25kaXRpb24uCj4gCj4geWVzLCAuZ3lwIGZpbGUgaXMgYW5v
dGhlciBidWlsZCBzeXN0ZW0sIHNhbWUgTW96aWxsYSBhZG9wdGVkIGZvciAKPiBOU1MobWF5YmUg
c29tZXRoaW5nIGVsc2UpOgo+IGh0dHBzOi8vZ3lwLmdzcmMuaW8vaW5kZXgubWQKPiAKPiBCdXQg
Tm9kZUpTIHNlZW1zIHRvIGRlYWwgd2l0aCBpdCB3aXRob3V0IHRoZSBuZWVkIHRvIGFkZCBhIGd5
cCBpbmZyYS4KCnllcyBpdCBkb2VzIGhhdmUgbm9kZS1neXAgdGhhdCBkZWFscyB3aXRoIHRoYXQg
Zm9ydHVuYXRlbHksCgo+PiBJbiB3aGljaCBjYXNlLCBob3cgZG9lcyBucG0gZGVjaWRlIHRoYXQg
aXQgY2FuIHVzZSBvbmUgc3VjaCBwcmVidWlsZCwgb3IKPj4gd2hldGhlciBpdCBzaG91bGQgY29t
cGlsZSBmcm9tIHRoZSBzb3VyY2UgZmlsZXM/IENhbiB3ZSBmb3JjZSBpdCB0bwo+PiBuZXZlciB1
c2UgcHJlYnVpbGRzIGFuZCBhbHdheXMgY29tcGlsZT8KPiAKPiBJJ20gd29ya2luZyBvbiB0aGlz
IGFmdGVyIHlvdXIgcmV2aWV3LAo+IAo+PiBJJ20gYWZyYWlkIHRoZSBwcm9wb3NlZCBwYXRjaCBq
dXN0IGNvdmVycyB1cCBhIGJpZ2dlciBpc3N1ZSBieSBzd2VlcGluZwo+PiB0aGUgZHVzdCB1bmRl
ciB0aGUgcnVnLi4uIEl0IHdpbGwgaW5kZWVkIG1ha2UgY2hlY2stYmluLWFyY2ggaGFwcHkKPj4g
YmVjYXVzZSBubyBiaW5hcnkgd2lsbCBpbmRlZWQgbWF0Y2ggYW5vdGhlciBhcmNoLCBpbmRlZWQs
IGJ1dCB0aGF0IGRvZXMKPj4gbm90IG1lYW4gdGhlIG1vZHVsZSB3aWxsIGJlIGFjdHVhbGx5IGNv
cnJlY3RseSBpbnN0YWxsZWQuLi4KPiAKPiBleGFjdGx5LAo+IAo+PiBTbyB5ZXMsIG5wbSBpcyBz
dWNoIGEgbWVzcyB0aGF0IG1heWJlIHN3ZWVwaW5nIHRoZSBkdXN0IHVuZGVyIHRoZSBydWcgaXMK
Pj4gdGhlIG9ubHkgc29sdXRpb24gd2UgY2FuIGltcGxlbWVudCwgYnV0IGl0IGlzIGRpc2FwcG9p
bnRpbmcuLi4KPiAKPiBJIHRoaW5rIGl0J3Mgbm90IHRoZSB3YXkgdG8gZ28gYmVjYXVzZSBvZiBs
aWJjLCB0aGF0IGNoYW5nZXMgZXZlcnl0aGluZywKPiAKPj4gTWF5YmUgd2UgY2FuIGp1c3QgYWxz
byBleGNsdWRlIHRoZSBub2RlIG1vZHVsZXMgZnJvbSBjaGVjay1iaW4tYXJjaAo+PiBhbHRvZ2V0
aGVyIGFuZCBiZSBkb25lIHdpdGggaXQ6Cj4+Cj4+IMKgwqDCoMKgIE5PREVKU19TUkNfQklOX0FS
Q0hfRVhDTFVERSA9IC91c3IvbGliL25vZGVfbW9kdWxlcy8KPiAKPiBUaGlzIF5eXiBkb2Vzbid0
IGZpeCB0aGUgbGliYyBwcm9ibGVtLiBJZiB5b3Ugbm06Cj4gdGFyZ2V0L3Vzci9saWIvbm9kZV9t
b2R1bGVzL3NlcmlhbHBvcnQvYmluZGluZ3MtY3BwL2J1aWxkL1JlbGVhc2UvYmluZGluZ3Mubm9k
ZQo+IAo+IHlvdSB3aWxsIHNlZSB0aGF0IE5vZGVKUyBhc3N1bWUgbmF0aXZlIGNvZGUgdG8gYmUg
YnVpbHQgd2l0aCBnbGliYywgc28KPiBJIHJlYWxseSBuZWVkIHRvIGdvIHdpdGggYnVpbGRpbmcg
ZnJvbSBzY3JhdGNoLiBBbmQgdGhpcyB3b3JrcyB1c2luZzoKPiBucG0gcmVidWlsZCAuLi4KClN0
aWxsIG5vdCwgSSdtIHVzaW5nOgpucG0gcGFjayAuLi4uCnRvIGRvd25sb2FkIHRoZSB0YXJiYWxs
IHRoYXQgb25seSBjb250YWlucyB0aGUgbW9kdWxlIGJ1dCBub3QgaXRzCmRlcGVuZGVuY2llcywg
c28gSSBuZWVkIHRvIGV4dHJhY3QgYW5kIHJldHJpZXZlIGFsbCB0aGUgZGVwZW5kZW5jaWVzCmlu
Y2x1ZGluZyAiQHNlcmlhbHBvcnQvYmluZGluZ3MtY3BwIiB0aGF0IG11c3QgYmUgbmF0aXZlbHkg
YnVpbHQgYW5kCml0IGNvbnRhaW5zIHRoZSBwcmVidWlsdCBiaW5hcmllcywgc28gSSB3aWxsIGhh
dmUgdG8gZGVhbCB3aXRoCmluc3RhbGxhdGlvbiBvZiB0aGUgc2luZ2xlIG9zLWFyY2ggZGlyZWN0
b3J5LgoKTm90IGFuIGVhc3kgdGFzaywgYnV0IEknbGwgdGFrZSBjYXJlLgoKQmVzdCByZWdhcmRz
Ci0tIApHaXVsaW8gQmVuZXR0aQpDRU8mQ1RPQEJlbmV0dGkgRW5naW5lZXJpbmcgc2FzCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWls
aW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qu
b3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==

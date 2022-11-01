Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EFE2C433FE
	for <buildroot@archiver.kernel.org>; Tue,  1 Nov 2022 16:44:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EB4BD40604;
	Tue,  1 Nov 2022 16:44:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EB4BD40604
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rbWWPruJdHNS; Tue,  1 Nov 2022 16:44:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EC9F5405C1;
	Tue,  1 Nov 2022 16:44:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EC9F5405C1
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E72481BF859
 for <buildroot@lists.busybox.net>; Tue,  1 Nov 2022 16:44:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CFDCB60AF6
 for <buildroot@lists.busybox.net>; Tue,  1 Nov 2022 16:44:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CFDCB60AF6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dIvcKAuDkGPD for <buildroot@lists.busybox.net>;
 Tue,  1 Nov 2022 16:44:49 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 20156600CC
Received: from smtpcmd04132.aruba.it (smtpcmd04132.aruba.it [62.149.158.132])
 by smtp3.osuosl.org (Postfix) with ESMTP id 20156600CC
 for <buildroot@buildroot.org>; Tue,  1 Nov 2022 16:44:48 +0000 (UTC)
Received: from smtpclient.apple ([146.241.83.94])
 by Aruba Outgoing Smtp  with ESMTPA
 id puNZoxuOOMWOipuNaooli2; Tue, 01 Nov 2022 17:44:46 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Mime-Version: 1.0 (1.0)
Date: Tue, 1 Nov 2022 17:44:35 +0100
Message-Id: <390F45E7-B1AA-4A5D-BA18-F0E31AAD18F6@benettiengineering.com>
References: <20221101083206.GI2992523@scaer>
In-Reply-To: <20221101083206.GI2992523@scaer>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
X-Mailer: iPhone Mail (20A392)
X-CMAE-Envelope: MS4xfBmKbf8hAFqZM50mrxNYScnqipZeDcH/PWnH5uy2lnYAHsAmo+UGNjYvMhhm6opf2rG268T2yCVEGYS7a80t47zaX0hTwnGKb46vmF7JMG/XbnSs3JpG
 amYHIRMd1ZUtxFM/gL14dmia+sEqP4iEK96SwFCIfZl4NtOF71Hbvmoc39ECXBMJnWUm1n65Hc9R/aqFZerajUeFUHjje9Q7W/xo+YkkvaCZEZHDzlZZZzmZ
 Gssn/Q6RmavTSYnKovfhdiS7jRJOgkqmbxNZD7dRm11P9kVx3A7rCOEYgV71e7q+FrVzLmvYu04WMPrK3suFmJSzRny34yt6gid+LEAHn5M=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1667321086; bh=FWhUYLnL2R6UWMWYsF8sCpKRwUYrjpx0YgLUS+G+6Us=;
 h=Content-Type:From:Mime-Version:Subject:Date:To;
 b=my6qWDWV7TXWiU26sx/SVltr/OFmzcRw3hfoM0gfeH5QRqp6yrlX2SlwfnorFx5jJ
 2zy5G/7QB8JBb4bvfo4XjDDFRV9Cstj5ti6tmWEzboCJL2kgSIEZsNkLWO/oJVGUmD
 vaBxXqL7sAKBvivJ0wmL36bt8aTTaAGAftkipwT7xaWGGD/nsEvc9CC+cfvOt6vnsd
 zPC3cFvsAAiAmcgE10Rinut8pBpo4MVsIsXXK0R7hpepQgPczSuJSW6m3/Ukujqy+z
 KWW9ffK5Tr1d4UdCaalWDUqhi9vJhj6j2Gv6lrt7bU6xdKwvMTLkSeEQVurLl53UQu
 Mgf/gA1VhG5Dw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=my6qWDWV
Subject: Re: [Buildroot] [PATCH] package/mono: allow to select which folders
 to install to target
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
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Cj4gSWwgZ2lvcm5vIDEgbm92IDIwMjIsIGFsbGUgb3JlIDA5OjMyLCBZYW5uIEUuIE1PUklOIDx5
YW5uLm1vcmluLjE5OThAZnJlZS5mcj4gaGEgc2NyaXR0bzoKPiAKPiDvu79HaXVsaW8sIEFsbCwK
PiAKPiBPbiAyMDIyLTExLTAxIDAzOjI3ICswMTAwLCBHaXVsaW8gQmVuZXR0aSBzcGFrZSB0aHVz
bHk6Cj4+PiBPbiAzMS8xMC8yMiAxMzo1NCwgWWFubiBFLiBNT1JJTiB3cm90ZToKPj4+IE9uIDIw
MjItMTAtMzEgMTM6MjUgKzAxMDAsIFRob21hcyBQZXRhenpvbmkgdmlhIGJ1aWxkcm9vdCBzcGFr
ZSB0aHVzbHk6Cj4+Pj4gT24gV2VkLCAxOSBPY3QgMjAyMiAwMTo0NjoxNyArMDIwMAo+Pj4+IEdp
dWxpbyBCZW5ldHRpIDxnaXVsaW8uYmVuZXR0aUBiZW5ldHRpZW5naW5lZXJpbmcuY29tPiB3cm90
ZToKPj4+Pj4gQXQgdGhlIG1vbWVudCBhbGwgQVBJcyBmb2xkZXJzIGFyZSBjb3BpZWQgdG8gdGFy
Z2V0IGluY3JlYXNpbmcgdGhlIHNpemUgb2YKPj4+Pj4gcm9vdGZzIG9mIH4xOTBNQi4gQWxsb3cg
dG8gc2VsZWN0IHdoaWNoIEFQSSBmb2xkZXJzIHdlIHdhbnQgdG8gY29weSB0bwo+Pj4+PiB0YXJn
ZXQgdG8gc2hyaW5rIHJvb3RmcyBkb3duLgo+Pj4+PiAKPj4+Pj4gU2lnbmVkLW9mZi1ieTogR2l1
bGlvIEJlbmV0dGkgPGdpdWxpby5iZW5ldHRpQGJlbmV0dGllbmdpbmVlcmluZy5jb20+Cj4+Pj4g
UHJhY3RpY2FsbHkgc3BlYWtpbmcsIGNvdWxkIHlvdSBkZXNjcmliZSB3aGljaCBmb2xkZXJzIGFy
ZSBuZWVkZWQgaW4gYQo+Pj4+IHR5cGljYWwgc2NlbmFyaW8geW91J3ZlIGhhZD8KPj4+IFllcywg
Y2FuIHlvdSBwcm92aWRlIGEgcmF0aW9uYWxlIGZvciB3aGVuIG9ubHkgYSBzdWJzZXQgb2YgQVBJ
cyBpcwo+Pj4gbmVlZGVkPwo+PiBJJ3ZlIGFuc3dlcmVkIG9uIHByZXZpb3VzIGUtbWFpbC4gSSd2
ZSByZWFsaXplZCBvbmx5IG5vdyB0aGF0IEkgY291bGQKPj4gYW5zd2VyIHRvIHlvdXIgZS1tYWls
IGZvciBib3RoLgo+IAo+IEhleSwgd2hhdCB5b3UgYW5zd2VyZWQgVGhvbWFzIGlzIG5vdCBhIHJh
dGlvbmFsZSwgaXQgaXMgYW4gZXhhbXBsZS4gOy0pCj4gQSByYXRpb25hbGUgaXMgImFuIGV4cGxh
bmF0aW9uIG9mIGNvbnRyb2xsaW5nIHByaW5jaXBsZXMgb2Ygb3BpbmlvbiwKPiBiZWxpZWYsIHBy
YWN0aWNlLCBvciBwaGVub21lbmEiLCBvciAiYW4gdW5kZXJseWluZyByZWFzb24iLiBbMF0KPiAK
PiBBcyBhIHJhdGlvbmFsZSwgSSB3b3VsZCBoYXZlIGV4cGVjdGVkIHNvbWV0aGluZyB0aGF0IGV4
cGxhaW5zIHRoZSByZWFzb24KPiB3aHkgdGhlcmUgYXJlIHNvIG1hbnkgZGlyZWN0b3JpZXMsIGFu
ZCBzbyB3aHksIHVuZGVyIHNvbWUgY2lyY3Vtc3RhbmNlcywKPiB3ZSBjYW4gZ2V0IHJpZCBvZiB0
aGVtIChvciBub3QpLiBJdCBuZWVkcyBub3QgYmUgdG9vIGxvbmcsIGJ1dCBqdXN0Cj4gcHJvdmlk
ZSBhbiBvdmVydmlldy4gRm9yIGV4YW1wbGUsIGhlcmUgaXMgYSB0b3RhbGx5IG1hZGUgdXAgYmx1
cmI6Cj4gCj4gICAgbW9ubyBwcm92aWRlcyBzdXBwb3J0IGZvciBhIGxvdCBvZiBsZWdhY3kgQVBJ
cyBmb3IgYmFja3dhcmQKPiAgICBjb21wYXRpYmlsaXR5IGZvciBleGlzdGluZyBhcHBsaWNhdGlv
bnMsIHdheSBiYWNrIGZyb20gdGhlIGZpcnN0Cj4gICAgc3RhYmxlIEFQSSwgMi4wIGFuZCB1cCB0
byB0aGUgY3VycmVudCB2ZXJzaW9uLiBUaGUgc2V0IG9mIEFQSXMgYXJlCj4gICAgc3BsaXQgaW4g
dHdvIGNhdGVnb3JpZXM6IHZlcnNpb24tYmFzZWQgQVBJcywgYW5kIHRoZSByZXN0IChnYWMsIHRo
ZQo+ICAgIEZvb0JhciBzZXQgb2YgY29tbW9uIEJhejsgbW9ub2RvYywgd2hpY2ggcmVuZGVycyBk
b2N1bWVudGF0aW9uIHdoaWxlCj4gICAgcmlkaW5nIGEgdW5pY3ljbGUuLi4pLgo+IAo+ICAgIEZv
ciBhIGN1c3RvbSBhcHBsaWNhdGlvbiwgdGhlIHNldCBvZiByZXF1aXJlZCB2ZXJzaW9uZWQgQVBJ
cyBpcwo+ICAgIGxpbWl0ZWQ7IG1vc3Qgb2Z0ZW4gb25seSB0aGUgbGF0ZXN0IG9yIHRoZSB2ZXJ5
IGZldyBsYXRlc3QgYXJlCj4gICAgbmVlZGVkLiBPbmx5IGdhYyBpcyBhbHdheXMgcmVxdWlyZWQs
IGFuZCBtb25vZG9jIGlzIG5ldmVyIHVzZWQgb24KPiAgICB0aGUgdGFyZ2V0IGFzIHdlIG5ldmVy
IHJlbmRlciB0aGUgZG9jdW1lbnRhdGlvbiB0aGVyZS4KCk9oLCB0aGFuayB5b3UgWWFubiwgbXkg
RW5nbGlzaCBoYXMgc29tZSBnYXAsIEkgZGlkbuKAmXQga25vdyB0aGF0LiBBbmQgdGhhbmtzIGZv
ciB0aGUgZXhhbXBsZSB0b28uClNvIHlvdeKAmXZlIGdpdmVuIGFscmVhZHkgYSByYXRpb25hbGUg
aGVyZS4KCknigJlsbCBjb21lIHVwIHdpdGggYSBWMiBwYXRjaCB0aGVuIQoKQmVzdCByZWdhcmRz
CkdpdWxpbwoKPiAKPiBbMF0gaHR0cHM6Ly93d3cubWVycmlhbS13ZWJzdGVyLmNvbS9kaWN0aW9u
YXJ5L3JhdGlvbmFsZQo+IAo+IFstLVNOSVAtLV0KPj4+PiBTaG91bGQgd2UgaW5zdGVhZCBoYXZl
IGEgc2luZ2xlIHN0cmluZyBvcHRpb24KPj4+PiBCUjJfUEFDS0FHRV9NT05PX0lOU1RBTExfTElC
X0RJUlMsIHdoaWNoIGlzIGVtcHR5IGJ5IGRlZmF1bHQuIFdoZW4KPj4+PiBlbXB0eSwgaXQgbWVh
bnMgYWxsIGZvbGRlcnMgYXJlIGluc3RhbGxlZC4gT3RoZXJ3aXNlLCBvbmx5IHRoZQo+Pj4+IHNw
ZWNpZmllZCBmb2xkZXJzIGFyZSBpbnN0YWxsZWQuCj4+PiBBZ3JlZWQuIEkgZXhwZWN0IHRoYXQg
aGF2aW5nIG5vIEFQSSBsZXZlbCBpbnN0YWxsZWQgd291bGQgeWllbGQgYQo+Pj4gbm9uLXdvcmtp
bmcgc3lzdGVtLCBzbzoKPj4+ICAgIGNvbmZpZyBCUjJfUEFDS0FHRV9NT05PX0FQSV9WRVJTSU9O
Uwo+Pj4gICAgICAgIHN0cmluZyAiQVBJIHZlcnNpb25zIHRvIGluc3RhbGwiCj4+PiAgICAgICAg
aGVscAo+Pj4gICAgICAgICAgS2VlcCBlbXB0eSB0byBpbnN0YWxsIGFsbC4KPj4gT2ssIEkgZ28g
d2l0aCB0aGF0IHRoZW4hCj4gCj4gQUNLLgo+IAo+IFJlZ2FyZHMsCj4gWWFubiBFLiBNT1JJTi4K
PiAKPiAtLSAKPiAuLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0t
LS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tLgo+IHwgIFlhbm4gRS4gTU9SSU4gIHwg
UmVhbC1UaW1lIEVtYmVkZGVkIHwgLyJcIEFTQ0lJIFJJQkJPTiB8IEVyaWNzJyBjb25zcGlyYWN5
OiB8Cj4gfCArMzMgNjYyIDM3NiAwNTYgfCBTb2Z0d2FyZSAgRGVzaWduZXIgfCBcIC8gQ0FNUEFJ
R04gICAgIHwgIF9fXyAgICAgICAgICAgICAgIHwKPiB8ICszMyA1NjEgMDk5IDQyNyBgLS0tLS0t
LS0tLS0tLi0tLS0tLS06ICBYICBBR0FJTlNUICAgICAgfCAgXGUvICBUaGVyZSBpcyBubyAgfAo+
IHwgaHR0cDovL3ltb3Jpbi5pcy1hLWdlZWsub3JnLyB8IF8vKlxfIHwgLyBcIEhUTUwgTUFJTCAg
ICB8ICAgdiAgIGNvbnNwaXJhY3kuICB8Cj4gJy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LV4tLS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS0tLScKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWls
aW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qu
b3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==

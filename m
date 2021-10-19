Return-Path: <SRS0=TKET=PH=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFA75C433EF
	for <buildroot@archiver.kernel.org>; Tue, 19 Oct 2021 19:38:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 220806134F
	for <buildroot@archiver.kernel.org>; Tue, 19 Oct 2021 19:38:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 220806134F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B3E3D60704;
	Tue, 19 Oct 2021 19:38:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hboto7p8EjFR; Tue, 19 Oct 2021 19:38:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DF94F605FC;
	Tue, 19 Oct 2021 19:38:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CFDD51BF9AC
 for <buildroot@lists.busybox.net>; Tue, 19 Oct 2021 19:38:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B8D73400E7
 for <buildroot@lists.busybox.net>; Tue, 19 Oct 2021 19:38:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TnbAD78TlgFC for <buildroot@lists.busybox.net>;
 Tue, 19 Oct 2021 19:38:52 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd02101.aruba.it (smtpcmd02101.aruba.it [62.149.158.101])
 by smtp2.osuosl.org (Postfix) with ESMTP id B1E82400A8
 for <buildroot@buildroot.org>; Tue, 19 Oct 2021 19:38:51 +0000 (UTC)
Received: from [192.168.126.129] ([146.241.216.221])
 by Aruba Outgoing Smtp  with ESMTPSA
 id cuwjmg35EqG1wcuwkmxCDS; Tue, 19 Oct 2021 21:38:50 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1634672330; bh=qTEJOP0b6Wow54WqF+QIpAzuXSeO6ve50xLYrddlBCs=;
 h=Subject:To:From:Date:MIME-Version:Content-Type;
 b=agrLXFEwG22wVg0mz+/pmg7/jJuLtsSELcuzgd4OnMU8NFlElcCwQDTIEMnOEI/AV
 pTTDIHsvZ5f/POT8vbFoEf+YAYjL0PtpGcbNFAfd8tydVYMFRKmsjo+P/+lLYSL0Yn
 fTlvhwbJJGuGxg6D5SmATri1m0gqJ+E6uiB/8AkefpbPb17E1y0uvCo9BU81Rjiwev
 lLa/I1KwDJqPVV9bjQBhE14vO8ObiSaicuR9Pfbqu78q5Nohu6lXz4gJJ5QU78GYFx
 JPg2WG7V6Zai6nOjLv5vLbfCOnqzypL90swG1g2la+43QX25N12CfWJv7OF9LxlpT8
 mmqL14kgptfTA==
To: Arnout Vandecappelle <arnout@mind.be>
References: <A62E77A0-E4CC-409B-A64B-0B0AADAFB933@benettiengineering.com>
 <3ABFFAEE-644C-4CB8-8B04-1F28AD3CBFC1@benettiengineering.com>
 <3b977617-5e9a-c874-6355-72fe81f8da38@mind.be>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <9338a8ec-6844-312c-b753-50c76bf9e536@benettiengineering.com>
Date: Tue, 19 Oct 2021 21:38:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <3b977617-5e9a-c874-6355-72fe81f8da38@mind.be>
Content-Language: en-US
X-CMAE-Envelope: MS4wfDqd7woO50GVruMAkI0yy8VXioyGAUFfCwPoMe5wX94xeB+PxuW5SMEQnlj/AdGGufuynyGnC16HoDvAJReCnMWxupoK2LpCRQxsL+gPaxUqC64AIBOH
 hGyPrj35TKuy6WC65DcRlVU4DtjnedlNK5CTscKBonSHhAk3G3LE0nsoQFsddHn/9xSoUex5NQQdp9l+fGQt+ZcETQEYoBuzqN22YhFqImR3ZS7HbVhyNuOE
 4pEGTBmgdYW7pI/ZdfhXueIh5aDXXh3tPZOP6zgZJes=
Subject: Re: [Buildroot] [PATCH 1/1] package/libnss: fix parallel build
 failure
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>, buildroot@buildroot.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgQXJub3V0LAoKT24gMTAvMTkvMjEgOTowMSBQTSwgQXJub3V0IFZhbmRlY2FwcGVsbGUgd3Jv
dGU6Cj4gCj4gCj4gT24gMTkvMTAvMjAyMSAxOTo1OSwgR2l1bGlvIEJlbmV0dGkgd3JvdGU6Cj4+
IE9y4oCmCj4+Cj4+PiBJbCBnaW9ybm8gMTkgb3R0IDIwMjEsIGFsbGUgb3JlIDE5OjQwLCBHaXVs
aW8gQmVuZXR0aQo+Pj4gPGdpdWxpby5iZW5ldHRpQGJlbmV0dGllbmdpbmVlcmluZy5jb20+IGhh
IHNjcml0dG86Cj4+Pgo+Pj4g77u/SGkgQXJub3V0LAo+Pj4KPj4+PiBJbCBnaW9ybm8gNiBvdHQg
MjAyMSwgYWxsZSBvcmUgMjE6MjAsIEFybm91dCBWYW5kZWNhcHBlbGxlIDxhcm5vdXRAbWluZC5i
ZT4KPj4+PiBoYSBzY3JpdHRvOgo+Pj4+Cj4+Pj4g77u/Cj4+Pj4KPj4+PiBPbiAyMi8wOS8yMDIx
IDAxOjU5LCBHaXVsaW8gQmVuZXR0aSB3cm90ZToKPiAKPiBbc25pcF0KPj4+Pj4gKysuTk9UUEFS
QUxMRUw6ICQoMSkKPj4+Pgo+Pj4+IFRoaXMgZG9lc24ndCBtYWtlIGEgd2hvbGUgbG90IG9mIHNl
bnNlOiAuTk9UUEFSQUxMRUwgaXMgc29tZXRoaW5nIHRoYXQKPj4+PiBhcHBsaWVzIHRvIHRoZSBN
YWtlZmlsZSBhcyBhIHdob2xlLCBub3QgdG8gb25lIHNwZWNpZmljIHRhcmdldC4gSSBoYXZlbid0
Cj4+Pj4gbG9va2VkIGluIGFueSBkZXB0aCBpbiB0aGUgbGlibnNzIGJ1aWxkIHN5c3RlbSwgYnV0
IHVubGVzcyBpdCBidWlsZHMKPj4+PiByZWN1cnNpdmVseSwgYWRkaW5nIHRoaXMgaXMgZXhhY3Rs
eSBlcXVpdmFsZW50IHRvIGFkZGluZwo+Pj4+Cj4+Pj4gLk5PVFBBUkFMTEVMOgo+Pj4KPj4+IEFz
IEnigJl2ZSB0ZXN0ZWQgaXTigJlzIG5vdCBsaWtlIHRoaXMuCj4+Pgo+Pj4gSSByZWFkIHRoaXMg
ZnJvbSBbMV06Cj4+PiDigJjigJnigJkKPj4+IHwuTk9UUEFSQUxMRUx8Cj4+Pgo+Pj4gICAgICBJ
ZiB8Lk5PVFBBUkFMTEVMfMKgaXMgbWVudGlvbmVkIGFzIGEgdGFyZ2V0LCB0aGVuIHRoaXMgaW52
b2NhdGlvbiBvZgo+Pj4gICAgICB8bWFrZXzCoHdpbGwgYmUgcnVuIHNlcmlhbGx5LCBldmVuIGlm
IHRoZSDigJgtauKAmSBvcHRpb24gaXMgZ2l2ZW4uIEFueQo+Pj4gICAgICByZWN1cnNpdmVseSBp
bnZva2VkIHxtYWtlfMKgY29tbWFuZCB3aWxsIHN0aWxsIHJ1biByZWNpcGVzIGluIHBhcmFsbGVs
Cj4+PiAgICAgICh1bmxlc3MgaXRzIG1ha2VmaWxlIGFsc28gY29udGFpbnMgdGhpcyB0YXJnZXQp
LiBBbnkgcHJlcmVxdWlzaXRlcyBvbiB0aGlzCj4+PiAgICAgIHRhcmdldCBhcmUgaWdub3JlZC4K
Pj4+Cj4+PiDigJjigJnigJkKPj4+Cj4+PiBUaGV5IHRhbGsgYWJvdXQgdGFyZ2V0IGFuZCBpdCBp
cyB3aGF0IEkgZXhwZXJpZW5jZS4KPj4+IEl04oCZcyBhIGJpdCBhbWJpZ3VvdXMgaG9uZXN0bHku
Cj4gCj4gInRhcmdldCIgaXMgdGhlIHRoaW5nIG9uIHRoZSBsZWZ0LWhhbmQgc2lkZSBvZiBhIGNv
bG9uLiBTbyBpbgo+IAo+IC5OT1RQQVJBTExFTDogJS5ibXAKPiAKPiB0aGUgdGFyZ2V0IGlzIC5O
T1RQQVJBTExFTC4gTXkgcG9pbnQgaXMgdGhhdCB0aGUgdGhpbmcgb24gdGhlIHJpZ2h0LWhhbmQg
c2lkZSBvZgo+IHRoZSBjb2xvbiBpcyBpZ25vcmVkLiBJdCBtYWtlcyBubyBkaWZmZXJlbmNlIGF0
IGFsbCBpZiB5b3UgcHV0ICUuYm1wIHRoZXJlLCBvcgo+IGJsYWJsYWJsYSAtIHdoZW4geW91IHVz
ZSB0aGF0IE1ha2VmaWxlLCB0aGUgLWogb3B0aW9uIHdpbGwgYmUgaWdub3JlZC4KPiAKPiBTbyB3
aGF0IHlvdSdyZSBkb2luZyBpcyB0aGF0IHlvdSBtYWtlIHRoZSB3aG9sZSB0aGluZyBub3QgcnVu
IGluIHBhcmFsbGVsLCBub3QKPiBqdXN0IHRoZSBidWlsZCBvZiB3aGF0ZXZlciB5b3UgcHV0IG9u
IHRoZSByaWdodC1oYW5kIHNpZGUuCj4gCj4gCj4+PiBJbiB0aGUgcGFzdCBJ4oCZdmUgYWxzbwo+
Pj4gZXhwZXJpZW5jZWQgaXQgb24gYSBiaWcgTWFrZWZpbGUgd2hlcmUgSSBoYWQgLmJtcCBmaWxl
cyB0byBiZSBjb252ZXJ0ZWQgd2l0aAo+Pj4geHhkIGFuZCB0aGF0IGdhdmUgcGFyYWxsZWwgcHJv
YmxlbXMuIFNvIEnigJl2ZSB0YWdnZWQgaXQgbGlrZToKPj4+Cj4+PiAuTk9UUEFSQUxMRUw6ICUu
Ym1wCj4+Pgo+Pj4gYW5kIHRoYXQgc29sdmVkIHRoZSBwcm9ibGVtLgo+Pgo+PiDigKZpdCBpcyBi
ZWNhdXNlIGluIGJvdGggY2FzZXMgdGhleSBhcmUgY2FsbGVkIHJlY3Vyc2l2ZWx5Lgo+IAo+ICAg
IEJlY2F1c2UgaXQgaXMgY2FsbGVkIHJlY3Vyc2l2ZWx5LCB0aGUgaGlnaGVyLWxldmVsIG1ha2Ug
aW52b2NhdGlvbnMgYXJlIGluZGVlZAo+IHN0aWxsIHJ1biBpbiBwYXJhbGxlbC4KCk9rLCBpdCdz
IGxpa2UgSSd2ZSB3cml0dGVuIG9uIHRoZSBuZXh0IGUtbWFpbCh0b28gbGF0ZSA6LSkgKSB0aGF0
IHlvdSd2ZSAKYWxyZWFkeSBwb2ludGVkIG1lIGluIHRoZSBwcmV2aW91cyBlLW1haWwuCgo+ICAg
IFRoZXJlZm9yZSwgaW5kZWVkLCBpdCBkb2VzIG1ha2Ugc2Vuc2UgdG8gcHV0IGl0IGluc2lkZSB0
aGUgbWFjcm8uCj4gCj4gICAgQnV0IGl0IGRvZXNuJ3QgbWFrZSBzZW5zZSB0byBhZGQgYSByaWdo
dC1oYW5kIHNpZGUuCgpPay4gVGhhbmsgeW91IGZvciBleHBsYWluaW5nIG1lIQoKPiAgICBBbnl3
YXksIHNpbmNlIGl0J3MgYmVlbiBhcHBsaWVkIHVwc3RyZWFtLCB3ZSBjYW4ganVzdCBpZ25vcmUg
dGhlIGlzc3VlLgoKWWVzCgpUaGFua3MgYWdhaW4KCktpbmQgcmVnYXJkcwpHaXVsaW8KCj4gICAg
UmVnYXJkcywKPiAgICBBcm5vdXQKPiAKPiAKPj4KPj4gR2l1bGlvCj4+Cj4+Pgo+Pj4gQWxzbyB0
aGV5IGhhdmUganVzdCB1cHN0cmVhbWVkIHRoZSBwYXRjaCBbMl0sIHNvCj4+PiB3ZSBjYW4gdGVz
dCBpZiBpdCB3b3JrcyBjb21taXR0aW5nIHRoaXMgcGF0Y2ggb3IKPj4+IGJ5IGJ1bXBpbmcgbmV4
dCB2ZXJzaW9uLgo+Pj4KPj4+IFRoZW4gaXTigJlzIHVwIHRvIHlvdSA6LSkKPj4+Cj4+PiBCZXN0
IHJlZ2FyZHMKPj4+IEdpdWxpbyBCZW5ldHRpCj4+PiBCZW5ldHRpIEVuZ2luZWVyaW5nIHNhcwo+
Pj4KPj4+IFsxXTogaHR0cHM6Ly93d3cuZ251Lm9yZy9zb2Z0d2FyZS9tYWtlL21hbnVhbC9odG1s
X25vZGUvU3BlY2lhbC1UYXJnZXRzLmh0bWwKPj4+IDxodHRwczovL3d3dy5nbnUub3JnL3NvZnR3
YXJlL21ha2UvbWFudWFsL2h0bWxfbm9kZS9TcGVjaWFsLVRhcmdldHMuaHRtbD4KPj4+IFsyXTog
aHR0cHM6Ly9idWd6aWxsYS5tb3ppbGxhLm9yZy9zaG93X2J1Zy5jZ2k/aWQ9MTczMTkxMQo+Pj4g
PGh0dHBzOi8vYnVnemlsbGEubW96aWxsYS5vcmcvc2hvd19idWcuY2dpP2lkPTE3MzE5MTE+Cj4+
Pgo+Pj4+Cj4+Pj4gYW55d2hlcmUgaW4gdGhlIE1ha2VmaWxlcy4gVGhpcyBpcyBCVFcgd2hhdCB3
ZSBkbyBpbiBCdWlsZHJvb3QuCj4+Pj4KPj4+PiBBbmQgaW4gdGhlIGVuZCwgdGhhdCdzIHRoZSBz
YW1lIGFzIGNhbGxpbmcgJChNQUtFMSkgZnJvbSBCdWlsZHJvb3QsIHNvCj4+Pj4gcGF0Y2hpbmcg
aXMgbm90IHJlYWxseSBuZWVkZWQuCj4+Pj4KPj4+PiBJZiB5b3Ugd2FudCB0byBiZSBhIGxpdHRs
ZSBzbWFydGVyLCB5b3Ugd2lsbCBoYXZlIHRvIG1hbnVhbGx5ICJ1bnJvbGwiIHRoZQo+Pj4+IGRl
cGVuZGVuY3ksIGxpa2U6Cj4+Pj4KPj4+PiAkKDEpOiB8ICQoMykvZAo+Pj4+ICDCoCDCoCQkKGZv
cmVhY2ggdGd0LCQoMiksJChNQUtFKSAkKDMpLyQkKCQodGd0KSkpCj4+Pj4KPj4+PiAoY2hhbmNl
cyBhcmUgSSBtYWRlIHNvbWUgbWFqb3IgbWlzdGFrZSBpbiB0aGlzIHRoaW5nKS4KPj4+Pgo+Pj4+
IE9yIGlmIGl0IGRvZXMgYnVpbGQgcmVjdXJzaXZlbHksIHlvdSBjYW4gcHJvYmFibHkgY29uZGl0
aW9uYWxseSBhZGQKPj4+PiAuTk9UUEFSQUxMRUwgaW4gc29tZSBzbWFydCB3YXkuCj4+Pj4KPj4+
PiBBbnl3YXksIEkndmUgbWFya2VkIHRoaXMgcGF0Y2ggYXMgQ2hhbmdlZCBSZXF1ZXN0ZWQuCj4+
Pj4KPj4+PiBSZWdhcmRzLAo+Pj4+IEFybm91dAo+Pj4+Cj4+Pj4KPj4+Pj4gKyBlbmRpZgo+Pj4+
PiArIGVsc2UKPj4+Pj4gKyAkKDEpOgo+Pj4+PiArLS0KPj4+Pj4gKzIuMjUuMQo+Pj4+PiArCj4g
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBidWlsZHJv
b3QgbWFpbGluZyBsaXN0Cj4gYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKPiBodHRwczovL2xpc3Rz
LmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QKPiAKCi0tIApHaXVsaW8g
QmVuZXR0aQpCZW5ldHRpIEVuZ2luZWVyaW5nIHNhcwpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBi
dWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2J1aWxkcm9vdAo=

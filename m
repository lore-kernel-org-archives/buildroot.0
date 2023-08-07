Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A7B5C001DB
	for <buildroot@archiver.kernel.org>; Mon,  7 Aug 2023 09:15:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F31A8403E9;
	Mon,  7 Aug 2023 09:15:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F31A8403E9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pjjNKGrnhWzd; Mon,  7 Aug 2023 09:15:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E8976408BF;
	Mon,  7 Aug 2023 09:15:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E8976408BF
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5DA501BF329
 for <buildroot@lists.busybox.net>; Mon,  7 Aug 2023 09:15:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8947781755
 for <buildroot@lists.busybox.net>; Mon,  7 Aug 2023 09:14:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8947781755
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id s6Hy5-jeVGbR for <buildroot@lists.busybox.net>;
 Mon,  7 Aug 2023 09:14:58 +0000 (UTC)
Received: from smtpcmd02113.aruba.it (smtpcmd02113.aruba.it [62.149.158.113])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D62F980C24
 for <buildroot@buildroot.org>; Mon,  7 Aug 2023 09:14:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D62F980C24
Received: from [10.10.6.40] ([217.14.215.226])
 by Aruba Outgoing Smtp  with ESMTPSA
 id SwKDqEMenNTqiSwKDqOcBU; Mon, 07 Aug 2023 11:14:53 +0200
Message-ID: <39b4139d-89d8-ad88-261d-29e29d2ac979@benettiengineering.com>
Date: Mon, 7 Aug 2023 11:14:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Content-Language: en-US
To: Waldemar Brodkorb <wbx@openadk.org>
References: <ZM/aaG0d/pzoYgp1@waldemar-brodkorb.de>
 <1f870f14-4bc1-1f8d-aa4e-e9f3e32f7f3c@benettiengineering.com>
 <e33edaae-e04b-c9fd-29f1-8bd6954d2d74@benettiengineering.com>
 <ZNCMCpph+op/jEC/@waldemar-brodkorb.de>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <ZNCMCpph+op/jEC/@waldemar-brodkorb.de>
X-CMAE-Envelope: MS4xfAlZPxsODhkqaGjQXeK5jb/FZ0ZsmuJscRHem2rRlhfo852f+SMNPW8edIf63g6+0Ta9BWEwUivBodQAgcbwlVQhBM6JyqG7gZjYvxvV9B+7DtGUr27a
 H4IysqMY7q+R2BhzutprxNFZ28C+Uy+IRmhB60IuO23N8fWamd23vIjkosDt9ecfN5+X9qNvY0Q3lsbDpFuJRq02RmELjphDSIplAZ/x3/wmPpQDUCf1c98S
 JOKna7E+vs6xFUpYVHZ50g==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1691399693; bh=lCt/ouIVmv+s+B8ZXhuNcVOZ7WdLSNxyNb/zkJJDCCk=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=OQh/KwHpi86w/gbwEhX0U4TSCeqVn/IARK2CurAUiudzsbCN6AvLe0qIgzpSTrxKo
 XXBBgnIPOFHZNBZ90RApW89iTAO2t0nRK/9wflg5BJf7XnuhAfcXAIEFAJYdQe+m1I
 Sw6Ko+k/8ZqOCi7GYvpmQaxchhGVeB2gExO/09vx4SIrtfvj+uqgcxh+c7c93oB7Kk
 0YlPqvZ4DWbeV1Ph9HxXRNBKKs/S02B3wAypWzE8cMtU1MNn9KmXVM0YvK7zqDeacp
 xnnzxU02yqceMzJUg/8Bl6FFTexd3r4X33hj4AiQg8w15DhFx3y6uDfIfBoe1fR+Un
 xYq1y4qa9+lmg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=OQh/KwHp
Subject: Re: [Buildroot] [PATCH] package/openssh: fix compile issue for m68k
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgV2FsZGVtYXIsCgpPbiAwNy8wOC8yMyAwODoxNSwgV2FsZGVtYXIgQnJvZGtvcmIgd3JvdGU6
Cj4gSGkgR2l1bGlvLAo+IEdpdWxpbyBCZW5ldHRpIHdyb3RlLAo+IAo+PiBPbiAwNi8wOC8yMyAy
MDozOSwgR2l1bGlvIEJlbmV0dGkgd3JvdGU6Cj4+PiBIaSBXYWxkZW1hciwKPj4+Cj4+PiBPbiAw
Ni8wOC8yMyAxOTozNywgV2FsZGVtYXIgQnJvZGtvcmIgd3JvdGU6Cj4+Pj4gRm9sbG93aW5nIElD
RSBvY2N1cnM6Cj4+Pj4gKGNkIG9wZW5ic2QtY29tcGF0ICYmIC9ob21lL2F1dG9idWlsZC9tYWtl
L21ha2UpCj4+Pj4gbWFrZVsyXTogRW50ZXJpbmcgZGlyZWN0b3J5ICcvaG9tZS9hdXRvYnVpbGQv
YXV0b2J1aWxkL2luc3RhbmNlLTEwL291dHB1dC0xL2J1aWxkL29wZW5zc2gtOS4zcDEvb3BlbmJz
ZC1jb21wYXQnCj4+Pj4gL2hvbWUvYXV0b2J1aWxkL2F1dG9idWlsZC9pbnN0YW5jZS0xMC9vdXRw
dXQtMS9ob3N0L2Jpbi9tNjhrLWJ1aWxkcm9vdC1saW51eC11Y2xpYmMtZ2NjIC1EX0xBUkdFRklM
RV9TT1VSQ0UgLURfTEFSR0VGSUxFNjRfU09VUkNFIC1EX0ZJTEVfT0ZGU0VUX0JJVFM9NjTCoCAt
TzMgLWcwwqAgLXBpcGUgLVduby1lcnJvcj1mb3JtYXQtdHJ1bmNhdGlvbiAtV2FsbCAtV3BvaW50
ZXItYXJpdGggLVd1bmluaXRpYWxpemVkIC1Xc2lnbi1jb21wYXJlIC1XZm9ybWF0LXNlY3VyaXR5
IC1Xc2l6ZW9mLXBvaW50ZXItbWVtYWNjZXNzIC1Xbm8tcG9pbnRlci1zaWduIC1Xbm8tdW51c2Vk
LXJlc3VsdCAtV2ltcGxpY2l0LWZhbGx0aHJvdWdoIC1XbWlzbGVhZGluZy1pbmRlbnRhdGlvbiAt
Zm5vLXN0cmljdC1hbGlhc2luZyAtRF9GT1JUSUZZX1NPVVJDRT0yIC1mdHJhcHYgLWZ6ZXJvLWNh
bGwtdXNlZC1yZWdzPWFsbCAtZm5vLWJ1aWx0aW4tbWVtc2V0wqDCoCAtZlBJQyAtSS4gLUkuLiAt
SS4gLUkuLy4uIC1EX0xBUkdFRklMRV9TT1VSQ0UgLURfTEFSR0VGSUxFNjRfU09VUkNFIC1EX0ZJ
TEVfT0ZGU0VUX0JJVFM9NjQgLURfWE9QRU5fU09VUkNFPTYwMCAtRF9CU0RfU09VUkNFIC1EX0RF
RkFVTFRfU09VUkNFIC1EX0dOVV9TT1VSQ0UgLURIQVZFX0NPTkZJR19IIC1jIGJzZC1hc3ByaW50
Zi5jCj4+Pj4gL2hvbWUvYXV0b2J1aWxkL2F1dG9idWlsZC9pbnN0YW5jZS0xMC9vdXRwdXQtMS9o
b3N0L2Jpbi9tNjhrLWJ1aWxkcm9vdC1saW51eC11Y2xpYmMtZ2NjIC1EX0xBUkdFRklMRV9TT1VS
Q0UgLURfTEFSR0VGSUxFNjRfU09VUkNFIC1EX0ZJTEVfT0ZGU0VUX0JJVFM9NjTCoCAtTzMgLWcw
wqAgLXBpcGUgLVduby1lcnJvcj1mb3JtYXQtdHJ1bmNhdGlvbiAtV2FsbCAtV3BvaW50ZXItYXJp
dGggLVd1bmluaXRpYWxpemVkIC1Xc2lnbi1jb21wYXJlIC1XZm9ybWF0LXNlY3VyaXR5IC1Xc2l6
ZW9mLXBvaW50ZXItbWVtYWNjZXNzIC1Xbm8tcG9pbnRlci1zaWduIC1Xbm8tdW51c2VkLXJlc3Vs
dCAtV2ltcGxpY2l0LWZhbGx0aHJvdWdoIC1XbWlzbGVhZGluZy1pbmRlbnRhdGlvbiAtZm5vLXN0
cmljdC1hbGlhc2luZyAtRF9GT1JUSUZZX1NPVVJDRT0yIC1mdHJhcHYgLWZ6ZXJvLWNhbGwtdXNl
ZC1yZWdzPWFsbCAtZm5vLWJ1aWx0aW4tbWVtc2V0wqDCoCAtZlBJQyAtSS4gLUkuLiAtSS4gLUku
Ly4uIC1EX0xBUkdFRklMRV9TT1VSQ0UgLURfTEFSR0VGSUxFNjRfU09VUkNFIC1EX0ZJTEVfT0ZG
U0VUX0JJVFM9NjQgLURfWE9QRU5fU09VUkNFPTYwMCAtRF9CU0RfU09VUkNFIC1EX0RFRkFVTFRf
U09VUkNFIC1EX0dOVV9TT1VSQ0UgLURIQVZFX0NPTkZJR19IIC1jIGJzZC1jbG9zZWZyb20uYwo+
Pj4+IGR1cmluZyBSVEwgcGFzczogemVyb19jYWxsX3VzZWRfcmVncwo+Pj4+IGJzZC1jbG9zZWZy
b20uYzogSW4gZnVuY3Rpb24gJ2Nsb3NlZnJvbSc6Cj4+Pj4gYnNkLWNsb3NlZnJvbS5jOjE1MTox
OiBpbnRlcm5hbCBjb21waWxlciBlcnJvcjogaW4gY2hhbmdlX2FkZHJlc3NfMSwKPj4+PiBhdCBl
bWl0LXJ0bC5jOjIyNzUKPj4+PiAgwqDCoCAxNTEgfCB9Cj4+Pj4gIMKgwqDCoMKgwqDCoCB8IF4K
Pj4+PiAweDdmYTc2ZjRiYWQwOSBfX2xpYmNfc3RhcnRfbWFpbgo+Pj4+ICDCoMKgwqDCoC4uL2Nz
dS9saWJjLXN0YXJ0LmM6MzA4Cj4+Pj4gUGxlYXNlIHN1Ym1pdCBhIGZ1bGwgYnVnIHJlcG9ydCwK
Pj4+PiB3aXRoIHByZXByb2Nlc3NlZCBzb3VyY2UgaWYgYXBwcm9wcmlhdGUuCj4+Pj4gUGxlYXNl
IGluY2x1ZGUgdGhlIGNvbXBsZXRlIGJhY2t0cmFjZSB3aXRoIGFueSBidWcgcmVwb3J0Lgo+Pj4+
IFNlZSA8aHR0cDovL2J1Z3MuYnVpbGRyb290Lm5ldC8+IGZvciBpbnN0cnVjdGlvbnMuCj4+Pj4g
bWFrZVsyXTogKioqIFtNYWtlZmlsZToxMDY6IGJzZC1jbG9zZWZyb20ub10gRXJyb3IgMQo+Pj4+
Cj4+Pj4gRml4ZXMgZm9sbG93aW5nIGF1dG9idWlsZCBmYWlsdXJlOgo+Pj4+IGh0dHA6Ly9hdXRv
YnVpbGQuYnVpbGRyb290Lm5ldC9yZXN1bHRzL2QyOS9kMjljNjYyZTQxZDg5NjllNmE4YWEyNDg3
MGU3MjhiY2M3MDUwNTYzLwo+Pj4+Cj4+Pj4gU2lnbmVkLW9mZi1ieTogV2FsZGVtYXIgQnJvZGtv
cmIgPHdieEBvcGVuYWRrLm9yZz4KPj4+PiAtLS0KPj4+PiAgwqAgcGFja2FnZS9vcGVuc3NoL29w
ZW5zc2gubWsgfCA1ICsrKysrCj4+Pj4gIMKgIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMo
KykKPj4+Pgo+Pj4+IGRpZmYgLS1naXQgYS9wYWNrYWdlL29wZW5zc2gvb3BlbnNzaC5tayBiL3Bh
Y2thZ2Uvb3BlbnNzaC9vcGVuc3NoLm1rCj4+Pj4gaW5kZXggZTE0ZDc1MjI5MC4uNjVmMDIwODhh
MCAxMDA2NDQKPj4+PiAtLS0gYS9wYWNrYWdlL29wZW5zc2gvb3BlbnNzaC5tawo+Pj4+ICsrKyBi
L3BhY2thZ2Uvb3BlbnNzaC9vcGVuc3NoLm1rCj4+Pj4gQEAgLTM1LDYgKzM1LDExIEBAIGRlZmlu
ZSBPUEVOU1NIX1BFUk1JU1NJT05TCj4+Pj4gIMKgwqDCoMKgwqAgL3Zhci9lbXB0eSBkIDc1NSBy
b290IHJvb3QgLSAtIC0gLSAtCj4+Pj4gIMKgIGVuZGVmCj4+Pj4gKyMgd29ya2Fyb3VuZCBnY2Mg
SUNFIHdpdGggMTEueC8xMi54IGFuZCAxMy54Cj4+Pj4gK2lmZXEgKCQoQlIyX202OGspLHkpCj4+
Pj4gK09QRU5TU0hfQ09ORl9PUFRTICs9IC0td2l0aG91dC1oYXJkZW5pbmcKPj4+PiArZW5kaWYK
Pj4+PiArCj4+Pgo+Pj4gVGhpcyBkZXNlcnZlcyBhIGdjYyBidWcgdGhhdCBJJ3ZlIGFkZGVkIHdp
dGggdGhpcyBwYXRjaDoKPj4+IGh0dHBzOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcvcHJvamVjdC9i
dWlsZHJvb3QvcGF0Y2gvMjAyMzA4MDYxODM3MzguMjU3MDA2LTEtZ2l1bGlvLmJlbmV0dGlAYmVu
ZXR0aWVuZ2luZWVyaW5nLmNvbS8KPj4+Cj4+PiB0aGlzIGlzIHRoZSBidWc6Cj4+PiBodHRwczov
L2djYy5nbnUub3JnL2J1Z3ppbGxhL3Nob3dfYnVnLmNnaT9pZD04MDc4Ngo+Pj4KPj4+IGFuZCBm
b3IgY29uc2lzdGVuY3kgaW4gQnVpbGRyb290IHdlIHRlbmQgdG8gd29yay1hcm91bmQgZ2NjL2Jp
bnV0aWxzCj4+PiBidWdzLCB3aGVuZXZlciBwb3NzaWJsZSwgYnkgbG93ZXJpbmcgdGhlIG9wdGlt
aXphdGlvbiB0byAtTzAsIHNvIEkgYXNrCj4+PiB5b3UgdG8gc2VuZCBhIHBhdGNoIGRvaW5nIHRo
aXMuCj4+PiBZb3UgY2FuIHRha2UgYXMgYSBtb2RlbCB0aGlzIGNvbW1pdCBmb3IgdGhlIGNvbW1p
dCBsb2cgdG9vOgo+Pj4gaHR0cHM6Ly9naXRsYWIuY29tL2J1aWxkcm9vdC5vcmcvYnVpbGRyb290
Ly0vY29tbWl0LzgwMzI0NzMzN2QzNTY0M2FmZGNhOTcxOGM0NjE2NTAwYjk5MzBmMmQKPj4KPj4g
QnkgdGhlIHdheSBJJ3ZlIGdpdmVuIGEgdHJ5IHdpdGggLU8wIHdvcmthcm91bmQgYnV0IGl0IHN0
aWxsIHNob3dzIGdjYwo+PiBJQ0Ugd2l0aCBnY2MgMTMuMi4wLiBTbyBhdCB0aGlzIHBvaW50IEkg
d291bGQgZGlzYWJsZSBoYXJkZW5pbmcgbGlrZQo+PiB5b3UndmUgcHJvcG9zZWQgYnV0IGJ5IGNo
ZWNraW5nIGZvciBCUjJfVE9PTENIQUlOX0hBU19HQ0NfQlVHXzgwNzg2Cj4+IGluc3RlYWQgb2Yg
QlIyX202OGsuIENhbiB5b3UgcHJvdmlkZSBzdWNoIHBhdGNoIHBvaW50aW5nIHRoYXQgaXQKPj4g
ZGVwZW5kcyBvbiBtaW5lIG9uIGEgY292ZXIgbGV0dGVyIG9yIGFmdGVyIHRoZSAzIGRhc2hlcz8K
PiAKPiBBcmUgeW91IHN1cmUgaXQgaXMgdGhlIHNhbWUgZ2NjIGJ1ZyB3ZSBzZWVpbmcgaGVyZS4g
SSB3b3VsZCBzYXkgaXQKPiBoYXMgc29tZXRoaW5nIHRvIGRvIHdpdGggLWZ6ZXJvLWNhbGwtdXNl
ZC1yZWdzPWFsbCBpbnN0ZWFkLgoKT2gsIEkgdGhpbmsgeW91IGFyZSByaWdodCwgc28gY2FuIHlv
dSBwbGVhc2Ugc3VibWl0IGEgbmV3IGdjYyBidWcgZm9yIHRoaXM/CgpCZXN0IHJlZ2FyZHMKLS0g
CkdpdWxpbyBCZW5ldHRpCkNFTyZDVE9AQmVuZXR0aSBFbmdpbmVlcmluZyBzYXMKCj4gYmVzdCBy
ZWdhcmRzCj4gICBXYWxkZW1hcgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCj4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+IGJ1aWxkcm9vdEBidWlsZHJv
b3Qub3JnCj4gaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVp
bGRyb290CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpi
dWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlz
dHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=

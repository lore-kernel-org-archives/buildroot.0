Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0E3BC48BF6
	for <buildroot@archiver.kernel.org>; Thu, 29 Feb 2024 21:31:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8B9CE81F88;
	Thu, 29 Feb 2024 21:31:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UDbYl5qrb2eG; Thu, 29 Feb 2024 21:31:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9C40382011
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9C40382011;
	Thu, 29 Feb 2024 21:31:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6345E1BF39C
 for <buildroot@lists.busybox.net>; Thu, 29 Feb 2024 21:31:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 50C5B60F93
 for <buildroot@lists.busybox.net>; Thu, 29 Feb 2024 21:31:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WicVFXm9YFnM for <buildroot@lists.busybox.net>;
 Thu, 29 Feb 2024 21:31:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.158.116;
 helo=smtpcmd03116.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B9E4A60F51
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B9E4A60F51
Received: from smtpcmd03116.aruba.it (smtpcmd03116.aruba.it [62.149.158.116])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B9E4A60F51
 for <buildroot@buildroot.org>; Thu, 29 Feb 2024 21:31:18 +0000 (UTC)
Received: from [192.168.50.221] ([84.33.84.190])
 by Aruba Outgoing Smtp  with ESMTPSA
 id fnznrFfy7P5FJfnznrRWRm; Thu, 29 Feb 2024 22:31:15 +0100
Message-ID: <5d375ded-707c-4d56-a5af-f7f769083014@benettiengineering.com>
Date: Thu, 29 Feb 2024 22:31:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: =?UTF-8?B?SmFuIMSMZXJtw6Fr?= <sairon@sairon.cz>, buildroot@buildroot.org
References: <20240228181409.3756293-1-sairon@sairon.cz>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20240228181409.3756293-1-sairon@sairon.cz>
X-CMAE-Envelope: MS4xfKIdjX7mLqXvOzzPrf+bKtCbN0u99jNdJ/ebgYhWTSMUCKGOfo7J7ox3enY62IJxuJMqLGZf7dXQal8sSC78DgDbZw6WqVwWkdVb0Ns9nmKRBKT9UwhK
 rZHG2iOGIfPCByUBIpB4hmKCnuggI8RiY8Bsk3A04ox9sLqnzisR0jOKUs5DBccm9IjRFidbOp0zV5sH4Mjsp0hYPh3g2nHcSRUZmt1hJPhLb65WqdsCZzwe
 wyvEvD2nGpEz0mSEjnVFdbtVMIosLiCIVrHzMydVnJ8=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1709242275; bh=k/o/am2MUuWdvCCioH1e35gElvP7pOB2Rs34nPHUiqA=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=noniy9Ss/vPiaTwjow9rT4JxWGYF+SjgKLNLJ+vC08FT4y+JEXXfyqtqtRKEtKKM8
 20gAuGFJzzpSCimzSL0ecfiZP6hMAl/yxVB6qIby/O/7/R6jsF34XfK9vT4dXZbfBq
 +sU9vWmBfD8SITcedNEeMisxm0w6shVoKdpqYgvsvp+bAj2LFl33O/C0Phf3Vv7aRU
 F2JfSbKfjtKTRcw1JlSz4cVaRJgJ14qVuuLQQiRkEAKLDT/gXAr/ZZHwgo/TAYPWvQ
 tGPrJ4AdVvKlnfeIyof2UzJDMqO8ig0XYWxdlMnoiiX9PMKHxIE6cHm62YqLKoBGS7
 VI5AypkJOIlJg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=noniy9Ss
Subject: Re: [Buildroot] [PATCH] package/nfs-utils: only install fsidd
 binary and unit file with enabled nfsd
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
Cc: Petr Vorel <petr.vorel@gmail.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgSmFuLAoKdGhhbmsgeW91IGZvciB0aGUgY29udHJpYnV0aW9uLAoKT24gMjgvMDIvMjQgMTk6
MTQsIEphbiDEjGVybcOhayB3cm90ZToKPiBVbml0IGZpbGUgZm9yIHRoZSBGU0lEIGRhZW1vbiBk
ZXBlbmRzIG9uIHRoZSBuZnMtc2VydmVyLnNlcnZpY2UsIHdoaWNoIGlzCj4gcmVtb3ZlZCB3aXRo
b3V0IEJSMl9QQUNLQUdFX05GU19VVElMU19SUENfTkZTRCBlbmFibGVkLiBBbHNvIGRvbid0IGlu
c3RhbGwKPiB0aGUgZnNpZGQgc2VydmljZSBiaW5hcnkgd2l0aG91dCBuZnNkIGVuYWJsZWQuCgpy
ZWdhcmRpbmcgdGhlIGNvbW1pdCBsb2coSSdtIG5vdCB0aGF0IGdvb2QgYXQgaXQgYnV0IEkgZ2l2
ZSBhIHRyeSkgd2hhdAphYm91dDoKYGBgCkZTSUQgZGFlbW9uIGFuZCBpdHMgc3lzdGVtZCB1bml0
IGZpbGUgYm90aCBkZXBlbmQgb24KQlIyX1BBQ0tBR0VfTkZTX1VUSUxTX1JQQ19ORlNEIGF0IHRo
ZSBtb21lbnQgdGhleSBhcmUgaW5zdGFsbGVkIGluIGFueQpjYXNlLiBTbyBsZXQncyByZW1vdmUg
dGhlbSBib3RoIHdoZW4gQlIyX1BBQ0tBR0VfTkZTX1VUSUxTX1JQQ19ORlNEIGlzCmRpc2FibGVk
LgpgYGAKCj4gCj4gU2lnbmVkLW9mZi1ieTogSmFuIMSMZXJtw6FrIDxzYWlyb25Ac2Fpcm9uLmN6
PgoKRm9yIHRoZSByZXN0IGl0IGxvb2tzIGdvb2QgdG8gbWUsIEkndmUgYnVpbGQgdGVzdGVkIGl0
IGFuZCBpdCB3b3JrcwphcyBleHBlY3RlZCBzbzoKUmV2aWV3ZWQtYnk6IEdpdWxpbyBCZW5ldHRp
IDxnaXVsaW8uYmVuZXR0aUBiZW5ldHRpZW5naW5lZXJpbmcuY29tPgoKQ2FuIHlvdSBwbGVhc2Ug
c2VuZCBhIFYyIHdpdGggaW1wcm92ZWQgY29tbWl0IGxvZz8KClRoYW5rIHlvdQpCZXN0IHJlZ2Fy
ZHMKLS0gCkdpdWxpbyBCZW5ldHRpCkNFTyZDVE9AQmVuZXR0aSBFbmdpbmVlcmluZyBzYXMKCj4g
LS0tCj4gICBwYWNrYWdlL25mcy11dGlscy9uZnMtdXRpbHMubWsgfCAzICsrLQo+ICAgMSBmaWxl
IGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQg
YS9wYWNrYWdlL25mcy11dGlscy9uZnMtdXRpbHMubWsgYi9wYWNrYWdlL25mcy11dGlscy9uZnMt
dXRpbHMubWsKPiBpbmRleCA0ZjJiNDFjNzgyLi5iNzU3ZTNlNTFkIDEwMDY0NAo+IC0tLSBhL3Bh
Y2thZ2UvbmZzLXV0aWxzL25mcy11dGlscy5tawo+ICsrKyBiL3BhY2thZ2UvbmZzLXV0aWxzL25m
cy11dGlscy5tawo+IEBAIC00Miw3ICs0Miw4IEBAIE5GU19VVElMU19UQVJHRVRTXyQoQlIyX1BB
Q0tBR0VfTkZTX1VUSUxTX1JQQ0RFQlVHKSArPSB1c3Ivc2Jpbi9ycGNkZWJ1Zwo+ICAgTkZTX1VU
SUxTX1RBUkdFVFNfJChCUjJfUEFDS0FHRV9ORlNfVVRJTFNfUlBDX0xPQ0tEKSArPSB1c3Ivc2Jp
bi9ycGMubG9ja2QKPiAgIE5GU19VVElMU19UQVJHRVRTXyQoQlIyX1BBQ0tBR0VfTkZTX1VUSUxT
X1JQQ19SUVVPVEFEKSArPSB1c3Ivc2Jpbi9ycGMucnF1b3RhZAo+ICAgTkZTX1VUSUxTX1RBUkdF
VFNfJChCUjJfUEFDS0FHRV9ORlNfVVRJTFNfUlBDX05GU0QpICs9IHVzci9zYmluL2V4cG9ydGZz
IFwKPiAtCXVzci9zYmluL3JwYy5tb3VudGQgdXNyL3NiaW4vcnBjLm5mc2QgdXNyL2xpYi9zeXN0
ZW1kL3N5c3RlbS9uZnMtc2VydmVyLnNlcnZpY2UKPiArCXVzci9zYmluL3JwYy5tb3VudGQgdXNy
L3NiaW4vcnBjLm5mc2QgdXNyL2xpYi9zeXN0ZW1kL3N5c3RlbS9uZnMtc2VydmVyLnNlcnZpY2Ug
XAo+ICsJdXNyL3NiaW4vZnNpZGQgdXNyL2xpYi9zeXN0ZW1kL3N5c3RlbS9mc2lkZC5zZXJ2aWNl
Cj4gICAKPiAgIGlmZXEgKCQoQlIyX1BBQ0tBR0VfTkZTX1VUSUxTX05GU1Y0KSx5KQo+ICAgTkZT
X1VUSUxTX0NPTkZfT1BUUyArPSAtLWVuYWJsZS1uZnN2NCAtLWVuYWJsZS1uZnN2NDEKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWls
aW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qu
b3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==

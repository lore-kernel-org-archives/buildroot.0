Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21029CE79AC
	for <buildroot@archiver.kernel.org>; Wed, 20 Sep 2023 03:51:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4E7804013D;
	Wed, 20 Sep 2023 03:51:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4E7804013D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YUeRuNCpO9ri; Wed, 20 Sep 2023 03:51:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 78B7A40195;
	Wed, 20 Sep 2023 03:51:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 78B7A40195
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6139E1BF2FE
 for <buildroot@lists.busybox.net>; Wed, 20 Sep 2023 03:51:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3A45E82F0F
 for <buildroot@lists.busybox.net>; Wed, 20 Sep 2023 03:51:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3A45E82F0F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LhDH2JW3rOSG for <buildroot@lists.busybox.net>;
 Wed, 20 Sep 2023 03:51:32 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A819B82EF1
 for <buildroot@buildroot.org>; Wed, 20 Sep 2023 03:51:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A819B82EF1
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.8.36] ([213.147.166.97]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N7i8Y-1rmJFg3QZe-014ndJ; Wed, 20
 Sep 2023 05:51:23 +0200
Message-ID: <8c7c1d56-02a1-4a1f-a5b2-cae3928d79ba@gmx.at>
Date: Wed, 20 Sep 2023 05:51:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20230916154940.746749-1-fontaine.fabrice@gmail.com>
 <37f6d34b-589e-4570-88d7-28aa967d45b5@gmx.at>
 <CAPi7W83Uf-Cjr7EWJEmN_E90FkqBq50jv2vJtK5yk+DJ2CLMTw@mail.gmail.com>
From: Daniel Lang <dalang@gmx.at>
In-Reply-To: <CAPi7W83Uf-Cjr7EWJEmN_E90FkqBq50jv2vJtK5yk+DJ2CLMTw@mail.gmail.com>
X-Provags-ID: V03:K1:HLjAqYJE3LM6Pol+ve1zI2ik9kEs50MZO/MtIgika1nBdwULByc
 BmQR6VpKwdY9ZVQEpJ83yTaoXVfli82j5lwMX9IpAxfp2b5yKBNoZyJ/LsHZU22593O3igd
 nNhOY6LYZJfPg+sHvgy5A/yDbDQsmQ965SxjjAmbx1gggvd4FRb+grLJOqjuEGvA5uQQ6Ic
 HPfhEB/zq24VkB0lt3+fA==
UI-OutboundReport: notjunk:1;M01:P0:slo0ZdJX0+Y=;ksO4quT3EwE4yAVMa78xJx3XLlY
 ze6UdPRe3ze5BdKp8v+HPuzn6zdulNGCJbDCAaYuPkbclgTDadoq9m6rnaUlz+RVl3/2rIdXC
 M7+E3XwnrnBUKEGWEC4VR5l30OnE14pKwFrGpsGggvCeSTQmfUrNFf3kQ2UmFH3GUWx4D/IoQ
 hm5LjyoQY8Cg+mlBKXSQqbrlVlVBp3M5oTzDS4igp3p0cgVuNXgn9W2svc81Cpf7E76/gpyHX
 Hbnp+nM4oFPVMmrw9xagx4/CNRNbJzA2NOTbbjkf6ZmthKwcb7iqjfWQ155TNXMv0NJP0/k/K
 ly/Di+28SCyr1OGOsApSgtAJiQhSraPMiec2d5QCWrS7/S0yCOSbzw9hE1+V4SBqkjDRY6Vzo
 tS1x94DTbta2kS/JnhGFjB2TlLfTI3EgqobDdQWOx6FCx0WhOTIZ97PZTlskRjf41iURXfF92
 oE6VPe6uxxx+cZltvnGPf+a/1jnFo4TKLakQoaSB34XCWweYWfYuF8MjpndHykn+4kVkol1fX
 rQ1Q58kP1TT+5oVv1VYHvrsll1PsH4qsZFVRv9cii5TxistP9ZLDCqCBN3rdM+rG/FnDPcN09
 aAltcuZV+qD7pTYAM6K1MopJ4SH6ubJwBLGSlQBLQBW1m/pbRtW2LoSKCDrAxBLJh9pEDY/J6
 TySp0fZg9GxYbyxrTig6PGM0OcZd6s62RR2Phr+Gntmj4b5GZno30W5Fo1adPqiIrhS/lgetW
 Ql1klEMVVkva7NQjulRtv88e5q74krcD87+nRYWGyKUMh5cGEQS7L4RsekRkcB1BqHnNXuzOf
 M7x6rVDWiLPKI+lR1vYr1L+69gc8FhTaMp4QXJPihM35VtOYoaz7dVByq6SOnqde8yiTT6UP7
 mnya4BeotYsj3ZZ8kced55+T3dP0Bx76omRSbxD2P0rJ+6UQRLjqSefLYc2NwbTWb/vKEH78g
 IdS2s7lfqaUI4fJ9OOSmjoCW8Bo=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.at; s=s31663417; 
 t=1695181883; x=1695786683; i=dalang@gmx.at;
 bh=gmmMScRK4BwK5MPz6PzcIDshTTvQ6LHPU3IrbVQI+9A=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=A/P7A3+HYzu0OqvMGRXI60m9iPIO2+rD1bA1jAG9NZMp4Ys2EfFnkmGNeGKOrFNAaZC+DyUN24M
 bXR4J3gJ5E7fRlYanchZEFICrr8nJOmNWOCUd8/mlz9fsSZ0URslWb/qwVuH1HvYcB7FSJRQNYF3A
 xbHlFQKDq5vslvZC0SoKwLU+EFfOxsSwcSl19lEH2Jo1C0e/bfLW++l8IPalKQOu+oWv0QZDLBzpj
 SKZeLCyQh9trx4kUh+Yde8Ib9ooxmqB+WMhYHuXvr0xUSnJ4vwhSB43Twj7wKBo1r7SK0/nw/CYuG
 hxWmrVD+xvWKHxcrdI2LFaQIoB7yNSKUsoRQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.at header.i=dalang@gmx.at
 header.a=rsa-sha256 header.s=s31663417 header.b=A/P7A3+H
Subject: Re: [Buildroot] [PATCH 1/1] package/at-spi2-core: propagate dynamic
 library dependency
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
Cc: Bernd Kuhls <bernd@kuhls.net>, Simon Dawson <spdawson@gmail.com>,
 James Knight <james.knight@collins.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgRmFicmljZSwKCk9uIDE5LjA5LjIzIDA4OjIyLCBGYWJyaWNlIEZvbnRhaW5lIHdyb3RlOgo+
IEhpIERhbmllbCwKPgo+IExlwqBtYXIuIDE5IHNlcHQuIDIwMjMgw6DCoDA2OjQyLCBEYW5pZWwg
TGFuZyA8ZGFsYW5nQGdteC5hdCA8bWFpbHRvOmRhbGFuZ0BnbXguYXQ+PiBhIMOpY3JpdMKgOgo+
Cj4gICAgIEhpIEZhYnJpY2UsCj4KPiAgICAgT24gMTYuMDkuMjMgMTc6NDksIEZhYnJpY2UgRm9u
dGFpbmUgd3JvdGU6Cj4gICAgID4gRml4IHRoZSBmb2xsb3dpbmcgYnVpbGQgZmFpbHVyZSByYWlz
ZWQgc2luY2UgYnVtcCBvZiBhdC1zcGkyLWNvcmUgdG8KPiAgICAgPiB2ZXJzaW9uIDIuNDguMCBp
biBjb21taXQgZDE3NTdmZGZiMDAxMGQyOWYyMGNkNjhjYjZlMTZmMDE5ZTIzNjQyNDoKPiAgICAg
Pgo+ICAgICA+IE1ha2VmaWxlOjU3NjogKioqIGRidXMgaXMgaW4gdGhlIGRlcGVuZGVuY3kgY2hh
aW4gb2YgYXQtc3BpMi1jb3JlIHRoYXQgaGFzIGFkZGVkIGl0IHRvIGl0cyBfREVQRU5ERU5DSUVT
IHZhcmlhYmxlIHdpdGhvdXQgc2VsZWN0aW5nIGl0IG9yIGRlcGVuZGluZyBvbiBpdCBmcm9tIENv
bmZpZy5pbi7CoCBTdG9wLgo+Cj4gICAgIFRoYW5rcyBmb3IgbG9va2luZyBpbnRvIHRoaXMuCj4g
ICAgIEknbSBub3Qgc3VyZSBhZGRpbmcgdGhpcyBkZXBlbmRlbmN5IGlzIHRoZSBiZXN0IGFwcHJv
YWNoLAo+ICAgICBhcyBpdCB3b3VsZCByZXF1aXJlIHByb3BhZ2F0aW5nIGl0IHRvIGV2ZXJ5dGhp
bmcgdGhhdCB1c2VzIGxpYmd0azMsCj4gICAgIHdoaWNoIHlvdSBkaWRuJ3QgZG8sIGlmIEkgdW5k
ZXJzdGFuZCB0aGlzIHBhdGNoIGNvcnJlY3RseS4KPgo+Cj4gSWYgSSBkaWRuJ3QgbWlzcyBzb21l
dGhpbmcsIHRoZSBvbmx5IHBhY2thZ2UgdGhhdCBoYXMgYSBtYW5kYXRvcnkgZGVwZW5kZW5jeSB0
byBsaWJndGszIGlzIHZ0ZSB3aGljaCBpcyB1cGRhdGVkIGJ5IHRoaXMgcGF0Y2guCj4gUGFja2Fn
ZXMgZGVwZW5kaW5nIG9uIGxpYmd0azIgaGF2ZSBhbHNvIGJlZW4gdXBkYXRlZCAoZS5nLiBna3Jl
bGxtLCBwY21hbmZtKS4KCllvdSBhcmUgcmlnaHQsIG15IGJhZC4KCj4gwqAKPgo+Cj4gICAgIEkg
d291bGQgbGlrZSB0byBwcm9wb3NlIGFub3RoZXIgc29sdXRpb24sIHRoYXQgd291bGQgZml4IHRo
ZSBwcm9ibGVtOgo+ICAgICBTb21lIHdlZWtzIGFnbyBJIHNlbmQgaW4gYSBwYXRjaCBbMF0gdG8g
YXQtc3BpMi1jb3JlIHRoYXQgbWFrZXMgaXQgcG9zc2libGUKPiAgICAgdG8gZGVzZWxlY3QgdGhl
IHJ1bnRpbWUgbW9kdWxlIG5lZWRlZCBieSBHVEsyLiBUaGlzIG1vZHVsZSBpcyBhbHdheXMgY29t
cGlsZWQKPiAgICAgYXMgbGlicmFyeSBhbmQgc2VlbXMgdG8gYmUgdGhlIG9ubHkgdGhpbmcgdGhh
dCB3b3VsZCBmb3JjZSAiZGVwZW5kcyBvbiAhQlIyX1NUQVRJQ19MSUJTIi4KPgo+ICAgICBTbyBt
eSBwcm9wb3NhbCB3b3VsZCBiZSB0byBvbmx5IGFkZCB0aGUgImRlcGVuZHMuLi4iIGlmIExJQkdU
SzIgaXMgc2VsZWN0ZWQgYW5kCj4gICAgIHVzZSB0aGUgcGF0Y2ggdG8gZXhjbHVkZSB0aGUgcnVu
dGltZSBtb2R1bGUuIFdpdGggdGhpcyB3ZSBvbmx5IG5lZWQgdG8gcHJvcGFnYXRlCj4gICAgIGl0
IHRvIExJQkdUSzIuCj4KPiAgICAgVmVyc2lvbiAyLjUwIHdhcyByZWxlYXNlZCBpbiB0aGUgbWVh
biB0aW1lLCB3aGljaCBjb250YWlucyB0aGUgbWVudGlvbmVkIHBhdGNoLgo+ICAgICBGb3Igc3Rh
YmxlIGJyYW5jaGVzIHRoZSBwYXRjaCBpcyBuZWVkZWQuCj4KPgo+IElmIHlvdSBjYW4gZHJvcCB0
aGUgZHluYW1pYyBsaWJyYXJ5IGRlcGVuZGVuY3kgZnJvbSBhdC1zcGkyLWNvcmUsIGZlZWwgZnJl
ZSB0byBzZW5kIGFub3RoZXIgcGF0Y2guCgpJJ20gbm90IGFibGUgdG8gZHJvcCB0aGUgZGVwZW5k
ZW5jeSBjb21wbGV0ZWx5LgpCdXQgdGhlIHNldCBvZiBhZmZlY3RlZCBwYWNrYWdlcyB3b3VsZCBk
cm9wIGZyb20gMTIgdG8gNy4KYXRrbW0sIGF0a21tMl8yOCwgZ3RrbW0zLCBsaWJndGszLCB2dGUg
d291bGQgbm90IGJlIGNoYW5nZWQuCgpJJ20gbm90IHF1aWV0IHN1cmUgd2hhdCB0aGUgYmVzdCBh
cHByb2FjaCB3b3VsZCBiZSB0byBhbHNvIG1ha2UgaXQKdmlhYmxlIGZvciBzdGFibGUgYnJhbmNo
ZXMuCk15IHByb3Bvc2FsIG5lZWRzIGEgcGF0Y2ggWzBdLCB3aGljaCByZW1vdmVzIHRoZSBydW50
aW1lIGxpYnJhcnkuCk5vdCBzdXJlIHRoYXQgcGF0Y2ggc2hvdWxkIGJlIHBpY2tlZCB1cCBieSBz
dGFibGUuCkZvciBtYXN0ZXIgdGhlIHBhdGNoIGlzbid0IG5lZWRlZCwgYSBidW1wIHRvIDIuNTAg
aW5jbHVkZXMgaXQuCgpTbyBJIGd1ZXNzIHRoZXJlIGFyZSB0d28gb3B0aW9uczoKMS4gVXNlIHRo
aXMgcGF0Y2ggZm9yIG1hc3RlciBhbmQgc3RhYmxlLiBCdW1wIGFuZCBkcm9wIGR5bmFtaWMgbGli
cmFyeQpkZXBlbmRlbmN5IGxhdGVyLgoyLiBVc2UgdGhpcyBwYXRjaCBmb3Igc3RhYmxlIG9ubHku
IEJ1bXAgYW5kIGRyb3AgZHluYW1pYyBsaWJyYXJ5CmRlcGVuZGVuY3kgZGlyZWN0bHkuCgpPbmx5
IG9waW5pb25zPwoKUmVnYXJkcywgRGFuaWVsCgpbMF06IGh0dHBzOi8vZ2l0bGFiLmdub21lLm9y
Zy9HTk9NRS9hdC1zcGkyLWNvcmUvLS9jb21taXQvNTIwYTdiMTZiMDA5M2E5NjU1NDJhMzg4MGIy
ZTNiMjc2ZmJlMDZkOApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBz
Oi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=

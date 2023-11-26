Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E78C1C07CA9
	for <buildroot@archiver.kernel.org>; Sun, 26 Nov 2023 16:10:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7B3D08131F;
	Sun, 26 Nov 2023 16:10:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7B3D08131F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ekhJo_wqBG2t; Sun, 26 Nov 2023 16:10:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A76B681330;
	Sun, 26 Nov 2023 16:10:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A76B681330
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 13A6E1BF3FF
 for <buildroot@lists.busybox.net>; Sun, 26 Nov 2023 16:10:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E107B607C7
 for <buildroot@lists.busybox.net>; Sun, 26 Nov 2023 16:10:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E107B607C7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VhOAijZhrVCr for <buildroot@lists.busybox.net>;
 Sun, 26 Nov 2023 16:10:12 +0000 (UTC)
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9F2C1607AA
 for <buildroot@buildroot.org>; Sun, 26 Nov 2023 16:10:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9F2C1607AA
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:4fcd:aaeb:59ee:6854])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 2E7C8780372;
 Sun, 26 Nov 2023 17:10:02 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 26 Nov 2023 17:10:01 +0100
Date: Sun, 26 Nov 2023 17:10:01 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: =?utf-8?B?Sm9zw6k=?= Luis Salvador Rufo <salvador.joseluis@gmail.com>
Message-ID: <20231126161001.GV3177259@scaer>
References: <24c989ad-5a35-f874-8629-71eac02ca046@mind.be>
 <20220423164855.782309-1-salvador.joseluis@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220423164855.782309-1-salvador.joseluis@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1701015009;
 bh=BWNeGuic2HClYnj8LBrUl48a3VyflhsPW1v3oMorspk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=s3yfs18JvCk/bPY/njJYvehzvkyMRbZje+LnAVva2irklXDqG33rd499AGvaHi76a
 zleOOMbzOBX83TfzQ+4QbfmQUqJP105RGHYIUDtzHmaIDbLOc9Yb+uKTD80yoEU47p
 KNhTCEW1PikjB3EOWrXqTPALhCQupKHZsWojXMcFmh0e0uPP1WnohNW4/ycLfCWgZp
 twsGnDvENnuzMjEdmZT9EuqIzlElQDzVbJMjA9QT+U7cKfHue0xySBp33SqsEMzzvs
 RV0BSvBcFEKxFt76vB8b10Vx9suG+EX+d60ePZPlhMHhiAjZb2pLxMXT7tN1dOjC+S
 AYtX0h15B40Ig==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=s3yfs18J
Subject: Re: [Buildroot] [PATCH v2] package/zfs: bump version to 2.1.4
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Philippe Serbruyns <Philippe.Serbruyns@ugent.be>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Sm9zw6ksIEFsbCwKClNvcnJ5IHRvIHJlc3VycmVjdCB0aGlzIG9sZCBjaGFuZ2UsIGJ1dCBzZWUg
YmVsb3cuLi4KCk9uIDIwMjItMDQtMjMgMTg6NDggKzAyMDAsIEpvc8OpIEx1aXMgU2FsdmFkb3Ig
UnVmbyBzcGFrZSB0aHVzbHk6Cj4gcGFja2FnZS96ZnM6IGJ1bXAgdmVyc2lvbiB0byAyLjEuNApb
LS1TTklQLS1dCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvemZzL3pmcy5tayBiL3BhY2thZ2UvemZz
L3pmcy5tawo+IGluZGV4IGRiZGE4YWNlYjQuLjA3Y2UzMjk1ZWMgMTAwNjQ0Cj4gLS0tIGEvcGFj
a2FnZS96ZnMvemZzLm1rCj4gKysrIGIvcGFja2FnZS96ZnMvemZzLm1rCj4gQEAgLTQsMTcgKzQs
MTcgQEAKPiAgIwo+ICAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwo+ICAKPiAtWkZTX1ZFUlNJT04g
PSAyLjAuNQo+ICtaRlNfVkVSU0lPTiA9IDIuMS40Cj4gIFpGU19TSVRFID0gaHR0cHM6Ly9naXRo
dWIuY29tL29wZW56ZnMvemZzL3JlbGVhc2VzL2Rvd25sb2FkL3pmcy0kKFpGU19WRVJTSU9OKQo+
ICtaRlNfUEFUQ0ggPSBodHRwczovL2dpdGh1Yi5jb20vb3Blbnpmcy96ZnMvY29tbWl0L2JjM2Yx
MmJmYWMxNTJhMGMyODk1MWNlYzkyMzQwYmExNGY5Y2NlZTkucGF0Y2gKClVzaW5nIGEgcGF0Y2gg
YXV0b2dlbmVyYXRlZCBmcm9tIGEgZm9yZ2UgbGlrZSBnaXRodWIsIGlzIG5vdApyZXByb2R1Y2li
bGU6CgogICAgd2dldCAtLXBhc3NpdmUtZnRwIC1uZCAtdCAzIC1PICcvaG9tZS95bW9yaW4vZGV2
L2J1aWxkcm9vdC9PL21hc3Rlci9idWlsZC8uYmMzZjEyYmZhYzE1MmEwYzI4OTUxY2VjOTIzNDBi
YTE0ZjljY2VlOS5wYXRjaC51b0ZxOWUvb3V0cHV0JyAnaHR0cHM6Ly9naXRodWIuY29tL29wZW56
ZnMvemZzL2NvbW1pdC9iYzNmMTJiZmFjMTUyYTBjMjg5NTFjZWM5MjM0MGJhMTRmOWNjZWU5LnBh
dGNoJwogICAgLS0yMDIzLTExLTI2IDE2OjUzOjI1LS0KICAgIGh0dHBzOi8vZ2l0aHViLmNvbS9v
cGVuemZzL3pmcy9jb21taXQvYmMzZjEyYmZhYzE1MmEwYzI4OTUxY2VjOTIzNDBiYTE0ZjljY2Vl
OS5wYXRjaAogICAgUmVzb2x2aW5nIGdpdGh1Yi5jb20gKGdpdGh1Yi5jb20pLi4uIDE0MC44Mi4x
MjEuMwogICAgQ29ubmVjdGluZyB0byBnaXRodWIuY29tIChnaXRodWIuY29tKXwxNDAuODIuMTIx
LjN8OjQ0My4uLiBjb25uZWN0ZWQuCiAgICBIVFRQIHJlcXVlc3Qgc2VudCwgYXdhaXRpbmcgcmVz
cG9uc2UuLi4gMjAwIE9LCiAgICBMZW5ndGg6IDI5NzYgKDIuOUspIFt0ZXh0L3BsYWluXQogICAg
U2F2aW5nIHRvOiDigJgvaG9tZS95bW9yaW4vZGV2L2J1aWxkcm9vdC9PL21hc3Rlci9idWlsZC8u
YmMzZjEyYmZhYzE1MmEwYzI4OTUxY2VjOTIzNDBiYTE0ZjljY2VlOS5wYXRjaC51b0ZxOWUvb3V0
cHV04oCZCgogICAgL2hvbWUveW1vcmluL2Rldi9idWlsZHJvb3QvTy8gMTAwJVs9PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0+XSAgIDIuOTFLIC0tLi1LQi9z
ICAgIGluIDBzCgogICAgMjAyMy0xMS0yNiAxNjo1MzoyNSAoMTUuMCBNQi9zKSAtIOKAmC9ob21l
L3ltb3Jpbi9kZXYvYnVpbGRyb290L08vbWFzdGVyL2J1aWxkLy5iYzNmMTJiZmFjMTUyYTBjMjg5
NTFjZWM5MjM0MGJhMTRmOWNjZWU5LnBhdGNoLnVvRnE5ZS9vdXRwdXTigJkgc2F2ZWQgWzI5NzYv
Mjk3Nl0KCiAgICBFUlJPUjogd2hpbGUgY2hlY2tpbmcgaGFzaGVzIGZyb20gcGFja2FnZS96ZnMv
L3pmcy5oYXNoCiAgICBFUlJPUjogYmMzZjEyYmZhYzE1MmEwYzI4OTUxY2VjOTIzNDBiYTE0Zjlj
Y2VlOS5wYXRjaCBoYXMgd3Jvbmcgc2hhMjU2IGhhc2g6CiAgICBFUlJPUjogZXhwZWN0ZWQ6IDk2
YTI3MzUzZmU3MTdmZjJjOGI5NWRlYjhiMDA5YzRlYjc1MDMwM2M2NDAwZTJkOGEyNTgyYWIxZWMx
MmIyNWEKICAgIEVSUk9SOiBnb3QgICAgIDogMjQ2YzgwZjY2YWJjYTVhN2UwYzQxY2M3YzU2ZWVj
MGI0Y2I3ZjE2YjE0MjI2MjQ4MDQwMTE0MmJiYzJmOTk5ZgogICAgRVJST1I6IEluY29tcGxldGUg
ZG93bmxvYWQsIG9yIG1hbi1pbi10aGUtbWlkZGxlIChNSVRNKSBhdHRhY2sKClRoZSByZWFzb24g
aXMgdGhhdCBnaXQtZ2VuZXJhdGVkIHBhdGNoZXMgZW1iZWQgc2hvdC1oYXNoZXMsIGFuZCB0aGUK
bGVuZ3RoIG9mIHRob3NlIHNob3J0IGhhc2hlcyBtYXkgY2hhbmdlIG92ZXIgdGltZSBmb3IgdmFy
aW91cyByZWFzb25zLAptb3N0bHkgb25lIG9mOgoKICAtIHRoZSByZXBvIGhhcyBtb3JlIGNvbW1p
dHMsIGFuZCB0aHVzIHRoZSBzaG9ydCBoYXNoZXMgbmVlZCB0byBiZQogICAgbG9uZ2VyIHRvIGF2
b2lkIGNvbGxpc2lvbnM7CgogIC0gdGhlIGhldXJpc3RpYyB0byBjb21wdXRlIHRoZSBsZW5ndGgg
Y2hhbmdlczsKCiAgLSB0aGUgZ2l0IGNvbmZpZ3VyYXRpb24gY2hhbmdlcywgc2VlIGNvcmUuYWJi
cmV2IGluIGdpdC1jb25maWcuCgpTbywgSSdsbCBwdXNoIGEgcXVpY2sgZml4IHRvIHVzZSBhIGxv
Y2FsIHBhdGNoLgoKUmVnYXJkcywKWWFubiBFLiBNT1JJTi4KCj4gIFpGU19MSUNFTlNFID0gQ0RE
TAo+ICBaRlNfTElDRU5TRV9GSUxFUyA9IExJQ0VOU0UgQ09QWVJJR0hUCj4gIFpGU19DUEVfSURf
VkVORE9SID0gb3Blbnpmcwo+ICBaRlNfQ1BFX0lEX1BST0RVQ1QgPSBvcGVuemZzCj4gIAo+IC0j
IDAwMDEtQ29ycmVjdC1hLWZsYXctaW4tdGhlLVB5dGhvbi0zLXZlcnNpb24tY2hlY2tpbmcucGF0
Y2gKPiAgWkZTX0FVVE9SRUNPTkYgPSBZRVMKPiAgCj4gLVpGU19ERVBFTkRFTkNJRVMgPSBsaWJh
aW8gb3BlbnNzbCB1ZGV2IHV0aWwtbGludXggemxpYgo+ICtaRlNfREVQRU5ERU5DSUVTID0gbGli
YWlvIG9wZW5zc2wgdWRldiB1dGlsLWxpbnV4IHpsaWIgbGliY3VybAo+ICAKPiAgIyBzeXN2aW5p
dCBpbnN0YWxscyBvbmx5IGEgY29tbWVudGVkLW91dCBtb2R1bGVzLWxvYWQuZC8gY29uZmlnIGZp
bGUKPiAgWkZTX0NPTkZfT1BUUyA9IFwKPiBkaWZmIC0tZ2l0IGEvc3VwcG9ydC90ZXN0aW5nL3Rl
c3RzL3BhY2thZ2UvdGVzdF96ZnMucHkgYi9zdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS90
ZXN0X3pmcy5weQo+IGluZGV4IDc3MmE2NmMxZTQuLjcwNjkzNGNhNjUgMTAwNjQ0Cj4gLS0tIGEv
c3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2UvdGVzdF96ZnMucHkKPiArKysgYi9zdXBwb3J0
L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS90ZXN0X3pmcy5weQo+IEBAIC0xMyw3ICsxMyw3IEBAIGNs
YXNzIFRlc3RaZnNHbGliYyhpbmZyYS5iYXNldGVzdC5CUlRlc3QpOgo+ICAgICAgICAgIEJSMl9S
T09URlNfREVWSUNFX0NSRUFUSU9OX0RZTkFNSUNfRVVERVY9eQo+ICAgICAgICAgIEJSMl9MSU5V
WF9LRVJORUw9eQo+ICAgICAgICAgIEJSMl9MSU5VWF9LRVJORUxfQ1VTVE9NX1ZFUlNJT049eQo+
IC0gICAgICAgIEJSMl9MSU5VWF9LRVJORUxfQ1VTVE9NX1ZFUlNJT05fVkFMVUU9IjUuMTIuMTMi
Cj4gKyAgICAgICAgQlIyX0xJTlVYX0tFUk5FTF9DVVNUT01fVkVSU0lPTl9WQUxVRT0iNS4xNS4z
NSIKPiAgICAgICAgICBCUjJfTElOVVhfS0VSTkVMX1VTRV9DVVNUT01fQ09ORklHPXkKPiAgICAg
ICAgICBCUjJfTElOVVhfS0VSTkVMX0NVU1RPTV9DT05GSUdfRklMRT0iYm9hcmQvcWVtdS94ODZf
NjQvbGludXguY29uZmlnIgo+ICAgICAgICAgIEJSMl9QQUNLQUdFX1pGUz15Cj4gQEAgLTcwLDcg
KzcwLDcgQEAgY2xhc3MgVGVzdFpmc1VjbGliYyhpbmZyYS5iYXNldGVzdC5CUlRlc3QpOgo+ICAg
ICAgICAgIEJSMl9ST09URlNfREVWSUNFX0NSRUFUSU9OX0RZTkFNSUNfRVVERVY9eQo+ICAgICAg
ICAgIEJSMl9MSU5VWF9LRVJORUw9eQo+ICAgICAgICAgIEJSMl9MSU5VWF9LRVJORUxfQ1VTVE9N
X1ZFUlNJT049eQo+IC0gICAgICAgIEJSMl9MSU5VWF9LRVJORUxfQ1VTVE9NX1ZFUlNJT05fVkFM
VUU9IjUuMTIuMTMiCj4gKyAgICAgICAgQlIyX0xJTlVYX0tFUk5FTF9DVVNUT01fVkVSU0lPTl9W
QUxVRT0iNS4xNS4zNSIKPiAgICAgICAgICBCUjJfTElOVVhfS0VSTkVMX1VTRV9DVVNUT01fQ09O
RklHPXkKPiAgICAgICAgICBCUjJfTElOVVhfS0VSTkVMX0NVU1RPTV9DT05GSUdfRklMRT0iYm9h
cmQvcWVtdS94ODZfNjQvbGludXguY29uZmlnIgo+ICAgICAgICAgIEJSMl9QQUNLQUdFX1pGUz15
Cj4gLS0gCj4gMi4zNi4wCj4gCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KPiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4gYnVpbGRyb290QGJ1aWxkcm9v
dC5vcmcKPiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWls
ZHJvb3QKCi0tIAouLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0t
LS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tLgp8ICBZYW5uIEUuIE1PUklOICB8IFJl
YWwtVGltZSBFbWJlZGRlZCB8IC8iXCBBU0NJSSBSSUJCT04gfCBFcmljcycgY29uc3BpcmFjeTog
fAp8ICszMyA2NjIgMzc2IDA1NiB8IFNvZnR3YXJlICBEZXNpZ25lciB8IFwgLyBDQU1QQUlHTiAg
ICAgfCAgX19fICAgICAgICAgICAgICAgfAp8ICszMyA1NjEgMDk5IDQyNyBgLS0tLS0tLS0tLS0t
Li0tLS0tLS06ICBYICBBR0FJTlNUICAgICAgfCAgXGUvICBUaGVyZSBpcyBubyAgfAp8IGh0dHA6
Ly95bW9yaW4uaXMtYS1nZWVrLm9yZy8gfCBfLypcXyB8IC8gXCBIVE1MIE1BSUwgICAgfCAgIHYg
ICBjb25zcGlyYWN5LiAgfAonLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0tLS1e
LS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0tLS0tJwpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1
aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2J1aWxkcm9vdAo=

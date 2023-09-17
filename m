Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29AEFCD37B4
	for <buildroot@archiver.kernel.org>; Sun, 17 Sep 2023 08:19:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 957BA60AC1;
	Sun, 17 Sep 2023 08:19:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 957BA60AC1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Kaq10noooJnY; Sun, 17 Sep 2023 08:19:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CE7A561084;
	Sun, 17 Sep 2023 08:19:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CE7A561084
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 34AC01BF3E5
 for <buildroot@lists.busybox.net>; Sun, 17 Sep 2023 08:19:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1ABFD81D4F
 for <buildroot@lists.busybox.net>; Sun, 17 Sep 2023 08:19:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1ABFD81D4F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9buxC16piHIX for <buildroot@lists.busybox.net>;
 Sun, 17 Sep 2023 08:19:03 +0000 (UTC)
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E6F0081D3A
 for <buildroot@busybox.net>; Sun, 17 Sep 2023 08:19:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E6F0081D3A
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:6a7e:c3f3:1d37:8ba2])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 0AD96B0053D;
 Sun, 17 Sep 2023 10:18:57 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 17 Sep 2023 10:18:56 +0200
Date: Sun, 17 Sep 2023 10:18:56 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Francois Perrad <fperrad@gmail.com>
Message-ID: <20230917081856.GI415981@scaer>
References: <20230916154351.2747233-1-francois.perrad@gadz.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230916154351.2747233-1-francois.perrad@gadz.org>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1694938739;
 bh=oW0FY8immby3e/CDDtj4tOmim0jag9hKmRlmkPQ1qHQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=koFxFaTISBz553bvpnzlB5Lo1ppp6F50pQDp/LpABHRvfXO+0RCohJvT9mxpKsT+Y
 2mOtXCgJ4Qvdgev+Myt1XXeAvK++nO9CPd3ZxYVP/F6U2GRT/+JhlVqVUcjvPDaY2e
 m3GgUAA9wTg+rH5W5DYkeCxzOFDXTiXOnGj5FVRIqUshbXdKkHCGl6HZV0oB21EKZD
 rj37OY1Eu/utbY1fS+pqQCuDhPvMU7LJrvUe7GSCSgAb0EPEPV7QEPYyk1kPrbq8SN
 SI94C8cG7GC21nZzCGrGiKYdnH41dHq/FjjwrpLdyTYfLjRXIIruiU6mKivomT3RaU
 LRha24umI4/Gg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=koFxFaTI
Subject: Re: [Buildroot] [PATCH 01/16] package/perl-class-method-modifiers:
 bump to version 2.15
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

RnJhbsOnb2lzLCBBbGwsCgpPbiAyMDIzLTA5LTE2IDE3OjQzICswMjAwLCBGcmFuY29pcyBQZXJy
YWQgc3Bha2UgdGh1c2x5Ogo+IExJQ0VOU0U6IHJlbW92ZSB0cmFpbGluZyBzcGFjZXMKPiBzZWUg
aHR0cHM6Ly9tZXRhY3Bhbi5vcmcvcmVsZWFzZS9FVEhFUi9DbGFzcy1NZXRob2QtTW9kaWZpZXJz
LTIuMTMvZGlmZi9FVEhFUi9DbGFzcy1NZXRob2QtTW9kaWZpZXJzLTIuMTUjTElDRU5TRQoKVGhp
cyBkaWZmIHNob3dzICphZGRlZCogdHJhaWxpbmcgc3BhY2VzLCB3aGljaCBnb2VzIGFnYWluc3Qg
d2hhdCB5b3UKc2FpZCB0aGUgbGluZSBhYm92ZS4gU28gSSBoYWQgdG8gZGlnIGEgYml0IGFuZCBz
cGVuZCBhIGJpdCBvZiB0aW1lIHRvCnVuZGVyc3RhbmQgd2hhdCB3YXMgZ29pbmcgb24uLi4KClRo
YXQncyBiZWNhdXNlIHRoZSBkaWZmIGlzIGJhY2thd2FyZHM6IGl0IGNvbXBhcmVzIDIuMTMgYWdh
aW5zdCAyLjE1LAp3aGlsZSB3ZSB3YW50IHRvIGNvbXBhcmUgMi4xNSBhZ2Fpc250IDIuMTMuCgpB
bmQgdGhlcmUgd2FzIGFsc28gYSB0eXBvIGZpeGVkIGluIHRoZSBsaWNlbnNpbmcgdGVybXM6CiAg
ICBzL01FUkNIQU5USUJJTElUWS9NRVJDSEFOVEFCSUxJVFkvCgpTbyBJIGZpeGVkIHRob3NlIHR3
byB3aGVuIGFwcGx5aW5nLgoKQXBwbGllZCB0byBtYXN0ZXIsIHRoYW5rcy4KClJlZ2FyZHMsCllh
bm4gRS4gTU9SSU4uCgo+IFNpZ25lZC1vZmYtYnk6IEZyYW5jb2lzIFBlcnJhZCA8ZnJhbmNvaXMu
cGVycmFkQGdhZHoub3JnPgo+IC0tLQo+ICAuLi4vcGVybC1jbGFzcy1tZXRob2QtbW9kaWZpZXJz
Lmhhc2ggICAgICAgICAgICAgICAgICAgICAgfCA4ICsrKystLS0tCj4gIC4uLi9wZXJsLWNsYXNz
LW1ldGhvZC1tb2RpZmllcnMubWsgICAgICAgICAgICAgICAgICAgICAgICB8IDIgKy0KPiAgMiBm
aWxlcyBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAt
LWdpdCBhL3BhY2thZ2UvcGVybC1jbGFzcy1tZXRob2QtbW9kaWZpZXJzL3BlcmwtY2xhc3MtbWV0
aG9kLW1vZGlmaWVycy5oYXNoIGIvcGFja2FnZS9wZXJsLWNsYXNzLW1ldGhvZC1tb2RpZmllcnMv
cGVybC1jbGFzcy1tZXRob2QtbW9kaWZpZXJzLmhhc2gKPiBpbmRleCBlZTBmNWVjMzIuLmUzZTg4
MTQwYiAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL3BlcmwtY2xhc3MtbWV0aG9kLW1vZGlmaWVycy9w
ZXJsLWNsYXNzLW1ldGhvZC1tb2RpZmllcnMuaGFzaAo+ICsrKyBiL3BhY2thZ2UvcGVybC1jbGFz
cy1tZXRob2QtbW9kaWZpZXJzL3BlcmwtY2xhc3MtbWV0aG9kLW1vZGlmaWVycy5oYXNoCj4gQEAg
LTEsNiArMSw2IEBACj4gLSMgcmV0cmlldmVkIGJ5IHNjYW5jcGFuIGZyb20gaHR0cDovL2NwYW4u
bWV0YWNwYW4ub3JnLwo+IC1tZDUgIGIxMzk4ZTM2ODJhYTJlMDc1YjkxM2I5ZjkwMDBiNTk2ICBD
bGFzcy1NZXRob2QtTW9kaWZpZXJzLTIuMTMudGFyLmd6Cj4gLXNoYTI1NiAgYWI1ODA3ZjcxMDE4
YTg0MmRlNmI3YTQ4MjZkNmMxZjI0YjhkNWIwOWZjY2U1MDA1YTMzMDljZjZlYTQwZmQ2MyAgQ2xh
c3MtTWV0aG9kLU1vZGlmaWVycy0yLjEzLnRhci5nego+ICsjIHJldHJpZXZlZCBieSBzY2FuY3Bh
biBmcm9tIGh0dHBzOi8vY3Bhbi5tZXRhY3Bhbi5vcmcvCj4gK21kNSAgMWFlYTg5ZDBmMjNjMzUz
NzU4MGNhZTU0OWI1YzU4NjQgIENsYXNzLU1ldGhvZC1Nb2RpZmllcnMtMi4xNS50YXIuZ3oKPiAr
c2hhMjU2ICA2NWNkODViZmU0NzVkMDY2ZTkxODZmN2E4Y2M2MzYwNzA5ODViMzBiMGViYjFjZGU4
NjgxY2YwNjJjMmUxNWZjICBDbGFzcy1NZXRob2QtTW9kaWZpZXJzLTIuMTUudGFyLmd6Cj4gIAo+
ICAjIGNvbXB1dGVkIGJ5IHNjYW5jcGFuCj4gLXNoYTI1NiAgZDE3ZTVjYmE4ZDQwMzlmNjk3M2Q1
ODczZjczYjBjODk0OWMxY2ZmYjMzOGZhZmU3YTU3ZTk3Mjc2NzU0NjU2MSAgTElDRU5TRQo+ICtz
aGEyNTYgIDNhNGQxNWQ3OGRhYTdmYmI4YjlmOTBkYTFiOGNiNjBhNmNkNTI3NWM2YTVmZGIwZmNh
NWRiMmU3NGI1MjJkZWUgIExJQ0VOU0UKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9wZXJsLWNsYXNz
LW1ldGhvZC1tb2RpZmllcnMvcGVybC1jbGFzcy1tZXRob2QtbW9kaWZpZXJzLm1rIGIvcGFja2Fn
ZS9wZXJsLWNsYXNzLW1ldGhvZC1tb2RpZmllcnMvcGVybC1jbGFzcy1tZXRob2QtbW9kaWZpZXJz
Lm1rCj4gaW5kZXggZWY2ODhhY2Y3Li5kNGE3ZjExYjggMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9w
ZXJsLWNsYXNzLW1ldGhvZC1tb2RpZmllcnMvcGVybC1jbGFzcy1tZXRob2QtbW9kaWZpZXJzLm1r
Cj4gKysrIGIvcGFja2FnZS9wZXJsLWNsYXNzLW1ldGhvZC1tb2RpZmllcnMvcGVybC1jbGFzcy1t
ZXRob2QtbW9kaWZpZXJzLm1rCj4gQEAgLTQsNyArNCw3IEBACj4gICMKPiAgIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMKPiAgCj4gLVBFUkxfQ0xBU1NfTUVUSE9EX01PRElGSUVSU19WRVJTSU9OID0g
Mi4xMwo+ICtQRVJMX0NMQVNTX01FVEhPRF9NT0RJRklFUlNfVkVSU0lPTiA9IDIuMTUKPiAgUEVS
TF9DTEFTU19NRVRIT0RfTU9ESUZJRVJTX1NPVVJDRSA9IENsYXNzLU1ldGhvZC1Nb2RpZmllcnMt
JChQRVJMX0NMQVNTX01FVEhPRF9NT0RJRklFUlNfVkVSU0lPTikudGFyLmd6Cj4gIFBFUkxfQ0xB
U1NfTUVUSE9EX01PRElGSUVSU19TSVRFID0gJChCUjJfQ1BBTl9NSVJST1IpL2F1dGhvcnMvaWQv
RS9FVC9FVEhFUgo+ICBQRVJMX0NMQVNTX01FVEhPRF9NT0RJRklFUlNfTElDRU5TRSA9IEFydGlz
dGljIG9yIEdQTC0xLjArCj4gLS0gCj4gMi4zOS4yCj4gCj4gX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KPiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4gYnVp
bGRyb290QGJ1aWxkcm9vdC5vcmcKPiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1h
bi9saXN0aW5mby9idWlsZHJvb3QKCi0tIAouLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0t
LS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tLgp8ICBZYW5u
IEUuIE1PUklOICB8IFJlYWwtVGltZSBFbWJlZGRlZCB8IC8iXCBBU0NJSSBSSUJCT04gfCBFcmlj
cycgY29uc3BpcmFjeTogfAp8ICszMyA2NjIgMzc2IDA1NiB8IFNvZnR3YXJlICBEZXNpZ25lciB8
IFwgLyBDQU1QQUlHTiAgICAgfCAgX19fICAgICAgICAgICAgICAgfAp8ICszMyA1NjEgMDk5IDQy
NyBgLS0tLS0tLS0tLS0tLi0tLS0tLS06ICBYICBBR0FJTlNUICAgICAgfCAgXGUvICBUaGVyZSBp
cyBubyAgfAp8IGh0dHA6Ly95bW9yaW4uaXMtYS1nZWVrLm9yZy8gfCBfLypcXyB8IC8gXCBIVE1M
IE1BSUwgICAgfCAgIHYgICBjb25zcGlyYWN5LiAgfAonLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tXi0tLS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0tLS0tJwpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3Qg
bWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRy
b290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=

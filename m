Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1115AC433F5
	for <buildroot@archiver.kernel.org>; Fri, 10 Dec 2021 14:57:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AC1B542601;
	Fri, 10 Dec 2021 14:57:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nID_UiUID5qj; Fri, 10 Dec 2021 14:57:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3D32E42604;
	Fri, 10 Dec 2021 14:57:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 37BDC1BF4DB
 for <buildroot@lists.busybox.net>; Fri, 10 Dec 2021 14:57:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 26DED42604
 for <buildroot@lists.busybox.net>; Fri, 10 Dec 2021 14:57:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2a4mORcTxJm8 for <buildroot@lists.busybox.net>;
 Fri, 10 Dec 2021 14:57:17 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd12131.aruba.it (smtpcmd12131.aruba.it [62.149.156.131])
 by smtp4.osuosl.org (Postfix) with ESMTP id 65D5842601
 for <buildroot@buildroot.org>; Fri, 10 Dec 2021 14:57:17 +0000 (UTC)
Received: from [192.168.50.18] ([146.241.138.59])
 by Aruba Outgoing Smtp  with ESMTPSA
 id vhKmmWo1wYYTXvhKmmGq3s; Fri, 10 Dec 2021 15:57:17 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1639148237; bh=FmYglH92j56E9T3v8mdj9as+qHJGthtdUKVbhT9e4mc=;
 h=Subject:To:From:Date:MIME-Version:Content-Type;
 b=N2yyk+Gy/uaVIinco6OCgr1czs+ycIWTTC8hvFuT2bpoM40ZzenGDNca6ioKSDvP7
 VX7eJ+tMN/1WR073gTP6OP7lCOdYwnwByFfYDGOycsmNbnQ1sTparE+PSXL/GQG2yo
 mFMQuAlvXZGAtXFQKQ/muPTkfsI7rGcdxmzR03uE5S/DJ3eoKTOcvVoqHv3HyIw0au
 6GMqBX355ymfQLjdCAvLyaWx4SIzuhwSA4VZTaANldHscsOSjiQj6qMMYST+GKuWQN
 3s9Y2WkUqDCAcNjomknEiM2xpTsDVkoU13asM6FivTbqdMjDgS1+Ytj0bZi8LyiZTL
 weg8+uWkdMgJQ==
To: =?UTF-8?Q?Jos=c3=a9_Pekkarinen?= <jose.pekkarinen@unikie.com>,
 buildroot@buildroot.org
References: <20211210141209.1812043-1-jose.pekkarinen@unikie.com>
 <20211210141209.1812043-6-jose.pekkarinen@unikie.com>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <38c50c0a-8d7b-171b-f162-7002b1d7d1da@benettiengineering.com>
Date: Fri, 10 Dec 2021 15:57:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211210141209.1812043-6-jose.pekkarinen@unikie.com>
Content-Language: en-US
X-CMAE-Envelope: MS4wfNLr5G51QnVe6pIE3/PNUduPNFZqPWzYuTBHOZaToGA/RC0kmPojF1/KbpiMf2HiYzOG/Y45MJcxS50jDD/jGjaC2gyTR2ywLKUd5fov0z3Bn5c6+Nt7
 njQmnn++M09s8oEzD3P9QoPPEy82yhsjck08xYpw9IT57RGAwZO+or7Etaf9bhz3Sa6P2lmgnNjLzO88LNdMOMweOK2hPqu1MWWsxemsBsqsXlmbHLVWhPNE
 HJhDsLh0QHJJ99hHricrew==
Subject: Re: [Buildroot] [PATCH 6/7] package/avocado: new package
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gMTAvMTIvMjEgMTU6MTIsIEpvc8OpIFBla2thcmluZW4gd3JvdGU6Cj4gVGhpcyBwYXRjaCBh
ZGRzIGEgYmFzaWMgcGFja2FnZSBmb3IKPiBhdm9jYWRvIGZyYW1ld29yay4KClJld29yZAoKPiBT
aWduZWQtb2ZmLWJ5OiBKb3PDqSBQZWtrYXJpbmVuIDxqb3NlLnBla2thcmluZW5AdW5pa2llLmNv
bT4KPiAtLS0KPiAgIERFVkVMT1BFUlMgICAgICAgICAgICAgICAgICAgfCAgMSArCj4gICBwYWNr
YWdlL0NvbmZpZy5pbiAgICAgICAgICAgIHwgIDEgKwo+ICAgcGFja2FnZS9hdm9jYWRvL0NvbmZp
Zy5pbiAgICB8IDEzICsrKysrKysrKysrKysKPiAgIHBhY2thZ2UvYXZvY2Fkby9hdm9jYWRvLmhh
c2ggfCAgNCArKysrCj4gICBwYWNrYWdlL2F2b2NhZG8vYXZvY2Fkby5tayAgIHwgMTQgKysrKysr
KysrKysrKysKPiAgIDUgZmlsZXMgY2hhbmdlZCwgMzMgaW5zZXJ0aW9ucygrKQo+ICAgY3JlYXRl
IG1vZGUgMTAwNjQ0IHBhY2thZ2UvYXZvY2Fkby9Db25maWcuaW4KPiAgIGNyZWF0ZSBtb2RlIDEw
MDY0NCBwYWNrYWdlL2F2b2NhZG8vYXZvY2Fkby5oYXNoCj4gICBjcmVhdGUgbW9kZSAxMDA2NDQg
cGFja2FnZS9hdm9jYWRvL2F2b2NhZG8ubWsKPiAKPiBkaWZmIC0tZ2l0IGEvREVWRUxPUEVSUyBi
L0RFVkVMT1BFUlMKPiBpbmRleCBiODA5NzU1NmY4Li4zZmY2YWJiMmFmIDEwMDY0NAo+IC0tLSBh
L0RFVkVMT1BFUlMKPiArKysgYi9ERVZFTE9QRVJTCj4gQEAgLTE0NjYsNiArMTQ2Niw3IEBAIEY6
CXN1cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3Rlc3RfemZzLnB5Cj4gICBOOglKb3PDqSBQ
ZWtrYXJpbmVuIDxqb3NlLnBla2thcmluZW5AdW5pa2llLmNvbT4KPiAgIEY6CXBhY2thZ2UvYWV4
cGVjdC8KPiAgIEY6CXBhY2thZ2UvYWxmcmVkLwo+ICtGOglwYWNrYWdlL2F2b2NhZG8vCj4gICBG
OglwYWNrYWdlL2JteDcvCj4gICBGOglwYWNrYWdlL21pbmlqYWlsLwo+ICAgRjoJcGFja2FnZS9v
cGVuc2MvCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvQ29uZmlnLmluIGIvcGFja2FnZS9Db25maWcu
aW4KPiBpbmRleCA1Mzk1ZDhkZDQ5Li5jNWQyNzBhN2ZkIDEwMDY0NAo+IC0tLSBhL3BhY2thZ2Uv
Q29uZmlnLmluCj4gKysrIGIvcGFja2FnZS9Db25maWcuaW4KPiBAQCAtMTU1LDYgKzE1NSw3IEBA
IGVuZG1lbnUKPiAgIAo+ICAgbWVudSAiRGV2ZWxvcG1lbnQgdG9vbHMiCj4gICAJc291cmNlICJw
YWNrYWdlL2FleHBlY3QvQ29uZmlnLmluIgo+ICsJc291cmNlICJwYWNrYWdlL2F2b2NhZG8vQ29u
ZmlnLmluIgo+ICAgCXNvdXJjZSAicGFja2FnZS9iYXRzLWNvcmUvQ29uZmlnLmluIgo+ICAgCXNv
dXJjZSAicGFja2FnZS9iaW51dGlscy9Db25maWcuaW4iCj4gICAJc291cmNlICJwYWNrYWdlL2Jp
dHdpc2UvQ29uZmlnLmluIgo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL2F2b2NhZG8vQ29uZmlnLmlu
IGIvcGFja2FnZS9hdm9jYWRvL0NvbmZpZy5pbgo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5k
ZXggMDAwMDAwMDAwMC4uNDAyYTYzOTk2OQo+IC0tLSAvZGV2L251bGwKPiArKysgYi9wYWNrYWdl
L2F2b2NhZG8vQ29uZmlnLmluCj4gQEAgLTAsMCArMSwxMyBAQAo+ICtjb25maWcgQlIyX1BBQ0tB
R0VfQVZPQ0FETwo+ICsJYm9vbCAiYXZvY2FkbyIKPiArCWRlcGVuZHMgb24gIUJSMl9TVEFUSUNf
TElCUyAjIGRsb3BlbigpCj4gKwlzZWxlY3QgQlIyX1BBQ0tBR0VfTElCRkZJCj4gKwlzZWxlY3Qg
QlIyX1BBQ0tBR0VfUFlUSE9OMwo+ICsJaGVscAo+ICsJICBBdm9jYWRvIGlzIGFuIGF1dG9tYXRl
ZCB0ZXN0aW5nIHN1aXRlIGNvbnRhaW5pbmcKPiArCSAgdGVzdHMgZm9yIHZhcmlvdXMgc3Vic3lz
dGVtcy4KPiArCj4gKwkgIGh0dHBzOi8vYXZvY2Fkby1mcmFtZXdvcmsucmVhZHRoZWRvY3MuaW8v
Cj4gKwo+ICtjb21tZW50ICJhdm9jYWRvIG5lZWRzIGEgdG9vbGNoYWluIHdpdGggZHluYW1pYyBs
aWJyYXJ5IHN1cHBvcnQiCj4gKwlkZXBlbmRzIG9uIEJSMl9TVEFUSUNfTElCUwo+IGRpZmYgLS1n
aXQgYS9wYWNrYWdlL2F2b2NhZG8vYXZvY2Fkby5oYXNoIGIvcGFja2FnZS9hdm9jYWRvL2F2b2Nh
ZG8uaGFzaAo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAwMC4uMjU3ZWU1
ZDVhZQo+IC0tLSAvZGV2L251bGwKPiArKysgYi9wYWNrYWdlL2F2b2NhZG8vYXZvY2Fkby5oYXNo
Cj4gQEAgLTAsMCArMSw0IEBACj4gKyMgRnJvbSBodHRwczovL2dpdGh1Yi5jb20vYXZvY2Fkby1m
cmFtZXdvcmsvYXZvY2Fkby9hcmNoaXZlL3JlZnMvdGFncwoKc2hhMjU2IGZpbGUgXl5eCgo+ICtz
aGEyNTYgIGI3YTM1NTUyY2QwZjBkOGU0YjNhYTRiYjcwMDljZTllNDc0YTQwYzFjZDExMTY5OGVk
MDNkYTkwZDcxYTJmNGIgIDkzLjAudGFyLmd6Cj4gKyMgTG9jYWxseSBjb21wdXRlZAo+ICtzaGEy
NTYgIDY4MGNlNTZlOWM0MDQzODI2ZjBmMTQyMDkzNWQyNDUzZWEzZGRhY2QxNTgyY2I2ZjFjZWYy
NmMxMDc3ZmNjOTMgIExJQ0VOU0UKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9hdm9jYWRvL2F2b2Nh
ZG8ubWsgYi9wYWNrYWdlL2F2b2NhZG8vYXZvY2Fkby5tawo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0
Cj4gaW5kZXggMDAwMDAwMDAwMC4uODQ3NGZhNDhjOAo+IC0tLSAvZGV2L251bGwKPiArKysgYi9w
YWNrYWdlL2F2b2NhZG8vYXZvY2Fkby5tawo+IEBAIC0wLDAgKzEsMTQgQEAKPiArIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMKPiArIwo+ICsjIGF2b2NhZG8tZnJhbWV3b3JrCj4gKyMKPiArIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMKPiArCj4gK0FWT0NBRE9fVkVSU0lPTiA9IDkzLjAKPiArQVZPQ0FE
T19TT1VSQ0UgPSAkKEFWT0NBRE9fVkVSU0lPTikudGFyLmd6Cj4gK0FWT0NBRE9fU0lURSA9IGh0
dHBzOi8vZ2l0aHViLmNvbS9hdm9jYWRvLWZyYW1ld29yay9hdm9jYWRvL2FyY2hpdmUvcmVmcy90
YWdzCj4gK0FWT0NBRE9fU0VUVVBfVFlQRSA9IHNldHVwdG9vbHMKPiArQVZPQ0FET19MSUNFTlNF
ID0gQXBhY2hlLTIuMAo+ICtBVk9DQURPX0xJQ0VOU0VfRklMRVMgPSBMSUNFTlNFCj4gKwo+ICsk
KGV2YWwgJChweXRob24tcGFja2FnZSkpCj4gCgpCZXN0IHJlZ2FyZHMKLS0gCkdpdWxpbyBCZW5l
dHRpCkJlbmV0dGkgRW5naW5lZXJpbmcgc2FzCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxk
cm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVp
bGRyb290Cg==

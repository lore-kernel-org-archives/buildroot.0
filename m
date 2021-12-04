Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BF8AC433EF
	for <buildroot@archiver.kernel.org>; Sat,  4 Dec 2021 12:38:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0C6C180E19;
	Sat,  4 Dec 2021 12:38:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZJdNVBsk9Ocu; Sat,  4 Dec 2021 12:38:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 45D1080DE5;
	Sat,  4 Dec 2021 12:38:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A497E1BF30A
 for <buildroot@lists.busybox.net>; Sat,  4 Dec 2021 12:38:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 93EF441BEB
 for <buildroot@lists.busybox.net>; Sat,  4 Dec 2021 12:38:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id E5N7h4VH8ioB for <buildroot@lists.busybox.net>;
 Sat,  4 Dec 2021 12:38:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 45B6741BE6
 for <buildroot@buildroot.org>; Sat,  4 Dec 2021 12:38:34 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:44c6:1f1c:4326:e15f])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 558965FFA0;
 Sat,  4 Dec 2021 13:38:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1638621511;
 bh=0/2xMk3OT9zQF7Hqo6Llr28WgJDgFqbYg64DmkCXK6Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=e0IJ/gzpV9xTpdk3V/5F9k1qazBfqRm24cBffezVAaGhxZOsNLWq6O9WioBTmZDMt
 ASVkMPiFIEJszcnocVTvJZPxG+6I2W/nOuDU59y2MR7rmkWVmd5DW9HOwyPuk2+rIA
 Tve6Cs2k5xLLtev1flbRLTGyK+FqKSdHmvRibG4iWbLSnHyBNv2Q5PW4V9VStWD6Z2
 hv400S/0HGr/rWy++JsrTszvpB4njITr+QHbcp4mABILan1ELV1wO7iQOOF5luBP3K
 aWq4Z8pfClklQTURW0HcpWU8N1veyYgZBjxbhsoF00mf/oUX2ZA3jehcm1P8H0ApYn
 CJLvpw9GLaAyg==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 04 Dec 2021 13:38:25 +0100
Date: Sat, 4 Dec 2021 13:38:25 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20211204123825.GJ50662@scaer>
References: <20211204084311.2014763-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211204084311.2014763-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/qemu: fix uclibc-ng and musl
 build
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
Cc: Romain Naour <romain.naour@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

RmFicmljZSwgQWxsLAoKT24gMjAyMS0xMi0wNCAwOTo0MyArMDEwMCwgRmFicmljZSBGb250YWlu
ZSBzcGFrZSB0aHVzbHk6Cj4gRml4IHRoZSBmb2xsb3dpbmcgYnVpbGQgZmFpbHVyZSBvbiB1Y2xp
YmMtbmcgYW5kIG11c2wgcmFpc2VkIHNpbmNlIGJ1bXAKPiB0byB2ZXJzaW9uIDYuMS4wIGluIGNv
bW1pdCAzM2M2OWMwMmZiNGMxMTc2NTg0ZDFlMmRkMzM2Yjc0ZWQzOWY1ZDY1Ogo+IAo+IC4uL2Js
b2NrL2V4cG9ydC9mdXNlLmM6IEluIGZ1bmN0aW9uICdmdXNlX2ZhbGxvY2F0ZSc6Cj4gLi4vYmxv
Y2svZXhwb3J0L2Z1c2UuYzo2NDM6MjE6IGVycm9yOiAnRkFMTE9DX0ZMX1pFUk9fUkFOR0UnIHVu
ZGVjbGFyZWQgKGZpcnN0IHVzZSBpbiB0aGlzIGZ1bmN0aW9uKQo+ICAgNjQzIHwgICAgIGVsc2Ug
aWYgKG1vZGUgJiBGQUxMT0NfRkxfWkVST19SQU5HRSkgewo+ICAgICAgIHwgICAgICAgICAgICAg
ICAgICAgICBefn5+fn5+fn5+fn5+fn5+fn5+fgo+IAo+IEZpeGVzOgo+ICAtIGh0dHA6Ly9hdXRv
YnVpbGQuYnVpbGRyb290Lm9yZy9yZXN1bHRzLzZkMTAyZjAwNWNmYWViYTU4MmE3OGExMTQ2MGJm
MzgwMTRmNTZiZjkKPiAgLSBodHRwOi8vYXV0b2J1aWxkLmJ1aWxkcm9vdC5vcmcvcmVzdWx0cy9i
ZTI0NDMzYTQyOWZkYTY4MWZiNjY2OTgxNjAxMzJjMWM5OWJjNTNiCj4gCj4gU2lnbmVkLW9mZi1i
eTogRmFicmljZSBGb250YWluZSA8Zm9udGFpbmUuZmFicmljZUBnbWFpbC5jb20+CgpBcHBsaWVk
IHRvIG1hc3RlciwgdGhhbmtzLgoKUmVnYXJkcywKWWFubiBFLiBNT1JJTi4KCj4gLS0tCj4gIC4u
LjQtYmxvY2stZXhwb3J0LWZ1c2UuYy1maXgtbXVzbC1idWlsZC5wYXRjaCB8IDQ5ICsrKysrKysr
KysrKysrKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDQ5IGluc2VydGlvbnMoKykKPiAgY3JlYXRl
IG1vZGUgMTAwNjQ0IHBhY2thZ2UvcWVtdS8wMDA0LWJsb2NrLWV4cG9ydC1mdXNlLmMtZml4LW11
c2wtYnVpbGQucGF0Y2gKPiAKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9xZW11LzAwMDQtYmxvY2st
ZXhwb3J0LWZ1c2UuYy1maXgtbXVzbC1idWlsZC5wYXRjaCBiL3BhY2thZ2UvcWVtdS8wMDA0LWJs
b2NrLWV4cG9ydC1mdXNlLmMtZml4LW11c2wtYnVpbGQucGF0Y2gKPiBuZXcgZmlsZSBtb2RlIDEw
MDY0NAo+IGluZGV4IDAwMDAwMDAwMDAuLjQ4NTY4MjE4NDMKPiAtLS0gL2Rldi9udWxsCj4gKysr
IGIvcGFja2FnZS9xZW11LzAwMDQtYmxvY2stZXhwb3J0LWZ1c2UuYy1maXgtbXVzbC1idWlsZC5w
YXRjaAo+IEBAIC0wLDAgKzEsNDkgQEAKPiArRnJvbSAzMDQzMzIwMzkwMTQ2NzliODA5ZjYwNmUy
ZjIyN2VlMGZjNDNhNDUxIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQo+ICtGcm9tOiBGYWJyaWNl
IEZvbnRhaW5lIDxmb250YWluZS5mYWJyaWNlQGdtYWlsLmNvbT4KPiArRGF0ZTogRnJpLCAyMiBP
Y3QgMjAyMSAxMTo1MjowOSArMDIwMAo+ICtTdWJqZWN0OiBbUEFUQ0hdIGJsb2NrL2V4cG9ydC9m
dXNlLmM6IGZpeCBtdXNsIGJ1aWxkCj4gK01JTUUtVmVyc2lvbjogMS4wCj4gK0NvbnRlbnQtVHlw
ZTogdGV4dC9wbGFpbjsgY2hhcnNldD1VVEYtOAo+ICtDb250ZW50LVRyYW5zZmVyLUVuY29kaW5n
OiA4Yml0Cj4gKwo+ICtJbmNsdWRlIGxpbnV4L2ZhbGxvYy5oIGlmIENPTkZJR19GQUxMT0NBVEVf
WkVST19SQU5HRSBpcyBkZWZpbmVkIHRvIGZpeAo+ICtodHRwczovL2dpdGxhYi5jb20vcWVtdS1w
cm9qZWN0L3FlbXUvLS9jb21taXQvNTA0ODJmZGE5OGJkNjJlMDcyYzMwYjdlYTczYzk4NWM0ZTlk
OWJiYgo+ICthbmQgYXZvaWQgdGhlIGZvbGxvd2luZyBidWlsZCBmYWlsdXJlIG9uIG11c2w6Cj4g
Kwo+ICsuLi9ibG9jay9leHBvcnQvZnVzZS5jOiBJbiBmdW5jdGlvbiAnZnVzZV9mYWxsb2NhdGUn
Ogo+ICsuLi9ibG9jay9leHBvcnQvZnVzZS5jOjY0MzoyMTogZXJyb3I6ICdGQUxMT0NfRkxfWkVS
T19SQU5HRScgdW5kZWNsYXJlZCAoZmlyc3QgdXNlIGluIHRoaXMgZnVuY3Rpb24pCj4gKyAgNjQz
IHwgICAgIGVsc2UgaWYgKG1vZGUgJiBGQUxMT0NfRkxfWkVST19SQU5HRSkgewo+ICsgICAgICB8
ICAgICAgICAgICAgICAgICAgICAgXn5+fn5+fn5+fn5+fn5+fn5+fn4KPiArCj4gK0ZpeGVzOgo+
ICsgLSBodHRwOi8vYXV0b2J1aWxkLmJ1aWxkcm9vdC5vcmcvcmVzdWx0cy9iZTI0NDMzYTQyOWZk
YTY4MWZiNjY2OTgxNjAxMzJjMWM5OWJjNTNiCj4gKwo+ICtGaXhlczogNTA0ODJmZGE5OGIgKCJi
bG9jay9leHBvcnQvZnVzZS5jOiBmaXggbXVzbCBidWlsZCIpCj4gK1NpZ25lZC1vZmYtYnk6IEZh
YnJpY2UgRm9udGFpbmUgPGZvbnRhaW5lLmZhYnJpY2VAZ21haWwuY29tPgo+ICtNZXNzYWdlLUlk
OiA8MjAyMTEwMjIwOTUyMDkuMTMxOTY3MS0xLWZvbnRhaW5lLmZhYnJpY2VAZ21haWwuY29tPgo+
ICtSZXZpZXdlZC1ieTogUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgPHBoaWxtZEByZWRoYXQuY29t
Pgo+ICtTaWduZWQtb2ZmLWJ5OiBLZXZpbiBXb2xmIDxrd29sZkByZWRoYXQuY29tPgo+ICtbUmV0
cmlldmVkIGZyb206Cj4gK2h0dHBzOi8vZ2l0bGFiLmNvbS9xZW11LXByb2plY3QvcWVtdS8tL2Nv
bW1pdC8zMDQzMzIwMzkwMTQ2NzliODA5ZjYwNmUyZjIyN2VlMGZjNDNhNDUxXQo+ICstLS0KPiAr
IGJsb2NrL2V4cG9ydC9mdXNlLmMgfCA0ICsrKysKPiArIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2Vy
dGlvbnMoKykKPiArCj4gK2RpZmYgLS1naXQgYS9ibG9jay9leHBvcnQvZnVzZS5jIGIvYmxvY2sv
ZXhwb3J0L2Z1c2UuYwo+ICtpbmRleCAyZTNiZjgyNzBiLi44MjNjMTI2ZDIzIDEwMDY0NAo+ICst
LS0gYS9ibG9jay9leHBvcnQvZnVzZS5jCj4gKysrKyBiL2Jsb2NrL2V4cG9ydC9mdXNlLmMKPiAr
QEAgLTMxLDYgKzMxLDEwIEBACj4gKyAjaW5jbHVkZSA8ZnVzZS5oPgo+ICsgI2luY2x1ZGUgPGZ1
c2VfbG93bGV2ZWwuaD4KPiArIAo+ICsrI2lmIGRlZmluZWQoQ09ORklHX0ZBTExPQ0FURV9aRVJP
X1JBTkdFKQo+ICsrI2luY2x1ZGUgPGxpbnV4L2ZhbGxvYy5oPgo+ICsrI2VuZGlmCj4gKysKPiAr
ICNpZmRlZiBfX2xpbnV4X18KPiArICNpbmNsdWRlIDxsaW51eC9mcy5oPgo+ICsgI2VuZGlmCj4g
Ky0tIAo+ICtHaXRMYWIKPiArCj4gLS0gCj4gMi4zMy4wCj4gCj4gX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4g
YnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKPiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFp
bG1hbi9saXN0aW5mby9idWlsZHJvb3QKCi0tIAouLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0t
LS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tLgp8ICBZ
YW5uIEUuIE1PUklOICB8IFJlYWwtVGltZSBFbWJlZGRlZCB8IC8iXCBBU0NJSSBSSUJCT04gfCBF
cmljcycgY29uc3BpcmFjeTogfAp8ICszMyA2NjIgMzc2IDA1NiB8IFNvZnR3YXJlICBEZXNpZ25l
ciB8IFwgLyBDQU1QQUlHTiAgICAgfCAgX19fICAgICAgICAgICAgICAgfAp8ICszMyA1NjEgMDk5
IDQyNyBgLS0tLS0tLS0tLS0tLi0tLS0tLS06ICBYICBBR0FJTlNUICAgICAgfCAgXGUvICBUaGVy
ZSBpcyBubyAgfAp8IGh0dHA6Ly95bW9yaW4uaXMtYS1nZWVrLm9yZy8gfCBfLypcXyB8IC8gXCBI
VE1MIE1BSUwgICAgfCAgIHYgICBjb25zcGlyYWN5LiAgfAonLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tXi0tLS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0tLS0t
JwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJv
b3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVp
bGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=

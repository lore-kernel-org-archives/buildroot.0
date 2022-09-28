Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42EB6C6FA82
	for <buildroot@archiver.kernel.org>; Wed, 28 Sep 2022 21:25:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CCAF94034A;
	Wed, 28 Sep 2022 21:25:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CCAF94034A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TJhGTYyAsc1R; Wed, 28 Sep 2022 21:25:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 32287401E5;
	Wed, 28 Sep 2022 21:25:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 32287401E5
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 03FB21BF3DB
 for <buildroot@lists.busybox.net>; Wed, 28 Sep 2022 21:25:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E076040C9B
 for <buildroot@lists.busybox.net>; Wed, 28 Sep 2022 21:25:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E076040C9B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id G5N-WWA3-Mhw for <buildroot@lists.busybox.net>;
 Wed, 28 Sep 2022 21:25:14 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2C05B40154
Received: from smtpcmd14162.aruba.it (smtpcmd14162.aruba.it [62.149.156.162])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2C05B40154
 for <buildroot@buildroot.org>; Wed, 28 Sep 2022 21:25:13 +0000 (UTC)
Received: from smtpclient.apple ([146.241.15.171])
 by Aruba Outgoing Smtp  with ESMTPA
 id deYJopy275z8NdeYKo8wNt; Wed, 28 Sep 2022 23:25:12 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Mime-Version: 1.0 (1.0)
Date: Wed, 28 Sep 2022 23:25:10 +0200
Message-Id: <F94082F3-B73C-4B03-B85D-522BA8E4F4C3@benettiengineering.com>
References: <20220928205527.GH1419013@scaer>
In-Reply-To: <20220928205527.GH1419013@scaer>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
X-Mailer: iPhone Mail (19G82)
X-CMAE-Envelope: MS4xfM57p6cS6RF1k7+5jrhgQO213sGtpGEHyDES2P4n1VWLpbY6zS7vEeiN2uQA+ACthN0jIQI//xpUXNCT+CIO8VUBFiPa+AKqz6KclcR1QOi+5D1BrtcX
 UMZZ9N+LiIYc9HsMXaIwsLBgE+UnuYg+7e/G43Tpz8wARYLGUt7+5lIBpBgJY/dz5mdrg4RUVXGX69DQWIlJAWurYdTOm9pZELJnZazM8Bd73nwte9U0UToa
 sXD90H5mVnl8/J3w6fTihPXdAWvofPlzcJH14wUM2Q69aDuyDqYfSqVRRr5OmIWl
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1664400312; bh=/O20TWsukX9Nd5+wqb41s1Bal0CaWDNOIbkC7vVde4A=;
 h=Content-Type:From:Mime-Version:Subject:Date:To;
 b=LJV5T1B6xOGZ1A6Ktx55bBh3cZt6nYHf9NoljUqoeCs00sp2LQynyNFRcKrKq0fY0
 nA0la7dl2FM39LIJjM1IRiZ8594FMQfcrhbQUkgI2JcBxud9Mzl6Nu4iH7DYIAvRVg
 PYc/UO+ce+9x94oHJaOF9CU82NfJv8+3x1uHCRiPg3C1ZUy4EvZhdwJh+T2X1zqEZk
 SGPsSf81CG68umyuw6ZTe5SaNZyVH0fm1BFImiMphimJ96HvNa+vcP/hVejGHjTQd4
 uQurKz+ng/3FFghM2sX22x2pw8UXw9R8FnG12LJ2Pi4SYXCnJ5Y9qJkVrLOz6l+ciC
 YUoolYhWmu/Xg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=LJV5T1B6
Subject: Re: [Buildroot] [PATCH] package/qt5: fix build failure due to
 libressl use
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
Cc: Julien Corjon <corjon.j@ecagroup.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgWWFubiwKCj4gSWwgZ2lvcm5vIDI4IHNldCAyMDIyLCBhbGxlIG9yZSAyMjo1NSwgWWFubiBF
LiBNT1JJTiA8eWFubi5tb3Jpbi4xOTk4QGZyZWUuZnI+IGhhIHNjcml0dG86Cj4gCj4g77u/R2l1
bGlvLCBBbGwsCj4gCj4gT24gMjAyMi0wOS0yOCAyMjoyNCArMDIwMCwgR2l1bGlvIEJlbmV0dGkg
c3Bha2UgdGh1c2x5Ogo+PiBRdDUgb25seSBzdXBwb3J0cyBvcGVuc3NsLCBjaGVjayBbMF0gYW5k
IFsxXS4gU28gaW4gcXQ1YmFzZS5tayBsZXQncyBjaGVjawo+PiBpZiBCUjJfUEFDS0FHRV9MSUJP
UEVOU1NMIGlzIGVuYWJsZWQgaW5zdGVhZCBvZiBCUjJfUEFDS0FHRV9PUEVOU1NMKHRoYXQKPj4g
Y291bGQgYmUgb3BlbnNzbCBvciBsaWJyZXNzbCkgYW5kIGZvciBxdDVlbmdpbmlvIGFuZCBxdDV3
ZWJraXQgbGV0J3Mgc2VsZWN0Cj4+IHNwZWNpZmljYWxseSBCUjJfUEFDS0FHRV9MSUJPUEVOU1NM
IGluc3RlYWQgb2Ygb25seSBCUjJfUEFDS0FHRV9PUEVOU1NMLgo+PiBUaGlzIHdheSB3ZSBtYWtl
IHN1cmUgdGhhdCBvbmx5IG9wZW5zc2wgaXMgc2VsZWN0ZWQgYW5kIG5vdCBsaWJyZXNzbCBvcgo+
PiBvdGhlciBmdXR1cmUgb3BlbnNzbC1saWtlIGltcGxlbWVudGF0aW9ucy4KPj4gCj4+IEZpeGVz
Ogo+PiBodHRwOi8vYXV0b2J1aWxkLmJ1aWxkcm9vdC5uZXQvcmVzdWx0cy9hOTU2YjQ4Yjc4MmRi
YWEwNTVkNzE0NjM2MDQ2NWUyNDkzYTgwOWQ5Lwo+PiAKPj4gWzBdOiBodHRwczovL2RvYy5xdC5p
by9xdC01L3NzbC5odG1sI2VuYWJsaW5nLWFuZC1kaXNhYmxpbmctc3NsLXN1cHBvcnQKPj4gWzFd
OiBodHRwczovL2J1Z3JlcG9ydHMucXQuaW8vYnJvd3NlL1FUQlVHLTY4Mzc0Cj4+IAo+PiBTaWdu
ZWQtb2ZmLWJ5OiBHaXVsaW8gQmVuZXR0aSA8Z2l1bGlvLmJlbmV0dGlAYmVuZXR0aWVuZ2luZWVy
aW5nLmNvbT4KPj4gLS0tCj4+IHBhY2thZ2UvcXQ1L3F0NWJhc2UvcXQ1YmFzZS5tayAgIHwgNCAr
Ky0tCj4+IHBhY2thZ2UvcXQ1L3F0NWVuZ2luaW8vQ29uZmlnLmluIHwgMSArCj4+IHBhY2thZ2Uv
cXQ1L3F0NXdlYmtpdC9Db25maWcuaW4gIHwgMSArCj4+IDMgZmlsZXMgY2hhbmdlZCwgNCBpbnNl
cnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+PiAKPj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvcXQ1
L3F0NWJhc2UvcXQ1YmFzZS5tayBiL3BhY2thZ2UvcXQ1L3F0NWJhc2UvcXQ1YmFzZS5tawo+PiBp
bmRleCBhODE4OTI0MjJjLi5lZmEwZTE2ZTlhIDEwMDY0NAo+PiAtLS0gYS9wYWNrYWdlL3F0NS9x
dDViYXNlL3F0NWJhc2UubWsKPj4gKysrIGIvcGFja2FnZS9xdDUvcXQ1YmFzZS9xdDViYXNlLm1r
Cj4+IEBAIC0yMjksOCArMjI5LDggQEAgZWxzZQo+PiBRVDVCQVNFX0NPTkZJR1VSRV9PUFRTICs9
IC1uby1lZ2xmcwo+PiBlbmRpZgo+PiAKPj4gLVFUNUJBU0VfQ09ORklHVVJFX09QVFMgKz0gJChp
ZiAkKEJSMl9QQUNLQUdFX09QRU5TU0wpLC1vcGVuc3NsLC1uby1vcGVuc3NsKQo+PiAtUVQ1QkFT
RV9ERVBFTkRFTkNJRVMgICArPSAkKGlmICQoQlIyX1BBQ0tBR0VfT1BFTlNTTCksb3BlbnNzbCkK
Pj4gK1FUNUJBU0VfQ09ORklHVVJFX09QVFMgKz0gJChpZiAkKEJSMl9QQUNLQUdFX0xJQk9QRU5T
U0wpLC1vcGVuc3NsLC1uby1vcGVuc3NsKQo+PiArUVQ1QkFTRV9ERVBFTkRFTkNJRVMgICArPSAk
KGlmICQoQlIyX1BBQ0tBR0VfTElCT1BFTlNTTCksb3BlbnNzbCkKPj4gCj4+IFFUNUJBU0VfQ09O
RklHVVJFX09QVFMgKz0gJChpZiAkKEJSMl9QQUNLQUdFX1FUNUJBU0VfRk9OVENPTkZJRyksLWZv
bnRjb25maWcsLW5vLWZvbnRjb25maWcpCj4+IFFUNUJBU0VfREVQRU5ERU5DSUVTICAgKz0gJChp
ZiAkKEJSMl9QQUNLQUdFX1FUNUJBU0VfRk9OVENPTkZJRyksZm9udGNvbmZpZykKPj4gZGlmZiAt
LWdpdCBhL3BhY2thZ2UvcXQ1L3F0NWVuZ2luaW8vQ29uZmlnLmluIGIvcGFja2FnZS9xdDUvcXQ1
ZW5naW5pby9Db25maWcuaW4KPj4gaW5kZXggYjczOGYwZGI3Yy4uZDQyMTk3MjM5MiAxMDA2NDQK
Pj4gLS0tIGEvcGFja2FnZS9xdDUvcXQ1ZW5naW5pby9Db25maWcuaW4KPj4gKysrIGIvcGFja2Fn
ZS9xdDUvcXQ1ZW5naW5pby9Db25maWcuaW4KPj4gQEAgLTEsNiArMSw3IEBACj4+IGNvbmZpZyBC
UjJfUEFDS0FHRV9RVDVFTkdJTklPCj4+ICAgIGJvb2wgInF0NWVuZ2luaW8iCj4+ICAgIHNlbGVj
dCBCUjJfUEFDS0FHRV9PUEVOU1NMCj4+ICsgICAgc2VsZWN0IEJSMl9QQUNLQUdFX0xJQk9QRU5T
U0wgIyBPbmx5IG9wZW5zc2wgaXMgc3VwcG9ydGVkIGJ5IHF0NQo+IAo+IEJSMl9QQUNLQUdFX0xJ
Qk9QRU5TU0wgaXMgcGFydCBvZiBhIGNob2ljZSwgc28geW91IGNhbid0IHNlbGVjdCBpdC4KPiAK
PiBIb3dldmVyLCB5b3UgY2FuIGFjaGlldmUgdGhlIHNhbWUgd2l0aDoKPiAgICBzZWxlY3QgQlIy
X1BBQ0tBR0VfT1BFTlNTTAo+ICAgIHNlbGVjdCBCUjJfUEFDS0FHRV9PUEVOU1NMX0ZPUkNFX0xJ
Qk9QRU5TU0wKClRoYW5rcyBmb3IgcG9pbnRpbmcsIEkgd2FzIG5vdCAxMDAlIHN1cmUgb2YgbXkg
YXBwcm9hY2guCgo+IAo+IEJ5IHRoZSB3YXksIHdlIGhhdmUgYSBzaW5nbGUgcGFja2FnZSwgZ2l0
bGFiLXJ1bm5lciwgdGhhdCBzZWxlY3RzCj4gQlIyX1BBQ0tBR0VfTElCT1BFTlNTTCwgc28gdGhp
cyBzaG91bGQgYmUgZml4ZWQuCgpPaywgSeKAmWxsIGNyZWF0ZSBhIHBhdGNoIGZvciBpdCB0b28g
dG9tb3Jyb3cgdGhlbi4KCkJlc3QgcmVnYXJkcwpHaXVsaW8KCj4gCj4gUmVnYXJkcywKPiBZYW5u
IEUuIE1PUklOLgo+IAo+PiAgICBzZWxlY3QgQlIyX1BBQ0tBR0VfUVQ1QkFTRV9HVUkKPj4gICAg
c2VsZWN0IEJSMl9QQUNLQUdFX1FUNUJBU0VfTkVUV09SSwo+PiAgICBoZWxwCj4+IGRpZmYgLS1n
aXQgYS9wYWNrYWdlL3F0NS9xdDV3ZWJraXQvQ29uZmlnLmluIGIvcGFja2FnZS9xdDUvcXQ1d2Vi
a2l0L0NvbmZpZy5pbgo+PiBpbmRleCAyNmMzODk3ZDFkLi4wMzVlOGIxOWI4IDEwMDY0NAo+PiAt
LS0gYS9wYWNrYWdlL3F0NS9xdDV3ZWJraXQvQ29uZmlnLmluCj4+ICsrKyBiL3BhY2thZ2UvcXQ1
L3F0NXdlYmtpdC9Db25maWcuaW4KPj4gQEAgLTE2LDYgKzE2LDcgQEAgY29uZmlnIEJSMl9QQUNL
QUdFX1FUNVdFQktJVAo+PiAgICBzZWxlY3QgQlIyX1BBQ0tBR0VfTEVWRUxEQgo+PiAgICBzZWxl
Y3QgQlIyX1BBQ0tBR0VfTElCUE5HCj4+ICAgIHNlbGVjdCBCUjJfUEFDS0FHRV9PUEVOU1NMCj4+
ICsgICAgc2VsZWN0IEJSMl9QQUNLQUdFX0xJQk9QRU5TU0wgIyBPbmx5IG9wZW5zc2wgaXMgc3Vw
cG9ydGVkIGJ5IHF0NQo+PiAgICBzZWxlY3QgQlIyX1BBQ0tBR0VfUVQ1QkFTRV9JQ1UKPj4gICAg
c2VsZWN0IEJSMl9QQUNLQUdFX1FUNUJBU0VfR1VJCj4+ICAgIHNlbGVjdCBCUjJfUEFDS0FHRV9R
VDVCQVNFX1dJREdFVFMKPj4gLS0gCj4+IDIuMzQuMQo+PiAKPj4gX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPj4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+
PiBidWlsZHJvb3RAYnVpbGRyb290Lm9yZwo+PiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcv
bWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QKPiAKPiAtLSAKPiAuLS0tLS0tLS0tLS0tLS0tLS0u
LS0tLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0t
LS0tLgo+IHwgIFlhbm4gRS4gTU9SSU4gIHwgUmVhbC1UaW1lIEVtYmVkZGVkIHwgLyJcIEFTQ0lJ
IFJJQkJPTiB8IEVyaWNzJyBjb25zcGlyYWN5OiB8Cj4gfCArMzMgNjYyIDM3NiAwNTYgfCBTb2Z0
d2FyZSAgRGVzaWduZXIgfCBcIC8gQ0FNUEFJR04gICAgIHwgIF9fXyAgICAgICAgICAgICAgIHwK
PiB8ICszMyA1NjEgMDk5IDQyNyBgLS0tLS0tLS0tLS0tLi0tLS0tLS06ICBYICBBR0FJTlNUICAg
ICAgfCAgXGUvICBUaGVyZSBpcyBubyAgfAo+IHwgaHR0cDovL3ltb3Jpbi5pcy1hLWdlZWsub3Jn
LyB8IF8vKlxfIHwgLyBcIEhUTUwgTUFJTCAgICB8ICAgdiAgIGNvbnNwaXJhY3kuICB8Cj4gJy0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0tLV4t
LS0tLS0tLS0tLS0tLS0tLS0tLScKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5v
cmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290
Cg==

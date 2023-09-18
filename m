Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32514CD37B0
	for <buildroot@archiver.kernel.org>; Mon, 18 Sep 2023 07:27:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BE4EF40543;
	Mon, 18 Sep 2023 07:27:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BE4EF40543
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mWOUG-AKPCAZ; Mon, 18 Sep 2023 07:27:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E7104404C1;
	Mon, 18 Sep 2023 07:27:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E7104404C1
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B31B31BF3FF
 for <buildroot@lists.busybox.net>; Mon, 18 Sep 2023 07:27:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 92F3F404C1
 for <buildroot@lists.busybox.net>; Mon, 18 Sep 2023 07:27:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 92F3F404C1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 875I_AOBXgMn for <buildroot@lists.busybox.net>;
 Mon, 18 Sep 2023 07:27:22 +0000 (UTC)
X-Greylist: delayed 796 seconds by postgrey-1.37 at util1.osuosl.org;
 Mon, 18 Sep 2023 07:27:21 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D25D6400FE
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.74])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D25D6400FE
 for <buildroot@buildroot.org>; Mon, 18 Sep 2023 07:27:21 +0000 (UTC)
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue106 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1N2EDg-1ri2Qr0rL4-013cGD; Mon, 18 Sep 2023 09:13:59 +0200
Message-ID: <f0120686-71df-6865-b5e2-bf81d4bc2857@vivier.eu>
Date: Mon, 18 Sep 2023 09:13:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: fr
To: Reza Arbab <arbab@linux.ibm.com>, buildroot@buildroot.org
References: <20230915155835.51140-1-arbab@linux.ibm.com>
 <20230915155835.51140-3-arbab@linux.ibm.com>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20230915155835.51140-3-arbab@linux.ibm.com>
X-Provags-ID: V03:K1:SgqGNQ2cFY0YGE+Wmn78t/ycnb6bGml+6d1i8bqAH9MIb2bKLH2
 uRVu3yKn7Xd+Ftpc+H658jRu1LrJraNjlStjjye6JV/GUAWmZ5cu1oXxKgR97yWFBD+v6/C
 ghLf4Etvyc5rsYLFgDxijManIX7++J0MbWcPH5RqHKVBYJ5kRyDcjcsjv+Q3EzGx/RSzuD4
 W0Te1HmGsFreaDBlhnFhw==
UI-OutboundReport: notjunk:1;M01:P0:zpcbugIMjcY=;LCkm2EVmvZs/SoRYiZmha2gBNXT
 ezoSydicugyJIwhGuZP0K76aER6u87xPL+/3E50KuUrTuAlutVTKYR00jYEMLmShY+gF1bFk6
 KSekCYNxMo9FiAY7dEYOOrpxGiX6/UyOtWJV4Z1xQ16lmmJQT3+2FCtE76ZNykHgFfj2qDJ55
 Wmv4Q3Z/2MVtQb9FY/kqb+XGZJlwZdUJRea42xH6+drWqgTENgfqezvMdZ//SWYd9vKf+nMHj
 IWqi4x1pCA03XPLFaQmOHQfzO3y901dlL2naZg/w/tXAhAr7R16yh6rsnutWEJDYKMXNYbUJI
 K8R5+27VABlTzWgsQ0oYrHW2aVwFYAt6cXQylqXpfnUU1YwhGnIPtdOOPtz5S6YNO69vdIX8p
 F9syCprzs+JpaifnQHIk3OqWej0RcJ0wMkAhXY7wrKeytcP3wZG9H6emS+X0kAfS6bLDr98AW
 c8dDbADddalI1WoSTkc22lNMVQpOed8DSRA1lofAU5gLhtHHqcFm3XFOlyYHEJhTvxdgPiY4P
 ZzWEmN3uj/Nt4OFSOrWyC1sH8f93wRKNz1PXQScySi6rcQ+kaNJ8FBYxOgTYSfwtQvBxU2gsF
 GkIHHoLznDvqMPCk2vuI/LlwWi5s6TJVBxZJqzjCtzRVXf50qXnSHmrU2N2FA/ue2XnNiw/ap
 1MedUNJDJQ9c85P1u7BqKa2vRAhwAug6/e1Recf4Ng7CGfrBnxp06yiqPbZ5aBSiwBfDY5Mfm
 K/+kBVY4fHPB19s4UYOYHBsyID7Jw6bVu0rTWM+QkqHsd821w+SPpkb5eE2DVRbyqGFNEuneS
 gMO9Fe5Vol504lT2ojKG3OACmC7XapdywpG0BezkYaRM4WG+whm6nkqERevxe+tLpcxERaPPZ
 NSMJmFi/Auhf/0Q==
Subject: Re: [Buildroot] [PATCH v2 2/5] package/petitboot: run pb-console at
 boot
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
Cc: Joel Stanley <joel@jms.id.au>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

TGUgMTUvMDkvMjAyMyDDoCAxNzo1OCwgUmV6YSBBcmJhYiBhIMOpY3JpdMKgOgo+IEluc3RhbGwg
YSB1ZGV2IHJ1bGUgdG8gcnVuIHRoZSBwZXRpdGJvb3QgVUkgb24gY29tbW9ubHkta25vd24gY29u
c29sZXMKPiBpbnN0ZWFkIG9mIGdldHR5LiBUbyBwcmV2ZW50IHRoZSBrZXJuZWwncyBjb25zb2xl
IG91dHB1dCBmcm9tIHRyYW1wbGluZwo+IHRoZSBVSSwgYWxzbyBhZGQgYSBzeXNjdGwgZmlsZSB0
byByZWR1Y2UgdGhlIGtlcm5lbCBsb2cgbGV2ZWxzIHRvCj4gS0VSTl9BTEVSVC4KPiAKPiBTaWdu
ZWQtb2ZmLWJ5OiBSZXphIEFyYmFiIDxhcmJhYkBsaW51eC5pYm0uY29tPgo+IC0tLQo+IHYyOgo+
ICogQWRkIHR0eUdGKiB0byBsaXN0IG9mIGNvbW1vbmx5LWtub3duIGNvbnNvbGVzLgo+ICogRG9u
J3Qgc2VsZWN0IEJSMl9UQVJHRVRfR0VORVJJQ19HRVRUWSBieSBkZWZhdWx0Lgo+IAo+ICAgcGFj
a2FnZS9wZXRpdGJvb3QvcGV0aXRib290LWNvbnNvbGUtdWkucnVsZXMgfCA1ICsrKysrCj4gICBw
YWNrYWdlL3BldGl0Ym9vdC9wZXRpdGJvb3QubWsgICAgICAgICAgICAgICB8IDQgKysrKwo+ICAg
cGFja2FnZS9wZXRpdGJvb3Qvc3lzY3RsLmNvbmYgICAgICAgICAgICAgICAgfCAxICsKPiAgIHN5
c3RlbS9Db25maWcuaW4gICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgMiArLQo+ICAgNCBm
aWxlcyBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4gICBjcmVhdGUg
bW9kZSAxMDA2NDQgcGFja2FnZS9wZXRpdGJvb3QvcGV0aXRib290LWNvbnNvbGUtdWkucnVsZXMK
PiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL3BldGl0Ym9vdC9zeXNjdGwuY29uZgo+IAo+
IGRpZmYgLS1naXQgYS9wYWNrYWdlL3BldGl0Ym9vdC9wZXRpdGJvb3QtY29uc29sZS11aS5ydWxl
cyBiL3BhY2thZ2UvcGV0aXRib290L3BldGl0Ym9vdC1jb25zb2xlLXVpLnJ1bGVzCj4gbmV3IGZp
bGUgbW9kZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAwMDAwMDAuLmU1YzE4ODM4N2JjNQo+IC0tLSAv
ZGV2L251bGwKPiArKysgYi9wYWNrYWdlL3BldGl0Ym9vdC9wZXRpdGJvb3QtY29uc29sZS11aS5y
dWxlcwo+IEBAIC0wLDAgKzEsNSBAQAo+ICsjIHNwYXduIGEgcGV0aXRib290IFVJIG9uIGNvbW1v
biB1c2VyLXZpc2libGUgaW50ZXJmYWNlIGRldmljZXMKPiArU1VCU1lTVEVNPT0idHR5IiwgS0VS
TkVMPT0iaHZjKiIsIFJVTis9Ii91c3IvbGliZXhlYy9wZXRpdGJvb3QvcGItY29uc29sZSAtLWdl
dHR5IC0tZGV0YWNoIC0tIC1uIC1pIDAgJG5hbWUgbGludXgiCj4gK1NVQlNZU1RFTT09InR0eSIs
IEtFUk5FTD09InR0eTAiLCBSVU4rPSIvdXNyL2xpYmV4ZWMvcGV0aXRib290L3BiLWNvbnNvbGUg
LS1nZXR0eSAtLWRldGFjaCAtLSAtbiAtaSAwICRuYW1lIGxpbnV4Igo+ICtTVUJTWVNURU09PSJ0
dHkiLCBLRVJORUw9PSJ0dHlHRioiLCBSVU4rPSIvdXNyL2xpYmV4ZWMvcGV0aXRib290L3BiLWNv
bnNvbGUgLS1nZXR0eSAtLWRldGFjaCAtLSAtbiAtaSAwICRuYW1lIGxpbnV4Igo+ICtTVUJTWVNU
RU09PSJ0dHkiLCBLRVJORUw9PSJ0dHlTKiIsIFJVTis9Ii91c3IvbGliZXhlYy9wZXRpdGJvb3Qv
cGItY29uc29sZSAtLWdldHR5IC0tZGV0YWNoIC0tIC1uIC1pIDAgJG5hbWUgbGludXgiCj4gZGlm
ZiAtLWdpdCBhL3BhY2thZ2UvcGV0aXRib290L3BldGl0Ym9vdC5tayBiL3BhY2thZ2UvcGV0aXRi
b290L3BldGl0Ym9vdC5tawo+IGluZGV4IDhkMjIwZjg4ZjQ1YS4uNTU2ZDQxMjMwMjM3IDEwMDY0
NAo+IC0tLSBhL3BhY2thZ2UvcGV0aXRib290L3BldGl0Ym9vdC5tawo+ICsrKyBiL3BhY2thZ2Uv
cGV0aXRib290L3BldGl0Ym9vdC5tawo+IEBAIC01NSw2ICs1NSwxMCBAQCBkZWZpbmUgUEVUSVRC
T09UX1BPU1RfSU5TVEFMTAo+ICAgCQkkKFRBUkdFVF9ESVIpL2V0Yy9wZXRpdGJvb3QvYm9vdC5k
LzkwLXNvcnQtZHRiCj4gICAJJChJTlNUQUxMKSAtbSAwNzU1IC1EICQoUEVUSVRCT09UX1BLR0RJ
UikvUzE1cGItZGlzY292ZXIgXAo+ICAgCQkkKFRBUkdFVF9ESVIpL2V0Yy9pbml0LmQvUzE1cGIt
ZGlzY292ZXIKPiArCSQoSU5TVEFMTCkgLUQgLW0gMDc1NSAkKFBFVElUQk9PVF9QS0dESVIpL3Bl
dGl0Ym9vdC1jb25zb2xlLXVpLnJ1bGVzIFwKPiArCQkkKFRBUkdFVF9ESVIpL2V0Yy91ZGV2L3J1
bGVzLmQvcGV0aXRib290LWNvbnNvbGUtdWkucnVsZXMKPiArCSQoSU5TVEFMTCkgLUQgLW0gMDc1
NSAkKFBFVElUQk9PVF9QS0dESVIpL3N5c2N0bC5jb25mIFwKPiArCQkkKFRBUkdFVF9ESVIpL2V0
Yy9zeXNjdGwuZC9wZXRpdGJvb3QuY29uZgo+ICAgCW1rZGlyIC1wICQoVEFSR0VUX0RJUikvdXNy
L3NoYXJlL3VkaGNwYy9kZWZhdWx0LnNjcmlwdC5kLwo+ICAgCWxuIC1zZiAvdXNyL3NiaW4vcGIt
dWRoY3BjIFwKPiAgIAkJJChUQVJHRVRfRElSKS91c3Ivc2hhcmUvdWRoY3BjL2RlZmF1bHQuc2Ny
aXB0LmQvCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvcGV0aXRib290L3N5c2N0bC5jb25mIGIvcGFj
a2FnZS9wZXRpdGJvb3Qvc3lzY3RsLmNvbmYKPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4
IDAwMDAwMDAwMDAwMC4uMDJhYjhlMzI3NWI1Cj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBiL3BhY2th
Z2UvcGV0aXRib290L3N5c2N0bC5jb25mCj4gQEAgLTAsMCArMSBAQAo+ICtrZXJuZWwucHJpbnRr
ID0gMSAxIDEgMQo+IGRpZmYgLS1naXQgYS9zeXN0ZW0vQ29uZmlnLmluIGIvc3lzdGVtL0NvbmZp
Zy5pbgo+IGluZGV4IDI0Nzk4ZGMwNjgwMy4uOTU4N2RkOWNlNGRiIDEwMDY0NAo+IC0tLSBhL3N5
c3RlbS9Db25maWcuaW4KPiArKysgYi9zeXN0ZW0vQ29uZmlnLmluCj4gQEAgLTM3NSw3ICszNzUs
NyBAQCBjb25maWcgQlIyX1NZU1RFTV9CSU5fU0gKPiAgIAo+ICAgbWVudWNvbmZpZyBCUjJfVEFS
R0VUX0dFTkVSSUNfR0VUVFkKPiAgIAlib29sICJSdW4gYSBnZXR0eSAobG9naW4gcHJvbXB0KSBh
ZnRlciBib290Igo+IC0JZGVmYXVsdCB5Cj4gKwlkZWZhdWx0IHkgaWYgIUJSMl9QQUNLQUdFX1BF
VElUQk9PVAo+ICAgCj4gICBpZiBCUjJfVEFSR0VUX0dFTkVSSUNfR0VUVFkKPiAgIGNvbmZpZyBC
UjJfVEFSR0VUX0dFTkVSSUNfR0VUVFlfUE9SVAoKUmV2aWV3ZWQtYnk6IExhdXJlbnQgVml2aWVy
IDxsYXVyZW50QHZpdmllci5ldT4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9y
ZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK

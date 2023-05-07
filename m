Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8805CC77B75
	for <buildroot@archiver.kernel.org>; Sun,  7 May 2023 12:59:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2C6E74053C;
	Sun,  7 May 2023 12:59:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2C6E74053C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dqxS6GvPmB_4; Sun,  7 May 2023 12:59:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4775F404FE;
	Sun,  7 May 2023 12:59:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4775F404FE
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 72BD51BF27A
 for <buildroot@lists.busybox.net>; Sun,  7 May 2023 12:59:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 591DE60C00
 for <buildroot@lists.busybox.net>; Sun,  7 May 2023 12:59:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 591DE60C00
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zSlzlYQf3hQv for <buildroot@lists.busybox.net>;
 Sun,  7 May 2023 12:59:37 +0000 (UTC)
X-Greylist: delayed 00:07:07 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 401F260ACC
Received: from smtpcmd03116.aruba.it (smtpcmd03116.aruba.it [62.149.158.116])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 401F260ACC
 for <buildroot@buildroot.org>; Sun,  7 May 2023 12:59:36 +0000 (UTC)
Received: from [192.168.50.162] ([146.241.104.90])
 by Aruba Outgoing Smtp  with ESMTPSA
 id vdsJpWNsb2kvRvdsKp4pgO; Sun, 07 May 2023 14:52:28 +0200
Message-ID: <7de18d93-6441-e569-f460-57b92066bcc6@benettiengineering.com>
Date: Sun, 7 May 2023 14:52:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Content-Language: en-US, it
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
References: <20230501162619.1260325-1-giulio.benetti@benettiengineering.com>
 <CABGWkvqpAsu8NjkfW7RVQTbBrrsA_koVffPSVh8K5dUYhmHX6Q@mail.gmail.com>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <CABGWkvqpAsu8NjkfW7RVQTbBrrsA_koVffPSVh8K5dUYhmHX6Q@mail.gmail.com>
X-CMAE-Envelope: MS4xfCKlrhtzbxA9E597OdV57w9GSfml5wJUlRrHBGIxoR5jK2QQufsdkvsQ23adWZY03iNi9BM3BeJSLJNiILxVfa8cBBWWOBZW8CiL/Vl1VxfbUFUD+nCe
 mNhRvWxD+ZXPQjjkb4+gWpaX3l8VKdZyLh8r1/gnYOOw6fqBrr2JqxhgvHwSb9erRqyHHJ05GecCT7SZeZpqg+xQItcXq3RxQIlecpyHGcp19p6K+W3pnCiQ
 XeEqSXAL9vmzslExj5FUC5z9rFVyBVdi5nmAA2IkNVXDjXPh+2fNQX0lDwddysBMY+3Mi5KikvCx1f0kpp3mLRGW000XQBhIijO3LafQJKU=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1683463948; bh=oMtnhu45ZR/XdbnVdeB36BFirSLQal/Ajgu9+7S3PJw=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=lFieKNkwsJh+/dhZoD42dn+jS+y522ygN2VAEw7v6eepYdCpj7Q5uBL7cQ7V/Lybf
 IVwY2/dyog4Ns7Hh0ZH9zOsLIbq80H4p/sptjwsO3FrXlgtnjaCctZAXV9+4MQHWX2
 NmJmqXKWCKV/N4UtWYYpYEc106dgw3lVRCUXbg4eAB9swfk2l7LCBAqYkZPWcnM6Pl
 2QPg6QV6Gn4e8yA2r3y31KMDPbKScskPdexGCLo8W/drxYZNu/vxEpugb32IAK1+LS
 iBarxj6nSJHcFSH0CuC/ysJZmQSsc43OXKRqIB+j0cgAzZPVovR438tBLTrthAJz10
 qymtjNUoUmW3Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=lFieKNkw
Subject: Re: [Buildroot] [PATCH] configs/stm32f429_disco_xip_defconfig: fix
 runtime error due to low ram space and bump to linux version 6.1.27
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
Cc: Christophe Priouzeau <christophe.priouzeau@foss.st.com>,
 buildroot@buildroot.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgRGFyaW8sCgpPbiAwNi8wNS8yMyAxNjoyMSwgRGFyaW8gQmluYWNjaGkgd3JvdGU6Cj4gSGkg
R2l1bGlvLAo+IAo+IE9uIE1vbiwgTWF5IDEsIDIwMjMgYXQgNjoyNuKAr1BNIEdpdWxpbyBCZW5l
dHRpCj4gPGdpdWxpby5iZW5ldHRpQGJlbmV0dGllbmdpbmVlcmluZy5jb20+IHdyb3RlOgo+Pgo+
PiBBZnRlciBib290aW5nIExpbnV4IHRoZSB1c2Vyc3BhY2UgaXMgdW51c2FibGUgc2luY2UgZXZl
cnkgY29tbWFuZCBpc3N1ZWQsCj4+IHRoYXQgaXMgYSBzeW1saW5rIHRvIGJ1c3lib3gsIGZhaWxz
IGJlY2F1c2Ugb2Ygbm8gZnJlZSByYW0uIFNvIGxldCdzCj4+IGRpc2FibGUgSUlPIGluIGxpbnV4
LmNvbmZpZyB0byBnaXZlIHNvbWUgbW9yZSByYW0gdG8gdXNlcnNwYWNlLgo+Pgo+IAo+IEkgaGF2
ZSBhbHNvIGV4cGVyaWVuY2VkIHRoaXMgdHlwZSBvZiBiZWhhdmlvciB3aGVuIHVzaW5nIFNUIGJv
YXJkcyBpbgo+IGdlbmVyYWwgKHN0bTMyZjQyOS1kaXNjbywgc3RtMzJmNDY5LWRpc2NvLAo+IGFu
ZCBzdG0zMmY3NjktZGlzY28pLCBhbmQgZXZlcnkgdGltZSBJIHdvbmRlciB3aGV0aGVyIGl0IGlz
IGJldHRlciB0bwo+IHVwZGF0ZSB0aGUga2VybmVsICh3aGljaCBhbHdheXMgb2NjdXBpZXMgbW9y
ZQo+IG1lbW9yeSB3aXRoIGVhY2ggbmV3IHZlcnNpb24pIG9yIG5vdC4gVGhlIGlkZWEgSSBoYXZl
IGlzIHRvIHByZWZlciB0aGUKPiBrZXJuZWwgdG8gdXNlciBzcGFjZSwgYW5kIHRoZXJlZm9yZSBk
aXNhYmxlCj4gc3RhcnRpbmcgZnJvbSB0aGUgdXNlciBzcGFjZSBmaXJzdCBvZiBhbGwsIGJ1dCBt
eSBvcGluaW9uIGlzIGRlYmF0YWJsZS4KCkkgd2FzIGFib3V0IHRvIHRoYXQsIGJ1dCB3aGlsZSB0
ZXN0aW5nIG9uIHRoZSBib2FyZCBJJ3ZlIHNlZW4gdGhhdApidXN5Ym94IHV0aWxpdGllcyB3ZXJl
IGFscmVhZHkgdmVyeSBmZXcuIFNvIEkndmUgcHJlZmVycmVkIHRvIGRpc2FibGUKSUlPIFNUTTMy
IFRpbWVyIFRyaWdnZXIgYW5kIGVudGlyZSBJSU8gc3Vic3lzdGVtLiBJIHRoaW5rIHRoYXQgdGhl
CmJvYXJkIGlzIGFueXdheSBhIGdvb2QgcGxheWdyb3VuZC4gT2YgY291cnNlIHdpdGggb25seSA4
TUIgb24gcmFtIGlzCm5vdCBzdWl0YWJsZSBmb3IgYW55IHByb2dyYW0uIFNvIGlmIG5vd2FkYXlz
IHNvbWVvbmUgZGVjaWRlcyB0byBkZXNpZ24KYSBib2FyZCB3aXRoIHN0bTMyZjQgcHJvY2Vzc29y
IHNob3VsZCBnbyB3aXRoIG9sZGVyIExpbnV4IHZlcnNpb25zIG9yCklNSE8gdGhleSBzaG91bGQg
dXNlIG1vcmUgcmFtLgoKS2luZCByZWdhcmRzCi0tIApHaXVsaW8gQmVuZXR0aQpCZW5ldHRpIEVu
Z2luZWVyaW5nIHNhcwoKPiBUaGFua3MgYW5kIHJlZ2FyZHMsCj4gRGFyaW8KPiAKPj4gU2lnbmVk
LW9mZi1ieTogR2l1bGlvIEJlbmV0dGkgPGdpdWxpby5iZW5ldHRpQGJlbmV0dGllbmdpbmVlcmlu
Zy5jb20+Cj4+IC0tLQo+PiAgIGJvYXJkL3N0bWljcm9lbGVjdHJvbmljcy9zdG0zMmY0MjktZGlz
Y28vbGludXguY29uZmlnIHwgNCAtLS0tCj4+ICAgY29uZmlncy9zdG0zMmY0MjlfZGlzY29feGlw
X2RlZmNvbmZpZyAgICAgICAgICAgICAgICAgfCAyICstCj4+ICAgMiBmaWxlcyBjaGFuZ2VkLCAx
IGluc2VydGlvbigrKSwgNSBkZWxldGlvbnMoLSkKPj4KPj4gZGlmZiAtLWdpdCBhL2JvYXJkL3N0
bWljcm9lbGVjdHJvbmljcy9zdG0zMmY0MjktZGlzY28vbGludXguY29uZmlnIGIvYm9hcmQvc3Rt
aWNyb2VsZWN0cm9uaWNzL3N0bTMyZjQyOS1kaXNjby9saW51eC5jb25maWcKPj4gaW5kZXggN2I1
YzYwZjE4MC4uMDJkOWMyZDFlMCAxMDA2NDQKPj4gLS0tIGEvYm9hcmQvc3RtaWNyb2VsZWN0cm9u
aWNzL3N0bTMyZjQyOS1kaXNjby9saW51eC5jb25maWcKPj4gKysrIGIvYm9hcmQvc3RtaWNyb2Vs
ZWN0cm9uaWNzL3N0bTMyZjQyOS1kaXNjby9saW51eC5jb25maWcKPj4gQEAgLTk1LDEwICs5NSw2
IEBAIENPTkZJR19TVE0zMl9NRE1BPXkKPj4gICBDT05GSUdfU1lOQ19GSUxFPXkKPj4gICAjIENP
TkZJR19WSVJUSU9fTUVOVSBpcyBub3Qgc2V0Cj4+ICAgIyBDT05GSUdfVkhPU1RfTUVOVSBpcyBu
b3Qgc2V0Cj4+IC1DT05GSUdfSUlPPXkKPj4gLUNPTkZJR19JSU9fQlVGRkVSPXkKPj4gLUNPTkZJ
R19JSU9fVFJJR0dFUkVEX0JVRkZFUj15Cj4+IC1DT05GSUdfSUlPX1NUTTMyX1RJTUVSX1RSSUdH
RVI9eQo+PiAgICMgQ09ORklHX0ZJTEVfTE9DS0lORyBpcyBub3Qgc2V0Cj4+ICAgIyBDT05GSUdf
RE5PVElGWSBpcyBub3Qgc2V0Cj4+ICAgIyBDT05GSUdfSU5PVElGWV9VU0VSIGlzIG5vdCBzZXQK
Pj4gZGlmZiAtLWdpdCBhL2NvbmZpZ3Mvc3RtMzJmNDI5X2Rpc2NvX3hpcF9kZWZjb25maWcgYi9j
b25maWdzL3N0bTMyZjQyOV9kaXNjb194aXBfZGVmY29uZmlnCj4+IGluZGV4IDg3MmU0YjZhMzAu
LjFhZWE3NDFmN2UgMTAwNjQ0Cj4+IC0tLSBhL2NvbmZpZ3Mvc3RtMzJmNDI5X2Rpc2NvX3hpcF9k
ZWZjb25maWcKPj4gKysrIGIvY29uZmlncy9zdG0zMmY0MjlfZGlzY29feGlwX2RlZmNvbmZpZwo+
PiBAQCAtNiw3ICs2LDcgQEAgQlIyX0VOQUJMRV9MVE89eQo+PiAgIEJSMl9ST09URlNfUE9TVF9C
VUlMRF9TQ1JJUFQ9ImJvYXJkL3N0bWljcm9lbGVjdHJvbmljcy9jb21tb24vc3RtMzJmNHh4L3N0
bTMyLXBvc3QtYnVpbGQuc2giCj4+ICAgQlIyX0xJTlVYX0tFUk5FTD15Cj4+ICAgQlIyX0xJTlVY
X0tFUk5FTF9DVVNUT01fVkVSU0lPTj15Cj4+IC1CUjJfTElOVVhfS0VSTkVMX0NVU1RPTV9WRVJT
SU9OX1ZBTFVFPSI2LjEuMTAiCj4+ICtCUjJfTElOVVhfS0VSTkVMX0NVU1RPTV9WRVJTSU9OX1ZB
TFVFPSI2LjEuMjciCj4+ICAgQlIyX0xJTlVYX0tFUk5FTF9VU0VfQ1VTVE9NX0NPTkZJRz15Cj4+
ICAgQlIyX0xJTlVYX0tFUk5FTF9DVVNUT01fQ09ORklHX0ZJTEU9ImJvYXJkL3N0bWljcm9lbGVj
dHJvbmljcy9zdG0zMmY0MjktZGlzY28vbGludXguY29uZmlnIgo+PiAgIEJSMl9MSU5VWF9LRVJO
RUxfSU1BR0VfVEFSR0VUX0NVU1RPTT15Cj4+IC0tCj4+IDIuMzQuMQo+Pgo+IAo+IAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxp
bmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5v
cmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK

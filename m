Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07363C47258
	for <buildroot@archiver.kernel.org>; Sat, 20 Jan 2024 17:43:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 66A7140253;
	Sat, 20 Jan 2024 17:43:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 66A7140253
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id B-ocshyyFv-z; Sat, 20 Jan 2024 17:43:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6714F40A53;
	Sat, 20 Jan 2024 17:43:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6714F40A53
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 895461BF31E
 for <buildroot@lists.busybox.net>; Sat, 20 Jan 2024 17:43:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5B46083FC1
 for <buildroot@lists.busybox.net>; Sat, 20 Jan 2024 17:43:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5B46083FC1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id z2JP1L1btYkn for <buildroot@lists.busybox.net>;
 Sat, 20 Jan 2024 17:43:07 +0000 (UTC)
X-Greylist: delayed 305 seconds by postgrey-1.37 at util1.osuosl.org;
 Sat, 20 Jan 2024 17:43:06 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C9E5C83FC0
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.187])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C9E5C83FC0
 for <buildroot@buildroot.org>; Sat, 20 Jan 2024 17:43:06 +0000 (UTC)
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue012 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1N2BQM-1qyLMn0Cuk-013ajd; Sat, 20 Jan 2024 18:37:59 +0100
Message-ID: <faad09fc-7f14-42a9-8671-5882b55b39a2@vivier.eu>
Date: Sat, 20 Jan 2024 18:37:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: fr
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20240120172839.763337-1-fontaine.fabrice@gmail.com>
From: Laurent Vivier <laurent@vivier.eu>
Autocrypt: addr=laurent@vivier.eu; keydata=
 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
In-Reply-To: <20240120172839.763337-1-fontaine.fabrice@gmail.com>
X-Provags-ID: V03:K1:XT7sMZfOQ6R/FkEaob1hc6+ht13xxwRo2ggoumk/htvYxVoMMNC
 7qGunMDbhOSq5WNswHxnf8M7OWN8NVPEtXXEP+qWO+uOGQkWTfc0tYafpPicekWDdZiVytr
 MYy1ivQ4fO24H2ZNj4gaOQicHozNWPiYXrjXLG3H79K9MYyL9HlhBESn/AT7bDS0Ce3/FNI
 E7Z/g0tw/K8oURrWoEUbA==
UI-OutboundReport: notjunk:1;M01:P0:FIjcLfI4cmM=;xN0lTBRwHy5sbAAyDAem2y0Zpjq
 ik8Zy0OOXJsUPYDTD16pTS0CdKM04GN9V5MdFBD4f/Omnhqa8cK1sk1k5OAN9VjxVzoINEKAw
 9e6FQrggCWTbenrguwZW9/dd8IIB/Fk/sM++tg208BaAU27QwxY4da+UFV2zSsrZqKD7rWTOC
 9zkfcul1hxY7rZdt852EbwHULg1Tu1Enld/secbxPuXX3TWO4Ua0cJXir5UFe0vCV+AgpQW9X
 9Vw+zSxypFZwbCC0vnadd9ZjJgFOehcu+aBYNwuVo06IC0v1RL2EbePT9opy1sYkuyHTUWOdm
 JFxNdMBLYFVF+3Me/sjuT+1m9W1ptnOiQu32wmD8QZXe6XV5XxSZ25UR3MkZNhwkBmZvwLJQ3
 kVHlKkO87J/Vbuu4SInhGIBhhDNVMIt9zM6o0iv+w5+F6wHfMzKSD4IuGdAp9UP4i//O7ddxM
 M9umvVBK2hsjVaUDJRqQ6gG9OysZTYt5pu7prx5ZBRc07IyO/R0iFLRWvHC+IEl6XwzRN+CZ1
 PvMlrKnZITzjzIZoBWnaqWFjIk3s6TMHnDGr3Ydo5pYHAtdxWlmPlckig9NJ6feYyjZXETt45
 QQ2Y6BzFGQEIs0rrZWSYLD+9YfNRwpNhUYCrEn3C3VM0eqdfL3Py/2cQT8CauYbLzeHloiQTS
 W8gnJqsqM0t7yDhf3rwQ8qqnFCGJPbUKjxHIF67rHGTlydt5Y9IOn27SsrnfOUr1nLNXnlrR4
 VQGqhJDQte/gQlR4WzM7iAYOWtUXJHg2VA7Ij4fH2eDP7iR39JW98Eun6p6CM+CAKiq7yq6d5
 FGZAtDscN9/2c+EPe092qcKRfVWon6UbeoHnCZo1Qp8Q27BObKSqiJSNuiM9/3kbgPFOx/NzD
 w7EcX+YsoOelu6A==
Subject: Re: [Buildroot] [PATCH 1/1] package/petitboot: fix NLS build
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

TGUgMjAvMDEvMjAyNCDDoCAxODoyOCwgRmFicmljZSBGb250YWluZSBhIMOpY3JpdMKgOgo+IEZp
eCB0aGUgZm9sbG93aW5nIE5MUyBidWlsZCBmYWlsdXJlIG9uIG11c2wgcmFpc2VkIGNvbW1pdAo+
IGJmOTU4M2E1MDI3NmY1MmVkYmMzN2Q5Zjg1ZGY1ZjJjYzdmZGI1ZGM6Cj4gCj4gL2hvbWUvYXV0
b2J1aWxkL2F1dG9idWlsZC9pbnN0YW5jZS00L291dHB1dC0xL2hvc3QvbGliL2djYy9taXBzNjRl
bC1idWlsZHJvb3QtbGludXgtbXVzbC8xMy4yLjAvLi4vLi4vLi4vLi4vbWlwczY0ZWwtYnVpbGRy
b290LWxpbnV4LW11c2wvYmluL2xkOiBkaXNjb3Zlci9wYl9kaXNjb3Zlci1wYi1kaXNjb3Zlci5v
OiB1bmRlZmluZWQgcmVmZXJlbmNlIHRvIHN5bWJvbCAnbGliaW50bF90ZXh0ZG9tYWluJwo+IAo+
IEZpeGVzOgo+ICAgLSBodHRwOi8vYXV0b2J1aWxkLmJ1aWxkcm9vdC5vcmcvcmVzdWx0cy82ZDQ0
MGQ5NmU4MTE2NzQwNDFiNWExZmRhZTk2ZDRjMzc3ODI0YzJhCj4gCj4gU2lnbmVkLW9mZi1ieTog
RmFicmljZSBGb250YWluZSA8Zm9udGFpbmUuZmFicmljZUBnbWFpbC5jb20+Cj4gLS0tCj4gICBw
YWNrYWdlL3BldGl0Ym9vdC9wZXRpdGJvb3QubWsgfCAxMCArKysrKysrKystCj4gICAxIGZpbGUg
Y2hhbmdlZCwgOSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBh
L3BhY2thZ2UvcGV0aXRib290L3BldGl0Ym9vdC5tayBiL3BhY2thZ2UvcGV0aXRib290L3BldGl0
Ym9vdC5tawo+IGluZGV4IGM0ZWIyMGI0NGQuLjIwODdmMDFiMDkgMTAwNjQ0Cj4gLS0tIGEvcGFj
a2FnZS9wZXRpdGJvb3QvcGV0aXRib290Lm1rCj4gKysrIGIvcGFja2FnZS9wZXRpdGJvb3QvcGV0
aXRib290Lm1rCj4gQEAgLTcsMTAgKzcsMTggQEAKPiAgIFBFVElUQk9PVF9WRVJTSU9OID0gMS4x
NAo+ICAgUEVUSVRCT09UX1NPVVJDRSA9IHBldGl0Ym9vdC12JChQRVRJVEJPT1RfVkVSU0lPTiku
dGFyLmd6Cj4gICBQRVRJVEJPT1RfU0lURSA9IGh0dHBzOi8vZ2l0aHViLmNvbS9vcGVuLXBvd2Vy
L3BldGl0Ym9vdC9yZWxlYXNlcy9kb3dubG9hZC92JChQRVRJVEJPT1RfVkVSU0lPTikKPiAtUEVU
SVRCT09UX0RFUEVOREVOQ0lFUyA9IGVsZnV0aWxzIG5jdXJzZXMgdWRldiBob3N0LWJpc29uIGhv
c3QtZmxleCBsdm0yCj4gK1BFVElUQk9PVF9ERVBFTkRFTkNJRVMgPSBcCj4gKwllbGZ1dGlscyBc
Cj4gKwluY3Vyc2VzIFwKPiArCXVkZXYgXAo+ICsJaG9zdC1iaXNvbiBcCj4gKwlob3N0LWZsZXgg
XAo+ICsJbHZtMiBcCj4gKwkkKFRBUkdFVF9OTFNfREVQRU5ERU5DSUVTKQo+ICAgUEVUSVRCT09U
X0xJQ0VOU0UgPSBHUEwtMi4wCj4gICBQRVRJVEJPT1RfTElDRU5TRV9GSUxFUyA9IENPUFlJTkcK
PiAgIAo+ICtQRVRJVEJPT1RfQ09ORl9FTlYgPSBMREZMQUdTPSIkKFRBUkdFVF9MREZMQUdTKSAk
KFRBUkdFVF9OTFNfTElCUykiCgpzaG91bGQgaXQgYmUKClBFVElUQk9PVF9DT05GX0VOViA9IExE
RkxBR1M9IiQoVEFSR0VUX0xERkxBR1MpIExJQlM9JChUQVJHRVRfTkxTX0xJQlMpCgo/CgpUaGFu
a3MsCkxhdXJlbnQKCj4gICBQRVRJVEJPT1RfQ09ORl9PUFRTID0gXAo+ICAgCS0tZW5hYmxlLWNy
eXB0IFwKPiAgIAktLWVuYWJsZS1wbGF0Zm9ybS1hdXRvIFwKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRy
b290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlz
dGluZm8vYnVpbGRyb290Cg==

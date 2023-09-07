Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D496EE14D4
	for <buildroot@archiver.kernel.org>; Thu,  7 Sep 2023 08:58:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9A68181266;
	Thu,  7 Sep 2023 08:58:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9A68181266
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XD5ENrrUw9Sz; Thu,  7 Sep 2023 08:58:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DF14D81210;
	Thu,  7 Sep 2023 08:58:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DF14D81210
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A76B11BF2E3
 for <buildroot@lists.busybox.net>; Thu,  7 Sep 2023 08:58:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8001181210
 for <buildroot@lists.busybox.net>; Thu,  7 Sep 2023 08:58:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8001181210
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nJm0RYGMmhKX for <buildroot@lists.busybox.net>;
 Thu,  7 Sep 2023 08:58:49 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.130])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 58D17811A9
 for <buildroot@buildroot.org>; Thu,  7 Sep 2023 08:58:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 58D17811A9
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue010 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1N9dg5-1paylt2g5d-015Y8L; Thu, 07 Sep 2023 10:53:32 +0200
Message-ID: <c3ae73cf-fe5d-a325-cf4e-17c7193f4791@vivier.eu>
Date: Thu, 7 Sep 2023 10:53:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: fr
To: Reza Arbab <arbab@linux.ibm.com>, buildroot@buildroot.org
References: <20230906194609.74080-1-arbab@linux.ibm.com>
 <20230906194609.74080-4-arbab@linux.ibm.com>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20230906194609.74080-4-arbab@linux.ibm.com>
X-Provags-ID: V03:K1:LYffms3EEXr7aOSzCEdKbRQvfEO4qRtSnAbpLQR4k7KuIXyYKIF
 CNAqvMkkLjYXPlGIHyBtGlbIRAbBZazz/WEH+VW/ZJeRU0o49cxCY8uW7vxfS8302nclLoR
 UJF3LuJyINXGP6h7+9gb3e859Zd8wqXZ+JVFadd5cCrXBuxkwfSZqiEhMwq975YD2EH/0nA
 dk5N8DZzzFyjwsFO5gtCA==
UI-OutboundReport: notjunk:1;M01:P0:b/MNEY5vp7I=;XgqjqWeeYkWVzLj4qE7BkY9bCOg
 o1x3SYBV9NrLiuDZhmR4TgC8r/JFPbF+dSuh+7FyzboELlqR8N+03HpFOUh7Lqp+2OeK9fucD
 YkeizRPXvRsm76G2j3qX/YdsuNa+yov7KSVtmrM+lYKrM7t6gCxiJiuVcAssOPaaPzUPFM4zl
 Ol2R+PLLplIPnpHi/RPXCSzkc3YVA5eoIhPllPvLsXcKYtJZySzgR6K6ocLeJHD4jnKwXFP0K
 ZxjYTAE8KtwSp8uB5J3J79bkISssrFYC2bpei4zt+tslGKbwKeCJs/vfFudjh6G/b8MKywaKz
 EPd8TTo02EYDqnuTo9L/w/TZQC1p6Ri2ByRy5WsjNfQa/5wOUQUJo04MW/2UnJKU8voT+qM4e
 Lx3DkQGQUBLk0WNOjAj0oMd4G/vRA9jhykM8YUdlAsS6GsBpBrngfHrZd4W1kcFx/b9zNCajG
 ux19W68NblJ2nNSxAU6SwlW9eZuCoL7lwC+1gXv6OafevKHVmIhu+UVL1jNczWkqVbkxwEYaH
 G6xZzHOTcCVoZZ5pxV0GNxQHy73CZIV0ltE8PMSB7720Hk1W6w2geMdy8XgbDBD6Cn9IgVM0e
 1Ka8RBrjyu1iiuFtEDNTi9O0JE2RwRMOPagOoHIE9cXfTKWZlGfKVzYN6ouVyArz1oGBjH3JJ
 1bpWEAJKmKMigEIzNQAdTGaiM+DRQJ3hf0Z3rdfdGzw3qoZfwtM0E7BfQDfdqp8g81TcVg35j
 dpsRpoOEYAWolx8FblCywdg8yHL49i5QQZhDHyz0XnhDtloSGaI++bGiZ+2EqgI9tq9a5R6/g
 VeFlaqIjc15sngBpk5MU1Pd/fTanibhJAdi7dxFAIZF8pIUbmqzmcvDQ97SbeoDoCSyWuLdTX
 agqCTwMAt2OH/eQ==
Subject: Re: [Buildroot] [PATCH 3/5] package/petitboot: poll removable
 devices
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

TGUgMDYvMDkvMjAyMyDDoCAyMTo0NiwgUmV6YSBBcmJhYiBhIMOpY3JpdMKgOgo+IEFkZCBhIHVk
ZXYgcnVsZSB0byBlbmFibGUgbm90aWZpY2F0aW9uIG9mIG1lZGlhIGNoYW5nZSBldmVudHMgb24K
PiByZW1vdmFibGUgZGV2aWNlcywgc28gcGV0aXRib290IGNhbiBkeW5hbWljYWxseSBhZGFwdCB0
byB0aGVtLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFJlemEgQXJiYWIgPGFyYmFiQGxpbnV4LmlibS5j
b20+Cj4gLS0tCj4gICBwYWNrYWdlL3BldGl0Ym9vdC9wZXRpdGJvb3QubWsgICAgICAgICAgICAg
ICB8IDIgKysKPiAgIHBhY2thZ2UvcGV0aXRib290L3JlbW92YWJsZS1ldmVudC1wb2xsLnJ1bGVz
IHwgMyArKysKPiAgIDIgZmlsZXMgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspCj4gICBjcmVhdGUg
bW9kZSAxMDA2NDQgcGFja2FnZS9wZXRpdGJvb3QvcmVtb3ZhYmxlLWV2ZW50LXBvbGwucnVsZXMK
PiAKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9wZXRpdGJvb3QvcGV0aXRib290Lm1rIGIvcGFja2Fn
ZS9wZXRpdGJvb3QvcGV0aXRib290Lm1rCj4gaW5kZXggNTU2ZDQxMjMwMjM3Li45MzI2NzM4YWEw
MzggMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9wZXRpdGJvb3QvcGV0aXRib290Lm1rCj4gKysrIGIv
cGFja2FnZS9wZXRpdGJvb3QvcGV0aXRib290Lm1rCj4gQEAgLTU3LDYgKzU3LDggQEAgZGVmaW5l
IFBFVElUQk9PVF9QT1NUX0lOU1RBTEwKPiAgIAkJJChUQVJHRVRfRElSKS9ldGMvaW5pdC5kL1Mx
NXBiLWRpc2NvdmVyCj4gICAJJChJTlNUQUxMKSAtRCAtbSAwNzU1ICQoUEVUSVRCT09UX1BLR0RJ
UikvcGV0aXRib290LWNvbnNvbGUtdWkucnVsZXMgXAo+ICAgCQkkKFRBUkdFVF9ESVIpL2V0Yy91
ZGV2L3J1bGVzLmQvcGV0aXRib290LWNvbnNvbGUtdWkucnVsZXMKPiArCSQoSU5TVEFMTCkgLUQg
LW0gMDc1NSAkKFBFVElUQk9PVF9QS0dESVIpL3JlbW92YWJsZS1ldmVudC1wb2xsLnJ1bGVzIFwK
PiArCQkkKFRBUkdFVF9ESVIpL2V0Yy91ZGV2L3J1bGVzLmQvcmVtb3ZhYmxlLWV2ZW50LXBvbGwu
cnVsZXMKPiAgIAkkKElOU1RBTEwpIC1EIC1tIDA3NTUgJChQRVRJVEJPT1RfUEtHRElSKS9zeXNj
dGwuY29uZiBcCj4gICAJCSQoVEFSR0VUX0RJUikvZXRjL3N5c2N0bC5kL3BldGl0Ym9vdC5jb25m
Cj4gICAJbWtkaXIgLXAgJChUQVJHRVRfRElSKS91c3Ivc2hhcmUvdWRoY3BjL2RlZmF1bHQuc2Ny
aXB0LmQvCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvcGV0aXRib290L3JlbW92YWJsZS1ldmVudC1w
b2xsLnJ1bGVzIGIvcGFja2FnZS9wZXRpdGJvb3QvcmVtb3ZhYmxlLWV2ZW50LXBvbGwucnVsZXMK
PiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAwMDAwMC4uNTdiYjc0ZDNjMDBj
Cj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBiL3BhY2thZ2UvcGV0aXRib290L3JlbW92YWJsZS1ldmVu
dC1wb2xsLnJ1bGVzCj4gQEAgLTAsMCArMSwzIEBACj4gKyMgcGV0aXRib290IG5lZWRzIG5vdGlm
aWNhdGlvbiBmb3IgbWVkaWEgY2hhbmdlIGV2ZW50cyBvbiByZW1vdmFibGUgZGV2aWNlcywKPiAr
IyB3aGljaCB3ZSBvbmx5IGdldCBpZiB3ZSd2ZSBzZXQgdGhlIHBvbGxfbXNlY3Mgc3lzZnMgYXR0
cmlidXRlLgo+ICtBQ1RJT04hPSJyZW1vdmUiLCBBVFRSe3JlbW92YWJsZX09PSIxIiwgQVRUUntl
dmVudHNfcG9sbF9tc2Vjc309IjIwMDAiCgpSZXZpZXdlZC1ieTogTGF1cmVudCBWaXZpZXIgPGxh
dXJldEB2aXZpZXIuZXU+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0
cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==

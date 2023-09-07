Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA7B8EE14D0
	for <buildroot@archiver.kernel.org>; Thu,  7 Sep 2023 08:55:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 893AD821FB;
	Thu,  7 Sep 2023 08:55:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 893AD821FB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8XXJAySV5Cak; Thu,  7 Sep 2023 08:55:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C143C821E8;
	Thu,  7 Sep 2023 08:55:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C143C821E8
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7E8E91BF2E3
 for <buildroot@lists.busybox.net>; Thu,  7 Sep 2023 08:55:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 57BD9821E8
 for <buildroot@lists.busybox.net>; Thu,  7 Sep 2023 08:55:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 57BD9821E8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JoaMU-rjwapF for <buildroot@lists.busybox.net>;
 Thu,  7 Sep 2023 08:55:39 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.133])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4C4498218E
 for <buildroot@buildroot.org>; Thu,  7 Sep 2023 08:55:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4C4498218E
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue012 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MSqbe-1qDLMB0bOA-00UKTC; Thu, 07 Sep 2023 10:55:33 +0200
Message-ID: <fd0357da-117d-4b2b-0dc3-6b331d25c2f2@vivier.eu>
Date: Thu, 7 Sep 2023 10:55:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: fr
To: Reza Arbab <arbab@linux.ibm.com>, buildroot@buildroot.org
References: <20230906194609.74080-1-arbab@linux.ibm.com>
 <20230906194609.74080-6-arbab@linux.ibm.com>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20230906194609.74080-6-arbab@linux.ibm.com>
X-Provags-ID: V03:K1:bj0DRpHc6RfQ/rxg/eucPzFIXm8hniwsGi4nzyk+IfrIOYnBdWA
 4kqDp88Zx4dvtTnfJjmthXAhq5p18CGaX87eUxI8Bfn+umIoN7dCzowBLnTc7p/2uqS00PW
 QcZOOwWaDe1DEV5cLpa4eak3Uy2oEaOaWa5zaEHjB3PLPQm5ZAYOT/KXzgc5l1L0qRfezi7
 jk3xPLrTJJt9IiY00JENw==
UI-OutboundReport: notjunk:1;M01:P0:Z7dJErfFiZg=;T+z9Qi+vI01LtdK1sM6dmO4jmjj
 J2mLSNjtwNfizxOtiowUmAfCV/X5zdiG3pTBjxL0Qz1vKgZ/6wM7iZdGXTXWrTHubQyAgwudZ
 zpi5rGi6gDtOea+2b+qgEFT+W1kXo98bstbZNR52HdjHRs7xXt/7X780gxhEY4N8Seg9Ccx4x
 Ze3xDN47BikUDMcewu02jwpctXv1hmu/qoTNV5EQVQkYu2UpEWitYaluOt3FhNw56UscV8A2R
 tiuo423p5DeQb/KQc8YGBbacrggEptCECwa+pAINYCgVC6iZN8PwMKYH6tTj3SALXU4maM301
 4/Mqf73p9S/NI09kFkJJynpJ109nowqy2H+wm3QCI/+ceqeXTmRW1GSJD40+u9AgMuE0Hmr9g
 npnIPkdXCgFBbiLBBVDV+srTm9nkuKWNI+euk2S7fSl6TOnA0ZT6Buv4naOrG+1XdjjZtCqgo
 oOlUeU7MgAT7EO/sYwr2FeskB57Qrc8AvRem2CtkVJj9NmCE7BCgFap+Xy5M/omEZJ2sVjGjn
 A8mrM+XScHcm7Z9J1xfyoK0/8A8ikizGt3vv0fkD4r3pfV2rTx4EBs9aOZmOn+oDOIpECtaA3
 ltxcxGKeFDS9UNQc0LFFrSXrlZPZSbxOwAeQm5JoVqpCFzupLjBDS1WAuG2pCfPP6hzlNi7aL
 QHkjrW8SeJXokY80kb7NyKzCzlswdrmkFD9cIQEMrN+rS+mBP53tLnAnPVQ9rK5ZNREGjN7Oi
 H2XSP+bjapHJ/VNJQ2deSvsBCa4mk8NOb1ncGj7nqeHXAmJMfZb9VOnu9H/0mRWB7OWjkBxqj
 9DcNV2LFeRkNdcoSnWl7s5zW2eeKcP+x27sIXfGgJEOcPuKCa/YbDbLytYbVLLKURzTPGoivK
 3vrsFM4tvoSv2SQ==
Subject: Re: [Buildroot] [PATCH 5/5] package/petitboot: enable discovery of
 SCSI devices
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

TGUgMDYvMDkvMjAyMyDDoCAyMTo0NiwgUmV6YSBBcmJhYiBhIMOpY3JpdMKgOgo+IEl0J3MgbGlr
ZWx5IHRoYXQgdGhlICJzZyIga2VybmVsIGRyaXZlciBuZWVkZWQgdG8gc2NhbiBTQ1NJIGRldmlj
ZXMgaXMgYQo+IG1vZHVsZS4gSW5zdGFsbCBhIHVkZXYgcnVsZSB0byBsb2FkIGl0IGF1dG9tYXRp
Y2FsbHkgd2hlbiBkZXZpY2VzIGFyZQo+IHByZXNlbnQuCj4gCj4gU2lnbmVkLW9mZi1ieTogUmV6
YSBBcmJhYiA8YXJiYWJAbGludXguaWJtLmNvbT4KPiAtLS0KPiAgIHBhY2thZ2UvcGV0aXRib290
LzY2LWFkZC1zZy1tb2R1bGUucnVsZXMgfCAyICsrCj4gICBwYWNrYWdlL3BldGl0Ym9vdC9wZXRp
dGJvb3QubWsgICAgICAgICAgIHwgMiArKwo+ICAgMiBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlv
bnMoKykKPiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL3BldGl0Ym9vdC82Ni1hZGQtc2ct
bW9kdWxlLnJ1bGVzCj4gCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvcGV0aXRib290LzY2LWFkZC1z
Zy1tb2R1bGUucnVsZXMgYi9wYWNrYWdlL3BldGl0Ym9vdC82Ni1hZGQtc2ctbW9kdWxlLnJ1bGVz
Cj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAwMDAwMDAuLmFlMThkMjhjNTcw
ZQo+IC0tLSAvZGV2L251bGwKPiArKysgYi9wYWNrYWdlL3BldGl0Ym9vdC82Ni1hZGQtc2ctbW9k
dWxlLnJ1bGVzCj4gQEAgLTAsMCArMSwyIEBACj4gKyMgbG9hZCBtb2R1bGVzIHRvIHNjc2kgZGlz
a3MsIGlmIHRoZXkgYXJlbid0IGluIGtlcm5lbAo+ICtTVUJTWVNURU09PSJzY3NpIiwgRU5We0RF
VlRZUEV9PT0ic2NzaV9kZXZpY2UiLCBURVNUIT0iW21vZHVsZS9zZ10iLCBSVU4rPSIvc2Jpbi9t
b2Rwcm9iZSBzZyIKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9wZXRpdGJvb3QvcGV0aXRib290Lm1r
IGIvcGFja2FnZS9wZXRpdGJvb3QvcGV0aXRib290Lm1rCj4gaW5kZXggNTk2ZTgwMWI3ODFjLi41
OTBiNThlOWM3MWEgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9wZXRpdGJvb3QvcGV0aXRib290Lm1r
Cj4gKysrIGIvcGFja2FnZS9wZXRpdGJvb3QvcGV0aXRib290Lm1rCj4gQEAgLTYzLDYgKzYzLDgg
QEAgZGVmaW5lIFBFVElUQk9PVF9QT1NUX0lOU1RBTEwKPiAgIAkJJChUQVJHRVRfRElSKS9ldGMv
cGV0aXRib290L2Jvb3QuZC8wMS1jcmVhdGUtZGVmYXVsdC1kdGIKPiAgIAkkKElOU1RBTEwpIC1E
IC1tIDA3NTUgJChARCkvdXRpbHMvaG9va3MvOTAtc29ydC1kdGIgXAo+ICAgCQkkKFRBUkdFVF9E
SVIpL2V0Yy9wZXRpdGJvb3QvYm9vdC5kLzkwLXNvcnQtZHRiCj4gKwkkKElOU1RBTEwpIC1EIC1t
IDA3NTUgJChQRVRJVEJPT1RfUEtHRElSKS82Ni1hZGQtc2ctbW9kdWxlLnJ1bGVzIFwKPiArCQkk
KFRBUkdFVF9ESVIpL2V0Yy91ZGV2L3J1bGVzLmQvNjYtYWRkLXNnLW1vZHVsZS5ydWxlcwo+ICAg
CSQoSU5TVEFMTCkgLW0gMDc1NSAtRCAkKFBFVElUQk9PVF9QS0dESVIpL1MxNXBiLWRpc2NvdmVy
IFwKPiAgIAkJJChUQVJHRVRfRElSKS9ldGMvaW5pdC5kL1MxNXBiLWRpc2NvdmVyCj4gICAJJChJ
TlNUQUxMKSAtRCAtbSAwNzU1ICQoUEVUSVRCT09UX1BLR0RJUikvcGV0aXRib290LWNvbnNvbGUt
dWkucnVsZXMgXAoKUmV2aWV3ZWQtYnk6IExhdXJlbnQgVml2aWVyIDxsYXVyZW50QHZpdmllci5l
dT4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRy
b290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1
aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 916FAC76195
	for <buildroot@archiver.kernel.org>; Mon, 27 Mar 2023 13:58:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0F44F40343;
	Mon, 27 Mar 2023 13:58:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0F44F40343
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IHxWQysLVRz6; Mon, 27 Mar 2023 13:58:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CF3EA40308;
	Mon, 27 Mar 2023 13:58:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CF3EA40308
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B1B5B1BF37B
 for <buildroot@lists.busybox.net>; Mon, 27 Mar 2023 13:58:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6DDC481F06
 for <buildroot@lists.busybox.net>; Mon, 27 Mar 2023 13:58:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6DDC481F06
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 387at7Jlhlhn for <buildroot@lists.busybox.net>;
 Mon, 27 Mar 2023 13:58:04 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2594281F09
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2594281F09
 for <buildroot@buildroot.org>; Mon, 27 Mar 2023 13:58:03 +0000 (UTC)
Received: from booty (unknown [77.244.183.192])
 (Authenticated sender: luca.ceresoli@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 8181620009;
 Mon, 27 Mar 2023 13:58:01 +0000 (UTC)
Date: Mon, 27 Mar 2023 15:57:59 +0200
To: <yann.morin@orange.com>
Message-ID: <20230327155759.7fa50bd2@booty>
In-Reply-To: <6581_1679653624_641D7AF8_6581_190_1_20230324102702.GA27815@tl-lnx-nyma7486>
References: <20230324093307.1255640-1-luca.ceresoli@bootlin.com>
 <6581_1679653624_641D7AF8_6581_190_1_20230324102702.GA27815@tl-lnx-nyma7486>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1679925482;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qJU9sivo9m69YQarviN8uE2b8JJNUeGOThu4Asyt9nk=;
 b=AIQ7gpwlKVEdkf9ee4bo4EfQKU3J/0Q8Ntw3ZrvAckcYxcfLcbUEH6VFd6CL40kwIiZhca
 UCtyFwgw92bLrR89/+YTkCzlgfr5gdRUzgnyu/uWzRG8+UO6bo0kNm6N0JrR+WXRqAWAm5
 vIlymUM8IugCeNnmeeesj0dYm3ridTakOS8Mj8aX7liVI/hLanVKxgNhRJGE9M3iv3D6oM
 cyBZhoH6O8K+L4Z5H9sXGjLQmkYciNsIJyDfCp5knIeAKef1a1nO9+ItaVfAumA2eTPzwN
 zxZauvvqmv7nioV4svyUbMiwvzuIZZAp9eRjASDM2AOSBATT0Xkeqf4i6zRJTw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=AIQ7gpwl
Subject: Re: [Buildroot] [PATCH] package/linux-tools: add USB tools (testusb
 and ffs-test)
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
From: Luca Ceresoli via buildroot <buildroot@buildroot.org>
Reply-To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: =?UTF-8?Q?Herv=C3=A9?= Codina <herve.codina@bootlin.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgWWFubiwgSGVydsOpLCBUaG9tYXMsCgpPbiBGcmksIDI0IE1hciAyMDIzIDExOjI3OjAyICsw
MTAwCjx5YW5uLm1vcmluQG9yYW5nZS5jb20+IHdyb3RlOgoKPiBMdWNhLCBBbGwsCj4gCj4gT24g
MjAyMy0wMy0yNCAxMDozMyArMDEwMCwgTHVjYSBDZXJlc29saSB2aWEgYnVpbGRyb290IHNwYWtl
IHRodXNseToKPiA+IEV4dGVuZCB0aGUgbGludXgtdG9vbHMgcGFja2FnZSB0byBhbHNvIGJ1aWxk
IHRoZSB1c2Vyc3BhY2UgVVNCIHRvb2xzLCB3aGljaAo+ID4gY3VycmVudGx5IGluY2x1ZGUgdGVz
dHVzYiBhbmQgZmZzLXRlc3QuCj4gPiAKPiA+IFRoZXNlIHRvb2xzIGFyZSBpbiB0aGUga2VybmVs
IHRyZWUgc2luY2UgYSBsb25nIHRpbWUsIGJ1dCBhIE1ha2VmaWxlIHdhcwo+ID4gYWRkZWQgb25s
eSBpbiA1LjkgdG8gYWxsb3cgYnVpbGRpbmcgaW4gdGhlIHNhbWUgd2F5IGFzIG90aGVyIHRvb2xz
IHByb3ZpZGVkCj4gPiB3aXRoIHRoZSBrZXJuZWwuIEhlcmUgd2UgdXNlIHRoZSBNYWtlZmlsZSBh
bmQgdGh1cyB2ZXJzaW9uID49IDUuOSBpcwo+ID4gcmVxdWlyZWQuIFN1cHBvcnQgZm9yIG9sZGVy
IGtlcm5lbHMgbWF5IGJlIGFkZGVkIGxhdGVyIGlmIG5lZWRlZC4KPiA+IAo+ID4gU2lnbmVkLW9m
Zi1ieTogTHVjYSBDZXJlc29saSA8bHVjYS5jZXJlc29saUBib290bGluLmNvbT4KPiA+IC0tLSAg
Cj4gWy0tU05JUC0tXQo+ID4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvbGludXgtdG9vbHMvbGludXgt
dG9vbC11c2J0b29scy5tay5pbiBiL3BhY2thZ2UvbGludXgtdG9vbHMvbGludXgtdG9vbC11c2J0
b29scy5tay5pbgo+ID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiA+IGluZGV4IDAwMDAwMDAwMDAw
MC4uMjhiM2FmZjI1Y2MyCj4gPiAtLS0gL2Rldi9udWxsCj4gPiArKysgYi9wYWNrYWdlL2xpbnV4
LXRvb2xzL2xpbnV4LXRvb2wtdXNidG9vbHMubWsuaW4KPiA+IEBAIC0wLDAgKzEsNDIgQEAKPiA+
ICsjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwo+ID4gKyMKPiA+ICsjIHVzYnRvb2xzCj4gPiArIwo+
ID4gKyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCj4gPiArCj4gPiArTElOVVhfVE9PTFMgKz0gdXNi
dG9vbHMKPiA+ICsKPiA+ICtVU0JUT09MU19NQUtFX09QVFMgPSAkKExJTlVYX01BS0VfRkxBR1Mp
IExERkxBR1M9IiQoVEFSR0VUX0xERkxBR1MpIgo+ID4gKwo+ID4gK2RlZmluZSBVU0JUT09MU19C
VUlMRF9DTURTCj4gPiArCSQoUSlpZiAhIGdyZXAgaW5zdGFsbCAkKExJTlVYX0RJUikvdG9vbHMv
dXNiL01ha2VmaWxlID4vZGV2L251bGwgMj4mMSA7IHRoZW4gXAo+ID4gKwkJZWNobyAiWW91ciBr
ZXJuZWwgdmVyc2lvbiBpcyB0b28gb2xkIHRvIGJ1aWxkIHRoZSBVU0IgdG9vbHMuIiA7IFwKPiA+
ICsJCWVjaG8gIkF0IGxlYXN0IGtlcm5lbCA1LjkgbXVzdCBiZSB1c2VkLiIgOyBcCj4gPiArCQll
eGl0IDEgOyBcCj4gPiArCWZpCj4gPiArCj4gPiArCSQoVEFSR0VUX01BS0VfRU5WKSAkKE1BS0Up
IC1DICQoTElOVVhfRElSKS90b29scy91c2IgXAo+ID4gKwkJJChVU0JUT09MU19NQUtFX09QVFMp
IFwKPiA+ICsJCWFsbAo+ID4gK2VuZGVmCj4gPiArCj4gPiAraWZlcSAoJChCUjJfUEFDS0FHRV9M
SU5VWF9UT09MU19VU0JUT09MU19URVNUVVNCKSwpCj4gPiArZGVmaW5lIFVTQlRPT0xTX0lOU1RB
TExfUkVNT1ZFX1RFU1RVU0IKPiA+ICsJJChSTSkgLXJmICQoVEFSR0VUX0RJUikvdXNyL2Jpbi90
ZXN0dXNiCj4gPiArZW5kZWYKPiA+ICtlbmRpZgo+ID4gKwo+ID4gK2lmZXEgKCQoQlIyX1BBQ0tB
R0VfTElOVVhfVE9PTFNfVVNCVE9PTFNfRkZTVEVTVCksKQo+ID4gK2RlZmluZSBVU0JUT09MU19J
TlNUQUxMX1JFTU9WRV9GRlNURVNUCj4gPiArCSQoUk0pIC1yZiAkKFRBUkdFVF9ESVIpL3Vzci9i
aW4vZmZzLXRlc3QKPiA+ICtlbmRlZgo+ID4gK2VuZGlmCj4gPiArCj4gPiArZGVmaW5lIFVTQlRP
T0xTX0lOU1RBTExfVEFSR0VUX0NNRFMKPiA+ICsJJChUQVJHRVRfTUFLRV9FTlYpICQoTUFLRSkg
LUMgJChMSU5VWF9ESVIpL3Rvb2xzL3VzYiBcCj4gPiArCQkkKFVTQlRPT0xTX01BS0VfT1BUUykg
XAo+ID4gKwkJREVTVERJUj0kKFRBUkdFVF9ESVIpIFwKPiA+ICsJCWluc3RhbGwKPiA+ICsJJChV
U0JUT09MU19JTlNUQUxMX1JFTU9WRV9URVNUVVNCKQo+ID4gKwkkKFVTQlRPT0xTX0lOU1RBTExf
UkVNT1ZFX0ZGU1RFU1QpCj4gPiArZW5kZWYgIAo+IAo+IFJhdGhlciB0aGFuIGluc3RhbGxpbmcg
ZXZlcnl0aGluZyAodHdvIGZpbGVzKSBhbmQgcmVtb3ZpbmcgdGhlIG9uZSB0aGF0Cj4gaXMgbm90
IG5lZWRlZCwgaD13aHkgbm90IGp1c3QgaW5zdGFsbCB0aGUgb25lKHMpIHRoYXQgaXMoYXJlKSBu
ZWVkZWQ/Cj4gCj4gICAgIExJTlVYX1RPT0xTX1VTQlRPT0xTX0xJU1QgPSBcCj4gICAgICAgICAk
KGlmICQoQlIyX1BBQ0tBR0VfTElOVVhfVE9PTFNfVVNCVE9PTFNfVEVTVFVTQiksJChMSU5VWF9E
SVIpL3Rvb2xzL3VzYi90ZXN0dXNiKSBcCj4gICAgICAgICAkKGlmICQoQlIyX1BBQ0tBR0VfTElO
VVhfVE9PTFNfVVNCVE9PTFNfRkZTVEVTVCksJChMSU5VWF9ESVIpL3Rvb2xzL3VzYi9mZnMtdGVz
dCkKPiAKPiAgICAgZGVmaW5lIFVTQlRPT0xTX0lOU1RBTExfVEFSR0VUX0NNRFMKPiAgICAgICAg
ICQoZm9yZWFjaCBmLCQoTElOVVhfVE9PTFNfVVNCVE9PTFNfTElTVCksJChJTlNUQUxMKSAtRCAt
bSAwNzU1ICQodCkgJChUQVJHRVRfRElSKS91c3IvYmluLyQobm90ZGlyICQodCkpKQo+ICAgICBl
bmRlZgoKVGhhbmtzIGZvciB5b3VyIHJldmlldyEgSSBnZW5lcmFsbHkgcHJlZmVyIHVzaW5nIHRo
ZSB1cHN0cmVhbQppbnN0YWxsYXRpb24gcHJvY2VkdXJlIHdoZW4gb25lIGV4aXN0cywgaW5zdGVh
ZCBvZiAocmUpd3JpdGluZyBpdC4gQnV0CkkgbXVzdCBhZ3JlZSB0aGUgcmVtb3ZhbCBsb2dpYyBp
cyB1Z2x5LgoKUHJvbXB0ZWQgYnkgeW91ciBjb21tZW50cywgSSBub3RpY2VkIHRoZSB1cHN0cmVh
bSBNYWtlZmlsZSBidWlsZHMgYW5kCmluc3RhbGxzIHRoZSB0b29scyBsaXN0ZWQgaW4gdGhlIEFM
TF9UQVJHRVRTIHZhcmlhYmxlLCBzbyBpbiB2MiBJJ20KanVzdCBzZXR0aW5nIGl0LCBhbmQgdGhl
IHVwc3RyZWFtIGxvZ2ljIHdvcmtzIGp1c3QgZmluZSB3aXRoIGl0LgoKQXMgYSBzaWRlIGVmZmVj
dCwgJ1JNJyBpcyBub3QgdXNlZCBhbnltb3JlLCBnZXR0aW5nIHJpZCBvZiBhbGwgdGhvc2UKdW5u
ZWVkZWQgZmxhZ3MgcmVwb3J0ZWQgYnkgSGVydsOpIGFuZCBUaG9tYXMhIDotKQoKdjIgaW5jb21p
bmcuCgpMdWNhCi0tIApMdWNhIENlcmVzb2xpLCBCb290bGluCkVtYmVkZGVkIExpbnV4IGFuZCBL
ZXJuZWwgZW5naW5lZXJpbmcKaHR0cHM6Ly9ib290bGluLmNvbQpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxk
cm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2J1aWxkcm9vdAo=

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F374C2A069
	for <buildroot@archiver.kernel.org>; Sun,  4 Jan 2026 18:46:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F1C6E80AA7;
	Sun,  4 Jan 2026 18:46:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IbBzSmHNwKiU; Sun,  4 Jan 2026 18:46:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F18C880AAB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767552417;
	bh=3bLA1/twbfKJ14+txiBKRYFKoZy4WvJE38ktDAvNXEs=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=TfJYO4ScMCI74JbxUgTXkviTvxiIa1e7VfpFQgLfSBwKy//nBQIuZGuyLFH7nmLAa
	 61I0XgMp0nhc0HlLEpwjr5SzzYEdot6vHDnGFbggUbIG0f0dbt6QQr6ESemPVj4ktw
	 kAvXq2vfG/lGiI3mX4uxlWNqLIzcazrxmCKV6LTXAaYpJjG1Kg2z6/bfhilTY01gHD
	 wqhzwPoncjHjvF8JG+jczEYv81G3q8ujQMNhZuRPD24crQytB6e+HYYD6wFopJmWoC
	 S4/uvx/y/utIdIo4/+fqOt4RYuUAEKClt1Zre736lNScd7iS2CqkXz3PYnlHkMdjs1
	 S43OT4HelQGXQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id F18C880AAB;
	Sun,  4 Jan 2026 18:46:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1FAE5249
 for <buildroot@buildroot.org>; Sun,  4 Jan 2026 18:46:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 059404008D
 for <buildroot@buildroot.org>; Sun,  4 Jan 2026 18:46:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OElNPRcmDn5j for <buildroot@buildroot.org>;
 Sun,  4 Jan 2026 18:46:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 044004005C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 044004005C
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 044004005C
 for <buildroot@buildroot.org>; Sun,  4 Jan 2026 18:46:52 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 7DC202003B4;
 Sun,  4 Jan 2026 19:46:47 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 04 Jan 2026 19:46:47 +0100
MIME-Version: 1.0
Date: Sun, 04 Jan 2026 19:46:47 +0100
To: Fiona Klute <fiona.klute@gmx.de>
Cc: buildroot@buildroot.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <951a546a-a56c-4aa9-b515-b72f73bd249b@gmx.de>
References: <20260103114046.2461857-1-fiona.klute@gmx.de>
 <3fe4137c982f5acd08e775ca43dab9f2@free.fr>
 <12ad4f39-5622-430c-9b02-fcd5893f6730@gmx.de>
 <951a546a-a56c-4aa9-b515-b72f73bd249b@gmx.de>
User-Agent: Webmail Free/1.6.12
Message-ID: <9547c61ca16e7605d291fb41116a0769@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1767552409;
 bh=mr1gAzu4xx86fdZfvSAyxlT2CHFh6uK8/H0lizWIIdg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=YbJCm3MQki91kIFIZILbDG7srfbNkvKm3sctUWQiSrD/d41HNyqvj+1SeGKcW6p1z
 3pSxVjnx76YcVTTBD0bcqiBDeRsYFIJXydEDfV72XqKMqcnzbqj6bz23m2DL5yFTu9
 501SjRIU+6NWy+357XeV+BrCP37gJ6GDDfW4Ix/Jri9FWwyzUa2SliH6i63SivvK24
 USKNJnvjf8r+OOcyDijws/pw20Ot35t7ECQlK4dgIHXVHhMYGBRKNTqu+tMLiHn+te
 YG5+G+sqjod0zmoGpLtmla8IMwnOfU8i4qZL2IUPs1xQzceIur+bomw+OdZ0hnN3vL
 fqGx0UE8S6s7w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=YbJCm3MQ
Subject: Re: [Buildroot] [PATCH 1/1] package/squashfs: bump to version 4.7.4
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgRklvbmEsCgpPbiAwNC8wMS8yMDI2IDE2OjM0LCBGaW9uYSBLbHV0ZSB3cm90ZToKPiBBbSAw
NC4wMS4yNiB1bSAxNTo0MyBzY2hyaWViIEZpb25hIEtsdXRlIHZpYSBidWlsZHJvb3Q6Cj4+IEhp
IEp1bGllbiEKPj4gCj4+IEFtIDA0LjAxLjI2IHVtIDEzOjUyIHNjaHJpZWIgSnVsaWVuIE9saXZh
aW46Cj4+PiBIaSBGaW9uYSwKPj4+IAo+Pj4gVGhhbmtzIGZvciB0aGUgcGF0Y2guCj4+PiAKPj4+
IE9uIDAzLzAxLzIwMjYgMTI6NDAsIEZpb25hIEtsdXRlIHZpYSBidWlsZHJvb3Qgd3JvdGU6Cj4+
Pj4gVXBzdHJlYW0gY2hhbmdlbG9nOgo+Pj4+IGh0dHBzOi8vZ2l0aHViLmNvbS9wbG91Z2hlci9z
cXVhc2hmcy10b29scy9ibG9iLzQuNy40L0NIQU5HRVMubWQKPj4+PiAKPj4+PiBTaWduZWQtb2Zm
LWJ5OiBGaW9uYSBLbHV0ZSA8ZmlvbmEua2x1dGVAZ214LmRlPgo+Pj4+IC0tLQo+Pj4gWy4uLl0K
Pj4+PiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9zcXVhc2hmcy9zcXVhc2hmcy5tayAKPj4+PiBiL3Bh
Y2thZ2Uvc3F1YXNoZnMvc3F1YXNoZnMubWsKPj4+PiBpbmRleCBmMmNiMGFiMjVlLi4wNGIzMjhj
Y2FiIDEwMDY0NAo+Pj4+IC0tLSBhL3BhY2thZ2Uvc3F1YXNoZnMvc3F1YXNoZnMubWsKPj4+PiAr
KysgYi9wYWNrYWdlL3NxdWFzaGZzL3NxdWFzaGZzLm1rCj4+Pj4gQEAgLTQsNyArNCw3IEBACj4+
Pj4gwqAjCj4+Pj4gCj4+Pj4gIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKPj4+PiAKPj4+PiAtU1FV
QVNIRlNfVkVSU0lPTiA9IDQuNi4xCj4+Pj4gK1NRVUFTSEZTX1ZFUlNJT04gPSA0LjcuNAo+Pj4g
Cj4+PiBUaGlzIG5ldyB2ZXJzaW9uIGlzIGludHJvZHVjaW5nIG5ldyBidWlsZCBmYWlsdXJlcy4g
U2VlOgo+Pj4gaHR0cHM6Ly9naXRsYWIuY29tL2pvbGl2YWluL2J1aWxkcm9vdC8tL3BpcGVsaW5l
cy8yMjQzODQ3ODA4Cj4+PiAKPj4+IEZvciByZWZlcmVuY2UsIHRoZSBwcmV2aW91cyB2ZXJzaW9u
IHBhc3NlcyB0ZXN0LXBrZzoKPj4+IGh0dHBzOi8vZ2l0bGFiLmNvbS9qb2xpdmFpbi9idWlsZHJv
b3QvLS9waXBlbGluZXMvMjI0Mzg1MzMwMQo+Pj4gCj4+PiBUaGlzIGlzIGxpa2VseSBkdWUgdG8g
dGhlIG5ldyBTRUVLX0RBVEEgdXNhZ2UgaW4gbHNlZWsoKSwgd2hpY2gKPj4+IG1pZ2h0IG5vdCBi
ZSBhbHdheXMgcHJlc2VudCBvciBtaWdodCByZXF1aXJlIF9HTlVfU09VUkNFIHRvCj4+PiBiZSBk
ZWZpbmVkLiBTZWU6Cj4+PiBodHRwczovL21hbjcub3JnL2xpbnV4L21hbi1wYWdlcy9tYW4yL2xz
ZWVrLjIuaHRtbAo+Pj4gCj4+PiBDb3VsZCB5b3UgaGF2ZSBhIGxvb2ssIHBsZWFzZT8KPj4gTG9v
a3MgdG8gbWUgbGlrZSB0aGUgdG9vbGNoYWlucyBuZWVkIHRvIGJlIHVwZGF0ZWQuIFRoZSBqb2Ig
bG9nIAo+PiBjbGVhcmx5IHNob3dzIC1EX0dOVV9TT1VSQ0Ugb24gdGhlIGNvbW1hbmQgbGluZS4g
V2hhdCdzIG5vdGljZWFibGUgaXMgCj4+IHRoYXQgdGhlIGZhaWxpbmcgYnVpbGRzIGFsbCB1c2UK
Pj4gCj4+IEJSMl9UT09MQ0hBSU5fRVhURVJOQUxfVVJMPSJodHRwOi8vYXV0b2J1aWxkLmJ1aWxk
cm9vdC5vcmcvdG9vbGNoYWlucy8gCj4+IHRhcmJhbGxzLyRKT0JfTkFNRS0yMDIwLjExLjIudGFy
LmJ6MiIKPj4gCj4+IHdoaWxlIHRoZSBwYXNzaW5nIG9uZXMgKGRpZG4ndCBjaGVjayBhbGwgb2Yg
dGhlbSwgYnV0IGEgaGFuZGZ1bCkgdXNlIAo+PiBCb290bGluIHN0YWJsZSB0b29sY2hhaW5zLgo+
PiAKPj4gRS5nLiBpbiB0aGUgYnItYXJtLWZ1bGwtc3RhdGljIG9uZSBhcm0tYnVpbGRyb290LWxp
bnV4LXVjbGliY2dudWVhYmkvIAo+PiBzeXNyb290L3Vzci9pbmNsdWRlL3VuaXN0ZC5oIGRvZXMg
bm90IGRlZmluZSBTRUVLX0RBVEEgYXQgYWxsLCB3aXRoIG9yIAo+PiB3aXRob3V0IF9HTlVfU09V
UkNFLCB1bmxpa2Ugd2l0aCBhIGN1cnJlbnQgZ2xpYmMgdmVyc2lvbi4KPj4gCj4+IEludGVyZXN0
aW5nbHkgbXVzbCBkb2VzICpub3QqIHJlcXVpcmUgX0dOVV9TT1VSQ0UsIHVuaXN0ZC5oIGRlZmlu
ZXMgCj4+IGFsbCBTRUVLXyogbWFjcm9zIHVuY29uZGl0aW9uYWxseS4gSSBkaWQgbm90IGNoZWNr
IHNpbmNlIHdoZW4gdGhvdWdoLCAKPj4gSSB3b3VsZG4ndCBiZSBzdXJwcmlzZWQgaWYgYSAyMDIw
IHZlcnNpb24gd291bGQgZmFpbCwgdG9vLgo+IE9oLCBhbm90aGVyIHJlbGV2YW50IGRldGFpbDog
SW4gdUNsaWJjIFNFRUtfREFUQSBzdXBwb3J0IGlzIGEgZmFpcmx5IAo+IHJlY2VudCBhZGRpdGlv
biAoY29tbWl0IEp1bHkgMjAyNCwgZmlyc3QgdGFnIGluY2x1ZGluZyBpdCBpcyB2MS4wLjUwKS4g
Cj4gU28gdUNsaWJjIHRvb2xjaGFpbnMgZnJvbSAyMDIwIGRlZmluaXRlbHkgd29uJ3Qgd29yay4g
U2VlOiAKPiBodHRwczovL2NnaXQudWNsaWJjLW5nLm9yZy9jZ2kvY2dpdC91Y2xpYmMtbmcuZ2l0
L2NvbW1pdC9pbmNsdWRlL3VuaXN0ZC5oP2lkPTA1YjExODA5YmQxMTQ1MGFmZjNkMjBlNDNmMTg0
MTVjZTU4NjAxZTcKClRoYW5rcyBmb3IgdGhlIGV4dHJhIGluZm9ybWF0aW9uLiBTb3JyeSBJIG92
ZXJsb29rZWQgdGhhdApfR05VX1NPVVJDRSB3YXMgYWxyZWFkeSB0aGVyZS4KClRoaXMgU0VFS19E
QVRBIHVzYWdlIHdhcyBpbnRyb2R1Y2VkIGluIHVwc3RyZWFtIGNvbW1pdDoKaHR0cHM6Ly9naXRo
dWIuY29tL3Bsb3VnaGVyL3NxdWFzaGZzLXRvb2xzL2NvbW1pdC9mZmZiZDBiNzZkNTI5YTllMzhj
ZTYxNWY3M2RiY2FhZmFkNDBhZTU1CmZpcnN0IGluY2x1ZGVkIGluIHNxdWFzaGZzLXRvb2xzIHJl
bGVhc2UgNC43LjMgKDIwMjUtMTEtMDYpLgoKVGhpcyBkZWZpbml0aW9uIGhhcyBiZWVuIGluIGds
aWJjIGZvciBxdWl0ZSBzb21lIHRpbWU6Cmh0dHBzOi8vc291cmNld2FyZS5vcmcvZ2l0Lz9wPWds
aWJjLmdpdDthPWNvbW1pdGRpZmY7aD03OThiZTcyZDEyN2FkZjE4ZjM4MjMyM2QwZWVkMGExZTM5
NDk2N2Y4CmluY2x1ZGVkIGluIGdsaWJjLTIuMTUgKDIwMTEtMTItMjMpLgoKQXMgeW91IHBvaW50
ZWQgb3V0LCBtdXNsIGludHJvZHVjZWQgdGhpcyBtYWNybyBtdWNoIGxhdGVyLCBpbjoKaHR0cHM6
Ly9naXQubXVzbC1saWJjLm9yZy9jZ2l0L211c2wvY29tbWl0Lz9pZD1jYmFjZDYzOGUzMmEwMmVk
YmU2NmM0OGFlM2QxMzYxYmMwNmE0OTJhCmluIHYxLjIuMyAoMjAyMi0wNC0wNykuCgpJdCB3YXMg
aW50cm9kdWNlZCBpbiB1Y2xpYmMgaW4gY29tbWl0OgpodHRwczovL2NnaXQudWNsaWJjLW5nLm9y
Zy9jZ2kvY2dpdC91Y2xpYmMtbmcuZ2l0L2NvbW1pdC8/aWQ9MDViMTE4MDliZDExNDUwYWZmM2Qy
MGU0M2YxODQxNWNlNTg2MDFlNwppbiB2MS4wLjUwICgyMDI0LTA4LTEzKS4KCnNxdWFzaGZzLXRv
b2xzIGRvZXMgbm90IHRlc3QgdGhlIGF2YWlsYWJpbGl0eSBvZiB0aGlzIFNFRUtfREFUQQptYWNy
byBiZWZvcmUgdXNpbmcgaXQuCgpTaW5jZSB0aGUgdWNsaWJjIGFuZCBtdXNsIGludHJvZHVjZWQg
aXQgInJlY2VudGx5IiwgdXBkYXRpbmcKdG9vbGNoYWlucyBjYW4gYmUgZGlmZmljdWx0LiBXZSBj
b3VsZCBldmVudHVhbGx5IHJlc3RyaWN0CnNxdWFzaGZzLXRvb2xzIHRvIGdsaWJjIG9ubHkgZm9y
IGV4dGVybmFsIHRvb2xjaGFpbnMgKGJlY2F1c2UKd2Uga25vdyBpbnRlcm5hbCB0b29sY2hhaW5z
IHdpbGwgaGF2ZSBzdWZmaWNpZW50IHVjbGliYyBvciBtdXNsCnZlcnNpb25zKS4KCk1heWJlIHdl
IGNvdWxkIGFsc28gcHJvcG9zZSBhbiB1cHN0cmVhbSBwYXRjaCB0byBhbGxvdwpzcXVhZnMtdG9v
bHMgdG8gc3VwcG9ydCBvdGhlciBsaWJjcy4gU29tZQpwYWNrYWdlcyBhcmUgcHJvdmlkaW5nIHRo
b3NlIGRlZmluaXRpb25zLCBpZiBub3QgYXZhaWxhYmxlLgpGb3IgZXhhbXBsZToKaHR0cHM6Ly9n
aXRodWIuY29tL3V0aWwtbGludXgvdXRpbC1saW51eC9ibG9iL3YyLjQxLjMvaW5jbHVkZS9jLmgj
TDUyMgoKV2hhdCBkbyB5b3UgdGhpbms/Cgo+IEJlc3QgcmVnYXJkcywKPiBGaW9uYQoKQmVzdCBy
ZWdhcmRzLAoKSnVsaWVuLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0
dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=

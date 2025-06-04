Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6866EC5B543
	for <buildroot@archiver.kernel.org>; Wed,  4 Jun 2025 18:18:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1C84583B2F;
	Wed,  4 Jun 2025 18:18:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QqW0zlfZtuOm; Wed,  4 Jun 2025 18:18:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3762283B52
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3762283B52;
	Wed,  4 Jun 2025 18:18:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id E1C261A6
 for <buildroot@buildroot.org>; Wed,  4 Jun 2025 18:18:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D3FB583B52
 for <buildroot@buildroot.org>; Wed,  4 Jun 2025 18:18:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ACMu0PeCf52F for <buildroot@buildroot.org>;
 Wed,  4 Jun 2025 18:18:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 26A4783B2F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 26A4783B2F
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 26A4783B2F
 for <buildroot@buildroot.org>; Wed,  4 Jun 2025 18:18:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 08D831C010A; Wed,  4 Jun 2025 20:18:54 +0200 (CEST)
Message-ID: <62413b3e-e0e4-4b0b-8cdc-2f4d38c528f3@rnout.be>
Date: Wed, 4 Jun 2025 20:18:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Buildroot List <buildroot@buildroot.org>
Cc: =?UTF-8?B?UmFwaGHDq2wgTcOpbG90dGU=?= <raphael.melotte@mind.be>
References: <20250518085723.23020-1-thomas.petazzoni@bootlin.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250518085723.23020-1-thomas.petazzoni@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1749061134; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=4U11cKHNizlW30tdsMqD0D/r9lQyKMx97w6YMUdg0cc=;
 b=NvL5tFWHOk2NwxhLqQEn9grUAvVTRm7NPU8o9eh3qqyb18iLzAOnOqF6cGQzKKJVtxEhBu
 V/rBDM1FKXYOoZqHXrG5JI60fxUoDLKeC6dA6g+tlHQWjWsAmC1GXHdulXazZ2MGubAvPU
 +hF/uGN4hLOOAZrPBoTX7HYHBcKjBO/CkWaV7/TSqx1x2qkH3fINTxWzLFGlTF4nqES7Qj
 MO1jTjQxjbN5spIhXcro3l9JQyuh13FciYH5jQIl6U87xKWejdzo4Q6xS+8VKOQevbe9i8
 jI23ATulTXIchIZNUe6vcGjV7pOEKqUnI86bO0v2Eusyi4JC8jsMYvZRCmhQxA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=NvL5tFWH
Subject: Re: [Buildroot] [PATCH 00/22] CVE updates
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAxOC8wNS8yMDI1IDEwOjU2LCBUaG9tYXMgUGV0YXp6b25pIHZpYSBidWlsZHJvb3Qgd3Jv
dGU6Cj4gSGVsbG8sCj4gCj4gRm9sbG93aW5nIHRoZSBhZGRpdGlvbiBvZiBzdGFsZSBpZ25vcmUg
Q1ZFIGVudHJ5IGRldGVjdGlvbiBpbgo+IHBrZy1zdGF0cyAodGhhbmtzIHRvIGdyZWF0IHdvcmsg
ZnJvbSBSYXBoYcOrbCBNw6lsb3R0ZSksIEkgbG9va2VkIGF0IHRoZQo+IHN0YWxlIGVudHJpZXMg
YW5kIGhhbmRsZWQgYWxsIG9mIHRoZW0gaW4gdGhpcyBwYXRjaCBzZXJpZXMuCj4gCj4gV2hpbGUg
YXQgaXQsIEkgcmVwb3J0ZWQgc29tZSBpc3N1ZXMgdG8gdGhlIE5WRCBtYWludGFpbmVycyAoZS1t
YWlscwo+IHdlcmUgQ2MnZWQgdG8gdGhlIG1haWxpbmcgbGlzdCkuIEkgYWxzbyBmb3VuZCBhIG51
bWJlciBvZiBDVkVzIG9uIHNveAo+IHRoYXQgd2VyZSBub3QgZml4ZWQsIHNvIEkgZml4ZWQgdGhl
bSAoZXhjZXB0IENWRS0yMDIxLTMzODQ0LCBmb3Igd2hpY2gKPiB0aGUgZml4IGRvZXNuJ3QgYXBw
bHkgdG8gb3VyIHZlcnNpb24gYW5kIGl0IGlzbid0IGNsZWFyIGlmIG91ciB2ZXJzaW9uCj4gaXMg
cmVhbGx5IHZ1bG5lcmFibGUpLgo+IAo+IFBsZWFzZSBoYXZlIGEgbG9vayBhbmQgbGV0IG1lIGtu
b3cgd2hhdCB5b3UgdGhpbmsuIFBhdGNoZXMgYXJlCj4gaW5kZXBlbmRlbnQgZnJvbSBlYWNoIG90
aGVyLCBleGNlcHQgb2YgY291cnNlIHRoZSBsYXJnZSBzdGFjayBvZgo+IHBhdGNoZXMgb24gdGhl
IHNveCBwYWNrYWdlLgo+IAo+IFRob21hcwo+IAo+IFRob21hcyBQZXRhenpvbmkgKDIyKToKPiAg
ICBib290L2dydWIyOiBkcm9wIHN0YWxlIElHTk9SRV9DVkVTIGVudHJpZXMKPiAgICBwYWNrYWdl
L2J1c3lib3g6IGRyb3Agc3RhbGUgSUdOT1JFX0NWRVMgZW50cmllcwo+ICAgIHBhY2thZ2UvZG5z
bWFzcTogZHJvcCBzdGFsZSBJR05PUkVfQ1ZFUyBlbnRyaWVzCj4gICAgcGFja2FnZS9kb3ZlY290
OiBkb2N1bWVudCB3aHkgdGhlIGlnbm9yZSBDVkUgZW50cnkgaXMgbm90IHN0YWxlCj4gICAgcGFj
a2FnZS9leGltOiBkcm9wIHN0YWxlIGlnbm9yZSBDVkUgZW50cnkKPiAgICBwYWNrYWdlL2V4aW06
IHVwZGF0ZSBjb21tZW50IG9uIENWRS0yMDIyLTM1NTkKPiAgICBwYWNrYWdlL2xpYm9wZW5oMjY0
OiBkcm9wIHN0YWxlIGlnbm9yZSBDVkUgZW50cnkKPiAgICBwYWNrYWdlL2xpYnNzaDogZHJvcCBz
dGFsZSBpZ25vcmUgQ1ZFIGVudHJ5Cj4gICAgcGFja2FnZS9uZXRzbm1wOiBkcm9wIHN0YWxlIGln
bm9yZSBDVkUgZW50cmllcwo+ICAgIHBhY2thZ2UvcXQ1L3F0NWJhc2U6IGRyb3Agc3RhbGUgaWdu
b3JlIENWRSBlbnRyaWVzLCBhZGQgQ1BFIHZlcnNpb24KPiAgICBwYWNrYWdlL3JpcGdyZXA6IGRy
b3Agc3RhbGUgaWdub3JlIENWRSBlbnRyeQo+ICAgIHBhY2thZ2Uvc294OiBhZGQgU09YX0NQRV9J
RF9WRVJTSU9OCj4gICAgcGFja2FnZS9zb3g6IGFubm90YXRlIGlnbm9yZSBDVkUgZW50cmllcwo+
ICAgIHBhY2thZ2Uvc294OiBhZGQgaWdub3JlIENWRSBlbnRyeSBmb3IgQ1ZFLTIwMTktMTAxMDAw
NAo+ICAgIHBhY2thZ2Uvc294OiByZXdvcmsgdGhlIDAwMDEgcGF0Y2ggdG8gbWFrZSBpdCBHaXQt
YXBwbGljYWJsZQo+ICAgIHBhY2thZ2Uvc294OiBhZGQgZml4IGZvciBDVkUtMjAyMS0zNjQzIENW
RS0yMDIxLTIzMjEwCj4gICAgcGFja2FnZS9zb3g6IGFkZCBmaXggZm9yIENWRS0yMDIxLTIzMTU5
LCBDVkUtMjAyMS0yMzE3MiwKPiAgICAgIENWRS0yMDIzLTM0MzE4Cj4gICAgcGFja2FnZS9zb3g6
IGFkZCBmaXggZm9yIENWRS0yMDIxLTQwNDI2Cj4gICAgcGFja2FnZS9zb3g6IGFkZCBmaXggZm9y
IENWRS0yMDIyLTMxNjUwLCBDVkUtMjAyMy0yNjU5MAo+ICAgIHBhY2thZ2Uvc294OiBhZGQgZml4
IGZvciBDVkUtMjAyMi0zMTY1MQo+ICAgIHBhY2thZ2Uvc294OiBhZGQgZml4IGZvciBDVkUtMjAy
My0zMjYyNwo+ICAgIHBhY2thZ2UvdGlueXhtbDogc2V0IFRJTllYTUxfQ1BFX0lEX1ZFUlNJT04K
CiAgQXBwbGllZCBzZXJpZXMgdG8gMjAyNS4wMi54LCB0aGFua3MuCgogIFJlZ2FyZHMsCiAgQXJu
b3V0Cgo+IAo+ICAgYm9vdC9ncnViMi9ncnViMi5tayAgICAgICAgICAgICAgICAgICAgICAgICAg
IHwgIDggLS0KPiAgIHBhY2thZ2UvYnVzeWJveC9idXN5Ym94Lm1rICAgICAgICAgICAgICAgICAg
ICB8IDEwIC0tLQo+ICAgcGFja2FnZS9kbnNtYXNxL2Ruc21hc3EubWsgICAgICAgICAgICAgICAg
ICAgIHwgIDMgLQo+ICAgcGFja2FnZS9kb3ZlY290L2RvdmVjb3QubWsgICAgICAgICAgICAgICAg
ICAgIHwgIDQgKwo+ICAgcGFja2FnZS9leGltL2V4aW0ubWsgICAgICAgICAgICAgICAgICAgICAg
ICAgIHwgIDYgKy0KPiAgIHBhY2thZ2UvbGlib3BlbmgyNjQvbGlib3BlbmgyNjQubWsgICAgICAg
ICAgICB8ICAzIC0KPiAgIHBhY2thZ2UvbGlic3NoL2xpYnNzaC5tayAgICAgICAgICAgICAgICAg
ICAgICB8ICA0IC0KPiAgIHBhY2thZ2UvbmV0c25tcC9uZXRzbm1wLm1rICAgICAgICAgICAgICAg
ICAgICB8ICA0IC0KPiAgIHBhY2thZ2UvcXQ1L3F0NWJhc2UvcXQ1YmFzZS5tayAgICAgICAgICAg
ICAgICB8IDExICstLQo+ICAgcGFja2FnZS9yaXBncmVwL3JpcGdyZXAubWsgICAgICAgICAgICAg
ICAgICAgIHwgIDMgLQo+ICAgLi4uLVNvWC1zdXBwb3J0LXVjbGliYy1iYXNlZC10b29sY2hhaW5z
LnBhdGNoIHwgIDkgKy0tCj4gICAuLi5ob3VsZC1uZXZlci1iZS0wLXRvLWF2b2lkLWRpdmlzaW9u
LWIucGF0Y2ggfCAzNCArKysrKysrKysKPiAgIHBhY2thZ2Uvc294LzAwMDctaGNvbS12YWxpZGF0
ZS1kaWN0c2l6ZS5wYXRjaCB8IDM4ICsrKysrKysrKysKPiAgIC4uLi8wMDA4LXBoZXJlLWF2b2lk
LWludGVnZXItdW5kZXJmbG93LnBhdGNoICB8IDQyICsrKysrKysrKysrCj4gICAuLi5lY3QtaW1w
bGF1c2libHktbGFyZ2UtbnVtYmVyLW9mLWNoYW4ucGF0Y2ggfCA2MyArKysrKysrKysrKysrKysr
Cj4gICAuLi4wMDEwLWZvcm1hdHMtcmVqZWN0LWltcGxhdXNpYmxlLXJhdGUucGF0Y2ggfCAzOSAr
KysrKysrKysrCj4gICAuLi5pbHRlci1udWxsLXNhbXBsaW5nLXJhdGUtaW4tVk9DLWNvZGUucGF0
Y2ggfCAzNyArKysrKysrKysKPiAgIHBhY2thZ2Uvc294L3NveC5tayAgICAgICAgICAgICAgICAg
ICAgICAgICAgICB8IDc1ICsrKysrKysrKysrKysrKysrKy0KPiAgIHBhY2thZ2UvdGlueXhtbC90
aW55eG1sLm1rICAgICAgICAgICAgICAgICAgICB8ICAyICstCj4gICAxOSBmaWxlcyBjaGFuZ2Vk
LCAzMzcgaW5zZXJ0aW9ucygrKSwgNTggZGVsZXRpb25zKC0pCj4gICBjcmVhdGUgbW9kZSAxMDA2
NDQgcGFja2FnZS9zb3gvMDAwNi12b2Mtd29yZC13aWR0aC1zaG91bGQtbmV2ZXItYmUtMC10by1h
dm9pZC1kaXZpc2lvbi1iLnBhdGNoCj4gICBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9zb3gv
MDAwNy1oY29tLXZhbGlkYXRlLWRpY3RzaXplLnBhdGNoCj4gICBjcmVhdGUgbW9kZSAxMDA2NDQg
cGFja2FnZS9zb3gvMDAwOC1waGVyZS1hdm9pZC1pbnRlZ2VyLXVuZGVyZmxvdy5wYXRjaAo+ICAg
Y3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2Uvc294LzAwMDktZm9ybWF0cy1haWZmLXJlamVjdC1p
bXBsYXVzaWJseS1sYXJnZS1udW1iZXItb2YtY2hhbi5wYXRjaAo+ICAgY3JlYXRlIG1vZGUgMTAw
NjQ0IHBhY2thZ2Uvc294LzAwMTAtZm9ybWF0cy1yZWplY3QtaW1wbGF1c2libGUtcmF0ZS5wYXRj
aAo+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2Uvc294LzAwMTEtQ1ZFLTIwMjMtMzI2Mjct
RmlsdGVyLW51bGwtc2FtcGxpbmctcmF0ZS1pbi1WT0MtY29kZS5wYXRjaAo+IAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcg
bGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcv
bWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK

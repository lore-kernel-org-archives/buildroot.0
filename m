Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1FCEC43334
	for <buildroot@archiver.kernel.org>; Sat, 23 Jul 2022 12:41:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7516D40AEA;
	Sat, 23 Jul 2022 12:41:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7516D40AEA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cIvlMO4JWIsW; Sat, 23 Jul 2022 12:41:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6EA5C408C8;
	Sat, 23 Jul 2022 12:41:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6EA5C408C8
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D6D291BF36E
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 12:41:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B159384989
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 12:41:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B159384989
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rSVEd7mejInr for <buildroot@lists.busybox.net>;
 Sat, 23 Jul 2022 12:41:32 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 87E9483E17
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 87E9483E17
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 12:41:32 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 7532F1BF203;
 Sat, 23 Jul 2022 12:41:30 +0000 (UTC)
Date: Sat, 23 Jul 2022 14:41:29 +0200
To: Romain Naour <romain.naour@gmail.com>
Message-ID: <20220723144129.7840044f@windsurf>
In-Reply-To: <20220529131811.481017-3-romain.naour@gmail.com>
References: <20220529131811.481017-1-romain.naour@gmail.com>
 <20220529131811.481017-3-romain.naour@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1658580090;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tj25SJKVMTOY6zRAYA2gviOO+x5Th+xKl8+vbW0nRZs=;
 b=WML8I+P4NmnRW4iJMEnIifBJn2XYv0e00oQc/zYBWAtum5nhM/gjDFmHY2HTi9XARKCaE9
 krk1OJ9BqHvSH3KFSeRFhlSiHFhrHoc4EcJOAQDcIpM1xBmBfAmBdJ/Sf2v0LtX05JS5jR
 nmZuCXUbKnvQkM7MEuRgtRs3ZHHeOYWhp2kR15or9/CosX61xyzUODw+lmfxbHNyPUphOy
 79BKpJozAiC5ONSnkV5w5O36A74/tNHPyLdjXZO8hkhVhpf+V9ESIEpKHt3R8v/W9f5VZb
 mwJgbl+RkY1SbPy0UgldHGFyBltgBAjMxY7wWGRkitM55ymAJR0onxTYM+RG0A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=WML8I+P4
Subject: Re: [Buildroot] [PATCH for-next 03/11] package/gcc: disable
 libsanitizer for mips64{el} w/ n32 ABI
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gU3VuLCAyOSBNYXkgMjAyMiAxNToxODowMyArMDIwMApSb21haW4gTmFvdXIgPHJvbWFpbi5u
YW91ckBnbWFpbC5jb20+IHdyb3RlOgoKPiBsaWJzYW5pdGl6ZXIgaGFzIGJlZW4gZW5hYmxlZCBm
b3IgbWlwczY0e2VsfSBpbiBnY2MgMTIgWzFdIGJ1dCBpdAo+IGZhaWwgdG8gYnVpbGQgd2hlbiBu
MzIgQUJJIGlzIHVzZWQ6Cj4gCj4gSW4gZmlsZSBpbmNsdWRlZCBmcm9tIG91dHB1dC9taXBzNjRl
bC1idWlsZHJvb3QtbGludXgtZ251L3N5c3Jvb3QvdXNyL2luY2x1ZGUvYml0cy9zdGF0Lmg6MjUs
Cj4gICAgICAgICAgICAgICAgICBmcm9tIG91dHB1dC9taXBzNjRlbC1idWlsZHJvb3QtbGludXgt
Z251L3N5c3Jvb3QvdXNyL2luY2x1ZGUvZmNudGwuaDo3OCwKPiAgICAgICAgICAgICAgICAgIGZy
b20gLi4vLi4vLi4vLi4vbGlic2FuaXRpemVyL3Nhbml0aXplcl9jb21tb24vc2FuaXRpemVyX2xp
bnV4LmNwcDo1NToKPiBvdXRwdXQvbWlwczY0ZWwtYnVpbGRyb290LWxpbnV4LWdudS9zeXNyb290
L3Vzci9pbmNsdWRlL2JpdHMvc3RydWN0X3N0YXQuaDoxOTA6ODogZXJyb3I6IHJlZGVmaW5pdGlv
biBvZiDigJhzdHJ1Y3Qgc3RhdDY04oCZCj4gICAxOTAgfCBzdHJ1Y3Qgc3RhdDY0Cj4gICAgICAg
fCAgICAgICAgXn5+fn5+Cj4gCj4gSW4gZmlsZSBpbmNsdWRlZCBmcm9tIC4uLy4uLy4uLy4uL2xp
YnNhbml0aXplci9zYW5pdGl6ZXJfY29tbW9uL3Nhbml0aXplcl9saW51eC5jcHA6NDk6Cj4gb3V0
cHV0L21pcHM2NGVsLWJ1aWxkcm9vdC1saW51eC1nbnUvc3lzcm9vdC91c3IvaW5jbHVkZS9hc20v
c3RhdC5oOjUyOjg6IG5vdGU6IHByZXZpb3VzIGRlZmluaXRpb24gb2Yg4oCYc3RydWN0IHN0YXQ2
NOKAmQo+ICAgIDUyIHwgc3RydWN0IHN0YXQ2NCB7Cj4gICAgICAgfCAgICAgICAgXn5+fn5+Cj4g
Cj4gRGlzYWJsZSBsaWJzYW5pdGl6ZXIgZm9yIG1pcHM2NCB3aXRoIG4zMiBBQkkuCj4gCj4gTm90
ZTogT25seSBnbGliYyB0b29sY2hhaW5zIGFyZSBhZmZlY3RlZCBzaW5jZSBsaWJzYW5pdGl6ZXIg
aXMKPiBkaXNhYmxlZCBmb3IgbXVzbCBhbmQgdUNsaWJjLW5nIHRvb2xjaGFpbnMgWzJdLgo+IAo+
IEZpeGVzOgo+IGh0dHBzOi8vZ2l0bGFiLmNvbS9rdWJ1OTMvdG9vbGNoYWlucy1idWlsZGVyLy0v
am9icy8yNTEwMTc4NjUxCj4gCj4gWzFdIGh0dHBzOi8vZ2NjLmdudS5vcmcvZ2l0Lz9wPWdjYy5n
aXQ7YT1jb21taXRkaWZmO2g9MzQ0ZTZmOWYyYWJjZmY5YjJiYjRiMjZiNjkzYmU0YTU5OTI3MmY0
Mwo+IFsyXSBodHRwczovL2dpdC5idWlsZHJvb3QubmV0L2J1aWxkcm9vdC9jb21taXQvP2lkPTVm
NGQ2NThkODg4YjUzOWRlOWE2MjQ3YWU1YjFhMDk5OWRlNWQ0ZWMKCkhhcyB0aGlzIGlzc3VlIGJl
ZW4gcmVwb3J0ZWQgdG8gdXBzdHJlYW0gZ2NjPwoKPiAgcGFja2FnZS9nY2MvZ2NjLm1rIHwgNyAr
KysrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0
IGEvcGFja2FnZS9nY2MvZ2NjLm1rIGIvcGFja2FnZS9nY2MvZ2NjLm1rCj4gaW5kZXggYjk0MDMy
N2M4My4uZTFmMzkzNWU1NiAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL2djYy9nY2MubWsKPiArKysg
Yi9wYWNrYWdlL2djYy9nY2MubWsKPiBAQCAtMTM4LDYgKzEzOCwxMyBAQCBpZmVxICgkKEJSMl9z
cGFyYykkKEJSMl9zcGFyYzY0KSx5KQo+ICBIT1NUX0dDQ19DT01NT05fQ09ORl9PUFRTICs9IC0t
ZGlzYWJsZS1saWJzYW5pdGl6ZXIKPiAgZW5kaWYKPiAgCj4gKyMgbGlic2FuaXRpemVyIGlzIGF2
YWlsYWJsZSBmb3IgbWlwczY0e2VsfSBzaW5jZSBnY2MgMTIgYnV0IGZhaWwgdG8gYnVpbGQKPiAr
IyB3aXRoIG4zMiBBQkkgZHVlIHRvIHN0cnVjdCBzdGF0NjQgZGVmaW5pdGlvbiBjbGFzaCBkdWUg
dG8gbWl4aW5nCj4gKyMga2VybmVsIGFuZCB1c2VyIGhlYWRlcnMuCj4gK2lmZXEgKCQoQlIyX21p
cHM2NCkkKEJSMl9taXBzNjRlbCkkKEJSMl9NSVBTX05BQkkzMikseXkpCgpNaW5vciBuaXQsIHBl
cmhhcHM6CgppZmVxICgkKEJSMl9taXBzNjQpJChCUjJfbWlwczY0ZWwpOiQoQlIyX01JUFNfTkFC
STMyKSx5OnkpCgpzbyBpdCdzIGFic29sdXRlbHkgY2xlYXIgaG93IHRoaXMgd29ya3MuCgpUaGFu
a3MhCgpUaG9tYXMKLS0gClRob21hcyBQZXRhenpvbmksIGNvLW93bmVyIGFuZCBDRU8sIEJvb3Rs
aW4KRW1iZWRkZWQgTGludXggYW5kIEtlcm5lbCBlbmdpbmVlcmluZyBhbmQgdHJhaW5pbmcKaHR0
cHM6Ly9ib290bGluLmNvbQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0
dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=

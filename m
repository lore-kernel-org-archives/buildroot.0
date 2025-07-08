Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 260C9C83F09
	for <buildroot@archiver.kernel.org>; Tue,  8 Jul 2025 20:13:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AC91980E6E;
	Tue,  8 Jul 2025 20:13:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z8ih7Q8fsdU7; Tue,  8 Jul 2025 20:13:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EB457813CE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EB457813CE;
	Tue,  8 Jul 2025 20:13:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id EC0391BF
 for <buildroot@buildroot.org>; Tue,  8 Jul 2025 20:13:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D1FDF80E02
 for <buildroot@buildroot.org>; Tue,  8 Jul 2025 20:13:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K_tLCmeTzMpm for <buildroot@buildroot.org>;
 Tue,  8 Jul 2025 20:13:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8D01780E6E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8D01780E6E
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8D01780E6E
 for <buildroot@buildroot.org>; Tue,  8 Jul 2025 20:13:31 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id C5B745FFB7;
 Tue,  8 Jul 2025 22:13:25 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 08 Jul 2025 22:13:25 +0200
MIME-Version: 1.0
Date: Tue, 08 Jul 2025 22:13:25 +0200
To: =?UTF-8?Q?Vincent_Stehl=C3=A9?= <vincent.stehle@arm.com>
Cc: buildroot@buildroot.org, Alistair Francis <alistair@alistair23.me>
In-Reply-To: <20250708100116.1526394-1-vincent.stehle@arm.com>
References: <20250708100116.1526394-1-vincent.stehle@arm.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <31c32b88ce9bd52d1126c215b74303f2@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1752005608;
 bh=qhriK698hw02fGD0YwFtzSpe5ljrlozLjiQU7R2T5+M=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=r6jkA5ofrtusGkKJx2UTbl664BGSOjKRZ6b99ojKRdPKU+Jp4Wh+CzmibE6g4bvvL
 7/3mHIdfef/boANzS+d0XyJ5RkyM2FGL0Ygi7u/sAZQVQIvE+qGvj5Cwa7lgkLC6xK
 3U0PlFqe38K4qlXiGzCDZhn/WB7GQXIgtnCh+HWdKnb+j0gsw8JkJgC6uxZgosQHnE
 Rb6Yf01J4mzjI1was8HnuNQDXGkBBuYcjcx4S3sFTDRdnPU3Rwm89KfHl8Z11NoYT6
 MidZgYLaI70QUHJp+DIGQtBJ/0p4MG11gy4D5Gqe1BQi6nmjFc3cJXVzuPAT+cc8ku
 8VLjp5T7M/qOw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=r6jkA5of
Subject: Re: [Buildroot] [PATCH] package/xen: fix build for arm with
 external toolchain
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

SGkgVmluY2VudCwKCk9uIDA4LzA3LzIwMjUgMTI6MDEsIFZpbmNlbnQgU3RlaGzDqSB3cm90ZToK
PiBYZW4gY3VycmVudGx5IGZhaWxzIHRvIGJ1aWxkIGZvciAzMi1iaXQgQXJtIHY3IHdpdGggdGhl
IGRlZmF1bHQgCj4gZXh0ZXJuYWwKPiB0b29sY2hhaW4sIHdpdGggdGhlIGZvbGxvd2luZyBlcnJv
cjoKPiAKPiAgIHByb2MtdjcuUzozMzogRXJyb3I6IGp1bmsgYXQgZW5kIG9mIGxpbmUsIGZpcnN0
IHVucmVjb2duaXplZCAKPiBjaGFyYWN0ZXIgaXMgYCMnCj4gCj4gQmFja3BvcnQgYSBwYXRjaCBm
cm9tIFhlbiA0LjE4IHBsdXMgb25lIHBhdGNoIGl0IGRlcGVuZHMgb24gdG8gZml4IHRoZQo+IGJ1
aWxkLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFZpbmNlbnQgU3RlaGzDqSA8dmluY2VudC5zdGVobGVA
YXJtLmNvbT4KPiBDYzogQWxpc3RhaXIgRnJhbmNpcyA8YWxpc3RhaXJAYWxpc3RhaXIyMy5tZT4K
CkkgYXBwbGllZCB0aGlzIHBhdGNoIG9uIG1hc3Rlci4gVGhhbmtzIQoKSSBkaWQgZmV3IG1pbm9y
IGNoYW5nZXM6Ci0gSSByZXdvcmRlZCB0aGUgY29tbWl0IHRpdGxlICh0aGUgcm9vdCBjYXVzZSBp
cyBub3QgcmVhbGx5CiAgIHJlbGF0ZWQgdG8gdGhlIGZhY3QgdGhlIHRvb2xjaGFpbiBpcyBleHRl
cm5hbCwgaXQgaXMgaW4gZmFjdAogICBiaW51dGlscyAyLjQxKQotIEkgZml4ZWQgeW91IG1pbmlt
YWwgY29uZmlnIHRvIGFjdHVhbGx5IHJlcHJvZHVjZSB0aGUgaXNzdWUKICAgZnJvbSBhIGNsZWFu
IHdvcmsgdHJlZSwgYW5kIGFkZGVkIGl0IHRvIHRoZSBjb21taXQgbG9nLgogICBUaGlzIGNhbiBi
ZSB1c2VmdWwgZm9yIGZ1cnRoZXIgZGVidWdnaW5nLCBtYWludGVuYW5jZQogICBicmFuY2hlcywg
ZXRjLgotIEkgYWRkZWQgeW91ciBtaXNzaW5nICJTaWduZWQtb2ZmLWJ5OiIgdGFncyBpbiBwYXRj
aGVzLgogICBTaW5jZSB5b3UgbWFuaXB1bGF0ZWQgdGhvc2UgcGF0Y2hlcyAoZXZlbiBmb3IgYQog
ICBzaW1wbGUgY2hlcnJ5LXBpY2svcmViYXNlKSwgd2UgdXN1YWxseSBhZGQgdGhvc2UgdGFncy4K
ClNlZToKaHR0cHM6Ly9naXRsYWIuY29tL2J1aWxkcm9vdC5vcmcvYnVpbGRyb290Ly0vY29tbWl0
LzJjODY4Y2E0NGQ0NGU5MmM3Mzc1OGZjOTM4MWNiNTQxMjlmMTM4OGMKCkJlc3QgcmVnYXJkcywK
Ckp1bGllbi4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
YnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xp
c3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86AB8C71130
	for <buildroot@archiver.kernel.org>; Mon,  7 Jul 2025 16:49:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5A7E96129E;
	Mon,  7 Jul 2025 16:49:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g0-8MlKAgyyi; Mon,  7 Jul 2025 16:49:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8F79B608B8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8F79B608B8;
	Mon,  7 Jul 2025 16:49:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 57764133B
 for <buildroot@buildroot.org>; Mon,  7 Jul 2025 16:49:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3DEE64053E
 for <buildroot@buildroot.org>; Mon,  7 Jul 2025 16:49:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T9BXpt58W8OB for <buildroot@buildroot.org>;
 Mon,  7 Jul 2025 16:49:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3F1A140254
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3F1A140254
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3F1A140254
 for <buildroot@buildroot.org>; Mon,  7 Jul 2025 16:49:35 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id E727E2003AE;
 Mon,  7 Jul 2025 18:49:31 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 07 Jul 2025 18:49:31 +0200
MIME-Version: 1.0
Date: Mon, 07 Jul 2025 18:49:31 +0200
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: buildroot@buildroot.org
In-Reply-To: <0c6f450a-fda3-400a-a10c-09bab951e23a@app.fastmail.com>
References: <20250706105859.292908-1-ju.o@free.fr>
 <0c6f450a-fda3-400a-a10c-09bab951e23a@app.fastmail.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <8432f8cac549c1907f49c160a9d17f9a@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1751906973;
 bh=0x9qepfMkSkj13ImB36xSogmZCDayCQm52yWdj7fNtc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=HhY3RwmlsyDCIjM+Gm5jOkCWqEDfFMym7+/pbbjoYqLEHrAP5WDNwkkNkQd+3dJml
 ne4MPsLHRqlKZktyfmwY0ZFJX1woynbhpnWqAY5B249sxEq9l/3yK9oe4yysyZBu1O
 PU/Ii62r/ySn1qyVGrh2KoHGfj5esQdQz3pi73pfgyiKXk0rRffVdJOCngchcH0DQj
 DEGx/KGC6w+u6GrqBQEbAYZRfAMPXm0lUMZJLQHAfJXXCsm1n864LAgD4rhMuzdONL
 Z2gInwD9nKRs/sFj/IbhFKLYtpL3ERLOrG2yKmwLzpS+f2ik3EhVEPbKp7ujswbz2L
 m9ANJmoLmn1YA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=HhY3Rwml
Subject: Re: [Buildroot] [PATCH 1/1] arch/loongarch: add lsx/lasx SIMD
 dependency on fpu64
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

T24gMDcvMDcvMjAyNSAxMTo1OSwgSmlheHVuIFlhbmcgd3JvdGU6Cj4g5ZyoMjAyNeW5tDfmnIg2
5pel5ZGo5pelIOS4iuWNiDExOjU477yMSnVsaWVuIE9saXZhaW7lhpnpgZPvvJoKPj4gU2luY2Ug
dGhlIExvb25nQXJjaDY0IGludHJvZHVjdGlvbiBpbiBjb21taXQgWzFdLCB0aGUgS2NvbmZpZyBt
ZW51cwo+PiBhbGxvd3Mgc2VsZWN0aW5nIGxzeCBhbmQgbGFzeCBTSU1EIG9wdGlvbnMgaW5kZXBl
bmRlbnRseSBvZiB0aGUgRlBVCj4+IGNvbmZpZ3VyYXRpb24uCj4+IAo+PiBXaGVuIGxzeCBvciBs
YXN4IFNJTUQgaXMgc2VsZWN0ZWQgYW5kIEZQVSBpcyAibm9uZSIsIGhvc3QtZ2NjLWluaXRpYWwK
Pj4gaXMgZmFpbGluZyBhdCBjb25maWd1cmF0aW9uIHRpbWUsIHdpdGggZXJyb3I6Cj4+IAo+PiAg
ICAgLS13aXRoLXNpbWQ9bGFzeCBjb25mbGljdHMgd2l0aCAtLXdpdGgtZnB1PW5vbmUKPj4gCj4+
IEFjY29yZGluZyB0byB0aGUgZ2NjIGNvbmZpZ3VyYXRpb24gc2NyaXB0IFsyXSwgbHN4IGFuZCBs
YXN4IHZhbHVlcwo+PiBhcmUgdmFsaWQgb25seSBpZiBGUFUgaXMgNjQuCj4+IAo+PiBUaGlzIGNv
bW1pdCBhZGRzIHRoZSBtaXNzaW5nICJkZXBlbmRzIG9uIEJSMl9MT09OR0FSQ0hfRlBVXzY0IiBm
b3IKPj4gQlIyX0xPT05HQVJDSF9TSU1EX0xTWCBhbmQgQlIyX0xPT05HQVJDSF9TSU1EX0xBU1gg
b3B0aW9ucy4KPj4gCj4+IEZpeGVzOgo+PiBodHRwczovL2F1dG9idWlsZC5idWlsZHJvb3Qub3Jn
L3Jlc3VsdHMvZDE1OTY0NWRhYjkyMDZkZDQ2ZjQ1ZTc5MjQxZmM4YTk1MGJkMDMyNi8KPj4gCj4+
IFsxXQo+PiBodHRwczovL2dpdGxhYi5jb20vYnVpbGRyb290Lm9yZy9idWlsZHJvb3QvLS9jb21t
aXQvNTQ4OTVkYjljMTBhMjYyODNiMjVhMzkzY2I2Yzg3MmQ3MmMyNDVkMQo+PiBbMl0KPj4gaHR0
cHM6Ly9nY2MuZ251Lm9yZy9naXQvP3A9Z2NjLmdpdDthPWJsb2I7Zj1nY2MvY29uZmlnLmdjYzto
PWE2ZjZlZmVjNGUxMDMzMDEyMjVlZjc0YzJkMTE1OTkzM2QxYzljZjg7aGI9MTc1N2MzMjBiYWRj
OTJjMDYyOGVhZmNkMDdkNTQ1ODU2NTk2OTJlZCNsNTE2Mwo+PiAKPj4gQ2M6IEppYXh1biBZYW5n
IDxqaWF4dW4ueWFuZ0BmbHlnb2F0LmNvbT4KPj4gU2lnbmVkLW9mZi1ieTogSnVsaWVuIE9saXZh
aW4gPGp1Lm9AZnJlZS5mcj4KPiAKPiBSZXZpZXdlZC1ieTogSmlheHVuIFlhbmcgPGppYXh1bi55
YW5nQGZseWdvYXQuY29tPgoKVGhhbmtzIGZvciB0aGUgcmV2aWV3LiBXaXRoIHRoYXQsIEkgYXBw
bGllZCB0aGlzIHBhdGNoIHRvIG1hc3Rlci4KCkJlc3QgcmVnYXJkcywKCkp1bGllbi4KX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxp
bmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5v
cmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK

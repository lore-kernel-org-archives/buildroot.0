Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C31A3C369C7
	for <buildroot@archiver.kernel.org>; Wed, 16 Apr 2025 21:19:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9610E606AF;
	Wed, 16 Apr 2025 21:19:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vRKlUPCZianx; Wed, 16 Apr 2025 21:19:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7399260F2F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7399260F2F;
	Wed, 16 Apr 2025 21:19:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3F53F11B
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 21:19:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 317204142D
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 21:19:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a3W6MaMY8p-M for <buildroot@buildroot.org>;
 Wed, 16 Apr 2025 21:19:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D1DB641781
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D1DB641781
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D1DB641781
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 21:19:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id E23491C0083; Wed, 16 Apr 2025 23:19:41 +0200 (CEST)
Message-ID: <0d18897f-9b8e-487d-853d-2f21301c10e0@rnout.be>
Date: Wed, 16 Apr 2025 23:19:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Peter Seiderer <ps.report@gmx.net>, buildroot@buildroot.org
Cc: Alexandre Esse <alexandre.esse.dev@gmail.com>,
 Nayabbasha.Sayed@microchip.com
References: <20250327164913.13610-1-ps.report@gmx.net>
Content-Language: en-GB
In-Reply-To: <20250327164913.13610-1-ps.report@gmx.net>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1744838382; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=DSioEo+LBBqugbRO1pDzSrrlW9qEgkbrRA1N/DvmnaE=;
 b=Hkq0Rp7jyKBTkR3LGl8GEwQjHxNY1LTBd45x1xzY8bb1cV8+YKkkYCPBfxDeW1Yekg7taI
 Apia1mbzmVk35CHAGZIJsIHQ1fk+w40AjT8ioof2awhfaNSQjcDsvFFPUotpnBsht2RXHb
 nJxKgE3O1DkuDjqQIVg3wds0J0RZozdT+8NNyMnWEqkgQj69pSTRg4QpCOqbK/i5dynB0x
 clOz6zqTlm6TzdHBJV9LFQGyK1lfLSXik2I0d7M4BYMu/iXCdvVIVoWWIhganT/cASiSB9
 RwwlkJImafBiFpoUSh6UcSq9Ynjhae0a2VqGnp1K8jy8mN6Bf3PKRE6CBIPGNg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
Subject: Re: [Buildroot] [PATCH v1] package/v4l2loopback: fix
 v4l2loopback-ctl compile/install
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

Ck9uIDI3LzAzLzIwMjUgMTc6NDksIFBldGVyIFNlaWRlcmVyIHZpYSBidWlsZHJvb3Qgd3JvdGU6
Cj4gU2luY2UgdXBzdHJlYW0gY29tbWl0IFsxXSB0aGUgb3JpZ2luYWwgdjRsMmxvb3BiYWNrLWN0
bCBiYXNoIHNjcmlwdCB3YXMKPiByZXBsYWNlZCBieSBhIEMgdmVyc2lvbiwgc28gYWRkIGEgcHJv
cGVyIGNvbXBpbGUgc3RlcCAoYW5kIHJlbW92ZSBiYXNoCj4gcnVudGltZSBkZXBlbmRlbmN5KSB0
byBmaXggJ1toZWxwXSB2NGwybG9vcGJhY2sgcGFja2FnZSBidWlsZCBmYWlscyBmb3IKPiByYXNw
YmVycnlwaTUnIFsyXS4KPgo+IEZpeGVzOgo+Cj4gICAgL3Vzci9iaW4vaW5zdGFsbDogY2Fubm90
IHN0YXQKPiAgICAnLi4uL2J1aWxkL3Y0bDJsb29wYmFjay0wLjEzLjIvdXRpbHMvdjRsMmxvb3Bi
YWNrLWN0bCc6Cj4gICAgTm8gc3VjaCBmaWxlIG9yIGRpcmVjdG9yeQo+Cj4gWzFdIGh0dHBzOi8v
Z2l0aHViLmNvbS92NGwybG9vcGJhY2svdjRsMmxvb3BiYWNrL2NvbW1pdC8zMzkyMmZhNGU5OTY1
ZDQwMGVkY2MyNzYxZTU1ZmVkZjg0YmJiMjJhCj4gWzJdIGh0dHBzOi8vbGlzdHMuYnVzeWJveC5u
ZXQvcGlwZXJtYWlsL2J1aWxkcm9vdC8yMDI1LU1hcmNoLzc3NTkxMS5odG1sCj4KPiBTaWduZWQt
b2ZmLWJ5OiBQZXRlciBTZWlkZXJlciA8cHMucmVwb3J0QGdteC5uZXQ+CgogwqBBcHBsaWVkIHRv
IDIwMjUuMDIueCBhbmQgMjAyNC4xMS54LCB0aGFua3MuCgogwqBSZWdhcmRzLAogwqBBcm5vdXQK
Cj4gLS0tCj4gICBwYWNrYWdlL3Y0bDJsb29wYmFjay9Db25maWcuaW4gICAgICAgfCA0IC0tLS0K
PiAgIHBhY2thZ2UvdjRsMmxvb3BiYWNrL3Y0bDJsb29wYmFjay5tayB8IDQgKysrKwo+ICAgMiBm
aWxlcyBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0t
Z2l0IGEvcGFja2FnZS92NGwybG9vcGJhY2svQ29uZmlnLmluIGIvcGFja2FnZS92NGwybG9vcGJh
Y2svQ29uZmlnLmluCj4gaW5kZXggZDhjYTMxZTU3Ny4uNGJmYTlhNGZkZCAxMDA2NDQKPiAtLS0g
YS9wYWNrYWdlL3Y0bDJsb29wYmFjay9Db25maWcuaW4KPiArKysgYi9wYWNrYWdlL3Y0bDJsb29w
YmFjay9Db25maWcuaW4KPiBAQCAtMTQsMTAgKzE0LDYgQEAgaWYgQlIyX1BBQ0tBR0VfVjRMMkxP
T1BCQUNLCj4gICAKPiAgIGNvbmZpZyBCUjJfUEFDS0FHRV9WNEwyTE9PUEJBQ0tfVVRJTFMKPiAg
IAlib29sICJ1dGlscyIKPiAtCWRlcGVuZHMgb24gQlIyX1VTRV9NTVUgIyBiYXNoCj4gLQlzZWxl
Y3QgQlIyX1BBQ0tBR0VfQlVTWUJPWF9TSE9XX09USEVSUyAjIGJhc2gKPiAtCXNlbGVjdCBCUjJf
UEFDS0FHRV9CQVNIICMgcnVudGltZSBkZXBlbmRlbmN5Cj4gLQlzZWxlY3QgQlIyX1BBQ0tBR0Vf
U1VETyAjIHJ1bnRpbWUgZGVwZW5kZW5jeQo+ICAgCWhlbHAKPiAgIAkgIEluc3RhbGwgYXBwbGlj
YXRpb25zIHRvIGludGVyYWN0IHdpdGggdjRsMi1sb29wYmFjayBkZXZpY2VzCj4gICAJICAoInZp
cnR1YWwgdmlkZW8gZGV2aWNlcyIpLiAgQ3VycmVudGx5IHRoZXJlIGlzIG9ubHkgYSBzaW5nbGUK
PiBkaWZmIC0tZ2l0IGEvcGFja2FnZS92NGwybG9vcGJhY2svdjRsMmxvb3BiYWNrLm1rIGIvcGFj
a2FnZS92NGwybG9vcGJhY2svdjRsMmxvb3BiYWNrLm1rCj4gaW5kZXggMGUxZDIwYzBjYy4uYTRk
ZGY1ZTJkOSAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL3Y0bDJsb29wYmFjay92NGwybG9vcGJhY2su
bWsKPiArKysgYi9wYWNrYWdlL3Y0bDJsb29wYmFjay92NGwybG9vcGJhY2subWsKPiBAQCAtMTEs
NiArMTEsMTAgQEAgVjRMMkxPT1BCQUNLX0xJQ0VOU0VfRklMRVMgPSBDT1BZSU5HCj4gICBWNEwy
TE9PUEJBQ0tfQ1BFX0lEX1BSRUZJWCA9IGNwZToyLjM6bwo+ICAgCj4gICBpZmVxICgkKEJSMl9Q
QUNLQUdFX1Y0TDJMT09QQkFDS19VVElMUykseSkKPiArZGVmaW5lIFY0TDJMT09QQkFDS19CVUlM
RF9DTURTCj4gKwkkKFRBUkdFVF9NQUtFX0VOVikgJChUQVJHRVRfQ09ORklHVVJFX09QVFMpICQo
TUFLRSkgLUMgJChARCkgdXRpbHMKPiArZW5kZWYKPiArCj4gICBkZWZpbmUgVjRMMkxPT1BCQUNL
X0lOU1RBTExfVEFSR0VUX0NNRFMKPiAgIAkkKElOU1RBTEwpIC1EIC1tIDA3NTUgJChARCkvdXRp
bHMvdjRsMmxvb3BiYWNrLWN0bCAkKFRBUkdFVF9ESVIpL3Vzci9iaW4vdjRsMmxvb3BiYWNrLWN0
bAo+ICAgZW5kZWYKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczov
L2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK

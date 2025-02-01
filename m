Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B207BC0218A
	for <buildroot@archiver.kernel.org>; Sat,  1 Feb 2025 13:24:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 548AE84A4A;
	Sat,  1 Feb 2025 13:24:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eSR1k0WsQscH; Sat,  1 Feb 2025 13:24:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 57D9A84B15
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 57D9A84B15;
	Sat,  1 Feb 2025 13:24:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4D62716E
 for <buildroot@buildroot.org>; Sat,  1 Feb 2025 13:24:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 323EB84A43
 for <buildroot@buildroot.org>; Sat,  1 Feb 2025 13:24:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tCW14f85WdHp for <buildroot@buildroot.org>;
 Sat,  1 Feb 2025 13:24:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::226;
 helo=relay6-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A492484A4A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A492484A4A
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A492484A4A
 for <buildroot@buildroot.org>; Sat,  1 Feb 2025 13:24:53 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2314544208;
 Sat,  1 Feb 2025 13:24:48 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1teDUO-009yrs-1E;
 Sat, 01 Feb 2025 14:24:48 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: =?utf-8?Q?Ga=C3=ABl?= PORTAY <gael.portay+rtone@gmail.com>
Cc: buildroot@buildroot.org
References: <20250128100151.2132875-1-gael.portay+rtone@gmail.com>
Date: Sat, 01 Feb 2025 14:24:48 +0100
In-Reply-To: <20250128100151.2132875-1-gael.portay+rtone@gmail.com>
 (=?utf-8?Q?=22Ga=C3=ABl?=
 PORTAY"'s message of "Tue, 28 Jan 2025 11:01:51 +0100")
Message-ID: <87ldupyezj.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduudekgecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucenucfjughrpefhvfevufhfffgjkfgfgggtgfesthhqtddttderjeenucfhrhhomheprfgvthgvrhcumfhorhhsghgrrghrugcuoehpvghtvghrsehkohhrshhgrggrrhgurdgtohhmqeenucggtffrrghtthgvrhhnpeegfeejudelieekleetjeffgfffffelgfeigfffffeijeejhfduhfelueehvddvueenucfkphepudejkedrudduledruddrudefjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedujeekrdduudelrddurddufeejpdhhvghlohepuggvlhhlrdgsvgdrgeekvghrshdrughkpdhmrghilhhfrhhomhepphgvthgvrheskhhorhhsghgrrghrugdrtghomhdpnhgspghrtghpthhtohepvddprhgtphhtthhopehgrggvlhdrphhorhhtrgihodhrthhonhgvsehgmhgrihhlrdgtohhmpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrgh
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] support/scripts/genimage.sh: add shell
 option -e
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Pj4+Pj4gIkdhw6tsIiA9PSBHYcOrbCBQT1JUQVkgPGdhZWwucG9ydGF5K3J0b25lQGdtYWlsLmNv
bT4gd3JpdGVzOgoKID4gVGhlIGNvbW1pdCA2ODg5MDU2ZjFlIChzdXBwb3J0L3NjcmlwdHMvZ2Vu
aW1hZ2Uuc2gpIGFkZHMgc3VwcG9ydCBmb3IKID4gY3JlYXRpbmcgYm1hcCBpbWFnZXMuCgogPiBT
aW5jZSB0aGVuLCB0aGUgc2NyaXB0IGdlbmltYWdlLnNoIGxvb3NlcyB0aGUgZXJyb3IgcmV0dXJu
ZWQgYnkgdGhlCiA+IGdlbmltYWdlIGNvbW1hbmQuCgogPiBBcyBhIGNvbnNlcXVlbmNlLCB0aGUg
dGFyZ2V0LWZpbmFsaXplIHRhcmdldCBsb29zZXMgdGhlIGVycm9yIGFzIHdlbGwsCiA+IGFuZCBz
byBvbiB1cCB0byBtYWtlLgoKID4gVGhpcyBhZGRzIHRoZSBzaGVsbCBvcHRpb24gLWUgdG8gZXhp
dCBpbW1lZGlhdGVseSBpZiBhIGNvbW1hbmQgZW5kcyB3aXRoCiA+IGFuIGVycm9yLCBzbyB0aGUg
ZXJyb3IgaXMgbm90IGlnbm9yZWQuCgogPiBGaXhlczoKCiA+IAlncG9ydGF5QGFyY2hsaW51eCB+
L3NyYy9ydG9uZS1icjItZXh0ZXJuYWwgJCBtYWtlCiA+IAkoLi4uKQogPj4+PiBFeGVjdXRpbmcg
cG9zdC1pbWFnZSBzY3JpcHQgc3VwcG9ydC9zY3JpcHRzL2dlbmltYWdlLnNoCiA+IAlJTkZPOiBj
bWQ6ICJta2RpciAtcCAiL2hvbWUvZ3BvcnRheS9zcmMvcnRvbmUtYnIyLWV4dGVybmFsL291dHB1
dC9idWlsZC9nZW5pbWFnZS50bXAiIiAoc3RkZXJyKToKID4gCUlORk86IGNtZDogInJtIC1yZiAi
L2hvbWUvZ3BvcnRheS9zcmMvcnRvbmUtYnIyLWV4dGVybmFsL291dHB1dC9idWlsZC9nZW5pbWFn
ZS50bXAiLyoiIChzdGRlcnIpOgogPiAJSU5GTzogY21kOiAibWtkaXIgLXAgIi9ob21lL2dwb3J0
YXkvc3JjL3J0b25lLWJyMi1leHRlcm5hbC9vdXRwdXQvYnVpbGQvZ2VuaW1hZ2UudG1wIiIgKHN0
ZGVycik6CiA+IAlJTkZPOiBjbWQ6ICJjcCAtYSAiL3RtcC90bXAuRWNsS0d3dEE0UiIgIi9ob21l
L2dwb3J0YXkvc3JjL3J0b25lLWJyMi1leHRlcm5hbC9vdXRwdXQvYnVpbGQvZ2VuaW1hZ2UudG1w
L3Jvb3QiIiAoc3RkZXJyKToKID4gCUlORk86IGNtZDogIm1rZGlyIC1wICIvaG9tZS9ncG9ydGF5
L3NyYy9ydG9uZS1icjItZXh0ZXJuYWwvb3V0cHV0L2ltYWdlcyIiIChzdGRlcnIpOgogPiAJSU5G
TzogdmZhdChlZmktcGFydC52ZmF0KTogY21kOiAibWtkb3NmcyAgICcvaG9tZS9ncG9ydGF5L3Ny
Yy9ydG9uZS1icjItZXh0ZXJuYWwvb3V0cHV0L2ltYWdlcy9lZmktcGFydC52ZmF0JyIgKHN0ZGVy
cik6CiA+IAlJTkZPOiB2ZmF0KGVmaS1wYXJ0LnZmYXQpOiBhZGRpbmcgZmlsZSAnZWZpLXBhcnQv
RUZJJyBhcyAnRUZJJyAuLi4KID4gCUlORk86IHZmYXQoZWZpLXBhcnQudmZhdCk6IGNtZDogIk1U
T09MU19TS0lQX0NIRUNLPTEgbWNvcHkgLXNwIC1pICcvaG9tZS9ncG9ydGF5L3NyYy9ydG9uZS1i
cjItZXh0ZXJuYWwvb3V0cHV0L2ltYWdlcy9lZmktcGFydC52ZmF0JyAnL2hvbWUvZ3BvcnRheS9z
cmMvcnRvbmUtYnIyLWV4dGVybmFsL291dHB1dC9pbWFnZXMvZWZpLXBhcnQvRUZJJyAnOjpFRkkn
IiAoc3RkZXJyKToKID4gCURpc2sgZnVsbAogPiAJSU5GTzogdmZhdChlZmktcGFydC52ZmF0KTog
Y21kOiAicm0gLWYgIi9ob21lL2dwb3J0YXkvc3JjL3J0b25lLWJyMi1leHRlcm5hbC9vdXRwdXQv
aW1hZ2VzL2VmaS1wYXJ0LnZmYXQiIiAoc3RkZXJyKToKID4gCUVSUk9SOiB2ZmF0KGVmaS1wYXJ0
LnZmYXQpOiBmYWlsZWQgdG8gZ2VuZXJhdGUgZWZpLXBhcnQudmZhdAogPiAJSU5GTzogY21kOiAi
cm0gLXJmICIvaG9tZS9ncG9ydGF5L3NyYy9ydG9uZS1icjItZXh0ZXJuYWwvb3V0cHV0L2J1aWxk
L2dlbmltYWdlLnRtcC8iIiAoc3RkZXJyKToKID4gCW1ha2VbMV06IExlYXZpbmcgZGlyZWN0b3J5
ICcvaG9tZS9ncG9ydGF5L3NyYy9ydG9uZS1icjItZXh0ZXJuYWwvYnVpbGRyb290JwogPiAJZ3Bv
cnRheUBhcmNobGludXggfi9zcmMvcnRvbmUtYnIyLWV4dGVybmFsICQgZWNobyAkPwogPiAJMAoK
ID4gU2lnbmVkLW9mZi1ieTogR2HDq2wgUE9SVEFZIDxnYWVsLnBvcnRheStydG9uZUBnbWFpbC5j
b20+CgpDb21taXR0ZWQgdG8gMjAyNC4xMS54LCB0aGFua3MuCgotLSAKQnllLCBQZXRlciBLb3Jz
Z2FhcmQKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVp
bGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3Rz
LmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK

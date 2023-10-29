Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97C9EC4332F
	for <buildroot@archiver.kernel.org>; Sun, 29 Oct 2023 20:51:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 21E8C7093B;
	Sun, 29 Oct 2023 20:51:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 21E8C7093B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pEdUbkqlluAN; Sun, 29 Oct 2023 20:51:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 708BE7093E;
	Sun, 29 Oct 2023 20:51:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 708BE7093E
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D55761BF308
 for <buildroot@lists.busybox.net>; Sun, 29 Oct 2023 20:51:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B57594F1A1
 for <buildroot@lists.busybox.net>; Sun, 29 Oct 2023 20:51:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B57594F1A1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ixlhM3JppqRc for <buildroot@lists.busybox.net>;
 Sun, 29 Oct 2023 20:51:17 +0000 (UTC)
Received: from mailgw-out1.grenoble.cnrs.fr (mailgw-out1.grenoble.cnrs.fr
 [147.173.1.68])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 804B24F19F
 for <buildroot@buildroot.org>; Sun, 29 Oct 2023 20:51:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 804B24F19F
Received: from [IPV6:2a01:e0a:947:3d0:c2c9:77ed:b3ee:2b28] (unknown
 [IPv6:2a01:e0a:947:3d0:c2c9:77ed:b3ee:2b28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mailgw-out1.grenoble.cnrs.fr (Postfix) with ESMTPSA id 48DA2C0029;
 Sun, 29 Oct 2023 21:51:14 +0100 (CET)
Message-ID: <47321b8a-6e6a-43a2-b38c-bcc1defcb5c1@grenoble.cnrs.fr>
Date: Sun, 29 Oct 2023 21:51:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: =?UTF-8?Q?=C5=81ukasz_Przenios=C5=82o?= <bremenpl@gmail.com>
References: <em9eec97a0-87a4-4352-9e89-03948b436830@9e2fe6c2.com>
 <61e80819-c901-486c-afdd-1e69441821e2@grenoble.cnrs.fr>
 <em29cb4aaa-8ce7-4449-986c-81c594d64587@9e2fe6c2.com>
From: Edgar Bonet <bonet@grenoble.cnrs.fr>
In-Reply-To: <em29cb4aaa-8ce7-4449-986c-81c594d64587@9e2fe6c2.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=grenoble.cnrs.fr; 
 s=202106-grenoble.cnrs.fr; t=1698612674;
 bh=Zul+BiTUTsVw9uYhhPE7uFEBv1ZRR3MVnbZHWlMvTlM=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=h6YToEHEZ2f5T0wG/hTIS0q8NgJj77Lz48rS5NOrlDuvade9XdHE1cbv9Tzsr/H1A
 WJGsT1i+/v/2v2gD0WxkpXkSV6RNxYrXJ/6cY5oljyNn6atj+ofL1lspuSqbXJq0T/
 JQrcMW/jT5wz4DOPg03ham87LQ4UZtlI5qJMGgxkJizcOq/Sb+9yKPdO89yGmMfLIB
 PxoMHUyPk/T7EcDDWMgN241L2k06rjCSyVeay3kQiXtMIyinNpUS9AUV9alTOHvytL
 R7c2zZmDZASBlbD+GCsgdye2rsOm77jq+NHfm0suVQbLUNzZPirvp1rhCyS/Qn8n8t
 IUIZaZdxbTHZw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=grenoble.cnrs.fr header.i=@grenoble.cnrs.fr
 header.a=rsa-sha256 header.s=202106-grenoble.cnrs.fr header.b=h6YToEHE
Subject: Re: [Buildroot] Help with DTO
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8hCgrFgXVrYXN6IFByemVuaW9zxYJvIHdyb3RlOgo+IFRoZSBwcm9ibGVtIGlzIHRoYXQg
dGhzZSBtZW50aW9uZWQgY29tbWFuZHMgW2dwaW9kZXRlY3QsIGdwaW9pbmZvLi4uXQo+IHByb3Zp
ZGUgbm8gb3V0cHV0IGluIG15IHNoZWxsIChoZXJlIHJ1biBvbmUgYnkgb25lIHdpdGggbm8gb3V0
cHV0KToKCkkgZmluZCBpdCB3ZWlyZCB0aGF0IGBsc2Agc2VlcyAvZGV2L2dwaW9jaGlwKiwgeWV0
IGBncGlvZGV0ZWN0YCBkb2VzIG5vdApkZXRlY3QgYW55dGhpbmcuIEFyZSB5b3UgdXNpbmcgdGhl
IGNvbmZpZ3VyYXRpb24gZnJvbSB0aGUgdHV0b3JpYWwgb3IKQnVpbGRyb290J3MgYmVhZ2xlYm9u
ZV9kZWZjb25maWc/IE9uZSBub3RhYmxlIGRpZmZlcmVuY2UgYmV0d2VlbiB0aGVtCnRoYXQgdGhl
IGxhdHRlciB1c2VzIHRoZSBCZWFnbGVib2FyZCBMaW51eCBrZXJuZWwgZnJvbSBHaXRIdWIsIHdo
ZXJlYXMKdGhlIGZvcm1lciB1c2VzIG1haW5saW5lIExpbnV4IDYuMC4gSSB3b25kZXIgd2hldGhl
ciB0aGlzIG1heSBtYWtlIGEKZGlmZmVyZW5jZSBmb3IgeW91LgoKUmVnYXJkaW5nIHRoZSBEVCBv
dmVybGF5LCBJIGhhdmUgbmV2ZXIgdHJpZWQgc29tZXRoaW5nIHNpbWlsYXIuIEkgZm91bmQKYSB0
dXRvcmlhbCBmcm9tIEJvb3RsaW4uWzFdIEFjY29yZGluZyB0byBpdCwgdGhlIG92ZXJsYXkgaXMg
bWFuYWdlZCBqdXN0Cmxpa2UgdGhlIGRlZmNvbmZpZyBpdHNlbGYuIElmIHlvdSB3cml0ZSBzdWNo
IGFuIG92ZXJsYXksIEJ1aWxkcm9vdApzaG91bGQgY29tcGlsZSBpdCBpZiwgb24gYG1ha2UgbWVu
dWNvbmZpZ2AsIHlvdSBsaXN0IGl0IHVuZGVyCgogICAgS2VybmVsIC8gT3V0LW9mLXRyZWUgRGV2
aWNlIFRyZWUgU291cmNlIGZpbGUgcGF0aHMKClJlZ2FyZHMsCgpFZGdhci4KClsxXSBodHRwczov
L2Jvb3RsaW4uY29tL2Jsb2cvdXNpbmctZGV2aWNlLXRyZWUtb3ZlcmxheXMtZXhhbXBsZS1vbi1i
ZWFnbGVib25lLWJvYXJkcy8KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpo
dHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK

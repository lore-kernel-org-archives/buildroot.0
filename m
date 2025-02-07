Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8DF0C02194
	for <buildroot@archiver.kernel.org>; Fri,  7 Feb 2025 17:15:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6399B4297C;
	Fri,  7 Feb 2025 17:15:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cUrD_WqvzYby; Fri,  7 Feb 2025 17:15:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 62F3D42BEB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 62F3D42BEB;
	Fri,  7 Feb 2025 17:15:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 68CFDE4
 for <buildroot@buildroot.org>; Fri,  7 Feb 2025 17:15:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4CFDF812C2
 for <buildroot@buildroot.org>; Fri,  7 Feb 2025 17:15:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5qv9U_KuQmwC for <buildroot@buildroot.org>;
 Fri,  7 Feb 2025 17:15:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.20;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 31C6E812E8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 31C6E812E8
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 31C6E812E8
 for <buildroot@buildroot.org>; Fri,  7 Feb 2025 17:15:16 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.lan ([85.22.112.179]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MeU0q-1t6HiO0vm0-00iTtZ; Fri, 07
 Feb 2025 18:15:12 +0100
To: buildroot@buildroot.org
Cc: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay+rtone@gmail.com>,
 Julien Grossholtz <julien.grossholtz@openest.io>,
 Martin Bark <martin@barkynet.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 =?UTF-8?q?Jos=C3=A9=20Mendes?= <jp.baltazar.mendes@gmail.com>,
 "Fiona Klute (WIWA)" <fiona.klute@gmx.de>
Date: Fri,  7 Feb 2025 18:14:57 +0100
Message-ID: <20250207171458.1127620-3-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250207171458.1127620-1-fiona.klute@gmx.de>
References: <20250207171458.1127620-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:HlG/xktGZY5OO4RA0pt1XCg5Pl3+CW8t5kfrLGYM+r8R8H5/DBE
 r20PvY1Gh+RYYf4ExSQbwzHkPaR9H2CzWbQC4rv64hHNTXdQcYb+27gVnPmgjGZ2NqAXWfv
 EvAEiagdTO3NuslFfK2Y+228xghtlH2Q97w3vXdm9gffk/nyLI5+ou9QawJ5Q06TIJxVvbv
 7zS0cRKIfZtvTiuQy5WXg==
UI-OutboundReport: notjunk:1;M01:P0:DRzRWw5jHgU=;3KcPP5Xa8xP3iljtwAUQxTzeJIG
 nqNL9pXPxlnIJo2T64UPeWbjFuXsBoiwmay2eijF0L4SKbkTdvdycbE0FBr1zws7jAEzQYKR7
 2RKZ/nmc6iRK3rl/1ENFvK1h2At6Ge9RZSQZrL5yyVCtCiBhyzy95JGDA0IozP/Ndk4cl9vS+
 LBYOqXgNwEY3Z3P78E57kSOa5nA5H+1qSn+2dtavzatpeDYVsMDj4BKyihvtO6iYBHiXms1Ol
 u2mYMIasOkVUSaHa+mfVEsGL23Rt2medHjGqMLk/Q8xTnt8YoIG1Glb167jGpTOtdStr3PPsE
 xu9Kmxq0sNwaOZ/0xkynDvAlvy2wZJsl9UCk2BdnSrFQjcAoefXK3AZ0bfY+RAPlMq3ARHZXy
 Y18DuHyl1Frsoytogfa1HgJ4Rj5VMlDS/WkppveJYRuNJEbsq8xZe/Q/Px/IeXdFBxqQ1TX5c
 uJ8x9vMx2V4N7CA0cr2GlzXUHiG0ERWeSXpNc5jrmX3bniowsiYIBrx58v93IE5CE6iTXplVb
 nPNQ2+SYVbR/N55b2jXvd808eLibr1eaPtHMI56UUzYtZcgx0JeL7Mbo15Vb6O2PYM5OkB+zh
 wXKKS8zPNrHNn5BgKvwiFtLw0P3W56BZpsPhycqykt4YiTfi9abf5jgq+rSShZw+AecPaeKG2
 hJYYGdT8zGJrW06L64kPuk0rbzo+SQP9Ka6EtiMONTcrYwtlGB7ppe1OIx1LjGKFQ9JdIkVgf
 LmlvrVvzC+V9tnMXBAjKTJTZtLU4I2jA5j3Bmtc7efMbiUPXdTl4FYPU0/wLSLpV9GR4vpBpi
 MCHq/dUXdgn9SW/kHHWII6WqTzAsl+MF5OtE+5ejJ7gYNV0XHnBBHCnR8MsuwCaurjn3PH/Y4
 /s+qH6ApGta798OPsXGV5/aNolUZBIw/QlX9C0veul8bjgnERxo4nqmXP0A1tGtUTGcrH72OD
 q4bGbU37Yz18HEXrnB69DqBgYa6GSjC/UexF6zgVredhQ7Cz/n59IvK9JjWSkPv8pNk+4o8mX
 RqchA0+MKoi1h47aRAYwWxib9GYKB0+taOidjMtY++vArIxyIhzbbZ5Bt04YoufYFg7UHHq8D
 oA93NUPzMVkuFjj5jVcpBAUhYNgamr2ykSxymIUBJCxEpmCiKujOLZQPP2iSpy4xC7VJAV/MQ
 1aPV2QJS/1OdrQm0DeZvKqhYx9vsYPCzoVSo730oolWuFJBB94GavD38mgHiAC/APAAubd3Fl
 FrgqdlZBElIii9u4NY/VPC2MR7+t1RrQYEEk8CsQ1sMAJRgdghfX61Ti8EQB4/p/ZIZSl3t25
 YlsxfheDAlLpFm3ywg26YlFkTyH7MbaZIMs9XkYBXISC3uFoSsAhHDZAD1Bcb7woKCa5pMcAV
 poJKsxCiktOWzJyonyAS2Uu8MBdLp/3xLDtmt4EHCefzJU8U3L23Jw8yHo
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1738948512; x=1739553312; i=fiona.klute@gmx.de;
 bh=fhtZL4Xl9E9bGNDH2s0x00laI9YhjKJxQUAk/botyic=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Type:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=CBdhUP4Db74CTomK3zahFTR9x8i68TsQjY1rhqnc1Xa9XKnmVCrCSGpYcHZ+Fxj9
 1AQ5xeMXesB64xu5gA/LX6lQGZGlh6OVS55DMCadc/wKAlVftx+uaXTgNalwl2kdK
 k91E0oUZ8CcZYKlGc5gn0wjnkFi+8cXoeXbyRgdVgbUVRZrRmhblXLafPPE6SsSi7
 gtX99l7bK17KNcG+XgBulai1ZFJ8EBZOgKdpdunQB0VoEYeYSogl/PTwNpbyuQ0mc
 ko8yGPozHZ6RPvRHi3cDnDvnWvvseMFYtvQ2A8xTJkn+cq5h5zY2q8xRSMZ8QlIjd
 /vUnZ3SHMWHZpwo0Dg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=CBdhUP4D
Subject: [Buildroot] [PATCH v3 2/3] board/raspberrypi: allow non-matching
 globs for DTBs
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

RnJvbTogIkZpb25hIEtsdXRlIChXSVdBKSIgPGZpb25hLmtsdXRlQGdteC5kZT4KCldoZW4gaW5z
dGFsbGluZyBEVEJzIGZyb20gdGhlIHJwaS1maXJtd2FyZSBwYWNrYWdlCihCUjJfUEFDS0FHRV9S
UElfRklSTVdBUkVfSU5TVEFMTF9EVEJTPXkpLCB0aGVyZSdzIG5vIERUQiBkaXJlY3RseSBpbgp0
aGUgaW1hZ2VzIGRpcmVjdG9yeSBiZWNhdXNlIHRoZSBrZXJuZWwgYnVpbGQgZG9lc24ndCBwcm92
aWRlIG9uZS4KClVzaW5nIHByZS1jb21waWxlZCBEVEJzIGlzIGRpc2NvdXJhZ2VkLCBidXQgdXNl
ZnVsIGZvciB1c2luZyBtYWlubGluZQprZXJuZWxzIHVudGlsIHN1aXRhYmxlIERUUyBjYW4gYmUg
bWVyZ2VkLCBvciB0byBwcm92aWRlIFUtQm9vdCB3aXRoIGEKRFRCICh2aWEgdGhlIGZpcm13YXJl
IGJvb3Rsb2FkZXIpIGluZGVwZW5kZW50IG9mIHdoYXRldmVyIGtlcm5lbCBEVEIKaXMgaW4gdXNl
LgoKU2lnbmVkLW9mZi1ieTogRmlvbmEgS2x1dGUgKFdJV0EpIDxmaW9uYS5rbHV0ZUBnbXguZGU+
ClJldmlld2VkLWJ5OiBHYcOrbCBQT1JUQVkgPGdhZWwucG9ydGF5K3J0b25lQGdtYWlsLmNvbT4K
LS0tCkNoYW5nZXMgdjEgLT4gdjI6CiogQ2hlY2sgZm9yIGV4aXN0YW5jZSBvZiBwYXRocyByZXR1
cm5lZCBieSB0aGUgRFRCIGdsb2IgZXhwcmVzc2lvbnMKICBpbnN0ZWFkIG9mIGNoYW5naW5nIHNo
ZWxsIGdsb2IgYmVoYXZpb3IKCiBib2FyZC9yYXNwYmVycnlwaS9wb3N0LWltYWdlLnNoIHwgMiAr
KwogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2JvYXJkL3Jh
c3BiZXJyeXBpL3Bvc3QtaW1hZ2Uuc2ggYi9ib2FyZC9yYXNwYmVycnlwaS9wb3N0LWltYWdlLnNo
CmluZGV4IGU0NjExZDA1ZGQuLmEzYTJkOGQ2MjAgMTAwNzU1Ci0tLSBhL2JvYXJkL3Jhc3BiZXJy
eXBpL3Bvc3QtaW1hZ2Uuc2gKKysrIGIvYm9hcmQvcmFzcGJlcnJ5cGkvcG9zdC1pbWFnZS5zaApA
QCAtMTMsNiArMTMsOCBAQCBpZiBbICEgLWUgIiR7R0VOSU1BR0VfQ0ZHfSIgXTsgdGhlbgogCUZJ
TEVTPSgpCiAKIAlmb3IgaSBpbiAiJHtCSU5BUklFU19ESVJ9Ii8qLmR0YiAiJHtCSU5BUklFU19E
SVJ9Ii9ycGktZmlybXdhcmUvKjsgZG8KKwkJIyBpZ25vcmUgbGl0ZXJhbCBnbG9icyB0aGF0IGRp
ZG4ndCBtYXRjaCBhbnl0aGluZworCQlbIC1lICIke2l9IiBdIHx8IGNvbnRpbnVlCiAJCUZJTEVT
Kz0oICIke2kjJHtCSU5BUklFU19ESVJ9L30iICkKIAlkb25lCiAKLS0gCjIuNDcuMgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxp
bmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5v
cmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK

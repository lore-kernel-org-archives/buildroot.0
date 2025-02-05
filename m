Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA888C02194
	for <buildroot@archiver.kernel.org>; Wed,  5 Feb 2025 11:41:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8DB5440C0F;
	Wed,  5 Feb 2025 11:41:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 509P3xpsOC4l; Wed,  5 Feb 2025 11:41:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4CA0441600
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4CA0441600;
	Wed,  5 Feb 2025 11:41:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 49B6F12A
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 11:41:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2E2FF60B14
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 11:41:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 34XH3rBjo_WO for <buildroot@buildroot.org>;
 Wed,  5 Feb 2025 11:41:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=46.105.56.78;
 helo=9.mo576.mail-out.ovh.net; envelope-from=sebastien.szymanski@armadeus.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6D54A60678
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6D54A60678
Received: from 9.mo576.mail-out.ovh.net (9.mo576.mail-out.ovh.net
 [46.105.56.78])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6D54A60678
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 11:41:03 +0000 (UTC)
Received: from director10.ghost.mail-out.ovh.net (unknown [10.108.2.211])
 by mo576.mail-out.ovh.net (Postfix) with ESMTP id 4Ynywr4RbLz1VQR
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 11:41:00 +0000 (UTC)
Received: from ghost-submission-5b5ff79f4f-22h7p (unknown [10.108.54.171])
 by director10.ghost.mail-out.ovh.net (Postfix) with ESMTPS id EBC081FED5;
 Wed,  5 Feb 2025 11:40:59 +0000 (UTC)
Received: from armadeus.com ([37.59.142.113])
 by ghost-submission-5b5ff79f4f-22h7p with ESMTPSA
 id P3yiKEpOo2ej2AEA3y/gtQ:T2
 (envelope-from <sebastien.szymanski@armadeus.com>);
 Wed, 05 Feb 2025 11:40:59 +0000
X-OVh-ClientIp: 109.89.232.55
From: =?utf-8?q?S=C3=A9bastien_Szymanski?= <sebastien.szymanski@armadeus.com>
Date: Wed, 05 Feb 2025 12:40:51 +0100
MIME-Version: 1.0
Message-Id: <20250205-imx-packages-bump-v1-1-2f11b86d2da5@armadeus.com>
References: <20250205-imx-packages-bump-v1-0-2f11b86d2da5@armadeus.com>
In-Reply-To: <20250205-imx-packages-bump-v1-0-2f11b86d2da5@armadeus.com>
To: buildroot@buildroot.org
X-Mailer: b4 0.14.2
X-Ovh-Tracer-Id: 5641884434056932320
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvfeefiecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthekredtredtjeenucfhrhhomhepuforsggrshhtihgvnhcuufiihihmrghnshhkihcuoehsvggsrghsthhivghnrdhsiiihmhgrnhhskhhisegrrhhmrgguvghushdrtghomheqnecuggftrfgrthhtvghrnhepiedufeeuheeugfekleehfeejjefgfedvuedutdffkeevhfdtlefgheehffehgefgnecukfhppeduvdejrddtrddtrddupddutdelrdekledrvdefvddrheehpdefjedrheelrddugedvrdduudefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpehsvggsrghsthhivghnrdhsiiihmhgrnhhskhhisegrrhhmrgguvghushdrtghomhdpnhgspghrtghpthhtohepuddprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdfovfetjfhoshhtpehmohehjeeimgdpmhhouggvpehsmhhtphhouhht
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 bh=yXvRnnR58GXafuUG78R5DmeOs2GaFltxRtWd0TvgGw4=; 
 c=relaxed/relaxed; d=armadeus.com; h=From; s=ovhmo103079-selector1;
 t=1738755660; v=1;
 b=JJZMBgq0BhmuwDc8iN6j0dkS54/m0DYPAA9yD7nv84pU3LOMfDLxatmsvG5/NLRsH5bCOEmO
 iznzsccUt0QTkrOe9+1GZKXF/1TAebpsiVWQJZUyJH/ujJa2L/R5vwivUGE8Myo0VY+GrVQ6oyd
 36WQQS0WVdXgiw6l44f2o67d4WgzbwZh/ISIlapQANERDzue0xV6stUeiwscJ6xYrttZZZZkUiW
 O3ZaOiJiDmWVuK81sAF1GcfrHuPMslCHBWnWZ5HM3dI8DjK1cXwIWwOssZETwOXSU1CII8J/mNs
 D7LpQcDa4kI39nIL174WUBbG6E+deOmu/SaydwUl5rs9Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=armadeus.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=armadeus.com header.i=@armadeus.com header.a=rsa-sha256
 header.s=ovhmo103079-selector1 header.b=JJZMBgq0
X-Mailman-Original-Authentication-Results: garm.ovh; auth=pass
 (GARM-113S007093b3a87-f549-4090-bcc1-14a1bcf0a406,
 07F6D1151FB3B68F354E79ABC9BDBC207BB7D4D8)
 smtp.auth=sebastien.szymanski@armadeus.com
Subject: [Buildroot] [PATCH 01/11] package/freescale-imx/imx-gpu-g2d:
 install the specific library for i.MX8MM
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
Cc: Gary Bisson <bisson.gary@gmail.com>,
 Chris Dimich <chris.dimich@boundarydevices.com>,
 Refik Tuzakli <tuzakli.refik@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Rm9yIHRoZSBpLk1YOE1NLCB0aGlzIHBhY2thZ2UgY29udGFpbnMgYSBzcGVjaWZpYyBsaWJyYXJ5
IHRoYXQgaXMgbm90CmxpbmtlZCB0byBPcGVuQ0wgYmVjYXVzZSB0aGVyZSBpcyBubyBvcGVuQ0wg
c3VwcG9ydCBvbiBpLk1YOE1NIEdQVS4KClNpZ25lZC1vZmYtYnk6IFPDqWJhc3RpZW4gU3p5bWFu
c2tpIDxzZWJhc3RpZW4uc3p5bWFuc2tpQGFybWFkZXVzLmNvbT4KLS0tCiBwYWNrYWdlL2ZyZWVz
Y2FsZS1pbXgvaW14LWdwdS1nMmQvaW14LWdwdS1nMmQubWsgfCA2ICsrKystLQogMSBmaWxlIGNo
YW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9wYWNr
YWdlL2ZyZWVzY2FsZS1pbXgvaW14LWdwdS1nMmQvaW14LWdwdS1nMmQubWsgYi9wYWNrYWdlL2Zy
ZWVzY2FsZS1pbXgvaW14LWdwdS1nMmQvaW14LWdwdS1nMmQubWsKaW5kZXggMGE3ZWUzYzI5OGVk
YTI2NWRhNDM5YzQ1Yzc1OWEyNDUyODY0MzhmMi4uMjEzZjIwYTdkOTQxZDUxNDk4ZDFmNzcwNDZl
ODUxYjQzN2VhY2MzNyAxMDA2NDQKLS0tIGEvcGFja2FnZS9mcmVlc2NhbGUtaW14L2lteC1ncHUt
ZzJkL2lteC1ncHUtZzJkLm1rCisrKyBiL3BhY2thZ2UvZnJlZXNjYWxlLWlteC9pbXgtZ3B1LWcy
ZC9pbXgtZ3B1LWcyZC5tawpAQCAtMjIsMTIgKzIyLDE0IEBAIGRlZmluZSBJTVhfR1BVX0cyRF9F
WFRSQUNUX0NNRFMKIAkkKGNhbGwgTlhQX0VYVFJBQ1RfSEVMUEVSLCQoSU1YX0dQVV9HMkRfRExf
RElSKS8kKElNWF9HUFVfRzJEX1NPVVJDRSkpCiBlbmRlZgogCitJTVhfR1BVX0cyRF9TVUJESVIg
PSAkKGlmICQoQlIyX1BBQ0tBR0VfRlJFRVNDQUxFX0lNWF9QTEFURk9STV9JTVg4TU0pLG14OG1t
LCkKKwogZGVmaW5lIElNWF9HUFVfRzJEX0lOU1RBTExfU1RBR0lOR19DTURTCi0JY3AgLWEgJChA
RCkvZzJkL3Vzci8qICQoU1RBR0lOR19ESVIpL3VzcgorCWNwIC1hICQoQEQpL2cyZC91c3IvbGli
LyQoSU1YX0dQVV9HMkRfU1VCRElSKS9saWJnMmQqICAkKFNUQUdJTkdfRElSKS91c3IvbGliLwog
ZW5kZWYKIAogZGVmaW5lIElNWF9HUFVfRzJEX0lOU1RBTExfVEFSR0VUX0NNRFMKLQljcCAtYSAk
KEBEKS9nMmQvdXNyL2xpYiAkKFRBUkdFVF9ESVIpL3VzcgorCWNwIC1hICQoQEQpL2cyZC91c3Iv
bGliLyQoSU1YX0dQVV9HMkRfU1VCRElSKS9saWJnMmQqICAkKFRBUkdFVF9ESVIpL3Vzci9saWIv
CiBlbmRlZgogCiAkKGV2YWwgJChnZW5lcmljLXBhY2thZ2UpKQoKLS0gCjIuNDUuMwoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxp
bmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5v
cmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK

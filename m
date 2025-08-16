Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35F56CA0EE4
	for <buildroot@archiver.kernel.org>; Sat, 16 Aug 2025 09:15:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E723783E99;
	Sat, 16 Aug 2025 09:15:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4R97hF6AU1IX; Sat, 16 Aug 2025 09:15:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1AEF383E92
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1AEF383E92;
	Sat, 16 Aug 2025 09:15:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1E124223
 for <buildroot@buildroot.org>; Sat, 16 Aug 2025 09:15:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1BB1A4148A
 for <buildroot@buildroot.org>; Sat, 16 Aug 2025 09:15:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NI-bh81tXPJU for <buildroot@buildroot.org>;
 Sat, 16 Aug 2025 09:15:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.194;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org BE79341457
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BE79341457
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BE79341457
 for <buildroot@buildroot.org>; Sat, 16 Aug 2025 09:15:19 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id 33AA4430CE;
 Sat, 16 Aug 2025 09:15:15 +0000 (UTC)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>
Date: Sat, 16 Aug 2025 11:15:11 +0200
Message-ID: <20250816091514.1361588-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddugeeigeeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffogggtgfesthekredtredtjeenucfhrhhomhepvfhhohhmrghsucfrvghtrgiiiihonhhiuceothhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeevkeegfeeitedtieegfeefgfekffegvdfhleeitddtieetteevleduiedtgfdvtdenucffohhmrghinhepghhnuhdrohhrghenucfkphepvdgrtddumegtsgdukeemkeeigegumedvuddttdemrgdttdhfmeehlegsfeemgehfvdemieefuggsnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdukeemkeeigegumedvuddttdemrgdttdhfmeehlegsfeemgehfvdemieefuggspdhhvghlohepfihinhgushhurhhfrdhhohhmvgdpmhgrihhlfhhrohhmpehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepgedprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhto
 hepghhiuhhlihhordgsvghnvghtthhisegsvghnvghtthhivghnghhinhgvvghrihhnghdrtghomhdprhgtphhtthhopehrohhmrghinhdrnhgrohhurhesghhmrghilhdrtghomh
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1755335715;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=PciuCk3j3e9dqhvk/0b2X+fs/u8AcBTVv3MWZO1AQVE=;
 b=lHwDdHRvX0b4LLlr1+ixbf5hJCa1nju76iwj/4JxQTL3RNH+XNM88DQGraTaQaVnAgzlXQ
 bCNcBOgjQ7whPE/+A6gUvtU2HV4tmgDk1051nmnW12vNXII7ABwCD6zAXOnb6gTRfouFYg
 UNq4/DsDUXAzO2DKz6O8qzFs8QdMOCZc6/ks+GNtl2FFhnY3N5tSHNsKd10CPWhlzFiaa2
 9OwuBfkDxatCZpv/OBabQfQK1gcJuVbviuCxBlXQGHLhqqhvjOw3GgtTDVfSMPtsYOuTuT
 2oE8sqtvwLpBJJPmvSq542T6p8/g8Ww4vFSQzSh4qcJiNNgTwsSjLhcxmbgH1Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=lHwDdHRv
Subject: [Buildroot] [PATCH 1/2] toolchain/Config.in: add
 BR2_TOOLCHAIN_HAS_GCC_BUG_121567
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhpcyB3aWxsIGJlIG5lZWRlZCB0byB3b3JrIGFyb3VuZCBhIEdDQyBidWcgYWZmZWN0aW5nIHB5
dGhvbjMuIFRoZQpidWcgaXMgcmVwb3J0ZWQgYXQKaHR0cHM6Ly9nY2MuZ251Lm9yZy9idWd6aWxs
YS9zaG93X2J1Zy5jZ2k/aWQ9MTIxNTY3LgoKVGhpcyBidWcgYWZmZWN0cyBHQ0MgYXQgbGVhc3Qg
c2luY2UgNi54LCBidXQgd2UgY291bGRuJ3QgdGVzdCBlYXJsaWVyCnZlcnNpb25zLCBzbyB3ZSBz
aW1wbHkgYXNzdW1lIGFsbCBHQ0MgdmVyc2lvbnMgYXJlIGFmZmVjdGVkLiBFdmVuIEdDQwoxNS54
IGlzIHN0aWxsIGFmZmVjdGVkLCBhcyByZXBvcnRlZCB0byB1cHN0cmVhbSBHQ0MuCgpTaWduZWQt
b2ZmLWJ5OiBUaG9tYXMgUGV0YXp6b25pIDx0aG9tYXMucGV0YXp6b25pQGJvb3RsaW4uY29tPgot
LS0KIHRvb2xjaGFpbi9Db25maWcuaW4gfCAxMCArKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwg
MTAgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL3Rvb2xjaGFpbi9Db25maWcuaW4gYi90b29s
Y2hhaW4vQ29uZmlnLmluCmluZGV4IDhmOTFiMjM1NjIuLjMwY2NiY2VlN2EgMTAwNjQ0Ci0tLSBh
L3Rvb2xjaGFpbi9Db25maWcuaW4KKysrIGIvdG9vbGNoYWluL0NvbmZpZy5pbgpAQCAtMjQzLDYg
KzI0MywxNiBAQCBjb25maWcgQlIyX1RPT0xDSEFJTl9IQVNfR0NDX0JVR18xMTEwMDEKIAkJICAg
QlIyX09QVElNSVpFXzIgfHwgXAogCQkgICBCUjJfT1BUSU1JWkVfMwogCisjIGh0dHBzOi8vZ2Nj
LmdudS5vcmcvYnVnemlsbGEvc2hvd19idWcuY2dpP2lkPTEyMTU2NworIyBlcnJvcjogdW5hYmxl
IHRvIGZpbmQgYSByZWdpc3RlciB0byBzcGlsbCBpbiBjbGFzcyDigJhSMF9SRUdT4oCZCisjIFRo
ZSBidWcgZXhpc3RzIGF0IGxlYXN0IHNpbmNlIGdjYyA2LngsIHNvIHdlIGFyZSBhc3N1bWluZyBp
dCBhZmZlY3RzCisjIGFsbCBHQ0MgdmVyc2lvbnMuCitjb25maWcgQlIyX1RPT0xDSEFJTl9IQVNf
R0NDX0JVR18xMjE1NjcKKwlib29sCisJZGVmYXVsdCB5IGlmIEJSMl9zaAorCWRlcGVuZHMgb24g
QlIyX09QVElNSVpFXzIgfHwgXAorCQkgICBCUjJfT1BUSU1JWkVfMworCiBjb25maWcgQlIyX1RP
T0xDSEFJTl9IQVNfTkFUSVZFX1JQQwogCWJvb2wKIAotLSAKMi41MC4xCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0
CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=

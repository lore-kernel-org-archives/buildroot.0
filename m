Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EA68C3ABB2
	for <buildroot@archiver.kernel.org>; Wed, 28 May 2025 14:58:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4DB60405DB;
	Wed, 28 May 2025 14:58:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NNpWQQxtYNLc; Wed, 28 May 2025 14:58:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6FFC3403AB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6FFC3403AB;
	Wed, 28 May 2025 14:58:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1B83419D
 for <buildroot@buildroot.org>; Wed, 28 May 2025 14:58:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A49A440EFD
 for <buildroot@buildroot.org>; Wed, 28 May 2025 14:58:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tpslGeJ3Mqe4 for <buildroot@buildroot.org>;
 Wed, 28 May 2025 14:58:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::222;
 helo=relay2-d.mail.gandi.net; envelope-from=kory.maincent@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 81E2A40F88
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 81E2A40F88
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 81E2A40F88
 for <buildroot@buildroot.org>; Wed, 28 May 2025 14:58:12 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 989D443BFE;
 Wed, 28 May 2025 14:58:08 +0000 (UTC)
Date: Wed, 28 May 2025 16:57:57 +0200
Message-Id: <20250528-fix_license_toolchain-v1-0-34295630709b@bootlin.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAHUkN2gC/x2MQQqAIBAAvxJ7TiihtL4SIaVrLYSGRgTS31s6D
 sxMgYyJMMNYFUh4U6YYGNq6ArsvYUNBjhlkI7umk1p4esxBFkNGc8V4sEVBeLXoVTk3rNgDt2d
 CFv/vNL/vB8zM9h5nAAAA
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>, 
 Romain Naour <romain.naour@gmail.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Kory Maincent <kory.maincent@bootlin.com>
X-Mailer: b4 0.15-dev-8cb71
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgddvfeehieculddtuddrgeefvddrtddtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffufffkgggtgffvvefosehtkeertdertdejnecuhfhrohhmpefmohhrhicuofgrihhntggvnhhtuceokhhorhihrdhmrghinhgtvghnthessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepudeggfduffethfdtgeehtdeiieeuveelleduieeiteejkeetheelheefteeugfegnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopegluddvjedrtddruddrudgnpdhmrghilhhfrhhomhepkhhorhihrdhmrghinhgtvghnthessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohephedprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopehgihhulhhiohdrsggvnhgvthhtihessggvnhgvthhtihgvnhhgihhnvggvrhhinhhgrdgtohhmpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdprhgtphhtthhop
 ehrohhmrghinhdrnhgrohhurhesghhmrghilhdrtghomhdprhgtphhtthhopehkohhrhidrmhgrihhntggvnhhtsegsohhothhlihhnrdgtohhm
X-GND-Sasl: kory.maincent@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1748444288;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=9z4QeqtPJkXgVRssjIA0Q30e18AMxP1GQfRDxg5dwvI=;
 b=mDc6yy1HXirJru2isn9LkWqMX+0O0SBRVOs15kBUmzyrDF36ZF7LO+zYh3gzM3NH+u/feW
 6+K5sdx7CwGTfqopnFVyt6L/ncvw7s6ygLG0dv+uGReTNgKdsopiamu5zWHoP3K8TF1loa
 EeUbgJjRy3ARlZDrxM4thyKPybrNn0Zpn7QVMpX0fe4C3H32q5iByqkYu9GnRx7Ig/gV3v
 UMpDIA6q455Xz5s9IO61jhp74nQjIJF57JZOdKkh+38dF5LT7rc9XzH01BXMRsqhecmCDU
 zsDCEs/zaLM9eo/Nu5GOJimoVtbMgkhy2Bli41XCkaCmGv3spizzvJj2vepqCA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=mDc6yy1H
Subject: [Buildroot] [PATCH 0/5] Add support for license files for external
 toolchain
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
From: Kory Maincent via buildroot <buildroot@buildroot.org>
Reply-To: Kory Maincent <kory.maincent@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

RXh0ZXJuYWwgdG9vbGNoYWluIHdlcmUgbm90IHByb3ZpZGluZyBhbnkgbGljZW5zZSBmaWxlLgpB
ZGQgc3VwcG9ydCBmb3IgbGljZW5zZSBmaWxlcyBmb3IgdGhlc2UgdG9vbGNoYWlucy4KClNpZ25l
ZC1vZmYtYnk6IEtvcnkgTWFpbmNlbnQgPGtvcnkubWFpbmNlbnRAYm9vdGxpbi5jb20+Ci0tLQpL
b3J5IE1haW5jZW50ICg1KToKICAgICAgdG9vbGNoYWluLWV4dGVybmFsOiBGaXggbGljZW5zZSBm
aWxlIG1hbmFnZW1lbnQgYWZ0ZXIgdG9vbGNoYWluIG1vdmUKICAgICAgdG9vbGNoYWluLWV4dGVy
bmFsLWJvb3RsaW46IEFkZCBzdXBwb3J0IGZvciBsaWNlbnNlIGZpbGUgZGVzY3JpcHRpb24KICAg
ICAgdG9vbGNoYWluLWV4dGVybmFsLWxpbmFybyo6IEFkZCBzdXBwb3J0IGZvciBsaWNlbnNlIGZp
bGUgZGVzY3JpcHRpb24KICAgICAgdG9vbGNoYWluLWV4dGVybmFsLWFybSo6IEFkZCBzdXBwb3J0
IGZvciBsaWNlbnNlIGZpbGUgZGVzY3JpcHRpb24KICAgICAgdG9vbGNoYWluLWV4dGVybmFsLWNv
ZGVzb3VyY2VyeS1taXBzOiBBZGQgc3VwcG9ydCBmb3IgbGljZW5zZSBmaWxlIGRlc2NyaXB0aW9u
Cgogc3VwcG9ydC9zY3JpcHRzL2dlbi1ib290bGluLXRvb2xjaGFpbnMgICAgICAgICAgICAgfCAg
MTggKy0KIC4uLi90b29sY2hhaW4tZXh0ZXJuYWwvcGtnLXRvb2xjaGFpbi1leHRlcm5hbC5tayAg
IHwgICA1ICsKIC4uLi90b29sY2hhaW4tZXh0ZXJuYWwtYXJtLWFhcmNoNjQtYmUuaGFzaCAgICAg
ICAgIHwgICAxICsKIC4uLi90b29sY2hhaW4tZXh0ZXJuYWwtYXJtLWFhcmNoNjQtYmUubWsgICAg
ICAgICAgIHwgICAyICsKIC4uLi90b29sY2hhaW4tZXh0ZXJuYWwtYXJtLWFhcmNoNjQuaGFzaCAg
ICAgICAgICAgIHwgICAxICsKIC4uLi90b29sY2hhaW4tZXh0ZXJuYWwtYXJtLWFhcmNoNjQubWsg
ICAgICAgICAgICAgIHwgICAyICsKIC4uLi90b29sY2hhaW4tZXh0ZXJuYWwtYXJtLWFybS5oYXNo
ICAgICAgICAgICAgICAgIHwgICAxICsKIC4uLi90b29sY2hhaW4tZXh0ZXJuYWwtYXJtLWFybS5t
ayAgICAgICAgICAgICAgICAgIHwgICAyICsKIC4uLi90b29sY2hhaW4tZXh0ZXJuYWwtYm9vdGxp
bi5oYXNoICAgICAgICAgICAgICAgIHwgMjEyICsrKysrKysKIC4uLi90b29sY2hhaW4tZXh0ZXJu
YWwtYm9vdGxpbi5tayAgICAgICAgICAgICAgICAgIHwgNjQzICsrKysrKysrKysrKysrLS0tLS0t
LQogLi4uL3Rvb2xjaGFpbi1leHRlcm5hbC1jb2Rlc291cmNlcnktbWlwcy5oYXNoICAgICAgfCAg
IDEgKwogLi4uL3Rvb2xjaGFpbi1leHRlcm5hbC1jb2Rlc291cmNlcnktbWlwcy5tayAgICAgICAg
fCAgIDIgKwogLi4uL3Rvb2xjaGFpbi1leHRlcm5hbC1saW5hcm8tYWFyY2g2NC1iZS5oYXNoICAg
ICAgfCAgMjEgKwogLi4uL3Rvb2xjaGFpbi1leHRlcm5hbC1saW5hcm8tYWFyY2g2NC1iZS5tayAg
ICAgICAgfCAgMjQgKwogLi4uL3Rvb2xjaGFpbi1leHRlcm5hbC1saW5hcm8tYWFyY2g2NC5oYXNo
ICAgICAgICAgfCAgMjEgKwogLi4uL3Rvb2xjaGFpbi1leHRlcm5hbC1saW5hcm8tYWFyY2g2NC5t
ayAgICAgICAgICAgfCAgMjMgKwogLi4uL3Rvb2xjaGFpbi1leHRlcm5hbC1saW5hcm8tYXJtLmhh
c2ggICAgICAgICAgICAgfCAgMjEgKwogLi4uL3Rvb2xjaGFpbi1leHRlcm5hbC1saW5hcm8tYXJt
Lm1rICAgICAgICAgICAgICAgfCAgMjMgKwogLi4uL3Rvb2xjaGFpbi1leHRlcm5hbC1saW5hcm8t
YXJtZWIuaGFzaCAgICAgICAgICAgfCAgMjEgKwogLi4uL3Rvb2xjaGFpbi1leHRlcm5hbC1saW5h
cm8tYXJtZWIubWsgICAgICAgICAgICAgfCAgMjMgKwogMjAgZmlsZXMgY2hhbmdlZCwgODU0IGlu
c2VydGlvbnMoKyksIDIxMyBkZWxldGlvbnMoLSkKLS0tCmJhc2UtY29tbWl0OiA5ZDkyYzdlM2Zm
ODBmOGM5YTJkMDVhMTQxYjM0ZGZiMTY0ZTdlODFmCmNoYW5nZS1pZDogMjAyNTA1MjgtZml4X2xp
Y2Vuc2VfdG9vbGNoYWluLWY3YThiN2RkOWJlNgoKQmVzdCByZWdhcmRzLAotLSAKS8O2cnkgTWFp
bmNlbnQsIEJvb3RsaW4KRW1iZWRkZWQgTGludXggYW5kIGtlcm5lbCBlbmdpbmVlcmluZwpodHRw
czovL2Jvb3RsaW4uY29tCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0
dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=

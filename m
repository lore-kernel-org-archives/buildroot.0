Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24B8CC02192
	for <buildroot@archiver.kernel.org>; Mon,  3 Feb 2025 13:44:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DB643812AF;
	Mon,  3 Feb 2025 13:44:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GBQCnczzflrv; Mon,  3 Feb 2025 13:44:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EAD6581346
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EAD6581346;
	Mon,  3 Feb 2025 13:44:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 84B541A1
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 13:44:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6923D81346
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 13:44:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 35_amcqNuMAQ for <buildroot@buildroot.org>;
 Mon,  3 Feb 2025 13:44:48 +0000 (UTC)
X-Greylist: delayed 8688 seconds by postgrey-1.37 at util1.osuosl.org;
 Mon, 03 Feb 2025 13:44:47 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6871D81314
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6871D81314
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=188.165.52.147;
 helo=8.mo560.mail-out.ovh.net; envelope-from=sebastien.szymanski@armadeus.com;
 receiver=<UNKNOWN> 
Received: from 8.mo560.mail-out.ovh.net (8.mo560.mail-out.ovh.net
 [188.165.52.147])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6871D81314
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 13:44:47 +0000 (UTC)
Received: from director11.ghost.mail-out.ovh.net (unknown [10.108.2.21])
 by mo560.mail-out.ovh.net (Postfix) with ESMTP id 4YmkYS539gz1FN0
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 11:19:56 +0000 (UTC)
Received: from ghost-submission-5b5ff79f4f-nf98c (unknown [10.111.174.98])
 by director11.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 4EB6A1FEEB;
 Mon,  3 Feb 2025 11:19:56 +0000 (UTC)
Received: from armadeus.com ([37.59.142.105])
 by ghost-submission-5b5ff79f4f-nf98c with ESMTPSA
 id 4jbmAFymoGfQXwAAD1u6Zg
 (envelope-from <sebastien.szymanski@armadeus.com>);
 Mon, 03 Feb 2025 11:19:56 +0000
X-OVh-ClientIp: 109.89.232.55
From: =?utf-8?q?S=C3=A9bastien_Szymanski?= <sebastien.szymanski@armadeus.com>
Date: Mon, 03 Feb 2025 12:19:36 +0100
MIME-Version: 1.0
Message-Id: <20250203-ramsmp-fix-url-v1-1-26c570b209a8@armadeus.com>
X-B4-Tracking: v=1; b=H4sIAEemoGcC/x2MSQqAMAwAv1JyNlAjovgV8VBr1IBLSVEE6d8tH
 odh5oXIKhyhMy8o3xLlPDKUhQG/umNhlCkzkKXakq1Q3R73gLM8eOmGxMRcN9SOniBHQTmrf9g
 PKX2RbqdBYAAAAA==
X-Change-ID: 20250203-ramsmp-fix-url-2e2ee5728bc2
To: buildroot@buildroot.org
X-Mailer: b4 0.14.2
X-Ovh-Tracer-Id: 11987456311531858929
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddujeegjecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecunecujfgurhephfffufggtgfgkffvvefosehtkeertdertdejnecuhfhrohhmpefurogsrghsthhivghnucfuiiihmhgrnhhskhhiuceoshgvsggrshhtihgvnhdrshiihihmrghnshhkihesrghrmhgruggvuhhsrdgtohhmqeenucggtffrrghtthgvrhhnpeefudevudeggfffudelgfekieejtdegkeeuteekhfefieevjeellefhudfggfduheenucffohhmrghinheprghlrghsihhrrdgtohhmnecukfhppeduvdejrddtrddtrddupddutdelrdekledrvdefvddrheehpdefjedrheelrddugedvrddutdehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpehsvggsrghsthhivghnrdhsiiihmhgrnhhskhhisegrrhhmrgguvghushdrtghomhdpnhgspghrtghpthhtohepuddprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdfovfetjfhoshhtpehmohehiedtmgdpmhhouggvpehsmhhtphhouhht
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 bh=uZKQBqjT3Cz67dxivDprQ8+tlPLR1CVuU2lEB5+yubw=; 
 c=relaxed/relaxed; d=armadeus.com; h=From; s=ovhmo103079-selector1;
 t=1738581596; v=1;
 b=PTDQw4Q++z6HQadayzfPz9k019JmzC8TMheaRVQJbAxga26+qLkg5kUQaN11PP4vCiaKLa4L
 3FjJ6IdLTOmYB3nANmNLUF/PDZgTMZkqRSBZzM3OhBxxk6M0LpkiffIhTjeWjEWFn2KAgx1UE3y
 PeXB5H+KeE1o2zByh0XqnvbF++OVy8KSFJlKfUPFVPluZLTh/aU/VAnv8ZligFyyqF5SLRZUwH/
 Jn28qn0WMOWPXva3QXkEtqac69raoI5jcuuiKuT9lfh0/cJTIibyALwHZWg61l4+6S23gjq3Mph
 VkS90nv7MLe5trC1uJIzmEKmLofQC0qax5qNoN0OuAskQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=armadeus.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=armadeus.com header.i=@armadeus.com header.a=rsa-sha256
 header.s=ovhmo103079-selector1 header.b=PTDQw4Q+
X-Mailman-Original-Authentication-Results: garm.ovh; auth=pass
 (GARM-105G006deaaa3b6-d1d5-4629-8dd2-b3c6136e03e9,
 42D1D123F7650646679CF9F389D148596614922C)
 smtp.auth=sebastien.szymanski@armadeus.com
Subject: [Buildroot] [PATCH] package/ramsmp: switch to a Github repo
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

VGhlIHBhY2thZ2UgaXMgbm8gbW9yZSBhdmFpbGFibGUgYXQgYWxhc2lyLmNvbS4KU29tZW9uZSBw
dXRzIHRoZSBwYWNrYWdlIG9uIGEgZ2l0aHViIHJlcG9zaXRvcnkgc28gdXNlIHRoYXQgcmVwb3Np
dG9yeS4KClNpZ25lZC1vZmYtYnk6IFPDqWJhc3RpZW4gU3p5bWFuc2tpIDxzZWJhc3RpZW4uc3p5
bWFuc2tpQGFybWFkZXVzLmNvbT4KLS0tCkkgaGF2ZSBjaGVja2VkIHRoYXQgdGhlIGNvbnRlbnQg
YXJlIHRoZSBzYW1lOgoKJCBkaWZmIC1yIHJhbXNtcC0zLjUuMC8gcmFtc3BlZWQtc21wLTZhZjMz
MzBhYTNiMTVmNmU3OWVkYTQ1ZDBhODhmZTUyNTRkNDYzNzcvCk9ubHkgaW4gcmFtc21wLTMuNS4w
LzogdGVtcAoKdGVtcCBkaXIgaXMgZW1wdHkuCi0tLQogcGFja2FnZS9yYW1zbXAvcmFtc21wLmhh
c2ggfCAxICsKIHBhY2thZ2UvcmFtc21wL3JhbXNtcC5tayAgIHwgNCArKy0tCiAyIGZpbGVzIGNo
YW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9wYWNr
YWdlL3JhbXNtcC9yYW1zbXAuaGFzaCBiL3BhY2thZ2UvcmFtc21wL3JhbXNtcC5oYXNoCmluZGV4
IGM1ZTI5YTM5MDBiMWZmYzUzYjk5ZTkwY2NkZjM2ZGQ3Y2JiMDc1ZmYuLmY2ZTdiZGJiNTZiNGIy
YzExNmEwZDkwNWM3OWRmMGVhOGZlOTA0NTYgMTAwNjQ0Ci0tLSBhL3BhY2thZ2UvcmFtc21wL3Jh
bXNtcC5oYXNoCisrKyBiL3BhY2thZ2UvcmFtc21wL3JhbXNtcC5oYXNoCkBAIC0xLDMgKzEsNCBA
QAogIyBMb2NhbGx5IGNvbXB1dGVkCitzaGEyNTYgIDIyMGYwNTYwMTlmMWRiZjg5Y2JjMDJkNTkw
MmVhNjZjYzMxYzFjYTU5ZDk3NTVmMTlhMDEzODU2MjRlNWQyM2IgIHJhbXNtcC02YWYzMzMwYWEz
YjE1ZjZlNzllZGE0NWQwYTg4ZmU1MjU0ZDQ2Mzc3LnRhci5negogc2hhMjU2ICAzOWZiMTU0OTNm
YjNjMjkzNTc1NzQ2ZDU2ZjZhYjlmYWFhMWQ4NzZkOGIxZjBkOGU1YTQwNDJkMmFjZTk1ODM5ICBy
YW1zbXAtMy41LjAudGFyLmd6CiBzaGEyNTYgIDJjMzA4Y2ZmYmFiMDE3NjJmOGY2YjExNzI1NzI1
YTIyNzA4MDc0NmVmODY1ZjI3NTZjOWM5ZTE1OTFkZGRhYWQgIExJQ0VOQ0UKZGlmZiAtLWdpdCBh
L3BhY2thZ2UvcmFtc21wL3JhbXNtcC5tayBiL3BhY2thZ2UvcmFtc21wL3JhbXNtcC5tawppbmRl
eCA2MDk4Mzc2ZGE1OTY3MjU5NjliYzQyMzQxYjY5YjA5Mzg1YTAwNzljLi5mOGRlNmM5MzZjZTIy
ZThlMDVkNmYwNDFhYzZjNGZiNTUyMTY0N2U1IDEwMDY0NAotLS0gYS9wYWNrYWdlL3JhbXNtcC9y
YW1zbXAubWsKKysrIGIvcGFja2FnZS9yYW1zbXAvcmFtc21wLm1rCkBAIC00LDggKzQsOCBAQAog
IwogIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKIAotUkFNU01QX1ZFUlNJT04gPSAzLjUuMAotUkFN
U01QX1NJVEUgPSBodHRwOi8vd3d3LmFsYXNpci5jb20vc29mdHdhcmUvcmFtc3BlZWQKK1JBTVNN
UF9WRVJTSU9OID0gNmFmMzMzMGFhM2IxNWY2ZTc5ZWRhNDVkMGE4OGZlNTI1NGQ0NjM3NworUkFN
U01QX1NJVEUgPSAkKGNhbGwgZ2l0aHViLGNydXZvbG8scmFtc3BlZWQtc21wLCQoUkFNU01QX1ZF
UlNJT04pKQogUkFNU01QX0FSQ0ggPSAkKGlmICQoQlIyX2kzODYpLGkzODYpJChpZiAkKEJSMl94
ODZfNjQpLHg4Nl82NCkKIFJBTVNNUF9MSUNFTlNFID0gQWxhc2lyIExpY2Vuc2UKIFJBTVNNUF9M
SUNFTlNFX0ZJTEVTID0gTElDRU5DRQoKLS0tCmJhc2UtY29tbWl0OiA4NTM3NmE3MTgxNGVlZmIw
MDIxMmNhYTZiMmQ1MjZmY2RkZmJiMDg0CmNoYW5nZS1pZDogMjAyNTAyMDMtcmFtc21wLWZpeC11
cmwtMmUyZWU1NzI4YmMyCgpCZXN0IHJlZ2FyZHMsCi0tIApTw6liYXN0aWVuIFN6eW1hbnNraSA8
c2ViYXN0aWVuLnN6eW1hbnNraUBhcm1hZGV1cy5jb20+CgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9v
dEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2J1aWxkcm9vdAo=

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBDDDC369B2
	for <buildroot@archiver.kernel.org>; Mon, 14 Apr 2025 12:52:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 82D3440D03;
	Mon, 14 Apr 2025 12:52:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tHYluAUMVd3L; Mon, 14 Apr 2025 12:52:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 67E3040C6D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 67E3040C6D;
	Mon, 14 Apr 2025 12:52:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4178A250
 for <buildroot@buildroot.org>; Mon, 14 Apr 2025 12:52:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2659D40C64
 for <buildroot@buildroot.org>; Mon, 14 Apr 2025 12:52:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tnaFukC_VSW2 for <buildroot@buildroot.org>;
 Mon, 14 Apr 2025 12:52:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.198;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org EDBEE40BE5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EDBEE40BE5
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EDBEE40BE5
 for <buildroot@buildroot.org>; Mon, 14 Apr 2025 12:52:03 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id AC5184398C;
 Mon, 14 Apr 2025 12:52:00 +0000 (UTC)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 14 Apr 2025 14:51:57 +0200
Message-ID: <20250414125159.1976653-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvvddtheelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhephffvvefufffkofggtgfgsehtkeertdertdejnecuhfhrohhmpefvhhhomhgrshcurfgvthgriiiiohhnihcuoehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgffhfefguefhfeffudegfedthedtudelgfeuledtgefhheejhedtudekheektdelnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdpshgrmhgsrgdrohhrghenucfkphepvdgrtddvmeekgeefgeemlehftdelmedvkedtudemfegsleemjegstghfmeehheelheemvghffegvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeekgeefgeemlehftdelmedvkedtudemfegsleemjegstghfmeehheelheemvghffegvpdhhvghlohepfihinhgushhurhhfrddrpdhmrghilhhfrhhomhepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomh
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1744635120;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Nr3uxEen4s1hfM86S8hlBapAcr91wjGmly3N2JhSMJo=;
 b=MQwvvM6wra4iyawP1nhZkm9a9nXNHvDv50vo+Gen3ZftVsTn+8E56Q4N0j/HEhgptUestB
 fTTWUfVE26VQdahmkOncJNT7nzXJ31goMAPp5Mgq+69AVJo/zynaN0ALZhPXzMVc3wO3yH
 BSWUxABVuMusavrJw7eW7Ra7XeVWBr0xZ45mJZ4kJJBissSqoRZBUeRjZsN6/CJK3GEP9K
 Az1jqhp3BZSgimPp1cBw7ze7PG/kwWG0s587KMT0GmudbWKjFFc9hoWA05fXG88Bv1NNPA
 3AeMfmu3TOzvhWtBHzOnl+hDS0Lha9cU7RGnS86nfYSwfszKiMZytjWf/QuT6Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=MQwvvM6w
Subject: [Buildroot] [PATCH] package/cifs-utils: bump to version 7.3
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

Q2hhbmdlcyA3LjEuLjcuMjoKCi0gU2VjdXJpdHkgZW5oYW5jZW1lbnRzIGluY2x1ZGluZyBzdXBw
b3J0IGZvciBwYXNzd29yZCByb3RhdGlvbiwKICBiZXR0ZXIgY3JlZGVudGlhbCBtYW5hZ2VtZW50
LCBhbmQgbmFtZXNwYWNlcwotIFZhcmlvdXMgaW1wcm92ZW1lbnRzIHRvIG1hbiBwYWdlcwoKQ2hh
bmdlcyA3LjIuLjcuMzoKCi0gVGhyZWUgZml4ZXMsIGluY2x1ZGluZyBhIGZpeCBmb3IgImd1ZXN0
IiBtb3VudCBwcm9ibGVtIGludHJvZHVjZWQKICB3aXRoIHZlcnNpb24gNy4yCgpPdXIgcGF0Y2gg
aXMgdXBzdHJlYW0gYXMgb2YgNy4yLCBzbyB3ZSBjYW4gZHJvcCBpdC4KClNpZ25lZC1vZmYtYnk6
IFRob21hcyBQZXRhenpvbmkgPHRob21hcy5wZXRhenpvbmlAYm9vdGxpbi5jb20+Ci0tLQogLi4u
bmcuYy1hZGQtbWlzc2luZy1zeXMtdHlwZXMuaC1pbmNsdWRlLnBhdGNoIHwgMzggLS0tLS0tLS0t
LS0tLS0tLS0tLQogcGFja2FnZS9jaWZzLXV0aWxzL2NpZnMtdXRpbHMuaGFzaCAgICAgICAgICAg
IHwgIDIgKy0KIHBhY2thZ2UvY2lmcy11dGlscy9jaWZzLXV0aWxzLm1rICAgICAgICAgICAgICB8
ICAyICstCiAzIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgNDAgZGVsZXRpb25zKC0p
CiBkZWxldGUgbW9kZSAxMDA2NDQgcGFja2FnZS9jaWZzLXV0aWxzLzAwMDEtY2xkYXBfcGluZy5j
LWFkZC1taXNzaW5nLXN5cy10eXBlcy5oLWluY2x1ZGUucGF0Y2gKCmRpZmYgLS1naXQgYS9wYWNr
YWdlL2NpZnMtdXRpbHMvMDAwMS1jbGRhcF9waW5nLmMtYWRkLW1pc3Npbmctc3lzLXR5cGVzLmgt
aW5jbHVkZS5wYXRjaCBiL3BhY2thZ2UvY2lmcy11dGlscy8wMDAxLWNsZGFwX3BpbmcuYy1hZGQt
bWlzc2luZy1zeXMtdHlwZXMuaC1pbmNsdWRlLnBhdGNoCmRlbGV0ZWQgZmlsZSBtb2RlIDEwMDY0
NAppbmRleCBiZjc4NjRlMDFhLi4wMDAwMDAwMDAwCi0tLSBhL3BhY2thZ2UvY2lmcy11dGlscy8w
MDAxLWNsZGFwX3BpbmcuYy1hZGQtbWlzc2luZy1zeXMtdHlwZXMuaC1pbmNsdWRlLnBhdGNoCisr
KyAvZGV2L251bGwKQEAgLTEsMzggKzAsMCBAQAotRnJvbSA2MjI5N2U5MDYxNDlmOWQyY2E3YjE4
N2E2MGY3YzVhYjk5ZWY1ZGQ1IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQotRnJvbTogVGhvbWFz
IFBldGF6em9uaSA8dGhvbWFzLnBldGF6em9uaUBib290bGluLmNvbT4KLURhdGU6IFRodSwgMjYg
RGVjIDIwMjQgMjE6Mzk6MDUgKzAxMDAKLVN1YmplY3Q6IFtQQVRDSF0gY2xkYXBfcGluZy5jOiBh
ZGQgbWlzc2luZyA8c3lzL3R5cGVzLmg+IGluY2x1ZGUKLU1JTUUtVmVyc2lvbjogMS4wCi1Db250
ZW50LVR5cGU6IHRleHQvcGxhaW47IGNoYXJzZXQ9VVRGLTgKLUNvbnRlbnQtVHJhbnNmZXItRW5j
b2Rpbmc6IDhiaXQKLQotRml4ZXM6Ci0KLWNsZGFwX3BpbmcuYzogSW4gZnVuY3Rpb24g4oCYcmVh
ZF9kbnNfc3RyaW5n4oCZOgotY2xkYXBfcGluZy5jOjcyOjM3OiBlcnJvcjog4oCYdV9jaGFy4oCZ
IHVuZGVjbGFyZWQgKGZpcnN0IHVzZSBpbiB0aGlzIGZ1bmN0aW9uKQotCi13aGVuIGJ1aWxkaW5n
IHdpdGggdGhlIG11c2wgQyBsaWJyYXJ5LCBidXQgZXZlbiB3aXRoIGdsaWJjIHVfY2hhciBpcwot
ZGVmaW5lZCBpbiA8c3lzL3R5cGVzLmg+LCBpdCBoYXBwZW5zIHRvIHdvcmsgd2l0aCBnbGliYyA8
c3lzL3R5cGVzLmg+Ci1nZXRzIGluY2x1ZGVkIGJ5IGFub3RoZXIgaGVhZGVyLgotCi1TaWduZWQt
b2ZmLWJ5OiBUaG9tYXMgUGV0YXp6b25pIDx0aG9tYXMucGV0YXp6b25pQGJvb3RsaW4uY29tPgot
VXBzdHJlYW06IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LWNpZnMvMjAyNDEyMjYyMDQy
MzUuMjMxMTM3MS0xLXRob21hcy5wZXRhenpvbmlAYm9vdGxpbi5jb20vCi0tLS0KLSBjbGRhcF9w
aW5nLmMgfCAxICsKLSAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKLQotZGlmZiAtLWdp
dCBhL2NsZGFwX3BpbmcuYyBiL2NsZGFwX3BpbmcuYwotaW5kZXggOTE4M2IyNy4uYTYwM2JlMyAx
MDA2NDQKLS0tLSBhL2NsZGFwX3BpbmcuYwotKysrIGIvY2xkYXBfcGluZy5jCi1AQCAtMjAsNiAr
MjAsNyBAQAotICNpbmNsdWRlIDx0YWxsb2MuaD4KLSAjaW5jbHVkZSA8c3RyaW5nLmg+Ci0gI2lu
Y2x1ZGUgPHN5cy9zb2NrZXQuaD4KLSsjaW5jbHVkZSA8c3lzL3R5cGVzLmg+Ci0gI2luY2x1ZGUg
PGFycGEvaW5ldC5oPgotICNpbmNsdWRlIDx1bmlzdGQuaD4KLSAjaW5jbHVkZSA8cmVzb2x2Lmg+
Ci0tLSAKLTIuNDcuMAotCmRpZmYgLS1naXQgYS9wYWNrYWdlL2NpZnMtdXRpbHMvY2lmcy11dGls
cy5oYXNoIGIvcGFja2FnZS9jaWZzLXV0aWxzL2NpZnMtdXRpbHMuaGFzaAppbmRleCA5NDJmOGFh
YTM5Li5lYTMyZDRkY2E3IDEwMDY0NAotLS0gYS9wYWNrYWdlL2NpZnMtdXRpbHMvY2lmcy11dGls
cy5oYXNoCisrKyBiL3BhY2thZ2UvY2lmcy11dGlscy9jaWZzLXV0aWxzLmhhc2gKQEAgLTEsNSAr
MSw1IEBACiAjIExvY2FsbHkgY2FsY3VsYXRlZCBhZnRlciBjaGVja2luZyBwZ3Agc2lnbmF0dXJl
Ci1zaGEyNTYgIGEyMTEyM2Y3NmE0YTZhMzZjOTY1MzE4OWJhNDkxOGViZGYzY2ZjZDNmOTA5Mjcz
MGE0N2ZmMzQ1MGI1YjViMmEgIGNpZnMtdXRpbHMtNy4xLnRhci5iejIKK3NoYTI1NiAgYzRlMWVi
NWY0YWQ4ODBkOTZlMTZkOTVhMWNkYmM3ZWM5NzhhYjUxYzViNmQ4YTIwYWUwOWRhYzYzOGYzNmRk
NSAgY2lmcy11dGlscy03LjMudGFyLmJ6MgogCiAjIEhhc2ggZm9yIGxpY2Vuc2UgZmlsZToKIHNo
YTI1NiAgOGNlYjRiOWVlNWFkZWRkZTQ3YjMxZTk3NWMxZDkwYzczYWQyN2I2YjE2NWExZGNkODBj
N2M1NDVlYjY1YjkwMyAgQ09QWUlORwpkaWZmIC0tZ2l0IGEvcGFja2FnZS9jaWZzLXV0aWxzL2Np
ZnMtdXRpbHMubWsgYi9wYWNrYWdlL2NpZnMtdXRpbHMvY2lmcy11dGlscy5tawppbmRleCBlOGVl
ZmRlMjc1Li45YzAyOTM0MmViIDEwMDY0NAotLS0gYS9wYWNrYWdlL2NpZnMtdXRpbHMvY2lmcy11
dGlscy5taworKysgYi9wYWNrYWdlL2NpZnMtdXRpbHMvY2lmcy11dGlscy5tawpAQCAtNCw3ICs0
LDcgQEAKICMKICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCiAKLUNJRlNfVVRJTFNfVkVSU0lPTiA9
IDcuMQorQ0lGU19VVElMU19WRVJTSU9OID0gNy4zCiBDSUZTX1VUSUxTX1NPVVJDRSA9IGNpZnMt
dXRpbHMtJChDSUZTX1VUSUxTX1ZFUlNJT04pLnRhci5iejIKIENJRlNfVVRJTFNfU0lURSA9IGh0
dHA6Ly9mdHAuc2FtYmEub3JnL3B1Yi9saW51eC1jaWZzL2NpZnMtdXRpbHMKIENJRlNfVVRJTFNf
TElDRU5TRSA9IEdQTC0zLjArCi0tIAoyLjQ5LjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1
aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8v
YnVpbGRyb290Cg==

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4805BE77188
	for <buildroot@archiver.kernel.org>; Fri, 20 Dec 2024 15:15:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F0DD1607D2;
	Fri, 20 Dec 2024 15:15:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FN1RibmXNzpg; Fri, 20 Dec 2024 15:15:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0BCFC60B91
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0BCFC60B91;
	Fri, 20 Dec 2024 15:15:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id A4B5D920
 for <buildroot@buildroot.org>; Fri, 20 Dec 2024 15:15:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7107E409FB
 for <buildroot@buildroot.org>; Fri, 20 Dec 2024 15:15:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QWxWAkx8NDBx for <buildroot@buildroot.org>;
 Fri, 20 Dec 2024 15:15:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.140.110.172;
 helo=foss.arm.com; envelope-from=vincent.stehle@arm.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4F01F409F2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4F01F409F2
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4F01F409F2
 for <buildroot@buildroot.org>; Fri, 20 Dec 2024 15:15:36 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E1BE31480;
 Fri, 20 Dec 2024 07:16:03 -0800 (PST)
Received: from localhost.localdomain (unknown [10.57.0.16])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 4015F3F528;
 Fri, 20 Dec 2024 07:15:35 -0800 (PST)
From: =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@arm.com>
To: buildroot@buildroot.org
Cc: =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@arm.com>,
 =?UTF-8?q?=C3=89tienne=20Carri=C3=A8re?= <etienne.carriere@foss.st.com>
Date: Fri, 20 Dec 2024 16:15:31 +0100
Message-ID: <20241220151531.59770-1-vincent.stehle@arm.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=arm.com
Subject: [Buildroot] [PATCH] boot/optee-os: add custom version option
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

QWRkIGN1c3RvbSB2ZXJzaW9uIG9wdGlvbiwgdG8gZW5hYmxlIGVhc2lseSBzcGVjaWZ5aW5nIGFu
IG9mZmljaWFsIE9QLVRFRQp2ZXJzaW9uIHRvIHVzZS4KVGhpcyBpcyBzaW1pbGFyIHRvIHdoYXQg
aXMgZG9uZSBpbiBvdGhlciBwYWNrYWdlcywgc3VjaCBhcyBsaW51eCwgdWJvb3Qgb3IKYXJtLXRy
dXN0ZWQtZmlybXdhcmUuCgpTaWduZWQtb2ZmLWJ5OiBWaW5jZW50IFN0ZWhsw6kgPHZpbmNlbnQu
c3RlaGxlQGFybS5jb20+CkNjOiDDiXRpZW5uZSBDYXJyacOocmUgPGV0aWVubmUuY2FycmllcmVA
Zm9zcy5zdC5jb20+Ci0tLQoKSGksCgpOb3RlIHRoYXQsIHVubGlrZSB3aGF0IGlzIGRvbmUgaW4g
YXJtLXRydXN0ZWQtZmlybXdhcmUsIGJ1aWxkaW5nIHdpdGgKQlIyX0RPV05MT0FEX0ZPUkNFX0NI
RUNLX0hBU0hFUz15IGFuZCBCUjJfVEFSR0VUX09QVEVFX09TX0NVU1RPTV9WRVJTSU9OPXksCmFu
ZCBub3Qgc3VwcGx5aW5nIGEgaGFzaCB3aWxsIGZhaWwuCkkgdGhpbmsgdGhpcyBpcyB3aGF0IHdl
IHdhbnQsIGJ1dCBkbyBub3QgaGVzaXRhdGUgdG8gbGV0IG1lIGtub3cgaWYgeW91CndvdWxkIHBy
ZWZlciB0byBtYWtlIGFuIGV4Y2VwdGlvbiAod2l0aCBCUl9OT19DSEVDS19IQVNIX0ZPUikgaW4g
YWxsIHRoZQpjYXNlcyB3aGVyZSB3ZSB1c2UgYSBjdXN0b20gdmVyc2lvbiwgYW5kIEkgd2lsbCBy
ZXNwaW4gdGhlIHBhdGNoLgoKVGhpcyB3YXMgYm9vdC10ZXN0ZWQgd2l0aCB0aGUgZm9sbG93aW5n
IGRlZmNvbmZpZ3MgKG1vZGlmaWVkIGxvY2FsbHkgdG8gdXNlCk9QLVRFRSA0LjQuMCk6Ci0gYXJt
X2Z2cF9lYmJyCi0gcWVtdV9hYXJjaDY0X2ViYnIKLSBxZW11X2FybV9lYmJyCi0gcWVtdV9hcm1f
dmV4cHJlc3NfdHoKCkFsc28sIHRoaXMgd2FzIGJ1aWxkLXRlc3RlZCB3aXRoIHRoZSBmb2xsb3dp
bmcgZGVmY29uZmlncyAobW9kaWZpZWQgbG9jYWxseQp0byB1c2UgT1AtVEVFIDQuNC4wKToKLSBi
ZWFnbGVib25lYWk2NAotIGJlYWdsZXBsYXkKLSB0aV9hbTYyYXhfc2sKLSB0aV9hbTYycHhfc2sK
LSB0aV9hbTYyeF9zawotIHRpX2FtNjR4X3NrCgpGaW5hbGx5LCB0aGlzIHdhcyB0ZXN0ZWQgd2l0
aCB0ZXN0cy5ib290LnRlc3Rfb3B0ZWVfb3MuVGVzdE9wdGVlIChtb2RpZmllZApsb2NhbGx5IHRv
IHVzZSBPUC1URUUgNC40LjApLgoKKE5vdGUgdGhhdCB0byBidWlsZCBPUC1URUUgNC40LjAgaW4g
dGhlIGRlZmNvbmZpZ3MgYW5kIHRlc3QsCkJSMl9UQVJHRVRfT1BURUVfT1NfTkVFRFNfUFlUSE9O
X0NSWVBUT0dSQVBIWT15IGlzIGFsc28gbmVjZXNzYXJ5LikKCkhhdmUgYSBuaWNlIENocmlzdG1h
cyBicmVhaywKVmluY2VudC4KCiBib290L29wdGVlLW9zL0NvbmZpZy5pbiB8IDExICsrKysrKysr
KysrCiAxIGZpbGUgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2Jvb3Qv
b3B0ZWUtb3MvQ29uZmlnLmluIGIvYm9vdC9vcHRlZS1vcy9Db25maWcuaW4KaW5kZXggY2MwMDQ0
ZjAwYS4uNmM0YWZjY2M3YSAxMDA2NDQKLS0tIGEvYm9vdC9vcHRlZS1vcy9Db25maWcuaW4KKysr
IGIvYm9vdC9vcHRlZS1vcy9Db25maWcuaW4KQEAgLTI1LDYgKzI1LDExIEBAIGNvbmZpZyBCUjJf
VEFSR0VUX09QVEVFX09TX0xBVEVTVAogCSAgVXNlIHRoZSBsYXRlc3QgcmVsZWFzZSB0YWcgZnJv
bSB0aGUgT1AtVEVFIE9TIG9mZmljaWFsIEdpdAogCSAgcmVwb3NpdG9yeS4KIAorY29uZmlnIEJS
Ml9UQVJHRVRfT1BURUVfT1NfQ1VTVE9NX1ZFUlNJT04KKwlib29sICJDdXN0b20gdmVyc2lvbiIK
KwloZWxwCisJICBUaGlzIG9wdGlvbiBhbGxvd3MgdG8gdXNlIGEgc3BlY2lmaWMgb2ZmaWNpYWwg
dmVyc2lvbgorCiBjb25maWcgQlIyX1RBUkdFVF9PUFRFRV9PU19DVVNUT01fVEFSQkFMTAogCWJv
b2wgIkN1c3RvbSB0YXJiYWxsIgogCWhlbHAKQEAgLTQzLDYgKzQ4LDEwIEBAIGNvbmZpZyBCUjJf
VEFSR0VUX09QVEVFX09TX0NVU1RPTV9HSVQKIAogZW5kY2hvaWNlCiAKK2NvbmZpZyBCUjJfVEFS
R0VUX09QVEVFX09TX0NVU1RPTV9WRVJTSU9OX1ZBTFVFCisJc3RyaW5nICJPUC1URUUgdmVyc2lv
biIKKwlkZXBlbmRzIG9uIEJSMl9UQVJHRVRfT1BURUVfT1NfQ1VTVE9NX1ZFUlNJT04KKwogaWYg
QlIyX1RBUkdFVF9PUFRFRV9PU19DVVNUT01fVEFSQkFMTAogCiBjb25maWcgQlIyX1RBUkdFVF9P
UFRFRV9PU19DVVNUT01fVEFSQkFMTF9MT0NBVElPTgpAQCAtNzEsNiArODAsOCBAQCBlbmRpZgog
Y29uZmlnIEJSMl9UQVJHRVRfT1BURUVfT1NfVkVSU0lPTgogCXN0cmluZwogCWRlZmF1bHQgIjQu
My4wIgkJaWYgQlIyX1RBUkdFVF9PUFRFRV9PU19MQVRFU1QKKwlkZWZhdWx0IEJSMl9UQVJHRVRf
T1BURUVfT1NfQ1VTVE9NX1ZFUlNJT05fVkFMVUUgXAorCQlpZiBCUjJfVEFSR0VUX09QVEVFX09T
X0NVU1RPTV9WRVJTSU9OCiAJZGVmYXVsdCAiY3VzdG9tIglpZiBCUjJfVEFSR0VUX09QVEVFX09T
X0NVU1RPTV9UQVJCQUxMCiAJZGVmYXVsdCBCUjJfVEFSR0VUX09QVEVFX09TX0NVU1RPTV9SRVBP
X1ZFUlNJT04gXAogCQkJCWlmIEJSMl9UQVJHRVRfT1BURUVfT1NfQ1VTVE9NX0dJVAotLSAKMi40
NS4yCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWls
ZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMu
YnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=

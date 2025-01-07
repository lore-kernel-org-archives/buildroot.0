Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85ECBE77197
	for <buildroot@archiver.kernel.org>; Tue,  7 Jan 2025 14:21:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 33384403FB;
	Tue,  7 Jan 2025 14:21:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oDxQaCjT6q6n; Tue,  7 Jan 2025 14:21:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3330D40530
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3330D40530;
	Tue,  7 Jan 2025 14:21:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id D71196B
 for <buildroot@buildroot.org>; Tue,  7 Jan 2025 14:21:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D26BF80BC4
 for <buildroot@buildroot.org>; Tue,  7 Jan 2025 14:21:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t-QZNP3_MjMm for <buildroot@buildroot.org>;
 Tue,  7 Jan 2025 14:21:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.140.110.172;
 helo=foss.arm.com; envelope-from=vincent.stehle@arm.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 88DE58084F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 88DE58084F
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp1.osuosl.org (Postfix) with ESMTP id 88DE58084F
 for <buildroot@buildroot.org>; Tue,  7 Jan 2025 14:21:13 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 732411424;
 Tue,  7 Jan 2025 06:21:41 -0800 (PST)
Received: from localhost.localdomain (unknown [10.34.128.62])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B58383F59E;
 Tue,  7 Jan 2025 06:21:12 -0800 (PST)
From: =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@arm.com>
To: buildroot@buildroot.org
Cc: =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@arm.com>,
 Christoph Muellner <christoph.muellner@theobroma-systems.com>
Date: Tue,  7 Jan 2025 15:21:09 +0100
Message-ID: <20250107142109.1308899-1-vincent.stehle@arm.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=arm.com
Subject: [Buildroot] [PATCH] boot/uboot: add support for embedded TEE in
 binary format
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

V2UgY2FuIGVtYmVkIGEgVEVFIGluIEVMRiBmb3JtYXQgaW50byBVLUJvb3QsIGJ1dCB2ZXJzaW9u
cyBvZiBPUC1URUUgc2luY2UKMy44LjAgbXVzdCBiZSBlbWJlZGRlZCBpbiBiaW5hcnkgZm9ybWF0
LCBhcyB0aGUgdGVlLmJpbiBjb250YWlucyBpbXBvcnRhbnQKbWV0YS1kYXRhLiBbMV0KClVwZGF0
ZSB0aGUgY29uZmlndXJhdGlvbiBtZW51IGFuZCB0aGUgTWFrZWZpbGUgdG8gYWxsb3cgc2VsZWN0
aW5nIHRvCmVtYmVkIGVpdGhlciB0ZWUuZWxmIG9yIHRlZS5iaW4uCgpCeSBkZWZhdWx0LCBlbWJl
ZCB0aGUgVEVFIGluIEVMRiBmb3JtYXQgdG8gc3RheSBjb21wYXRpYmxlIHdpdGggZXhpc3RpbmcK
Y29uZmlndXJhdGlvbnMuCgpbMV0gaHR0cHM6Ly9naXRodWIuY29tL09QLVRFRS9vcHRlZV9vcy9p
c3N1ZXMvNDU0MgoKU2lnbmVkLW9mZi1ieTogVmluY2VudCBTdGVobMOpIDx2aW5jZW50LnN0ZWhs
ZUBhcm0uY29tPgpDYzogQ2hyaXN0b3BoIE11ZWxsbmVyIDxjaHJpc3RvcGgubXVlbGxuZXJAdGhl
b2Jyb21hLXN5c3RlbXMuY29tPgotLS0KCgpIaSwKClRoaXMgcGF0Y2ggaXMgdXNlZnVsIHdoZW4g
ZW1iZWRkaW5nIE9QLVRFRSBpbiBVLUJvb3QsIHdoZXJlIHdlIHNob3VsZCB1c2UKdGhlIFRFRSBp
biBiaW5hcnkgZm9ybWF0IHdpdGggT1AtVEVFIHZlcnNpb25zID49IDMuOC4wLgoKVG8gdHJ5IG9u
IFJPQ0tQcm82NCwgc3RhcnQgZnJvbSByb2NrcHJvNjRfZGVmY29uZmlnLCB0aGVuIGFkZDoKCkJS
Ml9UQVJHRVRfT1BURUVfT1M9eQpCUjJfVEFSR0VUX09QVEVFX09TX05FRURTX0RUQz15CkJSMl9U
QVJHRVRfT1BURUVfT1NfUExBVEZPUk09InJvY2tjaGlwLXJrMzM5OSIKQlIyX1RBUkdFVF9VQk9P
VF9ORUVEU19PUFRFRV9URUU9eQpCUjJfVEFSR0VUX1VCT09UX05FRURTX09QVEVFX1RFRV9CSU49
eQoKRmluYWxseSwgYWRkIGEgVS1Cb290IGNvbmZpZyBmcmFnbWVudCB3aXRoOgoKQ09ORklHX1RF
RT15CkNPTkZJR19PUFRFRV9MSUI9eQpDT05GSUdfT1BURUVfVFpEUkFNX1NJWkU9MHgwMjAwMDAw
MAoKVGhlIGZvbGxvd2luZyBtZXNzYWdlIHdpbGwgYmUgcHJpbnRlZCBkdXJpbmcgYm9vdDoKCiMj
IENoZWNraW5nIGhhc2goZXMpIGZvciBJbWFnZSB0ZWUtMSAuLi4gc2hhMjU2KyBPSwoKVGhlbiB0
aGUgc3lzdGVtIHdpbGwgYm9vdC4KCkp1c3QgaW4gY2FzZSwgSSBjb3VsZCBhbHNvIHZlcmlmeSB0
aGF0IGFkZGluZyB0aGlzIHBhdGNoIGRvZXMgbm90IGJyZWFrIHRoZQpidWlsZCBmb3IgdGhlIGZv
bGxvd2luZyBkZWZjb25maWdzLCB3aGljaCBoYXZlIE9QLVRFRSBhbmQgVS1Cb290OgoKYXJtX2Z2
cF9lYmJyCmJlYWdsZWJvbmVhaTY0CmJlYWdsZXBsYXkKcWVtdV9hYXJjaDY0X2ViYnIKcWVtdV9h
cm1fZWJicgpxZW11X2FybV92ZXhwcmVzc190egp0aV9hbTYyYXhfc2sKdGlfYW02MnB4X3NrCnRp
X2FtNjJ4X3NrCnRpX2FtNjR4X3NrCgpCZXN0IHJlZ2FyZHMsIGFuZCBoYXBweSBuZXcgeWVhciEK
VmluY2VudC4KCgogYm9vdC91Ym9vdC9Db25maWcuaW4gfCAyNiArKysrKysrKysrKysrKysrKysr
KysrKysrLQogYm9vdC91Ym9vdC91Ym9vdC5tayAgfCAgNCArKysrCiAyIGZpbGVzIGNoYW5nZWQs
IDI5IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9ib290L3Vib290
L0NvbmZpZy5pbiBiL2Jvb3QvdWJvb3QvQ29uZmlnLmluCmluZGV4IDg2NDhkNmViN2UuLmY2ODIz
ZDUzN2IgMTAwNjQ0Ci0tLSBhL2Jvb3QvdWJvb3QvQ29uZmlnLmluCisrKyBiL2Jvb3QvdWJvb3Qv
Q29uZmlnLmluCkBAIC0yNzQsNyArMjc0LDMxIEBAIGNvbmZpZyBCUjJfVEFSR0VUX1VCT09UX05F
RURTX09QVEVFX1RFRQogCSAgU29tZSBwbGF0Zm9ybXMgKHN1Y2ggYXMgUm9ja2NoaXApIGVuY2Fw
c3VsYXRlIHRoZSBURUUgaW5zaWRlCiAJICBVLUJvb3QuIFRoaXMgb3B0aW9uIG1ha2VzIHN1cmUg
b3B0ZWUtb3MgZ2V0cyBidWlsdCBwcmlvciB0bwogCSAgVS1Cb290LCBhbmQgdGhhdCB0aGUgVEVF
IHZhcmlhYmxlIHBvaW50aW5nIHRvIE9QVEVFJ3MKLQkgIHRlZS5lbGYsIGlzIHBhc3NlZCBkdXJp
bmcgdGhlIEJ1aWxkcm9vdCBidWlsZC4KKwkgIGNvcmUgZmlsZSwgaXMgcGFzc2VkIGR1cmluZyB0
aGUgQnVpbGRyb290IGJ1aWxkLgorCitjaG9pY2UKKwlwcm9tcHQgIlUtQm9vdCBPUFRFRSBURUUg
Zm9ybWF0IgorCWRlZmF1bHQgQlIyX1RBUkdFVF9VQk9PVF9ORUVEU19PUFRFRV9URUVfRUxGCisJ
ZGVwZW5kcyBvbiBCUjJfVEFSR0VUX1VCT09UX05FRURTX09QVEVFX1RFRQorCWhlbHAKKwkgIFNl
bGVjdCB0aGUgVEVFIGZvcm1hdC4KKwkgIFlvdSBtYXkgc2VsZWN0IHRoZSBURUUgaW4gRUxGIGZv
cm1hdCBvbmx5IGZvciBPUC1URUUKKwkgIHZlcnNpb25zIGJlZm9yZSAzLjguMC4KKwkgIFNpbmNl
IHRoaXMgdmVyc2lvbiwgdGhlIFRFRSBpbiBiaW5hcnkgZm9ybWF0IG11c3QgYmUgdXNlZCBhcwor
CSAgaXQgY29udGFpbnMgaW1wb3J0YW50IG1ldGEtZGF0YS4KKworY29uZmlnIEJSMl9UQVJHRVRf
VUJPT1RfTkVFRFNfT1BURUVfVEVFX0VMRgorCWJvb2wgInRlZS5lbGYiCisJaGVscAorCSAgRUxG
IGZvcm1hdCBtYXkgYmUgdXNlZCBvbmx5IGZvciBPUC1URUUgdmVyc2lvbnMgYmVmb3JlCisJICAz
LjguMC4KKworY29uZmlnIEJSMl9UQVJHRVRfVUJPT1RfTkVFRFNfT1BURUVfVEVFX0JJTgorCWJv
b2wgInRlZS5iaW4iCisJaGVscAorCSAgQmluYXJ5IGZvcm1hdCBtdXN0IGJlIHVzZWQgZm9yIE9Q
LVRFRSB2ZXJzaW9ucyBzaW5jZSAzLjguMC4KKworZW5kY2hvaWNlCiAKIGNvbmZpZyBCUjJfVEFS
R0VUX1VCT09UX05FRURTX09QRU5TQkkKIAlib29sICJVLUJvb3QgbmVlZHMgT3BlblNCSSIKZGlm
ZiAtLWdpdCBhL2Jvb3QvdWJvb3QvdWJvb3QubWsgYi9ib290L3Vib290L3Vib290Lm1rCmluZGV4
IGQ4ZmFlZjY0OGYuLmIzMDk0MDI5ZTcgMTAwNjQ0Ci0tLSBhL2Jvb3QvdWJvb3QvdWJvb3QubWsK
KysrIGIvYm9vdC91Ym9vdC91Ym9vdC5tawpAQCAtMTk2LDcgKzE5NiwxMSBAQCBlbmRpZgogCiBp
ZmVxICgkKEJSMl9UQVJHRVRfVUJPT1RfTkVFRFNfT1BURUVfVEVFKSx5KQogVUJPT1RfREVQRU5E
RU5DSUVTICs9IG9wdGVlLW9zCitpZmVxICgkKEJSMl9UQVJHRVRfVUJPT1RfTkVFRFNfT1BURUVf
VEVFX0VMRikseSkKIFVCT09UX01BS0VfT1BUUyArPSBURUU9JChCSU5BUklFU19ESVIpL3RlZS5l
bGYKK2Vsc2UgaWZlcSAoJChCUjJfVEFSR0VUX1VCT09UX05FRURTX09QVEVFX1RFRV9CSU4pLHkp
CitVQk9PVF9NQUtFX09QVFMgKz0gVEVFPSQoQklOQVJJRVNfRElSKS90ZWUuYmluCitlbmRpZgog
ZW5kaWYKIAogIyBUSSBLMyBkZXZpY2VzIG5lZWRzIGF0IGxlYXN0IHRpLXN5c2Z3IChTeXN0ZW0g
RmlybXdhcmUpIHByb3ZpZGVkCi0tIAoyLjQ1LjIKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1
aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8v
YnVpbGRyb290Cg==

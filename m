Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 261D5E7717F
	for <buildroot@archiver.kernel.org>; Mon, 16 Dec 2024 09:04:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D61E440B3D;
	Mon, 16 Dec 2024 09:04:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Li_uguxacwdq; Mon, 16 Dec 2024 09:04:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 906EE40B47
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 906EE40B47;
	Mon, 16 Dec 2024 09:04:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 029E6C5
 for <buildroot@buildroot.org>; Mon, 16 Dec 2024 09:04:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E3F9F840EE
 for <buildroot@buildroot.org>; Mon, 16 Dec 2024 09:04:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NTGfnmbHc9id for <buildroot@buildroot.org>;
 Mon, 16 Dec 2024 09:04:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.140.110.172;
 helo=foss.arm.com; envelope-from=vincent.stehle@arm.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org F0AB1840C6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F0AB1840C6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp1.osuosl.org (Postfix) with ESMTP id F0AB1840C6
 for <buildroot@buildroot.org>; Mon, 16 Dec 2024 09:04:26 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B3876113E;
 Mon, 16 Dec 2024 01:04:53 -0800 (PST)
Received: from localhost.localdomain (unknown [10.34.124.42])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id F1D293F720;
 Mon, 16 Dec 2024 01:04:24 -0800 (PST)
From: =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@arm.com>
To: buildroot@buildroot.org
Date: Mon, 16 Dec 2024 10:04:21 +0100
Message-ID: <20241216090421.2867204-1-vincent.stehle@arm.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=arm.com
Subject: [Buildroot] [PATCH] boot/arm-trusted-firmware: bump to v2.12
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
Cc: =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@arm.com>,
 Sergey Matyukevich <geomatsi@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VXBkYXRlIHRydXN0ZWQtZmlybXdhcmUtYSB2ZXJzaW9uIHRvIHYyLjEyIGFuZCBhZGQgYSBoYXNo
IGZpbGUgYWNjb3JkaW5nbHkuCgpDb21wYXJlZCB0byB2Mi4xMSwgdGhlIGxpY2Vuc2UgaGFzIGNo
YW5nZWQgd2l0aCB0aGUgYWRkaXRpb25hbCBtZW50aW9uIG9mCmZpbGVzIGZyb20gdGhlIHB5ZGV2
aWNldHJlZSBwcm9qZWN0IHVuZGVyIEFwYWNoZSAyLjAgbGljZW5zZS4KQXMgd2Ugb25seSBkb2N1
bWVudCB0aGUgbWFpbiBsaWNlbnNlIG9mIFRGLUEsIEJTRC0zLUNsYXVzZSwgdGhpcyBjaGFuZ2Ug
aGFzCm5vIGltcGFjdCBmb3IgdXMuCgpTaWduZWQtb2ZmLWJ5OiBWaW5jZW50IFN0ZWhsw6kgPHZp
bmNlbnQuc3RlaGxlQGFybS5jb20+CkNjOiBEaWNrIE9sc3NvbiA8aGlAc2VuemlsbGEuaW8+CkNj
OiBTZXJnZXkgTWF0eXVrZXZpY2ggPGdlb21hdHNpQGdtYWlsLmNvbT4KLS0tCgpIaSwKCkFmdGVy
IGRvaW5nIHNvbWUgdGVzdGluZywgSSB0aGluayBpdCBpcyBzYWZlIHRvIGJ1bXAgb3VyIGRlZmF1
bHQgdmVyc2lvbiBvZgpURi1BIHRvIHYyLjEyLgoKVGVzdGVkIG9rIHdpdGggdGhlIGZvbGxvd2lu
ZyBweXRob24gdGVzdHMgKG1vZGlmaWVkIGxvY2FsbHkgdG8gdXNlIFRGLUEKdjIuMTIpOgotIHRl
c3RzLmJvb3QudGVzdF9hdGYuVGVzdEFURkFsbHdpbm5lciAobm90ZTogdGhpcyB0ZXN0IGlzIGJ1
aWxkIG9ubHkpCi0gdGVzdHMuYm9vdC50ZXN0X2VkazIuVGVzdEVkazIKLSB0ZXN0cy5ib290LnRl
c3Rfb3B0ZWVfb3MuVGVzdE9wdGVlCi0gdGVzdHMucGFja2FnZS50ZXN0X2Z3dHMuVGVzdEZ3dHMK
CkJvb3QtdGVzdGVkIG9rIHdpdGggdGhlIGZvbGxvd2luZyBkZWZjb25maWdzIChtb2RpZmllZCBs
b2NhbGx5IHRvIHVzZSBURi1BCnYyLjEyKToKLSBhcm1fZnZwX2ViYnIKLSBxZW11X2FhcmNoNjRf
ZWJicgotIHFlbXVfYWFyY2g2NF9zYnNhCi0gcWVtdV9hcm1fZWJicgotIHFlbXVfYXJtX3ZleHBy
ZXNzX3R6Ci0gcm9ja3BybzY0CgpCdWlsZC10ZXN0ZWQgb2sgd2l0aCB0aGUgZm9sbG93aW5nIGRl
ZmNvbmZpZ3MgKG1vZGlmaWVkIGxvY2FsbHkgdG8gdXNlIFRGLUEKdjIuMTIpOgotIGlteDhtbl9i
c2hfc21tX3MyCi0gaW14OG1uX2JzaF9zbW1fczJfcHJvCi0ga29udHJvbl9ibF9pbXg4bW0KLSBv
bGltZXhfYTY0X29saW51eGlubwotIG9yYW5nZXBpX3BjMgotIG9yYW5nZXBpX3plcm8ydwotIG9y
YW5nZXBpX3plcm9fcGx1cwotIHBpbmU2NAotIHJvY19wY19yazMzOTkKLSBzdG0zMm1wMTU3YV9k
azEKLSBzdG0zMm1wMTU3Y19kazIKLSBzdG0zMm1wMTU3Y19vZHlzc2V5CgpCZXN0IHJlZ2FyZHMs
ClZpbmNlbnQuCgogYm9vdC9hcm0tdHJ1c3RlZC1maXJtd2FyZS9Db25maWcuaW4gICAgICAgICAg
ICAgICAgICAgICAgIHwgNCArKy0tCiBib290L2FybS10cnVzdGVkLWZpcm13YXJlL3YyLjEyL2Fy
bS10cnVzdGVkLWZpcm13YXJlLmhhc2ggfCAzICsrKwogMiBmaWxlcyBjaGFuZ2VkLCA1IGluc2Vy
dGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCiBjcmVhdGUgbW9kZSAxMDA2NDQgYm9vdC9hcm0tdHJ1
c3RlZC1maXJtd2FyZS92Mi4xMi9hcm0tdHJ1c3RlZC1maXJtd2FyZS5oYXNoCgpkaWZmIC0tZ2l0
IGEvYm9vdC9hcm0tdHJ1c3RlZC1maXJtd2FyZS9Db25maWcuaW4gYi9ib290L2FybS10cnVzdGVk
LWZpcm13YXJlL0NvbmZpZy5pbgppbmRleCA0YTVjN2RjODljLi5jOGRlZWRlOWNkIDEwMDY0NAot
LS0gYS9ib290L2FybS10cnVzdGVkLWZpcm13YXJlL0NvbmZpZy5pbgorKysgYi9ib290L2FybS10
cnVzdGVkLWZpcm13YXJlL0NvbmZpZy5pbgpAQCAtMTQsNyArMTQsNyBAQCBjaG9pY2UKIAkgIFNl
bGVjdCB0aGUgc3BlY2lmaWMgQVRGIHZlcnNpb24geW91IHdhbnQgdG8gdXNlCiAKIGNvbmZpZyBC
UjJfVEFSR0VUX0FSTV9UUlVTVEVEX0ZJUk1XQVJFX0xBVEVTVF9WRVJTSU9OCi0JYm9vbCAidjIu
MTEiCisJYm9vbCAidjIuMTIiCiAKIGNvbmZpZyBCUjJfVEFSR0VUX0FSTV9UUlVTVEVEX0ZJUk1X
QVJFX0xBVEVTVF9MVFNfMl8xMF9WRVJTSU9OCiAJYm9vbCAibGF0ZXN0IGx0cy12Mi4xMC54IgpA
QCAtNTIsNyArNTIsNyBAQCBjb25maWcgQlIyX1RBUkdFVF9BUk1fVFJVU1RFRF9GSVJNV0FSRV9D
VVNUT01fVkVSU0lPTl9WQUxVRQogCiBjb25maWcgQlIyX1RBUkdFVF9BUk1fVFJVU1RFRF9GSVJN
V0FSRV9WRVJTSU9OCiAJc3RyaW5nCi0JZGVmYXVsdCAidjIuMTEiCQlpZiBCUjJfVEFSR0VUX0FS
TV9UUlVTVEVEX0ZJUk1XQVJFX0xBVEVTVF9WRVJTSU9OCisJZGVmYXVsdCAidjIuMTIiCQlpZiBC
UjJfVEFSR0VUX0FSTV9UUlVTVEVEX0ZJUk1XQVJFX0xBVEVTVF9WRVJTSU9OCiAJZGVmYXVsdCAi
bHRzLXYyLjEwLjUiCWlmIEJSMl9UQVJHRVRfQVJNX1RSVVNURURfRklSTVdBUkVfTEFURVNUX0xU
U18yXzEwX1ZFUlNJT04KIAlkZWZhdWx0ICJsdHMtdjIuOC4yMCIJaWYgQlIyX1RBUkdFVF9BUk1f
VFJVU1RFRF9GSVJNV0FSRV9MQVRFU1RfTFRTXzJfOF9WRVJTSU9OCiAJZGVmYXVsdCAiY3VzdG9t
IglpZiBCUjJfVEFSR0VUX0FSTV9UUlVTVEVEX0ZJUk1XQVJFX0NVU1RPTV9UQVJCQUxMCmRpZmYg
LS1naXQgYS9ib290L2FybS10cnVzdGVkLWZpcm13YXJlL3YyLjEyL2FybS10cnVzdGVkLWZpcm13
YXJlLmhhc2ggYi9ib290L2FybS10cnVzdGVkLWZpcm13YXJlL3YyLjEyL2FybS10cnVzdGVkLWZp
cm13YXJlLmhhc2gKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMC4uNTVlYTUx
NTQ4MQotLS0gL2Rldi9udWxsCisrKyBiL2Jvb3QvYXJtLXRydXN0ZWQtZmlybXdhcmUvdjIuMTIv
YXJtLXRydXN0ZWQtZmlybXdhcmUuaGFzaApAQCAtMCwwICsxLDMgQEAKKyMgTG9jYWxseSBjYWxj
dWxhdGVkCitzaGEyNTYgIDA2YjM1YTM1OTZiODQxN2JmNjZmN2JmZGQ3YWNkMTgxYmNiNTNmYzM2
ZGMxMzIxNjIyN2I1Y2FlMTU0ZTAyMTkgIGFybS10cnVzdGVkLWZpcm13YXJlLXYyLjEyLWdpdDQu
dGFyLmd6CitzaGEyNTYgIGIyYzc5NjM1Nzk3YmFmY2RlODRjNmVkYWRhZGRlMjkwYjlkNWUwNWRl
YjNlYTE2YTg0NzIxMGZkMmNhODM2NjkgIGRvY3MvbGljZW5zZS5yc3QKLS0gCjIuNDUuMgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1h
aWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9v
dC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK

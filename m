Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4050C369AB
	for <buildroot@archiver.kernel.org>; Fri, 11 Apr 2025 17:30:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 79E296FA1C;
	Fri, 11 Apr 2025 17:30:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9ZRANIMbUagw; Fri, 11 Apr 2025 17:30:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 779936FA58
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 779936FA58;
	Fri, 11 Apr 2025 17:30:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id B256B108
 for <buildroot@buildroot.org>; Fri, 11 Apr 2025 17:29:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9446D80C07
 for <buildroot@buildroot.org>; Fri, 11 Apr 2025 17:29:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ku8Ytoi1177S for <buildroot@buildroot.org>;
 Fri, 11 Apr 2025 17:29:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.140.110.172;
 helo=foss.arm.com; envelope-from=vincent.stehle@arm.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 880D980B2B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 880D980B2B
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp1.osuosl.org (Postfix) with ESMTP id 880D980B2B
 for <buildroot@buildroot.org>; Fri, 11 Apr 2025 17:29:56 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9D906106F;
 Fri, 11 Apr 2025 10:29:55 -0700 (PDT)
Received: from localhost.localdomain (unknown [10.57.19.128])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 5D0733F59E;
 Fri, 11 Apr 2025 10:29:55 -0700 (PDT)
From: =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@arm.com>
To: buildroot@buildroot.org
Cc: Dick Olsson <hi@senzilla.io>,
 =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@arm.com>
Date: Fri, 11 Apr 2025 19:29:44 +0200
Message-ID: <20250411172944.1379043-4-vincent.stehle@arm.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250411172944.1379043-1-vincent.stehle@arm.com>
References: <20250411172944.1379043-1-vincent.stehle@arm.com>
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=arm.com
Subject: [Buildroot] [PATCH 3/3] package/edk2-non-osi: add custom version
 option
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

QWRkIGEgY3VzdG9tIHZlcnNpb24gb3B0aW9uLCB0byBlbmFibGUgZWFzaWx5IHNwZWNpZnlpbmcg
YW4gb2ZmaWNpYWwgRURLCklJIE5vbi1PU0kgcGxhdGZvcm1zIHZlcnNpb24gdG8gdXNlLiBUaGlz
IGlzIHNpbWlsYXIgdG8gd2hhdCBpcyBkb25lIGluCm90aGVyIHBhY2thZ2VzLCBzdWNoIGFzIGxp
bnV4LCB1Ym9vdCwgb3B0ZWVfb3Mgb3IgYXJtLXRydXN0ZWQtZmlybXdhcmUuCgpNb3ZlIHRoZSBk
ZWZhdWx0IHZlcnNpb24gZGVmaW5pdGlvbiBmcm9tIGVkazItbm9uLW9zaSBtYWtlZmlsZSB0byB0
aGUKY29uZmlnIG1lbnUgdG8gc3VwcG9ydCB0aGF0LiBBbHNvLCB3ZSBuZWVkIHRvIG1ha2UgZWRr
Mi1ub24tb3NpIGFwcGVhcgppbiB0aGUgbWVudSB0byBhbGxvdyBzZWxlY3RpbmcgdGhlIHZlcnNp
b24uIFdlIGtlZXAgdGhlIHNhbWUgbGF0ZXN0CnZlcnNpb24gYnkgZGVmYXVsdCB0byBwcmVzZXJ2
ZSBjdXJyZW50IGJlaGF2aW91ci4KCkFsc28sIGFkZCBhIGNoZWNrIG9mIHRoZSBjdXN0b20gdmVy
c2lvbiBvcHRpb24gdmFsaWRpdHkgaW4gZWRrMi1ub24tb3NpCm1ha2VmaWxlLgoKU2lnbmVkLW9m
Zi1ieTogVmluY2VudCBTdGVobMOpIDx2aW5jZW50LnN0ZWhsZUBhcm0uY29tPgotLS0KIHBhY2th
Z2UvZWRrMi1ub24tb3NpL0NvbmZpZy5pbiAgICAgICB8IDM2ICsrKysrKysrKysrKysrKysrKysr
KysrKysrKy0KIHBhY2thZ2UvZWRrMi1ub24tb3NpL2VkazItbm9uLW9zaS5tayB8IDE3ICsrKysr
KysrKysrLS0KIDIgZmlsZXMgY2hhbmdlZCwgNTAgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMo
LSkKCmRpZmYgLS1naXQgYS9wYWNrYWdlL2VkazItbm9uLW9zaS9Db25maWcuaW4gYi9wYWNrYWdl
L2VkazItbm9uLW9zaS9Db25maWcuaW4KaW5kZXggNmM1NDBjOGE0MC4uODhmNGQ1MjY3MyAxMDA2
NDQKLS0tIGEvcGFja2FnZS9lZGsyLW5vbi1vc2kvQ29uZmlnLmluCisrKyBiL3BhY2thZ2UvZWRr
Mi1ub24tb3NpL0NvbmZpZy5pbgpAQCAtMSw1ICsxLDUgQEAKIGNvbmZpZyBCUjJfUEFDS0FHRV9F
REsyX05PTl9PU0kKLQlib29sCisJYm9vbCAiRURLMiBOb24tT1NJIHBsYXRmb3JtcyIKIAloZWxw
CiAJICBFREsyIGRlc2NyaXB0aW9uIGZpbGVzIGZvciBhZGRpdGlvbmFsIHBsYXRmb3Jtcywgbm90
CiAJICBjb21wYXRpYmxlIHdpdGggdGhlIG5vcm1hbCBsaWNlbnNpbmcgcmVxdWlyZW1lbnRzLgpA
QCAtOSwzICs5LDM3IEBAIGNvbmZpZyBCUjJfUEFDS0FHRV9FREsyX05PTl9PU0kKIAkgIE9ubHkg
dGhlIE1hcnZlbGwgQXJtYWRhIGZpbGVzIGFyZSBjb3BpZWQgYXQgdGhpcyBwb2ludC4KIAogCSAg
aHR0cHM6Ly9naXRodWIuY29tL3RpYW5vY29yZS9lZGsyLW5vbi1vc2kKKworaWYgQlIyX1BBQ0tB
R0VfRURLMl9OT05fT1NJCisKK2Nob2ljZQorCXByb21wdCAiRURLMiBOb24tT1NJIHBsYXRmb3Jt
cyB2ZXJzaW9uIgorCWRlZmF1bHQgQlIyX1BBQ0tBR0VfRURLMl9OT05fT1NJX0xBVEVTVAorCWhl
bHAKKwkgIFNlbGVjdCB0aGUgc3BlY2lmaWMgRURLMiBOb24tT1NJIHBsYXRmb3JtcyB2ZXJzaW9u
IHlvdSB3YW50CisJICB0byB1c2UKKworY29uZmlnIEJSMl9QQUNLQUdFX0VESzJfTk9OX09TSV9M
QVRFU1QKKwkjIEtlZXAgaW4gc3luYyB3aXRoIGxhdGVzdCBjb21taXQgYXMgb2YgdGhlIHJlbGVh
c2UgZGF0ZSBmb3IgYm9vdC9lZGsyCisJYm9vbCAiOGMwOWJkMDk1NTMzOGRiMzg4MTNlMGQ4YWUx
ZmFhNjM0ZjU0NWY3MyIKKworY29uZmlnIEJSMl9QQUNLQUdFX0VESzJfTk9OX09TSV9DVVNUT01f
VkVSU0lPTgorCWJvb2wgIkN1c3RvbSB2ZXJzaW9uIgorCWhlbHAKKwkgIFRoaXMgb3B0aW9uIGFs
bG93cyB0byB1c2UgYSBzcGVjaWZpYyBvZmZpY2lhbCB2ZXJzaW9uCisKK2VuZGNob2ljZQorCitj
b25maWcgQlIyX1BBQ0tBR0VfRURLMl9OT05fT1NJX0NVU1RPTV9WRVJTSU9OX1ZBTFVFCisJc3Ry
aW5nICJFREsyIE5vbi1PU0kgcGxhdGZvcm1zIHZlcnNpb24iCisJZGVwZW5kcyBvbiBCUjJfUEFD
S0FHRV9FREsyX05PTl9PU0lfQ1VTVE9NX1ZFUlNJT04KKworY29uZmlnIEJSMl9QQUNLQUdFX0VE
SzJfTk9OX09TSV9WRVJTSU9OCisJc3RyaW5nCisJIyBLZWVwIGluIHN5bmMgd2l0aCBsYXRlc3Qg
Y29tbWl0IGFzIG9mIHRoZSByZWxlYXNlIGRhdGUgZm9yIGJvb3QvZWRrMgorCWRlZmF1bHQgIjhj
MDliZDA5NTUzMzhkYjM4ODEzZTBkOGFlMWZhYTYzNGY1NDVmNzMiIFwKKwkgICAgICAgIGlmIEJS
Ml9QQUNLQUdFX0VESzJfTk9OX09TSV9MQVRFU1QKKwlkZWZhdWx0IEJSMl9QQUNLQUdFX0VESzJf
Tk9OX09TSV9DVVNUT01fVkVSU0lPTl9WQUxVRSBcCisJICAgICAgICBpZiBCUjJfUEFDS0FHRV9F
REsyX05PTl9PU0lfQ1VTVE9NX1ZFUlNJT04KKworZW5kaWYKZGlmZiAtLWdpdCBhL3BhY2thZ2Uv
ZWRrMi1ub24tb3NpL2VkazItbm9uLW9zaS5tayBiL3BhY2thZ2UvZWRrMi1ub24tb3NpL2VkazIt
bm9uLW9zaS5tawppbmRleCBkNzg3Yzg4MmIzLi4yMDQ3NjhkMmFlIDEwMDY0NAotLS0gYS9wYWNr
YWdlL2VkazItbm9uLW9zaS9lZGsyLW5vbi1vc2kubWsKKysrIGIvcGFja2FnZS9lZGsyLW5vbi1v
c2kvZWRrMi1ub24tb3NpLm1rCkBAIC00LDggKzQsNyBAQAogIwogIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMKIAotIyBLZWVwIGluIHN5bmMgd2l0aCBsYXRlc3QgY29tbWl0IGFzIG9mIHRoZSByZWxl
YXNlIGRhdGUgZm9yIGJvb3QvZWRrMgotRURLMl9OT05fT1NJX1ZFUlNJT04gPSA4YzA5YmQwOTU1
MzM4ZGIzODgxM2UwZDhhZTFmYWE2MzRmNTQ1ZjczCitFREsyX05PTl9PU0lfVkVSU0lPTiA9ICQo
Y2FsbCBxc3RyaXAsJChCUjJfUEFDS0FHRV9FREsyX05PTl9PU0lfVkVSU0lPTikpCiBFREsyX05P
Tl9PU0lfU0lURSA9ICQoY2FsbCBnaXRodWIsdGlhbm9jb3JlLGVkazItbm9uLW9zaSwkKEVESzJf
Tk9OX09TSV9WRVJTSU9OKSkKIEVESzJfTk9OX09TSV9JTlNUQUxMX1RBUkdFVCA9IE5PCiBFREsy
X05PTl9PU0lfSU5TVEFMTF9TVEFHSU5HID0gWUVTCkBAIC0yNCw0ICsyMywxOCBAQCBkZWZpbmUg
RURLMl9OT05fT1NJX0lOU1RBTExfU1RBR0lOR19DTURTCiAJKQogZW5kZWYKIAoraWZlcSAoJChC
UjJfUEFDS0FHRV9FREsyX05PTl9PU0kpJChCUl9CVUlMRElORykseXkpCisKKyMKKyMgQ2hlY2sg
Y3VzdG9tIHZlcnNpb24gb3B0aW9uCisjCitpZmVxICgkKEJSMl9QQUNLQUdFX0VESzJfTk9OX09T
SV9DVVNUT01fVkVSU0lPTikseSkKK2lmZXEgKCQoY2FsbCBxc3RyaXAsJChCUjJfUEFDS0FHRV9F
REsyX05PTl9PU0lfQ1VTVE9NX1ZFUlNJT05fVkFMVUUpKSwpCiskKGVycm9yIE5vIGN1c3RvbSBl
ZGsyLW5vbi1vc2kgdmVyc2lvbiBzcGVjaWZpZWQuIFwKKwlDaGVjayB5b3VyIEJSMl9QQUNLQUdF
X0VESzJfTk9OX09TSV9DVVNUT01fVkVSU0lPTl9WQUxVRSBzZXR0aW5nKQorZW5kaWYKK2VuZGlm
CisKK2VuZGlmICMgQlIyX1BBQ0tBR0VfRURLMl9OT05fT1NJIGFuZCBCUl9CVUlMRElORworCiAk
KGV2YWwgJChnZW5lcmljLXBhY2thZ2UpKQotLSAKMi40Ny4yCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxk
cm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2J1aWxkcm9vdAo=

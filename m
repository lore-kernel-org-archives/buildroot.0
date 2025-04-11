Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FCAEC369A2
	for <buildroot@archiver.kernel.org>; Fri, 11 Apr 2025 17:30:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BB2B4610EB;
	Fri, 11 Apr 2025 17:29:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pA1zh1fRZa6g; Fri, 11 Apr 2025 17:29:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 74BE56F5AD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 74BE56F5AD;
	Fri, 11 Apr 2025 17:29:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 91B9F108
 for <buildroot@buildroot.org>; Fri, 11 Apr 2025 17:29:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7E6604021A
 for <buildroot@buildroot.org>; Fri, 11 Apr 2025 17:29:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QAaGYV1YGFNS for <buildroot@buildroot.org>;
 Fri, 11 Apr 2025 17:29:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.140.110.172;
 helo=foss.arm.com; envelope-from=vincent.stehle@arm.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 98DF140129
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 98DF140129
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp2.osuosl.org (Postfix) with ESMTP id 98DF140129
 for <buildroot@buildroot.org>; Fri, 11 Apr 2025 17:29:54 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B01D7153B;
 Fri, 11 Apr 2025 10:29:53 -0700 (PDT)
Received: from localhost.localdomain (unknown [10.57.19.128])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 712943F59E;
 Fri, 11 Apr 2025 10:29:53 -0700 (PDT)
From: =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@arm.com>
To: buildroot@buildroot.org
Cc: Dick Olsson <hi@senzilla.io>,
 =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@arm.com>
Date: Fri, 11 Apr 2025 19:29:42 +0200
Message-ID: <20250411172944.1379043-2-vincent.stehle@arm.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250411172944.1379043-1-vincent.stehle@arm.com>
References: <20250411172944.1379043-1-vincent.stehle@arm.com>
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=arm.com
Subject: [Buildroot] [PATCH 1/3] boot/edk2: add custom version option
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
YW4gb2ZmaWNpYWwgRURLCklJIHZlcnNpb24gdG8gdXNlLiBUaGlzIGlzIHNpbWlsYXIgdG8gd2hh
dCBpcyBkb25lIGluIG90aGVyIHBhY2thZ2VzLApzdWNoIGFzIGxpbnV4LCB1Ym9vdCwgb3B0ZWVf
b3Mgb3IgYXJtLXRydXN0ZWQtZmlybXdhcmUuCgpNb3ZlIHRoZSBkZWZhdWx0IHZlcnNpb24gZGVm
aW5pdGlvbiBmcm9tIGVkazIgbWFrZWZpbGUgdG8gdGhlIGNvbmZpZwptZW51IHRvIHN1cHBvcnQg
dGhhdC4gV2Uga2VlcCB0aGUgc2FtZSBsYXRlc3QgdmVyc2lvbiBieSBkZWZhdWx0IHRvCnByZXNl
cnZlIGN1cnJlbnQgYmVoYXZpb3VyLgoKQWxzbywgYWRkIGEgY2hlY2sgb2YgdGhlIGN1c3RvbSB2
ZXJzaW9uIG9wdGlvbiB2YWxpZGl0eSBpbiBlZGsyCm1ha2VmaWxlLgoKU2lnbmVkLW9mZi1ieTog
VmluY2VudCBTdGVobMOpIDx2aW5jZW50LnN0ZWhsZUBhcm0uY29tPgpDYzogRGljayBPbHNzb24g
PGhpQHNlbnppbGxhLmlvPgotLS0KIGJvb3QvZWRrMi9Db25maWcuaW4gfCAyNiArKysrKysrKysr
KysrKysrKysrKysrKysrKwogYm9vdC9lZGsyL2VkazIubWsgICB8IDE2ICsrKysrKysrKysrKysr
Ky0KIDIgZmlsZXMgY2hhbmdlZCwgNDEgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlm
ZiAtLWdpdCBhL2Jvb3QvZWRrMi9Db25maWcuaW4gYi9ib290L2VkazIvQ29uZmlnLmluCmluZGV4
IDRlNmU3ZDEyMmMuLjM1MzE0MDQ3ZTMgMTAwNjQ0Ci0tLSBhL2Jvb3QvZWRrMi9Db25maWcuaW4K
KysrIGIvYm9vdC9lZGsyL0NvbmZpZy5pbgpAQCAtMTgsNiArMTgsMzIgQEAgY29uZmlnIEJSMl9U
QVJHRVRfRURLMgogCiBpZiBCUjJfVEFSR0VUX0VESzIKIAorY2hvaWNlCisJcHJvbXB0ICJFREsy
IHZlcnNpb24iCisJZGVmYXVsdCBCUjJfVEFSR0VUX0VESzJfTEFURVNUCisJaGVscAorCSAgU2Vs
ZWN0IHRoZSBzcGVjaWZpYyBFREsyIHZlcnNpb24geW91IHdhbnQgdG8gdXNlCisKK2NvbmZpZyBC
UjJfVEFSR0VUX0VESzJfTEFURVNUCisJYm9vbCAiZWRrMi1zdGFibGUyMDI0MTEiCisKK2NvbmZp
ZyBCUjJfVEFSR0VUX0VESzJfQ1VTVE9NX1ZFUlNJT04KKwlib29sICJDdXN0b20gdmVyc2lvbiIK
KwloZWxwCisJICBUaGlzIG9wdGlvbiBhbGxvd3MgdG8gdXNlIGEgc3BlY2lmaWMgb2ZmaWNpYWwg
dmVyc2lvbgorCitlbmRjaG9pY2UKKworY29uZmlnIEJSMl9UQVJHRVRfRURLMl9DVVNUT01fVkVS
U0lPTl9WQUxVRQorCXN0cmluZyAiRURLMiB2ZXJzaW9uIgorCWRlcGVuZHMgb24gQlIyX1RBUkdF
VF9FREsyX0NVU1RPTV9WRVJTSU9OCisKK2NvbmZpZyBCUjJfVEFSR0VUX0VESzJfVkVSU0lPTgor
CXN0cmluZworCWRlZmF1bHQgImVkazItc3RhYmxlMjAyNDExIiBpZiBCUjJfVEFSR0VUX0VESzJf
TEFURVNUCisJZGVmYXVsdCBCUjJfVEFSR0VUX0VESzJfQ1VTVE9NX1ZFUlNJT05fVkFMVUUgXAor
CSAgICAgICAgaWYgQlIyX1RBUkdFVF9FREsyX0NVU1RPTV9WRVJTSU9OCisKIGNob2ljZQogCXBy
b21wdCAiUGxhdGZvcm0iCiAJZGVmYXVsdCBCUjJfVEFSR0VUX0VESzJfUExBVEZPUk1fT1ZNRl9J
Mzg2IGlmIEJSMl9pMzg2CmRpZmYgLS1naXQgYS9ib290L2VkazIvZWRrMi5tayBiL2Jvb3QvZWRr
Mi9lZGsyLm1rCmluZGV4IDM5NDFkMDE4ODMuLmRmZTY0ZTI0YmIgMTAwNjQ0Ci0tLSBhL2Jvb3Qv
ZWRrMi9lZGsyLm1rCisrKyBiL2Jvb3QvZWRrMi9lZGsyLm1rCkBAIC00LDcgKzQsNyBAQAogIwog
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKIAotRURLMl9WRVJTSU9OID0gZWRrMi1zdGFibGUyMDI0
MTEKK0VESzJfVkVSU0lPTiA9ICQoY2FsbCBxc3RyaXAsJChCUjJfVEFSR0VUX0VESzJfVkVSU0lP
TikpCiBFREsyX1NJVEUgPSBodHRwczovL2dpdGh1Yi5jb20vdGlhbm9jb3JlL2VkazIKIEVESzJf
U0lURV9NRVRIT0QgPSBnaXQKIEVESzJfTElDRU5TRSA9IEJTRC0yLUNsYXVzZS1QYXRlbnQKQEAg
LTE4NCw0ICsxODQsMTggQEAgZGVmaW5lIEVESzJfSU5TVEFMTF9JTUFHRVNfQ01EUwogCWNwIC1m
ICQoQEQpL0J1aWxkLyQoRURLMl9CVUlMRF9ESVIpLyQoRURLMl9CVUlMRF9UWVBFKV9HQ0M1L0ZW
LyouZmQgJChCSU5BUklFU19ESVIpCiBlbmRlZgogCitpZmVxICgkKEJSMl9UQVJHRVRfRURLMikk
KEJSX0JVSUxESU5HKSx5eSkKKworIworIyBDaGVjayBjdXN0b20gdmVyc2lvbiBvcHRpb24KKyMK
K2lmZXEgKCQoQlIyX1RBUkdFVF9FREsyX0NVU1RPTV9WRVJTSU9OKSx5KQoraWZlcSAoJChjYWxs
IHFzdHJpcCwkKEJSMl9UQVJHRVRfRURLMl9DVVNUT01fVkVSU0lPTl9WQUxVRSkpLCkKKyQoZXJy
b3IgTm8gY3VzdG9tIGVkazIgdmVyc2lvbiBzcGVjaWZpZWQuIFwKKwlDaGVjayB5b3VyIEJSMl9U
QVJHRVRfRURLMl9DVVNUT01fVkVSU0lPTl9WQUxVRSBzZXR0aW5nKQorZW5kaWYKK2VuZGlmCisK
K2VuZGlmICMgQlIyX1RBUkdFVF9FREsyIGFuZCBCUl9CVUlMRElORworCiAkKGV2YWwgJChnZW5l
cmljLXBhY2thZ2UpKQotLSAKMi40Ny4yCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJv
b3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxk
cm9vdAo=

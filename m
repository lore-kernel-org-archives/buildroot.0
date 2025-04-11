Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D03AC369B1
	for <buildroot@archiver.kernel.org>; Fri, 11 Apr 2025 17:30:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2AE1980C58;
	Fri, 11 Apr 2025 17:30:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 62bc74LPyC6Q; Fri, 11 Apr 2025 17:30:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4247080365
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4247080365;
	Fri, 11 Apr 2025 17:30:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 75374108
 for <buildroot@buildroot.org>; Fri, 11 Apr 2025 17:29:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5680A6069A
 for <buildroot@buildroot.org>; Fri, 11 Apr 2025 17:29:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wvNhgNFsfaB3 for <buildroot@buildroot.org>;
 Fri, 11 Apr 2025 17:29:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.140.110.172;
 helo=foss.arm.com; envelope-from=vincent.stehle@arm.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 775ED605A6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 775ED605A6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp3.osuosl.org (Postfix) with ESMTP id 775ED605A6
 for <buildroot@buildroot.org>; Fri, 11 Apr 2025 17:29:55 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A57F21596;
 Fri, 11 Apr 2025 10:29:54 -0700 (PDT)
Received: from localhost.localdomain (unknown [10.57.19.128])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 66CD33F59E;
 Fri, 11 Apr 2025 10:29:54 -0700 (PDT)
From: =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@arm.com>
To: buildroot@buildroot.org
Cc: Dick Olsson <hi@senzilla.io>,
 =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@arm.com>
Date: Fri, 11 Apr 2025 19:29:43 +0200
Message-ID: <20250411172944.1379043-3-vincent.stehle@arm.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250411172944.1379043-1-vincent.stehle@arm.com>
References: <20250411172944.1379043-1-vincent.stehle@arm.com>
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=arm.com
Subject: [Buildroot] [PATCH 2/3] package/edk2-platforms: add custom version
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
YW4gb2ZmaWNpYWwgRURLCklJIFBsYXRmb3JtcyB2ZXJzaW9uIHRvIHVzZS4gVGhpcyBpcyBzaW1p
bGFyIHRvIHdoYXQgaXMgZG9uZSBpbiBvdGhlcgpwYWNrYWdlcywgc3VjaCBhcyBsaW51eCwgdWJv
b3QsIG9wdGVlX29zIG9yIGFybS10cnVzdGVkLWZpcm13YXJlLgoKTW92ZSB0aGUgZGVmYXVsdCB2
ZXJzaW9uIGRlZmluaXRpb24gZnJvbSBlZGsyLXBsYXRmb3JtcyBtYWtlZmlsZSB0byB0aGUKY29u
ZmlnIG1lbnUgdG8gc3VwcG9ydCB0aGF0LiBBbHNvLCB3ZSBuZWVkIHRvIG1ha2UgZWRrMi1wbGF0
Zm9ybXMgYXBwZWFyCmluIHRoZSBtZW51IHRvIGFsbG93IHNlbGVjdGluZyB0aGUgdmVyc2lvbi4g
V2Uga2VlcCB0aGUgc2FtZSBsYXRlc3QKdmVyc2lvbiBieSBkZWZhdWx0IHRvIHByZXNlcnZlIGN1
cnJlbnQgYmVoYXZpb3VyLgoKQWxzbywgYWRkIGEgY2hlY2sgb2YgdGhlIGN1c3RvbSB2ZXJzaW9u
IG9wdGlvbiB2YWxpZGl0eSBpbgplZGsyLXBsYXRmb3JtcyBtYWtlZmlsZS4KClNpZ25lZC1vZmYt
Ynk6IFZpbmNlbnQgU3RlaGzDqSA8dmluY2VudC5zdGVobGVAYXJtLmNvbT4KQ2M6IERpY2sgT2xz
c29uIDxoaUBzZW56aWxsYS5pbz4KLS0tCiBwYWNrYWdlL2VkazItcGxhdGZvcm1zL0NvbmZpZy5p
biAgICAgICAgIHwgMzUgKysrKysrKysrKysrKysrKysrKysrKystCiBwYWNrYWdlL2VkazItcGxh
dGZvcm1zL2VkazItcGxhdGZvcm1zLm1rIHwgMTcgKysrKysrKysrKy0tCiAyIGZpbGVzIGNoYW5n
ZWQsIDQ5IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvcGFja2Fn
ZS9lZGsyLXBsYXRmb3Jtcy9Db25maWcuaW4gYi9wYWNrYWdlL2VkazItcGxhdGZvcm1zL0NvbmZp
Zy5pbgppbmRleCAxNzYzM2MwZmRkLi4yNTI3YzZlYjNlIDEwMDY0NAotLS0gYS9wYWNrYWdlL2Vk
azItcGxhdGZvcm1zL0NvbmZpZy5pbgorKysgYi9wYWNrYWdlL2VkazItcGxhdGZvcm1zL0NvbmZp
Zy5pbgpAQCAtMSw4ICsxLDQxIEBACiBjb25maWcgQlIyX1BBQ0tBR0VfRURLMl9QTEFURk9STVMK
LQlib29sCisJYm9vbCAiRURLMiBQbGF0Zm9ybXMiCiAJaGVscAogCSAgRURLMiBkZXNjcmlwdGlv
biBmaWxlcyBmb3IgYWxsIHN1cHBvcnRlZCBwbGF0Zm9ybXMuCiAJICBUaGUgbWFpbiBFREsyIGJv
b3Rsb2FkZXIgcGFja2FnZSB3aWxsIGRlcGVuZCBvbiB0aGVzZQogCSAgZGVzY3JpcHRpb24gZmls
ZXMgd2hpbGUgYnVpbGRpbmcgZmlybXdhcmUgZm9yIHNvbWUgcGxhdGZvcm1zLgogCiAJICBodHRw
czovL2dpdGh1Yi5jb20vdGlhbm9jb3JlL2VkazItcGxhdGZvcm1zCisKK2lmIEJSMl9QQUNLQUdF
X0VESzJfUExBVEZPUk1TCisKK2Nob2ljZQorCXByb21wdCAiRURLMiBQbGF0Zm9ybXMgdmVyc2lv
biIKKwlkZWZhdWx0IEJSMl9QQUNLQUdFX0VESzJfUExBVEZPUk1TX0xBVEVTVAorCWhlbHAKKwkg
IFNlbGVjdCB0aGUgc3BlY2lmaWMgRURLMiBQbGF0Zm9ybXMgdmVyc2lvbiB5b3Ugd2FudCB0byB1
c2UKKworY29uZmlnIEJSMl9QQUNLQUdFX0VESzJfUExBVEZPUk1TX0xBVEVTVAorCSMgS2VlcCBp
biBzeW5jIHdpdGggbGF0ZXN0IGNvbW1pdCBhcyBvZiB0aGUgcmVsZWFzZSBkYXRlIGZvciBib290
L2VkazIKKwlib29sICJmMTBjYzc2MGNmM2Y3ZWI2OTM4MjJkZTEzNDdlNzExNzM5NDRlNDRhIgor
Citjb25maWcgQlIyX1BBQ0tBR0VfRURLMl9QTEFURk9STVNfQ1VTVE9NX1ZFUlNJT04KKwlib29s
ICJDdXN0b20gdmVyc2lvbiIKKwloZWxwCisJICBUaGlzIG9wdGlvbiBhbGxvd3MgdG8gdXNlIGEg
c3BlY2lmaWMgb2ZmaWNpYWwgdmVyc2lvbgorCitlbmRjaG9pY2UKKworY29uZmlnIEJSMl9QQUNL
QUdFX0VESzJfUExBVEZPUk1TX0NVU1RPTV9WRVJTSU9OX1ZBTFVFCisJc3RyaW5nICJFREsyIFBs
YXRmb3JtcyB2ZXJzaW9uIgorCWRlcGVuZHMgb24gQlIyX1BBQ0tBR0VfRURLMl9QTEFURk9STVNf
Q1VTVE9NX1ZFUlNJT04KKworY29uZmlnIEJSMl9QQUNLQUdFX0VESzJfUExBVEZPUk1TX1ZFUlNJ
T04KKwlzdHJpbmcKKwkjIEtlZXAgaW4gc3luYyB3aXRoIGxhdGVzdCBjb21taXQgYXMgb2YgdGhl
IHJlbGVhc2UgZGF0ZSBmb3IgYm9vdC9lZGsyCisJZGVmYXVsdCAiZjEwY2M3NjBjZjNmN2ViNjkz
ODIyZGUxMzQ3ZTcxMTczOTQ0ZTQ0YSIgXAorCSAgICAgICAgaWYgQlIyX1BBQ0tBR0VfRURLMl9Q
TEFURk9STVNfTEFURVNUCisJZGVmYXVsdCBCUjJfUEFDS0FHRV9FREsyX1BMQVRGT1JNU19DVVNU
T01fVkVSU0lPTl9WQUxVRSBcCisJICAgICAgICBpZiBCUjJfUEFDS0FHRV9FREsyX1BMQVRGT1JN
U19DVVNUT01fVkVSU0lPTgorCitlbmRpZgpkaWZmIC0tZ2l0IGEvcGFja2FnZS9lZGsyLXBsYXRm
b3Jtcy9lZGsyLXBsYXRmb3Jtcy5tayBiL3BhY2thZ2UvZWRrMi1wbGF0Zm9ybXMvZWRrMi1wbGF0
Zm9ybXMubWsKaW5kZXggNjVmY2Y4MWEzYy4uZTdjZDY3NTU1YSAxMDA2NDQKLS0tIGEvcGFja2Fn
ZS9lZGsyLXBsYXRmb3Jtcy9lZGsyLXBsYXRmb3Jtcy5taworKysgYi9wYWNrYWdlL2VkazItcGxh
dGZvcm1zL2VkazItcGxhdGZvcm1zLm1rCkBAIC00LDggKzQsNyBAQAogIwogIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMKIAotIyBLZWVwIGluIHN5bmMgd2l0aCBsYXRlc3QgY29tbWl0IGFzIG9mIHRo
ZSByZWxlYXNlIGRhdGUgZm9yIGJvb3QvZWRrMgotRURLMl9QTEFURk9STVNfVkVSU0lPTiA9IGYx
MGNjNzYwY2YzZjdlYjY5MzgyMmRlMTM0N2U3MTE3Mzk0NGU0NGEKK0VESzJfUExBVEZPUk1TX1ZF
UlNJT04gPSAkKGNhbGwgcXN0cmlwLCQoQlIyX1BBQ0tBR0VfRURLMl9QTEFURk9STVNfVkVSU0lP
TikpCiBFREsyX1BMQVRGT1JNU19TSVRFID0gJChjYWxsIGdpdGh1Yix0aWFub2NvcmUsZWRrMi1w
bGF0Zm9ybXMsJChFREsyX1BMQVRGT1JNU19WRVJTSU9OKSkKIEVESzJfUExBVEZPUk1TX0xJQ0VO
U0UgPSBCU0QtMi1DbGF1c2UtUGF0ZW50CiBFREsyX1BMQVRGT1JNU19MSUNFTlNFX0ZJTEVTID0g
TGljZW5zZS50eHQKQEAgLTE5LDQgKzE4LDE4IEBAIGRlZmluZSBFREsyX1BMQVRGT1JNU19JTlNU
QUxMX1NUQUdJTkdfQ01EUwogCWNwIC1yZiAkKEBEKS8qLyAkKFNUQUdJTkdfRElSKS91c3Ivc2hh
cmUvZWRrMi1wbGF0Zm9ybXMvCiBlbmRlZgogCitpZmVxICgkKEJSMl9QQUNLQUdFX0VESzJfUExB
VEZPUk1TKSQoQlJfQlVJTERJTkcpLHl5KQorCisjCisjIENoZWNrIGN1c3RvbSB2ZXJzaW9uIG9w
dGlvbgorIworaWZlcSAoJChCUjJfUEFDS0FHRV9FREsyX1BMQVRGT1JNU19DVVNUT01fVkVSU0lP
TikseSkKK2lmZXEgKCQoY2FsbCBxc3RyaXAsJChCUjJfUEFDS0FHRV9FREsyX1BMQVRGT1JNU19D
VVNUT01fVkVSU0lPTl9WQUxVRSkpLCkKKyQoZXJyb3IgTm8gY3VzdG9tIGVkazItcGxhdGZvcm1z
IHZlcnNpb24gc3BlY2lmaWVkLiBcCisJQ2hlY2sgeW91ciBCUjJfUEFDS0FHRV9FREsyX1BMQVRG
T1JNU19DVVNUT01fVkVSU0lPTl9WQUxVRSBzZXR0aW5nKQorZW5kaWYKK2VuZGlmCisKK2VuZGlm
ICMgQlIyX1BBQ0tBR0VfRURLMl9QTEFURk9STVMgYW5kIEJSX0JVSUxESU5HCisKICQoZXZhbCAk
KGdlbmVyaWMtcGFja2FnZSkpCi0tIAoyLjQ3LjIKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1
aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8v
YnVpbGRyb290Cg==

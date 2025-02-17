Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F10EC021AA
	for <buildroot@archiver.kernel.org>; Mon, 17 Feb 2025 15:32:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DA467821E4;
	Mon, 17 Feb 2025 15:32:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1PuwjRGT3Mhf; Mon, 17 Feb 2025 15:32:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 930B582179
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 930B582179;
	Mon, 17 Feb 2025 15:32:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1B172DE
 for <buildroot@buildroot.org>; Mon, 17 Feb 2025 15:31:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EF2F240328
 for <buildroot@buildroot.org>; Mon, 17 Feb 2025 15:31:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Doat8_YoF_FH for <buildroot@buildroot.org>;
 Mon, 17 Feb 2025 15:31:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.21;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7ECBA40FE1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7ECBA40FE1
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7ECBA40FE1
 for <buildroot@buildroot.org>; Mon, 17 Feb 2025 15:31:53 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.home.arpa ([85.22.115.144]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N3KPq-1tJCZU2HmE-00sAap; Mon, 17
 Feb 2025 16:31:46 +0100
To: buildroot@buildroot.org
Date: Mon, 17 Feb 2025 16:31:25 +0100
Message-ID: <20250217153127.1363472-5-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250217153127.1363472-1-fiona.klute@gmx.de>
References: <20250217153127.1363472-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:x5z935im1Yy9lBIWBB4CRxhO/4wuonyuQF/el/wjRpMoDmzsa3e
 wJYjHe2qaJFniU9rTykN+VVFsw8/s5NReJVAOlb06SZrsCjqrG4Ds7y5DPkwegdDODBq1t8
 LWyWVKD3H9JPuylbDsPSIx22GmxlrFSyud1/Dxk3Oc2oAaNGsVJRJ3I6b5pfT6cFj6mIcp+
 //wTBzLF+YVOWOCB8sU2A==
UI-OutboundReport: notjunk:1;M01:P0:PVt1qCaOdhQ=;P5onlwrSkrS05VlFk6ltAtYaabG
 d6S+jINPRwphR7sJteldCobC0OnjfKg7xpgSC7ffq+SgBaXj0egWIE8+4hClr3QOCo9SvPGNi
 /rkh815R317ShQEIeLbjErcIXr35XMMBZlM0pmnYa+EhqJnvAM7r3hah81d5vQl5kGu5BCt3R
 afUAGKVxVt5P4IIYJWw+bgR8PdjGukiKKgA1bT1+SEo3f8zuva/C+CXrKcq5KuS+2XSG6b178
 wUkcjvQXDLuiXZA0wpNaLJgOu666UczDgMWDteGm4p/9xMHtFTdFXKh3wxrPMVqdQ2ScqtgwO
 HDlLSNmc6Gy9K5htQTv/8jYg1u6eFovdE6mKPkABHjOQDFv4Jka6MsLF5bJYmkAcg9zxH2yBK
 vlAhM58ha0ZyczJLfKR6o02IEIoU5b5ARR0UfUBZdsv95s8YAoN4g1vtxMr/D8zkwYUGzzOFf
 OOi37YKVZiNMNv32QCaG94Rt6JUSBcgZkhWpQNKTK9TlPLFtHETCS0B+4aOxjHOTErj9v79P6
 fhihBVyKtRF/frVHaiK/7BBbFYJx0s869+bcGwOA7YDZtT6xdTMRaZSD4lfSVUyCzRww5FhAt
 VZUkaLemlY1DW28GZocOi8UPUPIE6SFme5R5MZykFpxOUI5jO7X4gox0eCRYRYZfrBsSfBd0u
 LOtq5gPe9wylcuBJBqp4NWZX4aN431e0yG249+BcCbRjSj/YgIDsxe7eenwiQIzK68GRKBp3u
 EDP7TMjWF6ZEY8K7KDB0eHUbhJoYCm5mIWOrLT4tTL4eOZFKaC5Pge6ndKaWIcE0LRqY6qlTu
 OBR/dMC31gDqRu0EUiPpwQspiP/5P5Jo7Phc7EnmnUN+nD/rFc24bBkqh2YVsNKKmimz9BD1h
 XoLRh3IuUyRdWqrZ8MWu/wgTzRxdk8Y/oizHVUwu5EAHA5gGYIK8JczbADqJs2NQsSqpl7XEQ
 KbZHbAGHSx5VQuC/EeAxrN8mPgAWh2bVBlexnYVqA/cmHH7u47WhIvpNN2qIxIBOV3bKUEApb
 vIUfzcKXhuPAYdC8ptoz0VMl8Q+J6FUf7YBGts/DSif1QZxFCLarsbqd/A+CPPuScoMhghAm+
 CrT4SGM4WBXp/7tHnXGmBc4cpo30W6SwkrTUJazToVRlSCO24vJVCsjAiFgu5YyY6RhEVtdzB
 ufDUkgPzRADVktSKd5Ys2KaGyrZt5yQNvJHkMIRjQOYNioPQe+C1Xn0gB1/OqQ43qScjEyvOo
 uEgQdS1GaE5X9Cn/j26RZy8WRJIdqXKsZa8qjG/AR0nKVM5BheNNP61rUTrAYG4k/FWx/Ii4r
 TlXFW/ebQtafJ4BTFc6G2BtfSJmKcU1lKcv6KodxOU55spTVOELS/jvOYcBCqKKqYG666cJto
 jjQlOXzlDtdS4HHANijzc/5/0Qne6nNOloE16dGOO7CIt9rooIhjA0nx55RAmIJHprUXuI0n/
 r6sAgiQ==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1739806306; x=1740411106; i=fiona.klute@gmx.de;
 bh=VPmY7Ru3fCG2PMEX+DTJ+ZL3fHI94vojT3msGz3EA+c=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Type:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=HzTFsESM1GspGL01hXmIib2UbeSDfcEehDRZrqD4p1ghkzUBlbkS1k4rugXuoJsa
 GdmArvPDTf5DmliCwjt2IlNbKkIchBBcnP7WQ0iZqh4cW4M0AKagu+NU7GthfsLkY
 F6CdHowN8txx/4/hsO40MtsH/w3fxefKyicr4XUO0u9UkAmaDiD5/2tkt3x7b2Xwd
 ylvf1kZGdJzQ0SQYQP0rMn6MgVvLSaD6sUCTnmhmRrBsswS6ibp3LqYHda20RRbkz
 0QEExVJVEs01r/63W9342dyq/j/xKdvU9cN4H+BM2GDREmDfzSR5Pz7W1akAvyLcR
 GosIlnVQobsLEhxgjQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=HzTFsESM
Subject: [Buildroot] [PATCH v6 4/6] support/testing: test for nftables init
 script
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Cc: Julien Olivain <ju.o@free.fr>, Fiona Klute <fiona.klute@gmx.de>,
 Ricardo Martincoski <ricardo.martincoski@datacom.com.br>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

RnJvbTogIkZpb25hIEtsdXRlIChXSVdBKSIgPGZpb25hLmtsdXRlQGdteC5kZT4KClRoZSBuZXcg
dGVzdCBjaGVja3MgdGhhdCBhIHByZS1kZWZpbmVkIHJ1bGVzIGZpbGUgY2FuIGJlIGxvYWRlZCBh
bmQKd29ya3MgYXMgZXhwZWN0ZWQsIGFuZCB0aGF0IGFmdGVyIGZsdXNoaW5nIHRoZSBibG9ja2Vk
IElQIHJlc3BvbmRzIHRvCnBpbmcgYWdhaW4uCgpTaWduZWQtb2ZmLWJ5OiBGaW9uYSBLbHV0ZSAo
V0lXQSkgPGZpb25hLmtsdXRlQGdteC5kZT4KLS0tCiBERVZFTE9QRVJTICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgfCAgMSArCiAuLi4vdGVzdGluZy90ZXN0cy9wYWNrYWdlL3Rl
c3RfbmZ0YWJsZXMucHkgICAgfCAzNyArKysrKysrKysrKysrKysrKystCiAuLi4vcm9vdGZzLW92
ZXJsYXkvZXRjL25mdGFibGVzLmNvbmYgICAgICAgICAgfCAgOCArKysrCiAzIGZpbGVzIGNoYW5n
ZWQsIDQ1IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKIGNyZWF0ZSBtb2RlIDEwMDY0NCBz
dXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS90ZXN0X25mdGFibGVzL3Jvb3Rmcy1vdmVybGF5
L2V0Yy9uZnRhYmxlcy5jb25mCgpkaWZmIC0tZ2l0IGEvREVWRUxPUEVSUyBiL0RFVkVMT1BFUlMK
aW5kZXggNDkxNGFjYmEwZC4uNGUxN2Q0NjI5NCAxMDA2NDQKLS0tIGEvREVWRUxPUEVSUworKysg
Yi9ERVZFTE9QRVJTCkBAIC0xMTEwLDYgKzExMTAsNyBAQCBGOglwYWNrYWdlL3B5dGhvbi1wb2V0
cnktZHluYW1pYy12ZXJzaW9uaW5nLwogRjoJcGFja2FnZS9weXRob24tcHlhc3luY2hhdC8KIEY6
CXBhY2thZ2UvcHl0aG9uLXB5YXN5bmNvcmUvCiBGOglzdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFj
a2FnZS9zYW1wbGVfcHl0aG9uX25ldHdvcmttYW5hZ2VyX2dvaS5weQorRjoJc3VwcG9ydC90ZXN0
aW5nL3Rlc3RzL3BhY2thZ2UvdGVzdF9uZnRhYmxlcy5weQogRjoJc3VwcG9ydC90ZXN0aW5nL3Rl
c3RzL3BhY2thZ2UvdGVzdF9weXRob25fbmV0d29ya21hbmFnZXJfZ29pLnB5CiAKIE46CUZsw6F2
aW8gVGFwYWrDs3MgPGZsYXZpby50YXBham9zQG5ld3Rlc2MuY29tLmJyPgpkaWZmIC0tZ2l0IGEv
c3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2UvdGVzdF9uZnRhYmxlcy5weSBiL3N1cHBvcnQv
dGVzdGluZy90ZXN0cy9wYWNrYWdlL3Rlc3RfbmZ0YWJsZXMucHkKaW5kZXggMTQyZTdkMDM1Mi4u
MjYyMmM3ZTgyMiAxMDA2NDQKLS0tIGEvc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2UvdGVz
dF9uZnRhYmxlcy5weQorKysgYi9zdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS90ZXN0X25m
dGFibGVzLnB5CkBAIC04NSw3ICs4NSw3IEBAIGNsYXNzIFRlc3ROZnRhYmxlcyhpbmZyYS5iYXNl
dGVzdC5CUlRlc3QpOgogICAgICAgICAjIHN1cHBvc2VkIHRvIGZhaWwgZWFybGllciBpcyBub3cg
c3VwcG9zZWQgdG8gc3VjY2VlZC4KICAgICAgICAgc2VsZi5hc3NlcnRSdW5PayhwaW5nX3Rlc3Rf
Y21kKQogCi0gICAgZGVmIHRlc3RfcnVuKHNlbGYpOgorICAgIGRlZiBib290X3ZtKHNlbGYpOgog
ICAgICAgICBpbWcgPSBvcy5wYXRoLmpvaW4oc2VsZi5idWlsZGRpciwgImltYWdlcyIsICJyb290
ZnMuY3Bpby5neiIpCiAgICAgICAgIGtlcm4gPSBvcy5wYXRoLmpvaW4oc2VsZi5idWlsZGRpciwg
ImltYWdlcyIsICJJbWFnZSIpCiAgICAgICAgIHNlbGYuZW11bGF0b3IuYm9vdChhcmNoPSJhYXJj
aDY0IiwKQEAgLTk3LDYgKzk3LDkgQEAgY2xhc3MgVGVzdE5mdGFibGVzKGluZnJhLmJhc2V0ZXN0
LkJSVGVzdCk6CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAiLWluaXRyZCIs
IGltZ10pCiAgICAgICAgIHNlbGYuZW11bGF0b3IubG9naW4oKQogCisgICAgZGVmIHRlc3RfcnVu
KHNlbGYpOgorICAgICAgICBzZWxmLmJvb3Rfdm0oKQorCiAgICAgICAgICMgV2UgY2hlY2sgdGhl
IHByb2dyYW0gY2FuIGV4ZWN1dGUuCiAgICAgICAgIHNlbGYuYXNzZXJ0UnVuT2soIm5mdCAtLXZl
cnNpb24iKQogCkBAIC0xMDcsMyArMTEwLDM1IEBAIGNsYXNzIFRlc3ROZnRhYmxlcyhpbmZyYS5i
YXNldGVzdC5CUlRlc3QpOgogICAgICAgICAjIFdlIHJ1biBhZ2FpbiB0aGUgc2FtZSB0ZXN0IHNl
cXVlbmNlIHVzaW5nIG91ciBzaW1wbGUgbmZ0CiAgICAgICAgICMgcHl0aG9uIGltcGxlbWVudGF0
aW9uLCB0byBjaGVjayB0aGUgbGFuZ3VhZ2UgYmluZGluZ3MuCiAgICAgICAgIHNlbGYubmZ0YWJs
ZXNfdGVzdChwcm9nPSIvcm9vdC9uZnQucHkiKQorCisKK2NsYXNzIFRlc3ROZnRhYmxlc0luaXQo
VGVzdE5mdGFibGVzKToKKyAgICBjb25maWcgPSBUZXN0TmZ0YWJsZXMuY29uZmlnICsgXAorICAg
ICAgICAiIiIKKyAgICAgICAgQlIyX0lOSVRfQlVTWUJPWD15CisgICAgICAgICIiIgorCisgICAg
ZGVmIHRlc3RfcnVuKHNlbGYpOgorICAgICAgICBzZWxmLmJvb3Rfdm0oKQorCisgICAgICAgICMg
c3RhcnQgd2l0aCBrbm93biBzdGF0ZSAocnVsZXMgZnJvbSAvZXRjL25mdGFibGVzLmNvbmYpCisg
ICAgICAgIHNlbGYuYXNzZXJ0UnVuT2soIi9ldGMvaW5pdC5kL1MzNW5mdGFibGVzIHJlbG9hZCIp
CisKKyAgICAgICAgIyBTYW1lIGNvbmNlcHQgYXMgaW4gVGVzdE5mdGFibGVzLm5mdGFibGVzX3Rl
c3Q6IFRoZSBydWxlcworICAgICAgICAjIHNob3VsZCBhbGxvdyBwaW5nIHRvIDEyNy4wLjAuMSwg
YnV0IG5vdCAxMjcuMC4wLjIuCisgICAgICAgIHBpbmdfY21kX3ByZWZpeCA9ICJwaW5nIC1jIDMg
LWkgMC41IC1XIDIgIgorICAgICAgICBzZWxmLmFzc2VydFJ1bk9rKHBpbmdfY21kX3ByZWZpeCAr
ICIxMjcuMC4wLjEiKQorICAgICAgICBfLCBleGl0X2NvZGUgPSBzZWxmLmVtdWxhdG9yLnJ1bihw
aW5nX2NtZF9wcmVmaXggKyAiMTI3LjAuMC4yIikKKyAgICAgICAgc2VsZi5hc3NlcnROb3RFcXVh
bChleGl0X2NvZGUsIDApCisKKyAgICAgICAgIyBTdG9wIHNob3VsZCBmbHVzaCB0aGUgcnVsZXMs
IHBpbmcgdG8gYm90aCBhZGRyZXNzZXMgc2hvdWxkCisgICAgICAgICMgd29yayBub3cuCisgICAg
ICAgIHNlbGYuYXNzZXJ0UnVuT2soIi9ldGMvaW5pdC5kL1MzNW5mdGFibGVzIHN0b3AiKQorICAg
ICAgICBzZWxmLmFzc2VydFJ1bk9rKHBpbmdfY21kX3ByZWZpeCArICIxMjcuMC4wLjEiKQorICAg
ICAgICBzZWxmLmFzc2VydFJ1bk9rKHBpbmdfY21kX3ByZWZpeCArICIxMjcuMC4wLjIiKQorCisg
ICAgICAgICMgU3RhcnQgaXMgZXNzZW50aWFsbHkgdGhlIHNhbWUgYXMgcmVsb2FkLCBjaGVjayB0
aGF0CisgICAgICAgICMgMTI3LjAuMC4yIGdldHMgYmxvY2tlZCBhZ2Fpbi4KKyAgICAgICAgc2Vs
Zi5hc3NlcnRSdW5PaygiL2V0Yy9pbml0LmQvUzM1bmZ0YWJsZXMgc3RhcnQiKQorICAgICAgICBf
LCBleGl0X2NvZGUgPSBzZWxmLmVtdWxhdG9yLnJ1bihwaW5nX2NtZF9wcmVmaXggKyAiMTI3LjAu
MC4yIikKKyAgICAgICAgc2VsZi5hc3NlcnROb3RFcXVhbChleGl0X2NvZGUsIDApCmRpZmYgLS1n
aXQgYS9zdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS90ZXN0X25mdGFibGVzL3Jvb3Rmcy1v
dmVybGF5L2V0Yy9uZnRhYmxlcy5jb25mIGIvc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2Uv
dGVzdF9uZnRhYmxlcy9yb290ZnMtb3ZlcmxheS9ldGMvbmZ0YWJsZXMuY29uZgpuZXcgZmlsZSBt
b2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAwLi5hMDRhZjFkNjM0Ci0tLSAvZGV2L251bGwKKysr
IGIvc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2UvdGVzdF9uZnRhYmxlcy9yb290ZnMtb3Zl
cmxheS9ldGMvbmZ0YWJsZXMuY29uZgpAQCAtMCwwICsxLDggQEAKK2ZsdXNoIHJ1bGVzZXQKKwor
dGFibGUgaW5ldCBmaWx0ZXIgeworCWNoYWluIGlucHV0IHsKKwkJdHlwZSBmaWx0ZXIgaG9vayBp
bnB1dCBwcmlvcml0eSBmaWx0ZXI7IHBvbGljeSBhY2NlcHQ7CisJCWlwIGRhZGRyIDEyNy4wLjAu
MiBpY21wIHR5cGUgZWNoby1yZXF1ZXN0IGRyb3AKKwl9Cit9Ci0tIAoyLjQ3LjIKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5n
IGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3Jn
L21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==

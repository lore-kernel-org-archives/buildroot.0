Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82B57C25B75
	for <buildroot@archiver.kernel.org>; Wed, 29 May 2024 18:23:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 501E2605C4;
	Wed, 29 May 2024 18:23:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S3I_JhxzU_9N; Wed, 29 May 2024 18:23:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4B38E60B9C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4B38E60B9C;
	Wed, 29 May 2024 18:23:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 25DBE1D393B
 for <buildroot@lists.busybox.net>; Wed, 29 May 2024 18:23:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 127F340428
 for <buildroot@lists.busybox.net>; Wed, 29 May 2024 18:23:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tceiKoRGQzu8 for <buildroot@lists.busybox.net>;
 Wed, 29 May 2024 18:23:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.22;
 helo=mout.gmx.net; envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D4545400F1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D4545400F1
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D4545400F1
 for <buildroot@buildroot.org>; Wed, 29 May 2024 18:23:24 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from probook ([151.216.80.169]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M89Gt-1s78tG00Gp-005Erm; Wed, 29
 May 2024 20:23:21 +0200
Date: Wed, 29 May 2024 20:22:56 +0200
MIME-Version: 1.0
Message-Id: <20240529-ztext-v2-1-82985032f169@gmx.net>
References: <20240529-ztext-v2-0-82985032f169@gmx.net>
In-Reply-To: <20240529-ztext-v2-0-82985032f169@gmx.net>
To: buildroot@buildroot.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1717006985; l=1965;
 i=j.neuschaefer@gmx.net; s=20240329; h=from:subject:message-id;
 bh=L1YCAsmIKjQu/Kl76ZfUEpVlzez/gE7O4O1iVjRItIs=;
 b=3iHPscK9m5qUamzPQzZBzCHtcKu/R3nk90XrbSPElrlIyaAIRbpWhf5mrnyLkvlNdCq3zoqbJ
 jBy0jbpEHFuAr6kINo6O2CY4kCGTVK8Qz9888vXFNGSh9iBPlbDt081
X-Developer-Key: i=j.neuschaefer@gmx.net; a=ed25519;
 pk=NIe0bK42wNaX/C4bi6ezm7NJK0IQE+8MKBm7igFMIS4=
X-Provags-ID: V03:K1:BEZZQYV5kIRVjCaJOy/pjAXYghaKuazuNjDtOS76ayGyBlotM9V
 g2QXBQCQ8tyFEqsGH5ThfTfcQKLaJta4h8B7e70TFbQ4QW3TOVOk3g85WUkiFg/0V8s0XP0
 lfcsnYqTfGP/DGHHRmzuSQGCEyWs4uRFKYhwJvAVNSVXVEFE1pKpg1DSgqc1kenodK6UvFv
 3JJXOLUazdE/1Uf2Apo9A==
UI-OutboundReport: notjunk:1;M01:P0:jO6KtJznuZY=;l7s2zmvcq33uQM4gvQ/4borCR95
 potrGoMwKUe1Suk8dh8X1qYFkGcN/Lj7JXetgHHtcWc1AMfXKqRc/mDGrbMtKm92shdi8GXR/
 kNfklioWPjoe9by+9eDtRo1h3w4EhHMQw3qFgC/661BjevfLB8s46v+dWotctpMHFwm9p5ZXb
 hPDHc2LL/EfodjvhcBK2uQ71VCLlk0FBjS2CSslEbR9GbaRNffH9+Ms8Ff5HL6jW+cerfEWnY
 6yi6R0zISC4F+oUC9faxBTHRkQulbrL40W3d8Wnc4XiTAket4YmvLX49V3NDDkh+6pefwnja7
 k410iuPQEeHX5uOmQBTDUY5R7rIQs+9Ejnyb0ZPvJaQxgpGKhpEqavThH2OmsRnw5AtsQusFr
 J41VrQc2KayAIVahZDwQogIIf+JJkM5APo3TQ5X0mu/1i1iK7pj7u2W8aNJwaoBIBGP/0ECNn
 5Cmtf0+TNzgGHex+ynJs3MbSLulG2mwtJouxRjJwtCBBqJFRwEaUa5ChTet6YLIjv+edeQP/4
 k3eZJ9U0e92EXkv792pIXvSvs7gQMYKI2rJ5lz+KxplgJbaMzPfhMExIPLxpvAAy69P/69KJQ
 bQkqph4/CMWQdXlq6Yevt9VOZ+lwQ2jGCL/Fd9jIv1Z8nIDCSSkbY+98DmsouE+h8V7n+U2ZU
 j2HzF2LQGWwcYOl54065FFCKLljKIrKM0i0g3Ayj7PbF99qKweV+JmGQzvF2UkS/t56gtaSe4
 p66hHU68VNviiXChbXMtCFjAAclLTSHuEFgkx9nMvxDHgCzH0X1/6yhYwAQg/H4rrBlevvDMA
 djvOd+vcGYFl7j7A5pmwG3oYyomhCPOpuDv/vGm20pG5k=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.net; 
 s=s31663417; t=1717007001; x=1717611801; i=j.neuschaefer@gmx.net;
 bh=rux404EF/kyiU6De6bkxKASucVepGjrOEG2dVElRLXw=;
 h=X-UI-Sender-Class:From:Date:Subject:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=b4ns4R8siiTyPOJGpdTZXg1Vs+9XqcNFn4g5vE3WHp4dDL0UPMgJKLek/MAV/GDZ
 WtBQbifZ89QWtRC6vUo4aC/Jr7gOHdattFdVrOxRlZLh4KW8oN/T0zPJNCwf/v5WM
 rkNwlhPqpNA1naZJA2dETY6jj9phn/JWXPfOeyRfvyk461he5Q7mPtor9h8maX2xD
 WTiaG1tJEJXk+KjIABR1gTclJvpk5NSal2et6CmRZyVLuA/U/iP7+ChvSA6wLFfrt
 +1zr6ESi8OcTQDFjpnY21oh2SnFCU1l2JLx/y/TGqWmETieiqeBfXpWfMlMqVJEGG
 aQqsqK5S5RuuC0WosQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.net header.i=j.neuschaefer@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=b4ns4R8s
Subject: [Buildroot] [PATCH v2 1/2] Config.in: ban textrels on musl
 toolchains
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_buildroot?= <buildroot@buildroot.org>
Reply-To: =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Cc: =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

bXVzbC1saWJjIGRvZXNuJ3Qgc3VwcG9ydCBURVhUUkVMc1sxXSBhbmQgcHJvZ3JhbXMgd2l0aCBU
RVhUUkVMcyB3aWxsCmNyYXNoIG9uIHN0YXJ0LXVwIHVuZGVyIG11c2wuCgpUaGlzIHBhdGNoIGZv
cmJpZHMgdGhlIHVzZSBvZiBURVhUUkVMcyBvbiBtdXNsLCBidXQgYWRkcyBhbiBvcHRpb24gdG8K
ZWl0aGVyIGZvcmJpZCB0aGVtIG9uIG90aGVyIGxpYmNzIGFzIHdlbGwsIG9yIGFsbG93IHRoZW0g
b24gbXVzbC4KClsxXTogaHR0cHM6Ly93d3cub3BlbndhbGwuY29tL2xpc3RzL211c2wvMjAyMC8w
OS8yNS80CgpTaWduZWQtb2ZmLWJ5OiBKLiBOZXVzY2jDpGZlciA8ai5uZXVzY2hhZWZlckBnbXgu
bmV0PgotLS0KCnYyOgotIHNsaWdodGx5IGRpZmZlcmVudCB3b3JkaW5nCi0gZGVmYXVsdCB0byB5
ZXMgb24gbXVzbCB0b29sY2hhaW5zCi0gZml4IGNoZWNrLXBhY2thZ2Ugd2FybmluZ3MKLSBkZXBl
bmRzIG9uIEJSMl9TSEFSRURfTElCUyAtPiBkZXBlbmRzIG9uICFCUjJfU1RBVElDX0xJQlMKLS0t
CiBDb25maWcuaW4gICAgICAgICAgIHwgMTQgKysrKysrKysrKysrKysKIHBhY2thZ2UvTWFrZWZp
bGUuaW4gfCAgNCArKysrCiAyIGZpbGVzIGNoYW5nZWQsIDE4IGluc2VydGlvbnMoKykKCmRpZmYg
LS1naXQgYS9Db25maWcuaW4gYi9Db25maWcuaW4KaW5kZXggYjVhOTQzMjVjNC4uOTJlODllZDMy
ZCAxMDA2NDQKLS0tIGEvQ29uZmlnLmluCisrKyBiL0NvbmZpZy5pbgpAQCAtOTEwLDYgKzkxMCwy
MCBAQCBlbmRjaG9pY2UKIGNvbW1lbnQgIlJFTG9jYXRpb24gUmVhZCBPbmx5IChSRUxSTykgbmVl
ZHMgc2hhcmVkIGxpYnJhcmllcyIKIAlkZXBlbmRzIG9uICFCUjJfU0hBUkVEX0xJQlMKCitjb25m
aWcgQlIyX0xJTktfWlRFWFQKKwlib29sICJEaXNhbGxvdyB0ZXh0IHNlY3Rpb24gcmVsb2NhdGlv
bnMgKFRFWFRSRUxzKSIKKwlkZWZhdWx0IEJSMl9UT09MQ0hBSU5fVVNFU19NVVNMCisJZGVwZW5k
cyBvbiAhQlIyX1NUQVRJQ19MSUJTCisJaGVscAorCSAgUGFzcyAiLXogdGV4dCIgdG8gdGhlIGxp
bmtlciB0byBkZXRlY3QgVEVYVFJFTHMgYW5kIHRocm93IGFuCisJICBlcnJvciBpZiB0aGV5IG9j
Y3VyLgorCisJICBUaGlzIGlzIHJlY29tbWVuZGVkIHdoZW4gYnVpbGRpbmcgYSBzeXN0ZW0gd2l0
aCBtdXNsLWxpYmMsCisJICBiZWNhdXNlIFRFWFRSRUxzIGFyZSBub3Qgc3VwcG9ydGVkIG9uIG11
c2wtbGliYydzIGR5bmFtaWMKKwkgIGxvYWRlciBhbmQgd2lsbCByZXN1bHQgaW4gYSBydW4tdGlt
ZSBjcmFzaDoKKworCSAgICBodHRwczovL3d3dy5vcGVud2FsbC5jb20vbGlzdHMvbXVzbC8yMDIw
LzA5LzI1LzQKKwogY29uZmlnIEJSMl9GT1JUSUZZX1NPVVJDRV9BUkNIX1NVUFBPUlRTCiAJYm9v
bAogCWRlZmF1bHQgeQpkaWZmIC0tZ2l0IGEvcGFja2FnZS9NYWtlZmlsZS5pbiBiL3BhY2thZ2Uv
TWFrZWZpbGUuaW4KaW5kZXggZjQxNWU1NWY4NC4uNjhlZmQzOWRiYSAxMDA2NDQKLS0tIGEvcGFj
a2FnZS9NYWtlZmlsZS5pbgorKysgYi9wYWNrYWdlL01ha2VmaWxlLmluCkBAIC0xNDksNiArMTQ5
LDEwIEBAIGVuZGlmCgogVEFSR0VUX0xERkxBR1MgPSAkKGNhbGwgcXN0cmlwLCQoQlIyX1RBUkdF
VF9MREZMQUdTKSkKCitpZmVxICgkKEJSMl9MSU5LX1pURVhUKSx5KQorVEFSR0VUX0xERkxBR1Mg
Kz0gLXogdGV4dAorZW5kaWYKKwogIyBCeSBkZXNpZ24sIF9GT1JUSUZZX1NPVVJDRSByZXF1aXJl
cyBnY2Mgb3B0aW1pemF0aW9uIHRvIGJlIGVuYWJsZWQuCiAjIFRoZXJlZm9yZSwgd2UgbmVlZCB0
byBwYXNzIF9GT1JUSUZZX1NPVVJDRSBhbmQgdGhlIG9wdGltaXphdGlvbiBsZXZlbAogIyB0aHJv
dWdoIHRoZSBzYW1lIG1lY2hhbmlzbSwgaS5lIGN1cnJlbnRseSB0aHJvdWdoIENGTEFHUy4gUGFz
c2luZwoKLS0KMi40My4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0
dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=

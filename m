Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3DA3C30653
	for <buildroot@archiver.kernel.org>; Thu,  4 Jul 2024 19:49:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5DD33812AE;
	Thu,  4 Jul 2024 19:49:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DuZ18NXKtddM; Thu,  4 Jul 2024 19:49:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 41EDA8129B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 41EDA8129B;
	Thu,  4 Jul 2024 19:49:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 40C791BF2C1
 for <buildroot@lists.busybox.net>; Thu,  4 Jul 2024 19:49:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3BF436086D
 for <buildroot@lists.busybox.net>; Thu,  4 Jul 2024 19:49:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IQSZ_gr1cxLG for <buildroot@lists.busybox.net>;
 Thu,  4 Jul 2024 19:49:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.20;
 helo=mout.gmx.net; envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 94B0D60878
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 94B0D60878
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 94B0D60878
 for <buildroot@buildroot.org>; Thu,  4 Jul 2024 19:49:46 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from probook ([89.0.46.161]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N63VY-1sMzVQ1ngG-00saC7; Thu, 04
 Jul 2024 21:49:44 +0200
Date: Thu, 04 Jul 2024 21:49:43 +0200
MIME-Version: 1.0
Message-Id: <20240704-snooze-v1-1-f9e845f0d813@gmx.net>
X-B4-Tracking: v=1; b=H4sIANb8hmYC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDcwMT3eK8/PyqVF2TNCNDgzRTk9QkCwMloOKCotS0zAqwQdGxtbUA7SW
 UOFgAAAA=
To: buildroot@buildroot.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720122584; l=4375;
 i=j.neuschaefer@gmx.net; s=20240329; h=from:subject:message-id;
 bh=p6caovLYX+zKGABw4kUcp8pLXn70egZ6bGxppdgObvQ=;
 b=1dUwiyAeIiWeq7qRzsUy5nvPXYh5oNJhCg3usFm+wIuPXgYpfA9qzQEKgGg3IuWPEpGP5YAeg
 cnZ31aK+6MLDBHlPyrzom6A8+CrvL0VmaaaAUtYRuXlqpFGp6I9Ih64
X-Developer-Key: i=j.neuschaefer@gmx.net; a=ed25519;
 pk=NIe0bK42wNaX/C4bi6ezm7NJK0IQE+8MKBm7igFMIS4=
X-Provags-ID: V03:K1:AqQj+I0XkmE4fBQ7tOSKBDqm8qxB0DYnlEYY2Sumz8335f9ek/V
 oHdxv/wzPJvgoGqGqfK8EIF2JPfD+q/nGddG2dDEukeqDjd8wNnoU6hDMASXbhtz54phAPI
 1gQMvh3tNhqN0z/iWEsC4jLe83GCun6r/l/JK4yfMSJw74G/uWZUEqnL6VVQRTMVg/6gS30
 0bKxCt1oQxxOmZCAkdsvQ==
UI-OutboundReport: notjunk:1;M01:P0:2L/CJcmEHHs=;XR/SW7HP8FM0s3/8FaRCP04PI1s
 3MI3o+R7AYMK+Yc5mLhrcF47tKfOk9+dFI5R8SkZPl5VJIT/EMC4/ZVMd2oWg6ZgSE2bZVfaJ
 A055Tp3oN2+Tplc9TetpLprhauxVDADohVAfGlqbmnnA+uHTp7YoNpxZ7sCj+0ar2TJlU/r5R
 LfVFlJYrzX6gviz1ljnuxVnaSlrydXJTCkjBBP9BWPxTTRRAgxEN6TcyLN9JLwc3f2n2ji0e8
 1p1BNG2tfmiiqQb5Fel6cugETxXEqkF6F1h9YUReVkOeHPUczGHposiloKYoVF0jMogWCFfV1
 278A5qWDjaUAAq5vEpO4SvJIJpYeXkCPrjMSF3VDa22cp3yYUCgjhms3BOajdz96G5BINJIHF
 oLBEOKdgk9WwRU+M5Rerv1MZuTfvsaIdx+iJHxHAZCxsHJI8WK7za7AGJwQxlETaxsUlQiZAf
 uJjZdn1p7o6yg/73xzlPs2kZZ0/wcM1hkk+QG1MJFj8JKjvyKFqgbFpizMiegoRALoi7fZtzL
 UlEfRaHJpydkZDMlLExCS5Qb8WQ/cKFR+c4/SRp1PkemYAKeiMAd5AqLKf0Edk/x/9bwTrLJy
 cQFeUlyJCIuG3JEPyuhVLrUdlXFOWoMziqlgdyJmdNClSYs+SGf91/KZCOIfuy6pqlXtrQY4O
 RHIMbbhCY+/AtHMMkuGuG3BoszkTnmaXtYFvlfz8CAbWZPh/YjNMpuUrpqNHFipy7Es1jUwMM
 e76BXbOWrne/BzpunwDs8fAclbS3J8yNJhAVPwHj9/oBPa0Fuq7rvaUEt76F/k1+0aEULwpfX
 MuJFgvl9r9mGQ+3EGbHzeBF9kUSJ06xi6dU/dJZGNCUsg=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.net; 
 s=s31663417; t=1720122584; x=1720727384; i=j.neuschaefer@gmx.net;
 bh=u5RN61iHiMmTwEeW2RU2J1aO/Zb7CCIR/NuAMMauTco=;
 h=X-UI-Sender-Class:From:Date:Subject:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Message-Id:To:Cc:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=ISrBpxcR3EQ19vJfCSO53ellF3Z+hWUyN6VbUYQN1ZV25gE46gCIMS2LrNHf6Tgl
 ahjHFMLxKFdf53N3zOJ+JYwmGft8MqJYMaa7XKEqBPp7/mNhBTb15HEYEWXVA2cSH
 xRVTdFa99ayXUemzFrn3VafF/PxJSnUqfJ0XbJdy9NT5mNsdy2a1AZdLVDw8OV52U
 T6Yz7E5r6zbkPHj42t6JT5jCgzxs3D861rsfbVls8yI74cHknTBecH550WNMPDtmC
 zla4P/uJNTVhGMxaR/9e/OUafJL9CW8GcgOWcykbKvLd5xaAhJDK4VhUd4M4QEu11
 dLio8AuMZ0/Vu+3Axw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.net header.i=j.neuschaefer@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=ISrBpxcR
Subject: [Buildroot] [PATCH] snooze: new package
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
Cc: =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

U2lnbmVkLW9mZi1ieTogSi4gTmV1c2Now6RmZXIgPGoubmV1c2NoYWVmZXJAZ214Lm5ldD4KLS0t
CiBwYWNrYWdlL0NvbmZpZy5pbiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAx
ICsKIC4uLi9zbm9vemUvMDAwMS1maXgtc25vb3plLW4tZm9ybWF0LXN0cmluZy5wYXRjaCAgIHwg
MzggKysrKysrKysrKysrKysrKysrKysrKwogcGFja2FnZS9zbm9vemUvQ29uZmlnLmluICAgICAg
ICAgICAgICAgICAgICAgICAgICAgfCAgOCArKysrKwogcGFja2FnZS9zbm9vemUvc25vb3plLmhh
c2ggICAgICAgICAgICAgICAgICAgICAgICAgfCAgMyArKwogcGFja2FnZS9zbm9vemUvc25vb3pl
Lm1rICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAyOSArKysrKysrKysrKysrKysrKwogNSBm
aWxlcyBjaGFuZ2VkLCA3OSBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvcGFja2FnZS9Db25m
aWcuaW4gYi9wYWNrYWdlL0NvbmZpZy5pbgppbmRleCA0OGVmMWE2ZmRjLi5kMmRhYzZhNTU5IDEw
MDY0NAotLS0gYS9wYWNrYWdlL0NvbmZpZy5pbgorKysgYi9wYWNrYWdlL0NvbmZpZy5pbgpAQCAt
MjMzNCw2ICsyMzM0LDcgQEAgbWVudSAiTWlzY2VsbGFuZW91cyIKIAlzb3VyY2UgInBhY2thZ2Uv
cXBkZi9Db25maWcuaW4iCiAJc291cmNlICJwYWNrYWdlL3J0bF80MzMvQ29uZmlnLmluIgogCXNv
dXJjZSAicGFja2FnZS9zaGFyZWQtbWltZS1pbmZvL0NvbmZpZy5pbiIKKwlzb3VyY2UgInBhY2th
Z2Uvc25vb3plL0NvbmZpZy5pbiIKIAlzb3VyY2UgInBhY2thZ2Uvc3Vud2FpdC9Db25maWcuaW4i
CiAJc291cmNlICJwYWNrYWdlL3Rhc2tkL0NvbmZpZy5pbiIKIAlzb3VyY2UgInBhY2thZ2Uvd2lu
ZS9Db25maWcuaW4iCmRpZmYgLS1naXQgYS9wYWNrYWdlL3Nub296ZS8wMDAxLWZpeC1zbm9vemUt
bi1mb3JtYXQtc3RyaW5nLnBhdGNoIGIvcGFja2FnZS9zbm9vemUvMDAwMS1maXgtc25vb3plLW4t
Zm9ybWF0LXN0cmluZy5wYXRjaApuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAw
Li4zYTg3ODQ0ZWQ3Ci0tLSAvZGV2L251bGwKKysrIGIvcGFja2FnZS9zbm9vemUvMDAwMS1maXgt
c25vb3plLW4tZm9ybWF0LXN0cmluZy5wYXRjaApAQCAtMCwwICsxLDM4IEBACitGcm9tIDVmOWU2
MTZiMjlmZTI3MmZmZmJiMzFlNGI3ZWE4ZmY2MWY3ODE2MDEgTW9uIFNlcCAxNyAwMDowMDowMCAy
MDAxCitGcm9tOiBMZWFoIE5ldWtpcmNoZW4gPGxlYWhAdnV4dS5vcmc+CitEYXRlOiBXZWQsIDI5
IE1heSAyMDI0IDE5OjQyOjI3ICswMjAwCitTdWJqZWN0OiBbUEFUQ0hdIGZpeCAic25vb3plIC1u
IiBmb3JtYXQgc3RyaW5nCisKK0ZpeGVzICMyMi4KKworVXBzdHJlYW06IGh0dHBzOi8vZ2l0aHVi
LmNvbS9sZWFobmV1a2lyY2hlbi9zbm9vemUvY29tbWl0LzVmOWU2MTZiMjlmZTI3MmZmZmJiMzFl
NGI3ZWE4ZmY2MWY3ODE2MDEKKy0tLQorIHNub296ZS5jIHwgMTAgKysrKystLS0tLQorIDEgZmls
ZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCisKK2RpZmYgLS1naXQg
YS9zbm9vemUuYyBiL3Nub296ZS5jCitpbmRleCAwNmYwZDA3Li5lNDdhZDExIDEwMDY0NAorLS0t
IGEvc25vb3plLmMKKysrKyBiL3Nub296ZS5jCitAQCAtMzI5LDEzICszMjksMTMgQEAgbWFpbihp
bnQgYXJnYywgY2hhciAqYXJndltdKQorIAkJCWNoYXIgd2Vla3N0cls0XTsKKyAJCQlzdHJ1Y3Qg
dG0gKnRtID0gbG9jYWx0aW1lKCZ0KTsKKyAJCQlzdHJmdGltZSh3ZWVrc3RyLCBzaXplb2Ygd2Vl
a3N0ciwgIiVhIiwgdG0pOworLQkJCXByaW50ZigiJXMgJXMgJTJsZGQlM2xkaCUzbGRtJTNsZHMg
IiwKKysJCQlwcmludGYoIiVzICVzICUyZGQlM2RoJTNkbSUzZHMgIiwKKyAJCQkgICAgaXNvdGlt
ZSh0bSksCisgCQkJICAgIHdlZWtzdHIsCistCQkJICAgICgodCAtIG5vdykgLyAoNjAqNjAqMjQp
KSwKKy0JCQkgICAgKCh0IC0gbm93KSAvICg2MCo2MCkpICUgMjQsCistCQkJICAgICgodCAtIG5v
dykgLyA2MCkgJSA2MCwKKy0JCQkgICAgKHQgLSBub3cpICUgNjApOworKwkJCSAgICAoKGludCko
dCAtIG5vdykgLyAoNjAqNjAqMjQpKSwKKysJCQkgICAgKChpbnQpKHQgLSBub3cpIC8gKDYwKjYw
KSkgJSAyNCwKKysJCQkgICAgKChpbnQpKHQgLSBub3cpIC8gNjApICUgNjAsCisrCQkJICAgIChp
bnQpKHQgLSBub3cpICUgNjApOworIAkJCWlmKGppdHRlcikgeworIAkJCQlwcmludGYoIihwbHVz
IHVwIHRvICVkcyBmb3Igaml0dGVyKVxuIiwgaml0dGVyKTsKKyAJCQl9IGVsc2UgeworLS0KKzIu
NDMuMAorCmRpZmYgLS1naXQgYS9wYWNrYWdlL3Nub296ZS9Db25maWcuaW4gYi9wYWNrYWdlL3Nu
b296ZS9Db25maWcuaW4KbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMC4uMGUw
NjhjYjYwNwotLS0gL2Rldi9udWxsCisrKyBiL3BhY2thZ2Uvc25vb3plL0NvbmZpZy5pbgpAQCAt
MCwwICsxLDggQEAKK2NvbmZpZyBCUjJfUEFDS0FHRV9TTk9PWkUKKwlib29sICJzbm9vemUiCisJ
aGVscAorCSAgc25vb3plIGlzIGEgdG9vbCBmb3Igd2FpdGluZyB1bnRpbCBhIHBhcnRpY3VsYXIg
dGltZSBhbmQgdGhlbgorCSAgcnVubmluZyBhIGNvbW1hbmQuIFRvZ2V0aGVyIHdpdGggYSBzZXJ2
aWNlIHN1cGVydmlzaW9uIHN5c3RlbQorCSAgc3VjaCBhcyBydW5pdCwgdGhpcyBjYW4gYmUgdXNl
ZCB0byByZXBsYWNlIGNyb24oOCkuCisKKwkgIGh0dHBzOi8vZ2l0aHViLmNvbS9sZWFobmV1a2ly
Y2hlbi9zbm9vemUKZGlmZiAtLWdpdCBhL3BhY2thZ2Uvc25vb3plL3Nub296ZS5oYXNoIGIvcGFj
a2FnZS9zbm9vemUvc25vb3plLmhhc2gKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAw
MDAwMC4uYzE3MTBkODU3ZgotLS0gL2Rldi9udWxsCisrKyBiL3BhY2thZ2Uvc25vb3plL3Nub296
ZS5oYXNoCkBAIC0wLDAgKzEsMyBAQAorIyBMb2NhbGx5IGNvbXB1dGVkOgorc2hhMjU2ICBkNjNm
ZGU4NWQ5MzMzMTg4YmVkNTk5NmJhYWJkODMzZWFhMDA4NDJjZTExNzQ0M2ZmYmY4NzE5YzA5NGJl
NDE0ICBzbm9vemUtMC41LnRhci5negorc2hhMjU2ICAyY2VhNDMzZjg0YWZjZmQ5ZDU1NTE1OTA4
ZDNlYTY5ZWQxZGYwMGZmYmY5MGNjNDhjZDY4ZDcyYTJiNDY0NTQ0ICBSRUFETUUubWQKZGlmZiAt
LWdpdCBhL3BhY2thZ2Uvc25vb3plL3Nub296ZS5tayBiL3BhY2thZ2Uvc25vb3plL3Nub296ZS5t
awpuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAwLi5hNTJiMzhhYmQ4Ci0tLSAv
ZGV2L251bGwKKysrIGIvcGFja2FnZS9zbm9vemUvc25vb3plLm1rCkBAIC0wLDAgKzEsMjkgQEAK
KyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCisjCisjIHNub296ZQorIworIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMKKworU05PT1pFX1ZFUlNJT04gPSAwLjUKK1NOT09aRV9TSVRFID0gJChjYWxsIGdp
dGh1YixsZWFobmV1a2lyY2hlbixzbm9vemUsdiQoU05PT1pFX1ZFUlNJT04pKQorU05PT1pFX0xJ
Q0VOU0UgPSBDQzAtMS4wCisKKyMgVW5mb3J0dW5hdGVseSwgc25vb3plIGRvZXNuJ3QgaGF2ZSBh
IGRlZGljYXRlZCBmaWxlIGZvciB0aGUgbGljZW5zZSwgYnV0IGl0CisjIGlzIG1lbnRpb25lZCBp
biB0aGUgUkVBRE1FIGFuZCBpbiB0aGUgbWFucGFnZS4KK1NOT09aRV9MSUNFTlNFX0ZJTEVTID0g
UkVBRE1FLm1kCisKK1NOT09aRV9NQUtFX09QVFMgPSBcCisJCSAgIFBSRUZJWD0vIFwKKwkJICAg
REVTVERJUj0kKFRBUkdFVF9ESVIpIFwKKwkJICAgQ0M9JChUQVJHRVRfQ0MpIFwKKwkJICAgTEQ9
JChUQVJHRVRfTEQpCisKK2RlZmluZSBTTk9PWkVfQlVJTERfQ01EUworCSQoTUFLRSkgLUMgJChA
RCkvICQoU05PT1pFX01BS0VfT1BUUykKK2VuZGVmCisKK2RlZmluZSBTTk9PWkVfSU5TVEFMTF9U
QVJHRVRfQ01EUworCSQoTUFLRSkgLUMgJChARCkvICQoU05PT1pFX01BS0VfT1BUUykgaW5zdGFs
bAorZW5kZWYKKworJChldmFsICQoZ2VuZXJpYy1wYWNrYWdlKSkKCi0tLQpiYXNlLWNvbW1pdDog
M2ViYzdjNjlkNTY0MzBjMzRlYmE0Yzg2OWQxZDRmZTRkMWU4ZGU1NQpjaGFuZ2UtaWQ6IDIwMjQw
NzA0LXNub296ZS00ZjIxMGY1NGViODAKCkJlc3QgcmVnYXJkcywKLS0KSi4gTmV1c2Now6RmZXIg
PGoubmV1c2NoYWVmZXJAZ214Lm5ldD4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9v
dC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRy
b290Cg==

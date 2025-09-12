Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79191CA101F
	for <buildroot@archiver.kernel.org>; Fri, 12 Sep 2025 21:23:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 47706613B3;
	Fri, 12 Sep 2025 21:23:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RvVpNTpx6lKs; Fri, 12 Sep 2025 21:23:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AF2CE61386
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AF2CE61386;
	Fri, 12 Sep 2025 21:23:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id D993F943
 for <buildroot@buildroot.org>; Fri, 12 Sep 2025 21:23:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CC3DF83D46
 for <buildroot@buildroot.org>; Fri, 12 Sep 2025 21:23:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qshcrZe8ZFHJ for <buildroot@buildroot.org>;
 Fri, 12 Sep 2025 21:23:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.155.165;
 helo=smtpdh20-2.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9988B83D41
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9988B83D41
Received: from smtpdh20-2.aruba.it (smtpdh20-2.aruba.it [62.149.155.165])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9988B83D41
 for <buildroot@buildroot.org>; Fri, 12 Sep 2025 21:23:06 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id xBEVutAGSqg4pxBEWuHfcL; Fri, 12 Sep 2025 23:23:04 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Joseph Kogut <joseph.kogut@gmail.com>, Petr Vorel <petr.vorel@gmail.com>
Date: Fri, 12 Sep 2025 23:22:56 +0200
Message-ID: <20250912212302.1057923-2-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250912212302.1057923-1-giulio.benetti@benettiengineering.com>
References: <20250912212302.1057923-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfLLMhbc87dZB6/xbehw1HvUDEPmRTgewQdCTqBaJGr+MG1OChnx/cTAuLZYAttglhpzOAJmBixpJ05LFrXGKeebhJ+bBF3fjBYY11w1z7Ckrefns2RPE
 0Nq3EyMtqe4WJYHvXdILXoIVGZBhBj/POcLXfEOUVFGIeToI3B+73qf3sDP/KvOVUVPxDR3f8ql4qsLYu3czGp6rU4j+oKXZMgI46E0IbYzOw9s0TROHG+dM
 s4WKNrURJLobKFTHmJjT9G0yYzmqteRV0XvQe6cFyTtiLCiHFhLkg0JnkPqqrTWFZkqpHKBKohl4T2S/KldMLVh6RpAkB6SX+H23EOFgE2FxdHwc/dFdV/iB
 JDFtJi9J
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1757712184; bh=3W/DX5W6ipLTyR+OE15G0n6wWNKeh1c9cGO6auvXTWo=;
 h=From:To:Subject:Date:MIME-Version:Content-Type;
 b=R12oWjVtb+aGv54Unc9Omq/dbaNtzsNBpTY0HxYFBYI/DLuEuomKmBkMdhcnVo0dq
 KZ/WzVbXo4pPWuv08lxVTc2H9FLT4w2uO1BE7Oaetc1/LoF7ShDf5lo4XEy2GofpS2
 5Ofw2XQIJ5o6/nAhyKntdHh6v9VeISNA8joW5fSV9p12iaIJhigBvzH35/sOwHELQp
 Kh1zOHYMlg+9ms7AjmZU9PJRv1/cYQ00yqaoo4YhTW4NyC/o5ehZLNu8vE9ftYe8/k
 Ok0D8hQajAl9XljJZyLDgBzZGFnCib5TuX2neFpGeg0txNaADvVAQ39hfk8y/OsqdD
 PvaM0ySu38JgQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=R12oWjVt
Subject: [Buildroot] [PATCH] package/nfs-utils: bump version to 2.8.4
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

UmVsZWFzZSBhbm5vdW5jZToKaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtbmZzLzZmMjcx
YzAxLWNkNGItNDU2Yi04MGFjLTc3YTk2Yjk5YTFmZUByZWRoYXQuY29tLwoKU2lnbmVkLW9mZi1i
eTogR2l1bGlvIEJlbmV0dGkgPGdpdWxpby5iZW5ldHRpQGJlbmV0dGllbmdpbmVlcmluZy5jb20+
Ci0tLQogLi4uLzAwMDEtRml4LWJ1aWxkLXdpdGgtZ2xpYmMtMi40Mi5wYXRjaCAgICAgIHwgNTkg
LS0tLS0tLS0tLS0tLS0tLS0tLQogcGFja2FnZS9uZnMtdXRpbHMvbmZzLXV0aWxzLmhhc2ggICAg
ICAgICAgICAgIHwgIDQgKy0KIHBhY2thZ2UvbmZzLXV0aWxzL25mcy11dGlscy5tayAgICAgICAg
ICAgICAgICB8ICAyICstCiAzIGZpbGVzIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgNjIgZGVs
ZXRpb25zKC0pCiBkZWxldGUgbW9kZSAxMDA2NDQgcGFja2FnZS9uZnMtdXRpbHMvMDAwMS1GaXgt
YnVpbGQtd2l0aC1nbGliYy0yLjQyLnBhdGNoCgpkaWZmIC0tZ2l0IGEvcGFja2FnZS9uZnMtdXRp
bHMvMDAwMS1GaXgtYnVpbGQtd2l0aC1nbGliYy0yLjQyLnBhdGNoIGIvcGFja2FnZS9uZnMtdXRp
bHMvMDAwMS1GaXgtYnVpbGQtd2l0aC1nbGliYy0yLjQyLnBhdGNoCmRlbGV0ZWQgZmlsZSBtb2Rl
IDEwMDY0NAppbmRleCA2YmYzNjIyNTg2Li4wMDAwMDAwMDAwCi0tLSBhL3BhY2thZ2UvbmZzLXV0
aWxzLzAwMDEtRml4LWJ1aWxkLXdpdGgtZ2xpYmMtMi40Mi5wYXRjaAorKysgL2Rldi9udWxsCkBA
IC0xLDU5ICswLDAgQEAKLUZyb20gOWY5NzQwNDZjMzdiN2MyODcwNWQ1NTU4MzI4NzU5ZmZmNzA4
YjFjYiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKLUZyb206IFlhYWtvdiBTZWxrb3dpdHogPHlz
ZWxrb3dpQHJlZGhhdC5jb20+Ci1EYXRlOiBGcmksIDI3IEp1biAyMDI1IDA0OjU0OjA4IC0wNTAw
Ci1TdWJqZWN0OiBGaXggYnVpbGQgd2l0aCBnbGliYy0yLjQyCi1NSU1FLVZlcnNpb246IDEuMAot
Q29udGVudC1UeXBlOiB0ZXh0L3BsYWluOyBjaGFyc2V0PVVURi04Ci1Db250ZW50LVRyYW5zZmVy
LUVuY29kaW5nOiA4Yml0Ci0KLWV4cG9ydGZzLmM6IEluIGZ1bmN0aW9uIOKAmHJlbGVhc2VfbG9j
a2ZpbGXigJk6Ci1leHBvcnRmcy5jOjgzOjE3OiBlcnJvcjogaWdub3JpbmcgcmV0dXJuIHZhbHVl
IG9mIOKAmGxvY2tm4oCZIGRlY2xhcmVkIHdpdGggYXR0cmlidXRlIOKAmHdhcm5fdW51c2VkX3Jl
c3VsdOKAmSBbLVdlcnJvcj11bnVzZWQtcmVzdWx0XQotICAgODMgfCAgICAgICAgICAgICAgICAg
bG9ja2YoX2xvY2tmZCwgRl9VTE9DSywgMCk7Ci0gICAgICB8ICAgICAgICAgICAgICAgICBefn5+
fn5+fn5+fn5+fn5+fn5+fn5+fn5+fgotZXhwb3J0ZnMuYzogSW4gZnVuY3Rpb24g4oCYZ3JhYl9s
b2NrZmlsZeKAmToKLWV4cG9ydGZzLmM6Nzc6MTc6IGVycm9yOiBpZ25vcmluZyByZXR1cm4gdmFs
dWUgb2Yg4oCYbG9ja2bigJkgZGVjbGFyZWQgd2l0aCBhdHRyaWJ1dGUg4oCYd2Fybl91bnVzZWRf
cmVzdWx04oCZIFstV2Vycm9yPXVudXNlZC1yZXN1bHRdCi0gICA3NyB8ICAgICAgICAgICAgICAg
ICBsb2NrZihfbG9ja2ZkLCBGX0xPQ0ssIDApOwotICAgICAgfCAgICAgICAgICAgICAgICAgXn5+
fn5+fn5+fn5+fn5+fn5+fn5+fn5+fgotCi1sb2NrZiBpcyBub3cgbWFya2VkIHdpdGggYXR0cmli
dXRlIHdhcm5fdW51c2VkX3Jlc3VsdDoKLQotaHR0cHM6Ly9zb3VyY2V3YXJlLm9yZy9naXQvP3A9
Z2xpYmMuZ2l0O2E9Y29tbWl0ZGlmZjtoPWYzYzgyZmMxYjQxMjYxZjU4MmY1ZjlmYTEyZjc0YWY5
YmNiYzg4ZjkKLQotU2lnbmVkLW9mZi1ieTogU3RldmUgRGlja3NvbiA8c3RldmVkQHJlZGhhdC5j
b20+Ci0KLVVwc3RyZWFtOiBodHRwczovL2dpdC5saW51eC1uZnMub3JnLz9wPXN0ZXZlZC9uZnMt
dXRpbHMuZ2l0O2E9Y29tbWl0O2g9OWY5NzQwNDZjMzdiN2MyODcwNWQ1NTU4MzI4NzU5ZmZmNzA4
YjFjYgotCi1TaWduZWQtb2ZmLWJ5OiBCZXJuZCBLdWhscyA8YmVybmRAa3VobHMubmV0PgotLS0t
Ci0gdXRpbHMvZXhwb3J0ZnMvZXhwb3J0ZnMuYyB8IDEwICsrKysrKysrLS0KLSAxIGZpbGUgY2hh
bmdlZCwgOCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQotCi1kaWZmIC0tZ2l0IGEvdXRp
bHMvZXhwb3J0ZnMvZXhwb3J0ZnMuYyBiL3V0aWxzL2V4cG9ydGZzL2V4cG9ydGZzLmMKLWluZGV4
IGIwM2EwNDdiLi43NDhjMzhlMyAxMDA2NDQKLS0tLSBhL3V0aWxzL2V4cG9ydGZzL2V4cG9ydGZz
LmMKLSsrKyBiL3V0aWxzL2V4cG9ydGZzL2V4cG9ydGZzLmMKLUBAIC03NCwxMyArNzQsMTkgQEAg
Z3JhYl9sb2NrZmlsZSh2b2lkKQotIHsKLSAJX2xvY2tmZCA9IG9wZW4obG9ja2ZpbGUsIE9fQ1JF
QVR8T19SRFdSLCAwNjY2KTsKLSAJaWYgKF9sb2NrZmQgIT0gLTEpCi0tCQlsb2NrZihfbG9ja2Zk
LCBGX0xPQ0ssIDApOwotKwkJaWYgKGxvY2tmKF9sb2NrZmQsIEZfTE9DSywgMCkgIT0gMCkgewot
KwkJCXhsb2dfd2FybigiJXM6IGxvY2tmKCkgZmFpbGVkOiBlcnJubyAlZCAoJXMpIiwKLSsJCQlf
X2Z1bmNfXywgZXJybm8sIHN0cmVycm9yKGVycm5vKSk7Ci0rCQl9Ci0gfQotIHN0YXRpYyB2b2lk
Ci0gcmVsZWFzZV9sb2NrZmlsZSh2b2lkKQotIHsKLSAJaWYgKF9sb2NrZmQgIT0gLTEpIHsKLS0J
CWxvY2tmKF9sb2NrZmQsIEZfVUxPQ0ssIDApOwotKwkJaWYgKGxvY2tmKF9sb2NrZmQsIEZfVUxP
Q0ssIDApICE9IDApIHsKLSsJCQl4bG9nX3dhcm4oIiVzOiBsb2NrZigpIGZhaWxlZDogZXJybm8g
JWQgKCVzKSIsCi0rCQkJX19mdW5jX18sIGVycm5vLCBzdHJlcnJvcihlcnJubykpOwotKwkJfQot
IAkJY2xvc2UoX2xvY2tmZCk7Ci0gCQlfbG9ja2ZkID0gLTE7Ci0gCX0KLS0tIAotY2dpdCB2MS4y
LjMKLQpkaWZmIC0tZ2l0IGEvcGFja2FnZS9uZnMtdXRpbHMvbmZzLXV0aWxzLmhhc2ggYi9wYWNr
YWdlL25mcy11dGlscy9uZnMtdXRpbHMuaGFzaAppbmRleCBhZjVmYzhiZDczLi5mYjVjMDNkOTE3
IDEwMDY0NAotLS0gYS9wYWNrYWdlL25mcy11dGlscy9uZnMtdXRpbHMuaGFzaAorKysgYi9wYWNr
YWdlL25mcy11dGlscy9uZnMtdXRpbHMuaGFzaApAQCAtMSw0ICsxLDQgQEAKLSMgRnJvbSBodHRw
czovL3d3dy5rZXJuZWwub3JnL3B1Yi9saW51eC91dGlscy9uZnMtdXRpbHMvMi44LjMvc2hhMjU2
c3Vtcy5hc2MKLXNoYTI1NiAgMTFlN2M1ODQ3YTg0MjNhNzI5MzFjODY1YmQ5Mjk2ZTdmZDU2ZmYy
NzBhNzk1YTg0OTE4MzkwMDk2MTcxMTcyNSAgbmZzLXV0aWxzLTIuOC4zLnRhci54egorIyBGcm9t
IGh0dHBzOi8vd3d3Lmtlcm5lbC5vcmcvcHViL2xpbnV4L3V0aWxzL25mcy11dGlscy8yLjguNC9z
aGEyNTZzdW1zLmFzYworc2hhMjU2ICAxMWM0Y2M1OThhNDM0ZDdkMzQwYmFkM2UwNzJhMzczYmEx
ZGNjMmM0OWY4NTVkNDRiMjAyMjIyYjc4ZWNkYmY1ICBuZnMtdXRpbHMtMi44LjQudGFyLnh6CiAj
IExvY2FsbHkgY29tcHV0ZWQKIHNoYTI1NiAgNTc2NTQwYWJmNWU5NTAyOWFkNGFkOTBlMzIwNzEz
ODVhNWU5NWIyYzMwNzA4YzcwNjExNmYzZWI4N2I5YTNkZSAgQ09QWUlORwpkaWZmIC0tZ2l0IGEv
cGFja2FnZS9uZnMtdXRpbHMvbmZzLXV0aWxzLm1rIGIvcGFja2FnZS9uZnMtdXRpbHMvbmZzLXV0
aWxzLm1rCmluZGV4IDBhZjAyNTRkM2YuLmU3ZDgyYjEwYmEgMTAwNjQ0Ci0tLSBhL3BhY2thZ2Uv
bmZzLXV0aWxzL25mcy11dGlscy5taworKysgYi9wYWNrYWdlL25mcy11dGlscy9uZnMtdXRpbHMu
bWsKQEAgLTQsNyArNCw3IEBACiAjCiAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwogCi1ORlNfVVRJ
TFNfVkVSU0lPTiA9IDIuOC4zCitORlNfVVRJTFNfVkVSU0lPTiA9IDIuOC40CiBORlNfVVRJTFNf
U09VUkNFID0gbmZzLXV0aWxzLSQoTkZTX1VUSUxTX1ZFUlNJT04pLnRhci54egogTkZTX1VUSUxT
X1NJVEUgPSBodHRwczovL3d3dy5rZXJuZWwub3JnL3B1Yi9saW51eC91dGlscy9uZnMtdXRpbHMv
JChORlNfVVRJTFNfVkVSU0lPTikKIE5GU19VVElMU19MSUNFTlNFID0gR1BMLTIuMCsKLS0gCjIu
NDMuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVp
bGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3Rz
LmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK

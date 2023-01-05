Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73A3EC3DA7A
	for <buildroot@archiver.kernel.org>; Thu,  5 Jan 2023 13:01:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 186D540125;
	Thu,  5 Jan 2023 13:01:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 186D540125
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wbGuVZi_L5f8; Thu,  5 Jan 2023 13:01:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 16F8040C3C;
	Thu,  5 Jan 2023 13:01:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 16F8040C3C
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 77BB31BF318
 for <buildroot@lists.busybox.net>; Thu,  5 Jan 2023 13:00:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CB9F960AEA
 for <buildroot@lists.busybox.net>; Thu,  5 Jan 2023 13:00:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CB9F960AEA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WLlx50f7yeWA for <buildroot@lists.busybox.net>;
 Thu,  5 Jan 2023 13:00:24 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B999A60AF2
Received: from www530.your-server.de (www530.your-server.de [188.40.30.78])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B999A60AF2
 for <buildroot@buildroot.org>; Thu,  5 Jan 2023 13:00:23 +0000 (UTC)
Received: from sslproxy01.your-server.de ([78.46.139.224])
 by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.94.2) (envelope-from <martin@geanix.com>)
 id 1pDPr2-000LhZ-VK; Thu, 05 Jan 2023 14:00:20 +0100
Received: from [185.17.218.86] (helo=zen..)
 by sslproxy01.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <martin@geanix.com>)
 id 1pDPr2-00057W-Pf; Thu, 05 Jan 2023 14:00:20 +0100
From: =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@geanix.com>
To: buildroot@buildroot.org
Date: Thu,  5 Jan 2023 14:00:00 +0100
Message-Id: <20230105130000.682525-6-martin@geanix.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230105130000.682525-1-martin@geanix.com>
References: <20230105130000.682525-1-martin@geanix.com>
MIME-Version: 1.0
X-Authenticated-Sender: martin@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.7/26772/Thu Jan  5 10:42:43 2023)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=geanix.com; 
 s=default2211; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID;
 bh=FzKy5qNxFl7V29utHNM4WroB37t/Kv25NfPQgIUFDTU=; b=EvZ9QpA2loCNkwSaY8Wy8V/CD2
 JnyC2xKg5JBfKk3+7fpqdyIL3+KiFoAhanSzO99XF5OGBWQ/rbZkwa5Rzfcw4dO4riQCAhiEb/hMJ
 QvOQ8Qaox1C8wTV+axyQ1OuSfIjZkGmVYxShB1sBqc0R4e+xrFPJDALGgy+vyYnwkjCz675TjyBkK
 DFzDYdybnPmnjyrUrhTGIbE5HWZNxUrwQSmgbhuDXwLBTn0BmMk8+BkU/Ugz01EeiqKW4tcPGpr8T
 rihI8oyG86XAbL7UldxDrrptA9uh1W9mNH/WQ03ZmNnGC/YEKwzLnXib7dgil0NuyhJyD3zqxlDQg
 SXWMujwg==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=geanix.com header.i=@geanix.com
 header.a=rsa-sha256 header.s=default2211 header.b=EvZ9QpA2
Subject: [Buildroot] [PATCH 5/5] package/python-flask-smorest: new package
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
Cc: =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@geanix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

U2lnbmVkLW9mZi1ieTogTWFydGluIEh1bmRlYsO4bGwgPG1hcnRpbkBnZWFuaXguY29tPgotLS0K
IHBhY2thZ2UvQ29uZmlnLmluICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDEg
KwogcGFja2FnZS9weXRob24tZmxhc2stc21vcmVzdC9Db25maWcuaW4gICAgICAgICAgICAgfCAx
MSArKysrKysrKysrKwogLi4uL3B5dGhvbi1mbGFzay1zbW9yZXN0L3B5dGhvbi1mbGFzay1zbW9y
ZXN0Lmhhc2ggfCAgNSArKysrKwogLi4uL3B5dGhvbi1mbGFzay1zbW9yZXN0L3B5dGhvbi1mbGFz
ay1zbW9yZXN0Lm1rICAgfCAxNCArKysrKysrKysrKysrKwogNCBmaWxlcyBjaGFuZ2VkLCAzMSBp
bnNlcnRpb25zKCspCiBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9weXRob24tZmxhc2stc21v
cmVzdC9Db25maWcuaW4KIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL3B5dGhvbi1mbGFzay1z
bW9yZXN0L3B5dGhvbi1mbGFzay1zbW9yZXN0Lmhhc2gKIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNr
YWdlL3B5dGhvbi1mbGFzay1zbW9yZXN0L3B5dGhvbi1mbGFzay1zbW9yZXN0Lm1rCgpkaWZmIC0t
Z2l0IGEvcGFja2FnZS9Db25maWcuaW4gYi9wYWNrYWdlL0NvbmZpZy5pbgppbmRleCBlM2EwOTAw
ODY2Li4wNTY0ZDg2ODg1IDEwMDY0NAotLS0gYS9wYWNrYWdlL0NvbmZpZy5pbgorKysgYi9wYWNr
YWdlL0NvbmZpZy5pbgpAQCAtMTA1NSw2ICsxMDU1LDcgQEAgbWVudSAiRXh0ZXJuYWwgcHl0aG9u
IG1vZHVsZXMiCiAJc291cmNlICJwYWNrYWdlL3B5dGhvbi1mbGFzay1leHBlY3RzLWpzb24vQ29u
ZmlnLmluIgogCXNvdXJjZSAicGFja2FnZS9weXRob24tZmxhc2stanNvbnJwYy9Db25maWcuaW4i
CiAJc291cmNlICJwYWNrYWdlL3B5dGhvbi1mbGFzay1sb2dpbi9Db25maWcuaW4iCisJc291cmNl
ICJwYWNrYWdlL3B5dGhvbi1mbGFzay1zbW9yZXN0L0NvbmZpZy5pbiIKIAlzb3VyY2UgInBhY2th
Z2UvcHl0aG9uLWZsYXNrLXNxbGFsY2hlbXkvQ29uZmlnLmluIgogCXNvdXJjZSAicGFja2FnZS9w
eXRob24tZmxhc2std3RmL0NvbmZpZy5pbiIKIAlzb3VyY2UgInBhY2thZ2UvcHl0aG9uLWZsYXRi
dWZmZXJzL0NvbmZpZy5pbiIKZGlmZiAtLWdpdCBhL3BhY2thZ2UvcHl0aG9uLWZsYXNrLXNtb3Jl
c3QvQ29uZmlnLmluIGIvcGFja2FnZS9weXRob24tZmxhc2stc21vcmVzdC9Db25maWcuaW4KbmV3
IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMC4uYThjY2ZiZDlmNwotLS0gL2Rldi9u
dWxsCisrKyBiL3BhY2thZ2UvcHl0aG9uLWZsYXNrLXNtb3Jlc3QvQ29uZmlnLmluCkBAIC0wLDAg
KzEsMTEgQEAKK2NvbmZpZyBCUjJfUEFDS0FHRV9QWVRIT05fRkxBU0tfU01PUkVTVAorCWJvb2wg
InB5dGhvbi1mbGFzay1zbW9yZXN0IgorCXNlbGVjdCBCUjJfUEFDS0FHRV9QWVRIT05fQVBJU1BF
QyAjIHJ1bnRpbWUKKwlzZWxlY3QgQlIyX1BBQ0tBR0VfUFlUSE9OX0ZMQVNLICMgcnVudGltZQor
CXNlbGVjdCBCUjJfUEFDS0FHRV9QWVRIT05fTUFSU0hNQUxMT1cgIyBydW50aW1lCisJc2VsZWN0
IEJSMl9QQUNLQUdFX1BZVEhPTl9XRUJBUkdTICMgcnVudGltZQorCXNlbGVjdCBCUjJfUEFDS0FH
RV9QWVRIT05fV0VSS1pFVUcgIyBydW50aW1lCisJaGVscAorCSAgRmxhc2svTWFyc2htYWxsb3ct
YmFzZWQgUkVTVCBBUEkgZnJhbWV3b3JrLgorCisJICBodHRwczovL2dpdGh1Yi5jb20vbWFyc2ht
YWxsb3ctY29kZS9mbGFzay1zbW9yZXN0CmRpZmYgLS1naXQgYS9wYWNrYWdlL3B5dGhvbi1mbGFz
ay1zbW9yZXN0L3B5dGhvbi1mbGFzay1zbW9yZXN0Lmhhc2ggYi9wYWNrYWdlL3B5dGhvbi1mbGFz
ay1zbW9yZXN0L3B5dGhvbi1mbGFzay1zbW9yZXN0Lmhhc2gKbmV3IGZpbGUgbW9kZSAxMDA2NDQK
aW5kZXggMDAwMDAwMDAwMC4uNWFiZTBjNTAzMwotLS0gL2Rldi9udWxsCisrKyBiL3BhY2thZ2Uv
cHl0aG9uLWZsYXNrLXNtb3Jlc3QvcHl0aG9uLWZsYXNrLXNtb3Jlc3QuaGFzaApAQCAtMCwwICsx
LDUgQEAKKyMgbWQ1LCBzaGEyNTYgZnJvbSBodHRwczovL3B5cGkub3JnL3B5cGkvZmxhc2stc21v
cmVzdC9qc29uCittZDUgIDFkYWQ1MmYyNmM1OWNhMmRjYWYwYzVkMTA5ODc5NjA1ICBmbGFzay1z
bW9yZXN0LTAuNDAuMC50YXIuZ3oKK3NoYTI1NiAgOWI0NmI0OTM3Y2NmNzg3MDJkOTlmZWQ4Y2Zk
MWNkNWMzNzYwOGRkZWZkNjVmZjE2YTg2ZDFhZDVjN2Y3ZDhjMCAgZmxhc2stc21vcmVzdC0wLjQw
LjAudGFyLmd6CisjIExvY2FsbHkgY29tcHV0ZWQgc2hhMjU2IGNoZWNrc3Vtcworc2hhMjU2CTQw
OTk5ZWExZDljMWI4MjAyZmE0NGY4ZTY4NDlhNTU3ZTIyZGY4OTI0ODFlMDY3YWJmOTk5ODc5MDY0
Yjk1MjEgIExJQ0VOU0UKZGlmZiAtLWdpdCBhL3BhY2thZ2UvcHl0aG9uLWZsYXNrLXNtb3Jlc3Qv
cHl0aG9uLWZsYXNrLXNtb3Jlc3QubWsgYi9wYWNrYWdlL3B5dGhvbi1mbGFzay1zbW9yZXN0L3B5
dGhvbi1mbGFzay1zbW9yZXN0Lm1rCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAw
MDAuLjA2OWQ5MjQ0ZGQKLS0tIC9kZXYvbnVsbAorKysgYi9wYWNrYWdlL3B5dGhvbi1mbGFzay1z
bW9yZXN0L3B5dGhvbi1mbGFzay1zbW9yZXN0Lm1rCkBAIC0wLDAgKzEsMTQgQEAKKyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjCisjCisjIHB5dGhvbi1mbGFzay1zbW9yZXN0CisjCisjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIworCitQWVRIT05fRkxBU0tfU01PUkVTVF9WRVJTSU9OID0gMC40MC4wCitQ
WVRIT05fRkxBU0tfU01PUkVTVF9TT1VSQ0UgPSBmbGFzay1zbW9yZXN0LSQoUFlUSE9OX0ZMQVNL
X1NNT1JFU1RfVkVSU0lPTikudGFyLmd6CitQWVRIT05fRkxBU0tfU01PUkVTVF9TSVRFID0gaHR0
cHM6Ly9maWxlcy5weXRob25ob3N0ZWQub3JnL3BhY2thZ2VzL2U2L2I1LzFiODFlYTRmN2UzNzdj
ZjhhNjUzYWExMGMyNDk2NTZhMWM3M2RlN2EzNjk1YjI1NDRkN2E3MTNlYTNjMgorUFlUSE9OX0ZM
QVNLX1NNT1JFU1RfU0VUVVBfVFlQRSA9IHNldHVwdG9vbHMKK1BZVEhPTl9GTEFTS19TTU9SRVNU
X0xJQ0VOU0UgPSBNSVQKK1BZVEhPTl9GTEFTS19TTU9SRVNUX0xJQ0VOU0VfRklMRVMgPSBMSUNF
TlNFCisKKyQoZXZhbCAkKHB5dGhvbi1wYWNrYWdlKSkKLS0gCjIuMzkuMAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlz
dApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFp
bG1hbi9saXN0aW5mby9idWlsZHJvb3QK

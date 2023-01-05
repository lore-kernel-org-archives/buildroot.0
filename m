Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F722C3DA7A
	for <buildroot@archiver.kernel.org>; Thu,  5 Jan 2023 13:01:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CF60182146;
	Thu,  5 Jan 2023 13:01:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CF60182146
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wzUeB_ADi250; Thu,  5 Jan 2023 13:01:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id ECAC582147;
	Thu,  5 Jan 2023 13:01:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ECAC582147
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 184591BF96B
 for <buildroot@lists.busybox.net>; Thu,  5 Jan 2023 13:00:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E7075419DD
 for <buildroot@lists.busybox.net>; Thu,  5 Jan 2023 13:00:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E7075419DD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7vkNcyXySCrt for <buildroot@lists.busybox.net>;
 Thu,  5 Jan 2023 13:00:24 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A3AB3419DA
Received: from www530.your-server.de (www530.your-server.de [188.40.30.78])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A3AB3419DA
 for <buildroot@buildroot.org>; Thu,  5 Jan 2023 13:00:23 +0000 (UTC)
Received: from sslproxy01.your-server.de ([78.46.139.224])
 by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.94.2) (envelope-from <martin@geanix.com>)
 id 1pDPr2-000LhQ-Oq; Thu, 05 Jan 2023 14:00:20 +0100
Received: from [185.17.218.86] (helo=zen..)
 by sslproxy01.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <martin@geanix.com>)
 id 1pDPr2-00057W-Iz; Thu, 05 Jan 2023 14:00:20 +0100
From: =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@geanix.com>
To: buildroot@buildroot.org
Date: Thu,  5 Jan 2023 13:59:58 +0100
Message-Id: <20230105130000.682525-4-martin@geanix.com>
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
 bh=3oME+3148Ci6SHZ6LHbgrZZj/0XQZtMieBNWqXC0kQE=; b=SumbnyCcNysiesXg0wv7efPoTh
 fS5VmQTOQUDHKjFrUvvj11r55w5BLZPCIhERJfUK+mAAJ1YoQ3JzZxeYiQmoJzMeCmLrxvlExvaZ+
 x0yKeirG+PeAwy+W9NzAEpVGTgoJcBBVM5qEET1BsgyBkA5Tix5r0N9YrfwUkwEKDQgq3UEp5wJ5N
 wMKzqPeqWH5/nJaa5vs+e/iePrwLWk2XLoodunCwFWpym0lbSwrzZtW2m3N+pKeUrlCxUBBuq0T9S
 A00HJMmBt5il7/mdrmNX4cIauhyZ3524ZymtQTi5xaE2fLFugTiLa23ok6UBGSyj1k8LecqTbujmP
 +OpG17dw==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=geanix.com header.i=@geanix.com
 header.a=rsa-sha256 header.s=default2211 header.b=SumbnyCc
Subject: [Buildroot] [PATCH 3/5] package/python-marshmallow: new package
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

bWFyc2htYWxsb3cgaXMgYSBkZXBlbmRlbmN5IG9mIHRvLWJlLWFkZGVkIHB5dGhvbi1mbGFzay1z
bW9yZXN0LgoKU2lnbmVkLW9mZi1ieTogTWFydGluIEh1bmRlYsO4bGwgPG1hcnRpbkBnZWFuaXgu
Y29tPgotLS0KIHBhY2thZ2UvQ29uZmlnLmluICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHwgIDEgKwogcGFja2FnZS9weXRob24tbWFyc2htYWxsb3cvQ29uZmlnLmluICAgICAgICAg
ICAgICAgfCAgOCArKysrKysrKwogcGFja2FnZS9weXRob24tbWFyc2htYWxsb3cvcHl0aG9uLW1h
cnNobWFsbG93Lmhhc2ggfCAgNiArKysrKysKIHBhY2thZ2UvcHl0aG9uLW1hcnNobWFsbG93L3B5
dGhvbi1tYXJzaG1hbGxvdy5tayAgIHwgMTQgKysrKysrKysrKysrKysKIDQgZmlsZXMgY2hhbmdl
ZCwgMjkgaW5zZXJ0aW9ucygrKQogY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvcHl0aG9uLW1h
cnNobWFsbG93L0NvbmZpZy5pbgogY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvcHl0aG9uLW1h
cnNobWFsbG93L3B5dGhvbi1tYXJzaG1hbGxvdy5oYXNoCiBjcmVhdGUgbW9kZSAxMDA2NDQgcGFj
a2FnZS9weXRob24tbWFyc2htYWxsb3cvcHl0aG9uLW1hcnNobWFsbG93Lm1rCgpkaWZmIC0tZ2l0
IGEvcGFja2FnZS9Db25maWcuaW4gYi9wYWNrYWdlL0NvbmZpZy5pbgppbmRleCBlMDVmNDI3MWUz
Li5mNWI3YzEwMGVkIDEwMDY0NAotLS0gYS9wYWNrYWdlL0NvbmZpZy5pbgorKysgYi9wYWNrYWdl
L0NvbmZpZy5pbgpAQCAtMTEyMSw2ICsxMTIxLDcgQEAgbWVudSAiRXh0ZXJuYWwgcHl0aG9uIG1v
ZHVsZXMiCiAJc291cmNlICJwYWNrYWdlL3B5dGhvbi1tYXJrZG93bi9Db25maWcuaW4iCiAJc291
cmNlICJwYWNrYWdlL3B5dGhvbi1tYXJrZG93bjIvQ29uZmlnLmluIgogCXNvdXJjZSAicGFja2Fn
ZS9weXRob24tbWFya3Vwc2FmZS9Db25maWcuaW4iCisJc291cmNlICJwYWNrYWdlL3B5dGhvbi1t
YXJzaG1hbGxvdy9Db25maWcuaW4iCiAJc291cmNlICJwYWNrYWdlL3B5dGhvbi1tYXRwbG90bGli
L0NvbmZpZy5pbiIKIAlzb3VyY2UgInBhY2thZ2UvcHl0aG9uLW1ic3RyZGVjb2Rlci9Db25maWcu
aW4iCiAJc291cmNlICJwYWNrYWdlL3B5dGhvbi1tZW1vcnktcHJvZmlsZXIvQ29uZmlnLmluIgpk
aWZmIC0tZ2l0IGEvcGFja2FnZS9weXRob24tbWFyc2htYWxsb3cvQ29uZmlnLmluIGIvcGFja2Fn
ZS9weXRob24tbWFyc2htYWxsb3cvQ29uZmlnLmluCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4
IDAwMDAwMDAwMDAuLmNjMWI0MmY0NjUKLS0tIC9kZXYvbnVsbAorKysgYi9wYWNrYWdlL3B5dGhv
bi1tYXJzaG1hbGxvdy9Db25maWcuaW4KQEAgLTAsMCArMSw4IEBACitjb25maWcgQlIyX1BBQ0tB
R0VfUFlUSE9OX01BUlNITUFMTE9XCisJYm9vbCAicHl0aG9uLW1hcnNobWFsbG93IgorCXNlbGVj
dCBCUjJfUEFDS0FHRV9QWVRIT05fUEFDS0FHSU5HICMgcnVudGltZQorCWhlbHAKKwkgIEEgbGln
aHR3ZWlnaHQgbGlicmFyeSBmb3IgY29udmVydGluZyBjb21wbGV4IGRhdGF0eXBlcyB0bworCSAg
YW5kIGZyb20gbmF0aXZlIFB5dGhvbiBkYXRhdHlwZXMuCisKKwkgIGh0dHBzOi8vZ2l0aHViLmNv
bS9tYXJzaG1hbGxvdy1jb2RlL21hcnNobWFsbG93CmRpZmYgLS1naXQgYS9wYWNrYWdlL3B5dGhv
bi1tYXJzaG1hbGxvdy9weXRob24tbWFyc2htYWxsb3cuaGFzaCBiL3BhY2thZ2UvcHl0aG9uLW1h
cnNobWFsbG93L3B5dGhvbi1tYXJzaG1hbGxvdy5oYXNoCm5ldyBmaWxlIG1vZGUgMTAwNjQ0Cmlu
ZGV4IDAwMDAwMDAwMDAuLmRjMjc3ZDE2ZTUKLS0tIC9kZXYvbnVsbAorKysgYi9wYWNrYWdlL3B5
dGhvbi1tYXJzaG1hbGxvdy9weXRob24tbWFyc2htYWxsb3cuaGFzaApAQCAtMCwwICsxLDYgQEAK
KyMgbWQ1LCBzaGEyNTYgZnJvbSBodHRwczovL3B5cGkub3JnL3B5cGkvbWFyc2htYWxsb3cvanNv
bgorbWQ1ICAzY2Y1YzQyOTE3NTA5YTE5OWMzMTA1NDY2NDM1YzQyNSAgbWFyc2htYWxsb3ctMy4x
OS4wLnRhci5negorc2hhMjU2ICA5MDAzMmMwZmQ2NTBjZTk0YjZlYzZkYzhkZmViMGUzZmY1MGMx
NDQ1ODY0NjJjMzg5YjgxYTA3MjA1YmVkYjc4ICBtYXJzaG1hbGxvdy0zLjE5LjAudGFyLmd6Cisj
IExvY2FsbHkgY29tcHV0ZWQgc2hhMjU2IGNoZWNrc3Vtcworc2hhMjU2ICA3NTlkYzc5YzM4M2Fk
NzkzNDBjNmU0MWY3MTJlODA0MDdmZTBkMmNiM2NiYWFkMWVkOThhYTljM2UyOGE2MDJjICBMSUNF
TlNFCitzaGEyNTYgIGY5ODJlNmZkOTdiYTAwOTczZTk0NjA1Yjk3MmZmMDQ4OTRiMjJjNGZhOTM3
Yjg2ODgyOGIzMmFlOGYwYTdjMmUgIGRvY3MvbGljZW5zZS5yc3QKZGlmZiAtLWdpdCBhL3BhY2th
Z2UvcHl0aG9uLW1hcnNobWFsbG93L3B5dGhvbi1tYXJzaG1hbGxvdy5tayBiL3BhY2thZ2UvcHl0
aG9uLW1hcnNobWFsbG93L3B5dGhvbi1tYXJzaG1hbGxvdy5tawpuZXcgZmlsZSBtb2RlIDEwMDY0
NAppbmRleCAwMDAwMDAwMDAwLi42NDI3Mjk2NTA4Ci0tLSAvZGV2L251bGwKKysrIGIvcGFja2Fn
ZS9weXRob24tbWFyc2htYWxsb3cvcHl0aG9uLW1hcnNobWFsbG93Lm1rCkBAIC0wLDAgKzEsMTQg
QEAKKyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCisjCisjIHB5dGhvbi1tYXJzaG1hbGxvdworIwor
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKKworUFlUSE9OX01BUlNITUFMTE9XX1ZFUlNJT04gPSAz
LjE5LjAKK1BZVEhPTl9NQVJTSE1BTExPV19TT1VSQ0UgPSBtYXJzaG1hbGxvdy0kKFBZVEhPTl9N
QVJTSE1BTExPV19WRVJTSU9OKS50YXIuZ3oKK1BZVEhPTl9NQVJTSE1BTExPV19TSVRFID0gaHR0
cHM6Ly9maWxlcy5weXRob25ob3N0ZWQub3JnL3BhY2thZ2VzLzVlLzU5L2RkNDY1ZTVhYjBjY2I4
NzljNDEwZjg4Yzc1MTg5YTE5ZmQ0MzdiMTJjZDlhMDNiMzE1NzlhZWY1ODcwOQorUFlUSE9OX01B
UlNITUFMTE9XX1NFVFVQX1RZUEUgPSBzZXR1cHRvb2xzCitQWVRIT05fTUFSU0hNQUxMT1dfTElD
RU5TRSA9IE1JVAorUFlUSE9OX01BUlNITUFMTE9XX0xJQ0VOU0VfRklMRVMgPSBMSUNFTlNFCisK
KyQoZXZhbCAkKHB5dGhvbi1wYWNrYWdlKSkKLS0gCjIuMzkuMAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWls
ZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9idWlsZHJvb3QK

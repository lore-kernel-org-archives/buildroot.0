Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78BB6C3271F
	for <buildroot@archiver.kernel.org>; Thu,  4 Jul 2024 19:53:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 231F08129A;
	Thu,  4 Jul 2024 19:53:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pbq_YCtYDOez; Thu,  4 Jul 2024 19:53:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 31021812A5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 31021812A5;
	Thu,  4 Jul 2024 19:53:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6B7631BF2C1
 for <buildroot@lists.busybox.net>; Thu,  4 Jul 2024 19:53:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 533C6812A5
 for <buildroot@lists.busybox.net>; Thu,  4 Jul 2024 19:53:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BI8bbOcay77i for <buildroot@lists.busybox.net>;
 Thu,  4 Jul 2024 19:53:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.22;
 helo=mout.gmx.net; envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D69E781297
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D69E781297
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D69E781297
 for <buildroot@buildroot.org>; Thu,  4 Jul 2024 19:53:15 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from probook ([89.0.46.161]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MIx3C-1sidIB1MfC-00W6WV; Thu, 04
 Jul 2024 21:53:13 +0200
Date: Thu, 04 Jul 2024 21:53:10 +0200
MIME-Version: 1.0
Message-Id: <20240704-s6-multicall-v1-1-b6adb2bd0905@gmx.net>
References: <20240704-s6-multicall-v1-0-b6adb2bd0905@gmx.net>
In-Reply-To: <20240704-s6-multicall-v1-0-b6adb2bd0905@gmx.net>
To: buildroot@buildroot.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720122792; l=1456;
 i=j.neuschaefer@gmx.net; s=20240329; h=from:subject:message-id;
 bh=rYHsai+JBWVo/MfjsouHL+jjl/61IL1tSj/Uckk1vGg=;
 b=HCC5PVqvVS0n+N8EjOfsdXLHrb27mO8Whnr5m7M6q+KaLBO5BsEKbbeYPC4yolotSbgflM5QI
 IkcwQa9u/IOBYZVucXQC0XNPrfDvR9NhvwkdO8dChSTMtZv3LB8e3F6
X-Developer-Key: i=j.neuschaefer@gmx.net; a=ed25519;
 pk=NIe0bK42wNaX/C4bi6ezm7NJK0IQE+8MKBm7igFMIS4=
X-Provags-ID: V03:K1:apKX7kmKzWvwzRSFhIBkIkS4XajLi3NmV9FTMAAaSrnQZlSRA4l
 xnvMaJiM5drOyKWCFHyJI7uD5b7RjP2uuDh3kp5xONLJ74kddsCGaU8/5iIbMCbAdDsO1E9
 V7gFkFpQzCv7LlVD9JGz1gwHI/n2IcBViKbwM4wRfibEB3lA8Te+Mdgtn+PrrpcGCYZIogU
 OM3hBlh11zYaC224AYr9g==
UI-OutboundReport: notjunk:1;M01:P0:ONk3huSGyI0=;QpzmYQzaNSTcZlI3+v6pd8XR4Zz
 xCWrPs3OD3DyfXFQYG1WmDhNZTJmLDQg5UcMI+FfRwbU4YQBNqko33niNpjycvhPvV1a3O5I7
 TG9a70sPEeuzeVoIB4ir+tdXE57eI5b5JLprbac2OmUc0hZrC0e8SqnckM7GmyApq0ZftCdqm
 9ps1silzc6QodBg9hWHsbpi0oH9nhtr3VFsc06Go///4GR7JQ1OM5sR+S6aMLVqVKGINtKvem
 Qx4jMDpcV1wZw5Lg8USHd9gn7726IYcvplkbwT9VPINp6fVk0zIFAmVPDP4zdYKBg2Fwu9/K4
 mRp/EZ4Nt38hvQ6iXfsWbhBwBBLRuTx60s5Z9qzaJi1s+f9Zpja3ugMkoCL/Ol0rBbuJ3UQio
 dvD8JZaIFjKXnBMYx/B9soj2irQmBzLDiUrCxLkzUhu9FnvDkugtrDTc9qsA7pTaeFdqDV3UK
 XuXstKfJpUCUGM4XX9hSRgVKHBs5jb6PHn/S+h4M0NGLiVxVh2hRfw5gbdaSh6krV1/mefgz/
 JknqdkV8URBaaHX6IuOOLOrinEUD6C/Gqrw03TFadnjxZpeoJoypEaxEslBLgkhfFU09g0w8u
 Y1rOoJoALLmGmtC60Ymh3DYaByDv3XIukn4B70g0wWvl2CKPmY/pBYBT9zoaCpGtdArnpxpJF
 X3gD+JhwEtFUuUqnUdHLD8EPbPc35JxTApZIeaYgswLkBTosMjtHNq/tdIM/gOWWOPOK/0eO7
 MbnquVQHMCLFkQuSEzYsitMc//lwqtRZtETKENP1fsigfbsHIc8Kp9SdgGnl8/8cihQnbb56O
 DQeV25lldpb05euWIXzElGUuG8vZh7f1duLSZVa4f6z08=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.net; 
 s=s31663417; t=1720122793; x=1720727593; i=j.neuschaefer@gmx.net;
 bh=C8KabC0hDFvg0BPCnAxO0OswpZ81orw7Hs60EVf66/E=;
 h=X-UI-Sender-Class:From:Date:Subject:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=Mmb4ZdviUoZgYl8Bw/FksmV6H25/syelcDMyLKcOC2sL94CHmJuyZ6FPX1JIL6Rv
 NDUgn86YK1j6wFMllzQClFs0RCBF2r5Eh2N2DpnqC+yFGD8tmKUuZCvx3tAL+8oFE
 thwWxPYrkLqBgsHQJchQrs6k7bac3XpI2cfdbjyg7wC1RVoj/4D0s/CoaJOPctR8d
 9Qa1CUgHySwNzF8dnkhoAWMlS/T9lBZXEWGAzVhL+z33aCpS6o41J2ZYE3VrzKbJx
 3KQHq0v53CNQWQ9eUMnBxYx5KBHuMuR5jT0wjCFWrEbw4eKH6otoaA0cm8iipS6pK
 pVU3aoO5uTb0bMkGyg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.net header.i=j.neuschaefer@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=Mmb4Zdvi
Subject: [Buildroot] [PATCH 1/3] execline: Add option to build multicall
 binary
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

U2luY2UgdmVyc2lvbiAyLjkuMi4wLCB3aXRoIGFub3RoZXIgYnVnZml4IGluIDIuOS40LjAsIGV4
ZWNsaW5lIGNhbgpiZSBidWlsdCBhcyBhIG11bHRpY2FsbCBiaW5hcnksIHNpbWlsYXIgdG8gYnVz
eWJveC4gQWNjb3JkaW5nIHRvCnRoZSBhdXRob3JbMV0sIHRoaXMgcmVzdWx0cyBpbiBzcGFjZSBz
YXZpbmdzIG9mIDY2LTg3JSBvbiBMaW51eC4KClsxXTogaHR0cHM6Ly9za2FybmV0Lm9yZy9zb2Z0
d2FyZS9leGVjbGluZS9leGVjbGluZS5odG1sCgpTaWduZWQtb2ZmLWJ5OiBKLiBOZXVzY2jDpGZl
ciA8ai5uZXVzY2hhZWZlckBnbXgubmV0PgotLS0KIHBhY2thZ2UvZXhlY2xpbmUvQ29uZmlnLmlu
ICAgfCA5ICsrKysrKysrKwogcGFja2FnZS9leGVjbGluZS9leGVjbGluZS5tayB8IDEgKwogMiBm
aWxlcyBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvcGFja2FnZS9leGVj
bGluZS9Db25maWcuaW4gYi9wYWNrYWdlL2V4ZWNsaW5lL0NvbmZpZy5pbgppbmRleCA3YTIyNzhm
YTVhLi5hN2NiYmExYmIwIDEwMDY0NAotLS0gYS9wYWNrYWdlL2V4ZWNsaW5lL0NvbmZpZy5pbgor
KysgYi9wYWNrYWdlL2V4ZWNsaW5lL0NvbmZpZy5pbgpAQCAtMTAsMyArMTAsMTIgQEAgY29uZmln
IEJSMl9QQUNLQUdFX0VYRUNMSU5FCiAJICBlc3NlbnRpYWxseSB1c2VmdWwgaW5zaWRlIGFuIGV4
ZWNsaW5lYiBzY3JpcHQuCgogCSAgaHR0cDovL3NrYXJuZXQub3JnL3NvZnR3YXJlL2V4ZWNsaW5l
LworCitpZiBCUjJfUEFDS0FHRV9FWEVDTElORQorCitjb25maWcgQlIyX1BBQ0tBR0VfRVhFQ0xJ
TkVfTVVMVElDQUxMCisJYm9vbCAiZXhlY2xpbmUgbXVsdGljYWxsIGJpbmFyeSIKKwloZWxwCisJ
ICBCdWlsZCBleGVjbGluZSBhcyBhIG11bHRpY2FsbCBiaW5hcnkgdG8gc2F2ZSBkaXNrIHNwYWNl
LgorCitlbmRpZgpkaWZmIC0tZ2l0IGEvcGFja2FnZS9leGVjbGluZS9leGVjbGluZS5tayBiL3Bh
Y2thZ2UvZXhlY2xpbmUvZXhlY2xpbmUubWsKaW5kZXggYjNkMmQ5ODIxNi4uYTc5M2UzMWRmZCAx
MDA2NDQKLS0tIGEvcGFja2FnZS9leGVjbGluZS9leGVjbGluZS5taworKysgYi9wYWNrYWdlL2V4
ZWNsaW5lL2V4ZWNsaW5lLm1rCkBAIC0xOSw2ICsxOSw3IEBAIEVYRUNMSU5FX0NPTkZfT1BUUyA9
IFwKIAktLXdpdGgtZHlubGliPSQoU1RBR0lOR19ESVIpL2xpYiBcCiAJLS13aXRoLWxpYj0kKFNU
QUdJTkdfRElSKS9saWIvc2thbGlicyBcCiAJJChpZiAkKEJSMl9TVEFUSUNfTElCUyksLC0tZGlz
YWJsZS1hbGxzdGF0aWMpIFwKKwkkKGlmICQoQlIyX1BBQ0tBR0VfRVhFQ0xJTkVfTVVMVElDQUxM
KSwtLWVuYWJsZS1tdWx0aWNhbGwsKSBcCiAJJChTSEFSRURfU1RBVElDX0xJQlNfT1BUUykKCiBk
ZWZpbmUgRVhFQ0xJTkVfQ09ORklHVVJFX0NNRFMKCi0tCjIuNDMuMAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApi
dWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1h
bi9saXN0aW5mby9idWlsZHJvb3QK

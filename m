Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8BF4C52D7F
	for <buildroot@archiver.kernel.org>; Sun, 11 Aug 2024 10:01:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5A2864059D;
	Sun, 11 Aug 2024 10:01:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Mjz6SyFJIBvw; Sun, 11 Aug 2024 10:01:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5CE064059E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5CE064059E;
	Sun, 11 Aug 2024 10:01:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C17011BF2AA
 for <buildroot@lists.busybox.net>; Sun, 11 Aug 2024 10:01:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AE88A40B7B
 for <buildroot@lists.busybox.net>; Sun, 11 Aug 2024 10:01:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZlB8ikcJScuO for <buildroot@lists.busybox.net>;
 Sun, 11 Aug 2024 10:01:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.22;
 helo=mout.gmx.net; envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 36BBD40B87
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 36BBD40B87
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 36BBD40B87
 for <buildroot@buildroot.org>; Sun, 11 Aug 2024 10:01:24 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from probook ([89.0.46.195]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MpUYu-1rpUwt1ZkK-00oiNe; Sun, 11
 Aug 2024 12:01:19 +0200
Date: Sun, 11 Aug 2024 12:01:11 +0200
MIME-Version: 1.0
Message-Id: <20240811-s6-multicall-v2-1-14249fd20cbd@gmx.net>
References: <20240811-s6-multicall-v2-0-14249fd20cbd@gmx.net>
In-Reply-To: <20240811-s6-multicall-v2-0-14249fd20cbd@gmx.net>
To: buildroot@buildroot.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1723370475; l=1456;
 i=j.neuschaefer@gmx.net; s=20240329; h=from:subject:message-id;
 bh=j0C2j+EihXs7xN41vSXmRnIgPhOP7jgedYH0AhQohBw=;
 b=uBHJROaR0cvduoZ+0kJHuLDgccIdDDm4tPaFGi+lCV1+Esz4/fvwVsh5QZoaZGa59L8fk5oZy
 y+2x6KUhkBTCQX9kGMybuUxnOaYxlWMcBqrG62hVt4fBMdV9bilTq1Y
X-Developer-Key: i=j.neuschaefer@gmx.net; a=ed25519;
 pk=NIe0bK42wNaX/C4bi6ezm7NJK0IQE+8MKBm7igFMIS4=
X-Provags-ID: V03:K1:DzQ0KPdbOgZy9IOPF33aWSsdW8lF0wKTLR/YT/pV1V/dqO2spuG
 jNRDSekNznHHX7csQ7k8fNqgnRsJ2qXNCMotix4whzcw8KunjzmFRo+MyBYAanUIu8BxXfm
 RezFMTwZAuTXSfYPBcKUdTTpAxg3Lnsqr++biEbBgi9Ju542dor0qIyUmy2cD8YvFllxO8B
 W7/w9SDnqfMoY73cmO3Uw==
UI-OutboundReport: notjunk:1;M01:P0:hqHaKeHOxME=;oSaOkhcCJztHWqW33K8Flflx5dp
 3HY2aW8/KIcH/GjVOlB0EdTleHeHzfBIWWmZsj02q+zf/WQsomOArslr7nsX5qSVlzRiGhe03
 OfjVpHd4m2hwS/ujB03dWOOe1eAcTk+yaKy0o8b9CKU1VsQlRT7NIzy8fhZfhY+r+CB8BBUqv
 Xkfo5wFL/HyEZ06jJKhsUpAaBxjh1maFj2htGChBqOpZP4lGOpIT/tdgQOmJF9QWIXs5JFzMY
 C86XpNRdDoXz5P/Dx8MqwGPtK3FcjcCHLIFpzY8kHiia57uyTSBzZVRKE5y+Q1uZ1nHHrGjMi
 hdQVniMUkicOCYsnGXGIvbl+HsjdLZDdihtc0H6NFe6xeZgLvoDUhksz/54dgANxX0ElrsIFl
 1W0MZWc31w4fbPFFjRMHVDkD9gki8EAcyyiLQERadbKIb8GnA7J+mBrlYFmTrv4MqVJnbU176
 Q8u+VC1+z3RP1SR25cPpKIwVTGtDh9LjRPszYKRnOCpy6EGMwJMz64WxTS91q/x5Bl79j1WIu
 7IjgJoonorJprIDGEi4LOnPsKNjwSLFosFxokJPpE6hBtzwVFqxw6/GobqLphpISUEXYpbxCn
 tYno/77/g3q0oLxsaAn/pGAC4RXXmxKWP94Xx5KuUZ2qxEDVQO1VA8Zjn2j+Bm9sfy34zlj7R
 JE4cf3WcVy5t0gGoVkhT55TyGGtz7QRxSLY17JrY0kSOTudFd0PVixd52OYtXq37DYE7DSh3V
 bXSwfKwG/oLWKgg8/E7sj6MLyGA+OwpPeuVKVv8ZrTUtvT6oIBhj2Vy9Bd5NEBp3yvSnp26mj
 zKsowuk4v2tLITjdhLVPaqoQ==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.net; 
 s=s31663417; t=1723370479; x=1723975279; i=j.neuschaefer@gmx.net;
 bh=wauedL11xPUobEn/7+7O/Uhh/eoOYRCRkt4LvWcqhmo=;
 h=X-UI-Sender-Class:From:Date:Subject:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=tG9uEjkCheJPhMFsD4oFQUcvbU54Bh+PPK8QWHIdfPsQOz67iA8GQUEhdLuow6kh
 KDu5oXWYzMH3u4G/69e8x5bhSl7hOOYlAqKa6YYNYC/PZufTaGZJe1eA1YfclejIx
 vlHxZQP/rgJD4gwHedwXjyWyIN4gQO/eFxXbmHvcnXbRuOc9iAEZmE7AzqtTqo1Ev
 0h8A/kbs+51eh5fxFbzBfxys7ekgTYafYwxHsW/coGqVn5jMaVdlmv4GMOGs3BC9l
 p5rakOcHkPdSbi9mwlW5CDBS3a9yoCc0L/BTzBlX2BclSN8JUhJe5ov3nCfOmryQX
 VU5ybM5FNlCboNAZtw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.net header.i=j.neuschaefer@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=tG9uEjkC
Subject: [Buildroot] [PATCH v2 1/4] package/execline: Add option to build
 multicall binary
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
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
Y2thZ2UvZXhlY2xpbmUvZXhlY2xpbmUubWsKaW5kZXggZWUzOGQzZWQzYy4uOTIyZmM3YjVhZiAx
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

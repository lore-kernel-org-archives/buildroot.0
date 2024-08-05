Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D570C3DA4A
	for <buildroot@archiver.kernel.org>; Mon,  5 Aug 2024 21:54:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0E21F40257;
	Mon,  5 Aug 2024 21:54:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uWrSIPa8ejpb; Mon,  5 Aug 2024 21:54:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C0D7240258
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C0D7240258;
	Mon,  5 Aug 2024 21:54:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3E8B51BF2E4
 for <buildroot@lists.busybox.net>; Mon,  5 Aug 2024 21:54:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2C4A46076F
 for <buildroot@lists.busybox.net>; Mon,  5 Aug 2024 21:54:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gSvn53o3auR6 for <buildroot@lists.busybox.net>;
 Mon,  5 Aug 2024 21:54:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.22;
 helo=mout.gmx.net; envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A586E6064B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A586E6064B
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A586E6064B
 for <buildroot@buildroot.org>; Mon,  5 Aug 2024 21:54:01 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from probook ([87.78.127.77]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MtfJX-1sN8Ab27up-012yTt; Mon, 05
 Aug 2024 23:53:58 +0200
Date: Mon, 05 Aug 2024 23:53:56 +0200
MIME-Version: 1.0
Message-Id: <20240805-z-linker-v1-1-8362e6645f67@gmx.net>
X-B4-Tracking: v=1; b=H4sIAPNJsWYC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDCwNT3SrdnMy87NQiXTOLVCOjtOQkY2MLCyWg8oKi1LTMCrBR0bG1tQC
 C42g7WgAAAA==
To: buildroot@buildroot.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1722894838; l=1931;
 i=j.neuschaefer@gmx.net; s=20240329; h=from:subject:message-id;
 bh=5ZLQbtq6LbRlFqDU9avi7MBvV2WITg7W/ummOPEZhjY=;
 b=biGJEbgwoo+mMv83Fy+9lKBSIIKqq1mcNUZO9aRvZ+y8FrDMmmSdyvlHUV9NTHZOOy2H4CrPg
 FrX8s+elLurAha/htkXm74MRopfW0g6qRlPaD0+FvxrJ/jC801slBdH
X-Developer-Key: i=j.neuschaefer@gmx.net; a=ed25519;
 pk=NIe0bK42wNaX/C4bi6ezm7NJK0IQE+8MKBm7igFMIS4=
X-Provags-ID: V03:K1:iXAc7CXCjTzzMFs7q2Xix5kISxwwvqIJMNt2cahBgn1dVe+cPl8
 +2ZBDAvrJOcjFLRI0JelwYNjLfnRUOJRRnr/hokS69enxIiEDtRO+aYuvXNm/rsu7Y6iR4O
 ppQXfzfjyXXEuPmUfL1iO66HWoCWCLWwBbX6xe7bwPfL4FDBJRySlKkMVxe23Qkox4ylQ6i
 fRK7oh/wG48UihivzBfEw==
UI-OutboundReport: notjunk:1;M01:P0:bEvd1SL8Elw=;ZvP9zc/j5qeqfHQYNa6boxWk1Lq
 i7NWt9vMs7/ITLLd2pjSr5x+6zgWbohjKE1voJuTnzp9qhzBsqf/DJmGmSveEHSRbAXobFhzC
 xxAErvjO3qDkO8R4c9k1pkuMcDoZTH4MuTYYT6C3sZJB+uMpejo40EezD1h/D7KHIIe3SJqtC
 w9bMMHVjyL6HyHW8huaoBtKpE5HgwZyzt101f15b0O+bxeuSomjkZ6Lwe8vkoaxVA/wIPxy2D
 I7HDx+LNj2nQFdkgsRRm1iVCRKVWgUU2NeEcPALbjYcNQ8JEYQhceaeQWgOxqUv9lVJ0HAlMd
 CUcy8Dg020BeTgSBRBO39reJITsWZSXF+HkY+AK3SnzQr3pdtcpXWz9diYW4DCutKJwF1ggip
 m5fl+Q4EfUQ04Vm6oEgsErvCYHzemnh0Tth4g4IAv62b0uzosPDOcTHgF6jtXceM16p9J0+ZA
 A9AKz+q0Q/GmaukOfXaTIzsQgyeKEIxXcTbXTqth3Qt0Wg+fmuy2dEtYfP8XVqhDabMARg2Ru
 1+pxr7wwMjfw91/kReVNbmpICLVIaHSu7ySiLSIq4RkfsWqLDz8x1SwIu2bebaG9Z7/FYaDB4
 Pg26ddd3vtHS3+hkTe3B9MHNbu0WMjnw113CAuHiImoCdzJfWJGWV3sehWPoFG6CHAGiGp+Ez
 u6Qi79Bp4Wdb4f5vZq/MTKhs3IpEszhIlx2gTBelbDhUVHm7fe7Wpti+j9lPMjvISWXw5x0uW
 /5mNovDpGqE0QyBb5hq6D+AhBP0/sRKpo4LTw4pero/TtSoRQBZj38fR0taPnc60ansbwkRTj
 F1FWUawyIKGdOafIR5bb/WWA==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.net; 
 s=s31663417; t=1722894838; x=1723499638; i=j.neuschaefer@gmx.net;
 bh=0cyhUqNSn5UeQ+mr22eyL+uB3V2FebfipOx/d+LLiEM=;
 h=X-UI-Sender-Class:From:Date:Subject:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Message-Id:To:Cc:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=d93EqFwmwJXzw1S/yoAVpkIcXYGn93jkzQPgU37uo6TP58WkM9iXSuwDMRmMZKjT
 nT9hLd/yg7+nxn+JWsIGf/FnqKPtjpt/EnNO9RYJsfo88P8LEMh+U7/qlQcpMdNkz
 GA42dlYZmLRJU5G5nIFmfp6iDAAAKdxII6K9igcTbEOFzmvRWeZFqNERLT7Sqrcxw
 MEnJWczG4mNCU+9Z+vY+87YW9fbEA0aLD6Z+QFbVzRqucMIDTEWFLLsQEaUXvJAaF
 4Tb1av7EN77Wnv2o5WdyUoQGeGv5trGsYdSxmcbqk3EmXLyVifQX2r8GGMus5yT+L
 qgybN71w6Y0jStncOg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.net header.i=j.neuschaefer@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=d93EqFwm
Subject: [Buildroot] [PATCH] package/Makefile.in: Use "-z text" instead of
 "-Wl, -z, text"
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

QWZ0ZXIgdGhlIHJlY2VudCBhZGRpdGlvbiB0byAtV2wsLXosdGV4dCB0byBUQVJHRVRfTERGTEFH
UyBpbiBjYXNlIG9mCm11c2wtbGliYyBhbmQgZHluYW1pYyBsaW5raW5nLCBpdCB3YXMgZm91bmQg
dGhhdCBzb21lIHBhY2thZ2VzIHBhc3MKVEFSR0VUX0xERkxBR1MgZGlyZWN0bHkgdG8gbGQsIGJ1
dCB0aGUgLVdsIHN5bnRheCBvbmx5IHdvcmtzIHdpdGgKY29tcGlsZXIgZHJpdmVycyAoZ2NjL2Ns
YW5nKS4gVGhpcyBjb21taXQgY2hhbmdlcyB0aGUgZmxhZyB0byAteiB0ZXh0LAp3aGljaCB0aGUg
Z2NjIGFuZCBjbGFuZyBhbHNvIHVuZGVyc3RhbmQgYW5kIHBhc3MgdG8gdGhlIGxpbmtlci4KClJl
cG9ydGVkLWJ5OiBUaG9tYXMgUGV0YXp6b25pIDx0aG9tYXMucGV0YXp6b25pQGJvb3RsaW4uY29t
PgpTaWduZWQtb2ZmLWJ5OiBKLiBOZXVzY2jDpGZlciA8ai5uZXVzY2hhZWZlckBnbXgubmV0Pgot
LS0KTm90ZTogVGhpcyBwYXRjaCBpcyBpbnNwaXJlZCBieSBnbnUtZWZpLCB3aGljaCBwYXNzZXMg
VEFSR0VUX0xERkxBR1MKZGlyZWN0bHkgdG8gbGQuIFRoaXMgcGFydGljdWxhciBjYXNlIGlzIHNv
bHZlZCBieSB0aGlzIHBhdGNoLCBidXQKZ251LWVmaSB0aGVuIGZhaWxzIGRpZmZlcmVudGx5IChv
biBBUk0pLCB3aXRoIGVycm9ycyBzdWNoIGFzOgoKICAvLi4uL3Blci1wYWNrYWdlL2dudS1lZmkv
aG9zdC9iaW4vYXJtLWJ1aWxkcm9vdC1saW51eC1tdXNsZWFiaS1sZDogYnVpbGRyb290L2J1aWxk
L2dudS1lZmktMy4wLjE4L2FybS9saWIvLi4vLi4vbGliL3ByaW50LmM6MTQzMTooLnRleHQrMHg3
OGMpOiB1bmRlZmluZWQgcmVmZXJlbmNlIHRvIGBfX2FlYWJpX2kyZCcKLS0tCiBwYWNrYWdlL01h
a2VmaWxlLmluIHwgNyArKysrKystCiAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCAx
IGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvcGFja2FnZS9NYWtlZmlsZS5pbiBiL3BhY2thZ2Uv
TWFrZWZpbGUuaW4KaW5kZXggMWNlZGZlZmE3ZS4uNDNhNWMyNzljMCAxMDA2NDQKLS0tIGEvcGFj
a2FnZS9NYWtlZmlsZS5pbgorKysgYi9wYWNrYWdlL01ha2VmaWxlLmluCkBAIC0xNTQsOCArMTU0
LDEzIEBAIFRBUkdFVF9MREZMQUdTID0gJChjYWxsIHFzdHJpcCwkKEJSMl9UQVJHRVRfTERGTEFH
UykpCiAjIHdoZW4gRFRfVEVYUkVMIGlzIHVzZWQsIHNvIHdlIGNhcHR1cmUgdGhlIHByb2JsZW0g
ZWFybGllci4KICMKICMgU2VlIGFsc286IGh0dHBzOi8vd3d3Lm9wZW53YWxsLmNvbS9saXN0cy9t
dXNsLzIwMjAvMDkvMjUvNAorIworIyBOT1RFOiBXZSdyZSB1c2luZyAiLXogdGV4dCIgaW5zdGVh
ZCBvZiAiLVdsLC16LHRleHQiIGhlcmUsIGJlY2F1c2Ugc29tZQorIyBwYWNrYWdlcyBwYXNzIFRB
UkdFVF9MREZMQUdTIGRpcmVjdGx5IHRvIGxkIHJhdGhlciB0aGFuIGdjYywgYW5kIGxkIGRvZXNu
J3QKKyMgc3VwcG9ydCAtV2wsWy4uLl0uIC16IGlzIHN1cHBvcnRlZCBieSBib3RoIGdjYyBhbmQg
Y2xhbmcsIHNvIGl0IHByb2JhYmx5CisjIHdvbid0IGNhdXNlIHVzIHByb2JsZW1zLgogaWZlcSAo
JChCUjJfVE9PTENIQUlOX1VTRVNfTVVTTCk6JChCUjJfU1RBVElDX0xJQlMpLHk6KQotVEFSR0VU
X0xERkxBR1MgKz0gLVdsLC16LHRleHQKK1RBUkdFVF9MREZMQUdTICs9IC16IHRleHQKIGVuZGlm
CgogIyBCeSBkZXNpZ24sIF9GT1JUSUZZX1NPVVJDRSByZXF1aXJlcyBnY2Mgb3B0aW1pemF0aW9u
IHRvIGJlIGVuYWJsZWQuCgotLS0KYmFzZS1jb21taXQ6IGY5ZjJhZGU5YmIyMDdkMjQ4MWIxMmEz
MjViYmE3Y2VlNWEzZTljYmYKY2hhbmdlLWlkOiAyMDI0MDgwNS16LWxpbmtlci02OGUyMmZjYjMz
ODgKCkJlc3QgcmVnYXJkcywKLS0KSi4gTmV1c2Now6RmZXIgPGoubmV1c2NoYWVmZXJAZ214Lm5l
dD4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxk
cm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5i
dWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==

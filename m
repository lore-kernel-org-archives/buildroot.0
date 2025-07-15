Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4BC4C83F1D
	for <buildroot@archiver.kernel.org>; Tue, 15 Jul 2025 11:29:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5F6914073E;
	Tue, 15 Jul 2025 11:29:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QPH2CPTtbhOM; Tue, 15 Jul 2025 11:29:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 79A4440549
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 79A4440549;
	Tue, 15 Jul 2025 11:29:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 134FC11AA
 for <buildroot@buildroot.org>; Tue, 15 Jul 2025 11:29:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EB0F8404C5
 for <buildroot@buildroot.org>; Tue, 15 Jul 2025 11:29:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SC00iXB-OudB for <buildroot@buildroot.org>;
 Tue, 15 Jul 2025 11:29:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0BAB240419
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0BAB240419
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0BAB240419
 for <buildroot@buildroot.org>; Tue, 15 Jul 2025 11:29:54 +0000 (UTC)
Received: from tuxedoOT.fritz.box (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 777BC2C83425;
 Tue, 15 Jul 2025 13:29:52 +0200 (CEST)
To: buildroot@buildroot.org
Date: Tue, 15 Jul 2025 13:29:48 +0200
Message-ID: <20250715112951.1211144-1-buildroot@bubu1.eu>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1752578992; bh=3MFlmbd/Ld3eRUOYXZxgCXbpDqjHnDEJ8vU1xpr/Qzs=;
 h=From:To:Cc:Subject:Date;
 b=n6FjsRXEA5UPLDyfcwf9KGTMP0ijnuHbMzILIs3Zn2y2e1Yk09WtGT82l2qUpM9H0
 Zog+RmPT9SAXO5iHrOJx3M3DaJbsBpHb2haSfQdSB7yJjV6JyI+TtjiuM4PrgX5yHf
 W4bCuuTaFDWo/6I8uDvvpbaChlGlwcnYunR5Zy++kYbxFurCBdl0QnR1Tlmh/XVHN+
 5s7/ShgIy+4VW9T5yc1odBP8j2emS+rp5gkLO56Pf3PI4bhGd4ovLsDqeag9nuw4Zq
 4Ubb2mI57v4MiNBiFGXUJ/fFURHXGU/fHTyov4Bg93vxEqhtQz8UeCCIvQZC8y4nDr
 mueNZSn779G0Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=n6FjsRXE
Subject: [Buildroot] [PATCH 1/2] package/python-asgiref: bump to 0.9.1
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

UmVsZWFzZSBOb3RlczoKCiogRml4ZWQgZGVsZXRpb24gb2YgTG9jYWwgdmFsdWVzIGFmZmVjdGlu
ZyBvdGhlciBjb250ZXh0cy4gKCM1MjMpCgoqIFNraXAgQ1B5dGhvbiBzcGVjaWZpYyBnYXJiYWdl
IGNvbGxlY3Rpb24gdGVzdCBvbiBweXB5LiAoIzUyMSkKCjMuOS4wICgyMDI1LTA3LTAzKQotLS0t
LS0tLS0tLS0tLS0tLS0KCiogQWRkcyBzdXBwb3J0IGZvciBQeXRob24gMy4xMy4KCiogRHJvcHMg
c3VwcG9ydCBmb3IgKGVuZC1vZi1saWZlKSBQeXRob24gMy44LgoKKiBGaXhlcyBhbiBlcnJvciB3
aXRoIGNvbmZsaWN0aW5nIGt3YXJncyBiZXR3ZWVuIEFzeW5jVG9TeW5jIGFuZCB0aGUgd3JhcHBl
ZAogIGZ1bmN0aW9uLiAoIzQ3MSkKCiogRml4ZXMgTG9jYWwgaXNvbGF0aW9uIGJldHdlZW4gYXN5
bmNpbyBUYXNrcy4gKCM0NzgpCgoqIEZpeGVzIGEgcmVmZXJlbmNlIGN5Y2xlIGluIExvY2FsICgj
NTA4KQoKKiBGaXhlcyBhIGRlYWRsb2NrIGluIEN1cnJlbnRUaHJlYWRFeGVjdXRvciB3aXRoIG5l
c3RlZCBhc3luY190b19zeW5jIOKGkgogIHN5bmNfdG9fYXN5bmMg4oaSIGFzeW5jX3RvX3N5bmMg
4oaSIGNyZWF0ZV90YXNrIGNhbGxzLiAoIzQ5NCkKCiogVGhlIEFwcGxpY2F0aW9uQ29tbXVuaWNh
dG9yIHRlc3RpbmcgdXRpbGl0eSB3aWxsIG5vdyByZXR1cm4gdGhlIHRhc2sgcmVzdWx0CiAgaWYg
aXQncyBhbHJlYWR5IGNvbXBsZXRlZCBvbiBzZW5kX2lucHV0IGFuZCByZWNlaXZlX25vdGhpbmcu
IFlvdSBtYXkgbmVlZCB0bwogIGNhdGNoIChlLmcuKSB0aGUgYXN5bmNpby5leGNlcHRpb25zLkNh
bmNlbGxlZEVycm9yIGlmIHNlbmRpbmcgbWVzc2FnZXMgdG8KICBhbHJlYWR5IGZpbmlzaGVkIGNv
bnN1bWVycyBpbiB5b3VyIHRlc3RzLiAoIzUwNSkKClNvdXJjZTogaHR0cHM6Ly9naXRodWIuY29t
L2RqYW5nby9hc2dpcmVmL2Jsb2IvbWFpbi9DSEFOR0VMT0cudHh0CgpTaWduZWQtb2ZmLWJ5OiBN
YXJjdXMgSG9mZm1hbm4gPGJ1aWxkcm9vdEBidWJ1MS5ldT4KLS0tCiBwYWNrYWdlL3B5dGhvbi1h
c2dpcmVmL3B5dGhvbi1hc2dpcmVmLmhhc2ggfCA0ICsrLS0KIHBhY2thZ2UvcHl0aG9uLWFzZ2ly
ZWYvcHl0aG9uLWFzZ2lyZWYubWsgICB8IDQgKystLQogMiBmaWxlcyBjaGFuZ2VkLCA0IGluc2Vy
dGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvcGFja2FnZS9weXRob24tYXNn
aXJlZi9weXRob24tYXNnaXJlZi5oYXNoIGIvcGFja2FnZS9weXRob24tYXNnaXJlZi9weXRob24t
YXNnaXJlZi5oYXNoCmluZGV4IGUzMTU3YzNlMTEuLmU3Y2RhODlmNGQgMTAwNjQ0Ci0tLSBhL3Bh
Y2thZ2UvcHl0aG9uLWFzZ2lyZWYvcHl0aG9uLWFzZ2lyZWYuaGFzaAorKysgYi9wYWNrYWdlL3B5
dGhvbi1hc2dpcmVmL3B5dGhvbi1hc2dpcmVmLmhhc2gKQEAgLTEsNSArMSw1IEBACiAjIG1kNSwg
c2hhMjU2IGZyb20gaHR0cHM6Ly9weXBpLm9yZy9weXBpL2FzZ2lyZWYvanNvbgotbWQ1ICBmYjI5
MjdlMjZlYTM0Yzk3ZTBhNGM4OTYxMmU4MDU2MiAgYXNnaXJlZi0zLjguMS50YXIuZ3oKLXNoYTI1
NiAgYzM0M2JkODBhMGJlYzk0N2E5ODYwYWRiNGM0MzJmZmE3ZGI3Njk4MzZjNjQyMzhmYzM0YmRj
M2ZlYzg0ZDU5MCAgYXNnaXJlZi0zLjguMS50YXIuZ3oKK21kNSAgZjQxNTFhNjlmMWZjMzNkZDY5
YzIzNzUxNWJiZjljOTIgIGFzZ2lyZWYtMy45LjEudGFyLmd6CitzaGEyNTYgIGE1YWI2NTgyMjM2
MjE4ZTVlZjE2NDhmMjQyZmQ5ZjEwNjI2Y2ZkNGRlOGRjMzc3ZGIyMTVkNWQ1MDk4ZTMxNDIgIGFz
Z2lyZWYtMy45LjEudGFyLmd6CiAjIExvY2FsbHkgY29tcHV0ZWQgc2hhMjU2IGNoZWNrc3Vtcwog
c2hhMjU2ICBiODQ2NDE1ZDFiNTE0ZTljMWRmZjE0YTIyZGViOTA2ZDc5NGJjNTQ2Y2E2MTI5Zjk1
MGExOGNkMDkxZTJhNjY5ICBMSUNFTlNFCmRpZmYgLS1naXQgYS9wYWNrYWdlL3B5dGhvbi1hc2dp
cmVmL3B5dGhvbi1hc2dpcmVmLm1rIGIvcGFja2FnZS9weXRob24tYXNnaXJlZi9weXRob24tYXNn
aXJlZi5tawppbmRleCAwNzI1YWQ2ZTM4Li4yMmNiMTA3N2RiIDEwMDY0NAotLS0gYS9wYWNrYWdl
L3B5dGhvbi1hc2dpcmVmL3B5dGhvbi1hc2dpcmVmLm1rCisrKyBiL3BhY2thZ2UvcHl0aG9uLWFz
Z2lyZWYvcHl0aG9uLWFzZ2lyZWYubWsKQEAgLTQsOSArNCw5IEBACiAjCiAjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIwogCi1QWVRIT05fQVNHSVJFRl9WRVJTSU9OID0gMy44LjEKK1BZVEhPTl9BU0dJ
UkVGX1ZFUlNJT04gPSAzLjkuMQogUFlUSE9OX0FTR0lSRUZfU09VUkNFID0gYXNnaXJlZi0kKFBZ
VEhPTl9BU0dJUkVGX1ZFUlNJT04pLnRhci5negotUFlUSE9OX0FTR0lSRUZfU0lURSA9IGh0dHBz
Oi8vZmlsZXMucHl0aG9uaG9zdGVkLm9yZy9wYWNrYWdlcy8yOS8zOC9iMzM5NWNjOWFkMWI1NmQy
ZGRhYzk5NzBiYzhmNDE0MTMxMmRiYWVjMjhiYzdjMjE4YjBkZmFmZDBmNDIKK1BZVEhPTl9BU0dJ
UkVGX1NJVEUgPSBodHRwczovL2ZpbGVzLnB5dGhvbmhvc3RlZC5vcmcvcGFja2FnZXMvOTAvNjEv
MGFhOTU3ZWVjMjJmZjcwYjgzMGIyMmZmOTFmODI1ZTcwZTFlZjczMmMwNjY2NmE4MDU3MzBmMjhi
MzZiCiBQWVRIT05fQVNHSVJFRl9TRVRVUF9UWVBFID0gc2V0dXB0b29scwogUFlUSE9OX0FTR0lS
RUZfTElDRU5TRSA9IEJTRC0zLUNsYXVzZQogUFlUSE9OX0FTR0lSRUZfTElDRU5TRV9GSUxFUyA9
IExJQ0VOU0UKLS0gCjIuNDMuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9y
ZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7F93C5B549
	for <buildroot@archiver.kernel.org>; Wed,  4 Jun 2025 16:33:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2732B41F98;
	Wed,  4 Jun 2025 16:33:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HQX1gTxKibi7; Wed,  4 Jun 2025 16:33:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BA88A41C5F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BA88A41C5F;
	Wed,  4 Jun 2025 16:33:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 65B6F1A4
 for <buildroot@buildroot.org>; Wed,  4 Jun 2025 16:33:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4B4FC41122
 for <buildroot@buildroot.org>; Wed,  4 Jun 2025 16:33:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6sMwIHsjZh9H for <buildroot@buildroot.org>;
 Wed,  4 Jun 2025 16:33:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org BFCDF405B8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BFCDF405B8
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BFCDF405B8
 for <buildroot@buildroot.org>; Wed,  4 Jun 2025 16:33:51 +0000 (UTC)
Received: from tuxedoOT.fritz.box (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id B5C482C84273;
 Wed, 04 Jun 2025 18:33:48 +0200 (CEST)
To: buildroot@buildroot.org
Date: Wed,  4 Jun 2025 18:33:46 +0200
Message-ID: <20250604163348.104844-1-buildroot@bubu1.eu>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1749054828; bh=NDlJJgOblTfi9wMQqB20Iv783nEsNaiblie6wSa6Qi4=;
 h=From:To:Cc:Subject:Date;
 b=nyziX4IBmTsL3rz60v3LkEom0rdY5e4ERKlnK4d1XkC4Zwy/RNDarrLJGDtw8iLHt
 5m1uQbvhYJF1lankh6wcOz6b4V8AzDcJVmq5W+RFOlRkVHnV3L7pdt2UgDWwujMvWL
 gSeyOeEd9zU3+5KBW01v+9K8loeC2A4Qn5/71qjHuucoYbxolRx/aDugEIAfAYW578
 IVRFdV4Wfsvmrwye2ApfNROn+uEAEBYWJ2l3OQQ/RmAlVOtlhKQNr2kbCb4W4PwsIv
 ZGmoNAfRYie2L4zLKb1dN91JvrKUoMu80DIxKkJEJf4sK1SaXoEnFhuvc3xYA0j8wE
 vZDZCaWDqdhrA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=nyziX4IB
Subject: [Buildroot] [PATCH] package/python-django: security bump to 5.2.2
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Oli Vogt <oli.vogt.pub01@gmail.com>, Marcus Hoffmann <bubu@bubu1.eu>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

RGphbmdvIDUuMi4yIGZpeGVzIGEgc2VjdXJpdHkgaXNzdWUgd2l0aCBzZXZlcml0eSDigJxsb3fi
gJ0gYW5kIHNldmVyYWwgYnVncyBpbiA1LjIuMS4KCkZpeGVzOiBDVkUtMjAyNS00ODQzMjogUG90
ZW50aWFsIGxvZyBpbmplY3Rpb24gdmlhIHVuZXNjYXBlZCByZXF1ZXN0IHBhdGgKCkZ1bGwgUmVs
ZWFzZSBub3RlczoKaHR0cHM6Ly9kb2NzLmRqYW5nb3Byb2plY3QuY29tL2VuLzUuMi9yZWxlYXNl
cy81LjIuMi8KClNpZ25lZC1vZmYtYnk6IE1hcmN1cyBIb2ZmbWFubiA8YnVpbGRyb290QGJ1YnUx
LmV1PgotLS0KIHBhY2thZ2UvcHl0aG9uLWRqYW5nby9weXRob24tZGphbmdvLmhhc2ggfCA0ICsr
LS0KIHBhY2thZ2UvcHl0aG9uLWRqYW5nby9weXRob24tZGphbmdvLm1rICAgfCA0ICsrLS0KIDIg
ZmlsZXMgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdp
dCBhL3BhY2thZ2UvcHl0aG9uLWRqYW5nby9weXRob24tZGphbmdvLmhhc2ggYi9wYWNrYWdlL3B5
dGhvbi1kamFuZ28vcHl0aG9uLWRqYW5nby5oYXNoCmluZGV4IDMyYTljZTEzYjguLjE0ZWQxM2Zk
NmMgMTAwNjQ0Ci0tLSBhL3BhY2thZ2UvcHl0aG9uLWRqYW5nby9weXRob24tZGphbmdvLmhhc2gK
KysrIGIvcGFja2FnZS9weXRob24tZGphbmdvL3B5dGhvbi1kamFuZ28uaGFzaApAQCAtMSw2ICsx
LDYgQEAKICMgbWQ1LCBzaGEyNTYgZnJvbSBodHRwczovL3B5cGkub3JnL3B5cGkvZGphbmdvL2pz
b24KLW1kNSAgMzE3MTc0YzZlMDU5M2M0MGU1OGVjMWJkNDI4YjEwOTEgIGRqYW5nby01LjIuMS50
YXIuZ3oKLXNoYTI1NiAgNTdmZTFmMWI1OTQ2MmNhZWQwOTJjODBiM2RkMzI0ZmQ5MjE2MWI2MjBk
NTlhOWJhOTE4MWMzNDc0NmM5NzI4NCAgZGphbmdvLTUuMi4xLnRhci5negorbWQ1ICA3ODI1Nzdm
NTMyZWZhYjMyZjgxMTlhNzA3MWY1NWQwNCAgZGphbmdvLTUuMi4yLnRhci5negorc2hhMjU2ICA4
NTg1MmU1MTdmODQ0MzVlOWIxMzQyMTM3OWNkNmM0M2VmNWI0OGE5YzhiMzkxZDI5YTI2Zjc5MDA5
NjdlOTUyICBkamFuZ28tNS4yLjIudGFyLmd6CiAjIExvY2FsbHkgY29tcHV0ZWQgc2hhMjU2IGNo
ZWNrc3Vtcwogc2hhMjU2ICBiODQ2NDE1ZDFiNTE0ZTljMWRmZjE0YTIyZGViOTA2ZDc5NGJjNTQ2
Y2E2MTI5Zjk1MGExOGNkMDkxZTJhNjY5ICBMSUNFTlNFCiBzaGEyNTYgIGRjYWMxYzg2Y2I3YWI0
OTE3MDJiZGI0YzQxYmU2ODBmYWZkZTUxNTM2NzQ4Y2M4YWFlZTM4NDBlZWM1M2VkMTcgIGRqYW5n
by9jb250cmliL2dpcy9tZWFzdXJlLnB5CmRpZmYgLS1naXQgYS9wYWNrYWdlL3B5dGhvbi1kamFu
Z28vcHl0aG9uLWRqYW5nby5tayBiL3BhY2thZ2UvcHl0aG9uLWRqYW5nby9weXRob24tZGphbmdv
Lm1rCmluZGV4IDlkMDhjOGUxYzkuLmUzNmFiNTM4NWQgMTAwNjQ0Ci0tLSBhL3BhY2thZ2UvcHl0
aG9uLWRqYW5nby9weXRob24tZGphbmdvLm1rCisrKyBiL3BhY2thZ2UvcHl0aG9uLWRqYW5nby9w
eXRob24tZGphbmdvLm1rCkBAIC00LDEwICs0LDEwIEBACiAjCiAjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIwogCi1QWVRIT05fREpBTkdPX1ZFUlNJT04gPSA1LjIuMQorUFlUSE9OX0RKQU5HT19WRVJT
SU9OID0gNS4yLjIKIFBZVEhPTl9ESkFOR09fU09VUkNFID0gZGphbmdvLSQoUFlUSE9OX0RKQU5H
T19WRVJTSU9OKS50YXIuZ3oKICMgVGhlIG9mZmljaWFsIERqYW5nbyBzaXRlIGhhcyBhbiB1bnBy
YWN0aWNhbCBVUkwKLVBZVEhPTl9ESkFOR09fU0lURSA9IGh0dHBzOi8vZmlsZXMucHl0aG9uaG9z
dGVkLm9yZy9wYWNrYWdlcy9hYy8xMC8wZDU0NjI1ODc3MmI4ZjMxMzk4ZTY3Yzg1ZTUyYzY2ZWJj
MmIxM2E2NDcxOTNjM2VlZjhlZTQzM2YxYTgKK1BZVEhPTl9ESkFOR09fU0lURSA9IGh0dHBzOi8v
ZmlsZXMucHl0aG9uaG9zdGVkLm9yZy9wYWNrYWdlcy8zOS8xNy80NTY3ZWUxMmJiODQxMTRjNTQ0
ZDVjNGE3OTJlNzIyNmRiNTE3YWM3OGY1NTIxMTFlOWRjNjJkMWRlMTQKIFBZVEhPTl9ESkFOR09f
TElDRU5TRSA9IEJTRC0zLUNsYXVzZSwgTUlUIChqcXVlcnksIHV0aWxzL2FyY2hpdmUucHkpLCBC
U0QtMi1DbGF1c2UgKGlubGluZXMuanMpCiBQWVRIT05fREpBTkdPX0xJQ0VOU0VfRklMRVMgPSBM
SUNFTlNFIFwKIAlkamFuZ28vY29udHJpYi9naXMvbWVhc3VyZS5weSBcCi0tIAoyLjQzLjAKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBt
YWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJv
b3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==

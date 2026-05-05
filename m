Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06095FF885A
	for <buildroot@archiver.kernel.org>; Tue,  5 May 2026 12:46:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B9ADF6083C;
	Tue,  5 May 2026 12:46:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vxpxFBNvneIB; Tue,  5 May 2026 12:46:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E821F60838
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777985199;
	bh=4qRk9+dPWJswIXK9yLW7es2HTKS/RaZx3hTYvPsh1rY=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=pu2iK0E4UkLzfUW7acY72w5e0qXS9y9SI0a1Z4BwzzcRO5yrOPbUI0qAr58cyN/rb
	 Mn5U0wsg3K3ITYfGKrRn5LbuPDRQdW908UDlwMKIciiDHQRek4VZJHhS4Bnu9S2FDg
	 0Y0HdYJCNTI39drhxndH8WLuppm+sHziyGijiwPPlpuCg4L2PlkH4JhJYBR5BhzSSY
	 uZUkAcRbEQoiW/aaGX/sbAgfPSvTSI9pEZgQ9k86Ll0qycZe+seBtC08uDze2/0ANU
	 kZjpixNmQUl5JeKlNMKM+Z8BA6S5xrF7/U3AeYciupXF8ix2xEkKH+oGCVpCsGSWJT
	 feNkRrQXl8VXg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E821F60838;
	Tue,  5 May 2026 12:46:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 204E82A8
 for <buildroot@buildroot.org>; Tue,  5 May 2026 12:46:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 11B22812A8
 for <buildroot@buildroot.org>; Tue,  5 May 2026 12:46:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Nd6MvOOQ6SML for <buildroot@buildroot.org>;
 Tue,  5 May 2026 12:46:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.67.36.66;
 helo=mout02.posteo.de; envelope-from=martink@posteo.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C28118121C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C28118121C
Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C28118121C
 for <buildroot@buildroot.org>; Tue,  5 May 2026 12:46:35 +0000 (UTC)
Received: from submission (posteo.de [185.67.36.169]) 
 by mout02.posteo.de (Postfix) with ESMTPS id E13B9240101
 for <buildroot@buildroot.org>; Tue,  5 May 2026 14:46:32 +0200 (CEST)
Received: from customer (localhost [127.0.0.1])
 by submission (posteo.de) with ESMTPSA id 4g8ytw0xZDz9rxD;
 Tue,  5 May 2026 14:46:32 +0200 (CEST)
From: =?UTF-8?q?Martin=20Kepplinger-Novakovi=C4=87?= <martink@posteo.de>
To: buildroot@buildroot.org
Cc: =?UTF-8?q?Martin=20Kepplinger-Novakovi=C4=87?= <martink@posteo.de>
Date: Tue, 05 May 2026 12:46:32 +0000
Message-ID: <20260505124607.327055-1-martink@posteo.de>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=posteo.de; s=2017; 
 t=1777985192; bh=Wcv+rK+lCo6lTwqFWC2DXX58c/ANhL3PeWhWY6HWEtM=;
 h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type:
 Content-Transfer-Encoding:From;
 b=qeXCJcVlBcO6QDu41+8iAmlOFGtuYZvoMeyAXxE9E1v8E9SHcSyVgmaPR3d5ypFbk
 /sVk6xno/vGcAdOoA6vB6k6EofRDcycBPUZl6NF2Dyk/13/zPJ5emFnsDXGXQUe+3B
 OXwHU/dS252K1+kkHxDWo/H7j4ET3+CwRW6SoBcn1XrS1a9WVZBmOz1N3AUOQ2SX8L
 n7c5B1cEikiUpgXLA3HlXKqKOYlpmx1AVqBpKTX5wiY/bvdi+Os65fhRJyQxeSjqXx
 EVB06ImYkrFQp2Jccdmy9vCiUI6jxpy33PyWmn9pKCHgJVl7EjOCI/QDpuWmBWxhep
 Ymxgn74W1vR8Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=posteo.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=posteo.de header.i=@posteo.de header.a=rsa-sha256
 header.s=2017 header.b=qeXCJcVl
Subject: [Buildroot] [PATCH] DEVELOPERS: remove Martin from x11vnc
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

SSBkb24ndCB1c2UgbWFpbnRhaW4geDExdm5jIGluIGJ1aWxkcm9vdCBhbnltb3JlIGFuZCBjYW4n
dCBlYXNpbHkgdGVzdC4KClNpZ25lZC1vZmYtYnk6IE1hcnRpbiBLZXBwbGluZ2VyLU5vdmFrb3Zp
xIcgPG1hcnRpbmtAcG9zdGVvLmRlPgotLS0KIERFVkVMT1BFUlMgfCAxIC0KIDEgZmlsZSBjaGFu
Z2VkLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvREVWRUxPUEVSUyBiL0RFVkVMT1BFUlMK
aW5kZXggMTc5Y2RmNTBmNi4uZDg0OWZhODI4YSAxMDA2NDQKLS0tIGEvREVWRUxPUEVSUworKysg
Yi9ERVZFTE9QRVJTCkBAIC0yMzUzLDcgKzIzNTMsNiBAQCBGOglwYWNrYWdlL3B5dGhvbi13ZWJh
cmdzLwogTjoJTWFydGluIEtlcHBsaW5nZXIgPG1hcnRpbmtAcG9zdGVvLmRlPgogRjoJcGFja2Fn
ZS90c2xpYi8KIEY6CXBhY2thZ2UveDExcjcveGRyaXZlcl94Zjg2LWlucHV0LXRzbGliLwotRjoJ
cGFja2FnZS94MTF2bmMvCiAKIE46CU1hcnRpbiBQb3ZpxaFlciA8cG92aWsrbGluQGN1dGViaXQu
b3JnPgogRjoJcGFja2FnZS9weXRob24tY29uc3RydWN0LwotLSAKMi40Ny4zCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBs
aXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=

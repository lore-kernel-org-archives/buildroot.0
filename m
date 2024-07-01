Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE975C2BD09
	for <buildroot@archiver.kernel.org>; Mon,  1 Jul 2024 14:57:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0F48440E03;
	Mon,  1 Jul 2024 14:57:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ysJXbqFAbPNI; Mon,  1 Jul 2024 14:57:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8A8DD40E10
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8A8DD40E10;
	Mon,  1 Jul 2024 14:57:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0B9A01BF97A
 for <buildroot@lists.busybox.net>; Mon,  1 Jul 2024 14:57:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DFDD5605E6
 for <buildroot@lists.busybox.net>; Mon,  1 Jul 2024 14:57:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id INGOMPuk8X7n for <buildroot@lists.busybox.net>;
 Mon,  1 Jul 2024 14:57:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42c; helo=mail-wr1-x42c.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org DEA97605FC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DEA97605FC
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DEA97605FC
 for <buildroot@buildroot.org>; Mon,  1 Jul 2024 14:57:24 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3676447928bso1790495f8f.0
 for <buildroot@buildroot.org>; Mon, 01 Jul 2024 07:57:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719845843; x=1720450643;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+AaUukI2H8Z/PULBBOztJFBzAcYWIPoIQBuuWqbqFrY=;
 b=aCAH0K+7LR391Ri6rKeTGaJaN6JapPDXEwEdyE6UqgHPcJs3/t3r1JFudLx/RFZWdV
 6quzjLSSg0VL/QDKQgwVbnn+DX3RUtXKpNNCz9KVb1sqj0FDqxs5sFRMzd37GCbG2mZw
 rULJPApByIfM4OBn2JQuRwu9Gwp9VG0xDVAyZFXxgGVSyPasgD9ivjkjXr3YSnV0cuKO
 M5CvrLnwEi1WpYWaaOhwCJfLxYiGs14/s3tU5DxcMzykNdvW1c+C1qq6CzrVNVpfrNGP
 5lEtVVFj02OpmISBc9+2cwOUSFGdPcNUY0vdKKTa+ccqSmYkjAMAHFzlpGE5dvnOz9FY
 Kq4w==
X-Gm-Message-State: AOJu0YxXABL1QHuTt3QUfuiOv5vugWf0gtiHuqOMNNYqnwEA92fKs9cx
 QjRfmSsWgHNaPrMy3rgE1eczatiTUQHSgMScrAmH67Cwkk8IdNtGHnRntwbex1wFsoASne/O8Az
 egT4=
X-Google-Smtp-Source: AGHT+IGDO9AlJISWnH3ZSWTp8cKz5p2ff+O+Rs0+33HnOrO6SqEjXyxpiyiuFIXuPNnGxnTBc8yjuw==
X-Received: by 2002:a05:6000:458f:b0:366:dcd5:9461 with SMTP id
 ffacd0b85a97d-3677569e902mr3384653f8f.2.1719845842390; 
 Mon, 01 Jul 2024 07:57:22 -0700 (PDT)
Received: from junian.fritz.box (94.105.103.7.dyn.edpnet.net. [94.105.103.7])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3675a0e141esm10153286f8f.58.2024.07.01.07.57.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Jul 2024 07:57:21 -0700 (PDT)
To: buildroot@buildroot.org
Date: Mon,  1 Jul 2024 16:57:04 +0200
Message-Id: <20240701145708.2886402-2-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20240701145708.2886402-1-raphael.melotte@mind.be>
References: <20240701145708.2886402-1-raphael.melotte@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1719845843; x=1720450643; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+AaUukI2H8Z/PULBBOztJFBzAcYWIPoIQBuuWqbqFrY=;
 b=aPDviEFbHszW1vtEE3ENkK9fRSX3v4ZAD1vAG4OW6kZaLfOgwET+6JmnN/woUYOTHc
 LgpVcV1YvUeG7sXFi2mn6804inis2Xt8PKNhbjz9fuAooJ4NroDd/D60zjE+x6dDaBgd
 UMvkmCCVCk6J/sPZhDD5uvKRsfQR1r5EbajIgW31YROLGodsx1ZRe99g0obMoDo6vzxy
 jK/xCDb1JEA9hZdwMBiB0R+6hmeVBvhHICizRucP30UQnQBETOCp1Qd0Lig9yKCvWJ/1
 P/rYrN9mlHoFiv9JD1pKUNt5RU8655BT28x9UsA9ni6EUBxxaG5WVjZ4olIj73SGWKTg
 e6sg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=aPDviEFb
Subject: [Buildroot] [PATCH 2/4] support/testing: add new test for
 python-sdbus
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
From: =?utf-8?q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

U2lnbmVkLW9mZi1ieTogUmFwaGHDq2wgTcOpbG90dGUgPHJhcGhhZWwubWVsb3R0ZUBtaW5kLmJl
PgotLS0KIERFVkVMT1BFUlMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICB8ICAyICsrCiAuLi4vdGVzdGluZy90ZXN0cy9wYWNrYWdlL3NhbXBsZV9weXRob25fc2RidXMu
cHkgICAgfCAxMyArKysrKysrKysrKysrCiBzdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS90
ZXN0X3B5dGhvbl9zZGJ1cy5weSAgfCAxMiArKysrKysrKysrKysKIDMgZmlsZXMgY2hhbmdlZCwg
MjcgaW5zZXJ0aW9ucygrKQogY3JlYXRlIG1vZGUgMTAwNjQ0IHN1cHBvcnQvdGVzdGluZy90ZXN0
cy9wYWNrYWdlL3NhbXBsZV9weXRob25fc2RidXMucHkKIGNyZWF0ZSBtb2RlIDEwMDY0NCBzdXBw
b3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS90ZXN0X3B5dGhvbl9zZGJ1cy5weQoKZGlmZiAtLWdp
dCBhL0RFVkVMT1BFUlMgYi9ERVZFTE9QRVJTCmluZGV4IDBkNThkZjdkNTAuLjE0NmM2ZmZlYTUg
MTAwNjQ0Ci0tLSBhL0RFVkVMT1BFUlMKKysrIGIvREVWRUxPUEVSUwpAQCAtMjY3Miw5ICsyNjcy
LDExIEBAIEY6CXBhY2thZ2UvcHl0aG9uLXNkYnVzLwogRjoJc3VwcG9ydC90ZXN0aW5nL3Rlc3Rz
L3BhY2thZ2Uvc2FtcGxlX3B5dGhvbl9qbWVzcGF0aC5weQogRjoJc3VwcG9ydC90ZXN0aW5nL3Rl
c3RzL3BhY2thZ2Uvc2FtcGxlX3B5dGhvbl9yc2EucHkKIEY6CXN1cHBvcnQvdGVzdGluZy90ZXN0
cy9wYWNrYWdlL3NhbXBsZV9weXRob25fczN0cmFuc2Zlci5weQorRjoJc3VwcG9ydC90ZXN0aW5n
L3Rlc3RzL3BhY2thZ2Uvc2FtcGxlX3B5dGhvbl9zZGJ1cy5weQogRjoJc3VwcG9ydC90ZXN0aW5n
L3Rlc3RzL3BhY2thZ2UvdGVzdF9weXRob25fam1lc3BhdGgucHkKIEY6CXN1cHBvcnQvdGVzdGlu
Zy90ZXN0cy9wYWNrYWdlL3Rlc3RfcHl0aG9uX3JzYS5weQogRjoJc3VwcG9ydC90ZXN0aW5nL3Rl
c3RzL3BhY2thZ2UvdGVzdF9weXRob25fczN0cmFuc2Zlci5weQorRjoJc3VwcG9ydC90ZXN0aW5n
L3Rlc3RzL3BhY2thZ2UvdGVzdF9weXRob25fc2RidXMucHkKIAogTjoJUmFwaGFlbCBQYXZsaWRp
cyA8cmFwaGFlbC5wYXZsaWRpc0BnbWFpbC5jb20+CiBGOglwYWNrYWdlL252aWRpYS1wZXJzaXN0
ZW5jZWQvCmRpZmYgLS1naXQgYS9zdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS9zYW1wbGVf
cHl0aG9uX3NkYnVzLnB5IGIvc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2Uvc2FtcGxlX3B5
dGhvbl9zZGJ1cy5weQpuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAwLi42ODEz
MWNlZGU1Ci0tLSAvZGV2L251bGwKKysrIGIvc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2Uv
c2FtcGxlX3B5dGhvbl9zZGJ1cy5weQpAQCAtMCwwICsxLDEzIEBACisjIS91c3IvYmluL2VudiBw
eXRob24zCisKK2ltcG9ydCBzZGJ1cworZnJvbSBzZGJ1c19ibG9jay5kYnVzX2RhZW1vbiBpbXBv
cnQgRnJlZWRlc2t0b3BEYnVzCisKK3MgPSBGcmVlZGVza3RvcERidXMoc2RidXMuc2RfYnVzX29w
ZW5fc3lzdGVtKCkpCisKK3Byb3BzID0gcy5wcm9wZXJ0aWVzX2dldF9hbGxfZGljdCgpCisKK3By
aW50KHByb3BzKQorCisjIENoZWNrIGZvciBhIHJhbmRvbWx5IGNob3NlbiBpbnRlcmZhY2U6Cith
c3NlcnQgJ29yZy5mcmVlZGVza3RvcC5EQnVzLk1vbml0b3JpbmcnIGluIHByb3BzWydpbnRlcmZh
Y2VzJ10KZGlmZiAtLWdpdCBhL3N1cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3Rlc3RfcHl0
aG9uX3NkYnVzLnB5IGIvc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2UvdGVzdF9weXRob25f
c2RidXMucHkKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMC4uNzE2M2JiZWVk
MQotLS0gL2Rldi9udWxsCisrKyBiL3N1cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3Rlc3Rf
cHl0aG9uX3NkYnVzLnB5CkBAIC0wLDAgKzEsMTIgQEAKK2Zyb20gdGVzdHMucGFja2FnZS50ZXN0
X3B5dGhvbiBpbXBvcnQgVGVzdFB5dGhvblBhY2thZ2VCYXNlCisKKworY2xhc3MgVGVzdFB5dGhv
blB5M1NkYnVzKFRlc3RQeXRob25QYWNrYWdlQmFzZSk6CisgICAgX190ZXN0X18gPSBUcnVlCisg
ICAgY29uZmlnID0gVGVzdFB5dGhvblBhY2thZ2VCYXNlLmNvbmZpZyArIFwKKyAgICAgICAgIiIi
CisgICAgICAgIEJSMl9QQUNLQUdFX1BZVEhPTjM9eQorICAgICAgICBCUjJfSU5JVF9TWVNURU1E
PXkKKyAgICAgICAgQlIyX1BBQ0tBR0VfUFlUSE9OX1NEQlVTPXkKKyAgICAgICAgIiIiCisgICAg
c2FtcGxlX3NjcmlwdHMgPSBbInRlc3RzL3BhY2thZ2Uvc2FtcGxlX3B5dGhvbl9zZGJ1cy5weSJd
Ci0tIAoyLjM3LjMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6
Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==

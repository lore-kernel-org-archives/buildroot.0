Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9076BEED617
	for <buildroot@archiver.kernel.org>; Thu, 12 Sep 2024 16:22:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3D306410CD;
	Thu, 12 Sep 2024 16:22:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ptlc5l7OBU1h; Thu, 12 Sep 2024 16:22:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EBEB1410B2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EBEB1410B2;
	Thu, 12 Sep 2024 16:22:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1CE6C1BF30E
 for <buildroot@lists.busybox.net>; Thu, 12 Sep 2024 16:22:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0AFCE410B2
 for <buildroot@lists.busybox.net>; Thu, 12 Sep 2024 16:22:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SwIy7e86WJy0 for <buildroot@lists.busybox.net>;
 Thu, 12 Sep 2024 16:22:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::636; helo=mail-ej1-x636.google.com;
 envelope-from=sairon@sairon.cz; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org CC0B640556
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CC0B640556
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CC0B640556
 for <buildroot@buildroot.org>; Thu, 12 Sep 2024 16:22:37 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a8d2b4a5bf1so156676166b.2
 for <buildroot@buildroot.org>; Thu, 12 Sep 2024 09:22:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726158156; x=1726762956;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=c562nQPHE58wLAnACUuzPMjNuJBUChWbaGxOwrjGCVw=;
 b=b+0uNBhtW/PK81XoQ1qMv1e17vxXuszggZO+drjc5QRrxRMvcrebEaKnk9dcbERXSz
 gogWy8B6iAAUO2jVFeBYa50hJ3jDGPG7dsUrvSyxZRNsMDCTIiUVcRMVJ2B5C+4L5Yvi
 C2xIXJ1cVli72lAZyU9C77M4yVztOVrTxImj235hCr2gSWURRQvc+Ju+48l5KZMjF/zW
 15OhGcJX8yjwSjDKXLPnrbk+Shf6qIwV4N0+pn9MX9mighEQyELIXkCjRjZj2ZaSkLEt
 K2bXeO2nvAcChYR2AujyjjtStpEvO95JyE60/lXSdFFGYlLCOXre3YeqtifBcIWmfGVx
 Ql0A==
X-Gm-Message-State: AOJu0YytiNMyLZVuMxEnAE8EDI+0wiUzpUku/Thl5L2xHCKHnCyzMNGZ
 obBN6UR9AIbhPzYiji1slM4ToAfbXbc1REGKr0GR4/0D+lQj2ASTK/emVGLxm2HivdZSeDrVY8+
 Q
X-Google-Smtp-Source: AGHT+IGXrA/ufB/7M6GrY8hpMoCi5c0u0QNznUhwJMHzJJsztm/1fRBESVVJssHjeUhrWisnqbXdRQ==
X-Received: by 2002:a17:907:efc7:b0:a8d:439d:5c25 with SMTP id
 a640c23a62f3a-a90294a881amr366399966b.4.1726158155552; 
 Thu, 12 Sep 2024 09:22:35 -0700 (PDT)
Received: from krabice.lan (ip-89-103-66-201.bb.vodafone.cz. [89.103.66.201])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8d25d5dc8csm765582766b.206.2024.09.12.09.22.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Sep 2024 09:22:35 -0700 (PDT)
From: =?UTF-8?q?Jan=20=C4=8Cerm=C3=A1k?= <sairon@sairon.cz>
To: buildroot@buildroot.org
Date: Thu, 12 Sep 2024 18:22:31 +0200
Message-ID: <20240912162232.1588976-1-sairon@sairon.cz>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sairon.cz; s=google; t=1726158156; x=1726762956; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=c562nQPHE58wLAnACUuzPMjNuJBUChWbaGxOwrjGCVw=;
 b=J5+H4t4zrybO3/2GFtNDgcFBKK1ChRH9S+6Njtpftt3a5ooH7BREJsLfkBSuHpWjJi
 qYCcsBa/WW78+A1WK3wB64nd9l5dPVfQnx4b7RPTpgXCa128e/ehBljFGTNdVNXEa5CB
 ct6RcepasjFAHdgTN0IhYCSdH0zNvYlVtm9jMJyFxZ8gGZm48bhX3UncpdABCWVbD1NS
 OvHBV+Jo+WV3bW6VGvKnaRPB6DpchqqJNbRHMMPUk839k8+uawVMwBbYI36iWVN+oowT
 nbQ1VHKwq+ipSoY5JAYPpJY6LYAbOY97jPKwc9q/G3aOoUj4DOtxu1zBKoGoBy1Mb4UC
 UE9g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=sairon.cz
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=sairon.cz header.i=@sairon.cz header.a=rsa-sha256
 header.s=google header.b=J5+H4t4z
Subject: [Buildroot] [PATCH 1/1] package/procps-ng: fix build with
 BR2_PACKAGE_SYSTEMD enabled
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
Cc: =?UTF-8?q?Jan=20=C4=8Cerm=C3=A1k?= <sairon@sairon.cz>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QWZ0ZXIgdXBkYXRlIHRvIHY0LjAuNCwgcHJvcHMtbmcgYnVpbGQgZmFpbHMgb24gbGlua2VyIGVy
cm9yIGlmCkJSMl9QQUNLQUdFX1NZU1RFTUQgaXMgZW5hYmxlZDoKCi9idWlsZHJvb3Qvb3V0cHV0
L2hvc3QvbGliL2djYy94ODZfNjQtYnVpbGRyb290LWxpbnV4LWdudS8xMy4zLjAvLi4vLi4vLi4v
Li4veDg2XzY0LWJ1aWxkcm9vdC1saW51eC1nbnUvYmluL2xkOiBzcmMvdy5vOiB1bmRlZmluZWQg
cmVmZXJlbmNlIHRvIHN5bWJvbCAnc2Rfc2Vzc2lvbl9nZXRfdWlkQEBMSUJTWVNURU1EXzIwOScK
L2J1aWxkcm9vdC9vdXRwdXQvaG9zdC9saWIvZ2NjL3g4Nl82NC1idWlsZHJvb3QtbGludXgtZ251
LzEzLjMuMC8uLi8uLi8uLi8uLi94ODZfNjQtYnVpbGRyb290LWxpbnV4LWdudS9iaW4vbGQ6IC9i
dWlsZHJvb3Qvb3V0cHV0L2hvc3QveDg2XzY0LWJ1aWxkcm9vdC1saW51eC1nbnUvc3lzcm9vdC91
c3IvbGliNjQvbGlic3lzdGVtZC5zby4wOiBlcnJvciBhZGRpbmcgc3ltYm9sczogRFNPIG1pc3Np
bmcgZnJvbSBjb21tYW5kIGxpbmUKY29sbGVjdDI6IGVycm9yOiBsZCByZXR1cm5lZCAxIGV4aXQg
c3RhdHVzCgpBZGQgbHN5c3RlbWQgdG8gY29uZmlndXJlIGFyZ3VtZW50cyBpZiBzeXN0ZW1kIGlz
IGVuYWJsZWQgdG8gZml4IHRoaXMuCgpTaWduZWQtb2ZmLWJ5OiBKYW4gxIxlcm3DoWsgPHNhaXJv
bkBzYWlyb24uY3o+Ci0tLQogcGFja2FnZS9wcm9jcHMtbmcvcHJvY3BzLW5nLm1rIHwgNCArKyst
CiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0t
Z2l0IGEvcGFja2FnZS9wcm9jcHMtbmcvcHJvY3BzLW5nLm1rIGIvcGFja2FnZS9wcm9jcHMtbmcv
cHJvY3BzLW5nLm1rCmluZGV4IDJmMjhlMzU3MWUuLmNmZjRlMjFjNWUgMTAwNjQ0Ci0tLSBhL3Bh
Y2thZ2UvcHJvY3BzLW5nL3Byb2Nwcy1uZy5taworKysgYi9wYWNrYWdlL3Byb2Nwcy1uZy9wcm9j
cHMtbmcubWsKQEAgLTEyLDExICsxMiwxMyBAQCBQUk9DUFNfTkdfTElDRU5TRV9GSUxFUyA9IENP
UFlJTkcgQ09QWUlORy5MSUIKIFBST0NQU19OR19DUEVfSURfVkFMSUQgPSBZRVMKIFBST0NQU19O
R19JTlNUQUxMX1NUQUdJTkcgPSBZRVMKIFBST0NQU19OR19ERVBFTkRFTkNJRVMgPSBuY3Vyc2Vz
IGhvc3QtcGtnY29uZiAkKFRBUkdFVF9OTFNfREVQRU5ERU5DSUVTKQotUFJPQ1BTX05HX0NPTkZf
T1BUUyA9IExJQlM9JChUQVJHRVRfTkxTX0xJQlMpCitQUk9DUFNfTkdfQ09ORl9PUFRTID0gTElC
Uz0iJChQUk9DUFNfTkdfTElCUykiCitQUk9DUFNfTkdfTElCUz0kKFRBUkdFVF9OTFNfTElCUykK
IAogaWZlcSAoJChCUjJfUEFDS0FHRV9TWVNURU1EKSx5KQogUFJPQ1BTX05HX0RFUEVOREVOQ0lF
UyArPSBzeXN0ZW1kCiBQUk9DUFNfTkdfQ09ORl9PUFRTICs9IC0td2l0aC1zeXN0ZW1kCitQUk9D
UFNfTkdfTElCUyArPSAtbHN5c3RlbWQKIGVsc2UKIFBST0NQU19OR19DT05GX09QVFMgKz0gLS13
aXRob3V0LXN5c3RlbWQKIGVuZGlmCi0tIAoyLjQ2LjAKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290
QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8vYnVpbGRyb290Cg==

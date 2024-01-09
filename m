Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2E03C46CD2
	for <buildroot@archiver.kernel.org>; Tue,  9 Jan 2024 18:34:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 63DDF41BB3;
	Tue,  9 Jan 2024 18:34:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 63DDF41BB3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AoOruXSEZhAR; Tue,  9 Jan 2024 18:34:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B318B41B81;
	Tue,  9 Jan 2024 18:34:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B318B41B81
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0F0991BF2A9
 for <buildroot@lists.busybox.net>; Tue,  9 Jan 2024 18:34:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D5992611B2
 for <buildroot@lists.busybox.net>; Tue,  9 Jan 2024 18:33:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D5992611B2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QRkzIDCHuf2v for <buildroot@lists.busybox.net>;
 Tue,  9 Jan 2024 18:33:59 +0000 (UTC)
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9BF7661097
 for <buildroot@buildroot.org>; Tue,  9 Jan 2024 18:33:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9BF7661097
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-a28ee72913aso747241666b.1
 for <buildroot@buildroot.org>; Tue, 09 Jan 2024 10:33:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704825236; x=1705430036;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NasvaRPSaPm0QBS9p/xORwHCPNAr+rejUjQ3tVFU1qo=;
 b=CknWCoiw8cJzgQmscwjeUvpvCHCewnnYkoN/8X4ul05LxmvS3ndu5WiH8h3Ggf/mFd
 DYC1ZjmYftMZ1lsSVk3I07UVRFO8/P7zmaioQR4P9bWLACxPn4ncd0iffZAMxTMgHmXG
 ItTRevtZFFIE6YnEGM4OHuXMrS98ZiIdY3BGakagbmumtkwbBqn49kpRmEzsqX8nstX3
 yQrCnJdhS5sYDKho7JwCPJKFoDPTt4U9BNmLM2pbSw7Q7PUNnda9y+IdTaH9ci8q/V8K
 8t2NOkV49qd7lPFx+GQUSX0Dp/v5q8o59uq1sXmU9mBmNc0yyHh6fKC5PDdRQcnQXLUq
 qoRQ==
X-Gm-Message-State: AOJu0YwPDt9WuGJSDfpE91ijDvT/571/FxWVKEbhoim8D7WlB13OocQr
 z9IRzfJQBF193X5E/VlVc6i4gy2FWM/9Xm6Qgi4vgeqG+j4NPBXL
X-Google-Smtp-Source: AGHT+IHyMi54QhaTmhI1CHlrsaIy/DwUpKN4+rA317r4Oh2rcg873lFiJndZCNqzVhIpjMHaN335GQ==
X-Received: by 2002:a17:906:a157:b0:a29:b31d:1dc6 with SMTP id
 bu23-20020a170906a15700b00a29b31d1dc6mr1591635ejb.6.1704825236289; 
 Tue, 09 Jan 2024 10:33:56 -0800 (PST)
Received: from krabice.lan (ip-89-103-66-201.bb.vodafone.cz. [89.103.66.201])
 by smtp.gmail.com with ESMTPSA id
 w22-20020a1709064a1600b00a26abea03bbsm1314694eju.141.2024.01.09.10.33.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jan 2024 10:33:56 -0800 (PST)
From: =?UTF-8?q?Jan=20=C4=8Cerm=C3=A1k?= <sairon@sairon.cz>
To: buildroot@buildroot.org
Date: Tue,  9 Jan 2024 19:33:53 +0100
Message-Id: <20240109183354.361126-1-sairon@sairon.cz>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sairon.cz; s=google; t=1704825236; x=1705430036; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=NasvaRPSaPm0QBS9p/xORwHCPNAr+rejUjQ3tVFU1qo=;
 b=SbE6P78tTz3RVms4PtxFNHFbXOx80i8I9px+QBLBsgXpt0Q+Bn5pvajpzSZ9IX7qrt
 iRaE9/QUmmfL+C/1OKhSw8KxaLRVhON6SGrQ65POIF0c0DkXAH9+agQnA0CBAclF4T6M
 9otrGiS5k64szSmgYHmbBhaaQiv6HEDYjlu7BauSgOEUamcvvKnvQRZUF5gZuNDU94uV
 t5tEj9YoZMabgZnGyiyHhwJqMoOY6TWMJaQ1FIEFiNVfeiE5KCow2RABGqlt3NURecS7
 6QngjqLuWH5n3Ia9CJk9zOzC3mrcZ8X1fxMcMKcRBiUwnFxhemu9M7Z+mTMbx0/1idtH
 PF2w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=sairon.cz header.i=@sairon.cz
 header.a=rsa-sha256 header.s=google header.b=SbE6P78t
Subject: [Buildroot] [PATCH 1/1] package/linux-firmware: bump version to
 20231211
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
Cc: =?UTF-8?q?Jan=20=C4=8Cerm=C3=A1k?= <sairon@sairon.cz>,
 Bernd Kuhls <bernd@kuhls.net>, "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VXBkYXRlZCBXSEVOQ0UgaGFzaCBkdWUgdG8gdmFyaW91cyBjb21taXRzOgpodHRwczovL2dpdC5r
ZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9maXJtd2FyZS9saW51eC1maXJtd2Fy
ZS5naXQvbG9nL1dIRU5DRQoKU2lnbmVkLW9mZi1ieTogSmFuIMSMZXJtw6FrIDxzYWlyb25Ac2Fp
cm9uLmN6PgotLS0KIHBhY2thZ2UvbGludXgtZmlybXdhcmUvbGludXgtZmlybXdhcmUuaGFzaCB8
IDQgKystLQogcGFja2FnZS9saW51eC1maXJtd2FyZS9saW51eC1maXJtd2FyZS5tayAgIHwgMiAr
LQogMiBmaWxlcyBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZm
IC0tZ2l0IGEvcGFja2FnZS9saW51eC1maXJtd2FyZS9saW51eC1maXJtd2FyZS5oYXNoIGIvcGFj
a2FnZS9saW51eC1maXJtd2FyZS9saW51eC1maXJtd2FyZS5oYXNoCmluZGV4IDY3MjJhYTE0YzYu
LjRiMTg4MDMyYmYgMTAwNjQ0Ci0tLSBhL3BhY2thZ2UvbGludXgtZmlybXdhcmUvbGludXgtZmly
bXdhcmUuaGFzaAorKysgYi9wYWNrYWdlL2xpbnV4LWZpcm13YXJlL2xpbnV4LWZpcm13YXJlLmhh
c2gKQEAgLTEsNSArMSw1IEBACiAjIEZyb20gaHR0cHM6Ly9taXJyb3JzLmVkZ2Uua2VybmVsLm9y
Zy9wdWIvbGludXgva2VybmVsL2Zpcm13YXJlL3NoYTI1NnN1bXMuYXNjCi1zaGEyNTYgIGM5OGQy
MDBmYzRhMzEyMGRlMWE1OTQ3MTNjZTM0ZTEzNTgxOWRmZjIzZTg4M2E0ZWQzODc4NjNiYTI1Njc5
YzcgIGxpbnV4LWZpcm13YXJlLTIwMjMxMDMwLnRhci54egorc2hhMjU2ICA5NmFmN2U0YjVlYWJk
Mzc4NjljZGIzZGNiYjdhYjM2OTExMTA2ZDM5Yjc2ZTc5OWZhMWNhYWIxNmE5ZGJlOGJiICBsaW51
eC1maXJtd2FyZS0yMDIzMTIxMS50YXIueHoKIAogIyBIYXNoIGZvciBsaWNlbnNlIGZpbGVzCiBz
aGEyNTYgIDgxMTY0MzNmNDAwNGZjMGMyNGQ3MmIzZDllNDk3ODA4YjcyNGFhMGU1ZTFjZDYzZmMx
YmY2NmI3MTViMWUyZTkgIExJQ0VOQ0UuQWJpbGlzCkBAIC0zNiw2ICszNiw2IEBAIHNoYTI1NiAg
ODU0MmFlYWJmMjc2MTkzNTEyMmQ2OTM1NjFlMTY3NjZjZTFiY2MyYjBkMDAzMjA0ZjkwNDBiN2Q2
ZDkyOWYyZSAgTElDRU5TCiBzaGEyNTYgIGJlOTA0Y2QyOGNiMjkyYjgwY2RiNmNmNDEyYWIwZDkx
NTlkNDMxNjcxZTk4N2FkNDMzYzFmNjJlMDk4OGE5YmMgIExJQ0VOU0UucWNvbQogc2hhMjU2ICBm
YzYyMjNkNGJmZTlmMmY5ZTJlZGRjNDRiOWZlNTcyMWQwY2FmNDlmMDFjYjA4ZDYwMjkwNmFkZDY4
NmQ4YzZmICBMSUNFTlNFLnJhZGVvbgogc2hhMjU2ICAyYmRkMmU3MTZmMDVkOTczN2QzZjlhMjBm
OWEzYTNjMGNhZWUwZTg2NjEwMGRkYjA2NzNmMTE3OGU0MmY5MmI5ICBMSUNFTlNFLnNkbWFfZmly
bXdhcmUKLXNoYTI1NiAgNjk3MTM0ODU5YjY2M2JjMTEwZDU3Mjc1YTdhNzg2MmJiYTIxYzQ0MjUy
NjZhYWM4YzYyYmVlMTgyMDJhYWMyMCAgV0hFTkNFCitzaGEyNTYgIGRkNjNlNjdkM2Q5ZTUxZjg0
ZmVkOWEzZWZhN2E0NjUzMTBiNWI1MDU4OTY5ZWI3Mjk1YTU4MzM5MjI3YWVlMTQgIFdIRU5DRQog
c2hhMjU2ICBmYTQzZTFiOWExM2IzNDFhMDdhZGNhOWRiZTczZDBmOTA3MmQ3OTY2ZmRmZTgxMWMw
MWYwZGQyODcyZDczMDlhICBxY29tL05PVElDRS50eHQKIHNoYTI1NiAgYmVmOWM4MjhlODRmMjFl
NzgzNWI0ZGU3ZGFmOTU0YTMyN2UxZmY3Nzc4NzFiNThlMTE2MDM5YjY4NGMwZDYwNCAgTElDRU5D
RS5lMTAwCmRpZmYgLS1naXQgYS9wYWNrYWdlL2xpbnV4LWZpcm13YXJlL2xpbnV4LWZpcm13YXJl
Lm1rIGIvcGFja2FnZS9saW51eC1maXJtd2FyZS9saW51eC1maXJtd2FyZS5tawppbmRleCA5Njkw
NWRkOTA5Li5mZmI0ZmMyZTdiIDEwMDY0NAotLS0gYS9wYWNrYWdlL2xpbnV4LWZpcm13YXJlL2xp
bnV4LWZpcm13YXJlLm1rCisrKyBiL3BhY2thZ2UvbGludXgtZmlybXdhcmUvbGludXgtZmlybXdh
cmUubWsKQEAgLTQsNyArNCw3IEBACiAjCiAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwogCi1MSU5V
WF9GSVJNV0FSRV9WRVJTSU9OID0gMjAyMzEwMzAKK0xJTlVYX0ZJUk1XQVJFX1ZFUlNJT04gPSAy
MDIzMTIxMQogTElOVVhfRklSTVdBUkVfU09VUkNFID0gbGludXgtZmlybXdhcmUtJChMSU5VWF9G
SVJNV0FSRV9WRVJTSU9OKS50YXIueHoKIExJTlVYX0ZJUk1XQVJFX1NJVEUgPSAkKEJSMl9LRVJO
RUxfTUlSUk9SKS9saW51eC9rZXJuZWwvZmlybXdhcmUKIExJTlVYX0ZJUk1XQVJFX0lOU1RBTExf
SU1BR0VTID0gWUVTCi0tIAoyLjM0LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9v
dC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRy
b290Cg==

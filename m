Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 997F8C4167B
	for <buildroot@archiver.kernel.org>; Tue,  7 Nov 2023 13:17:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3030B8135E;
	Tue,  7 Nov 2023 13:17:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3030B8135E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FQ1qvHgbhVwX; Tue,  7 Nov 2023 13:17:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7D60081353;
	Tue,  7 Nov 2023 13:16:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7D60081353
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E04501BF370
 for <buildroot@lists.busybox.net>; Tue,  7 Nov 2023 13:16:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B9E2681353
 for <buildroot@lists.busybox.net>; Tue,  7 Nov 2023 13:16:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B9E2681353
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XjRmDS5cSSm7 for <buildroot@lists.busybox.net>;
 Tue,  7 Nov 2023 13:16:56 +0000 (UTC)
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6C17781309
 for <buildroot@buildroot.org>; Tue,  7 Nov 2023 13:16:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6C17781309
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-53dfc28a2afso9537013a12.1
 for <buildroot@buildroot.org>; Tue, 07 Nov 2023 05:16:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699363014; x=1699967814;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qbIUOPQ6Pm2id7FZ6LhGGB7aM0TFWHh9F47YAWWsQHU=;
 b=RyOmUSrM/DwiRjpg79jjuujStlWqFPN89BvQsgrOKqsSV07qnHeGjfojftSOzWVbJa
 Bce1ukrARGtD2czhvrYUGY0xRru/F6cejLgWa7yTkOc2husgUEzmqDRW/JZTWc41jrRn
 SknPgubEwtP6GwNLqB6UMhUoSWPm9JiyItHqYI4JK4U/XUT3R/fwOePuj35sCq/goOPg
 EVUjeYSGjL5Al3MF+ppQM3jBXeRURhFvgJ43GGscyYLIF1WOr7sQLJ8zV+Prn1h6Egmo
 g+TpsMFnJuPHyCquVVFbx8Pyy1jF865Y+J0Gtxmm7hUjEIWDW1grV62dmfm+vr/Km6lx
 vrXA==
X-Gm-Message-State: AOJu0Yw9Gfwqsb4YGZNWluhnt5Tu59SH9EijT08CbZmk2DA8RwZll3TN
 L/J0xsoXE6YoBgUGodFiO59++eBcjCh3i5HipkIT4w==
X-Google-Smtp-Source: AGHT+IHUr3ON4zB2MF7WKtl+zOdjjsVuCdqRR5rWNBvwBW4n4kx9W/zLu9hJpBLVq+NavCgeDh0DtA==
X-Received: by 2002:a17:906:ef0e:b0:9b2:765b:273b with SMTP id
 f14-20020a170906ef0e00b009b2765b273bmr18113988ejs.70.1699363014419; 
 Tue, 07 Nov 2023 05:16:54 -0800 (PST)
Received: from localhost.localdomain (ip-89-177-240-140.bb.vodafone.cz.
 [89.177.240.140]) by smtp.gmail.com with ESMTPSA id
 n16-20020a170906379000b009c5c5c2c59csm1052002ejc.149.2023.11.07.05.16.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Nov 2023 05:16:54 -0800 (PST)
From: =?UTF-8?q?Jan=20=C4=8Cerm=C3=A1k?= <sairon@sairon.cz>
To: buildroot@buildroot.org
Date: Tue,  7 Nov 2023 14:16:26 +0100
Message-Id: <20231107131627.424088-1-sairon@sairon.cz>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sairon.cz; s=google; t=1699363014; x=1699967814; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=qbIUOPQ6Pm2id7FZ6LhGGB7aM0TFWHh9F47YAWWsQHU=;
 b=XQ/H4wxuK20xmv0NheS/wsjEtHJLL7byPJ9kjftg1fuNI768pO8+e1HkG5gnvW7yc3
 NIFCazzhcja7gzEwg75t3lt9DCrRtyYq7w9leB53IQNiA2zhbu9F4o0h4v410vmunVWZ
 4sgBGOxAX3IQPI+I/+ohHCNR6UFDBICXq/W95Filru73JhOUaQwsOEVwzVsdWDBiBcd2
 4dR0r6KBJhJu4Y57rRXznKTiNirdSxUflNHg41EEAdzRylQByEazr7K85i40PoAmL8PK
 4twllQMJMPnNofNgjksdKg2VcGik36Lj3dYD65zSCgLsTJlXC58R8uq6+E33vc0KJqXe
 Jvsg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=sairon.cz header.i=@sairon.cz
 header.a=rsa-sha256 header.s=google header.b=XQ/H4wxu
Subject: [Buildroot] [PATCH v2] package/linux-firmware: add RTL8851/RTL8852
 firmware
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

QWRkIGZpcm13YXJlIGZpbGVzIGZvciBSVEw4ODUxIGFuZCBSVEw4ODUyIGNhcmRzIHVzZWQgYnkg
dGhlIHJ0bGJ0IGRyaXZlci4KClNpZ25lZC1vZmYtYnk6IEphbiDEjGVybcOhayA8c2Fpcm9uQHNh
aXJvbi5jej4KLS0tCiBwYWNrYWdlL2xpbnV4LWZpcm13YXJlL2xpbnV4LWZpcm13YXJlLm1rIHwg
NyArKysrKystCiAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0p
CgpkaWZmIC0tZ2l0IGEvcGFja2FnZS9saW51eC1maXJtd2FyZS9saW51eC1maXJtd2FyZS5tayBi
L3BhY2thZ2UvbGludXgtZmlybXdhcmUvbGludXgtZmlybXdhcmUubWsKaW5kZXggYzJjZjBmZWMx
OS4uOTY5MDVkZDkwOSAxMDA2NDQKLS0tIGEvcGFja2FnZS9saW51eC1maXJtd2FyZS9saW51eC1m
aXJtd2FyZS5taworKysgYi9wYWNrYWdlL2xpbnV4LWZpcm13YXJlL2xpbnV4LWZpcm13YXJlLm1r
CkBAIC05MCw3ICs5MCwxMiBAQCBMSU5VWF9GSVJNV0FSRV9GSUxFUyArPSBcCiAJcnRsX2J0L3J0
bDg4MjFjX2NvbmZpZy5iaW4gcnRsX2J0L3J0bDg4MjFjX2Z3LmJpbiBcCiAJcnRsX2J0L3J0bDg4
MjJiX2NvbmZpZy5iaW4gcnRsX2J0L3J0bDg4MjJiX2Z3LmJpbiBcCiAJcnRsX2J0L3J0bDg4MjJj
c19jb25maWcuYmluIHJ0bF9idC9ydGw4ODIyY3NfZncuYmluIFwKLQlydGxfYnQvcnRsODgyMmN1
X2NvbmZpZy5iaW4gcnRsX2J0L3J0bDg4MjJjdV9mdy5iaW4KKwlydGxfYnQvcnRsODgyMmN1X2Nv
bmZpZy5iaW4gcnRsX2J0L3J0bDg4MjJjdV9mdy5iaW4gXAorCXJ0bF9idC9ydGw4ODUxYnVfZncu
YmluIHJ0bF9idC9ydGw4ODUxYnVfY29uZmlnLmJpbiBcCisJcnRsX2J0L3J0bDg4NTJhdV9mdy5i
aW4gcnRsX2J0L3J0bDg4NTJhdV9jb25maWcuYmluIFwKKwlydGxfYnQvcnRsODg1MmJ1X2Z3LmJp
biBydGxfYnQvcnRsODg1MmJ1X2NvbmZpZy5iaW4gXAorCXJ0bF9idC9ydGw4ODUyY3VfZncuYmlu
IHJ0bF9idC9ydGw4ODUyY3VfY29uZmlnLmJpbiBcCisJcnRsX2J0L3J0bDg4NTJjdV9md192Mi5i
aW4KIExJTlVYX0ZJUk1XQVJFX0FMTF9MSUNFTlNFX0ZJTEVTICs9IExJQ0VOQ0UucnRsd2lmaV9m
aXJtd2FyZS50eHQKIGVuZGlmCiAKLS0gCjIuMzQuMQoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RA
YnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5m
by9idWlsZHJvb3QK

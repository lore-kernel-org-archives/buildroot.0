Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E346C4332F
	for <buildroot@archiver.kernel.org>; Tue,  7 Nov 2023 11:09:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D1160418F0;
	Tue,  7 Nov 2023 11:09:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D1160418F0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zXg4EElm3og4; Tue,  7 Nov 2023 11:09:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2B8E8418B5;
	Tue,  7 Nov 2023 11:09:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2B8E8418B5
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D2B8B1BF5AA
 for <buildroot@lists.busybox.net>; Tue,  7 Nov 2023 11:09:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B7D65408C0
 for <buildroot@lists.busybox.net>; Tue,  7 Nov 2023 11:09:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B7D65408C0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Llpcb3Qiz44u for <buildroot@lists.busybox.net>;
 Tue,  7 Nov 2023 11:09:23 +0000 (UTC)
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9077A40158
 for <buildroot@buildroot.org>; Tue,  7 Nov 2023 11:09:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9077A40158
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-9e2838bcb5eso62909366b.0
 for <buildroot@buildroot.org>; Tue, 07 Nov 2023 03:09:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699355361; x=1699960161;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=eDsnqZ5pC4FX0EFUPo4FiGBJdgQXBgbFNjIcvQpxXEs=;
 b=hJlH5TLdKphRhF4AkjPvfuF6trl9vuonNXR4HP/EcsyK4O3SHZXWPB/bifljOjKoWS
 Q0AQNMaO76E/8Vtf3mTqgUg9wxRtkabGNJ4Ylv9MPe5D8V0V5KfekqGndwWPUirVpv2b
 BA8LV8hWHb3Q52hVxQcMwlUDeqK4C9DLOyQ84Cr6lL2M1QP3oLWuSx+z/5obe9gBrcz0
 Pft6G3PFkCWHUc+72TQRUfexBfu87F1GBL0x5VbLwPsLO4IvFqpEDUSybpPARD8905aH
 6HyCUChnBuMJNGGehgKp7ydrtkTi9NJ9DInJlgOwyoekhUsJ2oCJYdnN8xHvf4k6lYg2
 Yv3Q==
X-Gm-Message-State: AOJu0YzkZ/0roy4beYZZaejrtocVOitbcxyb673siEoH5lrLEFvGETOF
 MQ6wn8ny8XrfXfG7n/OMKLfaeG435I4ihTKB+DXfnA==
X-Google-Smtp-Source: AGHT+IHau/T5YKp1SCnTmPn1bs+9uPnxLZJtfi2O2Sb7ktAgdY2wcgCdz688oKMvdXRARKn1TsS7lg==
X-Received: by 2002:a17:907:3fa2:b0:9a6:426f:7dfd with SMTP id
 hr34-20020a1709073fa200b009a6426f7dfdmr15817398ejc.66.1699355361538; 
 Tue, 07 Nov 2023 03:09:21 -0800 (PST)
Received: from localhost.localdomain (ip-89-177-240-140.bb.vodafone.cz.
 [89.177.240.140]) by smtp.gmail.com with ESMTPSA id
 k10-20020a1709065fca00b009bd9ac83a9fsm912594ejv.152.2023.11.07.03.09.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Nov 2023 03:09:21 -0800 (PST)
From: =?UTF-8?q?Jan=20=C4=8Cerm=C3=A1k?= <sairon@sairon.cz>
To: buildroot@buildroot.org
Date: Tue,  7 Nov 2023 12:09:08 +0100
Message-Id: <20231107110909.401532-1-sairon@sairon.cz>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sairon.cz; s=google; t=1699355361; x=1699960161; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=eDsnqZ5pC4FX0EFUPo4FiGBJdgQXBgbFNjIcvQpxXEs=;
 b=SF95YVBgIldmeb7erq8rGsDCzHjLnmcCpwB9K7A2uG19pOqrU2aQlzle/6XQofCKfv
 Nrf1ac5YN2QhH/g5uAgCVkLg50G0X1/ZuIFYoSqIsxHTdt4wRr8Niycg4gSyWh05rkf9
 i54MmsNmuUdPXEAc3sgK4XbHapHSxZGh3YhywlclHQCL8aH702In5qo6UzNDPcVUMr7B
 B7q8o3sXGINcjTn5bD/5noKJGB/06tUCMMEKKLY8AmTj5stzOojFjnw5fwAb0VeeSbfA
 /spURGMhdMZRqM9oiIiyWHzp2dEz8QToIZDGOU4fjPKwbQTCyCgxmwk5ulsbaRp79ILy
 2lyA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=sairon.cz header.i=@sairon.cz
 header.a=rsa-sha256 header.s=google header.b=SF95YVBg
Subject: [Buildroot] [PATCH] package/linux-firmware: add RTL8851/RTL8852
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
NiArKysrKy0KIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkK
CmRpZmYgLS1naXQgYS9wYWNrYWdlL2xpbnV4LWZpcm13YXJlL2xpbnV4LWZpcm13YXJlLm1rIGIv
cGFja2FnZS9saW51eC1maXJtd2FyZS9saW51eC1maXJtd2FyZS5tawppbmRleCBjMmNmMGZlYzE5
Li42ZDdlMjk0NjEwIDEwMDY0NAotLS0gYS9wYWNrYWdlL2xpbnV4LWZpcm13YXJlL2xpbnV4LWZp
cm13YXJlLm1rCisrKyBiL3BhY2thZ2UvbGludXgtZmlybXdhcmUvbGludXgtZmlybXdhcmUubWsK
QEAgLTkwLDcgKzkwLDExIEBAIExJTlVYX0ZJUk1XQVJFX0ZJTEVTICs9IFwKIAlydGxfYnQvcnRs
ODgyMWNfY29uZmlnLmJpbiBydGxfYnQvcnRsODgyMWNfZncuYmluIFwKIAlydGxfYnQvcnRsODgy
MmJfY29uZmlnLmJpbiBydGxfYnQvcnRsODgyMmJfZncuYmluIFwKIAlydGxfYnQvcnRsODgyMmNz
X2NvbmZpZy5iaW4gcnRsX2J0L3J0bDg4MjJjc19mdy5iaW4gXAotCXJ0bF9idC9ydGw4ODIyY3Vf
Y29uZmlnLmJpbiBydGxfYnQvcnRsODgyMmN1X2Z3LmJpbgorCXJ0bF9idC9ydGw4ODIyY3VfY29u
ZmlnLmJpbiBydGxfYnQvcnRsODgyMmN1X2Z3LmJpbiBcCisJcnRsX2J0L3J0bDg4NTFidV9mdy5i
aW4gcnRsX2J0L3J0bDg4NTFidV9jb25maWcuYmluIFwKKwlydGxfYnQvcnRsODg1MmF1X2Z3LmJp
biBydGxfYnQvcnRsODg1MmF1X2NvbmZpZy5iaW4gXAorCXJ0bF9idC9ydGw4ODUyYnVfZncuYmlu
IHJ0bF9idC9ydGw4ODUyYnVfY29uZmlnLmJpbiBcCisJcnRsX2J0L3J0bDg4NTJjdV9mdy5iaW4g
cnRsX2J0L3J0bDg4NTJjdV9jb25maWcuYmluCiBMSU5VWF9GSVJNV0FSRV9BTExfTElDRU5TRV9G
SUxFUyArPSBMSUNFTkNFLnJ0bHdpZmlfZmlybXdhcmUudHh0CiBlbmRpZgogCi0tIAoyLjM0LjEK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9v
dCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWls
ZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==

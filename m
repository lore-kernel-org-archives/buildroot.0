Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C8E8C48292
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 20:16:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CADA140AE7;
	Mon,  5 Feb 2024 20:16:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CADA140AE7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id luqYo6w0HFD3; Mon,  5 Feb 2024 20:16:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D3FDF405B0;
	Mon,  5 Feb 2024 20:16:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D3FDF405B0
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E06351BF35A
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 20:16:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C4BE6405B0
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 20:16:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C4BE6405B0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PR6ROO1k38zZ for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 20:16:31 +0000 (UTC)
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BC5054012F
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 20:16:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BC5054012F
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-40fdc500db5so8951365e9.1
 for <buildroot@buildroot.org>; Mon, 05 Feb 2024 12:16:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707164188; x=1707768988;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=moHIcJKI8AApATjP8txu3oUSG4jmaQgzhH54pdLyiiI=;
 b=Uqyh35ajSfWl8wt5mVAjUCzJ/dv6gSlLT2rijxshGRbVqFkQXvIXUcrIHa5gIENwuT
 0z3N/dRKnip6d/E0sOXa7E+0+5lk/xSp75CiCr4gGce4GljBVJ6+stRD0ucCdzN8M8a8
 SNqaczJGb+XZ6Z1uPipObAnGPOrAQldf5LKzOqvSj/xjvC8rJksQC/qpdKPqjtG9cZ78
 EF88ySH24Or3vPRnpR6QjWwBpMp4jYPYWyDNEM0iG9gQncIr0KQ9LT/ZVEK1n1jKDwPB
 Yuiu3VZMf2CsYhSbLie8RX2zBQyrDB8JTuLqLjAx+TweI+O+lhf5hVgYNBMYEaZxZNtp
 iEsw==
X-Gm-Message-State: AOJu0YytksYEUKBlZBbnMz8sq568mT32VuNdae8G/QMe28RPlC0YiruE
 X0cUEGBVeBC10kZoLy6DwkS9siHGWH/oPSKkSAqtu25tcSD6n7yQVDEAzZKSm2Y=
X-Google-Smtp-Source: AGHT+IGKkQr67SCgp9K6i8N3kaPVhsueGZwOaPxckbhdIVFc42MH29VV7dulS/UdMxejA8Jb/zWFXQ==
X-Received: by 2002:a05:600c:154a:b0:40e:fbb3:f67c with SMTP id
 f10-20020a05600c154a00b0040efbb3f67cmr599775wmg.38.1707164188272; 
 Mon, 05 Feb 2024 12:16:28 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCW5Hc67v13ZxPUzfNerUwPTh8aYrw8QWaL7yf5wKpBe05aC5fuWUToW5QyG8UbBjIBsW8MAU/NxHoGsJFfVhqhiM3n6V6pCV3vMTA==
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 t9-20020a05600c198900b0040fbad272f6sm9656169wmq.46.2024.02.05.12.16.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Feb 2024 12:16:27 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  5 Feb 2024 21:16:25 +0100
Message-ID: <20240205201625.5203-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707164188; x=1707768988; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=moHIcJKI8AApATjP8txu3oUSG4jmaQgzhH54pdLyiiI=;
 b=NR89lNc1eabpq7ShOqF7u2DA8IOK8zOFseQRzRYVMGpON/M6GkxFWyTLAzaIhm13DJ
 jOgipJfl0RCM+gYNCTfur0SGPM5rR0Oc9BYCneBHMrqnR9YGri/hJ3ASRcYe7p+txPoS
 kfwKStUC5G/ZYUhOfc+wGNElLOh764SxiA1UwYbVTwdAJkWS86vlPpIqEakvsh/kSK3O
 EpOtjw8oqYC320pNLBdb7uuJZOBWXqpQYdaxbVciTDSuUIfNiyYwNQcx+c038LakpjnK
 Ir/JSQ+u4+Tnybie4c9xcuC+eqKpuune+q9uWeOsI92OKWoEoqnHbVLaa0OsSTt42pG/
 2kCw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=NR89lNc1
Subject: [Buildroot] [PATCH 1/1] package/libjwt: disable examples
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Examples are enabled by default since the addition of the package in
commit 7251775773011e7da38e3a33c6817eceab6a9dfa

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libjwt/libjwt.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libjwt/libjwt.mk b/package/libjwt/libjwt.mk
index 7e2ea03b09..1643aa7b7a 100644
--- a/package/libjwt/libjwt.mk
+++ b/package/libjwt/libjwt.mk
@@ -11,6 +11,7 @@ LIBJWT_AUTORECONF = YES
 LIBJWT_INSTALL_STAGING = YES
 LIBJWT_LICENSE = MPL-2.0
 LIBJWT_LICENSE_FILES = LICENSE
+LIBJWT_CONF_OPTS = --without-examples
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 LIBJWT_CONF_OPTS += --with-openssl
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

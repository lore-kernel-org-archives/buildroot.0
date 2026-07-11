Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E25FC43458
	for <buildroot@archiver.kernel.org>; Sat, 11 Jul 2026 11:20:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 436A860D90;
	Sat, 11 Jul 2026 11:20:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ox1aZ559xYu7; Sat, 11 Jul 2026 11:20:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 32AA460D89
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783768849;
	bh=fdm0fYOFMyAAvmMcXk4GPInkN6ZNVUn0Xz890thuwJI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=AKC79oDA0WOnJZtT0Ymwe3nMmFOIgvSyoIlEG+UV/iWrpKIk4RLsBNcBdWFdnsL8s
	 LVy7QTIxM7XtvJc0MYQLwQUaTRXmjeJdBnKAqqHxid89p4/nc2TbqQbnkzqo2fC9oP
	 ViI7lAj7bA7by53Fa5ad7XFMZXj1luSPRgudfcgjgpJmPuss8dZQLsuYGR+OS1riSE
	 0YxuURdlVdmyMr8FXqe3tG8JRkw5Egzf7PX+Y0xPl5tsskbDKj6sZB6Axr7etw+hje
	 COcH8zT/A8odIPcov4pJAtEaWx5LShEvjhUh98DkT1wr5wP2EWGaHEGQ6hWmk1UvYM
	 1sGhFVVpfm5ZQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 32AA460D89;
	Sat, 11 Jul 2026 11:20:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1D05B2EE
 for <buildroot@buildroot.org>; Sat, 11 Jul 2026 11:20:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EED6E404ED
 for <buildroot@buildroot.org>; Sat, 11 Jul 2026 11:20:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7kOOGLFE29Go for <buildroot@buildroot.org>;
 Sat, 11 Jul 2026 11:20:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52c; helo=mail-ed1-x52c.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1ABB0404D9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1ABB0404D9
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1ABB0404D9
 for <buildroot@buildroot.org>; Sat, 11 Jul 2026 11:20:46 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-698acd36d67so3242994a12.0
 for <buildroot@buildroot.org>; Sat, 11 Jul 2026 04:20:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783768845; x=1784373645;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=QpcbQgJYx7V/nHLK4l+TzXQyvXH6Fitdp5+M6TVEQnE=;
 b=fqkB9yqXgReMt7ElZfOxEqqntKRGA+KUFIkNHVTo1SKuYsGROH0MHEmw5Kv8kQp1Pd
 WK1bFh6lcX+TA9TGAfhL+HhfeLwa/W1o0He4mhue6jNkDL2gchtUCtlUzd0j/nV0RIhP
 tLJhClj3FsBd1ditHwVIX4q/SirqbGMtl+EhD0nkudwfbO9bYti02TYdQ43MfSfsGF1s
 z/+SCvy6ck0uo7RS4KGUzvYOivkaSi0YfyZ1lA8a48NJ/JmMwES76ZfTlWNGvn0pG27+
 qkJDFoETZ5sUKA0gUHPzqxm3p5Bw1VWvgkY7ThuBC9y9mUmaN2GzpKcn6GiBCzeL2IiP
 KNng==
X-Gm-Message-State: AOJu0Yzj9GV2sDZcLc+eKy42w0RwDxS6u5AR8Dmz4YtkY/fpuReulupl
 H9HR5dSPyyTJSRBj/8Z+WtuIoFLORJeFGwualfsSI21PInoSsZ5Ms4/sjXDU5A==
X-Gm-Gg: AfdE7clfAtwvn7gsnYEv0s0caQQ8Vq7PwQ+37XUcsiT6pabKOZcoUZNMe+SqC2F1kMl
 VZjPpbtXcgQM9ofOFFGSpCjtQFYjYVFYbssUNQf2Vq2rm1ktfg//gOUlw7It6qJmYU+uvrePhSY
 YC/y/NRaEKOQWgdgq+XTu+5EcFY0HU4U/BLmfKmTYjqg9utOAN3PhU1ad0bDSqh513iAsPVUsPT
 vRuW7nelPZ/ScNAM8SwHdn1NqrVKaVgnQxWR7a62+3lGUDdmRjmMESlAKlQEujqzEkXwZwMbcd7
 y9rQpA12t2Mpg2CYH7BLzRuOxkw+3b9RISI4SnYtddv0eoQrpFwokpuCy4yxKiQRB8Qkwuz0vFL
 X6DlQML3Ge1iwvaxp1OrGJmD3wEvQD9mqkhXDfvT4KjQBPz2gEMdJb/aQSLgdDAmhPJQeUMP0/Z
 imd+eaJQIiIWoNTSJXbpTTojquYTfeS34bcfmoYEpoa93PU7MVoVc4x4TwdII45lzvUh+t
X-Received: by 2002:a05:6402:e8c:b0:69a:9355:d1bf with SMTP id
 4fb4d7f45d1cf-69c5f24fe54mr1010621a12.41.1783768844765; 
 Sat, 11 Jul 2026 04:20:44 -0700 (PDT)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-69a9c4a4027sm7967917a12.29.2026.07.11.04.20.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Jul 2026 04:20:43 -0700 (PDT)
To: buildroot@buildroot.org
Date: Sat, 11 Jul 2026 13:20:39 +0200
Message-Id: <20260711112039.2805693-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20251104; t=1783768845; x=1784373645; darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=QpcbQgJYx7V/nHLK4l+TzXQyvXH6Fitdp5+M6TVEQnE=;
 b=WYKb70hcClDIWzzdPmFMSKiJyf+uX8DpoNjBY9QQ9PDpIJcL+IYcruUrKOhFCs9N2P
 U/+FftyqwFi7qTcztepwY6pC1ZKNiXO8cyv4rHyyI0NI2kDJrsFAt2I5kTANhLRW0iYf
 KwS1R3yqNVJfzk7V+StOeh+kJoAuTmtrjg257WompJzNrfYEkMh0xkwSRUiGluhSfVo+
 h3rh7HTWAV0pBsLst7fq8f78VEk5MfIqxSsAvu55cxtzHUH4BJ3IclOw0jSTPWwnvm2A
 Ue7fEi3k1yVfl81ycddNOQ5KN38U6bDLiWXTnLhEa5GHTkoU0oK5SajON2va3wXkRq0N
 O+Dw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=googlemail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20251104 header.b=WYKb70hc
Subject: [Buildroot] [PATCH] package/libmicrohttpd: bump to version 1.0.6
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
From: yegorslists--- via buildroot <buildroot@buildroot.org>
Reply-To: yegorslists@googlemail.com
Cc: Bernd Kuhls <bernd@kuhls.net>, Will Newton <will.newton@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Yegor Yefremov <yegorslists@googlemail.com>

Changelog since 1.0.5:

Fix various minor issues, like theoretical
integer overflows for extreme inputs or NULL
dereferences if the application passes NULL
where it should not.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/libmicrohttpd/libmicrohttpd.hash | 2 +-
 package/libmicrohttpd/libmicrohttpd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libmicrohttpd/libmicrohttpd.hash b/package/libmicrohttpd/libmicrohttpd.hash
index 4dfe62deeb..90b598f9a5 100644
--- a/package/libmicrohttpd/libmicrohttpd.hash
+++ b/package/libmicrohttpd/libmicrohttpd.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  b46d00f58efa6f497b97d2e782c4ee66301d412ddd855dd3068518b3a2cd3ea2  libmicrohttpd-1.0.5.tar.gz
+sha256  bb5cfcadfc52dbd5eb512d6e2995e0361351c33e97a87aba426d3a4a7ba6cf70  libmicrohttpd-1.0.6.tar.gz
 sha256  7399547209438c93f9b90297954698773d4846cea44cde5ca982c84c45952a3b  COPYING
diff --git a/package/libmicrohttpd/libmicrohttpd.mk b/package/libmicrohttpd/libmicrohttpd.mk
index a3b24d363c..6e7c79ee88 100644
--- a/package/libmicrohttpd/libmicrohttpd.mk
+++ b/package/libmicrohttpd/libmicrohttpd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBMICROHTTPD_VERSION = 1.0.5
+LIBMICROHTTPD_VERSION = 1.0.6
 LIBMICROHTTPD_SITE = $(BR2_GNU_MIRROR)/libmicrohttpd
 LIBMICROHTTPD_LICENSE_FILES = COPYING
 LIBMICROHTTPD_CPE_ID_VENDOR = gnu
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E9A5C433F5
	for <buildroot@archiver.kernel.org>; Sun,  3 Apr 2022 19:12:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CD8B8416D6;
	Sun,  3 Apr 2022 19:12:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NFEGHVdSYpfU; Sun,  3 Apr 2022 19:12:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 78D75416DC;
	Sun,  3 Apr 2022 19:12:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 443631BF36B
 for <buildroot@lists.busybox.net>; Sun,  3 Apr 2022 19:12:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2EFA860E40
 for <buildroot@lists.busybox.net>; Sun,  3 Apr 2022 19:12:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MRAEEN1nsKxF for <buildroot@lists.busybox.net>;
 Sun,  3 Apr 2022 19:12:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3274B60E22
 for <buildroot@buildroot.org>; Sun,  3 Apr 2022 19:12:48 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 n63-20020a1c2742000000b0038d0c31db6eso4448287wmn.1
 for <buildroot@buildroot.org>; Sun, 03 Apr 2022 12:12:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AUgnA2oHDHE5jkn0NmzE6PrSTLbhs7ww4pnPRYo/UjI=;
 b=Q4tkp5lMXkf0Q9Gv4oxTEN/cD9/PE/muBZUYbqAguFsOyb9dHzJcYmtInj+G3Kfum6
 5tNoyI0w0XvSrVy7q04DuAoqTtfTFazR4Oq14icsGa9Nk0/HX10LJCyFAIThqWDa85MO
 VVskpWAVuYzz4t66PrZwyvNhz0Mpc3V9XmVBgxS4jhduYwNyF83G8fZseQIqp9+2Rsrn
 u/AZf0JDCg6V6XGiGVRO2l1RpY8xhZfOJ+48hkOWVAKMzReTiZQtQmVVku1IJegSFVBx
 g0sm9lFoR5CWbNe84hXOuYwWAGQS7Co9yf17HWDiWSlerkmM4QVsImhRwBc1HPw+0N8C
 +gnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AUgnA2oHDHE5jkn0NmzE6PrSTLbhs7ww4pnPRYo/UjI=;
 b=ldibB/nkqHiV2qxji4EJcSmzQu8kHZlEvaHeV7la/M942MgQmuydKq9B3w8iv8l4gB
 BDbglI4R7jWAEzuUO3ykMBrx6xQKO7es1Uyp6BA5BF4S5+BXAs7d3BcaVx47u4coOrfW
 gaa0DigMayZq7uDiKLwI7UUhqgMoJFjIKW78fpEaNo/AsbToczirzizkORYN9HTItA3b
 zedRFNZnekkEfawTUw3Tiyz5Pw5L9ZEBNTQybAmbN+//vaVhHjTEafpGWyHluul8MGHj
 uT+nC9zy1HEXViOGBD/Q4PNMKtxHHflnriruCfNkoP/OMLYPp/Wgn+pQlrHX1iNkTu96
 wtUg==
X-Gm-Message-State: AOAM530mL5uwUqb2oirQmX5AZPgot/Q5yLc1FOYYaR9fwu/jF6sjEFM/
 75EDk7WLXyLLNyVLzNJCM8HBXtlz+RM=
X-Google-Smtp-Source: ABdhPJyNu8pj6i9WgWuNn3e7LS4UDuiKW+KFx3AB4sBzBgCmLx9ycl2L3N/9BAgOmYM+92lNOgLuzw==
X-Received: by 2002:a05:600c:4401:b0:38c:8df8:9797 with SMTP id
 u1-20020a05600c440100b0038c8df89797mr16416655wmn.13.1649013166227; 
 Sun, 03 Apr 2022 12:12:46 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 o17-20020a05600c4fd100b0038cd5074c83sm15831448wmq.34.2022.04.03.12.12.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Apr 2022 12:12:45 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  3 Apr 2022 21:11:03 +0200
Message-Id: <20220403191103.1019544-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/zlib-ng: fix build on powerpc
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

Disable POWER8 optimisations to fix the following build failure with
powerpc and libglib2 raised since bump to version 1.9.9-b1 in commit
1f7b12a0b4572d7e763c431a63c22cfb912b8b14 and
https://github.com/zlib-ng/zlib-ng/commit/b81f4ee96dcbdf1db34b00727b6f1829a2ba1edb:

/home/autobuild/autobuild/instance-9/output-1/host/lib/gcc/powerpc-buildroot-linux-musl/11.2.0/../../../../powerpc-buildroot-linux-musl/bin/ld: /home/autobuild/autobuild/instance-9/output-1/host/powerpc-buildroot-linux-musl/sysroot/usr/lib/libz.a(adler32_power8.c.o): in function `adler32_power8':
/home/autobuild/autobuild/instance-9/output-1/build/zlib-ng-2.0.6/arch/power/adler32_power8.c:106: undefined reference to `vec_sumsu'

Fixes:
 - http://autobuild.buildroot.org/results/f864a0e2307e25342b45c90a5b4fb57a0f5c1c93

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/zlib-ng/zlib-ng.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/zlib-ng/zlib-ng.mk b/package/zlib-ng/zlib-ng.mk
index fb497b8c11..09edfe1faf 100644
--- a/package/zlib-ng/zlib-ng.mk
+++ b/package/zlib-ng/zlib-ng.mk
@@ -15,6 +15,7 @@ ZLIB_NG_PROVIDES = zlib
 ZLIB_NG_CONF_OPTS += \
 	-DWITH_GZFILEOP=1 \
 	-DWITH_OPTIM=1 \
+	-DWITH_POWER8=OFF \
 	-DZLIB_COMPAT=1 \
 	-DZLIB_ENABLE_TESTS=OFF
 
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

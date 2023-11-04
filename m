Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 844A0C4332F
	for <buildroot@archiver.kernel.org>; Sat,  4 Nov 2023 16:23:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 219EC41E8D;
	Sat,  4 Nov 2023 16:23:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 219EC41E8D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nIlEBrob4gZ8; Sat,  4 Nov 2023 16:23:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0C0F941EE1;
	Sat,  4 Nov 2023 16:23:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0C0F941EE1
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C13E01BF5AE
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 16:23:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A78D6822A6
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 16:23:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A78D6822A6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XB5B25oozlXM for <buildroot@lists.busybox.net>;
 Sat,  4 Nov 2023 16:23:08 +0000 (UTC)
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 60D698232C
 for <buildroot@buildroot.org>; Sat,  4 Nov 2023 16:23:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 60D698232C
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-32d9effe314so1768910f8f.3
 for <buildroot@buildroot.org>; Sat, 04 Nov 2023 09:23:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699114985; x=1699719785;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=M5lh6Bl6RnnGZH/fqAjbm+5FTqurAUoJbYNtYVEHRD4=;
 b=hvbz0yWxozCtrBcQAZYQRjVvEfwIjCIr0gjCW4Oqem6VRpizP7bTKSijdn4wQLY83Y
 D+ziDJggFE/uS9WUjxF8ny5hKJoUXkiguAwH4wBmWPeG/2b9u2Z3qb7nHBkZUEsbw89j
 Y687cu9psx3DwzFxeK1to/xePmOLI6LcBqFPnuZYW9g+JSb+nqJV5EhDk35Iuooh13Dd
 fMa7SY8b3266c5LCVNXAMGj6kGHushi8hYPzFNAmcFshTYD7Vfv5M+iYiPWvaESza1cI
 XMwBvw3sba/6RpI08NnBFeDIX9CCiMLUcfa/TTo5U2BmnTFhpdcpoP70rx6By85+k38J
 i7mg==
X-Gm-Message-State: AOJu0Ywm1rZbkuw0wgGWVnIB+BiKIFw6/lgAXXcTVuRKuty1Q4TIy0ff
 cAT8O/hHgRYj1jm1CZumcP5Hb+lMjTQ=
X-Google-Smtp-Source: AGHT+IFmM8Br9i+0s1gzg74BLU6ewjaLTLwZX7FrrGzeK7UhW7gkCKqjRRFx3Zd+I2c3Q4gZJPEcOA==
X-Received: by 2002:a05:6000:1e96:b0:32f:a423:ef38 with SMTP id
 dd22-20020a0560001e9600b0032fa423ef38mr7014073wrb.38.1699114985359; 
 Sat, 04 Nov 2023 09:23:05 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 t13-20020a5d460d000000b0032fb46812c2sm4758351wrq.12.2023.11.04.09.23.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Nov 2023 09:23:04 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  4 Nov 2023 17:23:03 +0100
Message-ID: <20231104162303.537730-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699114985; x=1699719785; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=M5lh6Bl6RnnGZH/fqAjbm+5FTqurAUoJbYNtYVEHRD4=;
 b=La4uyd+fjYi4DR0n+/1/Gpu5ZJkb/MilzzA2U9G16Dx89T6JFX0Cd5Yr+igWPL0dqG
 HjszhdzfJhef36Lk5J2lLoLFyCD28rvsOJGPcDJjWVcJTSnykVzfBoqox+oO+6P0l52j
 OA2etg9r2ICpy62nbGT6WmPN8ZiEw/ntdcMAVHsasqBntS1J3KXX3PJb2bHgcYl2hXuB
 2eJ9kg+YQGWnyGRcJ3h/tos3Ql9VO4N5UK8lqh/17McPYVNpFux6IMqqql/NsfxqjtBE
 E5YIgOoWMl6V35Zw3tPcsrey87HwSxXxD7TH9V2QHi0Ik+txjRHvmD2h9eq3Knq58FX5
 ai9A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=La4uyd+f
Subject: [Buildroot] [PATCH 1/1] package/libgdiplus: add upstream link to
 patch
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
Cc: Sergio Prado <sergio.prado@e-labworks.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .checkpackageignore                                              | 1 -
 ...01-Build-unit-tests-only-when-enable-unit-tests-is-pass.patch | 1 +
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 1fda294145..1a78addd0e 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -662,7 +662,6 @@ package/libftdi1/0003-CMakeLists.txt-fix-static-build-with-libusb-and-lato.patch
 package/libfuse/0001-fix-aarch64-build.patch Upstream
 package/libfuse/0002-util-ulockmgr_server-c-conditionally-define-closefrom-fix-glibc-2-34.patch Upstream
 package/libgcrypt/0001-configure.ac-add-an-option-to-disable-tests.patch Upstream
-package/libgdiplus/0001-Build-unit-tests-only-when-enable-unit-tests-is-pass.patch Upstream
 package/libglfw/0001-Wayland-Remove-extra-cmake-modules-dependency.patch Upstream
 package/libglfw/0002-src-CMakeLists.txt-allow-override-of-wayland-pkgdata.patch Upstream
 package/libgpiod/0001-build-add-a-configure-switch-for-building-examples.patch Upstream
diff --git a/package/libgdiplus/0001-Build-unit-tests-only-when-enable-unit-tests-is-pass.patch b/package/libgdiplus/0001-Build-unit-tests-only-when-enable-unit-tests-is-pass.patch
index 450286462e..33746872ac 100644
--- a/package/libgdiplus/0001-Build-unit-tests-only-when-enable-unit-tests-is-pass.patch
+++ b/package/libgdiplus/0001-Build-unit-tests-only-when-enable-unit-tests-is-pass.patch
@@ -10,6 +10,7 @@ So let's disable the build of unit tests by default and introduce
 --enable-unit-tests configure option to enable it.
 
 Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
+Upstream: https://github.com/mono/libgdiplus/pull/701
 ---
  Makefile.am  | 8 ++++++--
  configure.ac | 4 ++++
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

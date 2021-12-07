Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47030C433F5
	for <buildroot@archiver.kernel.org>; Tue,  7 Dec 2021 21:54:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EFDE041D5C;
	Tue,  7 Dec 2021 21:54:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LBt5uBWhBSzW; Tue,  7 Dec 2021 21:54:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 72F1B405BF;
	Tue,  7 Dec 2021 21:54:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 17E6A1BF470
 for <buildroot@lists.busybox.net>; Tue,  7 Dec 2021 21:54:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 07D23405BF
 for <buildroot@lists.busybox.net>; Tue,  7 Dec 2021 21:54:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id REPggDw-Tw1I for <buildroot@lists.busybox.net>;
 Tue,  7 Dec 2021 21:54:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 34CB340242
 for <buildroot@buildroot.org>; Tue,  7 Dec 2021 21:54:23 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 d72-20020a1c1d4b000000b00331140f3dc8so507236wmd.1
 for <buildroot@buildroot.org>; Tue, 07 Dec 2021 13:54:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3cQO8ef7GKqFnfEcZR/fzYRzDGd1MYOjLGJEL4we1ao=;
 b=BYGO5UKKFH6hk0GFXozQwQK6UlRRIAHb8g46uba493IKs1t7QsErr3a9iLEadsK3W+
 VAEYEGws2yCQQeMBJdY9B605/CzDeVfJ4rAMZwA88UvVilAsqnnsK8MhS4242MWnZX8K
 yKCh95QDknOiw2Hf3yRyZH0gEtFMhMXldi/pybxxyjiTZfrO/mb1av1VFfpgWzdLToxo
 2WnkR4O4zmXYsL+G1ckQu9EsXOgY4P0B3Og/vdsMrFnfRTm142pTbSNGXix0eFDpS0pk
 nKPnS1kGU1aoFKgTK03B27orsed3fHYKsSnemwsAbk28XCVCMzcohPb5pwam8C/U72Z2
 /nZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3cQO8ef7GKqFnfEcZR/fzYRzDGd1MYOjLGJEL4we1ao=;
 b=UHnyugom4OtzfAk91UrCDypexKhGtZ1l+F3eIs/SdCymgjhJGknrMW51scyR9KTClM
 xxfSXThddSF5mc4AlyVdVCUUSHynoSlAJwXS4Jf9BxdFqO9KSTXUF0J31uyPnhG922TD
 1CkQ8ADQl1fp2xlfIlBEc1snITKLOqms/JF7aTUuJif2e2Ke4AoCZnrhP8fH2TczoKxq
 tjUscECfZcEz0z7fNoMg3S6fYEer7MSmCMtpANxy2HsNFNnwxPWKV1dFLo4eAJkt2aBj
 3cRLNF4fzpQFtO8tvM4jgbF9G0fDQbCQDtyzk8qvYj5zlm5bvKYjPAXxJ8US+HgIqy8q
 Ej+Q==
X-Gm-Message-State: AOAM531ltGXkYPiLhMX1IpI5YIY9Zbs6K388azSLPImPNVtMzlJfPYhY
 fw9famZdE1WQ+kjuo40YpBSCVIaQ1g+Mdw==
X-Google-Smtp-Source: ABdhPJyQ00CO8Ytl9ZEOtNFrStrRL6RFF/nhLwMdF92rYYniLm1SHOM7P4h3peGe+CxXaFEJbF6MnA==
X-Received: by 2002:a05:600c:6022:: with SMTP id
 az34mr10616313wmb.22.1638914061244; 
 Tue, 07 Dec 2021 13:54:21 -0800 (PST)
Received: from kali.home (lfbn-ren-1-370-97.w2-10.abo.wanadoo.fr. [2.10.20.97])
 by smtp.gmail.com with ESMTPSA id z6sm1029113wmp.9.2021.12.07.13.54.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Dec 2021 13:54:20 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  7 Dec 2021 22:54:18 +0100
Message-Id: <20211207215419.3319061-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] package/stella: libpng is optional,
 not mandatory
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

libpng is optional, not mandatory since version 6.1 and
https://github.com/stella-emu/stella/commit/eb13d515fb6385df6c653c5d295d97979b140031

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/stella/Config.in | 1 -
 package/stella/stella.mk | 9 ++++++++-
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/package/stella/Config.in b/package/stella/Config.in
index 7031f8d31e..22507edd60 100644
--- a/package/stella/Config.in
+++ b/package/stella/Config.in
@@ -5,7 +5,6 @@ config BR2_PACKAGE_STELLA
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_6 # C++14
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # exception_ptr
 	select BR2_PACKAGE_SDL2
-	select BR2_PACKAGE_LIBPNG
 	select BR2_PACKAGE_ZLIB
 	help
 	  Stella is a multi-platform Atari 2600 VCS emulator.
diff --git a/package/stella/stella.mk b/package/stella/stella.mk
index 2dcfbeaccd..e7b0082e7e 100644
--- a/package/stella/stella.mk
+++ b/package/stella/stella.mk
@@ -10,13 +10,20 @@ STELLA_SITE = https://github.com/stella-emu/stella/releases/download/$(STELLA_VE
 STELLA_LICENSE = GPL-2.0+
 STELLA_LICENSE_FILES = Copyright.txt License.txt
 
-STELLA_DEPENDENCIES = sdl2 libpng zlib
+STELLA_DEPENDENCIES = sdl2 zlib
 
 STELLA_CONF_OPTS = \
 	--host=$(GNU_TARGET_NAME) \
 	--prefix=/usr \
 	--with-sdl-prefix=$(STAGING_DIR)/usr
 
+ifeq ($(BR2_PACKAGE_LIBPNG),y)
+STELLA_CONF_OPTS += --enable-png
+STELLA_DEPENDENCIES += libpng
+else
+STELLA_CONF_OPTS += --disable-png
+endif
+
 # The configure script is not autoconf based, so we use the
 # generic-package infrastructure
 define STELLA_CONFIGURE_CMDS
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

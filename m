Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72C6BC433F5
	for <buildroot@archiver.kernel.org>; Fri, 17 Dec 2021 19:15:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 38F2E84D53;
	Fri, 17 Dec 2021 19:15:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FZhXPKxH174e; Fri, 17 Dec 2021 19:15:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8556484D20;
	Fri, 17 Dec 2021 19:15:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C20201BF35E
 for <buildroot@lists.busybox.net>; Fri, 17 Dec 2021 19:15:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B1C8641D30
 for <buildroot@lists.busybox.net>; Fri, 17 Dec 2021 19:15:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id y3hXLxF2udpA for <buildroot@lists.busybox.net>;
 Fri, 17 Dec 2021 19:15:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CB87B41783
 for <buildroot@buildroot.org>; Fri, 17 Dec 2021 19:15:10 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 z4-20020a1c7e04000000b0032fb900951eso4719257wmc.4
 for <buildroot@buildroot.org>; Fri, 17 Dec 2021 11:15:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YUbNS1J2ZEGptwasibhkXqo1G9ufOXXqmCrOxwVoJ+E=;
 b=QYbeQs+K6n5lFzADNtQABdbAULTRXuq9UOAIF/pVFoIpI1WIbNKFpH+P+tbMoTLbGa
 DFGYaXY2/0EoAeWJZlDQzyYUGTAfPedxwus+n44FIy0eMeN5pJaKfD8Y8qA1+FFg5fSU
 KeZVyz96/QlBdGGuTjytZj+8maJOYOAVOUisrsW171YYb6cVc0dTtAWY21Ot1Z8dSX6o
 lD7WajT37KkHj7KGuMZTyXCFzD4Tb920D1c+ehULJE/r5dsA2biW9dQOjSKfIlphCuoO
 IGgiSE04n4AQ6jT1xbrIIlllUQUehMG6xYxT6r1Wd8rK20ZjpRQQeWNbe2Kpjn09UJI+
 b1QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YUbNS1J2ZEGptwasibhkXqo1G9ufOXXqmCrOxwVoJ+E=;
 b=iyBW/JWjp7WXL1K7/V+LOXXGYMlGK31DjCywo0ZBbI+/7ujKRECD0TT3ZfUMq98YmS
 zuTB1X7cLTxHCLUbVS8Qoo5dtcpcwqySIgmU1OOQYLPGslNgCqYIRarh/e03I5KV40MA
 HGnPU/6jefEDtsFMHS+VRbbYwQkKsp6Ov/Uu9zV01bBXKvtO1dqAyjRrpcvnfZGbihBP
 BeQWxodWb6NfObHqJYB2m9jhnt4PvSnJ8PYv2djDI1h7rMEqbGM4yGM2SjfbmCTcNoyA
 uNFrMAwAWsEcEbKVelxwNDeu/vCUL+Tyew1NFI7OUQJCdf6wfcbDDDuSpLZPXnsuC49a
 lR0A==
X-Gm-Message-State: AOAM530TBIvfCDUHjTVx+4E2EoJAMfunG+lihpuggZI5yz9aHfJzH5/c
 f/fedHwxQdmQmr1+gL/ZLrf14sjh7zxBUA==
X-Google-Smtp-Source: ABdhPJzKrTDmWaY/lemHdipr7qKErQYH7gB2l5Y42iFfvnV6hk5NTdF5Eb997prQS1JsGpCVToG1Fg==
X-Received: by 2002:a1c:f416:: with SMTP id z22mr3895150wma.121.1639768508887; 
 Fri, 17 Dec 2021 11:15:08 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2129-201.w92-167.abo.wanadoo.fr.
 [92.167.208.201])
 by smtp.gmail.com with ESMTPSA id p22sm7639833wms.22.2021.12.17.11.15.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Dec 2021 11:15:08 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 17 Dec 2021 20:14:42 +0100
Message-Id: <20211217191442.30637-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/guile: drop first patch
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

Drop first patch which is already included in guile since version 2.0.1:
https://git.savannah.gnu.org/cgit/guile.git/commit/?id=ffd3e55cfd12a3559621e3130d613d319243512d

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...ch => 0001-calculate-csqrt_manually.patch} |  0
 package/guile/0001-fix_arm_endianness.patch   | 25 -------------------
 ...efile.am-fix-build-without-makeinfo.patch} |  0
 ...tem-base-target.scm-support-riscv32.patch} |  0
 4 files changed, 25 deletions(-)
 rename package/guile/{0002-calculate-csqrt_manually.patch => 0001-calculate-csqrt_manually.patch} (100%)
 delete mode 100644 package/guile/0001-fix_arm_endianness.patch
 rename package/guile/{0003-Makefile.am-fix-build-without-makeinfo.patch => 0002-Makefile.am-fix-build-without-makeinfo.patch} (100%)
 rename package/guile/{0004-module-system-base-target.scm-support-riscv32.patch => 0003-module-system-base-target.scm-support-riscv32.patch} (100%)

diff --git a/package/guile/0002-calculate-csqrt_manually.patch b/package/guile/0001-calculate-csqrt_manually.patch
similarity index 100%
rename from package/guile/0002-calculate-csqrt_manually.patch
rename to package/guile/0001-calculate-csqrt_manually.patch
diff --git a/package/guile/0001-fix_arm_endianness.patch b/package/guile/0001-fix_arm_endianness.patch
deleted file mode 100644
index 67c0b606ee..0000000000
--- a/package/guile/0001-fix_arm_endianness.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-Fix support for ARM endianness, otherwise it gives the error
-"unknown CPU endianness"
-
-Signed-off-by: Pedro Aguilar <paguilar@paguilar.org>
-
-diff -Nau guile-2.0.11.orig/module/system/base/target.scm guile-2.0.11/module/system/base/target.scm
---- guile-2.0.11.orig/module/system/base/target.scm	2013-02-28 09:42:45.000000000 +0100
-+++ guile-2.0.11/module/system/base/target.scm	2014-11-03 23:05:01.789338997 +0100
-@@ -70,7 +70,15 @@
-             ((member cpu '("sparc" "sparc64" "powerpc" "powerpc64" "spu"
-                            "mips" "mips64"))
-              (endianness big))
--            ((string-match "^arm.*el" cpu)
-+            ((string-match "^arm.*el" cpu)
-+             (endianness little))
-+            ((string-match "^arm.*eb" cpu)
-+             (endianness big))
-+            ((string-prefix? "arm" cpu)          ;ARMs are LE by default
-+             (endianness little))
-+            ((string-match "^aarch64.*be" cpu)
-+             (endianness big))
-+            ((string=? "aarch64" cpu)
-              (endianness little))
-             (else
-              (error "unknown CPU endianness" cpu)))))
diff --git a/package/guile/0003-Makefile.am-fix-build-without-makeinfo.patch b/package/guile/0002-Makefile.am-fix-build-without-makeinfo.patch
similarity index 100%
rename from package/guile/0003-Makefile.am-fix-build-without-makeinfo.patch
rename to package/guile/0002-Makefile.am-fix-build-without-makeinfo.patch
diff --git a/package/guile/0004-module-system-base-target.scm-support-riscv32.patch b/package/guile/0003-module-system-base-target.scm-support-riscv32.patch
similarity index 100%
rename from package/guile/0004-module-system-base-target.scm-support-riscv32.patch
rename to package/guile/0003-module-system-base-target.scm-support-riscv32.patch
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

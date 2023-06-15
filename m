Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9624EB64DB
	for <buildroot@archiver.kernel.org>; Thu, 15 Jun 2023 13:44:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 69CD5409E7;
	Thu, 15 Jun 2023 13:44:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 69CD5409E7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XnJvdLrXIBpP; Thu, 15 Jun 2023 13:44:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6961A4191F;
	Thu, 15 Jun 2023 13:44:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6961A4191F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 261611BF30B
 for <buildroot@lists.busybox.net>; Thu, 15 Jun 2023 13:43:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0DA66814AB
 for <buildroot@lists.busybox.net>; Thu, 15 Jun 2023 13:43:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0DA66814AB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FT0LrkbuMcVS for <buildroot@lists.busybox.net>;
 Thu, 15 Jun 2023 13:43:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D80E18148E
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D80E18148E
 for <buildroot@buildroot.org>; Thu, 15 Jun 2023 13:43:49 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-307d20548adso5844663f8f.0
 for <buildroot@buildroot.org>; Thu, 15 Jun 2023 06:43:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686836627; x=1689428627;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RizUl2oGqgayloMlfNL8io19L8gOOL7pLthdYdkn3SU=;
 b=Wf+mk44QDMNxjLHPIOvVZy06dua4iCLFAcG18os2kXashwTSRzbzV3BmuNJSdit2rj
 g/4486CpdXUzXOAGyLh50B8h9DrH0k8mX84vyUKf6cmU+DhcSWGoocyNfGcpdnpbuL7T
 Pc5t8m8BYEFjagmpLSJooWD0FDuT86guxvWaqHHa1twjYkQT+z3rqjskXf9u8VrlhX1t
 iOQIFVdQddM/vysFSnUqdX8+/kxfxk1RvIRkj3K42BGRiOqJgXcGjTCxCbxR1Xt/0dUt
 c2OtTTDfS7gOkR5Oq2qYufIPvdY/cV1TTSCuyDhCASPkdw489d0J+YJS19+xPLaQJbgn
 UT+Q==
X-Gm-Message-State: AC+VfDzsnQfW49HCF1cXzSIzkjzmYgCfzv9mwnA0Rd3s3hg7qMS+KKRS
 dJaFuHBQ+d7LXx0bdMpzxcqqLiYHjE1VEcsDlik=
X-Google-Smtp-Source: ACHHUZ6PTo9gfcsIfPOT0zASflHHnut5X0lO1zvgRSkr7Nxhgv0BxgYTsEtm82RJzrKwOS807B4bMA==
X-Received: by 2002:adf:f58c:0:b0:30f:ca58:a00d with SMTP id
 f12-20020adff58c000000b0030fca58a00dmr6458779wro.45.1686836627718; 
 Thu, 15 Jun 2023 06:43:47 -0700 (PDT)
Received: from localhost.localdomain ([2001:861:5384:6b50:31f3:6562:63d2:17f])
 by smtp.gmail.com with ESMTPSA id
 m11-20020a5d6a0b000000b0030b5d203e7esm21129602wru.97.2023.06.15.06.43.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Jun 2023 06:43:47 -0700 (PDT)
From: Sebastian Weyer <sebastian.weyer@smile.fr>
To: buildroot@buildroot.org
Date: Thu, 15 Jun 2023 15:43:08 +0200
Message-Id: <20230615134315.494330-5-sebastian.weyer@smile.fr>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230615134315.494330-1-sebastian.weyer@smile.fr>
References: <20230615134315.494330-1-sebastian.weyer@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20221208.gappssmtp.com; s=20221208; t=1686836627; x=1689428627;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RizUl2oGqgayloMlfNL8io19L8gOOL7pLthdYdkn3SU=;
 b=uZpuhTGZ8Pr2tiSs8Z45ymdNv7+BHd5dm+0/OfDA/xgN95gkk/0qLXK06S9hGYYOP7
 YPV7zUscoj5LMZzhM6A81le/E0w6xNzUT3FPBdRNecz91Nzu29cnZJAajYH4WNcjuTNy
 MhI5y4uIpGxlDjt7Pk1K4wlaLwBK60mV7FmwXyhKeIMSwB7sKGM/ZHn2/ZHu6VvevkgT
 qkovqRQSo9cGIzU0eeS5MQVhafcaVvxbj49kg1kfd3Qq08FjM58VqmKb8FYIe5w4Ix2l
 YA1jz4gIyUufcNZzbVRUELUDjrOn+oyhDoI+b/j+DV+10FkbBPpK0/VxbC1V5bEbr6kf
 dOkQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20221208.gappssmtp.com
 header.i=@smile-fr.20221208.gappssmtp.com header.a=rsa-sha256
 header.s=20221208 header.b=uZpuhTGZ
Subject: [Buildroot] [PATCH v4 04/10] package/clang: move to llvm-project
 subfolder
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 Sebastian Weyer <sebastian.weyer@smile.fr>, Lang Daniel <d.lang@abatec.at>,
 Romain Naour <romain.naour@smile.fr>, Romain Naour <romain.naour@gmail.com>,
 Valentin Korenblit <valentinkorenblit@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Lang Daniel <d.lang@abatec.at>

To make version bumping easier, move clang to a new llvm-project subfolder
and specify site and version for the project.

Signed-off-by: Daniel Lang <d.lang@abatec.at>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Sebastian Weyer <sebastian.weyer@smile.fr>
---
v4: change inaccuracy in commit message (move llvm -> move clang)

v3: move "package/llvm-project/clang/Config.in" entry in package/Config.in
---
 DEVELOPERS                                                 | 6 +++---
 package/Config.in                                          | 2 +-
 ...-Driver-ToolChains-Gnu-Use-GCC_INSTALL_PREFIX-in-.patch | 0
 package/{ => llvm-project}/clang/Config.in                 | 0
 package/{ => llvm-project}/clang/clang.hash                | 0
 package/{ => llvm-project}/clang/clang.mk                  | 7 +++----
 6 files changed, 7 insertions(+), 8 deletions(-)
 rename package/{ => llvm-project}/clang/0001-lib-Driver-ToolChains-Gnu-Use-GCC_INSTALL_PREFIX-in-.patch (100%)
 rename package/{ => llvm-project}/clang/Config.in (100%)
 rename package/{ => llvm-project}/clang/clang.hash (100%)
 rename package/{ => llvm-project}/clang/clang.mk (96%)

diff --git a/DEVELOPERS b/DEVELOPERS
index befafff1d0..1fb8295a7a 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1634,10 +1634,10 @@ F:	support/testing/tests/package/test_python_aexpect.py
 
 N:	Joseph Kogut <joseph.kogut@gmail.com>
 F:	package/at-spi2-core/
-F:	package/clang/
 F:	package/earlyoom/
 F:	package/gconf/
 F:	package/libnss/
+F:	package/llvm-project/clang/
 F:	package/llvm-project/lld/
 F:	package/llvm-project/llvm/
 F:	package/python-cython/
@@ -2519,7 +2519,6 @@ F:	package/alure/
 F:	package/aubio/
 F:	package/binutils/
 F:	package/bullet/
-F:	package/clang/
 F:	package/clinfo/
 F:	package/efl/
 F:	package/enet/
@@ -2538,6 +2537,7 @@ F:	package/libgta/
 F:	package/libiec61850/
 F:	package/libspatialindex/
 F:	package/linux-syscall-support/
+F:	package/llvm-project/clang/
 F:	package/llvm-project/llvm/
 F:	package/lugaru/
 F:	package/mcelog/
@@ -2946,9 +2946,9 @@ F:	package/gettext-tiny/
 F:	package/tinyssh/
 
 N:	Valentin Korenblit <valentinkorenblit@gmail.com>
-F:	package/clang/
 F:	package/clinfo/
 F:	package/libclc/
+F:	package/llvm-project/clang/
 F:	package/llvm-project/llvm/
 
 N:	Vanya Sergeev <vsergeev@gmail.com>
diff --git a/package/Config.in b/package/Config.in
index dffffc195b..7f2f045c87 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2023,7 +2023,6 @@ menu "Other"
 	source "package/catch2/Config.in"
 	source "package/cctz/Config.in"
 	source "package/cereal/Config.in"
-	source "package/clang/Config.in"
 	source "package/cmocka/Config.in"
 	source "package/compiler-rt/Config.in"
 	source "package/cppcms/Config.in"
@@ -2128,6 +2127,7 @@ comment "linux-pam plugins"
 	source "package/libpam-tacplus/Config.in"
 endif
 	source "package/liquid-dsp/Config.in"
+	source "package/llvm-project/clang/Config.in"
 	source "package/llvm-project/llvm/Config.in"
 	source "package/lttng-libust/Config.in"
 	source "package/matio/Config.in"
diff --git a/package/clang/0001-lib-Driver-ToolChains-Gnu-Use-GCC_INSTALL_PREFIX-in-.patch b/package/llvm-project/clang/0001-lib-Driver-ToolChains-Gnu-Use-GCC_INSTALL_PREFIX-in-.patch
similarity index 100%
rename from package/clang/0001-lib-Driver-ToolChains-Gnu-Use-GCC_INSTALL_PREFIX-in-.patch
rename to package/llvm-project/clang/0001-lib-Driver-ToolChains-Gnu-Use-GCC_INSTALL_PREFIX-in-.patch
diff --git a/package/clang/Config.in b/package/llvm-project/clang/Config.in
similarity index 100%
rename from package/clang/Config.in
rename to package/llvm-project/clang/Config.in
diff --git a/package/clang/clang.hash b/package/llvm-project/clang/clang.hash
similarity index 100%
rename from package/clang/clang.hash
rename to package/llvm-project/clang/clang.hash
diff --git a/package/clang/clang.mk b/package/llvm-project/clang/clang.mk
similarity index 96%
rename from package/clang/clang.mk
rename to package/llvm-project/clang/clang.mk
index 3c75f8d6b1..0943e21a8c 100644
--- a/package/clang/clang.mk
+++ b/package/llvm-project/clang/clang.mk
@@ -4,10 +4,9 @@
 #
 ################################################################################
 
-# LLVM, Clang and lld should be version bumped together
-CLANG_VERSION_MAJOR = 11
-CLANG_VERSION = $(CLANG_VERSION_MAJOR).1.0
-CLANG_SITE = https://github.com/llvm/llvm-project/releases/download/llvmorg-$(CLANG_VERSION)
+CLANG_VERSION_MAJOR = $(LLVM_PROJECT_VERSION_MAJOR)
+CLANG_VERSION = $(LLVM_PROJECT_VERSION)
+CLANG_SITE = $(LLVM_PROJECT_SITE)
 CLANG_SOURCE = clang-$(CLANG_VERSION).src.tar.xz
 CLANG_LICENSE = Apache-2.0 with exceptions
 CLANG_LICENSE_FILES = LICENSE.TXT
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

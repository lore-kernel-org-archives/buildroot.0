Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B093C52D7C
	for <buildroot@archiver.kernel.org>; Tue, 13 Aug 2024 18:04:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0298B40AD1;
	Tue, 13 Aug 2024 18:04:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q3ZP-QQiNDzL; Tue, 13 Aug 2024 18:04:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7149840454
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7149840454;
	Tue, 13 Aug 2024 18:04:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9EEA71BF343
 for <buildroot@lists.busybox.net>; Tue, 13 Aug 2024 18:04:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8A82A4031E
 for <buildroot@lists.busybox.net>; Tue, 13 Aug 2024 18:04:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zkbJfmqj0_SP for <buildroot@lists.busybox.net>;
 Tue, 13 Aug 2024 18:04:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2d; helo=mail-io1-xd2d.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org EB9954030D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EB9954030D
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com
 [IPv6:2607:f8b0:4864:20::d2d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EB9954030D
 for <buildroot@buildroot.org>; Tue, 13 Aug 2024 18:04:31 +0000 (UTC)
Received: by mail-io1-xd2d.google.com with SMTP id
 ca18e2360f4ac-81f861f369aso5229339f.0
 for <buildroot@buildroot.org>; Tue, 13 Aug 2024 11:04:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723572271; x=1724177071;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Zix/SE1vOOrd1RzS65LYs+tviuqImNz6G6zY4KzIteI=;
 b=BqZ9+w6oSSC9UCTSy/cWhYCfxqGj7F8yw9pTfbgms3M5M1+2toCNG2WPsxY2pCrZLI
 fOmcAfCcw9nP7ffMG3fq5XHC+MG2z/ApRz+Alv7czVbjvi2El73hAXk4GkeTIwykV7LR
 vQ08oXtP3m4K9bC3V1e/N4kokScb49kB7w+sWWj2yK5t86ydzBrpW2q+8tr4rUa/L26X
 GABy/URYbyBtgqJUX4Fr8PYm0fECkJm8ciTjWheiuh94z0jchpzyHBogpuQKow49t0oW
 FP6AH5w8LCR87mi8vHMIIMO2DBBIFdKKvca6oBmroOVkuHmzkcz9TG+XkfaOz0VNNorR
 tJsw==
X-Gm-Message-State: AOJu0YwPL70s8w1rohzG6dcdACmP2hH7mVq26r3u+wbBiE8cDclzp0GF
 hEldDy8a2S1BOkqO2kT+OVRVzjrrCwIIF/QMH6EjhwqzSCEcK//gVM8yGNB9
X-Google-Smtp-Source: AGHT+IFXBUeyypBS65MPQc2OGTtL3sf3J6WYbegNXztVt7y+0rXdL5Mq6XOgb0U2VjpBOHAkc0I+eQ==
X-Received: by 2002:a05:6e02:1705:b0:376:d20:1470 with SMTP id
 e9e14a558f8ab-39c48df326amr34029715ab.12.1723572270313; 
 Tue, 13 Aug 2024 11:04:30 -0700 (PDT)
Received: from james-x399.localdomain (97-118-128-240.hlrn.qwest.net.
 [97.118.128.240]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4ca76a32c45sm2600412173.131.2024.08.13.11.04.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Aug 2024 11:04:29 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 13 Aug 2024 12:04:25 -0600
Message-Id: <20240813180425.274055-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1723572271; x=1724177071; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Zix/SE1vOOrd1RzS65LYs+tviuqImNz6G6zY4KzIteI=;
 b=hXPDAYPAfXEJu4wC7vvqblZLA2Ly8IkmcS/WkHogkmKgAgFV3BJAxXbWhcofqA6MGI
 O2emJ+K9K7PrqOwKPS7kbiQrdj0Uk21nhJuubXGnLgDA58SeyJKms8OVy5CvZ0DVkT9f
 z5zS8aSQOjDhlSKH+uYHevz4KOVyxZsxkzPV8xneGgNWaMVC31E5UNdhYcnhKIkb2Dt2
 fkzX3ZTg3Cj/7WLg0sirtzqrKSFiEmbnIwDoIQ4cyrOCj5E4Di4COMihVf7k4r4H+Fyh
 l/p3Hpmsq5ZJIEhcB3TS3G/lDSYUHzRxaPzy1/suLAUqr8nB+izTZsTBThq10zJFR8tY
 Cbhg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=hXPDAYPA
Subject: [Buildroot] [PATCH 1/1] package/vboot-utils: bump to version
 4b12d392e5b12de29c582df4e717b1228e9f1594
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Drop patches which are now upstream/not relevant.

Add a patch adding missing USE_FLASHROM guards.

Set USE_FLASHROM=0 make option to disable flashrom support.

Fixes:
 - http://autobuild.buildroot.net/results/e55/e55af8335ef38e172e56544901510ae4dbdbff9b

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 ...missing-definition-of-MTD_CHAR_MAJOR.patch |  10 +-
 ...d-missing-header-include-for-ssize_t.patch |  27 --
 ...m_csme-add-missing-USE_FLASHROM-guar.patch |  76 +++++
 .../0003-Avoid-RSA-type-redefinition.patch    |  44 ---
 .../0004-Disable-static-futility.patch        |  30 --
 ...05-include-sys-sysmacros.h-for-major.patch |  53 ----
 .../0006-Update-for-openssl-1.1.patch         | 268 ------------------
 ...-Make-vboot_version-extern-in-header.patch |  50 ----
 package/vboot-utils/vboot-utils.hash          |   2 +-
 package/vboot-utils/vboot-utils.mk            |  11 +-
 10 files changed, 89 insertions(+), 482 deletions(-)
 delete mode 100644 package/vboot-utils/0002-Add-missing-header-include-for-ssize_t.patch
 create mode 100644 package/vboot-utils/0002-futility-platform_csme-add-missing-USE_FLASHROM-guar.patch
 delete mode 100644 package/vboot-utils/0003-Avoid-RSA-type-redefinition.patch
 delete mode 100644 package/vboot-utils/0004-Disable-static-futility.patch
 delete mode 100644 package/vboot-utils/0005-include-sys-sysmacros.h-for-major.patch
 delete mode 100644 package/vboot-utils/0006-Update-for-openssl-1.1.patch
 delete mode 100644 package/vboot-utils/0007-Make-vboot_version-extern-in-header.patch

diff --git a/package/vboot-utils/0001-Add-missing-definition-of-MTD_CHAR_MAJOR.patch b/package/vboot-utils/0001-Add-missing-definition-of-MTD_CHAR_MAJOR.patch
index 42410c8d13..c988c79529 100644
--- a/package/vboot-utils/0001-Add-missing-definition-of-MTD_CHAR_MAJOR.patch
+++ b/package/vboot-utils/0001-Add-missing-definition-of-MTD_CHAR_MAJOR.patch
@@ -1,4 +1,4 @@
-From 1438211660e700b2c9505863aae1cc957236b7c8 Mon Sep 17 00:00:00 2001
+From 90ed7f5cbe088912fbe0f3f45606de75602c1404 Mon Sep 17 00:00:00 2001
 From: Alex Suykov <alex.suykov@gmail.com>
 Date: Thu, 21 Jan 2016 21:59:46 +0100
 Subject: [PATCH] Add missing definition of MTD_CHAR_MAJOR
@@ -11,12 +11,12 @@ Signed-off-by: Alex Suykov <alex.suykov@gmail.com>
  1 file changed, 4 insertions(+)
 
 diff --git a/cgpt/cgpt_wrapper.c b/cgpt/cgpt_wrapper.c
-index dcfaab9..4d07aad 100644
+index afa4940e..38504aa6 100644
 --- a/cgpt/cgpt_wrapper.c
 +++ b/cgpt/cgpt_wrapper.c
-@@ -25,6 +25,10 @@
+@@ -33,6 +33,10 @@
  #include "cgpt_nor.h"
- #include "cryptolib.h"
+ #include "file_keys.h"
  
 +#ifndef MTD_CHAR_MAJOR
 +#define MTD_CHAR_MAJOR 90
@@ -26,5 +26,5 @@ index dcfaab9..4d07aad 100644
  // off device, and hence we should not wrap around cgpt.
  static bool has_dash_D(int argc, const char *const argv[]) {
 -- 
-2.6.4
+2.34.1
 
diff --git a/package/vboot-utils/0002-Add-missing-header-include-for-ssize_t.patch b/package/vboot-utils/0002-Add-missing-header-include-for-ssize_t.patch
deleted file mode 100644
index 4d559eabaf..0000000000
--- a/package/vboot-utils/0002-Add-missing-header-include-for-ssize_t.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From b6bed8d4e9453bc74ba021c8c17e20c3b5964c37 Mon Sep 17 00:00:00 2001
-From: Alex Suykov <alex.suykov@gmail.com>
-Date: Thu, 21 Jan 2016 22:00:34 +0100
-Subject: [PATCH] Add missing header include for ssize_t
-
-The code uses ssize_t which is usually defined in <unistd.h>.
-
-Signed-off-by: Alex Suykov <alex.suykov@gmail.com>
----
- host/lib/fmap.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/host/lib/fmap.c b/host/lib/fmap.c
-index c95338d..e3db826 100644
---- a/host/lib/fmap.c
-+++ b/host/lib/fmap.c
-@@ -6,6 +6,7 @@
- 
- #include <stdio.h>
- #include <string.h>
-+#include <unistd.h>
- 
- #include "fmap.h"
- 
--- 
-2.6.4
-
diff --git a/package/vboot-utils/0002-futility-platform_csme-add-missing-USE_FLASHROM-guar.patch b/package/vboot-utils/0002-futility-platform_csme-add-missing-USE_FLASHROM-guar.patch
new file mode 100644
index 0000000000..890a732f71
--- /dev/null
+++ b/package/vboot-utils/0002-futility-platform_csme-add-missing-USE_FLASHROM-guar.patch
@@ -0,0 +1,76 @@
+From 3244ea140c1b5b07ebb30f3d17e467d853b0db0f Mon Sep 17 00:00:00 2001
+From: James Hilliard <james.hilliard1@gmail.com>
+Date: Tue, 13 Aug 2024 11:41:28 -0600
+Subject: [PATCH] futility/platform_csme: add missing USE_FLASHROM guards
+
+Fixes:
+build/futility/platform_csme.o: in function `find_fmba':
+futility/platform_csme.c:42: undefined reference to `find_firmware_section'
+build/futility/platform_csme.o: in function `unlock_csme':
+futility/platform_csme.c:200: undefined reference to `get_firmware_image_temp_file'
+futility/platform_csme.c:230: undefined reference to `reload_firmware_image'
+
+Change-Id: I74140d38d119f2a0e6b8cf8eef3f9f05cd43bbd7
+Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
+Upstream: https://chromium-review.googlesource.com/c/chromiumos/platform/vboot_reference/+/5785792
+---
+ futility/platform_csme.c | 10 ++++++++++
+ 1 file changed, 10 insertions(+)
+
+diff --git a/futility/platform_csme.c b/futility/platform_csme.c
+index 2eb3ffcf..3829fe7b 100644
+--- a/futility/platform_csme.c
++++ b/futility/platform_csme.c
+@@ -33,6 +33,7 @@ struct fmba {
+ } __attribute__((packed));
+ 
+ static struct fmba * const find_fmba(const struct firmware_image *image) {
++#ifdef USE_FLASHROM
+ 	struct firmware_section section;
+ 	const uint32_t signature = 0x0FF0A55A;
+ 	const struct fdbar *fd;
+@@ -54,6 +55,9 @@ static struct fmba * const find_fmba(const struct firmware_image *image) {
+ 		return NULL;
+ 
+ 	return (struct fmba * const)(section.data + offset);
++#else
++	return NULL;
++#endif /* USE_FLASHROM */
+ }
+ 
+ static bool is_flmstr1_locked(const struct fmba * const fmba)
+@@ -132,6 +136,7 @@ int unlock_csme_eve(struct firmware_image *image)
+ 	return unlock_flmstrs(image, 0xffffff00, 0xffffff00, 0xffffff00);
+ }
+ 
++#ifdef USE_FLASHROM
+ /*
+  * Determine the platform to pass to ifdtool (e.g. 'adl') by extracting
+  * CONFIG_IFD_CHIPSET from the config file in CBFS. However, old nissa firmware
+@@ -183,6 +188,7 @@ static int run_ifdtool(const char *image_path, char *platform, const char *extra
+ 	free(command);
+ 	return ret;
+ }
++#endif /* USE_FLASHROM */
+ 
+ /*
+  * Unlock the CSME for recent Intel platforms (CML onwards).
+@@ -193,6 +199,7 @@ static int run_ifdtool(const char *image_path, char *platform, const char *extra
+  */
+ int unlock_csme(struct updater_config *cfg)
+ {
++#ifdef USE_FLASHROM
+ 	const char *temp_path;
+ 	char *platform;
+ 	int ret = -1;
+@@ -245,4 +252,7 @@ cleanup:
+ 	free(platform);
+ 
+ 	return ret;
++#else
++	return -1;
++#endif /* USE_FLASHROM */
+ }
+-- 
+2.34.1
+
diff --git a/package/vboot-utils/0003-Avoid-RSA-type-redefinition.patch b/package/vboot-utils/0003-Avoid-RSA-type-redefinition.patch
deleted file mode 100644
index 86374ca854..0000000000
--- a/package/vboot-utils/0003-Avoid-RSA-type-redefinition.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From 593407d2b3ea3b871d55ec399671e48c84b900a7 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Thu, 21 Jan 2016 22:01:37 +0100
-Subject: [PATCH] Avoid RSA type redefinition
-
-The host_key.h headers does:
-
-  typedef struct rsa_st RSA;
-
-But this type definition is already done by the OpenSSL headers.
-
-While such a type redefinition is legal with recent gcc versions, it
-doesn't build with older gcc versions such as gcc 4.4.
-
-To work around this problem, we instead use a forward declaration of
-"struct rsa_st", and change the only place where the RSA type was used
-by "struct rsa_st".
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- host/lib/include/host_key.h | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/host/lib/include/host_key.h b/host/lib/include/host_key.h
-index 9f98ccc..c2d01a5 100644
---- a/host/lib/include/host_key.h
-+++ b/host/lib/include/host_key.h
-@@ -12,11 +12,11 @@
- #include "vboot_struct.h"
- 
- 
--typedef struct rsa_st RSA;
-+struct rsa_st;
- 
- /* Private key data */
- typedef struct VbPrivateKey {
--  RSA* rsa_private_key;  /* Private key data */
-+  struct rsa_rt* rsa_private_key;  /* Private key data */
-   uint64_t algorithm;    /* Algorithm to use when signing */
- } VbPrivateKey;
- 
--- 
-2.6.4
-
diff --git a/package/vboot-utils/0004-Disable-static-futility.patch b/package/vboot-utils/0004-Disable-static-futility.patch
deleted file mode 100644
index 649d31629a..0000000000
--- a/package/vboot-utils/0004-Disable-static-futility.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-The package attempts to build a statically-linked host binary, futility_s,
-which is not used anywhere in buildroot but may be causing build failures
-if the build host lacks static libc.
-
-Signed-off-by: Alex Suykov <alex.suykov@gmail.com>
-
---- a/Makefile
-+++ b/Makefile
-@@ -1079,7 +1079,7 @@
- # new Firmware Utility
- 
- .PHONY: futil
--futil: ${FUTIL_STATIC_BIN} ${FUTIL_BIN}
-+futil: ${FUTIL_BIN}
- 
- ${FUTIL_STATIC_BIN}: ${FUTIL_STATIC_OBJS} ${UTILLIB}
- 	@${PRINTF} "    LD            $(subst ${BUILD}/,,$@)\n"
-@@ -1091,10 +1091,10 @@
- 	${Q}${LD} -o $@ ${CFLAGS} ${LDFLAGS} $^ ${LDLIBS}
- 
- .PHONY: futil_install
--futil_install: ${FUTIL_BIN} ${FUTIL_STATIC_BIN}
-+futil_install: ${FUTIL_BIN}
- 	@${PRINTF} "    INSTALL       futility\n"
- 	${Q}mkdir -p ${UB_DIR}
--	${Q}${INSTALL} -t ${UB_DIR} ${FUTIL_BIN} ${FUTIL_STATIC_BIN}
-+	${Q}${INSTALL} -t ${UB_DIR} ${FUTIL_BIN}
- 	${Q}for prog in ${FUTIL_SYMLINKS}; do \
- 		ln -sf futility "${UB_DIR}/$$prog"; done
- 
diff --git a/package/vboot-utils/0005-include-sys-sysmacros.h-for-major.patch b/package/vboot-utils/0005-include-sys-sysmacros.h-for-major.patch
deleted file mode 100644
index 3ab201fc3a..0000000000
--- a/package/vboot-utils/0005-include-sys-sysmacros.h-for-major.patch
+++ /dev/null
@@ -1,53 +0,0 @@
-From 0495287f062a0cef989e02e0aee4f4329ab155b0 Mon Sep 17 00:00:00 2001
-From: Mike Frysinger <vapier@chromium.org>
-Date: Tue, 19 Apr 2016 13:58:49 -0400
-Subject: [PATCH] include sys/sysmacros.h for major()
-
-The major() func is defined in the sys/sysmacros.h header, so include it
-explicitly for the prototype.  Upstream C libs are moving away from having
-sys/types.h include it all the time implicitly.
-
-BUG=None
-TEST=precq passes
-BRANCH=None
-
-Change-Id: I56b84138f08ded2376193403f9c9db22c5f24f71
-Reviewed-on: https://chromium-review.googlesource.com/339680
-Commit-Ready: Mike Frysinger <vapier@chromium.org>
-Tested-by: Mike Frysinger <vapier@chromium.org>
-Reviewed-by: Bill Richardson <wfrichar@google.com>
-Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
-[Dario: make the patch to be applied with fuzz factor 0]
-Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
----
- cgpt/cgpt_wrapper.c               | 1 +
- futility/dump_kernel_config_lib.c | 1 +
- 2 files changed, 2 insertions(+)
-
-diff --git a/cgpt/cgpt_wrapper.c b/cgpt/cgpt_wrapper.c
-index 4d07aadac72d..6fbfb235ba7b 100644
---- a/cgpt/cgpt_wrapper.c
-+++ b/cgpt/cgpt_wrapper.c
-@@ -18,6 +18,7 @@
- #include <stdio.h>
- #include <string.h>
- #include <sys/stat.h>
-+#include <sys/sysmacros.h>
- #include <sys/types.h>
- #include <unistd.h>
- 
-diff --git a/futility/dump_kernel_config_lib.c b/futility/dump_kernel_config_lib.c
-index c2d59433ba71..448a2f6a831f 100644
---- a/futility/dump_kernel_config_lib.c
-+++ b/futility/dump_kernel_config_lib.c
-@@ -10,6 +10,7 @@
- #include <sys/mman.h>
- #include <sys/fcntl.h>
- #include <sys/stat.h>
-+#include <sys/sysmacros.h>
- #include <sys/types.h>
- #include <unistd.h>
- 
--- 
-2.43.0
-
diff --git a/package/vboot-utils/0006-Update-for-openssl-1.1.patch b/package/vboot-utils/0006-Update-for-openssl-1.1.patch
deleted file mode 100644
index 77e71e58b8..0000000000
--- a/package/vboot-utils/0006-Update-for-openssl-1.1.patch
+++ /dev/null
@@ -1,268 +0,0 @@
-From 2e730b2259c701f16d473dbfb7e58e86a6e71b01 Mon Sep 17 00:00:00 2001
-From: Daniel Kurtz <djkurtz@chromium.org>
-Date: Fri, 18 Jan 2019 13:04:59 +0200
-Subject: [PATCH] Update for openssl 1.1
-
-OpenSSL 1.1 has made significant non-backwards compatible changes to its
-API as outlined in:
-https://wiki.openssl.org/index.php/OpenSSL_1.1.0_Changes
-
-BRANCH=none
-BUG=chromium:738114
-TEST=cros_workon --host start vboot_reference
-TEST=w/ openssl-1.0.2k: sudo emerge vboot_reference
-TEST=w/ openssl-1.1.0e: sudo emerge vboot_reference
- => both build ok
- $ futility version
-  => command runs without error
-TEST=cros_workon --board=soraka start vboot_reference coreboot
-TEST=w/ openssl-1.0.2k: emerge-soraka vboot_reference coreboot
-TEST=w/ openssl-1.1.0e: emerge-soraka vboot_reference coreboot
- => All build ok
-
-Change-Id: I37cfc8cbb04a092eab7b0b3224f475b82609447c
-Reviewed-on: https://chromium-review.googlesource.com/557739
-Commit-Ready: Daniel Kurtz <djkurtz@chromium.org>
-Tested-by: Daniel Kurtz <djkurtz@chromium.org>
-Reviewed-by: Randall Spangler <rspangler@chromium.org>
-Reviewed-by: Mike Frysinger <vapier@chromium.org>
-
-(cherry-picked from bce7904376beee2912932433a4634c1c25afe2f5)
-Signed-off-by: Vadim Kochan <vadim4j@gmail.com>
----
- futility/cmd_create.c         |  5 ++++-
- futility/vb2_helper.c         |  7 +++++--
- host/include/openssl_compat.h | 26 ++++++++++++++++++++++++++
- host/lib/util_misc.c          |  7 +++++--
- host/lib21/host_key.c         |  8 +++++++-
- utility/dumpRSAPublicKey.c    | 19 ++++++++++++++-----
- 6 files changed, 61 insertions(+), 11 deletions(-)
- create mode 100644 host/include/openssl_compat.h
-
-diff --git a/futility/cmd_create.c b/futility/cmd_create.c
-index 143ea9ae..80d3fd90 100644
---- a/futility/cmd_create.c
-+++ b/futility/cmd_create.c
-@@ -13,6 +13,7 @@
- #include "2common.h"
- #include "2id.h"
- #include "2rsa.h"
-+#include "openssl_compat.h"
- #include "util_misc.h"
- #include "vb2_common.h"
- #include "vb2_struct.h"
-@@ -170,6 +171,7 @@ static int vb2_make_keypair()
- 	enum vb2_signature_algorithm sig_alg;
- 	uint8_t *pubkey_buf = 0;
- 	int has_priv = 0;
-+	const BIGNUM *rsa_d;
- 
- 	FILE *fp;
- 	int ret = 1;
-@@ -193,7 +195,8 @@ static int vb2_make_keypair()
- 		goto done;
- 	}
- 	/* Public keys doesn't have the private exponent */
--	has_priv = !!rsa_key->d;
-+	RSA_get0_key(rsa_key, NULL, NULL, &rsa_d);
-+	has_priv = !!rsa_d;
- 	if (!has_priv)
- 		fprintf(stderr, "%s has a public key only.\n", infile);
- 
-diff --git a/futility/vb2_helper.c b/futility/vb2_helper.c
-index 51a78375..c6cc0fdd 100644
---- a/futility/vb2_helper.c
-+++ b/futility/vb2_helper.c
-@@ -11,6 +11,7 @@
- #include "2common.h"
- #include "2id.h"
- #include "2rsa.h"
-+#include "openssl_compat.h"
- #include "util_misc.h"
- #include "vb2_common.h"
- #include "vb2_struct.h"
-@@ -216,6 +217,7 @@ int ft_show_pem(const char *name, uint8_t *buf, uint32_t len, void *data)
- 	uint8_t *keyb, *digest;
- 	uint32_t keyb_len;
- 	int i, bits;
-+	const BIGNUM *rsa_key_n, *rsa_key_d;
- 
- 	/* We're called only after ft_recognize_pem, so this should work. */
- 	rsa_key = rsa_from_buffer(buf, len);
-@@ -223,10 +225,11 @@ int ft_show_pem(const char *name, uint8_t *buf, uint32_t len, void *data)
- 		DIE;
- 
- 	/* Use to presence of the private exponent to decide if it's public */
--	printf("%s Key file:      %s\n", rsa_key->d ? "Private" : "Public",
-+	RSA_get0_key(rsa_key, &rsa_key_n, NULL, &rsa_key_d);
-+	printf("%s Key file:      %s\n", rsa_key_d ? "Private" : "Public",
- 					 name);
- 
--	bits = BN_num_bits(rsa_key->n);
-+	bits = BN_num_bits(rsa_key_n);
- 	printf("  Key length:          %d\n", bits);
- 
- 	if (vb_keyb_from_rsa(rsa_key, &keyb, &keyb_len)) {
-diff --git a/host/include/openssl_compat.h b/host/include/openssl_compat.h
-new file mode 100644
-index 00000000..7771f32a
---- /dev/null
-+++ b/host/include/openssl_compat.h
-@@ -0,0 +1,26 @@
-+/* Copyright 2017 The Chromium OS Authors. All rights reserved.
-+ * Use of this source code is governed by a BSD-style license that can be
-+ * found in the LICENSE file.
-+ */
-+
-+#ifndef VBOOT_REFERENCE_OPENSSL_COMPAT_H_
-+#define VBOOT_REFERENCE_OPENSSL_COMPAT_H_
-+
-+#include <openssl/rsa.h>
-+
-+#if OPENSSL_VERSION_NUMBER < 0x10100000L
-+
-+static inline void RSA_get0_key(const RSA *rsa, const BIGNUM **n,
-+				const BIGNUM **e, const BIGNUM **d)
-+{
-+	if (n != NULL)
-+		*n = rsa->n;
-+	if (e != NULL)
-+		*e = rsa->e;
-+	if (d != NULL)
-+		*d = rsa->d;
-+}
-+
-+#endif  /* OPENSSL_VERSION_NUMBER < 0x10100000L */
-+
-+#endif  /* VBOOT_REFERENCE_OPENSSL_COMPAT_H_ */
-diff --git a/host/lib/util_misc.c b/host/lib/util_misc.c
-index 03ec683f..f0a1f7ad 100644
---- a/host/lib/util_misc.c
-+++ b/host/lib/util_misc.c
-@@ -15,6 +15,7 @@
- 
- #include "cryptolib.h"
- #include "host_common.h"
-+#include "openssl_compat.h"
- #include "util_misc.h"
- #include "vboot_common.h"
- 
-@@ -58,6 +59,7 @@ int vb_keyb_from_rsa(struct rsa_st *rsa_private_key,
- 	BIGNUM *N0inv = NULL, *R = NULL, *RR = NULL;
- 	BIGNUM *RRTemp = NULL, *NnumBits = NULL;
- 	BIGNUM *n = NULL, *rr = NULL;
-+	const BIGNUM *rsa_private_key_n;
- 	BN_CTX *bn_ctx = BN_CTX_new();
- 	uint32_t n0invout;
- 	uint32_t bufsize;
-@@ -65,7 +67,7 @@ int vb_keyb_from_rsa(struct rsa_st *rsa_private_key,
- 	int retval = 1;
- 
- 	/* Size of RSA key in 32-bit words */
--	nwords = BN_num_bits(rsa_private_key->n) / 32;
-+	nwords = RSA_size(rsa_private_key) / 4;
- 
- 	bufsize = (2 + nwords + nwords) * sizeof(uint32_t);
- 	outbuf = malloc(bufsize);
-@@ -94,7 +96,8 @@ int vb_keyb_from_rsa(struct rsa_st *rsa_private_key,
- 	NEW_BIGNUM(B);
- #undef NEW_BIGNUM
- 
--	BN_copy(N, rsa_private_key->n);
-+	RSA_get0_key(rsa_private_key, &rsa_private_key_n, NULL, NULL);
-+	BN_copy(N, rsa_private_key_n);
- 	BN_set_word(Big1, 1L);
- 	BN_set_word(Big2, 2L);
- 	BN_set_word(Big32, 32L);
-diff --git a/host/lib21/host_key.c b/host/lib21/host_key.c
-index f7ea1622..f9419ad3 100644
---- a/host/lib21/host_key.c
-+++ b/host/lib21/host_key.c
-@@ -17,6 +17,7 @@
- #include "host_common.h"
- #include "host_key2.h"
- #include "host_misc.h"
-+#include "openssl_compat.h"
- 
- struct vb2_text_vs_enum vb2_text_vs_algorithm[] = {
- 	{"RSA1024 SHA1",   VB2_ALG_RSA1024_SHA1},
-@@ -544,7 +545,12 @@ int vb2_public_key_hash(struct vb2_public_key *key,
- 
- enum vb2_signature_algorithm vb2_rsa_sig_alg(struct rsa_st *rsa)
- {
--	int bits = BN_num_bits(rsa->n);
-+	const BIGNUM *e, *n;
-+	int exp, bits;
-+
-+	RSA_get0_key(rsa, &n, &e, NULL);
-+	exp = BN_get_word(e);
-+	bits = BN_num_bits(n);
- 
- 	switch (bits) {
- 	case 1024:
-diff --git a/utility/dumpRSAPublicKey.c b/utility/dumpRSAPublicKey.c
-index b3b7b96b..a17b159e 100644
---- a/utility/dumpRSAPublicKey.c
-+++ b/utility/dumpRSAPublicKey.c
-@@ -14,14 +14,20 @@
- #include <string.h>
- #include <unistd.h>
- 
-+#include "openssl_compat.h"
-+
- /* Command line tool to extract RSA public keys from X.509 certificates
-  * and output a pre-processed version of keys for use by RSA verification
-  * routines.
-  */
- 
- int check(RSA* key) {
--  int public_exponent = BN_get_word(key->e);
--  int modulus = BN_num_bits(key->n);
-+  const BIGNUM *n, *e;
-+  int public_exponent, modulus;
-+
-+  RSA_get0_key(key, &n, &e, NULL);
-+  public_exponent = BN_get_word(e);
-+  modulus = BN_num_bits(n);
- 
-   if (public_exponent != 65537) {
-     fprintf(stderr, "WARNING: Public exponent should be 65537 (but is %d).\n",
-@@ -40,7 +46,8 @@ int check(RSA* key) {
-  */
- void output(RSA* key) {
-   int i, nwords;
--  BIGNUM *N = key->n;
-+  const BIGNUM *key_n;
-+  BIGNUM *N = NULL;
-   BIGNUM *Big1 = NULL, *Big2 = NULL, *Big32 = NULL, *BigMinus1 = NULL;
-   BIGNUM *B = NULL;
-   BIGNUM *N0inv= NULL, *R = NULL, *RR = NULL, *RRTemp = NULL, *NnumBits = NULL;
-@@ -48,14 +55,15 @@ void output(RSA* key) {
-   BN_CTX *bn_ctx = BN_CTX_new();
-   uint32_t n0invout;
- 
--  N = key->n;
-   /* Output size of RSA key in 32-bit words */
--  nwords = BN_num_bits(N) / 32;
-+  nwords = RSA_size(key) / 4;
-   if (-1 == write(1, &nwords, sizeof(nwords)))
-     goto failure;
- 
- 
-   /* Initialize BIGNUMs */
-+  RSA_get0_key(key, &key_n, NULL, NULL);
-+  N = BN_dup(key_n);
-   Big1 = BN_new();
-   Big2 = BN_new();
-   Big32 = BN_new();
-@@ -120,6 +128,7 @@ void output(RSA* key) {
- 
- failure:
-   /* Free BIGNUMs. */
-+  BN_free(N);
-   BN_free(Big1);
-   BN_free(Big2);
-   BN_free(Big32);
--- 
-2.14.1
-
diff --git a/package/vboot-utils/0007-Make-vboot_version-extern-in-header.patch b/package/vboot-utils/0007-Make-vboot_version-extern-in-header.patch
deleted file mode 100644
index 6a3929f3c0..0000000000
--- a/package/vboot-utils/0007-Make-vboot_version-extern-in-header.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-From df4d2000a22db673a788b8e57e8e7c0cc3cee777 Mon Sep 17 00:00:00 2001
-From: Leonard Chan <leonardchan@google.com>
-Date: Thu, 3 Oct 2019 18:53:04 -0700
-Subject: [PATCH] Make vboot_version extern in header
-
-When enabling `-fno-common` in Fuchsia, we get a bunch of linker errors
-when linking futility:
-
-```
-ld.lld: error: duplicate symbol: vboot_version
->>> defined at futility.h:43 (../../third_party/vboot_reference/futility/futility.h:43)
->>>            host_x63-asan_no_detect_leaks/obj/third_party/vboot_reference/futility/futility.cmd_bdb.c.o:(vboot_version)
->>> defined at futility.h:43 (../../third_party/vboot_reference/futility/futility.h:43)
->>>            host_x64-asan_no_detect_leaks/obj/third_party/vboot_reference/futility/futility.cmd_create.c.o:(.bss.vboot_version+0x0)
-```
-
-and think this is because -fno-common places vboot_version for
-unitialized global variables in the BSS section of each object file.
-Making it extern instead resolves each reference to its definition in
-futility/misc.c.
-
-Change-Id: I591f07abd1f975a8a9d078bb4366e2e0861390b4
-Reviewed-on: https://chromium-review.googlesource.com/c/chromiumos/platform/vboot_reference/+/1839207
-Reviewed-by: Julius Werner <jwerner@chromium.org>
-Reviewed-by: Joel Kitching <kitching@chromium.org>
-Commit-Queue: Julius Werner <jwerner@chromium.org>
-Tested-by: Julius Werner <jwerner@chromium.org>
-
-Patch taken from upstream: https://chromium.googlesource.com/chromiumos/platform/vboot_reference/+/df4d2000a22db673a788b8e57e8e7c0cc3cee777
-Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
----
- futility/futility.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/futility/futility.h b/futility/futility.h
-index 3bce1106..5dc426dd 100644
---- a/futility/futility.h
-+++ b/futility/futility.h
-@@ -41,7 +41,7 @@ enum vboot_version  {
- };
- 
- /* What's our preferred API & data format? */
--enum vboot_version vboot_version;
-+extern enum vboot_version vboot_version;
- 
- /* Here's a structure to define the commands that futility implements. */
- struct futil_cmd_t {
--- 
-2.20.1
-
diff --git a/package/vboot-utils/vboot-utils.hash b/package/vboot-utils/vboot-utils.hash
index 1b622f25bf..13752f3a33 100644
--- a/package/vboot-utils/vboot-utils.hash
+++ b/package/vboot-utils/vboot-utils.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  3e7b7e7f831e16cb07a7a09e1b74f1fff096d99b13c0d0d90d51ec3f80acd90b  vboot-utils-bbdd62f9b030db7ad8eef789aaf58a7ff9a25656-git4.tar.gz
+sha256  d65c447d5b4624ffb87815071d2734c3802a73fdca56a06c910fd0ea8e82602d  vboot-utils-4b12d392e5b12de29c582df4e717b1228e9f1594-git4.tar.gz
 sha256  cb9dc8e96aedf9120b6757a60387db10f3c1a8e3fd97bb9d0f11327be5a7ed4d  LICENSE
diff --git a/package/vboot-utils/vboot-utils.mk b/package/vboot-utils/vboot-utils.mk
index 3f63f458cc..3058d61ad8 100644
--- a/package/vboot-utils/vboot-utils.mk
+++ b/package/vboot-utils/vboot-utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-VBOOT_UTILS_VERSION = bbdd62f9b030db7ad8eef789aaf58a7ff9a25656
+VBOOT_UTILS_VERSION = 4b12d392e5b12de29c582df4e717b1228e9f1594
 VBOOT_UTILS_SITE = https://chromium.googlesource.com/chromiumos/platform/vboot_reference
 VBOOT_UTILS_SITE_METHOD = git
 VBOOT_UTILS_LICENSE = BSD-3-Clause
@@ -26,17 +26,20 @@ HOST_VBOOT_UTILS_DEPENDENCIES = host-openssl host-util-linux host-pkgconf
 # does not affect futil or cgpt in any way as long as it is one of the
 # supported targets.
 
+HOST_VBOOT_UTILS_MAKE_OPTS = USE_FLASHROM=0
+
 define HOST_VBOOT_UTILS_BUILD_CMDS
-	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) \
+	$(HOST_MAKE_ENV) $(MAKE) $(HOST_VBOOT_UTILS_MAKE_OPTS) -C $(@D) \
 		CC="$(HOSTCC)" \
-		CFLAGS="$(HOST_CFLAGS) -D_LARGEFILE64_SOURCE -D_GNU_SOURCE" \
+		CPPFLAGS="$(HOST_CFLAGS) -D_LARGEFILE64_SOURCE -D_GNU_SOURCE" \
 		LDFLAGS="$(HOST_LDFLAGS)" \
 		ARCH=arm \
 		futil cgpt
 endef
 
 define HOST_VBOOT_UTILS_INSTALL_CMDS
-	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(HOST_DIR) \
+	$(HOST_MAKE_ENV) $(MAKE) $(HOST_VBOOT_UTILS_MAKE_OPTS) -C $(@D) \
+		DESTDIR=$(HOST_DIR) \
 		futil_install cgpt_install devkeys_install
 endef
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

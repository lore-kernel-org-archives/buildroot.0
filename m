Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16EE4C433F5
	for <buildroot@archiver.kernel.org>; Sat,  1 Jan 2022 22:36:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 990BE401FB;
	Sat,  1 Jan 2022 22:36:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EOJhwggj7N0f; Sat,  1 Jan 2022 22:36:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CAD0140200;
	Sat,  1 Jan 2022 22:36:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 456331BF32D
 for <buildroot@lists.busybox.net>; Sat,  1 Jan 2022 22:36:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3427D80B53
 for <buildroot@lists.busybox.net>; Sat,  1 Jan 2022 22:36:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0beUFuNBoas5 for <buildroot@lists.busybox.net>;
 Sat,  1 Jan 2022 22:36:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0265980B44
 for <buildroot@buildroot.org>; Sat,  1 Jan 2022 22:36:27 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id v6so616059wra.8
 for <buildroot@buildroot.org>; Sat, 01 Jan 2022 14:36:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fhReL0qnKWFUUWoLTMTxHR9Axh4VooJkD8Ge+ML8uO0=;
 b=jomY+ZOXZzsc4veX0G4mZIcHddu3/GYiLMJHVcvwKc6XvbIqqskqQmCVSbnwN+P0p5
 yum34Z5nCDICglqc9X2tTSWWU7gb0AU1GjLcwlg1I+3SwB1NYAQx47KH3yirc/Q6SMKN
 1ZXv8nn2+DN0MBD8583Ac2v8uKBIH3dPjkWYr9iWKCoFEWsYdZlt0NCeNVD+ofiyJTh5
 3CW+6HkPFtzs0d/0gSIwECjguRKxELO+PGx6PXcEV1ILLXfszjDnnmIHvePaBqJOy1ar
 IRG2/JHD4sY1LDk4OnF2IOmWgZ19RjD0UCuAtEwcTNw6A3N6qJKtbzdZ7if40Gs00qq4
 63RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fhReL0qnKWFUUWoLTMTxHR9Axh4VooJkD8Ge+ML8uO0=;
 b=C8KlRMe+GUXRradgkDHEelyFX62UsaLM21feZmTbqmhQUyCAOUT+hUi9MYZhwFzy1m
 5vsD49t+DbzcfRKU7JnyqVCTH0d8d8yu5gzaPOKtqqs4RkzGFhDPKqy47ncjqv4Atq5z
 ipaU8LhqaPSB4CmgjSFNUxT2J4ZqbSV53Jk7oHQIieIa6/KpoxiQw1goZddWxHnPxzqM
 CkTsnrymcB1fvgvi00062kMvv3ypDnM2p/NVFnHZmuadwaZapItaDUCjCpZJ4n0kje9o
 /C2Oca2Qffjp1mu6c+ZSPOT47/WV9L6brBF2scsOvWkcktLHnjRzoIdaygxa94r1OfRF
 hdxQ==
X-Gm-Message-State: AOAM530fjvtkR83zSZGaq79CN/ZuCNy3avSxadN77N/xhA6mpzX5rOkx
 lBwEAadP+V+vYIVwfhlzrxgr5WqtOTk=
X-Google-Smtp-Source: ABdhPJxo5beDjiAJMNejbmh6Rp4zQ+7qbU+fxFQ+2ammBtn0umL71JFcBlIsIzKBmRlvknmXr1qZhg==
X-Received: by 2002:a5d:4706:: with SMTP id y6mr34738798wrq.435.1641076585822; 
 Sat, 01 Jan 2022 14:36:25 -0800 (PST)
Received: from kali.home (2a01cb08896fec001e062303fcff6330.ipv6.abo.wanadoo.fr.
 [2a01:cb08:896f:ec00:1e06:2303:fcff:6330])
 by smtp.gmail.com with ESMTPSA id b6sm28879786wri.56.2022.01.01.14.36.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Jan 2022 14:36:25 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  1 Jan 2022 23:35:29 +0100
Message-Id: <20220101223529.2111756-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/tinyalsa: bump to version 2.0.0
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Switch to meson-package to drop first patch and disable examples and
  utils
- Drop second patch (already in version)
- Update hash of NOTICE (empty new lines added with
  https://github.com/tinyalsa/tinyalsa/commit/902b8c8f9fa5a2e1937007d7d5ee90f01790808b)

https://github.com/tinyalsa/tinyalsa/releases/tag/v2.0.0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../tinyalsa/0001-disable-doxygen-usage.patch | 35 ------------------
 .../0002-interval.h-add-missing-header.patch  | 36 -------------------
 package/tinyalsa/tinyalsa.hash                |  4 +--
 package/tinyalsa/tinyalsa.mk                  | 27 +++-----------
 4 files changed, 6 insertions(+), 96 deletions(-)
 delete mode 100644 package/tinyalsa/0001-disable-doxygen-usage.patch
 delete mode 100644 package/tinyalsa/0002-interval.h-add-missing-header.patch

diff --git a/package/tinyalsa/0001-disable-doxygen-usage.patch b/package/tinyalsa/0001-disable-doxygen-usage.patch
deleted file mode 100644
index ed939fb9bf..0000000000
--- a/package/tinyalsa/0001-disable-doxygen-usage.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-Disable doxygen usage
-
-In order to avoid a dependency on doxygen on the build machine, this
-patch adjusts the main Makefile to not build and install the
-documentation.
-
-[Vincent: tweak patch for 1.1.1 version]
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
-
-diff -rup a/Makefile b/Makefile
---- a/Makefile	2017-05-24 05:23:57.000000000 +0100
-+++ b/Makefile	2017-05-25 10:35:20.781747053 +0100
-@@ -11,14 +11,12 @@ export MANDIR ?= $(PREFIX)/share/man
- all:
- 	$(MAKE) -C src
- 	$(MAKE) -C utils
--	$(MAKE) -C doxygen
- 	$(MAKE) -C examples
- 
- .PHONY: clean
- clean:
- 	$(MAKE) -C src clean
- 	$(MAKE) -C utils clean
--	$(MAKE) -C doxygen clean
- 	$(MAKE) -C examples clean
- 
- .PHONY: install
-@@ -30,5 +28,4 @@ install:
- 	install include/tinyalsa/version.h $(DESTDIR)$(INCDIR)/
- 	$(MAKE) -C src install
- 	$(MAKE) -C utils install
--	$(MAKE) -C doxygen install
- 
diff --git a/package/tinyalsa/0002-interval.h-add-missing-header.patch b/package/tinyalsa/0002-interval.h-add-missing-header.patch
deleted file mode 100644
index c043145b55..0000000000
--- a/package/tinyalsa/0002-interval.h-add-missing-header.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 685e530d8a0063134642371eaacd01fee2f62d85 Mon Sep 17 00:00:00 2001
-From: Baruch Siach <baruch@tkos.co.il>
-Date: Fri, 2 Jun 2017 12:19:03 +0300
-Subject: [PATCH] interval.h: add missing header
-
-The ssize_t type requires the unistd.h header. This fixes build with musl
-libc:
-
-In file included from ../include/tinyalsa/limits.h:32:0,
-                 from limits.c:1:
-../include/tinyalsa/interval.h:38:2: error: unknown type name 'ssize_t'
-  ssize_t max;
-  ^
-
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
----
-Upstream status: https://github.com/tinyalsa/tinyalsa/pull/98
-
- include/tinyalsa/interval.h | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/include/tinyalsa/interval.h b/include/tinyalsa/interval.h
-index 3f6f3dce5d90..068571df5a63 100644
---- a/include/tinyalsa/interval.h
-+++ b/include/tinyalsa/interval.h
-@@ -30,6 +30,7 @@
- #define TINYALSA_INTERVAL_H
- 
- #include <stdlib.h>
-+#include <unistd.h>
- 
- /** A closed range signed interval. */
- 
--- 
-2.11.0
-
diff --git a/package/tinyalsa/tinyalsa.hash b/package/tinyalsa/tinyalsa.hash
index d078bab597..f7673b1769 100644
--- a/package/tinyalsa/tinyalsa.hash
+++ b/package/tinyalsa/tinyalsa.hash
@@ -1,3 +1,3 @@
 # locally computed
-sha256  d92b438cea348ae316c4b2cbf367b4f01ed821a947e6a34d813624e9e3c936c1  tinyalsa-1.1.1.tar.gz
-sha256  ca2b89a68c33fba3c8bcaec96f32907e2ede0eb33688ae61d29ec49732158f6d  NOTICE
+sha256  573ae0b2d3480851c1d2a12503ead2beea27f92d44ed47b74b553ba947994ef1  tinyalsa-2.0.0.tar.gz
+sha256  ea22a4711f5250f88a4d7011fbc65367d1b02ac954dcc49f5b6d7c135e6537c4  NOTICE
diff --git a/package/tinyalsa/tinyalsa.mk b/package/tinyalsa/tinyalsa.mk
index bd9d9a00d0..b5c39e35d6 100644
--- a/package/tinyalsa/tinyalsa.mk
+++ b/package/tinyalsa/tinyalsa.mk
@@ -4,30 +4,11 @@
 #
 ################################################################################
 
-TINYALSA_VERSION = 1.1.1
-TINYALSA_SITE = $(call github,tinyalsa,tinyalsa,$(TINYALSA_VERSION))
+TINYALSA_VERSION = 2.0.0
+TINYALSA_SITE = $(call github,tinyalsa,tinyalsa,v$(TINYALSA_VERSION))
 TINYALSA_LICENSE = BSD-3-Clause
 TINYALSA_LICENSE_FILES = NOTICE
 TINYALSA_INSTALL_STAGING = YES
+TINYALSA_CONF_OPTS = -Ddocs=disabled -Dexamples=disabled -Dutils=disabled
 
-define TINYALSA_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) CROSS_COMPILE="$(TARGET_CROSS)" -C $(@D)
-endef
-
-define TINYALSA_INSTALL_STAGING_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) \
-		-C $(@D) \
-		PREFIX="/usr" \
-		CROSS_COMPILE="$(TARGET_CROSS)" \
-		DESTDIR="$(STAGING_DIR)" install
-endef
-
-define TINYALSA_INSTALL_TARGET_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) \
-		-C $(@D) \
-		PREFIX="/usr" \
-		CROSS_COMPILE="$(TARGET_CROSS)" \
-		DESTDIR="$(TARGET_DIR)" install
-endef
-
-$(eval $(generic-package))
+$(eval $(meson-package))
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

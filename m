Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D485AC433F5
	for <buildroot@archiver.kernel.org>; Thu, 30 Dec 2021 22:52:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 72AE240373;
	Thu, 30 Dec 2021 22:52:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tLAeY6YnTUwh; Thu, 30 Dec 2021 22:52:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 549F24038E;
	Thu, 30 Dec 2021 22:52:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5E2671BF3C2
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 22:52:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5B11840641
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 22:52:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fwAlDq2bxwOJ for <buildroot@lists.busybox.net>;
 Thu, 30 Dec 2021 22:52:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3390140303
 for <buildroot@buildroot.org>; Thu, 30 Dec 2021 22:52:52 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 a203-20020a1c7fd4000000b003457874263aso16730293wmd.2
 for <buildroot@buildroot.org>; Thu, 30 Dec 2021 14:52:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=edfpzEPl+AaQk0CY034LuxtMofXQ3Pw7iabyfcv8KLQ=;
 b=COcsQRdXY3iW92X7r5Dtcc8N4swPt5+msihz1y1pRo241+V+8abFlhGzR1B2L0a9IO
 hzcW6esILTh0FPtjS0mynm0NeB44Y6ykx6A7GT8l2zDmeZuYvabFFZ4GXJ/GlQWQs5lJ
 g6K6gn8qJT2wWjqLVm8SvrPJeER6wtRixItDIg/kgvUNF1r9zR4tRs9cvbESnUvFEt3U
 dCHuidfjpU/WWXeI9vyH0UCm2YPffVzT70DwQVRDJVB1acAzhtGJREXE5aVqoA9ecBnb
 S7IMNeHLPoQsllF5YdANTQsCQ5ed8vQVioLDlW19ggDf5qsa3yH7obh1GstUSEGMM/ez
 H93w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=edfpzEPl+AaQk0CY034LuxtMofXQ3Pw7iabyfcv8KLQ=;
 b=b5YiH8SZgIp6IGsOdUqlde1r3mLpZglkbY1buSh4+WQgUjporib9YIR6C/ON3bzdGL
 oNaA2rMTIxbCQuQ967EtmWHrClw/jROuiF6BX6PvWDPDl7H8rbTVTMbclSQ7rPxo4psD
 5MIzMLF+2J1P0pLPJBvBbfL/nmgkPzoA6vWKC974/AgJwoUf99Hv6zsLIBJp+CzOm8ZK
 BXt35l3GWmZVe5uet0C3jsRA65Qf1Mv2Zu+/jFBF+QM3zUdOD64r3RGqBtCoy+kXUNKG
 sb0OzqMnxVcsYf9bO7hHTxmJ9u0WkN6qPp/KlCZlFZ5DnuE6mlNDImaDWVQuT/zaUwAZ
 PCAA==
X-Gm-Message-State: AOAM531bQDH+A7S/345il/6z1ILa18o/NzrT5kI6TDo8zxLKgrjsBOLW
 +FZ51mz6m8yYSg5Md6X6yfFNwsDMylY=
X-Google-Smtp-Source: ABdhPJzCT2lIksT6rHcDDwnCfUNK71nlhJabAxvIkroaGOoB01kq1LBCni3PUcKpKR2rIcbHhsocEA==
X-Received: by 2002:a05:600c:1d90:: with SMTP id
 p16mr28102942wms.145.1640904770194; 
 Thu, 30 Dec 2021 14:52:50 -0800 (PST)
Received: from kali.home (2a01cb08896fec001e062303fcff6330.ipv6.abo.wanadoo.fr.
 [2a01:cb08:896f:ec00:1e06:2303:fcff:6330])
 by smtp.gmail.com with ESMTPSA id s10sm25554061wmr.30.2021.12.30.14.52.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Dec 2021 14:52:50 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 30 Dec 2021 23:52:04 +0100
Message-Id: <20211230225204.3080462-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/sslh: bump to version 1.22c
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
Cc: David Bachelart <david.bachelart@bbright.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- pcre2 is mandatory since version 1.22b and
  https://github.com/yrutschle/sslh/commit/37d275670345bc177d4081d7d348c0943f743132
- Drop patch (not needed anymore)

https://github.com/yrutschle/sslh/blob/v1.22c/ChangeLog

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...akefile-fix-static-linking-with-pcre.patch | 41 -------------------
 package/sslh/Config.in                        |  1 +
 package/sslh/sslh.hash                        |  2 +-
 package/sslh/sslh.mk                          | 10 +----
 4 files changed, 4 insertions(+), 50 deletions(-)
 delete mode 100644 package/sslh/0001-Makefile-fix-static-linking-with-pcre.patch

diff --git a/package/sslh/0001-Makefile-fix-static-linking-with-pcre.patch b/package/sslh/0001-Makefile-fix-static-linking-with-pcre.patch
deleted file mode 100644
index 5fc3296da5..0000000000
--- a/package/sslh/0001-Makefile-fix-static-linking-with-pcre.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From 0d9e004d324cc030c173de04c40db51a0f22bb5c Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Thu, 15 Oct 2020 07:58:05 +0200
-Subject: [PATCH] Makefile: fix static linking with pcre
-
-Static build with pcre is broken since version 1.19b and
-https://github.com/yrutschle/sslh/commit/cb90cc97ae64a445242e517847c6e44b7003eda4
-because -lpcre has been replaced by -lpcreposix which will result in
-the following static build failure:
-
-/srv/storage/autobuild/run/instance-1/output-1/host/bin/mipsel-linux-gcc -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os   -static -static -o echosrv echosrv.o probe.o common.o tls.o  -lpcreposix -lconfig -lcap
-/srv/storage/autobuild/run/instance-1/output-1/host/opt/ext-toolchain/bin/../lib/gcc/mipsel-buildroot-linux-uclibc/8.3.0/../../../../mipsel-buildroot-linux-uclibc/bin/ld: /srv/storage/autobuild/run/instance-1/output-1/host/mipsel-buildroot-linux-uclibc/sysroot/usr/lib/libpcreposix.a(libpcreposix_la-pcreposix.o): in function `regfree':
-pcreposix.c:(.text+0x120): undefined reference to `pcre_free'
-
-So append -lpcre after -lpcreposix
-
-Fixes:
- - http://autobuild.buildroot.org/results/a601824fc0c205a6a940e0f9f079ce2c39840605
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/yrutschle/sslh/pull/280]
----
- Makefile | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/Makefile b/Makefile
-index 986cf1c..ecadc22 100644
---- a/Makefile
-+++ b/Makefile
-@@ -43,7 +43,7 @@ endif
- 
- ifneq ($(strip $(USELIBPCRE)),)
- 	CPPFLAGS+=-DLIBPCRE
--	LIBS:=$(LIBS) -lpcreposix
-+	LIBS:=$(LIBS) -lpcreposix -lpcre
- endif
- 
- ifneq ($(strip $(USELIBCONFIG)),)
--- 
-2.28.0
-
diff --git a/package/sslh/Config.in b/package/sslh/Config.in
index f6b46f3218..a1d5211851 100644
--- a/package/sslh/Config.in
+++ b/package/sslh/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_SSLH
 	bool "sslh"
 	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_LIBCONFIG if BR2_PACKAGE_SYSTEMD
+	select BR2_PACKAGE_PCRE2
 	help
 	  Applicative protocol multiplexer
 
diff --git a/package/sslh/sslh.hash b/package/sslh/sslh.hash
index 00e5c12d77..ae678563da 100644
--- a/package/sslh/sslh.hash
+++ b/package/sslh/sslh.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  3bfe783726f82c1f5a4be630ddc494ebb08dbb69980662cd7ffdeb7bc9e1e706  sslh-v1.21c.tar.gz
+sha256  8e3742d14edf4119350cfdc7bb96b89134d9218eb6d2a6e1f70891ca18a649b1  sslh-v1.22c.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/sslh/sslh.mk b/package/sslh/sslh.mk
index 4bde143cd8..99fb6bf922 100644
--- a/package/sslh/sslh.mk
+++ b/package/sslh/sslh.mk
@@ -4,11 +4,12 @@
 #
 ################################################################################
 
-SSLH_VERSION = 1.21c
+SSLH_VERSION = 1.22c
 SSLH_SOURCE = sslh-v$(SSLH_VERSION).tar.gz
 SSLH_SITE = http://www.rutschle.net/tech/sslh
 SSLH_LICENSE = GPL-2.0+
 SSLH_LICENSE_FILES = COPYING
+SSLH_DEPENDENCIES = pcre2
 
 SSLH_MAKE_OPTS = $(TARGET_CONFIGURE_OPTS)
 
@@ -33,13 +34,6 @@ else
 SSLH_MAKE_OPTS += USELIBCONFIG=
 endif
 
-ifeq ($(BR2_PACKAGE_PCRE),y)
-SSLH_DEPENDENCIES += pcre
-SSLH_MAKE_OPTS += USELIBPCRE=1
-else
-SSLH_MAKE_OPTS += USELIBPCRE=
-endif
-
 ifeq ($(BR2_PACKAGE_SYSTEMD),y)
 SSLH_DEPENDENCIES += systemd
 SSLH_MAKE_OPTS += USESYSTEMD=1
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

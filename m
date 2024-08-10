Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF786C3DA7F
	for <buildroot@archiver.kernel.org>; Sat, 10 Aug 2024 06:14:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2E72F414CB;
	Sat, 10 Aug 2024 06:14:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jJVGcHBS4auS; Sat, 10 Aug 2024 06:14:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AAA4F414B4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AAA4F414B4;
	Sat, 10 Aug 2024 06:14:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id F1CA61BF860
 for <buildroot@lists.busybox.net>; Sat, 10 Aug 2024 06:14:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E8D0E4047C
 for <buildroot@lists.busybox.net>; Sat, 10 Aug 2024 06:14:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 57vMhMEc5wCb for <buildroot@lists.busybox.net>;
 Sat, 10 Aug 2024 06:14:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1828:2000:679::23; helo=helium.openadk.org;
 envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D02D540297
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D02D540297
Received: from helium.openadk.org (helium.openadk.org
 [IPv6:2a00:1828:2000:679::23])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D02D540297
 for <buildroot@buildroot.org>; Sat, 10 Aug 2024 06:14:22 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 79E54353B5CC; Sat, 10 Aug 2024 08:14:18 +0200 (CEST)
Date: Sat, 10 Aug 2024 08:14:18 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <ZrcFOqAT600add79@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 5.10.0-31-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1723270458; bh=XVERA/aziVDVnCdsoGneU9yRPmhvZQmAQNvEJMNVKIQ=;
 h=Date:From:To:Subject:From;
 b=mwNrTG48BE1LDTpiclGEJwmrVR0FaTs86ZaG5uEy+7mR3ers/lCieXtLtJnyPDQZW
 vhuzbPv0oXkmx1ou/voko5aR2fU64c2mXY6249U1dTlvtuDXf/m1zE3sioUcx5Mgwu
 otmegKPz+y8pISiW/KGDtnISrbsj9E/V7GXl/0RBT9zE1WR8zz3FmgzZA9pzOlxzlA
 ttr2qWY6C9cvf1krxXhcypGC0Gmm5qCO79nW+NmdidnURzqN0OtXWQYNBi/XsZ71vI
 oXsX8SADeEjSzvKq83KsLMqL5/R1CKhv0RIkDU8qCm08R3z03hkObAqrFm3Zle2iDa
 WpZl1lObJ37Ww==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256
 header.s=2022 header.b=mwNrTG48
Subject: [Buildroot] [PATCH] package/atop: update to 2.11.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

See here for a changelog:
https://atoptool.nl/downloadatop.php

Fixes:
 - http://autobuild.buildroot.net/results/4f2/4f256c96c8b7c34c1f1be378ad3a535d3150e44d

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 ...he-user-to-pass-additional-CFLAGS-an.patch | 21 +++++++++----------
 package/atop/atop.hash                        |  2 +-
 package/atop/atop.mk                          |  4 +++-
 3 files changed, 14 insertions(+), 13 deletions(-)

diff --git a/package/atop/0001-Makefile-allow-the-user-to-pass-additional-CFLAGS-an.patch b/package/atop/0001-Makefile-allow-the-user-to-pass-additional-CFLAGS-an.patch
index c4ec67ca24..0fc8f142b1 100644
--- a/package/atop/0001-Makefile-allow-the-user-to-pass-additional-CFLAGS-an.patch
+++ b/package/atop/0001-Makefile-allow-the-user-to-pass-additional-CFLAGS-an.patch
@@ -8,26 +8,25 @@ This is needed for some build systems. For example, Buildroot needs to
 disable optimizations on some CPU architectures.
 
 Upstream: https://github.com/Atoptool/atop/pull/314
+[Waldemar: rebase on top of 2.11.0]
+Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 ---
  Makefile | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/Makefile b/Makefile
-index a6f196b..dae5cda 100644
+index 3a63f69..ab44eaa 100644
 --- a/Makefile
 +++ b/Makefile
-@@ -20,8 +20,8 @@ PMPATH1  = /usr/lib/pm-utils/sleep.d
- PMPATH2  = /usr/lib64/pm-utils/sleep.d
+@@ -21,8 +21,8 @@ PMPATH2  = /usr/lib64/pm-utils/sleep.d
  PMPATHD  = /usr/lib/systemd/system-sleep
  
--CFLAGS  += -O2 -I. -Wall $(shell pkg-config --cflags glib-2.0)  -Wno-stringop-truncation -Wmissing-prototypes -Wmissing-declarations -Wformat-security # -DNOPERFEVENT   # -DHTTPSTATS
--LDFLAGS  = $(shell pkg-config --libs glib-2.0)
-+override CFLAGS  := -O2 -I. -Wall $(shell pkg-config --cflags glib-2.0)  -Wno-stringop-truncation -Wmissing-prototypes -Wmissing-declarations -Wformat-security $(CFLAGS) # -DNOPERFEVENT   # -DHTTPSTATS
-+override LDFLAGS  := $(shell pkg-config --libs glib-2.0) $(LDFLAGS)
+ PKG_CONFIG ?= pkg-config
+-CFLAGS  += -O2 -I. -Wall $(shell $(PKG_CONFIG) --cflags glib-2.0)  -Wno-stringop-truncation -Wmissing-prototypes -Wmissing-declarations -Wformat-security # -DNOPERFEVENT   # -DHTTPSTATS
+-LDFLAGS += $(shell $(PKG_CONFIG) --libs glib-2.0)
++override CFLAGS  += -O2 -I. -Wall $(shell $(PKG_CONFIG) --cflags glib-2.0)  -Wno-stringop-truncation -Wmissing-prototypes -Wmissing-declarations -Wformat-security # -DNOPERFEVENT   # -DHTTPSTATS
++override LDFLAGS += $(shell $(PKG_CONFIG) --libs glib-2.0)
  OBJMOD0  = version.o
  OBJMOD1  = various.o  deviate.o   procdbase.o
- OBJMOD2  = acctproc.o photoproc.o photosyst.o  rawlog.o ifprop.o parseable.o
--- 
-2.45.2
-
+ OBJMOD2  = acctproc.o photoproc.o photosyst.o cgroups.o rawlog.o ifprop.o parseable.o
diff --git a/package/atop/atop.hash b/package/atop/atop.hash
index a6539e6211..8774fb577d 100644
--- a/package/atop/atop.hash
+++ b/package/atop/atop.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256  e7a673cf2c82578e7dd82ecb0dec83fd9ecb30828b2561c28a9fa5aaf75d5f93  atop-2.10.0.tar.gz
+sha256  9b94c666602efff7bf402ecce706c347f38c39cb63498f9d39626861e5646e20  atop-2.11.0.tar.gz
 
 # Hash for license file:
 sha256  204d8eff92f95aac4df6c8122bc1505f468f3a901e5a4cc08940e0ede1938994  COPYING
diff --git a/package/atop/atop.mk b/package/atop/atop.mk
index b383932e8d..f72aa90908 100644
--- a/package/atop/atop.mk
+++ b/package/atop/atop.mk
@@ -4,13 +4,15 @@
 #
 ################################################################################
 
-ATOP_VERSION = 2.10.0
+ATOP_VERSION = 2.11.0
 ATOP_SITE = http://www.atoptool.nl/download
 ATOP_LICENSE = GPL-2.0+
 ATOP_LICENSE_FILES = COPYING
 ATOP_CPE_ID_VALID = YES
 ATOP_DEPENDENCIES = ncurses zlib libglib2 host-pkgconf
 
+ATOP_MAKE_FLAGS = PKG_CONFIG=$(PKG_CONFIG_HOST_BINARY)
+
 ATOP_CFLAGS = $(TARGET_CFLAGS)
 
 ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_85180),y)
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

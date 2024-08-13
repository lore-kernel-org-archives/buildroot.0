Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9FBFC52D7B
	for <buildroot@archiver.kernel.org>; Tue, 13 Aug 2024 04:35:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 12A0540672;
	Tue, 13 Aug 2024 04:35:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3mCCsnrcEpkI; Tue, 13 Aug 2024 04:35:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A2DE540663
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A2DE540663;
	Tue, 13 Aug 2024 04:35:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 43A4A1BF3B0
 for <buildroot@lists.busybox.net>; Tue, 13 Aug 2024 04:35:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 317E860831
 for <buildroot@lists.busybox.net>; Tue, 13 Aug 2024 04:35:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IGLRrWYXeJR8 for <buildroot@lists.busybox.net>;
 Tue, 13 Aug 2024 04:35:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.238.66.15;
 helo=helium.openadk.org; envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org F02A560751
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F02A560751
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F02A560751
 for <buildroot@buildroot.org>; Tue, 13 Aug 2024 04:35:45 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id BBBA135211D6; Tue, 13 Aug 2024 06:35:43 +0200 (CEST)
Date: Tue, 13 Aug 2024 06:35:43 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <Zrrin+t5g/czHuKA@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 5.10.0-31-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1723523743; bh=cTC+M9jEWn42dEA7/xwisr0ntJxIITxXj7MjUDwcO64=;
 h=Date:From:To:Subject:From;
 b=NE6MhiL+PWaZ1ATKSzOUygprBG+gZTugNStr+k0Ru+9+14GVRYBf8ml+iFHfpzdRx
 08tekPR75U5MaD1ek4e1x4LlFUjbXO6woy6gxqHc75R1jcL7ouZlSaXpZwfigmn95n
 RJ69MjJzvVnie7pdNl2TdXWu2jeXADIjqXRi3HgrsWwKxpG2HkxwTg5vuvkv/ZR8fW
 TN0bfoMVKNb5jWuyrOsx8yWQKagsPISEsf/eRuxeLGlYQvZY7/mAVsgNByK8tTfc5V
 Y0FniozofJoFsf9ygSFXpxu2pnYR69fhZeqZE/qMvQ+AQ7ygrXmwWGb2BJxkP/efZT
 ahga3V/KNvblQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256
 header.s=2022 header.b=NE6MhiL+
Subject: [Buildroot] [PATCH v2] package/atop: update to 2.11.0
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
v1->v2:
 - use $(TARGET_MAKE_ENV) to let atop find pkg-config, suggested by
   Thomas P.
---
 ...he-user-to-pass-additional-CFLAGS-an.patch | 21 +++++++++----------
 package/atop/atop.hash                        |  2 +-
 package/atop/atop.mk                          |  4 ++--
 3 files changed, 13 insertions(+), 14 deletions(-)

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
index b383932e8d..f7dfed5e8d 100644
--- a/package/atop/atop.mk
+++ b/package/atop/atop.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ATOP_VERSION = 2.10.0
+ATOP_VERSION = 2.11.0
 ATOP_SITE = http://www.atoptool.nl/download
 ATOP_LICENSE = GPL-2.0+
 ATOP_LICENSE_FILES = COPYING
@@ -18,7 +18,7 @@ ATOP_CFLAGS += -O0
 endif
 
 define ATOP_BUILD_CMDS
-	$(MAKE) $(TARGET_CONFIGURE_OPTS) CFLAGS="$(ATOP_CFLAGS)" \
+	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) CFLAGS="$(ATOP_CFLAGS)" \
 		-C $(@D)
 endef
 
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

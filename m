Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B20FC3DA4A
	for <buildroot@archiver.kernel.org>; Wed, 14 Aug 2024 21:47:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 25FCF608C3;
	Wed, 14 Aug 2024 21:47:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sxkvN-o47Y0e; Wed, 14 Aug 2024 21:47:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 671E1608F0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 671E1608F0;
	Wed, 14 Aug 2024 21:47:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9721B1BF4DB
 for <buildroot@lists.busybox.net>; Wed, 14 Aug 2024 21:47:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 82B274032D
 for <buildroot@lists.busybox.net>; Wed, 14 Aug 2024 21:47:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aKmTJlGEachH for <buildroot@lists.busybox.net>;
 Wed, 14 Aug 2024 21:47:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B6F894032C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B6F894032C
 for <buildroot@buildroot.org>; Wed, 14 Aug 2024 21:47:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A4CEF85D57; Wed, 14 Aug 2024 21:47:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 14 Aug 2024 23:46:52 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 67e6d0a3f1a0893183885b947f4472ef4c04bfc4
X-Git-Newrev: 1feac1fb883cc33d0976d22310f58738b478e533
X-Patchwork-Hint: ignore
Message-Id: <20240814214735.A4CEF85D57@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/atop: update to 2.11.0
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=1feac1fb883cc33d0976d22310f58738b478e533
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

See here for a changelog:
https://atoptool.nl/downloadatop.php

Fixes:
 - http://autobuild.buildroot.net/results/4f2/4f256c96c8b7c34c1f1be378ad3a535d3150e44d

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...llow-the-user-to-pass-additional-CFLAGS-an.patch | 21 ++++++++++-----------
 package/atop/atop.hash                              |  2 +-
 package/atop/atop.mk                                |  4 ++--
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
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

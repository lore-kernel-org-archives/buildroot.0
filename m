Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0CFEE7D26B
	for <buildroot@archiver.kernel.org>; Tue, 26 Sep 2023 09:12:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C8C1960A81;
	Tue, 26 Sep 2023 09:12:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C8C1960A81
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6aZ7Isy4ilDP; Tue, 26 Sep 2023 09:12:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1C7C161449;
	Tue, 26 Sep 2023 09:12:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1C7C161449
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 039F01BF969
 for <buildroot@lists.busybox.net>; Tue, 26 Sep 2023 09:12:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D10A060A81
 for <buildroot@lists.busybox.net>; Tue, 26 Sep 2023 09:12:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D10A060A81
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9A-8D9q4t1HI for <buildroot@lists.busybox.net>;
 Tue, 26 Sep 2023 09:12:03 +0000 (UTC)
Received: from smtpcmd0756.aruba.it (smtpcmd0756.aruba.it [62.149.156.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 484E3607C0
 for <buildroot@buildroot.org>; Tue, 26 Sep 2023 09:12:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 484E3607C0
Received: from localhost.localdomain ([146.241.127.78])
 by Aruba Outgoing Smtp  with ESMTPSA
 id l46pqeQaNDAHrl46qqH9VE; Tue, 26 Sep 2023 11:12:00 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Tue, 26 Sep 2023 11:11:58 +0200
Message-Id: <20230926091158.3767645-4-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230926091158.3767645-1-giulio.benetti@benettiengineering.com>
References: <20230926091158.3767645-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfOv1FuaCKyh6FlXHwcAkBphtIY7i6wu2Ny3O/TuDIEiTKTqbM30VwVvPdKdAB56SnoCbBOxE3g1W5S8cPm5L8+883txGn9x/7gVNupa55IC0yZJBgel8
 +gTgD482XnJxCv9bp9yghZVd+zWl1545v3Zog4zmhaJXTGdK2wumdi9YOH7iWRwzxEfC1tQ8BSnPR+dJtrkVGQSGzAHDbzirO4RpEY1ird92N9VOTqQTu3vV
 AfVtyK0cgAC4lGizVLUasEoWhYnn9fhIMvwswLivjcDDRcs7ZBWRm2xBdqewXZ87b++dlhxsuKAL6KLWHWEyPMylSvveG6Xdme25d/9zIYBnUhIwXsy65f0D
 0k+rvAe4PGp6yqun38Y4iHZQP8984p566nZ+yrTAFCIOVKobFwHJsVU/6ntJyf4gTmjvLdWxL1wejklA5PSijymS+45Qtg==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1695719521; bh=wnno1KTWOQxelG2beB5M0HK+cpnj0e7M8TMI348hSPI=;
 h=From:To:Subject:Date:MIME-Version;
 b=DRlc12HOjom78I/lQI6/raBJKHLOaT6tQg+bTFwVdiixa3auNrV2MM2rAQtNUX3yX
 WPCwTl66256HZQl6UsDZJiB42QfwLy1pwHkGrTEUauckF18FsEipbl8aTn4y/xD0cS
 kFKXwCSIAFfBISy1vn/HRVct6rPBzJJd38lNrKcfDnIGZ5+sgLwTq8xWbQA349KSb+
 N+mt/pJh4kCeYqETy3eiUWcpgtqlWV5ipQg1g6Da/b4LLOfKCSDid9s8mhc1lHxibu
 nlIXSfzE4u+wvUsI7j/l2R/ESkDyzDy9kzfFshWpIx4IyiPGlTwrRvKPwJwNJbBrG1
 D/fac2+54Qxow==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=DRlc12HO
Subject: [Buildroot] [PATCH v2 4/4] package/trace-cmd: bump to 3.1.7
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
Cc: Pierre Floury <pierre.floury@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Maxime Chevallier <maxime.chevallier@bootlin.com>

trace-cmd's dependencies 'libtracefs' and 'libtraceevent' were split
into dedicated projects, maintained outside of trace-cmd.

This release, on top of bumping the version, adds this new dependencies.

Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
[Giulio: bump to version 3.1.7]
Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
Giulio:
V1->V2:
* bump to version 3.1.7
---
 package/trace-cmd/Config.in      | 2 ++
 package/trace-cmd/trace-cmd.hash | 2 +-
 package/trace-cmd/trace-cmd.mk   | 6 ++++--
 3 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/package/trace-cmd/Config.in b/package/trace-cmd/Config.in
index 2d0accd7ae..00b9ebbd9a 100644
--- a/package/trace-cmd/Config.in
+++ b/package/trace-cmd/Config.in
@@ -4,6 +4,8 @@ config BR2_PACKAGE_TRACE_CMD
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	depends on BR2_USE_MMU # fork()
 	depends on !BR2_STATIC_LIBS # dlopen()
+	select BR2_PACKAGE_LIBTRACEEVENT
+	select BR2_PACKAGE_LIBTRACEFS
 	help
 	  Command line reader for ftrace.
 
diff --git a/package/trace-cmd/trace-cmd.hash b/package/trace-cmd/trace-cmd.hash
index 4d39e4d5ea..6edcaf0e1c 100644
--- a/package/trace-cmd/trace-cmd.hash
+++ b/package/trace-cmd/trace-cmd.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  a74d9ade2633b88d0ad199360d51996427e23f4835594133e456cd6e3bd3a651  trace-cmd-v2.9.7.tar.gz
+sha256  e496d41e599f8ef3c9a74675da05f86be0d8d48d524f0182c73ab98cd16da0b0  trace-cmd-v3.1.7.tar.gz
 sha256  b1d04b850c1c7471b0f0896f6c6f0fcfc9f07e2dd183a5f5826af269fe9e88fb  COPYING
 sha256  70f297763149e72306919c924e164f83041d5e512868d4c8c1826c171b3e49f9  COPYING.LIB
 sha256  f6b78c087c3ebdf0f3c13415070dd480a3f35d8fc76f3d02180a407c1c812f79  LICENSES/GPL-2.0
diff --git a/package/trace-cmd/trace-cmd.mk b/package/trace-cmd/trace-cmd.mk
index 52bb99036c..3d4d88c964 100644
--- a/package/trace-cmd/trace-cmd.mk
+++ b/package/trace-cmd/trace-cmd.mk
@@ -4,14 +4,14 @@
 #
 ################################################################################
 
-TRACE_CMD_VERSION = 2.9.7
+TRACE_CMD_VERSION = 3.1.7
 TRACE_CMD_SOURCE = trace-cmd-v$(TRACE_CMD_VERSION).tar.gz
 TRACE_CMD_SITE = \
 	https://git.kernel.org/pub/scm/utils/trace-cmd/trace-cmd.git/snapshot
 TRACE_CMD_LICENSE = GPL-2.0, LGPL-2.1
 TRACE_CMD_LICENSE_FILES = COPYING COPYING.LIB LICENSES/GPL-2.0 LICENSES/LGPL-2.1
 
-TRACE_CMD_DEPENDENCIES = host-pkgconf
+TRACE_CMD_DEPENDENCIES = host-pkgconf libtracefs libtraceevent
 TRACE_CMD_MAKE_OPTS = prefix=/usr etcdir=/etc
 
 ifeq ($(BR2_PACKAGE_AUDIT),y)
@@ -34,6 +34,8 @@ ifeq ($(BR2_sparc64),y)
 TRACE_CMD_CFLAGS += -fPIC
 endif
 
+TRACE_CMD_CFLAGS += $($(HOST_DIR)/bin/pkg-config --cflags libtracefs)
+
 # trace-cmd use CPPFLAGS to add some extra flags.
 # But like for CFLAGS, $(TARGET_CPPFLAGS) contains _LARGEFILE64_SOURCE
 # that causes build problems.
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

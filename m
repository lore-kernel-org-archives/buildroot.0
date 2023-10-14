Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAC0BCDB465
	for <buildroot@archiver.kernel.org>; Sat, 14 Oct 2023 21:58:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6A64681F9B;
	Sat, 14 Oct 2023 21:58:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6A64681F9B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LGIT-8RTUwoW; Sat, 14 Oct 2023 21:58:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 28F4281F8C;
	Sat, 14 Oct 2023 21:58:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 28F4281F8C
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 126D51BF83E
 for <buildroot@lists.busybox.net>; Sat, 14 Oct 2023 21:57:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DCF0F4094E
 for <buildroot@lists.busybox.net>; Sat, 14 Oct 2023 21:57:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DCF0F4094E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id j5eJawCO81di for <buildroot@lists.busybox.net>;
 Sat, 14 Oct 2023 21:57:47 +0000 (UTC)
Received: from smtpdh17-1.aruba.it (smtpdh17-1.aruba.it [62.149.155.116])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 08E3840961
 for <buildroot@buildroot.org>; Sat, 14 Oct 2023 21:57:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 08E3840961
Received: from localhost.localdomain ([146.241.127.78])
 by Aruba Outgoing Smtp  with ESMTPSA
 id rmdiq6C0m6PZFrmdjqeJjo; Sat, 14 Oct 2023 23:57:43 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sat, 14 Oct 2023 23:57:41 +0200
Message-Id: <20231014215741.716289-4-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231014215741.716289-1-giulio.benetti@benettiengineering.com>
References: <20231014215741.716289-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfDTBDC5btgH/FKL2LPsVUZ1Ix4HFQmX+D3+xwXEKQCtbu0GpEJmvNsHSQzwTYfX7iZXZnhUMmWiQCeP9tTPLEOOnJZyJI+DRvtkRiQGuLpb9T6PTb1Va
 KnEDeezeZZsOtpY0NS1/lGZsFIk7uj7HJtnEqUlePoPWaB4sT67EbuetIUdi5/RfNbUCfUuBM3O/Fc3la5HboFcGvXsZYwkj/vjI6syqwowrn3iSL485bcEf
 1dWEYQ17Tf9RZLYd+Tp4dOKuuL2xv/Ft4Po/Y6o47yA9/bkwLH+d4MPechnyB6/pVmkaR0oY1R9LRNs6IuS/rwHmO9Net97gQFX8vHL9Vr8QEWr5P6jva0pp
 L+y18cFu54Iu95JheFB13Qs21OhCC6nXf1nOn26XNB58d/H3dzwVKTTdzN+J+/SexgblWrfB0T4l4znB155J7lGmH8zu7Q==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1697320663; bh=QbR/Nf1yVD94sNTWcwX7rMeA/DHK4QATpD6vO7to+Tk=;
 h=From:To:Subject:Date:MIME-Version;
 b=VJ/mH6SX0EPHrYpGV3k0r8uG0A9a4W0Gjbgfd/CmNcn9/XOdMPDqPL9qfd8id+jej
 //PEno2Yv3MZHCFUTY2Jn1tVD06ysPMIBsUNclp/VUHQvu8NK0E1a+WA7Pff3Rc8Vp
 R/YcHFwG1/Pus7WEnlTJDSNwrO6RunFp7tACndr2jdYjTIHc6V0fKVeAnXBvlEWb/W
 yKpL8rZrxmhaYlqMJwMZhkev+HjanBetfXiGy/ThakyhPiPVF/lRmrfWnhJky32RgR
 dHoxPomFpLMoncRaQBYKFdbmsjgAnKAnMv7J4aT7zVNbqHsLBis9SWNMfFbQRwBrlt
 ++DqX1niFP6Mw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=VJ/mH6SX
Subject: [Buildroot] [PATCH v4 4/4] package/trace-cmd: bump to 3.1.7
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
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Pierre Floury <pierre.floury@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
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

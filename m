Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75A66C00A8F
	for <buildroot@archiver.kernel.org>; Tue, 24 Oct 2023 14:43:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 166104EED5;
	Tue, 24 Oct 2023 14:43:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 166104EED5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nqnUFy0ZVudc; Tue, 24 Oct 2023 14:43:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 39D514EEFC;
	Tue, 24 Oct 2023 14:43:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 39D514EEFC
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 26CB01BF2C4
 for <buildroot@lists.busybox.net>; Tue, 24 Oct 2023 14:43:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F3B00432FE
 for <buildroot@lists.busybox.net>; Tue, 24 Oct 2023 14:43:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F3B00432FE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oloLPtbRkQ05 for <buildroot@lists.busybox.net>;
 Tue, 24 Oct 2023 14:43:10 +0000 (UTC)
Received: from smtpcmd0642.aruba.it (smtpcmd0642.aruba.it [62.149.156.42])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 47D1443308
 for <buildroot@buildroot.org>; Tue, 24 Oct 2023 14:43:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 47D1443308
Received: from localhost.localdomain ([146.241.115.208])
 by Aruba Outgoing Smtp  with ESMTPSA
 id vIccqa0A1F9g1vIceq3zkS; Tue, 24 Oct 2023 16:43:08 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Tue, 24 Oct 2023 16:42:56 +0200
Message-Id: <20231024144256.2708299-4-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231024144256.2708299-1-giulio.benetti@benettiengineering.com>
References: <20231024144256.2708299-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfCfqDRGTjnV0/deiU1Ci/VzCZdfyy/C1FQfEvegVYRDH+NzQSIED1KHrg3JRIYysKpx6assReImtkb+NxYJzzbXVhnPGrfwXq3JISq+F6acIvSn9YAWw
 736nMUXKYNZ4v/2rOSUXB6DnD/HE1J859TFSuvV7uvad76d9xNbJ17d4VWeA8nxmPpX1JJXDdr/qAe50ANKoeUvrZYWje+4n+XY9L5I8HztF7qGsHuO0W8Ev
 j+u7jNQqAO+tzXGhsVuZGqYxoV5BRqLN3/ImfmCbkJiAjPECyi3bLF9dCpqV7RNOX1lbuxbJlm1w8EpCEiu2sJ4xAWI+cfjBxeS2ENVXrOJHIUr1vgnHvaYC
 Mj3PcJLST7Lhl4FxgVTp7UMQbzyQ/AjfGv23rsLZcd9occPpLuVUktgUEpi+VlKo6YX5YQnan+e/spvntkGt1iQJd6gYr7JTF47uj2qzrvje71bgD3U=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1698158588; bh=spJ7xi9imJ0QTEbdxi1TxPNW7LIaP9iNRSBk0Ui4IoA=;
 h=From:To:Subject:Date:MIME-Version;
 b=lBIxh2c+BF7sG4g40GmOq++W+tZG01Mhuc77zDVMcbRTJUIy8ZxzDHrt16c0PoGLE
 XRrqr4f3rBg9Dqx1bp93d+GnbBin4ZfL0b4xLO8uswRCb5NIpDqp7IICRPYHIBxJ9Q
 eX26i5Vb1GA1w20VwuoDe/M1gq9bXEr2sG/wyM7hQfyfniR8UMsaE7ruARt/4DX7TW
 8gGbmwN6L3iiBEtffWSuaLkRFh1sIfd1DbZusfL/KGoeXBdo1F+kA0y8ctKVTuXKKT
 gE8nw6zNttMz9u1dGpWQZW+0dk4bQlS4MgEd9IvB9IXpvrrOtMpgPW7/dEa0S239bQ
 ZrOrOFTUYUD8Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=lBIxh2c+
Subject: [Buildroot] [PATCH v5 4/4] package/trace-cmd: bump to 3.1.7
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
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Pierre Floury <pierre.floury@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Andreas Ziegler <br015@umbiko.net>
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

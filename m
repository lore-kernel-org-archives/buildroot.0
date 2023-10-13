Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C42CCDB47E
	for <buildroot@archiver.kernel.org>; Fri, 13 Oct 2023 20:38:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C9EF342093;
	Fri, 13 Oct 2023 20:38:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C9EF342093
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id g7bQncVvNQdS; Fri, 13 Oct 2023 20:38:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D68684208B;
	Fri, 13 Oct 2023 20:38:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D68684208B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AAD2E1BF33D
 for <buildroot@lists.busybox.net>; Fri, 13 Oct 2023 20:37:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EE14E60EF6
 for <buildroot@lists.busybox.net>; Fri, 13 Oct 2023 20:37:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EE14E60EF6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id W-2zedQ5RxkO for <buildroot@lists.busybox.net>;
 Fri, 13 Oct 2023 20:37:31 +0000 (UTC)
Received: from smtpdh16-1.aruba.it (smtpdh16-1.aruba.it [62.149.155.100])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D673760F0B
 for <buildroot@buildroot.org>; Fri, 13 Oct 2023 20:37:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D673760F0B
Received: from localhost.localdomain ([146.241.127.78])
 by Aruba Outgoing Smtp  with ESMTPSA
 id rOuVqO37yfJOlrOuWq58h1; Fri, 13 Oct 2023 22:37:28 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Fri, 13 Oct 2023 22:37:24 +0200
Message-Id: <20231013203724.120389-4-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231013203724.120389-1-giulio.benetti@benettiengineering.com>
References: <20231013203724.120389-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfDpXLKNZrU4ZFHdqMpKljQYE4rjw8jxdDYjrh3zo/Wtj/xxsWXZXEEZw4vxrXlEgv/U243bZn6fWGaVNYDpTgYECksvxdIdfMsl/IZwhKZMUz6tvzES7
 KOAN3UOYH9UYJXUcBUqnSgS3FBPBcUfn3OauTIEjRH3fSeWrH2boZNf3SAhiOnSgxevlzrgC53bOE+dYhPd+xbaQWOButo38o6FkLnSK0NdRgeflc1QZo6DR
 5aw1X10JAqAToA+K3UrOz3r1xpqT3Ck/yiU8XDQZC1D9iMDuI4Y79abRaPR8bGvJM20cPzRnjgFvJC37Teac7qs27g6UEXV1EnDLvLGhz+O6ciw3NjRLl1IX
 husK1u2hLHw9vjY/1jzP90/hAsXv+CKQPlGnBMHF5qomIOGP1w60zoKYHg6PPfC+V+aLB5FjNSuzyUCTzHDPnR6PGn/DxQ==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1697229448; bh=wnno1KTWOQxelG2beB5M0HK+cpnj0e7M8TMI348hSPI=;
 h=From:To:Subject:Date:MIME-Version;
 b=nUEPyIZxQUjRHhMoEykrYjEbrkZL/K036InS9dC1KratiyrGCFhRVqiS7BBaKl4/r
 l2DlrVD2DCbEvZl6QRX80hbTgKkS82IF+RLmW4EIz7lUD1T3GtiDVn/m+q3NuqZbUd
 C8M8Piv6qrFaM+rD571WjLmL0HnOkq9UwhRkO9wWSRz6VGcJL+xOucy9N0FUElIwUP
 WUhQIdgQN97eLEVxEzMw18wB9igY6AqifLhTKc9a4rC+AbZjqkwFkQ63uixywxrBsN
 ukoPKC/4pDUm70xNrsa0DFPl/RlkoF+bxQkOxLltU9/ZgfmO/y6C1y8x1DeWEohF7W
 k4TTUw/awVOcA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=nUEPyIZx
Subject: [Buildroot] [PATCH v3 4/4] package/trace-cmd: bump to 3.1.7
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Pierre Floury <pierre.floury@gmail.com>,
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

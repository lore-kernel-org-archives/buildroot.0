Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19FD1CDB47E
	for <buildroot@archiver.kernel.org>; Fri, 13 Oct 2023 20:37:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9CF9A42084;
	Fri, 13 Oct 2023 20:37:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9CF9A42084
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4uk88tvnuJSz; Fri, 13 Oct 2023 20:37:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id ED4D342083;
	Fri, 13 Oct 2023 20:37:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ED4D342083
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6FAEE1BF33D
 for <buildroot@lists.busybox.net>; Fri, 13 Oct 2023 20:37:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 47DE360F28
 for <buildroot@lists.busybox.net>; Fri, 13 Oct 2023 20:37:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 47DE360F28
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id e4_cYGDKH4cK for <buildroot@lists.busybox.net>;
 Fri, 13 Oct 2023 20:37:31 +0000 (UTC)
Received: from smtpdh16-1.aruba.it (smtpdh16-1.aruba.it [62.149.155.100])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 82DD160E2E
 for <buildroot@buildroot.org>; Fri, 13 Oct 2023 20:37:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 82DD160E2E
Received: from localhost.localdomain ([146.241.127.78])
 by Aruba Outgoing Smtp  with ESMTPSA
 id rOuVqO37yfJOlrOuWq58gf; Fri, 13 Oct 2023 22:37:28 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Fri, 13 Oct 2023 22:37:22 +0200
Message-Id: <20231013203724.120389-2-giulio.benetti@benettiengineering.com>
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
 t=1697229448; bh=3tI+X4ooAqL/3aQN4jg9QNw4GwIUDgC/XxYAJxpRT0Y=;
 h=From:To:Subject:Date:MIME-Version;
 b=musBXLTnw5EiOHa4MnCE8/bDAYdE/XLnvWde6su80YAcKhCZyYbfDaaXPg1zOFUzy
 bB7Q5su0AOnSobfsWsgnJXPjdFWnuGKRwxaNM0h9Kzb2TZf4HHEeyAGbsCnmQG2qVp
 p+E8ZnhSTlj7qDgZmw5iu0ac/IOeS1+9rQYEbQ5Q4CLjeATOPxM6AGz7leauhjjBdh
 5dXmC27Rkq4w+K2aQpHAcshd0pgi82C+lb7IA0/6R9eLKz6KCVZOR1a1wun63wJnTz
 lMAFiNGhkHgbXbr4jg2sp9ePFXun7NQk7/lHpxCLePPvoWXPWmifCJLJ84Pwc9MZty
 GtSJaFtmnBxaA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=musBXLTn
Subject: [Buildroot] [PATCH v3 2/4] package/libtracefs: new package
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

Introduce the libtracefs library, that used to be bundled with the
trace-cmd tool. This library is now used by several tools and libraries
such as trace-cmd and rtla, and is used as an interface to the ftrace
kernel subsystem through tracefs.

This package tries to install libraries in /usr/local/lib by default,
hence the redefinition of the "prefix" variable, so that the library
gets installed in "/usr/lib" instead.

The same applies to the pkgconfig handling of the proved Makefile, which
installs the .pc files in the /usr/local area by default, hence the
redefinition of the pkgconfig_dir to either the correct directory within the
staging area, or to empty value for the target to avoid installing the .pc
in that case.

Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
[Giulio: bump version to 1.7.0 and add hash file]
Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
Giulio:
V1->V2:
* bump to version 1.7.0
* add hash file
---
 DEVELOPERS                         |  1 +
 package/Config.in                  |  1 +
 package/libtracefs/Config.in       |  6 +++++
 package/libtracefs/libtracefs.hash |  4 ++++
 package/libtracefs/libtracefs.mk   | 35 ++++++++++++++++++++++++++++++
 5 files changed, 47 insertions(+)
 create mode 100644 package/libtracefs/Config.in
 create mode 100644 package/libtracefs/libtracefs.hash
 create mode 100644 package/libtracefs/libtracefs.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index e426f65cc2..8932c88953 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2113,6 +2113,7 @@ F:	package/timescaledb/
 
 N:	Maxime Chevallier <maxime.chevallier@bootlin.com>
 F:	package/libtraceevent/
+F:	package/libtracefs
 
 N:	Michael Durrant <mdurrant@arcturusnetworks.com>
 F:	board/arcturus/
diff --git a/package/Config.in b/package/Config.in
index 2b3d3e612f..821bd1b366 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -118,6 +118,7 @@ menu "Debugging, profiling and benchmark"
 	source "package/latencytop/Config.in"
 	source "package/libbpf/Config.in"
 	source "package/libtraceevent/Config.in"
+	source "package/libtracefs/Config.in"
 	source "package/lmbench/Config.in"
 	source "package/lsof/Config.in"
 	source "package/ltp-testsuite/Config.in"
diff --git a/package/libtracefs/Config.in b/package/libtracefs/Config.in
new file mode 100644
index 0000000000..92ce0986df
--- /dev/null
+++ b/package/libtracefs/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_LIBTRACEFS
+	bool "libtracefs"
+	select BR2_PACKAGE_LIBTRACEEVENT
+	help
+	  libtracefs is used to easily interface with the ftrace
+	  interface through the tracefs virtual filesystem.
diff --git a/package/libtracefs/libtracefs.hash b/package/libtracefs/libtracefs.hash
new file mode 100644
index 0000000000..676fcf1111
--- /dev/null
+++ b/package/libtracefs/libtracefs.hash
@@ -0,0 +1,4 @@
+# Locally computed
+sha256  411fcbf3434ecbaefa6c2b1bf092266293a672e2d7ee46fdd6b402753cb8bd16  libtracefs-1.7.0.tar.gz
+sha256  f6b78c087c3ebdf0f3c13415070dd480a3f35d8fc76f3d02180a407c1c812f79  GPL-2.0
+sha256  0b9a4febcdee6de55872501d5c1a8f5d8b0d1650cd4d5351995ceb22e889f8ca  LGPL-2.1
diff --git a/package/libtracefs/libtracefs.mk b/package/libtracefs/libtracefs.mk
new file mode 100644
index 0000000000..0b32b2102a
--- /dev/null
+++ b/package/libtracefs/libtracefs.mk
@@ -0,0 +1,35 @@
+################################################################################
+#
+# libtracefs
+#
+################################################################################
+
+LIBTRACEFS_VERSION = 1.7.0
+LIBTRACEFS_SITE = https://git.kernel.org/pub/scm/libs/libtrace/libtracefs.git/snapshot
+LIBTRACEFS_INSTALL_STAGING = YES
+LIBTRACEFS_LICENSE = GPL-2.0, LGPL-2.1
+LIBTRACEFS_LICENSE_FILES = LICENSES/GPL-2.0 LICENSES/LGPL-2.1
+
+LIBTRACEFS_DEPENDENCIES = host-pkgconf libtraceevent
+
+define LIBTRACEFS_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)
+endef
+
+define LIBTRACEFS_INSTALL_STAGING_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE1) -C $(@D) $(TARGET_CONFIGURE_OPTS) \
+	DESTDIR=$(STAGING_DIR) \
+	pkgconfig_dir="/usr/lib/pkgconfig" \
+	prefix="/usr" \
+	install
+endef
+
+define LIBTRACEFS_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE1) -C $(@D) $(TARGET_CONFIGURE_OPTS) \
+	DESTDIR=$(TARGET_DIR) \
+	pkgconfig_dir="" \
+	prefix="/usr" \
+	install
+endef
+
+$(eval $(generic-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

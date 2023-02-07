Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2B50C636D3
	for <buildroot@archiver.kernel.org>; Tue,  7 Feb 2023 22:10:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 94A5D6106A;
	Tue,  7 Feb 2023 22:10:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 94A5D6106A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XhejLxdj4YQk; Tue,  7 Feb 2023 22:10:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CD55261065;
	Tue,  7 Feb 2023 22:10:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CD55261065
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3A0781BF328
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 22:10:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 14DF1416DE
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 22:10:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 14DF1416DE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bqf4r8AGTCBd for <buildroot@lists.busybox.net>;
 Tue,  7 Feb 2023 22:10:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 06E79416D8
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 06E79416D8
 for <buildroot@buildroot.org>; Tue,  7 Feb 2023 22:10:17 +0000 (UTC)
Received: from b52572-12.ea.freescale.net.net (unknown [37.167.25.48])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 917AB780310;
 Tue,  7 Feb 2023 23:10:12 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Tue,  7 Feb 2023 23:09:40 +0100
Message-Id: <20230207220941.58066-4-ju.o@free.fr>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230207220941.58066-1-ju.o@free.fr>
References: <20230207220941.58066-1-ju.o@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1675807816;
 bh=lZJs7PeBMfwyaL6K4MJUwc/NN3jOgsm86M2UV36C47k=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=CbpIWWT86TpxpEZG/B90GbH8n2xuq8N9vXu/KxjVL4RxT2sp1rI4vCdVbqE7YPSEC
 DpbL820vs/qW17NiViZDD+/o4hWBqN9V9TAMxL+hX653gkzq8i9bQgSPD+si+4yTQE
 Vd39hhdvjvTqSh65RJB+bJ5ISNiU1SrSfe+iI868nKTknBkGdJRvIzkPvEbW8wjVuE
 5hhJ5n+iNIp33MQS0kcEZrHytq35Nb6zW1O/NXTo+4UUqp1jupIV8eVCl9yRQ1brN+
 MIBcYJS5DKizzB37629njSX8Awr+xbiOaqkTSHV9l4c3qVmRSNiex56adsk/yeK8Qv
 CUp8FEk09001Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=CbpIWWT8
Subject: [Buildroot] [PATCH 4/5] package/openmpi-examples: new package
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
Cc: Julien Olivain <ju.o@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is a "meta" package reusing definitions and files from openmpi.
Openmpi examples are shipped in the main library sources, including
build wrappers. The library and the wrappers need to be built and
installed in staging prior trying to compile an example. This purpose if
this package is to handle cleanly those dependencies.

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 DEVELOPERS                                    |  1 +
 package/Config.in                             |  1 +
 package/openmpi-examples/Config.in            |  8 +++++
 .../openmpi-examples/openmpi-examples.hash    |  1 +
 package/openmpi-examples/openmpi-examples.mk  | 29 +++++++++++++++++++
 5 files changed, 40 insertions(+)
 create mode 100644 package/openmpi-examples/Config.in
 create mode 120000 package/openmpi-examples/openmpi-examples.hash
 create mode 100644 package/openmpi-examples/openmpi-examples.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 156c5dac13..3d1c3a2a83 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1690,6 +1690,7 @@ F:	package/glslsandbox-player/
 F:	package/octave/
 F:	package/ola/
 F:	package/openmpi/
+F:	package/openmpi-examples/
 F:	package/perftest/
 F:	package/ptm2human/
 F:	package/python-distro/
diff --git a/package/Config.in b/package/Config.in
index 06d0a05854..e08511fd9a 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1961,6 +1961,7 @@ menu "Networking"
 	source "package/open62541/Config.in"
 	source "package/openldap/Config.in"
 	source "package/openmpi/Config.in"
+	source "package/openmpi-examples/Config.in"
 	source "package/openpgm/Config.in"
 	source "package/openzwave/Config.in"
 	source "package/ortp/Config.in"
diff --git a/package/openmpi-examples/Config.in b/package/openmpi-examples/Config.in
new file mode 100644
index 0000000000..caaa02d802
--- /dev/null
+++ b/package/openmpi-examples/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_OPENMPI_EXAMPLES
+	bool "openmpi-examples"
+	select BR2_PACKAGE_OPENMPI
+	help
+	  This package includes the hello_c example from openmpi. It
+	  is mainly used as a simple openmpi program to test the
+	  libraries. It is also a recipe example for cross compiling
+	  an openmpi program with the mpicc wrappers.
diff --git a/package/openmpi-examples/openmpi-examples.hash b/package/openmpi-examples/openmpi-examples.hash
new file mode 120000
index 0000000000..b8afe5e2d9
--- /dev/null
+++ b/package/openmpi-examples/openmpi-examples.hash
@@ -0,0 +1 @@
+../openmpi/openmpi.hash
\ No newline at end of file
diff --git a/package/openmpi-examples/openmpi-examples.mk b/package/openmpi-examples/openmpi-examples.mk
new file mode 100644
index 0000000000..be679333c7
--- /dev/null
+++ b/package/openmpi-examples/openmpi-examples.mk
@@ -0,0 +1,29 @@
+################################################################################
+#
+# openmpi-examples
+#
+################################################################################
+
+OPENMPI_EXAMPLES_VERSION = $(OPENMPI_VERSION)
+OPENMPI_EXAMPLES_SOURCE = $(OPENMPI_SOURCE)
+OPENMPI_EXAMPLES_DL_SUBDIR = openmpi
+OPENMPI_EXAMPLES_SITE = $(OPENMPI_SITE)
+OPENMPI_EXAMPLES_LICENSE = $(OPENMPI_LINCENSE)
+OPENMPI_EXAMPLES_LICENSE_FILES = $(OPENMPI_LICENSE_FILES)
+
+OPENMPI_EXAMPLES_DEPENDENCIES = openmpi
+
+define OPENMPI_EXAMPLES_BUILD_CMDS
+	$(TARGET_MAKE_ENV) PATH=$(STAGING_DIR)/usr/bin:$(BR_PATH) OPAL_DESTDIR=$(STAGING_DIR)/usr \
+	mpicc \
+		$(TARGET_CFLAGS) $(TARGET_LDFLAGS) \
+		-o $(@D)/examples/hello_c \
+		$(@D)/examples/hello_c.c
+endef
+
+define OPENMPI_EXAMPLES_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/examples/hello_c \
+		$(TARGET_DIR)/usr/bin/ompi_hello_c
+endef
+
+$(eval $(generic-package))
-- 
2.39.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

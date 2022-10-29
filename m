Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18368C433FE
	for <buildroot@archiver.kernel.org>; Sat, 29 Oct 2022 11:53:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AF0B0400F1;
	Sat, 29 Oct 2022 11:53:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AF0B0400F1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id stQQ3uCD3GUE; Sat, 29 Oct 2022 11:53:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A5884401A1;
	Sat, 29 Oct 2022 11:53:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A5884401A1
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BB0951BF3B8
 for <buildroot@lists.busybox.net>; Sat, 29 Oct 2022 11:53:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9669E8136F
 for <buildroot@lists.busybox.net>; Sat, 29 Oct 2022 11:53:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9669E8136F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rPGnuJcSbI0d for <buildroot@lists.busybox.net>;
 Sat, 29 Oct 2022 11:53:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E847F81369
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E847F81369
 for <buildroot@buildroot.org>; Sat, 29 Oct 2022 11:53:32 +0000 (UTC)
Received: from b52572-12.ea.freescale.net.net (unknown [37.169.148.146])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 4F67213F854;
 Sat, 29 Oct 2022 13:53:27 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 29 Oct 2022 13:53:21 +0200
Message-Id: <20221029115321.718694-1-ju.o@free.fr>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1667044410;
 bh=DWDoeFvwabOCHrQA0Yf0ISFynoJGq02HHnjG80Jd6ng=;
 h=From:To:Cc:Subject:Date:From;
 b=L/9HrTZfLhN6Xwp5xc+6lHrcWs+S0vNe8Exdd5BtZ8w+WSiCeZ5qpDoW9wyNBjvkw
 jI1WYmhGb99ZMDTXt267xeU8/pPMk+k84v+Q7bROjFDYwtMK9eB1RDe+nUWYeJQ3mU
 EGM/hWb9SWzj8qNUpZlFbz5RKuJRU5lBUwlXDQYSagkapo/bHQ3B1BXMyvzkLSRyIL
 DkkAfdgjndGo+k6e0KTraFTP6wJLTYfzwSKpMTnjb6GnGBGDaqoIJkeYR+/6GCu7Em
 LK77xAah4S3R1y7SqazCYv1sOLZf/HWh4pBQQSf0QSP6vD8p2wGgPoiRUGk8/N3FKj
 WHTR6z3H5UdPg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=L/9HrTZf
Subject: [Buildroot] [PATCH 1/1] package/tinycompress: new package
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

tinycompress is a library for compress audio offload in alsa.
It also contains the "cplay" and "crecord" programs.
tinycompress is part of the ALSA project.

https://www.alsa-project.org/

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Tested on master branch, commit 014ec19 with commands:

    make check-package
    ...
    0 warnings generated

    ./utils/test-pkg -a -p tinycompress
    ...
    44 builds, 3 skipped, 1 build failed, 0 legal-info failed, 0 show-info failed

Note:
The build failure is not related to this package. It is related to the
toolchain "bootlin-xtensa-uclibc" for which a fix was proposed in:
https://patchwork.ozlabs.org/project/buildroot/patch/20221010030937.6432-1-ju.o@free.fr/
---
 DEVELOPERS                                    |  1 +
 package/Config.in                             |  1 +
 ...-add-time.h-missing-header-inclusion.patch | 39 +++++++++++++++++++
 package/tinycompress/Config.in                | 10 +++++
 package/tinycompress/tinycompress.hash        |  5 +++
 package/tinycompress/tinycompress.mk          | 13 +++++++
 6 files changed, 69 insertions(+)
 create mode 100644 package/tinycompress/0001-wave-add-time.h-missing-header-inclusion.patch
 create mode 100644 package/tinycompress/Config.in
 create mode 100644 package/tinycompress/tinycompress.hash
 create mode 100644 package/tinycompress/tinycompress.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index dac8fefd0b..df6b3f7b42 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1684,6 +1684,7 @@ F:	package/python-distro/
 F:	package/python-gnupg/
 F:	package/python-pyalsa/
 F:	package/riscv-isa-sim/
+F:	package/tinycompress/
 F:	package/zynaddsubfx/
 F:	support/testing/tests/package/sample_python_distro.py
 F:	support/testing/tests/package/sample_python_gnupg.py
diff --git a/package/Config.in b/package/Config.in
index e4eb2b7434..d691471877 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -52,6 +52,7 @@ menu "Audio and video applications"
 	source "package/pulseaudio/Config.in"
 	source "package/sox/Config.in"
 	source "package/squeezelite/Config.in"
+	source "package/tinycompress/Config.in"
 	source "package/tovid/Config.in"
 	source "package/tstools/Config.in"
 	source "package/twolame/Config.in"
diff --git a/package/tinycompress/0001-wave-add-time.h-missing-header-inclusion.patch b/package/tinycompress/0001-wave-add-time.h-missing-header-inclusion.patch
new file mode 100644
index 0000000000..4068a54074
--- /dev/null
+++ b/package/tinycompress/0001-wave-add-time.h-missing-header-inclusion.patch
@@ -0,0 +1,39 @@
+From 7d3b8ac47789545af5a4cd2fc1cf9bcfb91ae3b0 Mon Sep 17 00:00:00 2001
+From: Julien Olivain <ju.o@free.fr>
+Date: Sat, 29 Oct 2022 12:51:17 +0200
+Subject: [PATCH] wave: add <time.h> missing header inclusion
+
+When compiling tinycompress with some libc other than glibc
+(e.g. musl libc), compilation fails with the following error:
+
+    In file included from wave.c:11:0:
+    /path/to/gcc/sysroot/usr/include/sound/asound.h:404:18: error: field 'trigger_tstamp' has incomplete type
+      struct timespec trigger_tstamp; /* time when stream was started/stopped/paused */
+    [...]
+
+According to POSIX, "struct timespec" is defined in <time.h>. See:
+https://pubs.opengroup.org/onlinepubs/9699919799/basedefs/time.h.html
+
+This patch fixes this build failure by including <time.h> prior
+<sound/asound.h>.
+
+Signed-off-by: Julien Olivain <ju.o@free.fr>
+---
+ src/utils/wave.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/utils/wave.c b/src/utils/wave.c
+index a74149a..d17f66a 100644
+--- a/src/utils/wave.c
++++ b/src/utils/wave.c
+@@ -8,6 +8,7 @@
+ #include <stdio.h>
+ #include <stdint.h>
+ #include <string.h>
++#include <time.h>
+ #include <sound/asound.h>
+ 
+ #include "tinycompress/tinywave.h"
+-- 
+2.38.1
+
diff --git a/package/tinycompress/Config.in b/package/tinycompress/Config.in
new file mode 100644
index 0000000000..aff1943c78
--- /dev/null
+++ b/package/tinycompress/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_TINYCOMPRESS
+	bool "tinycompress"
+	depends on !BR2_STATIC_LIBS # dlfcn.h
+	help
+	  tinycompress is a library for compress audio offload in alsa.
+
+	  https://www.alsa-project.org/
+
+comment "tinycompress needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
diff --git a/package/tinycompress/tinycompress.hash b/package/tinycompress/tinycompress.hash
new file mode 100644
index 0000000000..164f3a36c3
--- /dev/null
+++ b/package/tinycompress/tinycompress.hash
@@ -0,0 +1,5 @@
+# Locally calculated after checking pgp signature
+sha256  2f897e5112cd3bca6790b5cecfda6e0662c8bc5ee0fbab972b247a0cc620d66c  tinycompress-1.2.8.tar.bz2
+
+# Locally calculated
+sha256  912ea37a4435594a3b3c35f04efa4b5b7af2e68a05f5319c16c881711a31e4b7  COPYING
diff --git a/package/tinycompress/tinycompress.mk b/package/tinycompress/tinycompress.mk
new file mode 100644
index 0000000000..062233ec80
--- /dev/null
+++ b/package/tinycompress/tinycompress.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# tinycompress
+#
+################################################################################
+
+TINYCOMPRESS_VERSION = 1.2.8
+TINYCOMPRESS_SOURCE = tinycompress-$(TINYCOMPRESS_VERSION).tar.bz2
+TINYCOMPRESS_SITE = https://www.alsa-project.org/files/pub/tinycompress
+TINYCOMPRESS_LICENSE = BSD-3-Clause and LGPL-2.1
+TINYCOMPRESS_LICENSE_FILES = COPYING
+
+$(eval $(autotools-package))
-- 
2.38.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D77FECAAA1
	for <buildroot@archiver.kernel.org>; Sun, 30 Oct 2022 19:24:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C59E94046D;
	Sun, 30 Oct 2022 19:24:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C59E94046D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mTKfHjZrI9Jw; Sun, 30 Oct 2022 19:24:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CEF7B40182;
	Sun, 30 Oct 2022 19:24:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CEF7B40182
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D94E11BF2A1
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 19:24:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B3D0681279
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 19:24:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B3D0681279
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EvQJyX6yjMMc for <buildroot@lists.busybox.net>;
 Sun, 30 Oct 2022 19:24:51 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id A52AB81275
 for <buildroot@buildroot.org>; Sun, 30 Oct 2022 19:24:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A52AB81275
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8F07D875D0; Sun, 30 Oct 2022 19:24:51 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 30 Oct 2022 20:22:13 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 68b68518a8cc372cd6bfb34414a91311e7266044
X-Git-Newrev: 2f02d159bb9eceabc1d0a3a4ffee97e726aad21d
X-Patchwork-Hint: ignore
Message-Id: <20221030192451.8F07D875D0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/tinycompress: new package
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=2f02d159bb9eceabc1d0a3a4ffee97e726aad21d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

tinycompress is a library for compress audio offload in alsa.
It also contains the "cplay" and "crecord" programs.
tinycompress is part of the ALSA project.

https://www.alsa-project.org/

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 DEVELOPERS                                         |  1 +
 package/Config.in                                  |  1 +
 ...-wave-add-time.h-missing-header-inclusion.patch | 39 ++++++++++++++++++++++
 package/tinycompress/Config.in                     | 10 ++++++
 package/tinycompress/tinycompress.hash             |  5 +++
 package/tinycompress/tinycompress.mk               | 13 ++++++++
 6 files changed, 69 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index c4d23cd293..46c2820c4e 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1685,6 +1685,7 @@ F:	package/python-distro/
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

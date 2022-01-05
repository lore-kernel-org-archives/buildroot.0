Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7518EC433F5
	for <buildroot@archiver.kernel.org>; Wed,  5 Jan 2022 22:03:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0F706400B8;
	Wed,  5 Jan 2022 22:03:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8QwwYVxfEbPJ; Wed,  5 Jan 2022 22:03:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E3D2440102;
	Wed,  5 Jan 2022 22:03:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D21221BF3A3
 for <buildroot@lists.busybox.net>; Wed,  5 Jan 2022 22:03:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CD64D60D89
 for <buildroot@lists.busybox.net>; Wed,  5 Jan 2022 22:03:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hIRIGcLt5dNM for <buildroot@lists.busybox.net>;
 Wed,  5 Jan 2022 22:03:34 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E8A3660D7F
 for <buildroot@buildroot.org>; Wed,  5 Jan 2022 22:03:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id A43E382AE0; Wed,  5 Jan 2022 21:57:28 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Wed, 5 Jan 2022 23:03:24 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ae2c55df06e2163b6094b72775180c3a3afc4250
X-Git-Newrev: 8e065065777e2955f385ae51b14c9f284b83e477
X-Patchwork-Hint: ignore
Message-Id: <20220105215728.A43E382AE0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/bmx7: new package
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
Content-Type: multipart/mixed; boundary="===============0636928089699141152=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0636928089699141152==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=8e065065777e2955f385ae51b14c9f284b83e477
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch will provide an initial package for bmx7 project.

Signed-off-by: José Pekkarinen <jose.pekkarinen@unikie.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                         |  1 +
 package/Config.in                                  |  1 +
 ...dule.c-378-36-error-SIOCGSTAMP-undeclared.patch | 28 +++++++++++++++++
 package/bmx7/0002-Fix-linking-error.patch          | 29 ++++++++++++++++++
 ...eorder-includes-to-avoid-ethhdr-collision.patch | 35 ++++++++++++++++++++++
 package/bmx7/Config.in                             | 15 ++++++++++
 package/bmx7/bmx7.hash                             |  3 ++
 package/bmx7/bmx7.mk                               | 21 +++++++++++++
 8 files changed, 133 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 37c792816a..4cb07b6d9a 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1485,6 +1485,7 @@ F:	package/zfs/
 F:	support/testing/tests/package/test_zfs.py
 
 N:	José Pekkarinen <jose.pekkarinen@unikie.com>
+F:	package/bmx7/
 F:	package/softhsm2/
 
 N:	Joseph Kogut <joseph.kogut@gmail.com>
diff --git a/package/Config.in b/package/Config.in
index 7148639735..d90fb5c450 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2145,6 +2145,7 @@ endif
 	source "package/bluez-tools/Config.in"
 	source "package/bluez5_utils/Config.in"
 	source "package/bmon/Config.in"
+	source "package/bmx7/Config.in"
 	source "package/boinc/Config.in"
 	source "package/brcm-patchram-plus/Config.in"
 	source "package/bridge-utils/Config.in"
diff --git a/package/bmx7/0001-Fix-schedule.c-378-36-error-SIOCGSTAMP-undeclared.patch b/package/bmx7/0001-Fix-schedule.c-378-36-error-SIOCGSTAMP-undeclared.patch
new file mode 100644
index 0000000000..d627cf6165
--- /dev/null
+++ b/package/bmx7/0001-Fix-schedule.c-378-36-error-SIOCGSTAMP-undeclared.patch
@@ -0,0 +1,28 @@
+From f16fa9796e05ca9ea6ee764b3c1f0b8baed535e8 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Jos=C3=A9=20Pekkarinen?= <jose.pekkarinen@unikie.com>
+Date: Fri, 10 Dec 2021 14:35:45 +0200
+Subject: [PATCH] Fix schedule.c:378:36: error: 'SIOCGSTAMP' undeclared
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Signed-off-by: José Pekkarinen <jose.pekkarinen@unikie.com>
+---
+ src/schedule.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/schedule.c b/src/schedule.c
+index 8868b01..09ab248 100644
+--- a/src/schedule.c
++++ b/src/schedule.c
+@@ -23,6 +23,7 @@
+ #include <fcntl.h>
+ #include <sys/ioctl.h>
+ #include <sys/socket.h>
++#include <linux/sockios.h>
+ 
+ 
+ #include "list.h"
+-- 
+2.30.2
+
diff --git a/package/bmx7/0002-Fix-linking-error.patch b/package/bmx7/0002-Fix-linking-error.patch
new file mode 100644
index 0000000000..04354c6a0a
--- /dev/null
+++ b/package/bmx7/0002-Fix-linking-error.patch
@@ -0,0 +1,29 @@
+From 974541b80bf8d7ec78ed9214a1b541957670f9cd Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Jos=C3=A9=20Pekkarinen?= <jose.pekkarinen@unikie.com>
+Date: Fri, 10 Dec 2021 14:36:55 +0200
+Subject: [PATCH] Fix linking error
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Signed-off-by: José Pekkarinen <jose.pekkarinen@unikie.com>
+---
+ src/bmx.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/bmx.h b/src/bmx.h
+index 4269903..7789f7f 100644
+--- a/src/bmx.h
++++ b/src/bmx.h
+@@ -290,7 +290,7 @@ enum ADGSN {
+ #define SUCCESS 0
+ #define FAILURE -1
+ 
+-const void* FAILURE_PTR;
++extern const void* FAILURE_PTR;
+ 
+ 
+ #define MAX_SELECT_TIMEOUT_MS 1100 /* MUST be smaller than (1000/2) to fit into max tv_usec */
+-- 
+2.30.2
+
diff --git a/package/bmx7/0003-Reorder-includes-to-avoid-ethhdr-collision.patch b/package/bmx7/0003-Reorder-includes-to-avoid-ethhdr-collision.patch
new file mode 100644
index 0000000000..75cc392513
--- /dev/null
+++ b/package/bmx7/0003-Reorder-includes-to-avoid-ethhdr-collision.patch
@@ -0,0 +1,35 @@
+From fc13da06c1de4d085e21dc2bf45e1e95eb6145d9 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Jos=C3=A9=20Pekkarinen?= <jose.pekkarinen@unikie.com>
+Date: Fri, 10 Dec 2021 14:37:37 +0200
+Subject: [PATCH] Reorder includes to avoid ethhdr collision
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Signed-off-by: José Pekkarinen <jose.pekkarinen@unikie.com>
+---
+ src/ip.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/ip.c b/src/ip.c
+index cd50074..4198e92 100644
+--- a/src/ip.c
++++ b/src/ip.c
+@@ -43,13 +43,13 @@
+ #include <net/if_arp.h>
+ #include <linux/if_tunnel.h>
+ 
+-#include <linux/if_tun.h> /* TUNSETPERSIST, ... */
+ #include <linux/ip6_tunnel.h>
+ 
+ #ifndef BMX7_LIB_IWINFO
+ #define BMX7_LIB_IW
+ #include <iwlib.h>
+ #endif
++#include <linux/if_tun.h> /* TUNSETPERSIST, ... */
+ //#include <iwlib.h>
+ // apt-get install libiw-dev
+ //#include <math.h>
+-- 
+2.30.2
+
diff --git a/package/bmx7/Config.in b/package/bmx7/Config.in
new file mode 100644
index 0000000000..6fa6a07997
--- /dev/null
+++ b/package/bmx7/Config.in
@@ -0,0 +1,15 @@
+config BR2_PACKAGE_BMX7
+	bool "bmx7"
+	depends on !BR2_STATIC_LIBS # dlopen()
+	select BR2_PACKAGE_ZLIB
+	select BR2_PACKAGE_MBEDTLS
+	select BR2_PACKAGE_WIRELESS_TOOLS
+	select BR2_PACKAGE_WIRELESS_TOOLS_LIB
+	help
+	  BMX7 is a mesh routing protocol for Linux based
+	  operating systems.
+
+	  https://github.com/bmx-routing/bmx7
+
+comment "bmx7 needs a toolchain with dynamic library support"
+	depends on BR2_STATIC_LIBS
diff --git a/package/bmx7/bmx7.hash b/package/bmx7/bmx7.hash
new file mode 100644
index 0000000000..39203c979f
--- /dev/null
+++ b/package/bmx7/bmx7.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  5f88df1c95e5cb842a6016bb1604e3e7f6097c63c5c9916edc3c84e96d4f5f65  bmx7-7.1.1.tar.gz
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
diff --git a/package/bmx7/bmx7.mk b/package/bmx7/bmx7.mk
new file mode 100644
index 0000000000..54a9cc8eb5
--- /dev/null
+++ b/package/bmx7/bmx7.mk
@@ -0,0 +1,21 @@
+################################################################################
+#
+# bmx7
+#
+################################################################################
+
+BMX7_VERSION = 7.1.1
+BMX7_SITE = $(call github,bmx-routing,bmx7,v$(BMX7_VERSION))
+BMX7_LICENSE = GPL-2.0
+BMX7_LICENSE_FILES = LICENSE
+BMX7_DEPENDENCIES = zlib mbedtls wireless_tools
+
+define BMX7_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)/$(d)/src
+endef
+
+define BMX7_INSTALL_TARGET_CMDS
+	$(INSTALL) -m 0755 -D $(@D)/src/bmx7 $(TARGET_DIR)/usr/bin/bmx7
+endef
+
+$(eval $(generic-package))

--===============0636928089699141152==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0636928089699141152==--

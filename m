Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97022C3DA61
	for <buildroot@archiver.kernel.org>; Mon, 29 Jul 2024 20:41:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 074F8606D0;
	Mon, 29 Jul 2024 20:41:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BL64CvKN3L-E; Mon, 29 Jul 2024 20:41:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B61D8608B0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B61D8608B0;
	Mon, 29 Jul 2024 20:41:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0DCC01BF427
 for <buildroot@lists.busybox.net>; Mon, 29 Jul 2024 20:41:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EE21781088
 for <buildroot@lists.busybox.net>; Mon, 29 Jul 2024 20:41:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9NJHP_bSor0v for <buildroot@lists.busybox.net>;
 Mon, 29 Jul 2024 20:41:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CEF0481087
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id CEF0481087
 for <buildroot@buildroot.org>; Mon, 29 Jul 2024 20:41:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7FDE2834E7; Mon, 29 Jul 2024 20:41:31 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 29 Jul 2024 22:40:34 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ee72631572ead69685e9a84f7fdd3d99d63b1514
X-Git-Newrev: c70e0c08c7ad516b4fd20bf92dc1435ecbea94b4
X-Patchwork-Hint: ignore
Message-Id: <20240729204131.7FDE2834E7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/openconnect: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=c70e0c08c7ad516b4fd20bf92dc1435ecbea94b4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Build-tested using these defconfigs

BR2_PACKAGE_OPENSSL=y
BR2_PACKAGE_LIBOPENSSL=y
BR2_PACKAGE_OPENCONNECT=y

                             arm-aarch64 [ 1/41]: OK
                   bootlin-aarch64-glibc [ 2/41]: OK
               bootlin-arcle-hs38-uclibc [ 3/41]: OK
                    bootlin-armv5-uclibc [ 4/41]: OK
                     bootlin-armv7-glibc [ 5/41]: OK
                   bootlin-armv7m-uclibc [ 6/41]: SKIPPED
                      bootlin-armv7-musl [ 7/41]: OK
                bootlin-m68k-5208-uclibc [ 8/41]: SKIPPED
               bootlin-m68k-68040-uclibc [ 9/41]: OK
             bootlin-microblazeel-uclibc [10/41]: OK
                bootlin-mipsel32r6-glibc [11/41]: OK
                   bootlin-mipsel-uclibc [12/41]: OK
                     bootlin-nios2-glibc [13/41]: OK
                 bootlin-openrisc-uclibc [14/41]: OK
        bootlin-powerpc64le-power8-glibc [15/41]: OK
           bootlin-powerpc-e500mc-uclibc [16/41]: OK
                   bootlin-riscv32-glibc [17/41]: OK
                   bootlin-riscv64-glibc [18/41]: OK
                    bootlin-riscv64-musl [19/41]: OK
                 bootlin-s390x-z13-glibc [20/41]: OK
                      bootlin-sh4-uclibc [21/41]: OK
                   bootlin-sparc64-glibc [22/41]: OK
                    bootlin-sparc-uclibc [23/41]: OK
                    bootlin-x86-64-glibc [24/41]: OK
                     bootlin-x86-64-musl [25/41]: OK
                   bootlin-x86-64-uclibc [26/41]: OK
                   bootlin-x86-i686-musl [27/41]: OK
                   bootlin-xtensa-uclibc [28/41]: OK
                            br-arm-basic [29/41]: OK
                    br-arm-full-nothread [30/41]: OK
                      br-arm-full-static [31/41]: OK
                   br-i386-pentium4-full [32/41]: OK
                      br-mips64-n64-full [33/41]: OK
                 br-mips64r6-el-hf-glibc [34/41]: OK
               br-powerpc-603e-basic-cpp [35/41]: OK
               br-powerpc64-power7-glibc [36/41]: OK
                       linaro-aarch64-be [37/41]: OK
                          linaro-aarch64 [38/41]: OK
                              linaro-arm [39/41]: OK
                         sourcery-mips64 [40/41]: OK
                           sourcery-mips [41/41]: OK
41 builds, 2 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed

BR2_PACKAGE_GNUTLS=y
BR2_PACKAGE_OPENCONNECT=y

                             arm-aarch64 [ 1/41]: OK
                   bootlin-aarch64-glibc [ 2/41]: OK
               bootlin-arcle-hs38-uclibc [ 3/41]: OK
                    bootlin-armv5-uclibc [ 4/41]: OK
                     bootlin-armv7-glibc [ 5/41]: OK
                   bootlin-armv7m-uclibc [ 6/41]: SKIPPED
                      bootlin-armv7-musl [ 7/41]: OK
                bootlin-m68k-5208-uclibc [ 8/41]: SKIPPED
               bootlin-m68k-68040-uclibc [ 9/41]: OK
             bootlin-microblazeel-uclibc [10/41]: OK
                bootlin-mipsel32r6-glibc [11/41]: OK
                   bootlin-mipsel-uclibc [12/41]: OK
                     bootlin-nios2-glibc [13/41]: OK
                 bootlin-openrisc-uclibc [14/41]: OK
        bootlin-powerpc64le-power8-glibc [15/41]: OK
           bootlin-powerpc-e500mc-uclibc [16/41]: OK
                   bootlin-riscv32-glibc [17/41]: OK
                   bootlin-riscv64-glibc [18/41]: OK
                    bootlin-riscv64-musl [19/41]: OK
                 bootlin-s390x-z13-glibc [20/41]: OK
                      bootlin-sh4-uclibc [21/41]: OK
                   bootlin-sparc64-glibc [22/41]: OK
                    bootlin-sparc-uclibc [23/41]: OK
                    bootlin-x86-64-glibc [24/41]: OK
                     bootlin-x86-64-musl [25/41]: OK
                   bootlin-x86-64-uclibc [26/41]: OK
                   bootlin-x86-i686-musl [27/41]: OK
                   bootlin-xtensa-uclibc [28/41]: OK
                            br-arm-basic [29/41]: SKIPPED
                    br-arm-full-nothread [30/41]: OK
                      br-arm-full-static [31/41]: SKIPPED
                   br-i386-pentium4-full [32/41]: OK
                      br-mips64-n64-full [33/41]: OK
                 br-mips64r6-el-hf-glibc [34/41]: OK
               br-powerpc-603e-basic-cpp [35/41]: SKIPPED
               br-powerpc64-power7-glibc [36/41]: OK
                       linaro-aarch64-be [37/41]: OK
                          linaro-aarch64 [38/41]: OK
                              linaro-arm [39/41]: OK
                         sourcery-mips64 [40/41]: OK
                           sourcery-mips [41/41]: OK

41 builds, 5 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                         |  1 +
 package/Config.in                                  |  1 +
 ...x-implicit-declaration-of-function-malloc.patch | 40 ++++++++++++++++++++++
 package/openconnect/Config.in                      | 19 ++++++++++
 package/openconnect/openconnect.hash               |  3 ++
 package/openconnect/openconnect.mk                 | 32 +++++++++++++++++
 6 files changed, 96 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 78ea65205d..16f63bdc0e 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -465,6 +465,7 @@ F:	package/mjpg-streamer/
 F:	package/mpg123/
 F:	package/ntp/
 F:	package/nut/
+F:	package/openconnect/
 F:	package/openvpn/
 F:	package/opus/
 F:	package/pciutils/
diff --git a/package/Config.in b/package/Config.in
index 90f1ecc877..3e51ddd707 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2555,6 +2555,7 @@ endif
 	source "package/open-iscsi/Config.in"
 	source "package/open-lldp/Config.in"
 	source "package/open-plc-utils/Config.in"
+	source "package/openconnect/Config.in"
 	source "package/openntpd/Config.in"
 	source "package/openobex/Config.in"
 	source "package/openresolv/Config.in"
diff --git a/package/openconnect/0001-Fix-implicit-declaration-of-function-malloc.patch b/package/openconnect/0001-Fix-implicit-declaration-of-function-malloc.patch
new file mode 100644
index 0000000000..4732c4fb5e
--- /dev/null
+++ b/package/openconnect/0001-Fix-implicit-declaration-of-function-malloc.patch
@@ -0,0 +1,40 @@
+From 5185f640045df2b4f8ee7f028fc59e6f02fdf367 Mon Sep 17 00:00:00 2001
+From: Brahmajit Das <brahmajit.xyz@gmail.com>
+Date: Mon, 29 Jan 2024 23:28:53 +0530
+Subject: [PATCH] Fix implicit declaration of function 'malloc'
+
+First observed on Gentoo Linux with GCC 14. This is due to GCC 14
+enabling -Werror=implicit-function-declaration by default.
+Thus resulting in errors such as:
+
+openconnect-internal.h: In function 'alloc_pkt':
+openconnect-internal.h:911:27: error: implicit declaration of function 'malloc' [-Werror=implicit-function-declaration]
+  911 |         struct pkt *pkt = malloc(alloc_len);
+      |                           ^~~~~~
+
+Plese refer gentoo bug: https://bugs.gentoo.org/923173
+Signed-off-by: Brahmajit Das <brahmajit.xyz@gmail.com>
+
+Upstream: https://gitlab.com/openconnect/openconnect/-/commit/5185f640045df2b4f8ee7f028fc59e6f02fdf367
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+[rebased for 9.12]
+---
+ openconnect-internal.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/openconnect-internal.h b/openconnect-internal.h
+index 21460adf6..2830d693f 100644
+--- a/openconnect-internal.h
++++ b/openconnect-internal.h
+@@ -87,6 +87,7 @@
+ 
+ #include <libxml/tree.h>
+ #include <zlib.h>
++#include <stdlib.h>
+ 
+ #ifdef _WIN32
+ #ifndef _Out_cap_c_
+-- 
+GitLab
+
diff --git a/package/openconnect/Config.in b/package/openconnect/Config.in
new file mode 100644
index 0000000000..cacf617fb9
--- /dev/null
+++ b/package/openconnect/Config.in
@@ -0,0 +1,19 @@
+config BR2_PACKAGE_OPENCONNECT
+	bool "openconnect"
+	depends on BR2_USE_MMU # fork()
+	select BR2_PACKAGE_OPENSSL if !BR2_PACKAGE_GNUTLS
+	# configure: error: LibreSSL does not support Cisco DTLS.
+	select BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL if !BR2_PACKAGE_GNUTLS
+	select BR2_PACKAGE_LIBOPENSSL_ENABLE_RC4 if !BR2_PACKAGE_GNUTLS
+	select BR2_PACKAGE_LIBOPENSSL_ENABLE_DES if !BR2_PACKAGE_GNUTLS
+	select BR2_PACKAGE_LIBXML2
+	select BR2_PACKAGE_ZLIB
+	help
+	  OpenConnect is an SSL VPN client initially created to support
+	  Cisco's AnyConnect SSL VPN.
+	  It has since been ported to support the Juniper SSL VPN (which
+	  is now known as Pulse Connect Secure), the Palo Alto Networks
+	  GlobalProtect SSL VPN the F5 Big-IP SSL VPN, and the Fortinet
+	  FortiGate SSL VPN.
+
+	  https://www.infradead.org/openconnect/
diff --git a/package/openconnect/openconnect.hash b/package/openconnect/openconnect.hash
new file mode 100644
index 0000000000..86bdaa5d4e
--- /dev/null
+++ b/package/openconnect/openconnect.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  a2bedce3aa4dfe75e36e407e48e8e8bc91d46def5335ac9564fbf91bd4b2413e  openconnect-9.12.tar.gz
+sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LGPL
diff --git a/package/openconnect/openconnect.mk b/package/openconnect/openconnect.mk
new file mode 100644
index 0000000000..3fd9f990b0
--- /dev/null
+++ b/package/openconnect/openconnect.mk
@@ -0,0 +1,32 @@
+################################################################################
+#
+# openconnect
+#
+################################################################################
+
+OPENCONNECT_VERSION = 9.12
+OPENCONNECT_SITE = https://www.infradead.org/openconnect/download
+OPENCONNECT_DEPENDENCIES = host-pkgconf libxml2 zlib
+OPENCONNECT_LICENSE = LGPL-2.1
+OPENCONNECT_LICENSE_FILES = COPYING.LGPL
+OPENCONNECT_CONF_OPTS = \
+	--disable-dsa-tests \
+	--with-vpnc-script=/etc/vpnc/vpnc-script \
+	--without-java
+
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+OPENCONNECT_DEPENDENCIES += openssl
+OPENCONNECT_CONF_OPTS += --without-gnutls --with-openssl
+else ifeq ($(BR2_PACKAGE_GNUTLS),y)
+OPENCONNECT_DEPENDENCIES += gnutls
+OPENCONNECT_CONF_OPTS += --with-gnutls --without-openssl
+endif
+
+ifeq ($(BR2_PACKAGE_LZ4),y)
+OPENCONNECT_DEPENDENCIES += lz4
+OPENCONNECT_CONF_OPTS += --with-lz4
+else
+OPENCONNECT_CONF_OPTS += --without-lz4
+endif
+
+$(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

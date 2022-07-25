Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C674C433EF
	for <buildroot@archiver.kernel.org>; Mon, 25 Jul 2022 21:26:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 06AD161225;
	Mon, 25 Jul 2022 21:26:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 06AD161225
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Anzm33TPK-am; Mon, 25 Jul 2022 21:26:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 485F660E72;
	Mon, 25 Jul 2022 21:26:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 485F660E72
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CE83E1BF9AC
 for <buildroot@lists.busybox.net>; Mon, 25 Jul 2022 21:26:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A7AF560E72
 for <buildroot@lists.busybox.net>; Mon, 25 Jul 2022 21:26:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A7AF560E72
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id m9DV0uN6fna6 for <buildroot@lists.busybox.net>;
 Mon, 25 Jul 2022 21:26:02 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id BE30A60E5F
 for <buildroot@buildroot.org>; Mon, 25 Jul 2022 21:26:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BE30A60E5F
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 7E05285DBD; Mon, 25 Jul 2022 21:12:20 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 25 Jul 2022 23:24:35 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: adbfb71ee468a020b2d8b6babc023a97838bc330
X-Git-Newrev: ea36681572255ec906167308c07adc42ed2ac9f9
X-Patchwork-Hint: ignore
Message-Id: <20220725211220.7E05285DBD@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/zeek: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=ea36681572255ec906167308c07adc42ed2ac9f9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The Zeek Network Security Monitor

Zeek is a powerful network analysis framework that is much different
from the typical IDS you may know. (Zeek is the new name for the
long-established Bro system.)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
[Arnout:
 - select python3 instead of depends;
 - patch python path in post-patch instead of post-install]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 DEVELOPERS             |  1 +
 package/Config.in      |  1 +
 package/zeek/Config.in | 40 ++++++++++++++++++++++
 package/zeek/zeek.hash |  6 ++++
 package/zeek/zeek.mk   | 91 ++++++++++++++++++++++++++++++++++++++++++++++++++
 5 files changed, 139 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index e4df6cfe41..98227e9ba2 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -974,6 +974,7 @@ F:	package/tinycbor/
 F:	package/tinydtls/
 F:	package/tinymembench/
 F:	package/whois/
+F:	package/zeek/
 
 N:	Fabrice Goucem <fabrice.goucem@oss.nxp.com>
 F:	board/freescale/imx6ullevk/
diff --git a/package/Config.in b/package/Config.in
index b663b225c3..697c94157c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2440,6 +2440,7 @@ endif
 	source "package/xl2tp/Config.in"
 	source "package/xtables-addons/Config.in"
 	source "package/zabbix/Config.in"
+	source "package/zeek/Config.in"
 	source "package/znc/Config.in"
 
 endmenu
diff --git a/package/zeek/Config.in b/package/zeek/Config.in
new file mode 100644
index 0000000000..123fedb339
--- /dev/null
+++ b/package/zeek/Config.in
@@ -0,0 +1,40 @@
+config BR2_PACKAGE_ZEEK
+	bool "zeek"
+	depends on BR2_USE_MMU # fork()
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on !BR2_STATIC_LIBS
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_USE_WCHAR
+	select BR2_PACKAGE_LIBPCAP
+	select BR2_PACKAGE_MUSL_FTS if !BR2_TOOLCHAIN_USES_GLIBC
+	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_ZLIB
+	help
+	  The Zeek Network Security Monitor
+
+	  Zeek is a powerful network analysis framework that is much
+	  different from the typical IDS you may know. (Zeek is the new
+	  name for the long-established Bro system.)
+
+	  https://www.zeek.org
+
+if BR2_PACKAGE_ZEEK
+
+config BR2_PACKAGE_ZEEK_ZEEKCTL
+	bool "zeekctl"
+	select BR2_PACKAGE_BASH # runtime
+	select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS # bash
+	select BR2_PACKAGE_PYTHON3
+	select BR2_PACKAGE_PYTHON3_CURSES
+	select BR2_PACKAGE_PYTHON3_HASHLIB
+	select BR2_PACKAGE_PYTHON3_SQLITE
+	select BR2_PACKAGE_PYTHON3_ZLIB
+	help
+	  Tool for managing Zeek deployments
+
+endif
+
+comment "zeek needs a toolchain w/ C++, wchar, threads, dynamic library"
+	depends on BR2_USE_MMU
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
+		!BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
diff --git a/package/zeek/zeek.hash b/package/zeek/zeek.hash
new file mode 100644
index 0000000000..05e57b5024
--- /dev/null
+++ b/package/zeek/zeek.hash
@@ -0,0 +1,6 @@
+# Locally computed:
+sha256  8c0afc999a8dd1c1f677a5cf818479b99c2d527e679e1ef99fb1b03f989c0373  zeek-4.1.1.tar.gz
+
+# Hash for license files:
+sha256  b2817e2fb935805ec9fc0e90c6b971efd810d9aedfc646bc5fcb535221e0266a  COPYING
+sha256  1a451eca7b3826a7df62991ba90dd6d23ff03d28c2eefb7f8c4f8b1eac97a61b  COPYING.3rdparty
diff --git a/package/zeek/zeek.mk b/package/zeek/zeek.mk
new file mode 100644
index 0000000000..6c8fa06875
--- /dev/null
+++ b/package/zeek/zeek.mk
@@ -0,0 +1,91 @@
+################################################################################
+#
+# zeek
+#
+################################################################################
+
+ZEEK_VERSION = 4.1.1
+ZEEK_SITE = https://download.zeek.org
+ZEEK_LICENSE = \
+	BSD-3-Clause (zeek, C++ Actor Framework, ConvertUTF.c, CardinalityCounter.cc, pybind11), \
+	Public Domain (sqlite), \
+	MIT (doctest, libkqueue, RapidJSON, tsl-ordered-map, bro_inet_ntop.c), \
+	LGPL-3.0+ (Multifast Project), \
+	BSD-2-Clause (event.h), \
+	BSD-3-Clause (in_cksum.cc) \
+	BSD-4-Clause (Patricia.c, strsep.c, bsd-getopt-long.c), \
+	Apache-2.0 (highwayhash, folly), \
+	MPL-2.0 (mozilla-ca-list.zeek)
+ZEEK_LICENSE_FILES = COPYING COPYING.3rdparty
+ZEEK_SUPPORTS_IN_SOURCE_BUILD = NO
+ZEEK_DEPENDENCIES = \
+	host-bison \
+	host-flex \
+	host-pkgconf \
+	host-python3 \
+	host-zeek \
+	$(if $(BR2_PACKAGE_LIBKRB5),libkrb5) \
+	$(if $(BR2_PACKAGE_LIBMAXMINDDB),libmaxminddb) \
+	libpcap \
+	openssl \
+	$(if $(BR2_PACKAGE_ROCKSDB),rocksdb) \
+	zlib
+HOST_ZEEK_DEPENDENCIES = \
+	host-bison \
+	host-flex \
+	host-pkgconf \
+	host-python3 \
+	host-libpcap \
+	host-openssl \
+	host-zlib
+
+ZEEK_CONF_OPTS = \
+	-DBIFCL_EXE_PATH=$(HOST_DIR)/bin/bifcl \
+	-DBINPAC_EXE_PATH=$(HOST_DIR)/bin/binpac \
+	-DBROKER_DISABLE_DOCS=ON \
+	-DBROKER_DISABLE_TESTS=ON \
+	-DINSTALL_AUX_TOOLS=ON \
+	-DZEEK_ETC_INSTALL_DIR=/etc
+
+define ZEEK_FIX_PYTHON_PATH
+	$(SED) 's,@PYTHON_EXECUTABLE@,/usr/bin/python,' \
+		$(@D)/auxil/zeekctl/ZeekControl/ssh_runner.py
+endef
+ZEEK_POST_PATCH_HOOKS += ZEEK_FIX_PYTHON_PATH
+
+ifeq ($(BR2_PACKAGE_JEMALLOC),y)
+ZEEK_DEPENDENCIES += jemalloc
+ZEEK_CONF_OPTS += -DENABLE_JEMALLOC=ON
+else
+ZEEK_CONF_OPTS += -DENABLE_JEMALLOC=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_ZEEK_ZEEKCTL),y)
+ZEEK_DEPENDENCIES += host-swig python3
+ZEEK_CONF_OPTS += \
+	-DDISABLE_PYTHON_BINDINGS=OFF \
+	-DINSTALL_ZEEKCTL=ON \
+	-DPY_MOD_INSTALL_DIR=/usr/lib/zeekctl \
+	-DZEEK_PYTHON_PREFIX=/usr
+else
+ZEEK_CONF_OPTS += \
+	-DDISABLE_PYTHON_BINDINGS=ON \
+	-DINSTALL_ZEEKCTL=OFF
+endif
+
+ifneq ($(BR2_TOOLCHAIN_USES_GLIBC),y)
+ZEEK_DEPENDENCIES += musl-fts
+ZEEK_CONF_OPTS += -DCMAKE_EXE_LINKER_FLAGS=-lfts
+endif
+
+HOST_ZEEK_MAKE_OPTS = binpac bifcl
+
+define HOST_ZEEK_INSTALL_CMDS
+	$(INSTALL) -D -m 0755 $(HOST_ZEEK_BUILDDIR)/auxil/bifcl/bifcl \
+		$(HOST_DIR)/bin/bifcl
+	$(INSTALL) -D -m 0755 $(HOST_ZEEK_BUILDDIR)/auxil/binpac/src/binpac \
+		$(HOST_DIR)/bin/binpac
+endef
+
+$(eval $(cmake-package))
+$(eval $(host-cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

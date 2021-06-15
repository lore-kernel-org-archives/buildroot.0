Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E781C4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 23:08:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B78D860F70
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 23:08:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B78D860F70
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9611441620;
	Tue,  3 Aug 2021 23:08:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fdU_qIrQndRh; Tue,  3 Aug 2021 23:08:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B5F5F41612;
	Tue,  3 Aug 2021 23:08:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3D2101BF9AA
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:13:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 331B94064A
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id O0NA_BNyHzRv for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:01 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 39850404D4
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 8ECAB8674F; Tue,  3 Aug 2021 21:09:52 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 15 Jun 2021 13:25:43 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 6e75a990ae35580800f24f3ddc4573c6bc38fa05
X-Git-Newrev: a7bf844813e2527267cb0a98eb73a0e4bdf04f99
X-Patchwork-Hint: ignore
Message-Id: <20210803210952.8ECAB8674F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/snort3: new package
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=a7bf844813e2527267cb0a98eb73a0e4bdf04f99
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Snort 3 is the next generation Snort IPS (Intrusion
Prevention System).

 - Support multiple packet processing threads
 - Shared configuration and attribute table
 - Use a simple, scriptable configuration
 - Make key components pluggable
 - Autodetect services for portless configuration
 - Support sticky buffers in rules
 - Autogenerate reference documentation
 - Provide better cross platform support

https://www.snort.org/snort3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Reviewed-by: Heiko Thiery <heiko.thiery@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 DEVELOPERS                 |  1 +
 package/Config.in          |  1 +
 package/snort3/Config.in   | 42 ++++++++++++++++++++++++++++++++++
 package/snort3/snort3.hash |  6 +++++
 package/snort3/snort3.mk   | 57 ++++++++++++++++++++++++++++++++++++++++++++++
 5 files changed, 107 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 327ffb9447..2031a40e14 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -912,6 +912,7 @@ F:	package/python-yatl/
 F:	package/rocksdb/
 F:	package/rygel/
 F:	package/safeclib/
+F:	package/snort3/
 F:	package/suricata/
 F:	package/tinycbor/
 F:	package/tinydtls/
diff --git a/package/Config.in b/package/Config.in
index 89d8dd10d1..4cdf796ad9 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2284,6 +2284,7 @@ endif
 	source "package/sngrep/Config.in"
 	source "package/snmpclitools/Config.in"
 	source "package/snort/Config.in"
+	source "package/snort3/Config.in"
 	source "package/socat/Config.in"
 	source "package/socketcand/Config.in"
 	source "package/softether/Config.in"
diff --git a/package/snort3/Config.in b/package/snort3/Config.in
new file mode 100644
index 0000000000..75923c3c20
--- /dev/null
+++ b/package/snort3/Config.in
@@ -0,0 +1,42 @@
+config BR2_PACKAGE_SNORT3
+	bool "snort3"
+	depends on BR2_PACKAGE_LUAJIT_ARCH_SUPPORTS # luajit
+	depends on !(BR2_PACKAGE_DAQ || BR2_PACKAGE_SNORT)
+	depends on BR2_USE_MMU # fork()
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on !BR2_STATIC_LIBS # daq3
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C++11
+	depends on BR2_TOOLCHAIN_HAS_THREADS # hwloc
+	depends on BR2_USE_WCHAR
+	select BR2_PACKAGE_DAQ3
+	select BR2_PACKAGE_FLEX
+	select BR2_PACKAGE_HWLOC
+	select BR2_PACKAGE_LIBDNET
+	select BR2_PACKAGE_LIBPCAP
+	select BR2_PACKAGE_LUAJIT
+	select BR2_PACKAGE_PCRE
+	select BR2_PACKAGE_LIBTIRPC if !BR2_TOOLCHAIN_HAS_NATIVE_RPC
+	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_ZLIB
+	help
+	  Snort 3 is the next generation Snort IPS (Intrusion
+	  Prevention System).
+
+	  - Support multiple packet processing threads
+	  - Shared configuration and attribute table
+	  - Use a simple, scriptable configuration
+	  - Make key components pluggable
+	  - Autodetect services for portless configuration
+	  - Support sticky buffers in rules
+	  - Autogenerate reference documentation
+	  - Provide better cross platform support
+
+	  https://www.snort.org/snort3
+
+comment "snort3 needs a toolchain w/ C++, wchar, threads, dynamic library, gcc >= 4.9"
+	depends on BR2_PACKAGE_LUAJIT_ARCH_SUPPORTS
+	depends on !(BR2_PACKAGE_DAQ || BR2_PACKAGE_SNORT)
+	depends on BR2_USE_MMU
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
+		BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
diff --git a/package/snort3/snort3.hash b/package/snort3/snort3.hash
new file mode 100644
index 0000000000..48eddd74c9
--- /dev/null
+++ b/package/snort3/snort3.hash
@@ -0,0 +1,6 @@
+# Locally computed:
+sha256  a68af8ea46a038dfb0ad489e8d11dee62a3e63cb4a639f6bb4fac4ded955fe11  snort3-3.1.4.0.tar.gz
+
+# Hash for license files:
+sha256  3f1cbfb20bb2c608e1a474421880d08b8cba6abb00ab7736d22c481d71656a6d  COPYING
+sha256  f98260a6d3e5ef4ede8a2a6b698e5ac91d64c09243f7171e1c5b17b920a835c7  LICENSE
diff --git a/package/snort3/snort3.mk b/package/snort3/snort3.mk
new file mode 100644
index 0000000000..1c49da8ec0
--- /dev/null
+++ b/package/snort3/snort3.mk
@@ -0,0 +1,57 @@
+################################################################################
+#
+# snort3
+#
+################################################################################
+
+SNORT3_VERSION = 3.1.4.0
+SNORT3_SITE = $(call github,snort3,snort3,$(SNORT3_VERSION))
+SNORT3_LICENSE = GPL-2.0
+SNORT3_LICENSE_FILES = COPYING LICENSE
+
+SNORT3_DEPENDENCIES = \
+	host-pkgconf daq3 flex hwloc libdnet libpcap luajit openssl pcre zlib
+
+SNORT3_CONF_OPTS = \
+	-DENABLE_GDB=OFF \
+	-DENABLE_STATIC_DAQ=OFF \
+	-DMAKE_DOC=OFF
+
+ifeq ($(BR2_PACKAGE_FLATBUFFERS),y)
+SNORT3_DEPENDENCIES += flatbuffers
+SNORT3_CONF_OPTS += -DHAVE_FLATBUFFERS=ON
+else
+SNORT3_CONF_OPTS += -DHAVE_FLATBUFFERS=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_LIBICONV),y)
+SNORT3_DEPENDENCIES += libiconv
+SNORT3_CONF_OPTS += -DHAVE_ICONV=ON
+endif
+
+ifeq ($(BR2_PACKAGE_LIBTIRPC),y)
+SNORT3_DEPENDENCIES += libtirpc
+endif
+
+ifeq ($(BR2_PACKAGE_SAFECLIB),y)
+SNORT3_DEPENDENCIES += safeclib
+SNORT3_CONF_OPTS += -DENABLE_SAFEC=ON
+else
+SNORT3_CONF_OPTS += -DENABLE_SAFEC=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_UTIL_LINUX_LIBUUID),y)
+SNORT3_DEPENDENCIES += util-linux
+SNORT3_CONF_OPTS += -DHAVE_UUID=ON
+else
+SNORT3_CONF_OPTS += -DHAVE_UUID=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_XZ),y)
+SNORT3_DEPENDENCIES += xz
+SNORT3_CONF_OPTS += -DHAVE_LZMA=ON
+else
+SNORT3_CONF_OPTS += -DHAVE_LZMA=OFF
+endif
+
+$(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot

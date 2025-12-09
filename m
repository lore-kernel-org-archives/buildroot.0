Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 359E1D4337D
	for <buildroot@archiver.kernel.org>; Fri, 12 Dec 2025 07:59:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 585A884500;
	Fri, 12 Dec 2025 07:59:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XewVvPbJgqUd; Fri, 12 Dec 2025 07:59:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 16CC6803A4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765526361;
	bh=fjjVWp4SkZ4pawI6+ZWDvubCI0AQNX4TYcT8TuFjmXU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=o5XDxl+4RCKt/CJzZRAKDUNQcyiPL18lXZh22vjrqiuHM9b1cgboKKgaDK6LGcs1F
	 OmafyyMp1MAJ5g0SB6p5O6htH52Ov/D6xfNXVfCvNPecapwrPTwRGMWtpByWYTExkX
	 msWvKr/8aEPStmNvJa5VkQawR/8pXtV6zqGXdpfXnQZpJoXTrDZYonvzQWT5lOqZ4k
	 0Ll+MvOX+Wc3DWgNDpD3TVcurPJb5wLp6+Y4J8fScV7nUWyDuqDVwX5jIxIkNAAHAN
	 3rrqWkKQ23NNaiPJDZtDwBUTsoXKXcANitmy1xT5BgmrfV85dN91ZF5Srq3BxZqhe/
	 Eunb2wvwBJ0Mg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 16CC6803A4;
	Fri, 12 Dec 2025 07:59:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1E7F42C1
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 07:57:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 66AFE4117D
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 07:55:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U1mu5OH7ohzP for <buildroot@buildroot.org>;
 Fri, 12 Dec 2025 07:55:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 09AE441196
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 09AE441196
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 07:55:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 08AB0869E8; Fri, 12 Dec 2025 07:55:39 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 9 Dec 2025 19:24:58 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1a9e812d24c4e609c65e3dc39813e0c61b20966f
X-Git-Newrev: db72d16ca1d781f7237dfb0fe6cacd52aeeda6b4
X-Patchwork-Hint: ignore
Message-Id: <20251212075539.08AB0869E8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pistache: bump version to 0.4.26
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=db72d16ca1d781f7237dfb0fe6cacd52aeeda6b4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For release notes, see:
https://github.com/pistacheio/pistache/releases

Removed patches which are included in this release.

Rapidjson was converted into an optional dependency:
https://github.com/pistacheio/pistache/commit/52abf5a86b21d574df471fa1a05f2e6d22c7fbff

Removed configure option PISTACHE_ENABLE_NETWORK_TESTS:
https://github.com/pistacheio/pistache/commit/7d71e3b99fbe515f1854aeb039d2964507f03125

This commit also updates the _SITE and package homepage URL.
The old URL:
https://github.com/oktal/pistache
now redirects to:
https://github.com/pistacheio/pistache

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
[Julien:
 - update _SITE and homepage
 - add link to release notes
]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .checkpackageignore                                |  2 --
 ...transport.cc-fallback-value-for-RUSAGE_TH.patch | 33 -------------------
 ...src-server-listener.cc-fix-libressl-build.patch | 38 ----------------------
 ...3-Add-missing-cstdint-header-include-1142.patch | 23 -------------
 package/pistache/Config.in                         |  3 +-
 package/pistache/pistache.hash                     |  2 +-
 package/pistache/pistache.mk                       | 13 +++++---
 7 files changed, 11 insertions(+), 103 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 704680c911..b902157fae 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -838,8 +838,6 @@ package/pifmrds/0001-Makefile-cross-compile-friendly.patch lib_patch.Upstream
 package/pifmrds/0002-Makefile-use-LDFLAGS.patch lib_patch.Upstream
 package/pifmrds/0003-Makefile-fix-static-link.patch lib_patch.Upstream
 package/pigpio/S50pigpio Shellcheck lib_sysv.Variables
-package/pistache/0001-src-common-transport.cc-fallback-value-for-RUSAGE_TH.patch lib_patch.Upstream
-package/pistache/0002-src-server-listener.cc-fix-libressl-build.patch lib_patch.Upstream
 package/pkgconf/0001-Only-prefix-with-the-sysroot-a-subset-of-variables.patch lib_patch.Upstream
 package/pkgconf/pkg-config.in Shellcheck
 package/poke/0001-configure.ac-HELP2MAN-replace-by-true-when-cross-com.patch lib_patch.Upstream
diff --git a/package/pistache/0001-src-common-transport.cc-fallback-value-for-RUSAGE_TH.patch b/package/pistache/0001-src-common-transport.cc-fallback-value-for-RUSAGE_TH.patch
deleted file mode 100644
index 327933e26d..0000000000
--- a/package/pistache/0001-src-common-transport.cc-fallback-value-for-RUSAGE_TH.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 5feed6d2f86750bfe1e7c26d6fd4e8d2195ea81f Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
-Date: Thu, 4 Aug 2022 19:54:23 +0200
-Subject: [PATCH] src/common/transport.cc: fallback value for RUSAGE_THREAD
-
-uClibc-ng currently does not define RUSAGE_THREAD, so let's add a
-fallback value until it gets fixed in uClibc-ng. The value is the same
-on all Linux systems, regardless of the CPU architecture.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
-Upstream bug: https://mailman.openadk.org/mailman3/hyperkitty/list/devel@uclibc-ng.org/thread/MEXOUSFSH46UFS3AEMEIEPTL5U4HVEFL/
----
- src/common/transport.cc | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/src/common/transport.cc b/src/common/transport.cc
-index 62efb8c..0f3abb0 100644
---- a/src/common/transport.cc
-+++ b/src/common/transport.cc
-@@ -515,6 +515,10 @@ namespace Pistache::Tcp
- 
-         rusage now;
- 
-+#if !defined(RUSAGE_THREAD)
-+#define RUSAGE_THREAD 1
-+#endif
-+
-         auto res = getrusage(RUSAGE_THREAD, &now);
-         if (res == -1)
-             loadRequest_.reject(std::runtime_error("Could not compute usage"));
--- 
-2.37.1
-
diff --git a/package/pistache/0002-src-server-listener.cc-fix-libressl-build.patch b/package/pistache/0002-src-server-listener.cc-fix-libressl-build.patch
deleted file mode 100644
index f2fe2183ae..0000000000
--- a/package/pistache/0002-src-server-listener.cc-fix-libressl-build.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From 656bff21c1d20b25058da9dbc27d28ad2ac7ae6e Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sat, 25 Feb 2023 18:09:39 +0100
-Subject: [PATCH] src/server/listener.cc: fix libressl build
-
-Fix the following libressl build failure:
-
-../src/server/listener.cc: In member function 'void Pistache::Tcp::Listener::setupSSLAuth(const std::string&, const std::string&, int (*)(int, void*))':
-../src/server/listener.cc:582:29: error: 'SSL_verify_cb' was not declared in this scope; did you mean 'RSA_verify'?
-  582 |                            (SSL_verify_cb)cb
-      |                             ^~~~~~~~~~~~~
-      |                             RSA_verify
-
-Fixes:
- - http://autobuild.buildroot.org/results/066fc078980e5216f38411eee455088e15fa1101
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/pistacheio/pistache/pull/1124]
----
- src/server/listener.cc | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/server/listener.cc b/src/server/listener.cc
-index 38d2661..c09cb36 100644
---- a/src/server/listener.cc
-+++ b/src/server/listener.cc
-@@ -609,7 +609,7 @@ namespace Pistache::Tcp
-         SSL_CTX_set_verify(GetSSLContext(ssl_ctx_),
-                            SSL_VERIFY_PEER | SSL_VERIFY_FAIL_IF_NO_PEER_CERT | SSL_VERIFY_CLIENT_ONCE,
- /* Callback type did change in 1.0.1 */
--#if OPENSSL_VERSION_NUMBER < 0x10100000L
-+#if OPENSSL_VERSION_NUMBER < 0x10100000L || defined(LIBRESSL_VERSION_NUMBER)
-                            (int (*)(int, X509_STORE_CTX*))cb
- #else
-                            (SSL_verify_cb)cb
--- 
-2.39.1
-
diff --git a/package/pistache/0003-Add-missing-cstdint-header-include-1142.patch b/package/pistache/0003-Add-missing-cstdint-header-include-1142.patch
deleted file mode 100644
index 3451e4aa4c..0000000000
--- a/package/pistache/0003-Add-missing-cstdint-header-include-1142.patch
+++ /dev/null
@@ -1,23 +0,0 @@
-From dabe9fcd3eaaa6b0b8723369b2565778341630c0 Mon Sep 17 00:00:00 2001
-From: a-andre <13609565+a-andre@users.noreply.github.com>
-Date: Thu, 29 Jun 2023 16:34:11 +0200
-Subject: [PATCH] Add missing cstdint header include (#1142)
-
-Upstream: https://github.com/pistacheio/pistache/commit/dabe9fcd3eaaa6b0b8723369b2565778341630c0
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- include/pistache/flags.h | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/include/pistache/flags.h b/include/pistache/flags.h
-index 9be2b32bb..6adcc74bc 100644
---- a/include/pistache/flags.h
-+++ b/include/pistache/flags.h
-@@ -13,6 +13,7 @@
- #pragma once
- 
- #include <climits>
-+#include <cstdint>
- #include <iostream>
- #include <type_traits>
- 
diff --git a/package/pistache/Config.in b/package/pistache/Config.in
index e66c24d86d..a026275f92 100644
--- a/package/pistache/Config.in
+++ b/package/pistache/Config.in
@@ -4,13 +4,12 @@ config BR2_PACKAGE_PISTACHE
 	depends on BR2_USE_WCHAR
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	depends on BR2_INSTALL_LIBSTDCPP
-	select BR2_PACKAGE_RAPIDJSON
 	help
 	  Pistache is a modern and elegant HTTP and REST framework
 	  for C++. It is entirely written in pure C++17 and provides
 	  a clear and pleasant API.
 
-	  https://github.com/oktal/pistache
+	  https://github.com/pistacheio/pistache
 
 comment "pistache needs a toolchain w/ C++, gcc >= 7, NPTL, wchar"
 	depends on !BR2_INSTALL_LIBSTDCPP || \
diff --git a/package/pistache/pistache.hash b/package/pistache/pistache.hash
index 9a2cd1d1f9..545a556a24 100644
--- a/package/pistache/pistache.hash
+++ b/package/pistache/pistache.hash
@@ -1,3 +1,3 @@
 #locally computed
-sha256  f2b3e8b2581cfed5e036d1b97a9b97dc7022b3ddaab69c4691238faff3199bc1  pistache-3ec9d7c4f8b828fdd391550fff81b01e72dd6269.tar.gz
+sha256  29af6562547497acf6f49170661786fe8cf1ed3712ad80e69c53da4661c59544  pistache-0.4.26.tar.gz
 sha256  c6596eb7be8581c18be736c846fb9173b69eccf6ef94c5135893ec56bd92ba08  LICENSE
diff --git a/package/pistache/pistache.mk b/package/pistache/pistache.mk
index f4de5e3b2a..5afbcabaf3 100644
--- a/package/pistache/pistache.mk
+++ b/package/pistache/pistache.mk
@@ -4,18 +4,23 @@
 #
 ################################################################################
 
-PISTACHE_VERSION = 3ec9d7c4f8b828fdd391550fff81b01e72dd6269
-PISTACHE_SITE = $(call github,oktal,pistache,$(PISTACHE_VERSION))
+PISTACHE_VERSION = 0.4.26
+PISTACHE_SITE = $(call github,pistacheio,pistache,v$(PISTACHE_VERSION))
 PISTACHE_LICENSE = Apache-2.0
 PISTACHE_LICENSE_FILES = LICENSE
 
 PISTACHE_INSTALL_STAGING = YES
-PISTACHE_DEPENDENCIES = rapidjson
+
+ifeq ($(BR2_PACKAGE_RAPIDJSON),y)
+PISTACHE_DEPENDENCIES += rapidjson
+PISTACHE_CONF_OPTS += -DPISTACHE_USE_RAPIDJSON=true
+else
+PISTACHE_CONF_OPTS += -DPISTACHE_USE_RAPIDJSON=false
+endif
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 PISTACHE_DEPENDENCIES += openssl
 PISTACHE_CONF_OPTS += -DPISTACHE_USE_SSL=true
-PISTACHE_CONF_OPTS += -DPISTACHE_ENABLE_NETWORK_TESTS=false
 else
 PISTACHE_CONF_OPTS += -DPISTACHE_USE_SSL=false
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

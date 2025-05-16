Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBC3DC3ABC9
	for <buildroot@archiver.kernel.org>; Fri, 16 May 2025 16:50:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B124F6129D;
	Fri, 16 May 2025 16:50:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cKMkMbHm-aAb; Fri, 16 May 2025 16:50:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9AF3860B49
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9AF3860B49;
	Fri, 16 May 2025 16:50:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 61CDA13D
 for <buildroot@buildroot.org>; Fri, 16 May 2025 16:50:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 47EFC400CE
 for <buildroot@buildroot.org>; Fri, 16 May 2025 16:50:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D44lVzeR3VsW for <buildroot@buildroot.org>;
 Fri, 16 May 2025 16:50:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 69E7A4003A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 69E7A4003A
 for <buildroot@buildroot.org>; Fri, 16 May 2025 16:50:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5924786CBB; Fri, 16 May 2025 16:50:10 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 16 May 2025 18:49:54 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 432aef053e6471ec8570b31aecbd8377bb666053
X-Git-Newrev: 3481a9643fc7223e400ed877f08ade34d44e6b78
X-Patchwork-Hint: ignore
Message-Id: <20250516165010.5924786CBB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mbedtls: bump to version 3.6.3.1
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=3481a9643fc7223e400ed877f08ade34d44e6b78
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As specified in the 2.28.10 release notes:
https://github.com/Mbed-TLS/mbedtls/releases/tag/mbedtls-2.28.10

Mbed TLS 2.28.10 is the last release of the 2.28 LTS and won't receive bug
fixes or security fixes anymore.  Users are advised to upgrade to a
maintained version.

So move to 3.6.x, which is the new LTS version:

Mbed TLS 3.6 is a long-term support (LTS) branch.  It will be supported with
bug-fixes and security fixes until at least March 2027.

Drop BR2_PACKAGE_MBEDTLS_COMPRESSION and all related references
as native zlib support has been entirely removed from mbedtls.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
[Peter: add note about 2.28.x / 3.6.x, add Config.in.legacy]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Config.in.legacy                         |  7 +++++++
 package/mbedtls/Config.in                | 12 ------------
 package/mbedtls/mbedtls.hash             |  4 ++--
 package/mbedtls/mbedtls.mk               | 28 ++++++++--------------------
 package/shairport-sync/shairport-sync.mk |  3 ---
 package/uacme/uacme.mk                   |  3 ---
 6 files changed, 17 insertions(+), 40 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 02dc3eab73..c455e23524 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2025.05"
 
+config BR2_PACKAGE_MBEDTLS_COMPRESSION
+	bool "mbedtls compression support removed"
+	select BR2_LEGACY
+	help
+	  MbedTLS has dropped support for TLS record-level
+	  compression.
+
 config BR2_KERNEL_HEADERS_6_13
 	bool "kernel headers version 6.13.x are no longer supported"
 	select BR2_LEGACY
diff --git a/package/mbedtls/Config.in b/package/mbedtls/Config.in
index abbe3356d8..21e746d842 100644
--- a/package/mbedtls/Config.in
+++ b/package/mbedtls/Config.in
@@ -17,18 +17,6 @@ config BR2_PACKAGE_MBEDTLS_PROGRAMS
 	  This option enables the installation and the build of
 	  mbed TLS companion programs.
 
-config BR2_PACKAGE_MBEDTLS_COMPRESSION
-	bool "enable compression support"
-	select BR2_PACKAGE_ZLIB
-	help
-	  Enable support for compression of the content data before it
-	  enters the secure channel as described in RFC 3749.
-
-	  Warning: TLS compression may make you vulnerable to the
-	  CRIME attack. You should not enable it unless you know for
-	  sure CRIME and similar attacks are not applicable to your
-	  particular situation.
-
 config BR2_PACKAGE_MBEDTLS_DTLS_SRTP
 	bool "enable DTLS-SRTP support"
 	help
diff --git a/package/mbedtls/mbedtls.hash b/package/mbedtls/mbedtls.hash
index 6fc68ddac6..cc15958e3a 100644
--- a/package/mbedtls/mbedtls.hash
+++ b/package/mbedtls/mbedtls.hash
@@ -1,4 +1,4 @@
-# From https://github.com/ARMmbed/mbedtls/releases/tag/v2.28.10:
-sha256  19e5b81fdac0fe22009b9e2bdcd52d7dcafbf62bc67fc59cf0a76b5b5540d149  mbedtls-2.28.10.tar.bz2
+# From https://github.com/Mbed-TLS/mbedtls/releases/tag/v3.6.3.1:
+sha256  243ed496d5f88a5b3791021be2800aac821b9a4cc16e7134aa413c58b4c20e0c  mbedtls-3.6.3.1.tar.bz2
 # Locally calculated
 sha256  9b405ef4c89342f5eae1dd828882f931747f71001cfba7d114801039b52ad09b  LICENSE
diff --git a/package/mbedtls/mbedtls.mk b/package/mbedtls/mbedtls.mk
index fd6682fbfd..563683e739 100644
--- a/package/mbedtls/mbedtls.mk
+++ b/package/mbedtls/mbedtls.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-MBEDTLS_VERSION = 2.28.10
-MBEDTLS_SITE = https://github.com/Mbed-TLS/mbedtls/releases/download/mbedtls-$(MBEDTLS_VERSION)
+MBEDTLS_VERSION = 3.6.3.1
+MBEDTLS_SITE = https://github.com/Mbed-TLS/mbedtls/releases/download/v$(MBEDTLS_VERSION)
 MBEDTLS_SOURCE = mbedtls-$(MBEDTLS_VERSION).tar.bz2
 MBEDTLS_CONF_OPTS = \
 	-DCMAKE_C_FLAGS="$(TARGET_CFLAGS) -std=c99" \
@@ -22,9 +22,9 @@ MBEDTLS_CPE_ID_PRODUCT = mbed_tls
 ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
 define MBEDTLS_ENABLE_THREADING
 	$(SED) "s://#define MBEDTLS_THREADING_C:#define MBEDTLS_THREADING_C:" \
-		$(@D)/include/mbedtls/config.h
+		$(@D)/include/mbedtls/mbedtls_config.h
 	$(SED) "s://#define MBEDTLS_THREADING_PTHREAD:#define MBEDTLS_THREADING_PTHREAD:" \
-		$(@D)/include/mbedtls/config.h
+		$(@D)/include/mbedtls/mbedtls_config.h
 endef
 MBEDTLS_PRE_CONFIGURE_HOOKS += MBEDTLS_ENABLE_THREADING
 ifeq ($(BR2_STATIC_LIBS),y)
@@ -43,25 +43,13 @@ MBEDTLS_CONF_OPTS += \
 	-DUSE_SHARED_MBEDTLS_LIBRARY=ON -DUSE_STATIC_MBEDTLS_LIBRARY=OFF
 endif
 
-ifeq ($(BR2_PACKAGE_MBEDTLS_COMPRESSION),y)
-MBEDTLS_CONF_OPTS += -DENABLE_ZLIB_SUPPORT=ON
-MBEDTLS_DEPENDENCIES += zlib
-define MBEDTLS_ENABLE_ZLIB
-	$(SED) "s://#define MBEDTLS_ZLIB_SUPPORT:#define MBEDTLS_ZLIB_SUPPORT:" \
-		$(@D)/include/mbedtls/config.h
-endef
-MBEDTLS_PRE_CONFIGURE_HOOKS += MBEDTLS_ENABLE_ZLIB
-else
-MBEDTLS_CONF_OPTS += -DENABLE_ZLIB_SUPPORT=OFF
-endif
-
 define MBEDTLS_DISABLE_ASM
 	$(SED) '/^#define MBEDTLS_AESNI_C/d' \
-		$(@D)/include/mbedtls/config.h
+		$(@D)/include/mbedtls/mbedtls_config.h
 	$(SED) '/^#define MBEDTLS_HAVE_ASM/d' \
-		$(@D)/include/mbedtls/config.h
+		$(@D)/include/mbedtls/mbedtls_config.h
 	$(SED) '/^#define MBEDTLS_PADLOCK_C/d' \
-		$(@D)/include/mbedtls/config.h
+		$(@D)/include/mbedtls/mbedtls_config.h
 endef
 
 # ARM in thumb mode breaks debugging with asm optimizations
@@ -76,7 +64,7 @@ endif
 ifeq ($(BR2_PACKAGE_MBEDTLS_DTLS_SRTP),y)
 define MBEDTLS_ENABLE_DTLS_SRTP
 	$(SED) "s://#define MBEDTLS_SSL_DTLS_SRTP:#define MBEDTLS_SSL_DTLS_SRTP:" \
-		$(@D)/include/mbedtls/config.h
+		$(@D)/include/mbedtls/mbedtls_config.h
 endef
 MBEDTLS_PRE_CONFIGURE_HOOKS += MBEDTLS_ENABLE_DTLS_SRTP
 endif
diff --git a/package/shairport-sync/shairport-sync.mk b/package/shairport-sync/shairport-sync.mk
index 4430014ec9..5d01ab042e 100644
--- a/package/shairport-sync/shairport-sync.mk
+++ b/package/shairport-sync/shairport-sync.mk
@@ -44,9 +44,6 @@ else
 SHAIRPORT_SYNC_DEPENDENCIES += mbedtls
 SHAIRPORT_SYNC_CONF_OPTS += --with-ssl=mbedtls
 SHAIRPORT_SYNC_CONF_LIBS += -lmbedx509 -lmbedcrypto
-ifeq ($(BR2_PACKAGE_MBEDTLS_COMPRESSION),y)
-SHAIRPORT_SYNC_CONF_LIBS += -lz
-endif
 endif
 
 ifeq ($(BR2_PACKAGE_SHAIRPORT_SYNC_CONVOLUTION),y)
diff --git a/package/uacme/uacme.mk b/package/uacme/uacme.mk
index ec538cec12..9a2c972604 100644
--- a/package/uacme/uacme.mk
+++ b/package/uacme/uacme.mk
@@ -22,9 +22,6 @@ ifeq ($(BR2_PACKAGE_GNUTLS),y)
 UACME_CONF_OPTS += --with-gnutls
 UACME_DEPENDENCIES += gnutls
 else ifeq ($(BR2_PACKAGE_MBEDTLS),y)
-ifeq ($(BR2_PACKAGE_MBEDTLS_COMPRESSION),y)
-    UACME_LIBS += -lz
-endif
 UACME_CONF_OPTS += --with-mbedtls
 UACME_DEPENDENCIES += mbedtls
 else ifeq ($(BR2_PACKAGE_OPENSSL),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94BA4C3ABAE
	for <buildroot@archiver.kernel.org>; Sun, 15 Sep 2024 21:37:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 518F8808A8;
	Sun, 15 Sep 2024 21:37:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ze5J3gnoCTKB; Sun, 15 Sep 2024 21:36:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 518CA80E07
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 518CA80E07;
	Sun, 15 Sep 2024 21:36:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0E78C1BF94D
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 21:36:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 09A9D80AE2
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 21:36:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ypuS6VG9AMOK for <buildroot@lists.busybox.net>;
 Sun, 15 Sep 2024 21:36:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B728480837
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B728480837
 for <buildroot@buildroot.org>; Sun, 15 Sep 2024 21:36:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B240983682; Sun, 15 Sep 2024 21:36:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 14 Sep 2024 20:35:13 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d7a3d455fcb5cd45db189acef8791676c6bc4f04
X-Git-Newrev: b315dc5fbf40eb0a4ac60019bf9c67ef7c8e72e0
X-Patchwork-Hint: ignore
Message-Id: <20240915213636.B240983682@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/zabbix: bump version to 7.0.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=b315dc5fbf40eb0a4ac60019bf9c67ef7c8e72e0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update to maintained and stable 7.0.3 version.

Patch 0002 does no longer apply: libressl support is not supported for
our version of Libressl, so now we only support openssl, and not
libressl.

It is required to start the daemons with -f otherwise they are
restarted every 30 seconds.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                         |  1 +
 .../0002-fix-build-with-libressl-3.5.0.patch       | 71 ----------------------
 package/zabbix/zabbix-agent.service                |  2 +-
 package/zabbix/zabbix-server.service               |  2 +-
 package/zabbix/zabbix.hash                         |  2 +-
 package/zabbix/zabbix.mk                           | 14 +++--
 6 files changed, 12 insertions(+), 80 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 1f887e161c..e1d26b43fc 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3304,6 +3304,7 @@ F:	package/mksh/
 F:	package/ruby/
 F:	package/uclibc/
 F:	package/uclibc-ng-test/
+F:	package/zabbix/
 F:	support/testing/tests/package/test_ruby.py
 
 N:	Will Newton <will.newton@gmail.com>
diff --git a/package/zabbix/0002-fix-build-with-libressl-3.5.0.patch b/package/zabbix/0002-fix-build-with-libressl-3.5.0.patch
deleted file mode 100644
index ad6960f329..0000000000
--- a/package/zabbix/0002-fix-build-with-libressl-3.5.0.patch
+++ /dev/null
@@ -1,71 +0,0 @@
-From 5c8511384f1d41f9c2a131604d5cb2dbc1c0aec9 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Fri, 24 Feb 2023 12:23:56 +0100
-Subject: [PATCH] fix build with libressl >= 3.5.0
-
-Fix the following build failure with libressl >= 3.5.0:
-
-tls.c:113:17: error: static declaration of 'OPENSSL_cleanup' follows non-static declaration
-  113 | static void     OPENSSL_cleanup(void)
-      |                 ^~~~~~~~~~~~~~~
-In file included from /home/thomas/autobuild/instance-3/output-1/host/mips-buildroot-linux-gnu/sysroot/usr/include/openssl/bio.h:69,
-                 from /home/thomas/autobuild/instance-3/output-1/host/mips-buildroot-linux-gnu/sysroot/usr/include/openssl/evp.h:67,
-                 from /home/thomas/autobuild/instance-3/output-1/host/mips-buildroot-linux-gnu/sysroot/usr/include/openssl/hmac.h:67,
-                 from /home/thomas/autobuild/instance-3/output-1/host/mips-buildroot-linux-gnu/sysroot/usr/include/openssl/ssl.h:150,
-                 from ../../../include/zbxcomms.h:65,
-                 from tls.c:20:
-/home/thomas/autobuild/instance-3/output-1/host/mips-buildroot-linux-gnu/sysroot/usr/include/openssl/crypto.h:565:6: note: previous declaration of 'OPENSSL_cleanup' with type 'void(void)'
-  565 | void OPENSSL_cleanup(void);
-      |      ^~~~~~~~~~~~~~~
-In file included from tls.c:20:
-tls.c: In function 'zbx_log_ciphersuites':
-../../../include/zbxcomms.h:222:75: error: invalid use of incomplete typedef 'SSL_CTX' {aka 'struct ssl_ctx_st'}
-  222 | #       define SSL_CTX_get_ciphers(ciphers)                     ((ciphers)->cipher_list)
-      |                                                                           ^~
-tls.c:1415:31: note: in expansion of macro 'SSL_CTX_get_ciphers'
- 1415 |                 cipher_list = SSL_CTX_get_ciphers(ciphers);
-      |                               ^~~~~~~~~~~~~~~~~~~
-
-Fixes:
- - http://autobuild.buildroot.org/results/acdfcb17b39d438ccf5e4621707a10f60577d233
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Upstream: not sent (no feedback on first patch)
----
- include/zbxcomms.h      | 3 ++-
- src/libs/zbxcomms/tls.c | 5 +++--
- 2 files changed, 5 insertions(+), 3 deletions(-)
-
-diff --git a/include/zbxcomms.h b/include/zbxcomms.h
-index e7d74dbd0f..d6efa358fe 100644
---- a/include/zbxcomms.h
-+++ b/include/zbxcomms.h
-@@ -253,7 +253,8 @@ int	zbx_telnet_execute(ZBX_SOCKET socket_fd, const char *command, AGENT_RESULT *
- /* TLS BLOCK */
- #if defined(HAVE_GNUTLS) || defined(HAVE_OPENSSL)
- 
--#if defined(HAVE_OPENSSL) && OPENSSL_VERSION_NUMBER < 0x1010000fL || defined(LIBRESSL_VERSION_NUMBER)
-+#if defined(HAVE_OPENSSL) && OPENSSL_VERSION_NUMBER < 0x1010000fL || \
-+	defined(LIBRESSL_VERSION_NUMBER) && LIBRESSL_VERSION_NUMBER < 0x3050000fL
- #	if !defined(LIBRESSL_VERSION_NUMBER)
- #		define OPENSSL_INIT_LOAD_SSL_STRINGS			0
- #		define OPENSSL_INIT_LOAD_CRYPTO_STRINGS		0
-diff --git a/src/libs/zbxcomms/tls.c b/src/libs/zbxcomms/tls.c
-index 54ab0a6ef4..bd4075b3e4 100644
---- a/src/libs/zbxcomms/tls.c
-+++ b/src/libs/zbxcomms/tls.c
-@@ -28,8 +28,9 @@
- #include "log.h"
- #include "zbxcrypto.h"
- 
--#if defined(HAVE_OPENSSL) && OPENSSL_VERSION_NUMBER < 0x1010000fL || defined(LIBRESSL_VERSION_NUMBER)
--/* for OpenSSL 1.0.1/1.0.2 (before 1.1.0) or LibreSSL */
-+#if defined(HAVE_OPENSSL) && OPENSSL_VERSION_NUMBER < 0x1010000fL || \
-+	defined(LIBRESSL_VERSION_NUMBER) && LIBRESSL_VERSION_NUMBER < 0x3050000fL
-+/* for OpenSSL 1.0.1/1.0.2 (before 1.1.0) or LibreSSL (before 3.5.0) */
- 
- /* mutexes for multi-threaded OpenSSL (see "man 3ssl threads" and example in crypto/threads/mttest.c) */
- 
--- 
-2.39.1
-
diff --git a/package/zabbix/zabbix-agent.service b/package/zabbix/zabbix-agent.service
index 8b4f45a4fc..7e06636a2a 100644
--- a/package/zabbix/zabbix-agent.service
+++ b/package/zabbix/zabbix-agent.service
@@ -4,7 +4,7 @@ After=network.target
  
 [Service]
 Type=forking
-ExecStart=/usr/sbin/zabbix_agentd
+ExecStart=/usr/sbin/zabbix_agentd -f
 ExecReload=/usr/sbin/zabbix_agentd -R config_cache_reload
 RuntimeDirectory=zabbix
 PIDFile=/run/zabbix/zabbix_agentd.pid
diff --git a/package/zabbix/zabbix-server.service b/package/zabbix/zabbix-server.service
index b8ba0d1707..52ed5df1ea 100644
--- a/package/zabbix/zabbix-server.service
+++ b/package/zabbix/zabbix-server.service
@@ -4,7 +4,7 @@ After=network.target
  
 [Service]
 Type=forking
-ExecStart=/usr/sbin/zabbix_server
+ExecStart=/usr/sbin/zabbix_server -f
 ExecReload=/usr/sbin/zabbix_server -R config_cache_reload
 RuntimeDirectory=zabbix
 PIDFile=/run/zabbix/zabbix_server.pid
diff --git a/package/zabbix/zabbix.hash b/package/zabbix/zabbix.hash
index bb6127e5ec..4648ed8b71 100644
--- a/package/zabbix/zabbix.hash
+++ b/package/zabbix/zabbix.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  6d423810667b948ed22052d9aa84a035e2d4b92cbe8efdb669cac529806b722d  zabbix-6.2.7.tar.gz
+sha256  173059f57f11716146da79345e5a6bc52eceee6a5c4410664b8500a955598b2a  zabbix-7.0.3.tar.gz
 sha256  f8fc3fd12521b60d53d8c5d48a883eb3c9c5ddec9de986a273e1b77f69d811db  README
 sha256  444fe54aecc95ac0f3314289c300afc73b3946a4dc9fbd7e022709b3e0924dd0  COPYING
diff --git a/package/zabbix/zabbix.mk b/package/zabbix/zabbix.mk
index 18fb01deca..07d92d0abd 100644
--- a/package/zabbix/zabbix.mk
+++ b/package/zabbix/zabbix.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-ZABBIX_VERSION_MAJOR = 6.2
-ZABBIX_VERSION = $(ZABBIX_VERSION_MAJOR).7
-ZABBIX_SITE = https://cdn.zabbix.com/zabbix/sources/oldstable/$(ZABBIX_VERSION_MAJOR)
+ZABBIX_VERSION_MAJOR = 7.0
+ZABBIX_VERSION = $(ZABBIX_VERSION_MAJOR).3
+ZABBIX_SITE = https://cdn.zabbix.com/zabbix/sources/stable/$(ZABBIX_VERSION_MAJOR)
 ZABBIX_SELINUX_MODULES = zabbix
 ZABBIX_LICENSE = GPL-2.0+
 ZABBIX_LICENSE_FILES = README COPYING
@@ -50,7 +50,7 @@ ZABBIX_CONF_OPTS += --without-libcurl
 endif
 
 ifeq ($(BR2_PACKAGE_LIBXML2),y)
-ZABBIX_CONF_OPTS += --with-libxml2=$(STAGING_DIR)/usr/bin/xml2-config
+ZABBIX_CONF_OPTS += --with-libxml2=$(STAGING_DIR)/usr
 ZABBIX_DEPENDENCIES += libxml2
 else
 ZABBIX_CONF_OPTS += --without-libxml2
@@ -77,8 +77,10 @@ else
 ZABBIX_CONF_OPTS += --without-ssh2
 endif
 
-# Only one of openssl or gnutls should be enabled
-ifeq ($(BR2_PACKAGE_OPENSSL),y)
+# Only one of openssl or gnutls should be enabled. libressl is not
+# supported, which is why we test BR2_PACKAGE_LIBOPENSSL, not
+# BR2_PACKAGE_OPENSSL
+ifeq ($(BR2_PACKAGE_LIBOPENSSL),y)
 ZABBIX_CONF_OPTS += --with-openssl=$(STAGING_DIR)/usr --without-gnutls
 ZABBIX_DEPENDENCIES += openssl
 else ifeq ($(BR2_PACKAGE_GNUTLS),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

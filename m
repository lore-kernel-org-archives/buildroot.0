Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14856EEB566
	for <buildroot@archiver.kernel.org>; Fri,  8 Sep 2023 20:02:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9D80C410D7;
	Fri,  8 Sep 2023 20:02:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9D80C410D7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id v-QMynbdoxAc; Fri,  8 Sep 2023 20:02:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 55821414A1;
	Fri,  8 Sep 2023 20:02:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 55821414A1
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 473CE1BF303
 for <buildroot@lists.busybox.net>; Fri,  8 Sep 2023 20:01:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1F9F740220
 for <buildroot@lists.busybox.net>; Fri,  8 Sep 2023 20:01:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1F9F740220
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4yGZwr5pi_bf for <buildroot@lists.busybox.net>;
 Fri,  8 Sep 2023 20:01:48 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0A0C240B59
 for <buildroot@buildroot.org>; Fri,  8 Sep 2023 20:01:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0A0C240B59
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id ED25786B2B; Fri,  8 Sep 2023 20:01:47 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 8 Sep 2023 21:47:13 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0d68ad6afec153ad1268dafa8b98fb2197c2ef61
X-Git-Newrev: c142cd2354846885ce9ddb6a3bb8becd2b261740
X-Patchwork-Hint: ignore
Message-Id: <20230908200147.ED25786B2B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/php-pecl-dbus: bump version to
 b147624d480c3353e6c700e9a2d0c6f14d853941
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

commit: https://git.buildroot.net/buildroot/commit/?id=c142cd2354846885ce9ddb6a3bb8becd2b261740
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop upstream patches.

Signed-off-by: Adam Duskett <aduskett@gmail.comm>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/php-pecl-dbus/0001-php8-compat.patch       | 158 ---------------------
 ...atibility-with-php8-call_user_function_ex.patch |  32 -----
 package/php-pecl-dbus/php-pecl-dbus.hash           |   2 +-
 package/php-pecl-dbus/php-pecl-dbus.mk             |   2 +-
 4 files changed, 2 insertions(+), 192 deletions(-)

diff --git a/package/php-pecl-dbus/0001-php8-compat.patch b/package/php-pecl-dbus/0001-php8-compat.patch
deleted file mode 100644
index acca6e1d49..0000000000
--- a/package/php-pecl-dbus/0001-php8-compat.patch
+++ /dev/null
@@ -1,158 +0,0 @@
-From 7fde4dd4d26d2a4b7957a1010c6ea9e4b940fc62 Mon Sep 17 00:00:00 2001
-From: Stefan Saraev <stefan@saraev.ca>
-Date: Mon, 18 Jan 2021 23:22:52 +0200
-Subject: [PATCH] php8 compat
-
-Upstream: https://github.com/derickr/pecl-dbus/pull/8
-Signed-off-by: Herve Codina <herve.codina@bootlin.com>
----
- dbus.c     | 55 ++++++++++++++++++++++++++++++------------------------
- php_dbus.h | 10 ++++++++++
- 2 files changed, 41 insertions(+), 24 deletions(-)
-
-diff --git a/dbus.c b/dbus.c
-index 9fde647..a98e2ea 100644
---- a/dbus.c
-+++ b/dbus.c
-@@ -38,6 +38,9 @@
- #define Z_ADDREF_P(z) ((z)->refcount++)
- #endif
- 
-+ZEND_BEGIN_ARG_INFO_EX(arginfo_void, 0, 0, 0)
-+ZEND_END_ARG_INFO()
-+
- /* {{{ arginfo */
- ZEND_BEGIN_ARG_INFO_EX(arginfo_dbus_object___call, 0, 0, 2)
- 	ZEND_ARG_INFO(0, function_name)
-@@ -46,44 +49,44 @@ ZEND_END_ARG_INFO()
- /* }}} */
- 
- const zend_function_entry dbus_funcs_dbus[] = {
--	PHP_ME(Dbus, __construct, NULL, ZEND_ACC_CTOR|ZEND_ACC_PUBLIC)
--	PHP_ME(Dbus, addWatch,    NULL, ZEND_ACC_PUBLIC)
--	PHP_ME(Dbus, waitLoop,    NULL, ZEND_ACC_PUBLIC)
--	PHP_ME(Dbus, requestName, NULL, ZEND_ACC_PUBLIC)
--	PHP_ME(Dbus, registerObject, NULL, ZEND_ACC_PUBLIC)
--	PHP_ME(Dbus, createProxy, NULL, ZEND_ACC_PUBLIC)
-+	PHP_ME(Dbus, __construct, arginfo_void, ZEND_ACC_CTOR|ZEND_ACC_PUBLIC)
-+	PHP_ME(Dbus, addWatch,    arginfo_void, ZEND_ACC_PUBLIC)
-+	PHP_ME(Dbus, waitLoop,    arginfo_void, ZEND_ACC_PUBLIC)
-+	PHP_ME(Dbus, requestName, arginfo_void, ZEND_ACC_PUBLIC)
-+	PHP_ME(Dbus, registerObject, arginfo_void, ZEND_ACC_PUBLIC)
-+	PHP_ME(Dbus, createProxy, arginfo_void, ZEND_ACC_PUBLIC)
- 	PHP_FE_END
- };
- 
- const zend_function_entry dbus_funcs_dbus_object[] = {
--	PHP_ME(DbusObject, __construct, NULL, ZEND_ACC_CTOR|ZEND_ACC_PRIVATE)
-+	PHP_ME(DbusObject, __construct, arginfo_void, ZEND_ACC_CTOR|ZEND_ACC_PRIVATE)
- 	PHP_ME(DbusObject, __call,      arginfo_dbus_object___call, ZEND_ACC_PUBLIC)
- 	PHP_FE_END
- };
- 
- const zend_function_entry dbus_funcs_dbus_signal[] = {
--	PHP_ME(DbusSignal, __construct, NULL, ZEND_ACC_CTOR|ZEND_ACC_PUBLIC)
--	PHP_ME(DbusSignal, matches,     NULL, ZEND_ACC_PUBLIC)
--	PHP_ME(DbusSignal, getData,     NULL, ZEND_ACC_PUBLIC)
--	PHP_ME(DbusSignal, send,        NULL, ZEND_ACC_PUBLIC)
-+	PHP_ME(DbusSignal, __construct, arginfo_void, ZEND_ACC_CTOR|ZEND_ACC_PUBLIC)
-+	PHP_ME(DbusSignal, matches,     arginfo_void, ZEND_ACC_PUBLIC)
-+	PHP_ME(DbusSignal, getData,     arginfo_void, ZEND_ACC_PUBLIC)
-+	PHP_ME(DbusSignal, send,        arginfo_void, ZEND_ACC_PUBLIC)
- 	PHP_FE_END
- };
- 
- const zend_function_entry dbus_funcs_dbus_array[] = {
--	PHP_ME(DbusArray, __construct, NULL, ZEND_ACC_CTOR|ZEND_ACC_PUBLIC)
--	PHP_ME(DbusArray, getData,     NULL, ZEND_ACC_PUBLIC)
-+	PHP_ME(DbusArray, __construct, arginfo_void, ZEND_ACC_CTOR|ZEND_ACC_PUBLIC)
-+	PHP_ME(DbusArray, getData,     arginfo_void, ZEND_ACC_PUBLIC)
- 	PHP_FE_END
- };
- 
- const zend_function_entry dbus_funcs_dbus_dict[] = {
--	PHP_ME(DbusDict, __construct, NULL, ZEND_ACC_CTOR|ZEND_ACC_PUBLIC)
--	PHP_ME(DbusDict, getData,     NULL, ZEND_ACC_PUBLIC)
-+	PHP_ME(DbusDict, __construct, arginfo_void, ZEND_ACC_CTOR|ZEND_ACC_PUBLIC)
-+	PHP_ME(DbusDict, getData,     arginfo_void, ZEND_ACC_PUBLIC)
- 	PHP_FE_END
- };
- 
- #define PHP_DBUS_INT_WRAPPER_DEF(s,t) \
- 	const zend_function_entry dbus_funcs_dbus_##s[] = { \
--		PHP_ME(Dbus##t, __construct, NULL, ZEND_ACC_CTOR|ZEND_ACC_PUBLIC) \
-+		PHP_ME(Dbus##t, __construct, arginfo_void, ZEND_ACC_CTOR|ZEND_ACC_PUBLIC) \
- 		PHP_FE_END \
- 	};
- 
-@@ -98,26 +101,26 @@ PHP_DBUS_INT_WRAPPER_DEF(uint64,UInt64);
- PHP_DBUS_INT_WRAPPER_DEF(double, Double);
- 
- const zend_function_entry dbus_funcs_dbus_variant[] = {
--	PHP_ME(DbusVariant, __construct, NULL, ZEND_ACC_CTOR|ZEND_ACC_PUBLIC)
--	PHP_ME(DbusVariant, getData,     NULL, ZEND_ACC_PUBLIC)
-+	PHP_ME(DbusVariant, __construct, arginfo_void, ZEND_ACC_CTOR|ZEND_ACC_PUBLIC)
-+	PHP_ME(DbusVariant, getData,     arginfo_void, ZEND_ACC_PUBLIC)
- 	PHP_FE_END
- };
- 
- const zend_function_entry dbus_funcs_dbus_set[] = {
--	PHP_ME(DbusSet, __construct, NULL, ZEND_ACC_CTOR|ZEND_ACC_PUBLIC)
--	PHP_ME(DbusSet, getData,     NULL, ZEND_ACC_PUBLIC)
-+	PHP_ME(DbusSet, __construct, arginfo_void, ZEND_ACC_CTOR|ZEND_ACC_PUBLIC)
-+	PHP_ME(DbusSet, getData,     arginfo_void, ZEND_ACC_PUBLIC)
- 	PHP_FE_END
- };
- 
- const zend_function_entry dbus_funcs_dbus_struct[] = {
--	PHP_ME(DbusStruct, __construct, NULL, ZEND_ACC_CTOR|ZEND_ACC_PUBLIC)
--	PHP_ME(DbusStruct, getData,     NULL, ZEND_ACC_PUBLIC)
-+	PHP_ME(DbusStruct, __construct, arginfo_void, ZEND_ACC_CTOR|ZEND_ACC_PUBLIC)
-+	PHP_ME(DbusStruct, getData,     arginfo_void, ZEND_ACC_PUBLIC)
- 	PHP_FE_END
- };
- 
- const zend_function_entry dbus_funcs_dbus_object_path[] = {
--	PHP_ME(DbusObjectPath, __construct, NULL, ZEND_ACC_CTOR|ZEND_ACC_PUBLIC)
--	PHP_ME(DbusObjectPath, getData,     NULL, ZEND_ACC_PUBLIC)
-+	PHP_ME(DbusObjectPath, __construct, arginfo_void, ZEND_ACC_CTOR|ZEND_ACC_PUBLIC)
-+	PHP_ME(DbusObjectPath, getData,     arginfo_void, ZEND_ACC_PUBLIC)
- 	PHP_FE_END
- };
- 
-@@ -405,7 +408,11 @@ static void dbus_register_classes(TSRMLS_D)
- 	dbus_ce_dbus = zend_register_internal_class_ex(&ce_dbus, NULL);
- 	memcpy(&dbus_object_handlers_dbus, zend_get_std_object_handlers(), sizeof(zend_object_handlers));
- 	dbus_object_handlers_dbus.clone_obj = dbus_object_clone_dbus;
-+#if PHP_VERSION_ID < 80000
- 	dbus_object_handlers_dbus.compare_objects = dbus_object_compare_dbus;
-+#else
-+	dbus_object_handlers_dbus.compare = dbus_object_compare_dbus;
-+#endif
- 
- 	zend_declare_class_constant_long(dbus_ce_dbus, "BYTE", sizeof("BYTE")-1, DBUS_TYPE_BYTE TSRMLS_CC);
- 	zend_declare_class_constant_long(dbus_ce_dbus, "BOOLEAN", sizeof("BOOLEAN")-1, DBUS_TYPE_BOOLEAN TSRMLS_CC);
-diff --git a/php_dbus.h b/php_dbus.h
-index 8817544..1f0f551 100644
---- a/php_dbus.h
-+++ b/php_dbus.h
-@@ -25,6 +25,16 @@
- #include "config.h"
- #endif
- 
-+#if PHP_VERSION_ID >= 80000
-+#ifndef TSRMLS_D
-+#define TSRMLS_D void
-+#define TSRMLS_DC
-+#define TSRMLS_C
-+#define TSRMLS_CC
-+#define TSRMLS_FETCH()
-+#endif
-+#endif /* PHP_VERSION_ID >= 80000 */
-+
- #include "Zend/zend_hash.h"
- 
- #define PHP_DBUS_VERSION "0.2.0"
--- 
-2.31.1
-
diff --git a/package/php-pecl-dbus/0002-Fix-compatibility-with-php8-call_user_function_ex.patch b/package/php-pecl-dbus/0002-Fix-compatibility-with-php8-call_user_function_ex.patch
deleted file mode 100644
index 5babce94b4..0000000000
--- a/package/php-pecl-dbus/0002-Fix-compatibility-with-php8-call_user_function_ex.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 8cf66c4b5dd657ca14552b27a42901db0a5e9280 Mon Sep 17 00:00:00 2001
-From: Herve Codina <herve.codina@bootlin.com>
-Date: Mon, 4 Oct 2021 17:13:45 +0200
-Subject: [PATCH] Fix compatibility with php8 - call_user_function_ex
-
-This patch fixes compatibility with php8 replacing
-call_user_function_ex by call_user_function.
-
-Upstream: https://github.com/derickr/pecl-dbus/pull/8
-Signed-off-by: Herve Codina <herve.codina@bootlin.com>
----
- dbus.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/dbus.c b/dbus.c
-index a98e2ea..6fa9897 100644
---- a/dbus.c
-+++ b/dbus.c
-@@ -1015,8 +1015,8 @@ php_dbus_do_method_call(php_dbus_obj *dbus,
- 		method_args = safe_emalloc(sizeof(zval *), num_elems, 0);
- 	}
- 
--	if (call_user_function_ex(EG(function_table), object, &callback, &retval,
--				              num_elems, method_args, 0, NULL) == SUCCESS) {
-+	if (call_user_function(EG(function_table), object, &callback, &retval,
-+				              num_elems, method_args) == SUCCESS) {
- 		if (!Z_ISUNDEF(retval)) {
- 			reply = dbus_message_new_method_return(msg);
- 			php_dbus_append_parameters(reply, &retval, NULL,
--- 
-2.31.1
-
diff --git a/package/php-pecl-dbus/php-pecl-dbus.hash b/package/php-pecl-dbus/php-pecl-dbus.hash
index f43e2c8b51..122636913c 100644
--- a/package/php-pecl-dbus/php-pecl-dbus.hash
+++ b/package/php-pecl-dbus/php-pecl-dbus.hash
@@ -1,3 +1,3 @@
 # Locally calculated:
-sha256  c48761c645c6fa42b57af0e65d893217dc69bcd8d879ace74d6abbf1c5f73a8f  php-pecl-dbus-315d17558c7614d02e923d898231e51c86a25789.tar.gz
+sha256  652db988457479682ef1bbe00952d746b54150e77f06a4d75ffa3a696f5321ba  php-pecl-dbus-b147624d480c3353e6c700e9a2d0c6f14d853941.tar.gz
 sha256  ecc8b74820c32fb82ddee80446205408585d75d1632ac959fb3cdf8eaf3877b5  LICENSE
diff --git a/package/php-pecl-dbus/php-pecl-dbus.mk b/package/php-pecl-dbus/php-pecl-dbus.mk
index a70a2e7ae1..84cc373bb7 100644
--- a/package/php-pecl-dbus/php-pecl-dbus.mk
+++ b/package/php-pecl-dbus/php-pecl-dbus.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_PECL_DBUS_VERSION = 315d17558c7614d02e923d898231e51c86a25789
+PHP_PECL_DBUS_VERSION = b147624d480c3353e6c700e9a2d0c6f14d853941
 PHP_PECL_DBUS_SITE = $(call github,derickr,pecl-dbus,$(PHP_PECL_DBUS_VERSION))
 PHP_PECL_DBUS_LICENSE = PHP-3.01
 PHP_PECL_DBUS_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

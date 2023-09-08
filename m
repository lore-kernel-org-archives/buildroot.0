Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B089EEB569
	for <buildroot@archiver.kernel.org>; Fri,  8 Sep 2023 20:03:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EF60B4159F;
	Fri,  8 Sep 2023 20:03:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EF60B4159F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uYP5w6KNpq2U; Fri,  8 Sep 2023 20:03:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B7F5D41DAD;
	Fri,  8 Sep 2023 20:03:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B7F5D41DAD
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2D8181BF303
 for <buildroot@lists.busybox.net>; Fri,  8 Sep 2023 20:01:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9A5F581F3D
 for <buildroot@lists.busybox.net>; Fri,  8 Sep 2023 20:01:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9A5F581F3D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id A5O0MrBMyr_i for <buildroot@lists.busybox.net>;
 Fri,  8 Sep 2023 20:01:48 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E104181F2A
 for <buildroot@buildroot.org>; Fri,  8 Sep 2023 20:01:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E104181F2A
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CE5EB86B2C; Fri,  8 Sep 2023 20:01:47 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 8 Sep 2023 21:47:06 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c024ab1732b5fdf131ac8cfad5530225b976f610
X-Git-Newrev: c69f12d1c192cdc635c768fb144b6c5186ae6b5e
X-Patchwork-Hint: ignore
Message-Id: <20230908200147.CE5EB86B2C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/php-gnupg: bump version to 1.5.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=c69f12d1c192cdc635c768fb144b6c5186ae6b5e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop upstream patch

Signed-off-by: Adam Duskett <aduskett@gmail.comm>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .checkpackageignore                                |  1 -
 .../0001-Remove-inlining-_phpc_res_close.patch     | 33 ----------------------
 package/php-gnupg/php-gnupg.hash                   |  2 +-
 package/php-gnupg/php-gnupg.mk                     |  2 +-
 4 files changed, 2 insertions(+), 36 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 4062d0cb9a..c407581d2c 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1111,7 +1111,6 @@ package/perl-net-ssleay/0001-fix-build-system.patch Upstream
 package/perl-sys-cpu/0001-remove-extraneous-include.patch Upstream
 package/perl-xml-libxml/0001-Makefile-PL.patch Upstream
 package/php-geoip/0001-add-build-support-for-php8.patch Upstream
-package/php-gnupg/0001-Remove-inlining-_phpc_res_close.patch Upstream
 package/php-lua/0001-ZEND_ACC_ALLOW_STATIC-ZEND_ACC_STATIC-for-static-met.patch Upstream
 package/php-lua/0002-php8-explicitly-declare-arginfo.patch Upstream
 package/php-zmq/0001-updates-for-php7.4-and-php8.0.patch Upstream
diff --git a/package/php-gnupg/0001-Remove-inlining-_phpc_res_close.patch b/package/php-gnupg/0001-Remove-inlining-_phpc_res_close.patch
deleted file mode 100644
index 9b94cb7e4f..0000000000
--- a/package/php-gnupg/0001-Remove-inlining-_phpc_res_close.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 887b0899d7e7423baec691255c2d8b56bb348ecd Mon Sep 17 00:00:00 2001
-From: Jakub Zelenka <bukka@php.net>
-Date: Sun, 14 Mar 2021 18:52:21 +0000
-Subject: [PATCH] Remove inlining _phpc_res_close
-
-[Retrieved from:
-https://github.com/bukka/phpc/commit/887b0899d7e7423baec691255c2d8b56bb348ecd]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- phpc.h | 8 --------
- 1 file changed, 8 deletions(-)
-
-diff --git a/phpc/phpc.h b/phpc/phpc.h
-index dc5887e..9206105 100644
---- a/phpc/phpc.h
-+++ b/phpc/phpc.h
-@@ -945,16 +945,8 @@ typedef zend_resource * phpc_res_value_t;
- 	zend_fetch_resource2(Z_RES_P(_pz_res), _res_type_name, _res_type_1, _res_type_2)
- #define PHPC_RES_DELETE(_pz_res) \
- 	zend_list_delete(Z_RES_P(_pz_res))
--#if PHP_MAJOR_VERSION < 8
- #define PHPC_RES_CLOSE(_pz_res) \
- 	zend_list_close(Z_RES_P(_pz_res))
--#else
--inline int _phpc_res_close(zval *zres) {
--	zend_list_close(Z_RES_P(zres));
--	return SUCCESS;
--}
--#define PHPC_RES_CLOSE _phpc_res_close
--#endif
- 
- /* resource to zval */
- #define PHPC_RES_PZVAL(_res, _pzv) \
diff --git a/package/php-gnupg/php-gnupg.hash b/package/php-gnupg/php-gnupg.hash
index 99ffe87f46..084de7750a 100644
--- a/package/php-gnupg/php-gnupg.hash
+++ b/package/php-gnupg/php-gnupg.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  d4f5f79aa483908f3df08e5b343ea3593c6d725b9ed2103e30242627659e0a64  gnupg-1.5.0.tgz
+sha256  a9906f465ab2343cb2f3127ee209c72760238745c34878d9bbc1576486219252  gnupg-1.5.1.tgz
 sha256  da1136d4d9326317cbd320dadddf7e9b4b4edffd973eb083cb7b9754fb6a15d9  LICENSE
diff --git a/package/php-gnupg/php-gnupg.mk b/package/php-gnupg/php-gnupg.mk
index a89f0978af..89054f5f7c 100644
--- a/package/php-gnupg/php-gnupg.mk
+++ b/package/php-gnupg/php-gnupg.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_GNUPG_VERSION = 1.5.0
+PHP_GNUPG_VERSION = 1.5.1
 PHP_GNUPG_SOURCE = gnupg-$(PHP_GNUPG_VERSION).tgz
 PHP_GNUPG_SITE = https://pecl.php.net/get
 # phpize does the autoconf magic
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

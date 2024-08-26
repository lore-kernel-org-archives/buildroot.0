Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9477BC5321E
	for <buildroot@archiver.kernel.org>; Mon, 26 Aug 2024 08:19:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CA4FF400E5;
	Mon, 26 Aug 2024 08:19:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kpnydPYlQGju; Mon, 26 Aug 2024 08:19:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1B6E6404FC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1B6E6404FC;
	Mon, 26 Aug 2024 08:19:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E2EAF1BF2A1
 for <buildroot@lists.busybox.net>; Mon, 26 Aug 2024 08:19:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D15A4402C1
 for <buildroot@lists.busybox.net>; Mon, 26 Aug 2024 08:19:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id glPr5IQnf0_3 for <buildroot@lists.busybox.net>;
 Mon, 26 Aug 2024 08:19:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.238.66.15;
 helo=helium.openadk.org; envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B1C40402C0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B1C40402C0
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B1C40402C0
 for <buildroot@buildroot.org>; Mon, 26 Aug 2024 08:19:06 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 5FD3D3537AF7; Mon, 26 Aug 2024 10:19:04 +0200 (CEST)
Date: Mon, 26 Aug 2024 10:19:04 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <Zsw6eH7ZKW2oXJni@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 5.10.0-31-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1724660344; bh=ZWcdOdoivYP+lRpGgQ+KkVqWXcZqx6leQ8/kUzjNa7E=;
 h=Date:From:To:Subject:From;
 b=jQaol//n/UAE+67OsACRNZjSgW8Z9a0z+xrDfIB+nvPyzl/2TaX0RVldkVsFLB3cb
 zT3WbADQlJ2zGsEka6eUjyl1CTRKm/FSA8Q7Hz9Oj0BNVDGfun4FcSthcIHilDyq3b
 V5sOcWaY6MM3VXUDcNtd5O9I05+B5snMdKDYXCdTtiy2H8m9Vd44KsXoW/vY3a15Rz
 XEOIAV2Kg0sYpqdTdTEtQg7i0E8QQeIBPESDAYMHsrPVHIipLAQhHrRML6dtO1j05M
 2agUV3ytuPyIA+Z4ncvi19FtIn6GLWiG9nhbaGUQym3xv10paJ3BIc19nobJjiUeN1
 joOS33otryCuw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256
 header.s=2022 header.b=jQaol//n
Subject: [Buildroot] [PATCH next] package/freeradius-server: update to 3.2.6
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

See here for the release notes:
https://www.freeradius.org/release_notes/

Patch 0001 is rebased to this version.
Patch 0005 is upstream.
Patch 0009 got renamed to fillup the gap.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 .../0001-jlibtool-cross-with-host-CC.patch    | 17 ++++-----
 ...dules-rlm_sql-remove-mysql_version.h.patch | 37 -------------------
 ...les-rlm_python-fix-build-with-Ofast.patch} |  0
 .../freeradius-server/freeradius-server.hash  |  4 +-
 .../freeradius-server/freeradius-server.mk    |  2 +-
 5 files changed, 11 insertions(+), 49 deletions(-)
 delete mode 100644 package/freeradius-server/0005-modules-rlm_sql-remove-mysql_version.h.patch
 rename package/freeradius-server/{0009-src-modules-rlm_python-fix-build-with-Ofast.patch => 0005-src-modules-rlm_python-fix-build-with-Ofast.patch} (100%)

diff --git a/package/freeradius-server/0001-jlibtool-cross-with-host-CC.patch b/package/freeradius-server/0001-jlibtool-cross-with-host-CC.patch
index 94205754c2..170d040f96 100644
--- a/package/freeradius-server/0001-jlibtool-cross-with-host-CC.patch
+++ b/package/freeradius-server/0001-jlibtool-cross-with-host-CC.patch
@@ -10,28 +10,27 @@ Upstream: Not applicable
 Signed-off-by: David Gouarin <david.gouarin@thalesgroup.com>
 Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
 [Fabrice: update for 3.2.3]
-SIgned-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 [Dario: make the patch to be applied with fuzz factor 0]
 Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
+[Waldemar: update for 3.2.6]
+Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
 ---
  scripts/libtool.mk | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/scripts/libtool.mk b/scripts/libtool.mk
-index 57915e1053..c28260dd7e 100644
+index 64c2fe0804..9dc7910463 100644
 --- a/scripts/libtool.mk
 +++ b/scripts/libtool.mk
-@@ -48,8 +48,8 @@ ifeq "${LIBTOOL}" "JLIBTOOL"
-     # binary!
-     ${JLIBTOOL}: ${top_makedir}/jlibtool.c
+@@ -40,8 +40,8 @@ all install: ${JLIBTOOL}
+ # binary!
+ ${JLIBTOOL}: ${top_makedir}/jlibtool.c
  	$(Q)mkdir -p $(dir $@)
 -	$(Q)echo CC jlibtool.c
 -	$(Q)${CC} $< -o $@ ${JLIBTOOL_DEFS}
 +	$(Q)echo HOSTCC jlibtool.c
 +	$(Q)${HOSTCC} $< -o $@ ${JLIBTOOL_DEFS}
  
-     clean: jlibtool_clean
+ clean: jlibtool_clean
  
--- 
-2.17.1
-
diff --git a/package/freeradius-server/0005-modules-rlm_sql-remove-mysql_version.h.patch b/package/freeradius-server/0005-modules-rlm_sql-remove-mysql_version.h.patch
deleted file mode 100644
index 42e8c2088c..0000000000
--- a/package/freeradius-server/0005-modules-rlm_sql-remove-mysql_version.h.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 77b8c75f9904897768f87e20fef5d7739ddcd3c7 Mon Sep 17 00:00:00 2001
-From: Jared Bents <jared.bents@rockwellcollins.com>
-Date: Tue, 4 Feb 2020 08:22:11 -0600
-Subject: [PATCH] modules/rlm_sql: remove mysql_version.h
-
-remove mysql_version.h as mysql.h is included and mysql_version.h
-should not be included by per the header file warning
-
-Upstream: http://lists.freeradius.org/pipermail/freeradius-devel/2021-April/014218.html
-
-Signed-off-by: Jared Bents <jared.bents@rockwellcollins.com>
-Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
-[Applied upstream as https://github.com/FreeRADIUS/freeradius-server/commit/f20e80fce5f1b0589dccdf441b5d835188c0dfa2]
----
- src/modules/rlm_sql/drivers/rlm_sql_mysql/rlm_sql_mysql.c | 2 --
- 1 file changed, 2 deletions(-)
-
-diff --git a/src/modules/rlm_sql/drivers/rlm_sql_mysql/rlm_sql_mysql.c b/src/modules/rlm_sql/drivers/rlm_sql_mysql/rlm_sql_mysql.c
-index a7992647cd..ea44d0cc7a 100644
---- a/src/modules/rlm_sql/drivers/rlm_sql_mysql/rlm_sql_mysql.c
-+++ b/src/modules/rlm_sql/drivers/rlm_sql_mysql/rlm_sql_mysql.c
-@@ -34,12 +34,10 @@ RCSID("$Id$")
- #include "config.h"
- 
- #ifdef HAVE_MYSQL_MYSQL_H
--#  include <mysql/mysql_version.h>
- #  include <mysql/errmsg.h>
- #  include <mysql/mysql.h>
- #  include <mysql/mysqld_error.h>
- #elif defined(HAVE_MYSQL_H)
--#  include <mysql_version.h>
- #  include <errmsg.h>
- #  include <mysql.h>
- #  include <mysqld_error.h>
--- 
-2.17.1
-
diff --git a/package/freeradius-server/0009-src-modules-rlm_python-fix-build-with-Ofast.patch b/package/freeradius-server/0005-src-modules-rlm_python-fix-build-with-Ofast.patch
similarity index 100%
rename from package/freeradius-server/0009-src-modules-rlm_python-fix-build-with-Ofast.patch
rename to package/freeradius-server/0005-src-modules-rlm_python-fix-build-with-Ofast.patch
diff --git a/package/freeradius-server/freeradius-server.hash b/package/freeradius-server/freeradius-server.hash
index 6ee8f7786c..2c0991a399 100644
--- a/package/freeradius-server/freeradius-server.hash
+++ b/package/freeradius-server/freeradius-server.hash
@@ -1,4 +1,4 @@
 # Locally computed, after checking
-# https://freeradius.org/ftp/pub/freeradius/freeradius-server-3.2.3.tar.bz2.sig
-sha256  4a16aeffbfa1424e1f317fdf71d17e5523a4fd9564d87c747a60595ef93c5d1f  freeradius-server-3.2.3.tar.bz2
+# https://freeradius.org/ftp/pub/freeradius/freeradius-server-3.2.6.tar.bz2.sig
+sha256  18bbb2318448f13918897ae7a38b36afd3db7dd5c66f78ad24d2e0051269d9b2  freeradius-server-3.2.6.tar.bz2
 sha256  0a0e46014fc2efd5144a30359c0e6e1ea9fa3dd407d3318204150efd7b4caf6a  COPYRIGHT
diff --git a/package/freeradius-server/freeradius-server.mk b/package/freeradius-server/freeradius-server.mk
index 1ec77a1cc4..94c9331b3d 100644
--- a/package/freeradius-server/freeradius-server.mk
+++ b/package/freeradius-server/freeradius-server.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FREERADIUS_SERVER_VERSION = 3.2.3
+FREERADIUS_SERVER_VERSION = 3.2.6
 FREERADIUS_SERVER_SOURCE = \
 	freeradius-server-$(FREERADIUS_SERVER_VERSION).tar.bz2
 FREERADIUS_SERVER_SITE = https://freeradius.org/ftp/pub/freeradius
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

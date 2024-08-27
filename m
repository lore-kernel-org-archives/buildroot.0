Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02941E6FE46
	for <buildroot@archiver.kernel.org>; Fri,  6 Sep 2024 20:04:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9D9BB84159;
	Fri,  6 Sep 2024 20:04:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EEWGwI43Qvrh; Fri,  6 Sep 2024 20:04:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 52EDB846B2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 52EDB846B2;
	Fri,  6 Sep 2024 20:04:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6C6BB1BF20B
 for <buildroot@lists.busybox.net>; Fri,  6 Sep 2024 19:59:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8896840C13
 for <buildroot@lists.busybox.net>; Fri,  6 Sep 2024 19:59:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rwowkLRDDBA5 for <buildroot@lists.busybox.net>;
 Fri,  6 Sep 2024 19:58:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C9EC0407C6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C9EC0407C6
 for <buildroot@buildroot.org>; Fri,  6 Sep 2024 19:58:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C439F828EF; Fri,  6 Sep 2024 19:58:57 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 27 Aug 2024 18:48:18 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3ded56bd1bca34f30331618ad38b74457942c5e7
X-Git-Newrev: 88c3ea5a08aa7393a110ecc39a7194d8b5a64685
X-Patchwork-Hint: ignore
Message-Id: <20240906195857.C439F828EF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/freeradius-server: update to 3.2.6
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

commit: https://git.buildroot.net/buildroot/commit/?id=88c3ea5a08aa7393a110ecc39a7194d8b5a64685
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

See here for the release notes:
https://www.freeradius.org/release_notes/

Patch 0001 is rebased to this version.
Patch 0005 is upstream.
Patch 0009 got renamed to fillup the gap.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0001-jlibtool-cross-with-host-CC.patch         | 17 +++++-----
 ...05-modules-rlm_sql-remove-mysql_version.h.patch | 37 ----------------------
 ...-modules-rlm_python-fix-build-with-Ofast.patch} |  0
 package/freeradius-server/freeradius-server.hash   |  4 +--
 package/freeradius-server/freeradius-server.mk     |  2 +-
 5 files changed, 11 insertions(+), 49 deletions(-)

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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

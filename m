Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65706C4167B
	for <buildroot@archiver.kernel.org>; Sun,  3 Dec 2023 22:23:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0A6244012E;
	Sun,  3 Dec 2023 22:23:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0A6244012E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XHAOlHWAPjuW; Sun,  3 Dec 2023 22:23:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CBED2409BD;
	Sun,  3 Dec 2023 22:23:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CBED2409BD
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 771E41BF94D
 for <buildroot@lists.busybox.net>; Sun,  3 Dec 2023 22:23:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 50E188175E
 for <buildroot@lists.busybox.net>; Sun,  3 Dec 2023 22:23:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 50E188175E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8FfVRi8YS62n for <buildroot@lists.busybox.net>;
 Sun,  3 Dec 2023 22:23:19 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6BF8C8175B
 for <buildroot@buildroot.org>; Sun,  3 Dec 2023 22:23:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6BF8C8175B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5A8C3878FC; Sun,  3 Dec 2023 22:23:19 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 3 Dec 2023 23:19:58 +0100
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 21bef8d8559aff2a0bbeb6aa63c396fd1c96f929
X-Git-Newrev: c60ef116855b2d78f604048a80660601c0e09621
X-Patchwork-Hint: ignore
Message-Id: <20231203222319.5A8C3878FC@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/mariadb: needs fmt
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

commit: https://git.buildroot.net/buildroot/commit/?id=c60ef116855b2d78f604048a80660601c0e09621
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

Buildroot commit 88c7359f65381d49fa497f9e33bf54bb31a14e6c bumped mariadb
from version 10.3.36 to 10.11.4.

Upstream added fmt as dependency in version 10.7.1 with commit
https://github.com/MariaDB/server/commit/e214e60201216b2e6330f86a84fec8ae14aa2887

Fixes:
http://autobuild.buildroot.net/results/ce1/ce140a3923bc2f85b176fafcc38c6f68b177d33a/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 821f9dee8112dc02fe58d60273d0dfdabbc46d1f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mariadb/mariadb.mk | 4 ++++
 package/mysql/Config.in    | 8 ++++++--
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/package/mariadb/mariadb.mk b/package/mariadb/mariadb.mk
index a743d020c0..a9cd9c9516 100644
--- a/package/mariadb/mariadb.mk
+++ b/package/mariadb/mariadb.mk
@@ -18,12 +18,16 @@ MARIADB_CONFIG_SCRIPTS = mysql_config
 
 MARIADB_DEPENDENCIES = \
 	host-mariadb \
+	fmt \
 	ncurses \
 	openssl \
 	zlib \
 	libaio \
 	libxml2
 
+MARIADB_CONF_OPTS += \
+	-DWITH_FMT=system
+
 # use bundled GPL-2.0+ licensed readline as package/readline is GPL-3.0+
 MARIADB_CONF_OPTS += -DWITH_READLINE=ON
 
diff --git a/package/mysql/Config.in b/package/mysql/Config.in
index ef4a9531a7..8212d0fd3f 100644
--- a/package/mysql/Config.in
+++ b/package/mysql/Config.in
@@ -16,10 +16,13 @@ choice
 
 config BR2_PACKAGE_MARIADB
 	bool "mariadb"
+	depends on BR2_INSTALL_LIBSTDCPP # fmt
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_TOOLCHAIN_HAS_ATOMIC || BR2_TOOLCHAIN_HAS_SYNC_8
+	depends on BR2_USE_WCHAR # fmt
 	select BR2_PACKAGE_LIBAIO
 	select BR2_PACKAGE_LIBXML2
+	select BR2_PACKAGE_FMT
 	select BR2_PACKAGE_NCURSES
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_HAS_MYSQL
@@ -30,8 +33,9 @@ config BR2_PACKAGE_MARIADB
 
 	  http://www.mariadb.org/
 
-comment "mariadb needs a toolchain w/ dynamic library"
-	depends on BR2_STATIC_LIBS
+comment "mariadb needs a toolchain w/ dynamic library, C++, wchar"
+	depends on BR2_STATIC_LIBS || !BR2_INSTALL_LIBSTDCPP \
+		|| !BR2_USE_WCHAR
 	depends on BR2_TOOLCHAIN_HAS_ATOMIC || BR2_TOOLCHAIN_HAS_SYNC_8
 
 config BR2_PACKAGE_ORACLE_MYSQL
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

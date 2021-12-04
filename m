Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8989C433F5
	for <buildroot@archiver.kernel.org>; Sat,  4 Dec 2021 21:57:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6F3B24041A;
	Sat,  4 Dec 2021 21:57:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OR_iowH1rlzY; Sat,  4 Dec 2021 21:57:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3A66140261;
	Sat,  4 Dec 2021 21:57:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0A11E1BF36B
 for <buildroot@lists.busybox.net>; Sat,  4 Dec 2021 21:57:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EC55540260
 for <buildroot@lists.busybox.net>; Sat,  4 Dec 2021 21:57:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id v6U8T423RPLq for <buildroot@lists.busybox.net>;
 Sat,  4 Dec 2021 21:57:36 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id F18C9401AF
 for <buildroot@buildroot.org>; Sat,  4 Dec 2021 21:57:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id C2A429358C; Sat,  4 Dec 2021 21:52:42 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sat, 4 Dec 2021 22:57:12 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 721f05420cb5908aa19eef47f96418aa6cd04398
X-Git-Newrev: 1b21d7e4fb7a8f96476a221a277ca436871267b4
X-Patchwork-Hint: ignore
Message-Id: <20211204215242.C2A429358C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/sysrepo: bump version
 to 2.0.53
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

commit: https://git.buildroot.net/buildroot/commit/?id=1b21d7e4fb7a8f96476a221a277ca436871267b4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The license changed from Apache-2.0 to BSD-3-Clause

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...FIX-build-with-musl-libc-fails-due-to-unk.patch | 42 ++++++++++++++++++++++
 package/sysrepo/Config.in                          |  3 +-
 package/sysrepo/sysrepo.hash                       |  4 +--
 package/sysrepo/sysrepo.mk                         |  8 ++---
 4 files changed, 49 insertions(+), 8 deletions(-)

diff --git a/package/sysrepo/0001-sysrepo-BUGFIX-build-with-musl-libc-fails-due-to-unk.patch b/package/sysrepo/0001-sysrepo-BUGFIX-build-with-musl-libc-fails-due-to-unk.patch
new file mode 100644
index 0000000000..784cfb1445
--- /dev/null
+++ b/package/sysrepo/0001-sysrepo-BUGFIX-build-with-musl-libc-fails-due-to-unk.patch
@@ -0,0 +1,42 @@
+From 896dc6aee38898fe1c6822ee6a4a4989d21c650b Mon Sep 17 00:00:00 2001
+From: Heiko Thiery <heiko.thiery@gmail.com>
+Date: Thu, 25 Nov 2021 12:18:06 +0100
+Subject: [PATCH] sysrepo BUGFIX build with musl libc fails due to unknown type
+ name 'mode_t'
+
+When building against the musl libc the build will fail due to the
+missing sys/type.h include.
+
+Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
+---
+ src/plugins_datastore.h    | 1 +
+ src/plugins_notification.h | 1 +
+ 2 files changed, 2 insertions(+)
+
+diff --git a/src/plugins_datastore.h b/src/plugins_datastore.h
+index a64e4131..d577e929 100644
+--- a/src/plugins_datastore.h
++++ b/src/plugins_datastore.h
+@@ -18,6 +18,7 @@
+ #define _SYSREPO_PLUGINS_DATASTORE_H
+ 
+ #include <stdint.h>
++#include <sys/types.h>
+ 
+ #include <libyang/libyang.h>
+ 
+diff --git a/src/plugins_notification.h b/src/plugins_notification.h
+index 2099db62..f410e8d9 100644
+--- a/src/plugins_notification.h
++++ b/src/plugins_notification.h
+@@ -18,6 +18,7 @@
+ #define _SYSREPO_PLUGINS_NOTIFICATION_H
+ 
+ #include <stdint.h>
++#include <sys/types.h>
+ 
+ #include <libyang/libyang.h>
+ 
+-- 
+2.30.2
+
diff --git a/package/sysrepo/Config.in b/package/sysrepo/Config.in
index 8de141efc2..52df1bc4c3 100644
--- a/package/sysrepo/Config.in
+++ b/package/sysrepo/Config.in
@@ -6,8 +6,7 @@ config BR2_PACKAGE_SYSREPO
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
 	select BR2_PACKAGE_LIBYANG
-	select BR2_PACKAGE_PCRE
-	select BR2_PACKAGE_PCRE_UCP
+	select BR2_PACKAGE_PCRE2
 	help
 	  Sysrepo is an YANG-based configuration and operational state
 	  data store for Unix/Linux applications.
diff --git a/package/sysrepo/sysrepo.hash b/package/sysrepo/sysrepo.hash
index 693a2bbf7d..b382c16036 100644
--- a/package/sysrepo/sysrepo.hash
+++ b/package/sysrepo/sysrepo.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  2cc7537a03f48dc3c955436e1e0ed077bc3b31a755d6979d24ca42e1187fce01  sysrepo-1.4.122.tar.gz
-sha256  b40930bbcf80744c86c46a12bc9da056641d722716c378f5659b9e555ef833e1  LICENSE
+sha256  fe09da5f40fb53e3fb97268a134cc0ed3003f0018d0d117c73e81e1553a11f30  sysrepo-2.0.53.tar.gz
+sha256  88f1b7e5c64d2c113e07105aa9c0fb80639b40287565be1c2afd0949df83d826  LICENSE
diff --git a/package/sysrepo/sysrepo.mk b/package/sysrepo/sysrepo.mk
index c0db05e52c..acb3052023 100644
--- a/package/sysrepo/sysrepo.mk
+++ b/package/sysrepo/sysrepo.mk
@@ -4,13 +4,13 @@
 #
 ################################################################################
 
-SYSREPO_VERSION = 1.4.122
+SYSREPO_VERSION = 2.0.53
 SYSREPO_SITE = $(call github,sysrepo,sysrepo,v$(SYSREPO_VERSION))
 SYSREPO_INSTALL_STAGING = YES
-SYSREPO_LICENSE = Apache-2.0
+SYSREPO_LICENSE = BSD-3-Clause
 SYSREPO_LICENSE_FILES = LICENSE
-SYSREPO_DEPENDENCIES = libyang pcre host-sysrepo
-HOST_SYSREPO_DEPENDENCIES = host-libyang host-pcre
+SYSREPO_DEPENDENCIES = libyang pcre2 host-sysrepo
+HOST_SYSREPO_DEPENDENCIES = host-libyang host-pcre2
 
 SYSREPO_CONF_OPTS = \
 	-DBUILD_EXAMPLES=$(if $(BR2_PACKAGE_SYSREPO_EXAMPLES),ON,OFF) \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

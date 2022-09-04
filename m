Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C4AAC6FA82
	for <buildroot@archiver.kernel.org>; Sun,  4 Sep 2022 07:41:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 954CE60BC6;
	Sun,  4 Sep 2022 07:41:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 954CE60BC6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5cjEtEH04cIa; Sun,  4 Sep 2022 07:41:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7683E60669;
	Sun,  4 Sep 2022 07:41:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7683E60669
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0CB3C1BF2CC
 for <buildroot@lists.busybox.net>; Sun,  4 Sep 2022 07:40:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E7983408C2
 for <buildroot@lists.busybox.net>; Sun,  4 Sep 2022 07:40:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E7983408C2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rdaaaTjkoJFw for <buildroot@lists.busybox.net>;
 Sun,  4 Sep 2022 07:40:53 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id ADCF540891
 for <buildroot@buildroot.org>; Sun,  4 Sep 2022 07:40:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ADCF540891
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 60906881F5; Sun,  4 Sep 2022 07:25:39 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 4 Sep 2022 09:38:41 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: fc7ba3ab8fa6c3144098fae057c758d35279e46f
X-Git-Newrev: 5a8c013bb0f0d1be9eb8f1c169f9ee69a6389635
X-Patchwork-Hint: ignore
Message-Id: <20220904072539.60906881F5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/lua-lunix: bump to
 version 20220331
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

commit: https://git.buildroot.net/buildroot/commit/?id=5a8c013bb0f0d1be9eb8f1c169f9ee69a6389635
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

remove merged patches

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/lua-lunix/0001-fix-with-uClibc.patch       | 28 ----------------------
 ...brt.patch => 0001-remove-link-with-librt.patch} |  8 +++----
 package/lua-lunix/0003-fix-sysctl-detection.patch  | 24 -------------------
 package/lua-lunix/lua-lunix.hash                   |  4 ++--
 package/lua-lunix/lua-lunix.mk                     |  2 +-
 5 files changed, 7 insertions(+), 59 deletions(-)

diff --git a/package/lua-lunix/0001-fix-with-uClibc.patch b/package/lua-lunix/0001-fix-with-uClibc.patch
deleted file mode 100644
index 236eec47a1..0000000000
--- a/package/lua-lunix/0001-fix-with-uClibc.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From ee41d97a80b978f54941ac6857c00b8a8f28de24 Mon Sep 17 00:00:00 2001
-From: Francois Perrad <francois.perrad@gadz.org>
-Date: Sun, 6 Jun 2021 17:55:06 +0200
-Subject: [PATCH] fix with uClibc
-
-uClibc doesn't have is no sys_siglist.
-
-Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
----
- lunix-rel-20170920/src/unix.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/lunix-rel-20170920/src/unix.c b/lunix-rel-20170920/src/unix.c
-index 5f3a70a..e561ab2 100644
---- a/lunix-rel-20170920/src/unix.c
-+++ b/lunix-rel-20170920/src/unix.c
-@@ -438,7 +438,7 @@
- #endif
- 
- #ifndef HAVE_SYS_SIGLIST
--#define HAVE_SYS_SIGLIST (!MUSL_MAYBE && !__sun && !_AIX)
-+#define HAVE_SYS_SIGLIST (!MUSL_MAYBE && !__sun && !_AIX && !__UCLIBC__)
- #endif
- 
- #ifndef HAVE_UNLINKAT
--- 
-2.30.2
-
diff --git a/package/lua-lunix/0002-remove-link-with-librt.patch b/package/lua-lunix/0001-remove-link-with-librt.patch
similarity index 70%
rename from package/lua-lunix/0002-remove-link-with-librt.patch
rename to package/lua-lunix/0001-remove-link-with-librt.patch
index 7b1c8ddd57..2650e9117c 100644
--- a/package/lua-lunix/0002-remove-link-with-librt.patch
+++ b/package/lua-lunix/0001-remove-link-with-librt.patch
@@ -7,13 +7,13 @@ librt is not available with musl
 
 Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
 ---
- lunix-rel-20170920/lunix-20170920-1.rockspec | 10 ----------
+ lunix-rel-20220331/lunix-20220331-1.rockspec | 10 ----------
  1 file changed, 10 deletions(-)
 
-diff --git a/lunix-rel-20170920/lunix-20170920-1.rockspec b/lunix-rel-20170920/lunix-20170920-1.rockspec
+diff --git a/lunix-rel-20220331/lunix-20220331-1.rockspec b/lunix-rel-20220331/lunix-20220331-1.rockspec
 index 741179d..76cafeb 100644
---- a/lunix-rel-20170920/lunix-20170920-1.rockspec
-+++ b/lunix-rel-20170920/lunix-20170920-1.rockspec
+--- a/lunix-rel-20220331/lunix-20220331-1.rockspec
++++ b/lunix-rel-20220331/lunix-20220331-1.rockspec
 @@ -26,16 +26,6 @@ build = {
  		};
  	};
diff --git a/package/lua-lunix/0003-fix-sysctl-detection.patch b/package/lua-lunix/0003-fix-sysctl-detection.patch
deleted file mode 100644
index 18656b1921..0000000000
--- a/package/lua-lunix/0003-fix-sysctl-detection.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-sys/sysctl.h was removed with glibc 2.32
-
-Fetched from: https://github.com/wahern/lunix/pull/20/files
-Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
----
- lunix-rel-20170920/src/unix.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/lunix-rel-20170920/src/unix.c b/lunix-rel-20170920/src/unix.c
-index 272820a..fa00876 100644
---- a/lunix-rel-20170920/src/unix.c
-+++ b/lunix-rel-20170920/src/unix.c
-@@ -165,7 +165,7 @@
- #endif
- 
- #ifndef HAVE_SYS_SYSCTL_H /* missing on musl libc */
--#define HAVE_SYS_SYSCTL_H (defined BSD || GLIBC_PREREQ(0,0) || UCLIBC_PREREQ(0,0,0))
-+#define HAVE_SYS_SYSCTL_H (defined BSD || (__GLIBC__ && !GLIBC_PREREQ(2,32)) || UCLIBC_PREREQ(0,0,0))
- #endif
- 
- #ifndef HAVE_STRUCT_IN_PKTINFO
--- 
-2.30.2
-
diff --git a/package/lua-lunix/lua-lunix.hash b/package/lua-lunix/lua-lunix.hash
index 6e3c920db4..911f475b0e 100644
--- a/package/lua-lunix/lua-lunix.hash
+++ b/package/lua-lunix/lua-lunix.hash
@@ -1,3 +1,3 @@
 # computed by luarocks/buildroot
-sha256  4a4007b394ae884e18e9d0319ea584e8b4a682d7bf8fa5b99c7eea9baf1e5ed6  lunix-20170920-1.src.rock
-sha256  9b74be104d59caa45bf3321ebe771f9cc7874209261a93f1cf971ceca44fbe03  lunix-rel-20170920/LICENSE
+sha256  eb13e89e1dfcc82aec3915ed4185f3a2a9205ec3e98a991b13cc39d7f389c427  lunix-20220331-1.src.rock
+sha256  9b74be104d59caa45bf3321ebe771f9cc7874209261a93f1cf971ceca44fbe03  lunix-rel-20220331/LICENSE
diff --git a/package/lua-lunix/lua-lunix.mk b/package/lua-lunix/lua-lunix.mk
index 28cb2dc411..f3c159cbf4 100644
--- a/package/lua-lunix/lua-lunix.mk
+++ b/package/lua-lunix/lua-lunix.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUA_LUNIX_VERSION_UPSTREAM = 20170920
+LUA_LUNIX_VERSION_UPSTREAM = 20220331
 LUA_LUNIX_VERSION = $(LUA_LUNIX_VERSION_UPSTREAM)-1
 LUA_LUNIX_NAME_UPSTREAM = lunix
 LUA_LUNIX_SUBDIR = lunix-rel-$(LUA_LUNIX_VERSION_UPSTREAM)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

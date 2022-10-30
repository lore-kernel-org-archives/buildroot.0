Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57D17FA3742
	for <buildroot@archiver.kernel.org>; Sun, 30 Oct 2022 16:29:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 065794030D;
	Sun, 30 Oct 2022 16:29:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 065794030D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qHOHVVh71w8X; Sun, 30 Oct 2022 16:29:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B605E401AF;
	Sun, 30 Oct 2022 16:29:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B605E401AF
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 847801BF479
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 16:28:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6DC6640198
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 16:28:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6DC6640198
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lZ9v-xM4Yje9 for <buildroot@lists.busybox.net>;
 Sun, 30 Oct 2022 16:28:07 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 219244011F
 for <buildroot@buildroot.org>; Sun, 30 Oct 2022 16:28:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 219244011F
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1055687570; Sun, 30 Oct 2022 16:28:07 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 30 Oct 2022 17:20:09 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 702a60a2962172d725b210da42da2289a219a83f
X-Git-Newrev: e9bc980d93a189a16e7320bd254b906c87ca9f87
X-Patchwork-Hint: ignore
Message-Id: <20221030162807.1055687570@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/numactl: bump to version 2.0.16
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

commit: https://git.buildroot.net/buildroot/commit/?id=e9bc980d93a189a16e7320bd254b906c87ca9f87
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Drop patches (already in version)
- Use official tarball and so drop autoreconf

https://github.com/numactl/numactl/releases/tag/v2.0.15
https://github.com/numactl/numactl/releases/tag/v2.0.16

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .../0001-Do-not-stringify-SYMVER-symbols.patch     | 25 -----------
 .../numactl/0002-link-with-latomic-if-needed.patch | 52 ----------------------
 package/numactl/numactl.hash                       |  2 +-
 package/numactl/numactl.mk                         |  6 +--
 4 files changed, 4 insertions(+), 81 deletions(-)

diff --git a/package/numactl/0001-Do-not-stringify-SYMVER-symbols.patch b/package/numactl/0001-Do-not-stringify-SYMVER-symbols.patch
deleted file mode 100644
index c6981aaf73..0000000000
--- a/package/numactl/0001-Do-not-stringify-SYMVER-symbols.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-From f96c96af7fbf2779b15f66f03b10315a24fb4f5a Mon Sep 17 00:00:00 2001
-From: Scott McMillan <smcmillan@nvidia.com>
-Date: Fri, 9 Oct 2020 08:56:52 -0500
-Subject: [PATCH] Do not stringify SYMVER symbols
-
-Upstream: f96c96af7fbf2779b15f66f03b10315a24fb4f5a
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
----
- util.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/util.h b/util.h
-index 99ada33..f2a20ac 100644
---- a/util.h
-+++ b/util.h
-@@ -22,5 +22,5 @@ extern char *policy_name(int policy);
- #if HAVE_ATTRIBUTE_SYMVER
- #define SYMVER(a,b) __attribute__ ((symver (b)))
- #else
--#define SYMVER(a,b) __asm__ (".symver " #a "," #b);
-+#define SYMVER(a,b) __asm__ (".symver " a "," b);
- #endif
--- 
-2.30.2
-
diff --git a/package/numactl/0002-link-with-latomic-if-needed.patch b/package/numactl/0002-link-with-latomic-if-needed.patch
deleted file mode 100644
index 6dff0cb233..0000000000
--- a/package/numactl/0002-link-with-latomic-if-needed.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-From e0de0d9e981ddb53bdeb4a4b9dc43046c9ff4ff9 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Thu, 6 May 2021 23:08:36 +0200
-Subject: [PATCH] link with -latomic if needed
-
-numactl unconditionally uses __atomic_fetch_and but some architectures
-(e.g. sparc) needs to link with -latomic to be able to use it. So check
-if -latomic is needed and update numa.pc accordingly
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Retrieved from:
-https://github.com/numactl/numactl/commit/e0de0d9e981ddb53bdeb4a4b9dc43046c9ff4ff9]
----
- Makefile.am  | 1 +
- configure.ac | 2 ++
- numa.pc.in   | 1 +
- 3 files changed, 4 insertions(+)
-
-diff --git a/Makefile.am b/Makefile.am
-index 44d0d76..34f6815 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -151,6 +151,7 @@ SED_PROCESS = \
-         -e 's,@exec_prefix\@,$(exec_prefix),g' \
-         -e 's,@libdir\@,$(libdir),g' \
-         -e 's,@includedir\@,$(includedir),g' \
-+        -e 's,@LIBS\@,$(LIBS),g' \
-         < $< > $@ || rm $@
- 
- %.pc: %.pc.in Makefile
-diff --git a/configure.ac b/configure.ac
-index 659a765..e3b0eb3 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -24,6 +24,8 @@ AM_CONDITIONAL([HAVE_TREE_VECTORIZE], [test x"${tree_vectorize}" = x"true"])
- 
- AC_CONFIG_FILES([Makefile])
- 
-+AC_SEARCH_LIBS([__atomic_fetch_and_1], [atomic])
-+
- # GCC tries to be "helpful" and only issue a warning for unrecognized
- # attributes.  So we compile the test with Werror, so that if the
- # attribute is not recognized the compilation fails
-diff --git a/numa.pc.in b/numa.pc.in
-index 8a0f202..cc04d50 100644
---- a/numa.pc.in
-+++ b/numa.pc.in
-@@ -8,3 +8,4 @@ Description: NUMA policy library
- Version: @VERSION@
- Cflags: -I${includedir}
- Libs: -L${libdir} -lnuma
-+Libs.Private: @LIBS@
diff --git a/package/numactl/numactl.hash b/package/numactl/numactl.hash
index a261eab9d0..757001b750 100644
--- a/package/numactl/numactl.hash
+++ b/package/numactl/numactl.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  1ee27abd07ff6ba140aaf9bc6379b37825e54496e01d6f7343330cf1a4487035  numactl-2.0.14.tar.gz
+sha256  1b242f893af977a1d31af6ce9d6b8dafdd2d8ec3dc9207f7c2dc0d3446e7c7c8  numactl-2.0.16.tar.gz
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  LICENSE.GPL2
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  LICENSE.LGPL2.1
diff --git a/package/numactl/numactl.mk b/package/numactl/numactl.mk
index 6ff94091e9..b2f349255f 100644
--- a/package/numactl/numactl.mk
+++ b/package/numactl/numactl.mk
@@ -4,12 +4,12 @@
 #
 ################################################################################
 
-NUMACTL_VERSION = 2.0.14
-NUMACTL_SITE = $(call github,numactl,numactl,v$(NUMACTL_VERSION))
+NUMACTL_VERSION = 2.0.16
+NUMACTL_SITE = \
+	https://github.com/numactl/numactl/releases/download/v$(NUMACTL_VERSION)
 NUMACTL_LICENSE = LGPL-2.1 (libnuma), GPL-2.0 (programs)
 NUMACTL_LICENSE_FILES = LICENSE.GPL2 LICENSE.LGPL2.1
 NUMACTL_INSTALL_STAGING = YES
-NUMACTL_AUTORECONF = YES
 NUMACTL_CONF_ENV = CFLAGS="$(TARGET_CFLAGS) -fPIC"
 
 $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

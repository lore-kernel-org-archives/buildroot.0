Return-Path: <SRS0=7Pu+=OC=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56148C433F5
	for <buildroot@archiver.kernel.org>; Sun, 12 Sep 2021 12:01:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DDD106113E
	for <buildroot@archiver.kernel.org>; Sun, 12 Sep 2021 12:01:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DDD106113E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8934660BDA;
	Sun, 12 Sep 2021 12:01:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MPaRLSU0YcfP; Sun, 12 Sep 2021 12:01:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9474160BDB;
	Sun, 12 Sep 2021 12:01:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 63D7F1BF956
 for <buildroot@lists.busybox.net>; Sun, 12 Sep 2021 12:00:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 52DF140267
 for <buildroot@lists.busybox.net>; Sun, 12 Sep 2021 12:00:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MJIPZE5WNII4 for <buildroot@lists.busybox.net>;
 Sun, 12 Sep 2021 12:00:55 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 10528401E9
 for <buildroot@buildroot.org>; Sun, 12 Sep 2021 12:00:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id CCA2E8A3E4; Sun, 12 Sep 2021 11:59:14 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 12 Sep 2021 13:57:56 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a7864c4ff43e4cd1a4186d102b9ab3e608504793
X-Git-Newrev: 8654c8d80e06a1dc57590ada0fab48fb0445fffd
X-Patchwork-Hint: ignore
Message-Id: <20210912115914.CCA2E8A3E4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pipewire: bump to version 0.3.35
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0716395947475907652=="
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

--===============0716395947475907652==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=8654c8d80e06a1dc57590ada0fab48fb0445fffd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update download to use official gitlab source url.

Drop patches that are now upstream.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...-meson-fix-getrandom-detection-for-uclibc.patch | 49 ------------------
 .../0002-modules-fix-typo-in-module-rtkit.patch    | 31 ------------
 ...use-_gettid-instead-of-getpid-in-fallback.patch | 28 -----------
 .../0004-modules-improve-_gettid-wrapper.patch     | 58 ----------------------
 package/pipewire/pipewire.hash                     |  2 +-
 package/pipewire/pipewire.mk                       |  5 +-
 6 files changed, 4 insertions(+), 169 deletions(-)

diff --git a/package/pipewire/0001-meson-fix-getrandom-detection-for-uclibc.patch b/package/pipewire/0001-meson-fix-getrandom-detection-for-uclibc.patch
deleted file mode 100644
index e902869ce9..0000000000
--- a/package/pipewire/0001-meson-fix-getrandom-detection-for-uclibc.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From a36bc959768e100d2d72e027746e3a9d95cf29af Mon Sep 17 00:00:00 2001
-From: Peter Seiderer <ps.report@gmx.net>
-Date: Wed, 12 May 2021 22:08:39 +0200
-Subject: [PATCH] meson: fix getrandom detection for uclibc
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-The getrandom() detection from meson.build failes with the following error
-message:
-
-  .../host/x86_64-buildroot-linux-uclibc/sysroot/usr/include/sys/random.h:27:35: error: unknown type name 'size_t'
-     27 | extern int getrandom(void *__buf, size_t count, unsigned int flags)
-        |                                   ^~~~~~
-  .../host/x86_64-buildroot-linux-uclibc/sysroot/usr/include/sys/random.h:8:1: note: 'size_t' is defined in header '<stddef.h>'; did you forget to '#include <stddef.h>'?
-
-Fix it by adding stddef.h include to the meson getrandom() detection.
-
-Fixes:
-
-  ../src/pipewire/impl-core.c:54:9: error: conflicting types for ‘getrandom’
-     54 | ssize_t getrandom(void *buf, size_t buflen, unsigned int flags) {
-        |         ^~~~~~~~~
-  In file included from ../src/pipewire/impl-core.c:34:
-  .../host/x86_64-buildroot-linux-uclibc/sysroot/usr/include/sys/random.h:27:12: note: previous declaration of ‘getrandom’ was here
-     27 | extern int getrandom(void *__buf, size_t count, unsigned int flags)
-        |            ^~~~~~~~~
-
-Signed-off-by: Peter Seiderer <ps.report@gmx.net>
----
- meson.build | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/meson.build b/meson.build
-index 03a9d174..01b4c7c8 100644
---- a/meson.build
-+++ b/meson.build
-@@ -274,7 +274,7 @@ if cc.has_function('memfd_create', prefix : '#include <sys/mman.h>', args : [ '-
-   cdata.set('HAVE_MEMFD_CREATE', 1)
- endif
- 
--if cc.has_function('getrandom', prefix : '#include <sys/random.h>', args : [ '-D_GNU_SOURCE' ])
-+if cc.has_function('getrandom', prefix : '#include <stddef.h>\n#include <sys/random.h>', args : [ '-D_GNU_SOURCE' ])
-   cdata.set('HAVE_GETRANDOM', 1)
- endif
- 
--- 
-2.31.1
-
diff --git a/package/pipewire/0002-modules-fix-typo-in-module-rtkit.patch b/package/pipewire/0002-modules-fix-typo-in-module-rtkit.patch
deleted file mode 100644
index 99d5167ebf..0000000000
--- a/package/pipewire/0002-modules-fix-typo-in-module-rtkit.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 9160a127b5069ee1ca3bdf11857a04f75099041d Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?=C3=89rico=20Nogueira?= <erico.erc@gmail.com>
-Date: Tue, 20 Jul 2021 12:01:21 -0300
-Subject: [PATCH] modules: fix typo in module-rtkit
-
-Was using the gettid() function directly instead of the _gettid()
-wrapper.
-
-[Retrieved from:
-https://gitlab.freedesktop.org/pipewire/pipewire/-/commit/9160a127b5069ee1ca3bdf11857a04f75099041d]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- src/modules/module-rtkit.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/modules/module-rtkit.c b/src/modules/module-rtkit.c
-index de30f4123..419e4be81 100644
---- a/src/modules/module-rtkit.c
-+++ b/src/modules/module-rtkit.c
-@@ -518,7 +518,7 @@ static void *custom_start(void *data)
- 	struct impl *impl = this->impl;
- 
- 	pthread_mutex_lock(&impl->lock);
--	this->pid = gettid();
-+	this->pid = _gettid();
- 	pthread_cond_broadcast(&impl->cond);
- 	pthread_mutex_unlock(&impl->lock);
- 
--- 
-GitLab
-
diff --git a/package/pipewire/0003-rtkit-use-_gettid-instead-of-getpid-in-fallback.patch b/package/pipewire/0003-rtkit-use-_gettid-instead-of-getpid-in-fallback.patch
deleted file mode 100644
index 854f268ba7..0000000000
--- a/package/pipewire/0003-rtkit-use-_gettid-instead-of-getpid-in-fallback.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From a4b8bd6d5292c13c0e14db54d4b5819a2bbf066d Mon Sep 17 00:00:00 2001
-From: Wim Taymans <wtaymans@redhat.com>
-Date: Tue, 20 Jul 2021 17:13:26 +0200
-Subject: [PATCH] rtkit: use _gettid() instead of getpid() in fallback
-
-[Retrieved from:
-https://gitlab.freedesktop.org/pipewire/pipewire/-/commit/a4b8bd6d5292c13c0e14db54d4b5819a2bbf066d]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- src/modules/module-rtkit.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/modules/module-rtkit.c b/src/modules/module-rtkit.c
-index 419e4be81..1f13aa371 100644
---- a/src/modules/module-rtkit.c
-+++ b/src/modules/module-rtkit.c
-@@ -592,7 +592,7 @@ static pid_t impl_gettid(struct impl *impl, pthread_t pt)
- 	if ((thr = find_thread_by_pt(impl, pt)) != NULL)
- 		pid = thr->pid;
- 	else
--		pid = getpid();
-+		pid = _gettid();
- 	pthread_mutex_unlock(&impl->lock);
- 
- 	return pid;
--- 
-GitLab
-
diff --git a/package/pipewire/0004-modules-improve-_gettid-wrapper.patch b/package/pipewire/0004-modules-improve-_gettid-wrapper.patch
deleted file mode 100644
index 56bdcf26f9..0000000000
--- a/package/pipewire/0004-modules-improve-_gettid-wrapper.patch
+++ /dev/null
@@ -1,58 +0,0 @@
-From 4c166709d06571b889a89812c962a91ba4d0a071 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?=C3=89rico=20Nogueira?= <erico.erc@gmail.com>
-Date: Tue, 20 Jul 2021 12:10:40 -0300
-Subject: [PATCH] modules: improve _gettid wrapper
-
-- use meson to check for gettid() function, always use if available
-- use syscall fallback on linux, if not
-- restrict thr_self() fallback to *only* FreeBSD
-- error out if there isn't any gettid impl
-
-[Retrieved from:
-https://gitlab.freedesktop.org/pipewire/pipewire/-/commit/4c166709d06571b889a89812c962a91ba4d0a071]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- meson.build                | 3 +++
- src/modules/module-rtkit.c | 8 ++++++--
- 2 files changed, 9 insertions(+), 2 deletions(-)
-
-diff --git a/meson.build b/meson.build
-index 838fb66be..977ce9ba1 100644
---- a/meson.build
-+++ b/meson.build
-@@ -254,6 +254,9 @@ endif
- if cc.has_function('getpagesize', prefix : '#include<unistd.h>')
-   cdata.set('HAVE_GETPAGESIZE', 1)
- endif
-+if cc.has_function('gettid', prefix : '#include<unistd.h>', args: [ '-D_GNU_SOURCE' ])
-+  cdata.set('HAVE_GETTID', 1)
-+endif
- if cc.has_function('clock_gettime', prefix : '#include <time.h>')
-   cdata.set('HAVE_CLOCK_GETTIME', 1)
- endif
-diff --git a/src/modules/module-rtkit.c b/src/modules/module-rtkit.c
-index 1f13aa371..7d55fb758 100644
---- a/src/modules/module-rtkit.c
-+++ b/src/modules/module-rtkit.c
-@@ -182,12 +182,16 @@ void pw_rtkit_bus_free(struct pw_rtkit_bus *system_bus)
- 
- static pid_t _gettid(void)
- {
--#ifndef __FreeBSD__
-+#if defined(HAVE_GETTID)
- 	return (pid_t) gettid();
--#else
-+#elif defined(__linux__)
-+	return syscall(SYS_gettid);
-+#elif defined(__FreeBSD__)
- 	long pid;
- 	thr_self(&pid);
- 	return (pid_t)pid;
-+#else
-+#error "No gettid impl"
- #endif
- }
- 
--- 
-GitLab
-
diff --git a/package/pipewire/pipewire.hash b/package/pipewire/pipewire.hash
index bcba64c6ca..a289464988 100644
--- a/package/pipewire/pipewire.hash
+++ b/package/pipewire/pipewire.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  8b2af6138529fd9214dd148f2a6304f13c16e0b0d3a4a98c1afa87b7e65c574f  pipewire-0.3.32.tar.gz
+sha256  ce7dbd71bce46c9d81c549d8c846e8f3a8a263a19bf981d141d57bd2d316e3ac  pipewire-0.3.35.tar.bz2
 sha256  8909c319a7e27dbb33a15b9035f89ab3b7b2f6a12f8bcddc755206a8db1ada44  COPYING
 sha256  be4be5d77424833edf31f53fc1f1cecb6996b9e2d747d9e6fb8f878362ebc92b  LICENSE
diff --git a/package/pipewire/pipewire.mk b/package/pipewire/pipewire.mk
index aee0191894..9259f0421f 100644
--- a/package/pipewire/pipewire.mk
+++ b/package/pipewire/pipewire.mk
@@ -4,8 +4,9 @@
 #
 ################################################################################
 
-PIPEWIRE_VERSION = 0.3.32
-PIPEWIRE_SITE = $(call github,PipeWire,pipewire,$(PIPEWIRE_VERSION))
+PIPEWIRE_VERSION = 0.3.35
+PIPEWIRE_SOURCE = pipewire-$(PIPEWIRE_VERSION).tar.bz2
+PIPEWIRE_SITE = https://gitlab.freedesktop.org/pipewire/pipewire/-/archive/$(PIPEWIRE_VERSION)
 PIPEWIRE_LICENSE = MIT, LGPL-2.1+ (libspa-alsa), GPL-2.0 (libjackserver)
 PIPEWIRE_LICENSE_FILES = COPYING LICENSE
 PIPEWIRE_INSTALL_STAGING = YES

--===============0716395947475907652==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0716395947475907652==--

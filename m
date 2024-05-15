Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C17AC25B75
	for <buildroot@archiver.kernel.org>; Wed, 15 May 2024 06:16:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 258DD41A64;
	Wed, 15 May 2024 06:16:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9qvYG0PgxGvs; Wed, 15 May 2024 06:16:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CC16941A58
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CC16941A58;
	Wed, 15 May 2024 06:16:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 079201BF59A
 for <buildroot@lists.busybox.net>; Wed, 15 May 2024 06:16:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D553B41989
 for <buildroot@lists.busybox.net>; Wed, 15 May 2024 06:16:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y9u2cI6EXVlO for <buildroot@lists.busybox.net>;
 Wed, 15 May 2024 06:16:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F0488419EF
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id F0488419EF
 for <buildroot@buildroot.org>; Wed, 15 May 2024 06:16:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id ED7EE87149; Wed, 15 May 2024 06:16:05 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 15 May 2024 08:15:16 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3f3c22d1bf2e2923eae88f1997925c38aeb49f28
X-Git-Newrev: 932b52fad87d79d9f26a343edafe2981079de16e
X-Patchwork-Hint: ignore
Message-Id: <20240515061605.ED7EE87149@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/php: bump version to 8.3.7
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

commit: https://git.buildroot.net/buildroot/commit/?id=932b52fad87d79d9f26a343edafe2981079de16e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Removed patch which is included in this release.

Changelog: https://www.php.net/ChangeLog-8.php#PHP_8_3
Release notes: https://news-web.php.net/php.announce/427

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...nd_call_stack.c-fix-build-without-pthread.patch | 39 ----------------------
 package/php/php.hash                               |  2 +-
 package/php/php.mk                                 |  2 +-
 3 files changed, 2 insertions(+), 41 deletions(-)

diff --git a/package/php/0006-Zend-zend_call_stack.c-fix-build-without-pthread.patch b/package/php/0006-Zend-zend_call_stack.c-fix-build-without-pthread.patch
deleted file mode 100644
index 10b0083655..0000000000
--- a/package/php/0006-Zend-zend_call_stack.c-fix-build-without-pthread.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From c3e37c438a11d59d858fcc7b46eac00a8074972b Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sat, 30 Mar 2024 17:51:55 +0100
-Subject: [PATCH] Zend/zend_call_stack.c: fix build without pthread
-
-Fix the following build failure without pthread raised since version
-8.3.0 and
-https://github.com/php/php-src/commit/a11c8a30399e90c17c287b9656c0077bc5131c9c:
-
-/home/buildroot/instance-0/output-1/build/php-8.3.4/Zend/zend_call_stack.c:39:11: fatal error: pthread.h: No such file or directory
-   39 | # include <pthread.h>
-      |           ^~~~~~~~~~~
-
-Fixes:
- - http://autobuild.buildroot.org/results/a4ef648a9da50b26ed56d5d490e4cf5a1bfff970
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Upstream: https://github.com/php/php-src/pull/13843
----
- Zend/zend_call_stack.c | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/Zend/zend_call_stack.c b/Zend/zend_call_stack.c
-index 97cbed9041..97de938a0f 100644
---- a/Zend/zend_call_stack.c
-+++ b/Zend/zend_call_stack.c
-@@ -35,7 +35,8 @@
- #  include <sys/types.h>
- # endif
- #endif /* ZEND_WIN32 */
--#if defined(__linux__) || defined(__FreeBSD__) || defined(__APPLE__) || defined(__OpenBSD__)
-+#if (defined(HAVE_PTHREAD_GETATTR_NP) && defined(HAVE_PTHREAD_ATTR_GETSTACK)) || \
-+    defined(__FreeBSD__) || defined(__APPLE__) || defined(__OpenBSD__)
- # include <pthread.h>
- #endif
- #ifdef __FreeBSD__
--- 
-2.43.0
-
diff --git a/package/php/php.hash b/package/php/php.hash
index 4378d7ed07..9b25eabd32 100644
--- a/package/php/php.hash
+++ b/package/php/php.hash
@@ -1,5 +1,5 @@
 # From https://www.php.net/downloads.php
-sha256  53c8386b2123af97626d3438b3e4058e0c5914cb74b048a6676c57ac647f5eae  php-8.3.6.tar.xz
+sha256  d53433c1ca6b2c8741afa7c524272e6806c1e895e5912a058494fea89988570a  php-8.3.7.tar.xz
 
 # License file
 sha256  b42e4df5e50e6ecda1047d503d6d91d71032d09ed1027ba1ef29eed26f890c5a  LICENSE
diff --git a/package/php/php.mk b/package/php/php.mk
index 5b26ec90e2..ad2d901dfd 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_VERSION = 8.3.6
+PHP_VERSION = 8.3.7
 PHP_SITE = https://www.php.net/distributions
 PHP_SOURCE = php-$(PHP_VERSION).tar.xz
 PHP_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

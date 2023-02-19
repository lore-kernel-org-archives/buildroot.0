Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31AF0C61DA3
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 02:04:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D635F6FB1C;
	Tue, 21 Feb 2023 02:04:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D635F6FB1C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NNrSFqki_Osf; Tue, 21 Feb 2023 02:04:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EBBA67015A;
	Tue, 21 Feb 2023 02:03:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EBBA67015A
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 245E31BF2B1
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 21:06:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AAA367002E
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:53:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AAA367002E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vwcGeo3bnCoQ for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:53:02 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 99DB97000E
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:53:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 99DB97000E
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 978FE828C8; Mon, 20 Feb 2023 20:53:02 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 19 Feb 2023 19:44:33 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 1c9622ae5084473b9eeb15b04673d081f5c9fa11
X-Git-Newrev: 5085b61121a55c830b4d1576ab52441dc1491e35
X-Patchwork-Hint: ignore
Message-Id: <20230220205302.978FE828C8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/git: security bump to
 version 2.39.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=5085b61121a55c830b4d1576ab52441dc1491e35
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Fix two CVEs (CVE-2023-22490 and CVE-2023-23946). For the full release
note, see [1].

While at it, also refresh two Buildroot patches introduced when the
package was bumped to 2.39.0.

[1]: https://lore.kernel.org/git/xmqqr0us5dio.fsf@gitster.g/

Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...001-git-compat-util-avoid-redefining-system-function-nam.patch | 8 +++++---
 ...002-git-compat-util-undefine-system-names-before-redecla.patch | 6 +++---
 package/git/git.hash                                              | 2 +-
 package/git/git.mk                                                | 2 +-
 4 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/package/git/0001-git-compat-util-avoid-redefining-system-function-nam.patch b/package/git/0001-git-compat-util-avoid-redefining-system-function-nam.patch
index dbde87940a..24100e1f6e 100644
--- a/package/git/0001-git-compat-util-avoid-redefining-system-function-nam.patch
+++ b/package/git/0001-git-compat-util-avoid-redefining-system-function-nam.patch
@@ -1,4 +1,4 @@
-From 385f67eb2254edb1fb4cf523e5e3d5a8f123d72c Mon Sep 17 00:00:00 2001
+From 86aeac96d04ae5381085c0f93acb12d3bfd06969 Mon Sep 17 00:00:00 2001
 From: Jeff King <peff@peff.net>
 Date: Wed, 30 Nov 2022 16:15:14 -0500
 Subject: [PATCH] git-compat-util: avoid redefining system function names
@@ -64,7 +64,7 @@ Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
  1 file changed, 8 insertions(+), 5 deletions(-)
 
 diff --git a/git-compat-util.h b/git-compat-util.h
-index a76d0526f7..e3456bdd0d 100644
+index af05077560..f6882b9b50 100644
 --- a/git-compat-util.h
 +++ b/git-compat-util.h
 @@ -341,11 +341,12 @@ struct itimerval {
@@ -83,7 +83,7 @@ index a76d0526f7..e3456bdd0d 100644
  #endif
  
  #ifndef NO_LIBGEN_H
-@@ -1471,14 +1472,16 @@ int open_nofollow(const char *path, int flags);
+@@ -1479,14 +1480,16 @@ int open_nofollow(const char *path, int flags);
  #endif
  
  #ifndef _POSIX_THREAD_SAFE_FUNCTIONS
@@ -102,6 +102,8 @@ index a76d0526f7..e3456bdd0d 100644
  #define getc_unlocked(fh) getc(fh)
  #endif
  
+
+base-commit: cbf04937d5b9fcf0a76c28f69e6294e9e3ecd7e6
 -- 
 An old man doll... just what I always wanted! - Clara
 
diff --git a/package/git/0002-git-compat-util-undefine-system-names-before-redecla.patch b/package/git/0002-git-compat-util-undefine-system-names-before-redecla.patch
index 9e3c9b662c..f6207300ee 100644
--- a/package/git/0002-git-compat-util-undefine-system-names-before-redecla.patch
+++ b/package/git/0002-git-compat-util-undefine-system-names-before-redecla.patch
@@ -1,4 +1,4 @@
-From 6d406390b870fdb2cd9d18b12ebfabc12f5096df Mon Sep 17 00:00:00 2001
+From d4a11fd215195cd1ca6a43058ef250b688ade1f4 Mon Sep 17 00:00:00 2001
 From: Jeff King <peff@peff.net>
 Date: Fri, 2 Dec 2022 06:05:38 -0500
 Subject: [PATCH] git-compat-util: undefine system names before redeclaring
@@ -29,7 +29,7 @@ Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
  1 file changed, 4 insertions(+)
 
 diff --git a/git-compat-util.h b/git-compat-util.h
-index e3456bdd0d..211861da0f 100644
+index f6882b9b50..dadb9e55cb 100644
 --- a/git-compat-util.h
 +++ b/git-compat-util.h
 @@ -346,6 +346,7 @@ static inline int git_setitimer(int which,
@@ -40,7 +40,7 @@ index e3456bdd0d..211861da0f 100644
  #define setitimer(which,value,ovalue) git_setitimer(which,value,ovalue)
  #endif
  
-@@ -1480,6 +1481,9 @@ static inline void git_funlockfile(FILE *fh)
+@@ -1488,6 +1489,9 @@ static inline void git_funlockfile(FILE *fh)
  {
  	; /* nothing */
  }
diff --git a/package/git/git.hash b/package/git/git.hash
index 75398896e5..b7840cd1eb 100644
--- a/package/git/git.hash
+++ b/package/git/git.hash
@@ -1,5 +1,5 @@
 # From: https://www.kernel.org/pub/software/scm/git/sha256sums.asc
-sha256  40a38a0847b30c371b35873b3afcf123885dd41ea3ecbbf510efa97f3ce5c161  git-2.39.1.tar.xz
+sha256  475f75f1373b2cd4e438706185175966d5c11f68c4db1e48c26257c43ddcf2d6  git-2.39.2.tar.xz
 # Locally calculated
 sha256  5b2198d1645f767585e8a88ac0499b04472164c0d2da22e75ecf97ef443ab32e  COPYING
 sha256  1922f45d2c49e390032c9c0ba6d7cac904087f7cec51af30c2b2ad022ce0e76a  LGPL-2.1
diff --git a/package/git/git.mk b/package/git/git.mk
index 1d728e1964..206d06ffe7 100644
--- a/package/git/git.mk
+++ b/package/git/git.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GIT_VERSION = 2.39.1
+GIT_VERSION = 2.39.2
 GIT_SOURCE = git-$(GIT_VERSION).tar.xz
 GIT_SITE = $(BR2_KERNEL_MIRROR)/software/scm/git
 GIT_LICENSE = GPL-2.0, LGPL-2.1+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

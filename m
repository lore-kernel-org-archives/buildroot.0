Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C7FBEC873B
	for <buildroot@archiver.kernel.org>; Thu,  7 Sep 2023 15:36:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EB0EA83CE2;
	Thu,  7 Sep 2023 15:36:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EB0EA83CE2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Gib4utVlHrbR; Thu,  7 Sep 2023 15:36:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EC57D83D23;
	Thu,  7 Sep 2023 15:36:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EC57D83D23
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2F7E41BF313
 for <buildroot@lists.busybox.net>; Thu,  7 Sep 2023 14:53:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 65A9741DFE
 for <buildroot@lists.busybox.net>; Thu,  7 Sep 2023 14:51:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 65A9741DFE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5gZ5YfSsIJcd for <buildroot@lists.busybox.net>;
 Thu,  7 Sep 2023 14:51:39 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E366241D74
 for <buildroot@buildroot.org>; Thu,  7 Sep 2023 14:51:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E366241D74
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E059386A22; Thu,  7 Sep 2023 14:51:32 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 25 Aug 2023 19:08:56 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7412789bfd55efc7797945a83bef4e4741faaf0e
X-Git-Newrev: 0a0786bc78555e33ffb0012ee88b3bb4fef10e61
X-Patchwork-Hint: ignore
Message-Id: <20230907145132.E059386A22@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ytree: bump version to 2.05
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

commit: https://git.buildroot.net/buildroot/commit/?id=0a0786bc78555e33ffb0012ee88b3bb4fef10e61
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes: https://www.han.de/~werner/ytree.html

Removed patch which was applied upstream in a slightly changed way.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .checkpackageignore               |  1 -
 package/ytree/0001-fix-musl.patch | 26 --------------------------
 package/ytree/ytree.hash          |  2 +-
 package/ytree/ytree.mk            |  2 +-
 4 files changed, 2 insertions(+), 29 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 5303a8f3d8..d8d3970b3d 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1594,7 +1594,6 @@ package/yajl/0003-Link-with-shared-libyajl-in-a-shared-build.patch Upstream
 package/yajl/0004-Link-libyajl-_s-with-libm-when-isnan-is-not-brought-.patch Upstream
 package/ympd/0001-only-c-language.patch Upstream
 package/ympd/0002-added-forward-declarations.patch Upstream
-package/ytree/0001-fix-musl.patch Upstream
 package/zabbix/0001-m4-netsnmp.m4-fix-shared-netsnmp-build.patch Upstream
 package/zabbix/0002-fix-build-with-libressl-3.5.0.patch Upstream
 package/zbar/0001-python-enum-fix-build-for-Python-3.11.patch Upstream
diff --git a/package/ytree/0001-fix-musl.patch b/package/ytree/0001-fix-musl.patch
deleted file mode 100644
index 0a24744669..0000000000
--- a/package/ytree/0001-fix-musl.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-Fix musl build
-
-Fixes
-
-  match.c.text+0x9c): undefined reference to `re_comp'
-  match.c.text+0xca): undefined reference to `re_exec'
-
-by forcing to use the 'modern' regex methods implementation instead of
-the obsolete re_comp/re_exec ([1]) one?
-
-[1] http://man7.org/linux/man-pages/man3/re_comp.3.html
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-
-diff -uNr ytree-1.99pl2.orig/match.c ytree-1.99pl2/match.c
---- ytree-1.99pl2.orig/match.c	2019-09-29 12:37:57.000000000 +0200
-+++ ytree-1.99pl2/match.c	2019-10-01 19:46:56.193815327 +0200
-@@ -10,7 +10,7 @@
- #include "ytree.h"
- 
- #if defined( sun ) || defined( linux ) || defined( __NeXT__ ) || defined( OSF1 ) ||  defined( __OpenBSD__ ) || defined(__NetBSD__) || defined( __FreeBSD__ ) || defined( __GNU__ )
--#define HAS_REGEX
-+#define HAS_REGCOMP
- #endif
- 
- #ifdef linux
diff --git a/package/ytree/ytree.hash b/package/ytree/ytree.hash
index 88ca8282bf..f3fbba8673 100644
--- a/package/ytree/ytree.hash
+++ b/package/ytree/ytree.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  6e7a8b7f68efe6d365abe33a1d06d739ad85f22a3d54ddd0aec24a3478d66642  ytree-2.04.tar.gz
+sha256  8cf8b151e4913b5b7f7a91dffd5c7306106a42477ec44e71d62c75f66ab61a57  ytree-2.05.tar.gz
 sha256  eb6bf7204569b4fe8eaf9d4dffc57e44047c5efb5deba1b2d99069ddbc99d031  COPYING
diff --git a/package/ytree/ytree.mk b/package/ytree/ytree.mk
index a64ebe83ed..1bd2df46b6 100644
--- a/package/ytree/ytree.mk
+++ b/package/ytree/ytree.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-YTREE_VERSION = 2.04
+YTREE_VERSION = 2.05
 YTREE_SITE = https://www.han.de/~werner
 YTREE_LICENSE = GPL-2.0+
 YTREE_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

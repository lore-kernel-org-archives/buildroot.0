Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80CDAC678DB
	for <buildroot@archiver.kernel.org>; Sun,  5 Mar 2023 14:27:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2E1C281E0D;
	Sun,  5 Mar 2023 14:27:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2E1C281E0D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 07PJiu-3PlPk; Sun,  5 Mar 2023 14:27:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6DCAE81B52;
	Sun,  5 Mar 2023 14:27:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6DCAE81B52
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 615B61BF41B
 for <buildroot@lists.busybox.net>; Sun,  5 Mar 2023 14:27:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3AD8460C00
 for <buildroot@lists.busybox.net>; Sun,  5 Mar 2023 14:27:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3AD8460C00
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lDfqhERw5WH0 for <buildroot@lists.busybox.net>;
 Sun,  5 Mar 2023 14:27:00 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6752960644
 for <buildroot@buildroot.org>; Sun,  5 Mar 2023 14:27:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6752960644
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 53D378629D; Sun,  5 Mar 2023 14:27:00 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 5 Mar 2023 15:22:14 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 783cd8d90d37b5e0b59d6f0bfca6667855b2b9e1
X-Git-Newrev: bc344d70d869fa10e44e098f38eda64a45450b68
X-Patchwork-Hint: ignore
Message-Id: <20230305142700.53D378629D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/wpebackend-fdo: bump to version
 1.14.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=bc344d70d869fa10e44e098f38eda64a45450b68
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This is a bugfix release which includes important fixes which solve a
memory leak and hitting a situation where the output no longer gets
updated. Release notes:

  https://wpewebkit.org/release/wpebackend-fdo-1.14.1.html

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wpebackend-fdo/wpebackend-fdo.hash | 8 ++++----
 package/wpebackend-fdo/wpebackend-fdo.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/wpebackend-fdo/wpebackend-fdo.hash b/package/wpebackend-fdo/wpebackend-fdo.hash
index e2f2c6c89f..d1a344a664 100644
--- a/package/wpebackend-fdo/wpebackend-fdo.hash
+++ b/package/wpebackend-fdo/wpebackend-fdo.hash
@@ -1,7 +1,7 @@
-# From https://wpewebkit.org/releases/wpebackend-fdo-1.14.0.tar.xz.sums
-md5  ea62dfa9ecb366598a837d7446ed48ac  wpebackend-fdo-1.14.0.tar.xz
-sha1  1500be9212381a404f4a46b22b90a9880ba11c01  wpebackend-fdo-1.14.0.tar.xz
-sha256  e75b0cb2c7145448416e8696013d8883f675c66c11ed750e06865efec5809155  wpebackend-fdo-1.14.0.tar.xz
+# From https://wpewebkit.org/releases/wpebackend-fdo-1.14.1.tar.xz.sums
+md5  2b49218cdd16075b028bbaf5a4f57890  wpebackend-fdo-1.14.1.tar.xz
+sha1  a68db2480d29d53d7fa24c69888bacbab6efea11  wpebackend-fdo-1.14.1.tar.xz
+sha256  01938dd93c62b3a47b18dd13c70d50490a8b8a6caec23c8550a3dbdbcc6bbb50  wpebackend-fdo-1.14.1.tar.xz
 
 # Hashes for license files:
 sha256  c9f6803371047fad3e72200ec6cd226329a5ee08ac61104c8211c2761fb46825  COPYING
diff --git a/package/wpebackend-fdo/wpebackend-fdo.mk b/package/wpebackend-fdo/wpebackend-fdo.mk
index afe37b086e..c1e4e05796 100644
--- a/package/wpebackend-fdo/wpebackend-fdo.mk
+++ b/package/wpebackend-fdo/wpebackend-fdo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WPEBACKEND_FDO_VERSION = 1.14.0
+WPEBACKEND_FDO_VERSION = 1.14.1
 WPEBACKEND_FDO_SITE = https://wpewebkit.org/releases
 WPEBACKEND_FDO_SOURCE = wpebackend-fdo-$(WPEBACKEND_FDO_VERSION).tar.xz
 WPEBACKEND_FDO_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

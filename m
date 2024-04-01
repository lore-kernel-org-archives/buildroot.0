Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA754CD1283
	for <buildroot@archiver.kernel.org>; Mon,  1 Apr 2024 08:19:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 66B3740343;
	Mon,  1 Apr 2024 08:19:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LK8S-wbSWbkz; Mon,  1 Apr 2024 08:19:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0FA8A4037A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0FA8A4037A;
	Mon,  1 Apr 2024 08:19:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0167C1BF3AD
 for <buildroot@lists.busybox.net>; Mon,  1 Apr 2024 08:19:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E2A0F811A9
 for <buildroot@lists.busybox.net>; Mon,  1 Apr 2024 08:19:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w0jbUWgxPYKr for <buildroot@lists.busybox.net>;
 Mon,  1 Apr 2024 08:19:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 02C3481204
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 02C3481204
 for <buildroot@buildroot.org>; Mon,  1 Apr 2024 08:19:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C168784484; Mon,  1 Apr 2024 08:19:04 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 1 Apr 2024 10:18:07 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 81bb14a93535da0fbf02ca715ac9ebdca3486732
X-Git-Newrev: 0cd8fea7cfbfb692e3b0938dce8c41d59147ccf0
X-Patchwork-Hint: ignore
Message-Id: <20240401081904.C168784484@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/davfs2: fix build with neon 0.33
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

commit: https://git.buildroot.net/buildroot/commit/?id=0cd8fea7cfbfb692e3b0938dce8c41d59147ccf0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure raised since bump of neon to version
0.33 in commit 00f7bd06d66b05ec694f8a3e90d56e5c4f532e6b:

configure: incompatible neon library version 0.33.0: wanted 0.27 28 29 30 31 32
configure: error: could not find neon

Fixes: 00f7bd06d66b05ec694f8a3e90d56e5c4f532e6b
 - http://autobuild.buildroot.org/results/3386c44447b09e434c60837ddd7eb08b5ef3d9a3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .../0002-configure.ac-add-neon-version-0.33.patch  | 27 ++++++++++++++++++++++
 package/davfs2/davfs2.mk                           |  2 ++
 2 files changed, 29 insertions(+)

diff --git a/package/davfs2/0002-configure.ac-add-neon-version-0.33.patch b/package/davfs2/0002-configure.ac-add-neon-version-0.33.patch
new file mode 100644
index 0000000000..93eff48cd5
--- /dev/null
+++ b/package/davfs2/0002-configure.ac-add-neon-version-0.33.patch
@@ -0,0 +1,27 @@
+From 1c539d158ae73e867d0d30b8c3d27f48d742ed06 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sat, 30 Mar 2024 09:18:15 +0100
+Subject: [PATCH] configure.ac: add neon version 0.33
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Upstream: https://savannah.nongnu.org/bugs/?65247
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 4f86cde..ede9b1e 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -36,7 +36,7 @@ AC_PROG_LN_S
+ # Checks for libraries.
+ AM_GNU_GETTEXT_VERSION(0.19.8)
+ AM_GNU_GETTEXT([external])
+-NE_REQUIRE_VERSIONS([0], [27 28 29 30 31 32])
++NE_REQUIRE_VERSIONS([0], [27 28 29 30 31 32 33])
+ DAV_CHECK_NEON
+ 
+ # Checks for header files.
+-- 
+2.43.0
+
diff --git a/package/davfs2/davfs2.mk b/package/davfs2/davfs2.mk
index a67c506250..9f9e4a7073 100644
--- a/package/davfs2/davfs2.mk
+++ b/package/davfs2/davfs2.mk
@@ -9,6 +9,8 @@ DAVFS2_SITE = http://download.savannah.nongnu.org/releases/davfs2
 DAVFS2_LICENSE = GPL-3.0+
 DAVFS2_LICENSE_FILES = COPYING
 DAVFS2_CPE_ID_VENDOR = werner_baumann
+# 0002-configure.ac-add-neon-version-0.33.patch
+DAVFS2_AUTORECONF = YES
 
 DAVFS2_DEPENDENCIES = \
 	neon \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

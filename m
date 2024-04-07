Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92C80CD11C2
	for <buildroot@archiver.kernel.org>; Sun,  7 Apr 2024 16:17:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 58F45820EE;
	Sun,  7 Apr 2024 16:17:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id myrvjMOJ0Ov7; Sun,  7 Apr 2024 16:17:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6D15B820F2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6D15B820F2;
	Sun,  7 Apr 2024 16:17:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E05F61BF326
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 16:17:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DA44860B4B
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 16:17:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mUXq8vm3qkjh for <buildroot@lists.busybox.net>;
 Sun,  7 Apr 2024 16:17:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 09BCD60B43
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 09BCD60B43
 for <buildroot@buildroot.org>; Sun,  7 Apr 2024 16:17:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E5CCC842CE; Sun,  7 Apr 2024 16:17:20 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 7 Apr 2024 18:16:57 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ce7363524c172e65571e4b5d76ef65a36f7c3020
X-Git-Newrev: 4922233cb0c8b0355acf8e96ac0eb59422405c17
X-Patchwork-Hint: ignore
Message-Id: <20240407161720.E5CCC842CE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Revert "package/apache: add libxcrypt
 optional dependency"
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

commit: https://git.buildroot.net/buildroot/commit/?id=4922233cb0c8b0355acf8e96ac0eb59422405c17
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This reverts commit 02905fe54cb2136c15cc71d2840d60537f1513a8.

The build error
http://autobuild.buildroot.org/results/f0f55d9d66b07cb3408086d2632f8cd1bebb670e/

resulted from the apr package and was fixed with commit
https://git.buildroot.net/buildroot/commit/?id=2402e0f1d31327806422692db6523120227bc5b0

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/apache/Config.in | 1 -
 package/apache/apache.mk | 4 ----
 2 files changed, 5 deletions(-)

diff --git a/package/apache/Config.in b/package/apache/Config.in
index bc3133ea00..270296bce4 100644
--- a/package/apache/Config.in
+++ b/package/apache/Config.in
@@ -5,7 +5,6 @@ config BR2_PACKAGE_APACHE
 	depends on BR2_USE_MMU # apr
 	select BR2_PACKAGE_APR_UTIL
 	select BR2_PACKAGE_PCRE2
-	select BR2_PACKAGE_LIBXCRYPT if BR2_TOOLCHAIN_USES_GLIBC
 	help
 	  The Apache HTTP Server Project is an effort to develop and
 	  maintain an open-source HTTP server for modern operating
diff --git a/package/apache/apache.mk b/package/apache/apache.mk
index 619d13726e..1b095c5eb1 100644
--- a/package/apache/apache.mk
+++ b/package/apache/apache.mk
@@ -52,10 +52,6 @@ else
 APACHE_CONF_OPTS += --disable-brotli
 endif
 
-ifeq ($(BR2_PACKAGE_LIBXCRYPT),y)
-APACHE_DEPENDENCIES += libxcrypt
-endif
-
 ifeq ($(BR2_PACKAGE_LIBXML2),y)
 APACHE_DEPENDENCIES += libxml2
 # Apache wants the path to the header file, where it can find
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

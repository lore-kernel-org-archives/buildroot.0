Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB253C433EF
	for <buildroot@archiver.kernel.org>; Sun, 27 Mar 2022 15:46:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 58833828F7;
	Sun, 27 Mar 2022 15:46:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id phn2Awd1H37j; Sun, 27 Mar 2022 15:46:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 69749828DD;
	Sun, 27 Mar 2022 15:46:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 148241BF9A4
 for <buildroot@lists.busybox.net>; Sun, 27 Mar 2022 15:46:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 02E0F409B4
 for <buildroot@lists.busybox.net>; Sun, 27 Mar 2022 15:46:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aj43f70iyWVF for <buildroot@lists.busybox.net>;
 Sun, 27 Mar 2022 15:46:20 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 45B4B4098B
 for <buildroot@buildroot.org>; Sun, 27 Mar 2022 15:46:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id E2ADC85D65; Sun, 27 Mar 2022 15:37:11 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 27 Mar 2022 16:53:12 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 607c5986a9b3bde0cacdbe38eeaea2ab456a6e80
X-Git-Newrev: ffcb5ded44e932ca6c7d03a8a33c051d94d47b2a
X-Patchwork-Hint: ignore
Message-Id: <20220327153711.E2ADC85D65@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libminiupnpc: drop dependencies
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

commit: https://git.buildroot.net/buildroot/commit/?id=ffcb5ded44e932ca6c7d03a8a33c051d94d47b2a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libminiupnpc can be statically built with or without binfmt flat since
version 1.7 and
https://github.com/miniupnp/miniupnp/commit/c183a72c46cae9e37ddf635318dfb0bdcd56ed9d

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/libminiupnpc/Config.in       | 6 ------
 package/libminiupnpc/libminiupnpc.mk | 8 ++++++++
 2 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/package/libminiupnpc/Config.in b/package/libminiupnpc/Config.in
index a3410a0225..51f4b43bbb 100644
--- a/package/libminiupnpc/Config.in
+++ b/package/libminiupnpc/Config.in
@@ -1,7 +1,5 @@
 config BR2_PACKAGE_LIBMINIUPNPC
 	bool "libminiupnpc"
-	depends on !BR2_BINFMT_FLAT
-	depends on !BR2_STATIC_LIBS
 	help
 	  The UPnP protocol is supported by most home adsl/cable routers
 	  and Microsoft Windows 2K/XP. The aim of the MiniUPnP project
@@ -14,7 +12,3 @@ config BR2_PACKAGE_LIBMINIUPNPC
 	  ANSI C.
 
 	  http://miniupnp.free.fr
-
-comment "libminiupnpc needs a toolchain w/ dynamic library"
-	depends on BR2_STATIC_LIBS
-	depends on !BR2_BINFMT_FLAT
diff --git a/package/libminiupnpc/libminiupnpc.mk b/package/libminiupnpc/libminiupnpc.mk
index 0633ccd234..52fe9849f2 100644
--- a/package/libminiupnpc/libminiupnpc.mk
+++ b/package/libminiupnpc/libminiupnpc.mk
@@ -18,4 +18,12 @@ LIBMINIUPNPC_CPE_ID_VERSION = $(LIBMINIUPNPC_VERSION_MAJOR)
 LIBMINIUPNPC_CPE_ID_UPDATE = $(LIBMINIUPNPC_VERSION_MINOR)
 LIBMINIUPNPC_CONF_OPTS = -DUPNPC_BUILD_SAMPLE=OFF -DUPNPC_BUILD_TESTS=OFF
 
+ifeq ($(BR2_STATIC_LIBS),y)
+LIBMINIUPNPC_CONF_OPTS += -DUPNPC_BUILD_SHARED=OFF -DUPNPC_BUILD_STATIC=ON
+else ifeq ($(BR2_SHARED_LIBS),y)
+LIBMINIUPNPC_CONF_OPTS += -DUPNPC_BUILD_SHARED=ON -DUPNPC_BUILD_STATIC=OFF
+else
+LIBMINIUPNPC_CONF_OPTS += -DUPNPC_BUILD_SHARED=ON -DUPNPC_BUILD_STATIC=ON
+endif
+
 $(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B329C4345F
	for <buildroot@archiver.kernel.org>; Sun, 28 Apr 2024 19:46:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 550D06069E;
	Sun, 28 Apr 2024 19:46:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Vc9OBnIr9UTn; Sun, 28 Apr 2024 19:46:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 10708606E5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 10708606E5;
	Sun, 28 Apr 2024 19:46:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 977FD1BF8C7
 for <buildroot@lists.busybox.net>; Sun, 28 Apr 2024 19:46:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8444A4063A
 for <buildroot@lists.busybox.net>; Sun, 28 Apr 2024 19:46:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Drv6J-GqM_qS for <buildroot@lists.busybox.net>;
 Sun, 28 Apr 2024 19:46:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 96ACD40635
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 96ACD40635
 for <buildroot@buildroot.org>; Sun, 28 Apr 2024 19:46:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8061A86234; Sun, 28 Apr 2024 19:46:30 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 28 Apr 2024 21:34:44 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 00da8187cd21a5526ae521d537b69a7cbe984e5e
X-Git-Newrev: d34c7934241229d1a1d5e74be80eb55db9bdb830
X-Patchwork-Hint: ignore
Message-Id: <20240428194630.8061A86234@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/giflib: fix host
 build without convert
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

commit: https://git.buildroot.net/buildroot/commit/?id=d34c7934241229d1a1d5e74be80eb55db9bdb830
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Do not build docs for host-giflib to avoid the following build failure
without convert on host raised since bump to version 5.2.2 in commit
f98239dada59270efe19de9d9fae50ec9ab9d28c and
https://sourceforge.net/p/giflib/code/ci/d565f6fa04be8973425bd7cd3f169908ac9e95c2:

convert ../pic/gifgrid.gif -resize 50x50 giflib-logo.gif
make[2]: convert: No such file or directory

Fixes: f98239dada59270efe19de9d9fae50ec9ab9d28c
 - http://autobuild.buildroot.org/results/04dd54f5060881cb8aa030de34edb4ceea863fa6

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 51fd4b4109852cf547d41ea85ec2e93eb6330a1d)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/giflib/giflib.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/giflib/giflib.mk b/package/giflib/giflib.mk
index 770338507b..f37ec8af21 100644
--- a/package/giflib/giflib.mk
+++ b/package/giflib/giflib.mk
@@ -27,7 +27,7 @@ define GIFLIB_BUILD_CMDS
 endef
 
 define HOST_GIFLIB_BUILD_CMDS
-	$(HOST_CONFIGURE_OPTS) $(MAKE) -C $(@D)
+	$(HOST_CONFIGURE_OPTS) $(MAKE) -C $(@D) shared-lib
 endef
 
 define GIFLIB_INSTALL_STAGING_CMDS
@@ -42,7 +42,7 @@ endef
 
 define HOST_GIFLIB_INSTALL_CMDS
 	$(HOST_CONFIGURE_OPTS) $(MAKE) -C $(@D) DESTDIR=$(HOST_DIR) \
-		PREFIX=/usr install
+		PREFIX=/usr install-include install-shared-lib
 endef
 
 $(eval $(generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

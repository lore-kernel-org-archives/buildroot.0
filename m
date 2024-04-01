Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19CBACD1292
	for <buildroot@archiver.kernel.org>; Mon,  1 Apr 2024 13:09:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CA1584038B;
	Mon,  1 Apr 2024 13:09:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y15N05NStCJX; Mon,  1 Apr 2024 13:09:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DD3174043E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DD3174043E;
	Mon,  1 Apr 2024 13:09:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6A6B41BF232
 for <buildroot@lists.busybox.net>; Mon,  1 Apr 2024 13:09:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 575AA60885
 for <buildroot@lists.busybox.net>; Mon,  1 Apr 2024 13:09:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9i36YaZaQSbH for <buildroot@lists.busybox.net>;
 Mon,  1 Apr 2024 13:09:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 998696087D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 998696087D
 for <buildroot@buildroot.org>; Mon,  1 Apr 2024 13:09:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 53F3A844F3; Mon,  1 Apr 2024 13:09:26 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 1 Apr 2024 15:07:57 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ef07e8da6fb3d294a23b7536365e293d6332c3a1
X-Git-Newrev: 51fd4b4109852cf547d41ea85ec2e93eb6330a1d
X-Patchwork-Hint: ignore
Message-Id: <20240401130926.53F3A844F3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/giflib: fix host build without
 convert
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

commit: https://git.buildroot.net/buildroot/commit/?id=51fd4b4109852cf547d41ea85ec2e93eb6330a1d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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

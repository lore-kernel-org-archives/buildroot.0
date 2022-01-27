Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A37DC433FE
	for <buildroot@archiver.kernel.org>; Thu, 27 Jan 2022 18:46:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F135341750;
	Thu, 27 Jan 2022 18:46:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id F2WAKWpJMpo0; Thu, 27 Jan 2022 18:46:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 297E1416D8;
	Thu, 27 Jan 2022 18:46:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 26EE71BF3EA
 for <buildroot@lists.busybox.net>; Thu, 27 Jan 2022 18:46:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 14F9C4019F
 for <buildroot@lists.busybox.net>; Thu, 27 Jan 2022 18:46:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wabLV8pw08qY for <buildroot@lists.busybox.net>;
 Thu, 27 Jan 2022 18:46:36 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 275D4400CC
 for <buildroot@buildroot.org>; Thu, 27 Jan 2022 18:46:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id C03B58257C; Thu, 27 Jan 2022 18:39:40 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Thu, 27 Jan 2022 19:46:29 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 90eca683f3272ec246098b5e6ef97b99f5844ea4
X-Git-Newrev: a9a7f54083e9b4c2461abcf06cfb0387a7ce51dd
X-Patchwork-Hint: ignore
Message-Id: <20220127183940.C03B58257C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mesa3d/mesa3d.mk: fix typo in
 comment
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

commit: https://git.buildroot.net/buildroot/commit/?id=a9a7f54083e9b4c2461abcf06cfb0387a7ce51dd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 6a51177af14a2ddaa (package/mesa3d: always enable glx-direct if glx is
enabled) introduced a typo in the comment, fix that.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/mesa3d/mesa3d.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index f49d96025a..6907d8c94f 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -73,7 +73,7 @@ ifeq ($(BR2_PACKAGE_MESA3D_OPENGL_GLX),y)
 #  dri          : dri based GLX requires at least one DRI driver || dri based GLX requires shared-glapi
 #  xlib         : xlib conflicts with any dri driver
 #  gallium-xlib : Gallium-xlib based GLX requires at least one gallium driver || Gallium-xlib based GLX requires softpipe or llvmpipe || gallium-xlib conflicts with any dri driver.
-# Always enable glx-direct; without it, amy GLX applications don't work.
+# Always enable glx-direct; without it, many GLX applications don't work.
 MESA3D_CONF_OPTS += \
 	-Dglx=dri \
 	-Dglx-direct=true
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

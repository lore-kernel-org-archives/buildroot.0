Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E73CC433EF
	for <buildroot@archiver.kernel.org>; Sun, 20 Mar 2022 21:42:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EBBD9405A3;
	Sun, 20 Mar 2022 21:42:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id W0k2V0bfU-7I; Sun, 20 Mar 2022 21:42:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E2E184032A;
	Sun, 20 Mar 2022 21:42:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CE33C1BF973
 for <buildroot@lists.busybox.net>; Sun, 20 Mar 2022 21:42:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BA9BE8175A
 for <buildroot@lists.busybox.net>; Sun, 20 Mar 2022 21:42:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4Lm5CtAauSwN for <buildroot@lists.busybox.net>;
 Sun, 20 Mar 2022 21:42:18 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0577C81759
 for <buildroot@buildroot.org>; Sun, 20 Mar 2022 21:42:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id C8235846A2; Sun, 20 Mar 2022 21:33:24 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 20 Mar 2022 22:40:56 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: e1fe19616196930cb803f52760c55340607c894e
X-Git-Newrev: 35dcc9ca2265b8587026b0a96ee892e95dc71f2b
X-Patchwork-Hint: ignore
Message-Id: <20220320213324.C8235846A2@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/zynaddsubfx: fix
 PluginEnable option
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

commit: https://git.buildroot.net/buildroot/commit/?id=35dcc9ca2265b8587026b0a96ee892e95dc71f2b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Replace False by OFF when setting PluginEnable option

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 2e1a86e95091b69ad043c33aadf7220866a45f29)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/zynaddsubfx/zynaddsubfx.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/zynaddsubfx/zynaddsubfx.mk b/package/zynaddsubfx/zynaddsubfx.mk
index 158b5b4ede..c8d64f5ce8 100644
--- a/package/zynaddsubfx/zynaddsubfx.mk
+++ b/package/zynaddsubfx/zynaddsubfx.mk
@@ -11,7 +11,7 @@ ZYNADDSUBFX_LICENSE = GPL-2.0+
 ZYNADDSUBFX_LICENSE_FILES = COPYING
 
 # There is no package in buildroot using LV2 plugins: disabling
-ZYNADDSUBFX_CONF_OPTS = -DPluginEnable=False
+ZYNADDSUBFX_CONF_OPTS = -DPluginEnable=OFF
 
 ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
 ZYNADDSUBFX_CONF_OPTS += -DCMAKE_EXE_LINKER_FLAGS=-latomic
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

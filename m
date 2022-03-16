Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76662C433EF
	for <buildroot@archiver.kernel.org>; Wed, 16 Mar 2022 21:44:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3E5094171C;
	Wed, 16 Mar 2022 21:44:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id R9E5Zc36kJUh; Wed, 16 Mar 2022 21:44:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5B78940882;
	Wed, 16 Mar 2022 21:44:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1B3501BF9C2
 for <buildroot@lists.busybox.net>; Wed, 16 Mar 2022 21:44:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0735740179
 for <buildroot@lists.busybox.net>; Wed, 16 Mar 2022 21:44:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TYa_QVidsN15 for <buildroot@lists.busybox.net>;
 Wed, 16 Mar 2022 21:44:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 42C7940018
 for <buildroot@buildroot.org>; Wed, 16 Mar 2022 21:44:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 0801D84249; Wed, 16 Mar 2022 21:35:25 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 16 Mar 2022 22:41:05 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3b6b4729522090b5f20560e249b5898950d7c298
X-Git-Newrev: 2e1a86e95091b69ad043c33aadf7220866a45f29
X-Patchwork-Hint: ignore
Message-Id: <20220316213525.0801D84249@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/zynaddsubfx: fix PluginEnable
 option
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

commit: https://git.buildroot.net/buildroot/commit/?id=2e1a86e95091b69ad043c33aadf7220866a45f29
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Replace False by OFF when setting PluginEnable option

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
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

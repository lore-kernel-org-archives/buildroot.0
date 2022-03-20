Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F77CC433F5
	for <buildroot@archiver.kernel.org>; Sun, 20 Mar 2022 21:43:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E14BB405BC;
	Sun, 20 Mar 2022 21:43:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tYOeMVLVOjQG; Sun, 20 Mar 2022 21:43:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 94713403BF;
	Sun, 20 Mar 2022 21:43:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B9F8C1BF3C9
 for <buildroot@lists.busybox.net>; Sun, 20 Mar 2022 21:42:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9754760ADE
 for <buildroot@lists.busybox.net>; Sun, 20 Mar 2022 21:42:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2x7rsgALhNys for <buildroot@lists.busybox.net>;
 Sun, 20 Mar 2022 21:42:18 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2D8DF60AF0
 for <buildroot@buildroot.org>; Sun, 20 Mar 2022 21:42:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 14BD8846A2; Sun, 20 Mar 2022 21:33:25 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 20 Mar 2022 22:41:25 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: af8839589acb2b3399e36a925e37a48d7b170382
X-Git-Newrev: 84a9bdb30e7510cb6426d02f39109c53fd1dc420
X-Patchwork-Hint: ignore
Message-Id: <20220320213325.14BD8846A2@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/zynaddsubfx: add
 portaudio optional dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=84a9bdb30e7510cb6426d02f39109c53fd1dc420
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

portaudio is an optional dependency (enabled by default) since the
addition of the package in commit
18a863063735e2c658fa6947a4e540e9dda6c431

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit e820feba362a29a310ed3a93c8ad5546ceb8a2ee)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/zynaddsubfx/zynaddsubfx.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/zynaddsubfx/zynaddsubfx.mk b/package/zynaddsubfx/zynaddsubfx.mk
index 461146aae8..aff9ac4bf4 100644
--- a/package/zynaddsubfx/zynaddsubfx.mk
+++ b/package/zynaddsubfx/zynaddsubfx.mk
@@ -37,4 +37,11 @@ else
 ZYNADDSUBFX_CONF_OPTS += -DJackEnable=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_PORTAUDIO),y)
+ZYNADDSUBFX_DEPENDENCIES += portaudio
+ZYNADDSUBFX_CONF_OPTS += -DPaEnable=ON
+else
+ZYNADDSUBFX_CONF_OPTS += -DPaEnable=OFF
+endif
+
 $(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

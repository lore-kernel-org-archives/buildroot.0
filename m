Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB2E0C07E9D
	for <buildroot@archiver.kernel.org>; Thu, 29 Sep 2022 06:16:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 42F2D419C8;
	Thu, 29 Sep 2022 06:16:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 42F2D419C8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DMQViH_ORzM9; Thu, 29 Sep 2022 06:16:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2CF2B419C7;
	Thu, 29 Sep 2022 06:16:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2CF2B419C7
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id ACC771C1190
 for <buildroot@lists.busybox.net>; Thu, 29 Sep 2022 06:15:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 87F2F83E37
 for <buildroot@lists.busybox.net>; Thu, 29 Sep 2022 06:15:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 87F2F83E37
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BxCME9muVIyI for <buildroot@lists.busybox.net>;
 Thu, 29 Sep 2022 06:15:58 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id BED7A83E14
 for <buildroot@buildroot.org>; Thu, 29 Sep 2022 06:15:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BED7A83E14
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AF4B9864AC; Thu, 29 Sep 2022 06:15:58 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 29 Sep 2022 08:10:08 +0200
X-Git-Refname: refs/heads/2022.08.x
X-Git-Oldrev: 943a2e42c247021d90fc8a99ce8520a62a9af15f
X-Git-Newrev: b22d69fc7a1a9302c9fe10be4eaf4850d62d23d1
X-Patchwork-Hint: ignore
Message-Id: <20220929061558.AF4B9864AC@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.08.x] package/mesa3d: set
 cpp_rtti option
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

commit: https://git.buildroot.net/buildroot/commit/?id=b22d69fc7a1a9302c9fe10be4eaf4850d62d23d1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.08.x

This needs to be set based on BR2_PACKAGE_LLVM_RTTI being set.

Fixes:
 - http://autobuild.buildroot.net/results/e2ebc9a73ed421aa6be44fe41bb5224cc12f699d

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit a7f854bce5079608af4cc6c3653b6d71db529cc7)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mesa3d/mesa3d.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 0630f43df1..daefd6f6d5 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -48,6 +48,11 @@ ifeq ($(BR2_PACKAGE_MESA3D_LLVM),y)
 MESA3D_DEPENDENCIES += host-llvm llvm
 MESA3D_MESON_EXTRA_BINARIES += llvm-config='$(STAGING_DIR)/usr/bin/llvm-config'
 MESA3D_CONF_OPTS += -Dllvm=enabled
+ifeq ($(BR2_PACKAGE_LLVM_RTTI),y)
+MESA3D_CONF_OPTS += -Dcpp_rtti=true
+else
+MESA3D_CONF_OPTS += -Dcpp_rtti=false
+endif
 else
 # Avoid automatic search of llvm-config
 MESA3D_CONF_OPTS += -Dllvm=disabled
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

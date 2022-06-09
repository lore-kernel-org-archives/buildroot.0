Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C838C43334
	for <buildroot@archiver.kernel.org>; Thu,  9 Jun 2022 20:54:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CEA5F40C44;
	Thu,  9 Jun 2022 20:54:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NFzmJZ7TSBKf; Thu,  9 Jun 2022 20:54:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 57F1F40C4F;
	Thu,  9 Jun 2022 20:54:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1BBCD1BF2F0
 for <buildroot@lists.busybox.net>; Thu,  9 Jun 2022 20:54:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1881360675
 for <buildroot@lists.busybox.net>; Thu,  9 Jun 2022 20:54:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IqR951ILysAG for <buildroot@lists.busybox.net>;
 Thu,  9 Jun 2022 20:53:58 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9A5FE60674
 for <buildroot@buildroot.org>; Thu,  9 Jun 2022 20:53:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id CCC5486F39; Thu,  9 Jun 2022 20:42:01 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 9 Jun 2022 22:50:34 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 4e5544983d53c902b7bbac65b89720fb665b721c
X-Git-Newrev: e571c3ef476a61392777ead56a4324579ecb39d0
X-Patchwork-Hint: ignore
Message-Id: <20220609204201.CCC5486F39@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/rockchip-mali:
 fix armeb build
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

commit: https://git.buildroot.net/buildroot/commit/?id=e571c3ef476a61392777ead56a4324579ecb39d0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Fix the following armeb build failure raised since the addition of the
package in commit 97c74a73e5dee17530647f89b2c7d8692781eb14:

ERROR: architecture for "/usr/lib/libmali-bifrost-g31-rxp0-gbm.so" is "AArch64", should be "ARM"

Fixes:
 - http://autobuild.buildroot.org/results/33ebfa936da8dfa4035db08a96f8872d7c9db6c3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
[Arnout: instead of changing the condition to check for aarch64, add a
check for armeb]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 487f4b0da9c2ffb0328b3a7d4b59384d29b395b9)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/rockchip-mali/rockchip-mali.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/rockchip-mali/rockchip-mali.mk b/package/rockchip-mali/rockchip-mali.mk
index 848682229d..5c8e554346 100644
--- a/package/rockchip-mali/rockchip-mali.mk
+++ b/package/rockchip-mali/rockchip-mali.mk
@@ -14,7 +14,7 @@ ROCKCHIP_MALI_PROVIDES = libegl libgles libgbm
 
 ROCKCHIP_MALI_LIB = libmali-bifrost-g31-rxp0$(ROCKCHIP_MALI_SUFFIX).so
 ROCKCHIP_MALI_PKGCONFIG_FILES = egl gbm glesv2 mali
-ROCKCHIP_MALI_ARCH_DIR = $(if $(BR2_arm),arm-linux-gnueabihf,aarch64-linux-gnu)
+ROCKCHIP_MALI_ARCH_DIR = $(if $(BR2_arm)$(BR2_armeb),arm-linux-gnueabihf,aarch64-linux-gnu)
 ROCKCHIP_MALI_HEADERS = EGL FBDEV GLES GLES2 GLES3 KHR gbm.h
 
 # We need to create:
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

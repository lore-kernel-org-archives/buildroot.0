Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09E36C27C4F
	for <buildroot@archiver.kernel.org>; Thu, 13 Jun 2024 10:08:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A791361149;
	Thu, 13 Jun 2024 10:08:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nk5oWmwNiL1S; Thu, 13 Jun 2024 10:08:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 416C6610F4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 416C6610F4;
	Thu, 13 Jun 2024 10:08:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 52FFA1BF354
 for <buildroot@lists.busybox.net>; Thu, 13 Jun 2024 10:05:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5FEE1413F5
 for <buildroot@lists.busybox.net>; Thu, 13 Jun 2024 10:05:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5bL42R8eJR-e for <buildroot@lists.busybox.net>;
 Thu, 13 Jun 2024 10:05:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D97C4413CB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D97C4413CB
 for <buildroot@buildroot.org>; Thu, 13 Jun 2024 10:04:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C7ED887F30; Thu, 13 Jun 2024 10:04:59 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 5 Jun 2024 23:55:49 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 54d48c8cad4e89c1428a0b9440116a01b0431fae
X-Git-Newrev: 545704bd52165c119c6d95c268a5726ea7a88b1a
X-Patchwork-Hint: ignore
Message-Id: <20240613100459.C7ED887F30@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/sunxi-mali-utgard-driver: handle
 patching the Buildroot way
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=545704bd52165c119c6d95c268a5726ea7a88b1a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Reviewed-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 .../0001-build.sh-do-not-apply-patches.patch       | 39 ++++++++++++++++++++++
 .../sunxi-mali-utgard-driver.mk                    |  3 +-
 2 files changed, 40 insertions(+), 2 deletions(-)

diff --git a/package/sunxi-mali-utgard-driver/0001-build.sh-do-not-apply-patches.patch b/package/sunxi-mali-utgard-driver/0001-build.sh-do-not-apply-patches.patch
new file mode 100644
index 0000000000..02c6aa7884
--- /dev/null
+++ b/package/sunxi-mali-utgard-driver/0001-build.sh-do-not-apply-patches.patch
@@ -0,0 +1,39 @@
+From 079ed8aa57ba6629b992c3d0d01904d3e5170d3b Mon Sep 17 00:00:00 2001
+From: "Yann E. MORIN" <yann.morin.1998@free.fr>
+Date: Wed, 5 Jun 2024 13:06:16 +0200
+Subject: [PATCH] build.sh: do not apply patches
+
+In Buildroot, we handle applying the patches in a generic way, with
+appropriate tools (e.g. with a proper tar).
+
+Upstream: not applicable
+Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
+---
+ build.sh | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/build.sh b/build.sh
+index d1fedff..26efc53 100755
+--- a/build.sh
++++ b/build.sh
+@@ -10,6 +10,8 @@ BUILD_OPTS="USING_UMP=0
+ 	    USING_DEVFREQ=1"
+ 
+ apply_patches() {
++    return 0  # Patching handled by Buildroot
++
+     pushd $2
+ 
+     quilt push -a
+@@ -22,6 +24,8 @@ apply_patches() {
+ }
+ 
+ unapply_patches() {
++    return 0  # Patching handled by Buildroot
++
+     pushd $2
+ 
+     quilt pop -a
+-- 
+2.45.1
+
diff --git a/package/sunxi-mali-utgard-driver/sunxi-mali-utgard-driver.mk b/package/sunxi-mali-utgard-driver/sunxi-mali-utgard-driver.mk
index 72fade58ed..b8a12247d3 100644
--- a/package/sunxi-mali-utgard-driver/sunxi-mali-utgard-driver.mk
+++ b/package/sunxi-mali-utgard-driver/sunxi-mali-utgard-driver.mk
@@ -16,8 +16,7 @@ SUNXI_MALI_UTGARD_DRIVER_MAKE_OPTS = \
 
 define SUNXI_MALI_UTGARD_DRIVER_USE_APPLY_PATCHES
 	ln -sf $(SUNXI_MALI_UTGARD_REV)/series $(@D)/patches
-	$(SED) 's|quilt push -a|$(TOPDIR)/support/scripts/apply-patches.sh . ../patches|' \
-		$(@D)/build.sh
+	$(APPLY_PATCHES) $(@D)/$(SUNXI_MALI_UTGARD_REV) $(@D)/patches
 endef
 
 SUNXI_MALI_UTGARD_DRIVER_POST_PATCH_HOOKS += SUNXI_MALI_UTGARD_DRIVER_USE_APPLY_PATCHES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

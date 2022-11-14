Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87F4EC4332F
	for <buildroot@archiver.kernel.org>; Mon, 14 Nov 2022 15:49:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 237A981319;
	Mon, 14 Nov 2022 15:49:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 237A981319
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4mA49fNv8dHh; Mon, 14 Nov 2022 15:49:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 50F6081306;
	Mon, 14 Nov 2022 15:49:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 50F6081306
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2F7AA1BF8A8
 for <buildroot@lists.busybox.net>; Mon, 14 Nov 2022 15:49:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 097D8607F6
 for <buildroot@lists.busybox.net>; Mon, 14 Nov 2022 15:49:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 097D8607F6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id M4Ir2-X_G-QX for <buildroot@lists.busybox.net>;
 Mon, 14 Nov 2022 15:49:03 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4BF606079D
 for <buildroot@buildroot.org>; Mon, 14 Nov 2022 15:49:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4BF606079D
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 39EFF838DC; Mon, 14 Nov 2022 15:49:03 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 14 Nov 2022 16:43:34 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 0d5dd6e868a8b4826b1c7275626c3d0ab92277b1
X-Git-Newrev: 5df0ab89a4c17d8a808567227630fe0c69a1e524
X-Patchwork-Hint: ignore
Message-Id: <20221114154903.39EFF838DC@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/swupdate: add
 missing backslash
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

commit: https://git.buildroot.net/buildroot/commit/?id=5df0ab89a4c17d8a808567227630fe0c69a1e524
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Commit 0b4a9930124f7fb4c7bfae281db900905006a2da ("package/swupdate:
specify SWU_VER during build") forgot a backslash.

Fixes the following check-package warning:

package/swupdate/swupdate.mk:213: unexpected indent with tabs

and obviously makes the code correct.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit b21e2f216b08135366c7d9ba1eb087f6bdaba482)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/swupdate/swupdate.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/swupdate/swupdate.mk b/package/swupdate/swupdate.mk
index d29f817355..5917c93f6a 100644
--- a/package/swupdate/swupdate.mk
+++ b/package/swupdate/swupdate.mk
@@ -223,7 +223,7 @@ SWUPDATE_KCONFIG_FILE = $(call qstrip,$(BR2_PACKAGE_SWUPDATE_CONFIG))
 SWUPDATE_KCONFIG_EDITORS = menuconfig xconfig gconfig nconfig
 
 SWUPDATE_MAKE_OPTS = \
-	SWU_VER="$(SWUPDATE_VERSION) (Buildroot $(BR2_VERSION_FULL))"
+	SWU_VER="$(SWUPDATE_VERSION) (Buildroot $(BR2_VERSION_FULL))" \
 	CROSS_COMPILE="$(TARGET_CROSS)" \
 	CONFIG_EXTRA_CFLAGS="$(TARGET_CFLAGS)" \
 	CONFIG_EXTRA_LDFLAGS="$(TARGET_LDFLAGS)"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

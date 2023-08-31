Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71689C83F32
	for <buildroot@archiver.kernel.org>; Thu, 31 Aug 2023 12:24:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1DA508143A;
	Thu, 31 Aug 2023 12:24:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1DA508143A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0qxp5CXYh6oE; Thu, 31 Aug 2023 12:24:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6600C8336F;
	Thu, 31 Aug 2023 12:24:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6600C8336F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 656A91BF3D1
 for <buildroot@lists.busybox.net>; Thu, 31 Aug 2023 12:23:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3B1FC41E77
 for <buildroot@lists.busybox.net>; Thu, 31 Aug 2023 12:23:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3B1FC41E77
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wg4VlM-6SoeE for <buildroot@lists.busybox.net>;
 Thu, 31 Aug 2023 12:23:22 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 380D441E4C
 for <buildroot@buildroot.org>; Thu, 31 Aug 2023 12:23:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 380D441E4C
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 20D5986732; Thu, 31 Aug 2023 12:23:22 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 31 Aug 2023 13:10:04 +0200
X-Git-Refname: refs/heads/2023.05.x
X-Git-Oldrev: 307abe2029d3681408f2c33a37ef688b139151bf
X-Git-Newrev: 5ad971ee08e738174a802e519a964e5eee20bf04
X-Patchwork-Hint: ignore
Message-Id: <20230831122322.20D5986732@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.05.x] package/systemd: fix
 wrong variable name in comment
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

commit: https://git.buildroot.net/buildroot/commit/?id=5ad971ee08e738174a802e519a964e5eee20bf04
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.05.x

There is no such thing as a BR2_TARGET_GENERIC_TTY_PATH variable. The
comment here should mention BR2_TARGET_GENERIC_GETTY_PORT instead.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit e0ff6ad7ff6fb5c4643314b9e029f81cc3b07762)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/systemd/systemd.mk | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 7f89c7cd1e..d235256867 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -683,15 +683,15 @@ ifneq ($(call qstrip,$(BR2_TARGET_GENERIC_GETTY_PORT)),)
 # Systemd defaults to enabling getty@tty1.service
 #
 # What we want to do
-# * Enable a getty on $BR2_TARGET_GENERIC_TTY_PATH
+# * Enable a getty on $BR2_TARGET_GENERIC_GETTY_PORT
 # * Set the baudrate for all units according to BR2_TARGET_GENERIC_GETTY_BAUDRATE
 # * Always enable a getty on the console using systemd-getty-generator
 #   (backward compatibility with previous releases of buildroot)
 #
 # What we do
 # * disable getty@tty1 (enabled by upstream systemd)
-# * enable getty@xxx if  $BR2_TARGET_GENERIC_TTY_PATH is a tty
-# * enable serial-getty@xxx for other $BR2_TARGET_GENERIC_TTY_PATH
+# * enable getty@xxx if  $BR2_TARGET_GENERIC_GETTY_PORT is a tty
+# * enable serial-getty@xxx for other $BR2_TARGET_GENERIC_GETTY_PORT
 # * rewrite baudrates if a baudrate is provided
 define SYSTEMD_INSTALL_SERVICE_TTY
 	mkdir -p $(TARGET_DIR)/usr/lib/systemd/system/getty@.service.d; \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

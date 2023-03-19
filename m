Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3403C6FD1F
	for <buildroot@archiver.kernel.org>; Sun, 19 Mar 2023 13:51:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5B7DA409AE;
	Sun, 19 Mar 2023 13:51:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5B7DA409AE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id g3s5BkefsPa1; Sun, 19 Mar 2023 13:51:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 46AF941299;
	Sun, 19 Mar 2023 13:51:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 46AF941299
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CDC051BF577
 for <buildroot@lists.busybox.net>; Sun, 19 Mar 2023 13:51:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A80B9409BE
 for <buildroot@lists.busybox.net>; Sun, 19 Mar 2023 13:51:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A80B9409BE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EEUhECrSEY9T for <buildroot@lists.busybox.net>;
 Sun, 19 Mar 2023 13:50:59 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 941ED409A9
 for <buildroot@buildroot.org>; Sun, 19 Mar 2023 13:50:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 941ED409A9
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8061287171; Sun, 19 Mar 2023 13:50:59 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 19 Mar 2023 14:49:58 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f5b50cb14ca5b08c2d123a63b4d8829f19078578
X-Git-Newrev: 456204e7e02cc787cee65711409025245ce337de
X-Patchwork-Hint: ignore
Message-Id: <20230319135059.8061287171@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/bluez5_utils: fix SysV init script
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=456204e7e02cc787cee65711409025245ce337de
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Use daemon name (bluetoothd) as file name.
- Script doesn't need to be executable.

Signed-off-by: Daniel Lang <d.lang@abatec.at>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .checkpackageignore                                  | 1 -
 package/bluez5_utils/{S40bluetooth => S40bluetoothd} | 0
 package/bluez5_utils/bluez5_utils.mk                 | 4 ++--
 3 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 04966a9b06..4faa3a8b8f 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -8,7 +8,6 @@ package/avahi/S05avahi-setup.sh Indent Variables
 package/avahi/S50avahi-daemon Indent Variables
 package/babeld/S50babeld Indent Shellcheck Variables
 package/bind/S81named Indent Shellcheck Variables
-package/bluez5_utils/S40bluetooth NotExecutable Variables
 package/boinc/S99boinc-client Indent Shellcheck Variables
 package/brickd/S70brickd Indent Shellcheck Variables
 package/brltty/S10brltty Indent Shellcheck Variables
diff --git a/package/bluez5_utils/S40bluetooth b/package/bluez5_utils/S40bluetoothd
old mode 100755
new mode 100644
similarity index 100%
rename from package/bluez5_utils/S40bluetooth
rename to package/bluez5_utils/S40bluetoothd
diff --git a/package/bluez5_utils/bluez5_utils.mk b/package/bluez5_utils/bluez5_utils.mk
index 7fe6899cdb..37a2e79a7a 100644
--- a/package/bluez5_utils/bluez5_utils.mk
+++ b/package/bluez5_utils/bluez5_utils.mk
@@ -194,8 +194,8 @@ BLUEZ5_UTILS_CONF_OPTS += --disable-systemd
 endif
 
 define BLUEZ5_UTILS_INSTALL_INIT_SYSV
-	$(INSTALL) -m 0755 -D package/bluez5_utils/S40bluetooth \
-		$(TARGET_DIR)/etc/init.d/S40bluetooth
+	$(INSTALL) -m 0755 -D package/bluez5_utils/S40bluetoothd \
+		$(TARGET_DIR)/etc/init.d/S40bluetoothd
 endef
 
 $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

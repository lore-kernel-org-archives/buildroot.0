Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45909C6FD1D
	for <buildroot@archiver.kernel.org>; Mon, 20 Mar 2023 09:04:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E83EF60C00;
	Mon, 20 Mar 2023 09:04:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E83EF60C00
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7D3OY5Ti3Olp; Mon, 20 Mar 2023 09:04:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 333A460BDB;
	Mon, 20 Mar 2023 09:04:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 333A460BDB
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B3FC71BF424
 for <buildroot@lists.busybox.net>; Mon, 20 Mar 2023 09:04:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8F5D340139
 for <buildroot@lists.busybox.net>; Mon, 20 Mar 2023 09:04:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8F5D340139
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Si8y2cvNilgG for <buildroot@lists.busybox.net>;
 Mon, 20 Mar 2023 09:04:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id BB08D400F8
 for <buildroot@buildroot.org>; Mon, 20 Mar 2023 09:04:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BB08D400F8
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A0FD287540; Mon, 20 Mar 2023 09:04:28 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 20 Mar 2023 10:03:40 +0100
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 91d669e7a004df0be95173252b9f87209c2b82a5
X-Git-Newrev: 971bf1f768bc6af1b4b1cc7f6a80a6362b4645f2
X-Patchwork-Hint: ignore
Message-Id: <20230320090428.A0FD287540@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/bluez5_utils: fix
 SysV init script
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

commit: https://git.buildroot.net/buildroot/commit/?id=971bf1f768bc6af1b4b1cc7f6a80a6362b4645f2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

- Use daemon name (bluetoothd) as file name.
- Script doesn't need to be executable.

Signed-off-by: Daniel Lang <d.lang@abatec.at>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 456204e7e02cc787cee65711409025245ce337de)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
index 76070dc3a9..f6344ce2cd 100644
--- a/package/bluez5_utils/bluez5_utils.mk
+++ b/package/bluez5_utils/bluez5_utils.mk
@@ -184,8 +184,8 @@ BLUEZ5_UTILS_CONF_OPTS += --disable-systemd
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

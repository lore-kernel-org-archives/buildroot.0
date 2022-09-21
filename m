Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 981F5C6FA82
	for <buildroot@archiver.kernel.org>; Wed, 21 Sep 2022 19:56:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 32CB060B9F;
	Wed, 21 Sep 2022 19:56:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 32CB060B9F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fQTCunaiKiDk; Wed, 21 Sep 2022 19:56:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2F87460ACD;
	Wed, 21 Sep 2022 19:56:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2F87460ACD
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 401AC1BF3F0
 for <buildroot@lists.busybox.net>; Wed, 21 Sep 2022 19:55:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1B9F5826DF
 for <buildroot@lists.busybox.net>; Wed, 21 Sep 2022 19:55:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1B9F5826DF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BLWS137uxkCM for <buildroot@lists.busybox.net>;
 Wed, 21 Sep 2022 19:55:46 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 45781817B5
 for <buildroot@buildroot.org>; Wed, 21 Sep 2022 19:55:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 45781817B5
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3258A85D08; Wed, 21 Sep 2022 19:55:46 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 21 Sep 2022 21:55:20 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 7b1ab29d67b3a3fd8853dac75d7a22c17d27b6e9
X-Git-Newrev: 04985f4a0f2c594c34d93da1dfec4d7cef14fa02
X-Patchwork-Hint: ignore
Message-Id: <20220921195546.3258A85D08@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/mosquitto: add
 mosquitto group
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

commit: https://git.buildroot.net/buildroot/commit/?id=04985f4a0f2c594c34d93da1dfec4d7cef14fa02
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Since version 2.0.15, and upstream commit 71a90177d7b2 (Systemd: Add
mosquitto group ownership), mosquitto uses its own group rather than
the generic nobody group.

This means that mosquitto can now no longer start on a systemd-based
system.

Change our mosquitto user definition to specify a mosquitto group.

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
Cc: Titouan Christophe <titouanchristophe@gmail.com>
Cc: Francois Perrad <fperrad@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 63727d9a54b81e7dbeb87802bb9c9032ae6a3d71)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mosquitto/mosquitto.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/mosquitto/mosquitto.mk b/package/mosquitto/mosquitto.mk
index c47e61850b..12de2946b7 100644
--- a/package/mosquitto/mosquitto.mk
+++ b/package/mosquitto/mosquitto.mk
@@ -124,7 +124,7 @@ define MOSQUITTO_INSTALL_INIT_SYSTEMD
 endef
 
 define MOSQUITTO_USERS
-	mosquitto -1 nobody -1 * - - - Mosquitto user
+	mosquitto -1 mosquitto -1 * - - - Mosquitto user
 endef
 endif
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

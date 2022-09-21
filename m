Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD483ECAAD8
	for <buildroot@archiver.kernel.org>; Wed, 21 Sep 2022 19:57:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 65BDE4051B;
	Wed, 21 Sep 2022 19:57:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 65BDE4051B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GLSkBoquSHXC; Wed, 21 Sep 2022 19:57:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9455C4053C;
	Wed, 21 Sep 2022 19:57:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9455C4053C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E9FB21BF3F0
 for <buildroot@lists.busybox.net>; Wed, 21 Sep 2022 19:57:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C6302404B1
 for <buildroot@lists.busybox.net>; Wed, 21 Sep 2022 19:57:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C6302404B1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CDym_iw5rjoS for <buildroot@lists.busybox.net>;
 Wed, 21 Sep 2022 19:57:00 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id EB75F40180
 for <buildroot@buildroot.org>; Wed, 21 Sep 2022 19:56:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EB75F40180
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DB34585D1A; Wed, 21 Sep 2022 19:56:59 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 21 Sep 2022 21:54:51 +0200
X-Git-Refname: refs/heads/2022.08.x
X-Git-Oldrev: 4d5f5a7dd42769839cecbaf31c8a19439a1f4217
X-Git-Newrev: 2fe1a18b7fdac3fad33a6d2a5a13a8d660013ce8
X-Patchwork-Hint: ignore
Message-Id: <20220921195659.DB34585D1A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.08.x] package/mosquitto: add
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

commit: https://git.buildroot.net/buildroot/commit/?id=2fe1a18b7fdac3fad33a6d2a5a13a8d660013ce8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.08.x

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

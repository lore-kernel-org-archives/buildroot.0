Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0ABAEC25B06
	for <buildroot@archiver.kernel.org>; Sun, 14 Aug 2022 12:29:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 699CA60BB5;
	Sun, 14 Aug 2022 12:29:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 699CA60BB5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aOdYX0l9CIvh; Sun, 14 Aug 2022 12:29:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A52DD60BA4;
	Sun, 14 Aug 2022 12:29:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A52DD60BA4
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5FF3C1BF364
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 12:29:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 48A63404A3
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 12:29:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 48A63404A3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EK3xic11sUIF for <buildroot@lists.busybox.net>;
 Sun, 14 Aug 2022 12:29:26 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 81236400D8
 for <buildroot@buildroot.org>; Sun, 14 Aug 2022 12:29:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 81236400D8
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 7C8F987493; Sun, 14 Aug 2022 12:14:59 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 14 Aug 2022 14:29:21 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3d5ba95da6084d5d6cadca06018925f2172453cf
X-Git-Newrev: abf702a1bb9b90c06e139aa6bb9960702d7e1ad4
X-Patchwork-Hint: ignore
Message-Id: <20220814121459.7C8F987493@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/domoticz: needs minizip-zlib
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

commit: https://git.buildroot.net/buildroot/commit/?id=abf702a1bb9b90c06e139aa6bb9960702d7e1ad4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit fdd6fe927b8f2d99dbd0a5f5c58b92430d20e1be wrongly added minizip
dependency instead of minizip-zlib

Makefile:575: *** minizip is in the dependency chain of domoticz that has added it to its _DEPENDENCIES variable without selecting it or depending on it from Config.in.  Stop.

Fixes:
 - http://autobuild.buildroot.org/results/c51bed081b9ef9ecca809810cb41e1474d8fd9ef

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/domoticz/domoticz.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/domoticz/domoticz.mk b/package/domoticz/domoticz.mk
index f21c52d432..bc4a2def41 100644
--- a/package/domoticz/domoticz.mk
+++ b/package/domoticz/domoticz.mk
@@ -17,7 +17,7 @@ DOMOTICZ_DEPENDENCIES = \
 	jsoncpp \
 	libcurl \
 	lua \
-	minizip \
+	minizip-zlib \
 	mosquitto \
 	openssl \
 	sqlite \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

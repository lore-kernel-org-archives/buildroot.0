Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0093BC4167B
	for <buildroot@archiver.kernel.org>; Wed,  8 Nov 2023 22:27:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A0EEF60BB5;
	Wed,  8 Nov 2023 22:27:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A0EEF60BB5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TjA4ayTYUWIF; Wed,  8 Nov 2023 22:27:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EDAFC60B8E;
	Wed,  8 Nov 2023 22:27:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EDAFC60B8E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C72271BF40B
 for <buildroot@lists.busybox.net>; Wed,  8 Nov 2023 22:27:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9DA5D81DEC
 for <buildroot@lists.busybox.net>; Wed,  8 Nov 2023 22:27:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9DA5D81DEC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jvdQbQ-YpZ47 for <buildroot@lists.busybox.net>;
 Wed,  8 Nov 2023 22:27:14 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3E8C281B53
 for <buildroot@buildroot.org>; Wed,  8 Nov 2023 22:27:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3E8C281B53
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2B46086D8B; Wed,  8 Nov 2023 22:27:14 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 8 Nov 2023 23:26:58 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 14ae33c669afa8e4efb77d127e8ac83f5d721e3b
X-Git-Newrev: e3e844a1f9227c88a25236e4f2bdacb2cc214e4a
X-Patchwork-Hint: ignore
Message-Id: <20231108222714.2B46086D8B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libosmium: add optional GDAL
 dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=e3e844a1f9227c88a25236e4f2bdacb2cc214e4a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libosmium/libosmium.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/libosmium/libosmium.mk b/package/libosmium/libosmium.mk
index 2725130e72..b96c084b69 100644
--- a/package/libosmium/libosmium.mk
+++ b/package/libosmium/libosmium.mk
@@ -31,4 +31,8 @@ ifeq ($(BR2_PACKAGE_ZLIB),y)
 LIBOSMIUM_DEPENDENCIES += zlib
 endif
 
+ifeq ($(BR2_PACKAGE_GDAL),y)
+LIBOSMIUM_DEPENDENCIES += gdal
+endif
+
 $(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

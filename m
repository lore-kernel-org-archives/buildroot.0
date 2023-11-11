Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D1CEC4332F
	for <buildroot@archiver.kernel.org>; Sat, 11 Nov 2023 13:31:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8923A60BE7;
	Sat, 11 Nov 2023 13:31:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8923A60BE7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TDH1bGAfDq7l; Sat, 11 Nov 2023 13:31:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B7A56610B9;
	Sat, 11 Nov 2023 13:31:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B7A56610B9
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 57E181BF870
 for <buildroot@lists.busybox.net>; Sat, 11 Nov 2023 13:30:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 312CB40C01
 for <buildroot@lists.busybox.net>; Sat, 11 Nov 2023 13:30:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 312CB40C01
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1BNJJBdioaH7 for <buildroot@lists.busybox.net>;
 Sat, 11 Nov 2023 13:30:47 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4757040A45
 for <buildroot@buildroot.org>; Sat, 11 Nov 2023 13:30:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4757040A45
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3006686C52; Sat, 11 Nov 2023 13:30:47 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 11 Nov 2023 14:25:24 +0100
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: bfe5459626377cf71d48a7b1a230502d978cb212
X-Git-Newrev: 1bdbb9024bff1475943dc40b3e3bd1d836c4cc69
X-Patchwork-Hint: ignore
Message-Id: <20231111133047.3006686C52@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/libosmium: add
 optional GDAL dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=1bdbb9024bff1475943dc40b3e3bd1d836c4cc69
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit e3e844a1f9227c88a25236e4f2bdacb2cc214e4a)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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

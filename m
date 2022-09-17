Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A0ECECAAD3
	for <buildroot@archiver.kernel.org>; Sat, 17 Sep 2022 10:27:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 403338431E;
	Sat, 17 Sep 2022 10:27:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 403338431E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cw5RtEdjdBKW; Sat, 17 Sep 2022 10:27:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 79B218402E;
	Sat, 17 Sep 2022 10:27:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 79B218402E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BE9301BF5A4
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 10:27:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 55D9360AD7
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 10:27:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 55D9360AD7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1JYSOGmQmJmd for <buildroot@lists.busybox.net>;
 Sat, 17 Sep 2022 10:27:20 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 744A060AD6
 for <buildroot@buildroot.org>; Sat, 17 Sep 2022 10:27:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 744A060AD6
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 64436841CA; Sat, 17 Sep 2022 10:27:20 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 17 Sep 2022 12:20:50 +0200
X-Git-Refname: refs/heads/2022.05.x
X-Git-Oldrev: bfb343d2ec87ceb7cec933ac85971072110f599a
X-Git-Newrev: 6c6f2f46f274baacc565df7c58a8a6076abdae08
X-Patchwork-Hint: ignore
Message-Id: <20220917102720.64436841CA@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.05.x] package/webkitgtk: drop
 unused flag
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

commit: https://git.buildroot.net/buildroot/commit/?id=6c6f2f46f274baacc565df7c58a8a6076abdae08
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.05.x

Upstream dropped in:
https://github.com/WebKit/WebKit/commit/aa6631a6189aaa4541a2d2e89993a4989103d161,
which is present since webkitgtk 2.36.4.

Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit a0690a8e2474f5ae676ec9602eec56ddc870efad)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/webkitgtk/webkitgtk.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/webkitgtk/webkitgtk.mk b/package/webkitgtk/webkitgtk.mk
index 8949cb2b1c..b5b9be3778 100644
--- a/package/webkitgtk/webkitgtk.mk
+++ b/package/webkitgtk/webkitgtk.mk
@@ -78,7 +78,6 @@ endif
 # 2D CANVAS acceleration requires OpenGL proper with cairo-gl
 ifeq ($(BR2_PACKAGE_LIBGTK3_X11),y)
 WEBKITGTK_CONF_OPTS += \
-	-DENABLE_ACCELERATED_2D_CANVAS=ON \
 	-DENABLE_GLES2=OFF \
 	-DENABLE_X11_TARGET=ON
 WEBKITGTK_DEPENDENCIES += libgl \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

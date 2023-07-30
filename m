Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92596C001DC
	for <buildroot@archiver.kernel.org>; Sun, 30 Jul 2023 10:32:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2B27360761;
	Sun, 30 Jul 2023 10:32:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2B27360761
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6rBSjRd9e7vz; Sun, 30 Jul 2023 10:32:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 75E2560A98;
	Sun, 30 Jul 2023 10:32:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 75E2560A98
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 028011BF41B
 for <buildroot@lists.busybox.net>; Sun, 30 Jul 2023 10:32:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DD07060A98
 for <buildroot@lists.busybox.net>; Sun, 30 Jul 2023 10:32:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DD07060A98
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BhhW7nkCHJ_d for <buildroot@lists.busybox.net>;
 Sun, 30 Jul 2023 10:32:02 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2289460761
 for <buildroot@buildroot.org>; Sun, 30 Jul 2023 10:32:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2289460761
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0A27583BC1; Sun, 30 Jul 2023 10:32:02 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 30 Jul 2023 12:27:11 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: afb30002403857baae1c48c2d2c4186ae63be613
X-Git-Newrev: 4c15d7a9e7b1da8824b1459b84ebec9c17e6f170
X-Patchwork-Hint: ignore
Message-Id: <20230730103202.0A27583BC1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gd: add optional support for
 libheif
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

commit: https://git.buildroot.net/buildroot/commit/?id=4c15d7a9e7b1da8824b1459b84ebec9c17e6f170
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gd/gd.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/gd/gd.mk b/package/gd/gd.mk
index 55c12e6968..969c02aade 100644
--- a/package/gd/gd.mk
+++ b/package/gd/gd.mk
@@ -44,6 +44,13 @@ GD_DEPENDENCIES += jpeg
 GD_CONF_OPTS += --with-jpeg
 endif
 
+ifeq ($(BR2_PACKAGE_LIBHEIF),y)
+GD_DEPENDENCIES += libheif
+GD_CONF_OPTS += --with-heif
+else
+GD_CONF_OPTS += --without-heif
+endif
+
 ifeq ($(BR2_PACKAGE_LIBPNG),y)
 GD_DEPENDENCIES += libpng
 GD_CONF_OPTS += --with-png
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

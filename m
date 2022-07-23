Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36190C433EF
	for <buildroot@archiver.kernel.org>; Sat, 23 Jul 2022 13:37:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C9E0D4164F;
	Sat, 23 Jul 2022 13:37:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C9E0D4164F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 42NE27cnYrUx; Sat, 23 Jul 2022 13:37:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A28DB4164C;
	Sat, 23 Jul 2022 13:37:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A28DB4164C
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5C0EE1BF31A
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 13:36:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3E9F260B59
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 13:36:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3E9F260B59
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id omogrMeDEqEq for <buildroot@lists.busybox.net>;
 Sat, 23 Jul 2022 13:36:45 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6A30C60FE7
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 13:36:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6A30C60FE7
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 763B08445A; Sat, 23 Jul 2022 13:23:08 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 23 Jul 2022 15:36:21 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 50763ea09495374a606ebd3665c4c932603e5304
X-Git-Newrev: 97fc9b2a7f32f803286238edffbe0baf5c49b349
X-Patchwork-Hint: ignore
Message-Id: <20220723132308.763B08445A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] board/*/genimage.cfg: use
 partition-table-type = "gpt"
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

commit: https://git.buildroot.net/buildroot/commit/?id=97fc9b2a7f32f803286238edffbe0baf5c49b349
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The gpt = "true" form is deprecated in genimage, use
partition-table-type = "gpt" instead.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 board/octavo/osd32mp1-brk/genimage.cfg                           | 2 +-
 board/octavo/osd32mp1-red/genimage.cfg                           | 2 +-
 board/olimex/stmp1_olinuxino/genimage.cfg                        | 2 +-
 board/seeed/stm32mp157c-odyssey/genimage.cfg                     | 2 +-
 board/stmicroelectronics/common/stm32mp157/genimage.cfg.template | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/board/octavo/osd32mp1-brk/genimage.cfg b/board/octavo/osd32mp1-brk/genimage.cfg
index 644fc3d922..c632090efd 100644
--- a/board/octavo/osd32mp1-brk/genimage.cfg
+++ b/board/octavo/osd32mp1-brk/genimage.cfg
@@ -1,6 +1,6 @@
 image sdcard.img {
 	hdimage {
-		gpt = "true"
+		partition-table-type = "gpt"
 	}
 
 	partition fsbl1 {
diff --git a/board/octavo/osd32mp1-red/genimage.cfg b/board/octavo/osd32mp1-red/genimage.cfg
index 0caad0b4b8..3f86579b98 100644
--- a/board/octavo/osd32mp1-red/genimage.cfg
+++ b/board/octavo/osd32mp1-red/genimage.cfg
@@ -1,6 +1,6 @@
 image sdcard.img {
 	hdimage {
-		gpt = "true"
+		partition-table-type = "gpt"
 	}
 
 	partition fsbl1 {
diff --git a/board/olimex/stmp1_olinuxino/genimage.cfg b/board/olimex/stmp1_olinuxino/genimage.cfg
index 2f00ee979a..02800db8d4 100644
--- a/board/olimex/stmp1_olinuxino/genimage.cfg
+++ b/board/olimex/stmp1_olinuxino/genimage.cfg
@@ -1,6 +1,6 @@
 image sdcard.img {
 	hdimage {
-		gpt = "true"
+		partition-table-type = "gpt"
 	}
 
 	partition fsbl1 {
diff --git a/board/seeed/stm32mp157c-odyssey/genimage.cfg b/board/seeed/stm32mp157c-odyssey/genimage.cfg
index 170dedc254..4c18a2eb04 100644
--- a/board/seeed/stm32mp157c-odyssey/genimage.cfg
+++ b/board/seeed/stm32mp157c-odyssey/genimage.cfg
@@ -1,6 +1,6 @@
 image sdcard.img {
 	hdimage {
-		gpt = "true"
+		partition-table-type = "gpt"
 	}
 
 	partition fsbl1 {
diff --git a/board/stmicroelectronics/common/stm32mp157/genimage.cfg.template b/board/stmicroelectronics/common/stm32mp157/genimage.cfg.template
index 03fba8daf0..ff4aeceeed 100644
--- a/board/stmicroelectronics/common/stm32mp157/genimage.cfg.template
+++ b/board/stmicroelectronics/common/stm32mp157/genimage.cfg.template
@@ -1,6 +1,6 @@
 image sdcard.img {
 	hdimage {
-		gpt = "true"
+		partition-table-type = "gpt"
 	}
 
 	partition fsbl1 {
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

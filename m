Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D24DBC27C76
	for <buildroot@archiver.kernel.org>; Sun, 22 Jan 2023 12:45:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3FA1381EF1;
	Sun, 22 Jan 2023 12:45:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3FA1381EF1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SvzfaKP76T1o; Sun, 22 Jan 2023 12:45:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9CA2C81EE4;
	Sun, 22 Jan 2023 12:45:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9CA2C81EE4
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A56101BF5E6
 for <buildroot@lists.busybox.net>; Sun, 22 Jan 2023 12:45:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 813EF81EE4
 for <buildroot@lists.busybox.net>; Sun, 22 Jan 2023 12:45:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 813EF81EE4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rUJxLhrsUaE2 for <buildroot@lists.busybox.net>;
 Sun, 22 Jan 2023 12:45:07 +0000 (UTC)
X-Greylist: delayed 00:06:41 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 394FA81EE3
Received: from mfwd02.mailplug.co.kr (mfwd02.mailplug.co.kr [14.49.38.25])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 394FA81EE3
 for <buildroot@buildroot.org>; Sun, 22 Jan 2023 12:45:06 +0000 (UTC)
Received: (qmail 3620 invoked from network); 22 Jan 2023 21:38:23 +0900
Received: from wmail10.mailplug.com (121.156.118.13)
 by 0 (qmail 1.03 + mailplug 2.0) with SMTP;
 22 Jan 2023 21:37:23 +0900
Received: (qmail 3529629 invoked from network); 22 Jan 2023 21:37:22 +0900
Received: from unknown (HELO sslauth17)
 (cherniaev.andrei@kairo.space@211.253.39.91)
 by 0 (qmail 1.03 + mailplug 2.0) with SMTP;
 22 Jan 2023 21:37:22 +0900
From: AndreiCherniaev <cherniaev.andrei@kairo.space>
To: buildroot@buildroot.org
Date: Sun, 22 Jan 2023 21:36:45 +0900
Message-Id: <20230122123645.2903470-1-cherniaev.andrei@kairo.space>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] board/qemu: add echo for errors
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
Cc: AndreiCherniaev <glscene2010@gmail.com>,
 Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: AndreiCherniaev <glscene2010@gmail.com>

---
 board/qemu/post-image.sh | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/board/qemu/post-image.sh b/board/qemu/post-image.sh
index 88f0413496..91d5b88b03 100755
--- a/board/qemu/post-image.sh
+++ b/board/qemu/post-image.sh
@@ -6,8 +6,8 @@ README_FILES="${QEMU_BOARD_DIR}/*/readme.txt"
 START_QEMU_SCRIPT="${BINARIES_DIR}/start-qemu.sh"
 
 if [[ "${DEFCONFIG_NAME}" =~ ^"qemu_*" ]]; then
-    # Not a Qemu defconfig, can't test.
-    exit 0
+    echo "Not a Qemu defconfig, can't test"
+    exit 1
 fi
 
 # Search for "# qemu_*_defconfig" tag in all readme.txt files.
@@ -15,8 +15,8 @@ fi
 QEMU_CMD_LINE=$(sed -r ':a; /\\$/N; s/\\\n//; s/\t/ /; ta; /# '${DEFCONFIG_NAME}'$/!d; s/#.*//' ${README_FILES})
 
 if [ -z "${QEMU_CMD_LINE}" ]; then
-    # No Qemu cmd line found, can't test.
-    exit 0
+    echo "No Qemu cmd line found, can't test"
+    exit 1
 fi
 
 # Remove output/images path since the script will be in
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

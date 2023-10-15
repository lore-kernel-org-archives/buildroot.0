Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDB30CDB47E
	for <buildroot@archiver.kernel.org>; Sun, 15 Oct 2023 09:04:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 92C3640AA2;
	Sun, 15 Oct 2023 09:04:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 92C3640AA2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Z3fwBqVulemM; Sun, 15 Oct 2023 09:04:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 57DE840C1A;
	Sun, 15 Oct 2023 09:04:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 57DE840C1A
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2859E1BF2F1
 for <buildroot@lists.busybox.net>; Sun, 15 Oct 2023 09:03:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3681361056
 for <buildroot@lists.busybox.net>; Sun, 15 Oct 2023 09:03:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3681361056
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6817u7mIPpix for <buildroot@lists.busybox.net>;
 Sun, 15 Oct 2023 09:03:01 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D1B1C6108B
 for <buildroot@buildroot.org>; Sun, 15 Oct 2023 09:03:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D1B1C6108B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CD503851BB; Sun, 15 Oct 2023 09:03:00 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 15 Oct 2023 10:56:40 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e55770e8827567c8c4952713c9cd149012f5d68f
X-Git-Newrev: 3381a084330e8f48785fb472e95c01d7a9602b36
X-Patchwork-Hint: ignore
Message-Id: <20231015090300.CD503851BB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] board/raspberrypi: fix typo in comment
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
Content-Type: multipart/mixed; boundary="===============1497016975174648759=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1497016975174648759==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=3381a084330e8f48785fb472e95c01d7a9602b36
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This fixes a typo by dropping off the spurious x in ensure.

Signed-off-by: Gaël PORTAY <gael.portay@rtone.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 board/raspberrypi/post-build.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/board/raspberrypi/post-build.sh b/board/raspberrypi/post-build.sh
index 38fdc80734..0bd7bc3d17 100755
--- a/board/raspberrypi/post-build.sh
+++ b/board/raspberrypi/post-build.sh
@@ -15,5 +15,5 @@ elif [ -d ${TARGET_DIR}/etc/systemd ]; then
        "${TARGET_DIR}/etc/systemd/system/getty.target.wants/getty@tty1.service"
 fi
 
-# exnsure overlays exists for genimage
+# ensure overlays exists for genimage
 mkdir -p "${BINARIES_DIR}/rpi-firmware/overlays"

--===============1497016975174648759==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1497016975174648759==--

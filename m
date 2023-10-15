Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACE26CDB47E
	for <buildroot@archiver.kernel.org>; Sun, 15 Oct 2023 18:35:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4E6CA414B6;
	Sun, 15 Oct 2023 18:35:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4E6CA414B6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QCRXf7wosFKa; Sun, 15 Oct 2023 18:35:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4E48F414B9;
	Sun, 15 Oct 2023 18:35:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4E48F414B9
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 265121BF83A
 for <buildroot@lists.busybox.net>; Sun, 15 Oct 2023 18:32:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D3BD241704
 for <buildroot@lists.busybox.net>; Sun, 15 Oct 2023 18:32:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D3BD241704
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IP6zJ9jNjfeu for <buildroot@lists.busybox.net>;
 Sun, 15 Oct 2023 18:32:52 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 09F8C41708
 for <buildroot@buildroot.org>; Sun, 15 Oct 2023 18:32:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 09F8C41708
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EF2F6855AA; Sun, 15 Oct 2023 18:32:51 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 15 Oct 2023 20:24:35 +0200
X-Git-Refname: refs/heads/2023.08.x
X-Git-Oldrev: 3f854cea477ab977ab8fb00125f69f7208e352a3
X-Git-Newrev: 6f8b4a006a42f8d43d05ea529d936ebea874c7dd
X-Patchwork-Hint: ignore
Message-Id: <20231015183251.EF2F6855AA@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.08.x] board/raspberrypi: fix
 typo in comment
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
Content-Type: multipart/mixed; boundary="===============4988813486015814283=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4988813486015814283==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=6f8b4a006a42f8d43d05ea529d936ebea874c7dd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.08.x

This fixes a typo by dropping off the spurious x in ensure.

Signed-off-by: Gaël PORTAY <gael.portay@rtone.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 3381a084330e8f48785fb472e95c01d7a9602b36)
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

--===============4988813486015814283==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4988813486015814283==--

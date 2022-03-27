Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36742C433EF
	for <buildroot@archiver.kernel.org>; Sun, 27 Mar 2022 15:47:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EF62860EE2;
	Sun, 27 Mar 2022 15:47:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WnF5Qw9y0CNg; Sun, 27 Mar 2022 15:47:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 21E8060E27;
	Sun, 27 Mar 2022 15:47:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4CE191BF9A4
 for <buildroot@lists.busybox.net>; Sun, 27 Mar 2022 15:46:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 119B54098B
 for <buildroot@lists.busybox.net>; Sun, 27 Mar 2022 15:46:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oUiuQcUYAVBQ for <buildroot@lists.busybox.net>;
 Sun, 27 Mar 2022 15:46:20 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5FA6640993
 for <buildroot@buildroot.org>; Sun, 27 Mar 2022 15:46:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 09D4685D66; Sun, 27 Mar 2022 15:37:12 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 27 Mar 2022 16:54:28 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: de59a62af68593303bf420338e719a17e1a5e243
X-Git-Newrev: 53da16e3786cbf4c7637dacfddeef58c315cce66
X-Patchwork-Hint: ignore
Message-Id: <20220327153712.09D4685D66@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/spidev_test: fix spidev_test.c
 version in Config.in help text
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

commit: https://git.buildroot.net/buildroot/commit/?id=53da16e3786cbf4c7637dacfddeef58c315cce66
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- fix spidev_test.c version in Config.in help text, version update to 4.10
  (missing from commit 'spidev_test: bump to version in Linux 4.10' [1])

[1] https://git.buildroot.net/buildroot/commit/?id=a497a9fd6cdb518572282b1478279f476f870fb7

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/spidev_test/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/spidev_test/Config.in b/package/spidev_test/Config.in
index 44990c66b6..aa57b5edbf 100644
--- a/package/spidev_test/Config.in
+++ b/package/spidev_test/Config.in
@@ -9,7 +9,7 @@ config BR2_PACKAGE_SPIDEV_TEST
 	  proper operation of 'spidev_test'.
 
 	  The version used is based on your toolchain headers version,
-	  if it's older than 3.15 then 3.0 is used, otherwise 3.15
+	  if it's older than 3.15 then 3.0 is used, otherwise 4.10
 	  is used.
 	  This means you won't have quad-pumped SPI support if your
 	  toolchain is too old.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

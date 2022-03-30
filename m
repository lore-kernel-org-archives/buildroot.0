Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3648FC433EF
	for <buildroot@archiver.kernel.org>; Wed, 30 Mar 2022 17:22:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DDCC1848D2;
	Wed, 30 Mar 2022 17:22:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6oKWJDuRMS-a; Wed, 30 Mar 2022 17:22:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 056D4848C7;
	Wed, 30 Mar 2022 17:22:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 21C1F1BF9D1
 for <buildroot@lists.busybox.net>; Wed, 30 Mar 2022 17:22:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1C83D41C5E
 for <buildroot@lists.busybox.net>; Wed, 30 Mar 2022 17:22:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hFvj9qpEWvju for <buildroot@lists.busybox.net>;
 Wed, 30 Mar 2022 17:22:02 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2680E41C16
 for <buildroot@buildroot.org>; Wed, 30 Mar 2022 17:22:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id DCE2B85FD2; Wed, 30 Mar 2022 17:12:46 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 30 Mar 2022 19:20:21 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: b78b4fedb5c19e87d866fdef0acd028c633fa900
X-Git-Newrev: 997ac4e38bb9a98dfa3db8b046fcaaae192d5291
X-Patchwork-Hint: ignore
Message-Id: <20220330171246.DCE2B85FD2@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/spidev_test: fix
 spidev_test.c version in Config.in help text
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

commit: https://git.buildroot.net/buildroot/commit/?id=997ac4e38bb9a98dfa3db8b046fcaaae192d5291
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

- fix spidev_test.c version in Config.in help text, version update to 4.10
  (missing from commit 'spidev_test: bump to version in Linux 4.10' [1])

[1] https://git.buildroot.net/buildroot/commit/?id=a497a9fd6cdb518572282b1478279f476f870fb7

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 53da16e3786cbf4c7637dacfddeef58c315cce66)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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

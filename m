Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D85FBC61DA4
	for <buildroot@archiver.kernel.org>; Thu, 23 Feb 2023 19:11:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 859D8410E0;
	Thu, 23 Feb 2023 19:11:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 859D8410E0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DyWuzVhRUKCe; Thu, 23 Feb 2023 19:11:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5A288410E8;
	Thu, 23 Feb 2023 19:11:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5A288410E8
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B15C51BF343
 for <buildroot@lists.busybox.net>; Thu, 23 Feb 2023 19:09:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 976516074C
 for <buildroot@lists.busybox.net>; Thu, 23 Feb 2023 19:09:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 976516074C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4tkfbk5xNG3F for <buildroot@lists.busybox.net>;
 Thu, 23 Feb 2023 19:09:57 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id BC59560608
 for <buildroot@buildroot.org>; Thu, 23 Feb 2023 19:09:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BC59560608
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id ABAC18694A; Thu, 23 Feb 2023 19:09:57 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 23 Feb 2023 20:08:02 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 00cbf0095cdc1da96ddd1d991ac1e5979bd05d08
X-Git-Newrev: efd9ca6df67298ed1b60fd05d9d2d783dee1bd98
X-Patchwork-Hint: ignore
Message-Id: <20230223190957.ABAC18694A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/dahdi-linux:
 update URL in Config.in help text
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

commit: https://git.buildroot.net/buildroot/commit/?id=efd9ca6df67298ed1b60fd05d9d2d783dee1bd98
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

http://www.asterisk.org/downloads/dahdi no longer works, use the
Github page instead.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit e06975b38047fe1ef47650248f154ecf88fe09b5)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dahdi-linux/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/dahdi-linux/Config.in b/package/dahdi-linux/Config.in
index 7b6ce79422..b6086fdc6c 100644
--- a/package/dahdi-linux/Config.in
+++ b/package/dahdi-linux/Config.in
@@ -9,7 +9,7 @@ config BR2_PACKAGE_DAHDI_LINUX
 	  DAHDI Linux is the open source device driver framework used to
 	  interface Asterisk with telephony hardware.
 
-	  http://www.asterisk.org/downloads/dahdi
+	  https://github.com/asterisk/dahdi-linux
 
 comment "dahdi-linux needs a Linux kernel to be built"
 	depends on !BR2_LINUX_KERNEL
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

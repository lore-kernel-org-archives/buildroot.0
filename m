Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93E72C433FE
	for <buildroot@archiver.kernel.org>; Tue, 15 Nov 2022 11:11:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3C35740990;
	Tue, 15 Nov 2022 11:11:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3C35740990
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1m6STMsDEa-I; Tue, 15 Nov 2022 11:11:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2D0D640A00;
	Tue, 15 Nov 2022 11:11:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2D0D640A00
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 371651BF59E
 for <buildroot@lists.busybox.net>; Tue, 15 Nov 2022 11:10:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 20A4A81656
 for <buildroot@lists.busybox.net>; Tue, 15 Nov 2022 11:10:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 20A4A81656
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GGbyTCpz0aX0 for <buildroot@lists.busybox.net>;
 Tue, 15 Nov 2022 11:10:58 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4E96781589
 for <buildroot@buildroot.org>; Tue, 15 Nov 2022 11:10:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4E96781589
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3E35E83C31; Tue, 15 Nov 2022 11:10:58 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 15 Nov 2022 12:07:39 +0100
X-Git-Refname: refs/heads/2022.08.x
X-Git-Oldrev: 580f76e85b5bc5cd8b1ccba0e3bcb19a0b5bc8ea
X-Git-Newrev: 848643401cea201e22a4aa06a7e5a1e0a80e7abd
X-Patchwork-Hint: ignore
Message-Id: <20221115111058.3E35E83C31@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.08.x] package/udisks: fix the
 tool name in the config help
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

commit: https://git.buildroot.net/buildroot/commit/?id=848643401cea201e22a4aa06a7e5a1e0a80e7abd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.08.x

The name of the tool in udisks2 is udisksctl.

Signed-off-by: Wolfgang Grandegger <wg@grandegger.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 593c64eaf9d2f03d1a0164c114caffa2f4546f5b)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/udisks/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/udisks/Config.in b/package/udisks/Config.in
index a3a0f82144..5d0b96f3c0 100644
--- a/package/udisks/Config.in
+++ b/package/udisks/Config.in
@@ -31,8 +31,8 @@ config BR2_PACKAGE_UDISKS
 	     interfaces that can be used to query and manipulate
 	     storage devices.
 
-	   o a command-line tool, udisks(1), that can be used to query
-	     and use the daemon
+	   o a command-line tool, udisksctl(1), that can be used to
+	     query and use the daemon
 
 	  http://www.freedesktop.org/wiki/Software/udisks
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

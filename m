Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB4B9C433FE
	for <buildroot@archiver.kernel.org>; Tue, 15 Nov 2022 11:10:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 659B6813BC;
	Tue, 15 Nov 2022 11:10:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 659B6813BC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id I8lwtGWoXvaS; Tue, 15 Nov 2022 11:10:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A3855814A0;
	Tue, 15 Nov 2022 11:10:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A3855814A0
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 089961BF94B
 for <buildroot@lists.busybox.net>; Tue, 15 Nov 2022 11:09:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D7FE2400BF
 for <buildroot@lists.busybox.net>; Tue, 15 Nov 2022 11:09:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D7FE2400BF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kUAbmdzlGLBf for <buildroot@lists.busybox.net>;
 Tue, 15 Nov 2022 11:09:52 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D3DF74000B
 for <buildroot@buildroot.org>; Tue, 15 Nov 2022 11:09:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D3DF74000B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BC38583C26; Tue, 15 Nov 2022 11:09:52 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 15 Nov 2022 12:07:51 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 0934311736a2161834376ddfd60f9757e1e94ae2
X-Git-Newrev: 48cd67d587a80a84b6d8c2cdcc97a5b736fdd4e4
X-Patchwork-Hint: ignore
Message-Id: <20221115110952.BC38583C26@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/udisks: fix the
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

commit: https://git.buildroot.net/buildroot/commit/?id=48cd67d587a80a84b6d8c2cdcc97a5b736fdd4e4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

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

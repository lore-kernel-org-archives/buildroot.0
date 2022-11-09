Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A46BFC4332F
	for <buildroot@archiver.kernel.org>; Wed,  9 Nov 2022 22:10:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2BF5C80BDC;
	Wed,  9 Nov 2022 22:10:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2BF5C80BDC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bOezvgncVpk9; Wed,  9 Nov 2022 22:10:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6078B80BB1;
	Wed,  9 Nov 2022 22:10:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6078B80BB1
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0961F1BF308
 for <buildroot@lists.busybox.net>; Wed,  9 Nov 2022 22:10:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E6932605BA
 for <buildroot@lists.busybox.net>; Wed,  9 Nov 2022 22:10:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E6932605BA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3JdZE1h0koBs for <buildroot@lists.busybox.net>;
 Wed,  9 Nov 2022 22:10:00 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2FF7F60774
 for <buildroot@buildroot.org>; Wed,  9 Nov 2022 22:10:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2FF7F60774
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 192C18282A; Wed,  9 Nov 2022 22:10:00 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 9 Nov 2022 23:09:39 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6a0759dd02401e681b008c17b18a9669aba4b8f2
X-Git-Newrev: 593c64eaf9d2f03d1a0164c114caffa2f4546f5b
X-Patchwork-Hint: ignore
Message-Id: <20221109221000.192C18282A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/udisks: fix the tool name in the
 config help
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

commit: https://git.buildroot.net/buildroot/commit/?id=593c64eaf9d2f03d1a0164c114caffa2f4546f5b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The name of the tool in udisks2 is udisksctl.

Signed-off-by: Wolfgang Grandegger <wg@grandegger.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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

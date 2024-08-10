Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBC51C3DA4A
	for <buildroot@archiver.kernel.org>; Sat, 10 Aug 2024 09:53:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8F4FB8437C;
	Sat, 10 Aug 2024 09:53:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A5qzEh3kLNbP; Sat, 10 Aug 2024 09:53:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 156B584160
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 156B584160;
	Sat, 10 Aug 2024 09:53:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9D6E61BF868
 for <buildroot@lists.busybox.net>; Sat, 10 Aug 2024 09:53:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7DE8940464
 for <buildroot@lists.busybox.net>; Sat, 10 Aug 2024 09:53:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QlvNNDVS8D5m for <buildroot@lists.busybox.net>;
 Sat, 10 Aug 2024 09:53:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 948714042E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 948714042E
 for <buildroot@buildroot.org>; Sat, 10 Aug 2024 09:53:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8221784A80; Sat, 10 Aug 2024 09:53:26 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 10 Aug 2024 10:50:32 +0200
X-Git-Refname: refs/heads/2024.05.x
X-Git-Oldrev: 8a6b86756843df35ce103423188a55eb80bb255c
X-Git-Newrev: 53d0a01c0be32c34befdeff50a46f5b576d6296d
X-Patchwork-Hint: ignore
Message-Id: <20240810095326.8221784A80@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.05.x] DEVELOPERS: drop
 duplicated libnfc entry
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

commit: https://git.buildroot.net/buildroot/commit/?id=53d0a01c0be32c34befdeff50a46f5b576d6296d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.05.x

The patch removes one of the two occurrences of libnfc from the list of
packages managed by Simon Dawson.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 673d371cf22262509e8f764615864be31b3e146e)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS | 1 -
 1 file changed, 1 deletion(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 7bb7b371ff..2536f2eac2 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2896,7 +2896,6 @@ F:	package/lcdapi/
 F:	package/libfreefare/
 F:	package/libjson/
 F:	package/libnfc/
-F:	package/libnfc/
 F:	package/libserial/
 F:	package/libsigsegv/
 F:	package/macchanger/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 481ABCF256B
	for <buildroot@archiver.kernel.org>; Sat, 12 Oct 2024 15:09:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 12DDD61520;
	Sat, 12 Oct 2024 15:09:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hS8ig7BzVBek; Sat, 12 Oct 2024 15:09:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D5C246158D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D5C246158D;
	Sat, 12 Oct 2024 15:09:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2487B1BF3F3
 for <buildroot@lists.busybox.net>; Sat, 12 Oct 2024 15:08:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1128C405A7
 for <buildroot@lists.busybox.net>; Sat, 12 Oct 2024 15:08:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ix8aqNqIwyTu for <buildroot@lists.busybox.net>;
 Sat, 12 Oct 2024 15:08:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BA0C2405E1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id BA0C2405E1
 for <buildroot@buildroot.org>; Sat, 12 Oct 2024 15:08:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B05FF814FC; Sat, 12 Oct 2024 15:08:00 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 12 Oct 2024 17:00:41 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: f909812eb8c69a19145549fb4b0b71d7dc053bbd
X-Git-Newrev: efd70c2c6ffc13fdc3fa08c766a5bb838556a67f
X-Patchwork-Hint: ignore
Message-Id: <20241012150800.B05FF814FC@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/sysklogd: fix
 typos in help text
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

commit: https://git.buildroot.net/buildroot/commit/?id=efd70c2c6ffc13fdc3fa08c766a5bb838556a67f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
[Arnout: fix additional 'recommended' typo]
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
(cherry picked from commit 74bef5945f48fea2a863a456fa21271d136ed189)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/sysklogd/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/sysklogd/Config.in b/package/sysklogd/Config.in
index 3315a6ddc9..979b90494e 100644
--- a/package/sysklogd/Config.in
+++ b/package/sysklogd/Config.in
@@ -33,9 +33,9 @@ config BR2_PACKAGE_SYSKLOGD_LOGGER
 	help
 	  Generate log messages from scripts or from the command line.
 
-	  This version of logger is receommended for use with sysklogd.
+	  This version of logger is recommended for use with sysklogd.
 	  It makes use of the new syslogp() API for RFC5424 style logs,
-	  e.g. MSGID, strucutred data (SD), etc.
+	  e.g. MSGID, structured data (SD), etc.
 
 	  The BusyBox, or util-linux, logger tools can also be used, but
 	  are limited to RFC3164 style messages.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

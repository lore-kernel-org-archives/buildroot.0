Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46451C02199
	for <buildroot@archiver.kernel.org>; Sun,  9 Feb 2025 15:10:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 096DA8175C;
	Sun,  9 Feb 2025 15:10:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9VTXIdHDEUIk; Sun,  9 Feb 2025 15:10:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 996DB81772
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 996DB81772;
	Sun,  9 Feb 2025 15:10:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 060506C
 for <buildroot@buildroot.org>; Sun,  9 Feb 2025 15:09:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2E54360777
 for <buildroot@buildroot.org>; Sun,  9 Feb 2025 15:09:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xDJLHdR-zRTS for <buildroot@buildroot.org>;
 Sun,  9 Feb 2025 15:09:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 66B1F60755
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 66B1F60755
 for <buildroot@buildroot.org>; Sun,  9 Feb 2025 15:09:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 632CD87456; Sun,  9 Feb 2025 15:09:51 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 9 Feb 2025 15:40:58 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ef80b710f214fe76dca1aa666eb5e7cea9702ca0
X-Git-Newrev: 236a890d80d24d9a43091846e693588c47b4d249
X-Patchwork-Hint: ignore
Message-Id: <20250209150951.632CD87456@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mdnsd: disable shellcheck SC2317
 for S50mdnsd
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

commit: https://git.buildroot.net/buildroot/commit/?id=236a890d80d24d9a43091846e693588c47b4d249
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

shellcheck 0.9.0 throw an error due to SC2317 check on
sysv init scripts.

Indeed, start/stop/restart/reload function can't be
reached in one execution.

See:
https://www.shellcheck.net/wiki/SC2317

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mdnsd/S50mdnsd | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/mdnsd/S50mdnsd b/package/mdnsd/S50mdnsd
index 1c2b71802c..13b65d0c69 100644
--- a/package/mdnsd/S50mdnsd
+++ b/package/mdnsd/S50mdnsd
@@ -1,4 +1,5 @@
 #!/bin/sh
+# shellcheck disable=SC2317  # Don't warn about unreachable commands in this file
 
 DAEMON=mdnsd
 MDNSD=/usr/sbin/$DAEMON
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

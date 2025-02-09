Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56A24C282C6
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 17:16:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3D30070944;
	Fri, 28 Feb 2025 17:16:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LvDXcM79GfX4; Fri, 28 Feb 2025 17:16:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4C7EF70946
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4C7EF70946;
	Fri, 28 Feb 2025 17:16:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 112331DD
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:45:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6E4E1439BF
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:31:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0E0bYa3QLo1j for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:31:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 307A444A33
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 307A444A33
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1A5DB8749E; Fri, 28 Feb 2025 16:30:38 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 9 Feb 2025 15:40:58 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: ef80b710f214fe76dca1aa666eb5e7cea9702ca0
X-Git-Newrev: 236a890d80d24d9a43091846e693588c47b4d249
X-Patchwork-Hint: ignore
Message-Id: <20250228163038.1A5DB8749E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/mdnsd: disable
 shellcheck SC2317 for S50mdnsd
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
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

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

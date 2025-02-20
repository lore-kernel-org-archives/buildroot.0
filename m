Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ED51C021B1
	for <buildroot@archiver.kernel.org>; Thu, 20 Feb 2025 19:17:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EF6726075E;
	Thu, 20 Feb 2025 19:17:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XvSffNrqrnQT; Thu, 20 Feb 2025 19:17:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EEA4A607A0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EEA4A607A0;
	Thu, 20 Feb 2025 19:17:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8EC71F2D
 for <buildroot@buildroot.org>; Thu, 20 Feb 2025 19:17:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7E70E406F2
 for <buildroot@buildroot.org>; Thu, 20 Feb 2025 19:17:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bMnQOarL1F-U for <buildroot@buildroot.org>;
 Thu, 20 Feb 2025 19:17:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 91434406E3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 91434406E3
 for <buildroot@buildroot.org>; Thu, 20 Feb 2025 19:17:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8A6098793D; Thu, 20 Feb 2025 19:17:24 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 20 Feb 2025 20:15:44 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9f7fb952866fe855bcc7a614cdc5f5f6d18f51d7
X-Git-Newrev: 882d0129caf3db622d4a13dd65003662d4addefa
X-Patchwork-Hint: ignore
Message-Id: <20250220191724.8A6098793D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/docker/apt-sources.list: move to
 20250218 snapshot
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

commit: https://git.buildroot.net/buildroot/commit/?id=882d0129caf3db622d4a13dd65003662d4addefa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

With the TARGETPLATFORM fix we need to rebuild the container so move to the
latest snapshot to get updated (security) fixes.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/docker/apt-sources.list | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/support/docker/apt-sources.list b/support/docker/apt-sources.list
index ddbe15eed8..d6fbf85270 100644
--- a/support/docker/apt-sources.list
+++ b/support/docker/apt-sources.list
@@ -1,4 +1,4 @@
-# Latest just before 20250205151400Z:
-deb [check-valid-until=no] http://snapshot.debian.org/archive/debian/20250205T145632Z/ bookworm main
-deb [check-valid-until=no] http://snapshot.debian.org/archive/debian-security/20250205T145632Z/ bookworm-security main
-deb [check-valid-until=no] http://snapshot.debian.org/archive/debian/20250205T145632Z/ bookworm-updates main
+# Latest just before 20250218211000Z:
+deb [check-valid-until=no] http://snapshot.debian.org/archive/debian/20250218T144938Z/ bookworm main
+deb [check-valid-until=no] http://snapshot.debian.org/archive/debian-security/20250218T144938Z/ bookworm-security main
+deb [check-valid-until=no] http://snapshot.debian.org/archive/debian/20250218T144938Z/ bookworm-updates main
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

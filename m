Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 528C9CF2568
	for <buildroot@archiver.kernel.org>; Sat, 12 Oct 2024 15:04:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2017E61114;
	Sat, 12 Oct 2024 15:04:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tLQoRZFqh5dt; Sat, 12 Oct 2024 15:04:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C795C606CE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C795C606CE;
	Sat, 12 Oct 2024 15:04:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 265AC1BF47E
 for <buildroot@lists.busybox.net>; Sat, 12 Oct 2024 15:03:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4ED9881EFB
 for <buildroot@lists.busybox.net>; Sat, 12 Oct 2024 15:02:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Hvb0EwzNMIi7 for <buildroot@lists.busybox.net>;
 Sat, 12 Oct 2024 15:02:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 385BD80EEE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 385BD80EEE
 for <buildroot@buildroot.org>; Sat, 12 Oct 2024 15:02:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 333ED85E1E; Sat, 12 Oct 2024 15:02:53 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 12 Oct 2024 17:00:13 +0200
X-Git-Refname: refs/heads/2024.08.x
X-Git-Oldrev: 70f8b08042a505fd767a26a4c16afa5b504277b1
X-Git-Newrev: 972e56bdafeff0770ccf7d5a25417863d40afdce
X-Patchwork-Hint: ignore
Message-Id: <20241012150253.333ED85E1E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.08.x] package/sqlite: fix
 'access' typo in help text
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

commit: https://git.buildroot.net/buildroot/commit/?id=972e56bdafeff0770ccf7d5a25417863d40afdce
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.08.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
(cherry picked from commit 930663032b94bf5a26ca5e0efc582b9ab57cc677)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/sqlite/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/sqlite/Config.in b/package/sqlite/Config.in
index 0ae9878d7b..ce1e369b20 100644
--- a/package/sqlite/Config.in
+++ b/package/sqlite/Config.in
@@ -20,7 +20,7 @@ config BR2_PACKAGE_SQLITE_ENABLE_COLUMN_METADATA
 	bool "Enable convenient access to meta-data about tables and queries"
 	help
 	  When this option is defined there are some additional APIs
-	  enabled to acces meta-data about tables and queries (see
+	  enabled to access meta-data about tables and queries (see
 	  https://sqlite.org/compile.html).
 
 config BR2_PACKAGE_SQLITE_ENABLE_FTS3
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

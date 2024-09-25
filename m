Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 385BDCCF9EB
	for <buildroot@archiver.kernel.org>; Wed, 25 Sep 2024 18:55:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F3073611EA;
	Wed, 25 Sep 2024 18:55:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6SMvU22YVil9; Wed, 25 Sep 2024 18:55:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B337461412
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B337461412;
	Wed, 25 Sep 2024 18:55:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 864A11BF408
 for <buildroot@lists.busybox.net>; Wed, 25 Sep 2024 18:55:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7B76F84ACC
 for <buildroot@lists.busybox.net>; Wed, 25 Sep 2024 18:54:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Jk1ojdDYrmCb for <buildroot@lists.busybox.net>;
 Wed, 25 Sep 2024 18:54:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 47A7884AD2
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 47A7884AD2
 for <buildroot@buildroot.org>; Wed, 25 Sep 2024 18:54:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 40D95838DB; Wed, 25 Sep 2024 18:54:57 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 25 Sep 2024 20:45:38 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5af5c0ac0b6057d1c4fe1dc6c6ec208c4fea8a10
X-Git-Newrev: 930663032b94bf5a26ca5e0efc582b9ab57cc677
X-Patchwork-Hint: ignore
Message-Id: <20240925185457.40D95838DB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/sqlite: fix 'access' typo in help
 text
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=930663032b94bf5a26ca5e0efc582b9ab57cc677
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
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

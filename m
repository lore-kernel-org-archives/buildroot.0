Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9E27C3DA7A
	for <buildroot@archiver.kernel.org>; Mon,  2 Jan 2023 13:40:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8E58760A65;
	Mon,  2 Jan 2023 13:40:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8E58760A65
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0TJ1m57qKGxD; Mon,  2 Jan 2023 13:39:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D7F23606DC;
	Mon,  2 Jan 2023 13:39:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D7F23606DC
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2B6271BF3B5
 for <buildroot@lists.busybox.net>; Mon,  2 Jan 2023 13:39:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 06461813D7
 for <buildroot@lists.busybox.net>; Mon,  2 Jan 2023 13:39:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 06461813D7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 26cn4qQYHWEI for <buildroot@lists.busybox.net>;
 Mon,  2 Jan 2023 13:39:56 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3C899813C5
 for <buildroot@buildroot.org>; Mon,  2 Jan 2023 13:39:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3C899813C5
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 29C21870D2; Mon,  2 Jan 2023 13:39:56 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 2 Jan 2023 14:33:12 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: a0bdbf46e04ae08cf4954b310eaa624bae66a36b
X-Git-Newrev: 67f40f52f75c323fb76ef94a2f6d80508b007caf
X-Patchwork-Hint: ignore
Message-Id: <20230102133956.29C21870D2@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/lua-cqueues:
 force using libopenssl
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

commit: https://git.buildroot.net/buildroot/commit/?id=67f40f52f75c323fb76ef94a2f6d80508b007caf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

As building lua-cqueues fails to build with libressl, we force the use
of libopenssl instead.

Fixes:

  http://autobuild.buildroot.net/results/032d6c9bf84b0d4e50d3c27f37b71c0564c52312/

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 620a77dc9d93365d87c7b18545f091c8e962509e)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/lua-cqueues/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/lua-cqueues/Config.in b/package/lua-cqueues/Config.in
index 60f022848b..a8c38950cf 100644
--- a/package/lua-cqueues/Config.in
+++ b/package/lua-cqueues/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_LUA_CQUEUES
 	bool "lua-cqueues"
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL
 	help
 	  Continuation Queues: Embeddable asynchronous networking,
 	  threading, and notification framework for Lua on Unix.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

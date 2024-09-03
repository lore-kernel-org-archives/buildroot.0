Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF303CD3440
	for <buildroot@archiver.kernel.org>; Tue,  3 Sep 2024 21:14:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 28B61402B5;
	Tue,  3 Sep 2024 21:14:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Fv8OA4vHoZRL; Tue,  3 Sep 2024 21:14:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DA4C1402CD
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DA4C1402CD;
	Tue,  3 Sep 2024 21:14:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2626A1BF48B
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 21:14:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 21A7B80A00
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 21:14:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hoBn_8qTVVza for <buildroot@lists.busybox.net>;
 Tue,  3 Sep 2024 21:14:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 526A380967
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 526A380967
 for <buildroot@buildroot.org>; Tue,  3 Sep 2024 21:14:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4B08686D35; Tue,  3 Sep 2024 21:14:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 3 Sep 2024 23:14:10 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 1a7980f0250f5857c8bf0cd6fc85a276372e1206
X-Git-Newrev: fe2b0ad4595db98babd0f513b6dfa7a879bbe684
X-Patchwork-Hint: ignore
Message-Id: <20240903211449.4B08686D35@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/runc: needs CGO
 linking for host
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

commit: https://git.buildroot.net/buildroot/commit/?id=fe2b0ad4595db98babd0f513b6dfa7a879bbe684
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The target variant depends on CGO linking, so propagate it to the host
variant as well.

Fixes: http://autobuild.buildroot.org/results/30b/30b81b6f84613296b9e1f162e5ddd7f25b89ba23/

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Cc: Christian Stewart <christian@aperture.us>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/runc/Config.in.host | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/runc/Config.in.host b/package/runc/Config.in.host
index 78193cb499..96b05d0a1f 100644
--- a/package/runc/Config.in.host
+++ b/package/runc/Config.in.host
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_HOST_RUNC
 	bool "host runc"
 	depends on BR2_PACKAGE_HOST_GO_HOST_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_HOST_GO_HOST_CGO_LINKING_SUPPORTS
 	select BR2_PACKAGE_HOST_GO
 	help
 	  runC is a CLI tool for spawning and running containers
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

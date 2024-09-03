Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F4DEE6FE46
	for <buildroot@archiver.kernel.org>; Fri,  6 Sep 2024 20:09:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2474984D50;
	Fri,  6 Sep 2024 20:09:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N2uDWNBd8cFj; Fri,  6 Sep 2024 20:09:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C2E9284D55
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C2E9284D55;
	Fri,  6 Sep 2024 20:09:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 12EDF1BF37F
 for <buildroot@lists.busybox.net>; Fri,  6 Sep 2024 20:00:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5343F61108
 for <buildroot@lists.busybox.net>; Fri,  6 Sep 2024 19:59:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L9P2EWU7WZLz for <buildroot@lists.busybox.net>;
 Fri,  6 Sep 2024 19:59:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5A1A36078C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5A1A36078C
 for <buildroot@buildroot.org>; Fri,  6 Sep 2024 19:58:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 54A6D86C5A; Fri,  6 Sep 2024 19:58:59 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 3 Sep 2024 23:13:20 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 379019e891d6d536ac5a8cc37934dd901ffc948f
X-Git-Newrev: 2c222c29689d3abaee00c1a0a4faefb0306a4c61
X-Patchwork-Hint: ignore
Message-Id: <20240906195859.54A6D86C5A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/skopeo: add missing dependency on
 host go arch support
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

commit: https://git.buildroot.net/buildroot/commit/?id=2c222c29689d3abaee00c1a0a4faefb0306a4c61
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

 commit 619b83a4438667cdb4cc8a7dddc79dbf6d84ec2a
 http://autobuild.buildroot.org/results/d1c41157ddace09399a3fc101026ae451c6a918a/

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

(cherry-picked from 535116dd022c462fd95282ce8524a6feb1e7749c)
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/skopeo/Config.in.host | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/skopeo/Config.in.host b/package/skopeo/Config.in.host
index 4a63a0829c..b3a1c155f7 100644
--- a/package/skopeo/Config.in.host
+++ b/package/skopeo/Config.in.host
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_HOST_SKOPEO
 	bool "host skopeo"
+	depends on BR2_PACKAGE_HOST_GO_HOST_ARCH_SUPPORTS
 	help
 	  skopeo is a command line utility that performs various
 	  operations on container images and image repositories.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8969C3DA42
	for <buildroot@archiver.kernel.org>; Sat, 13 Jul 2024 11:30:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7610E400DD;
	Sat, 13 Jul 2024 11:30:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bLyeJVvk6vn4; Sat, 13 Jul 2024 11:30:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4806A4018D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4806A4018D;
	Sat, 13 Jul 2024 11:30:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2CC461BF4E4
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 11:30:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 17F8C84569
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 11:30:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HiBWi8VCo_wk for <buildroot@lists.busybox.net>;
 Sat, 13 Jul 2024 11:30:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 43A5083FC5
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 43A5083FC5
 for <buildroot@buildroot.org>; Sat, 13 Jul 2024 11:30:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3E78485FCC; Sat, 13 Jul 2024 11:30:33 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 13 Jul 2024 13:11:47 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 2e34d5638de988816c037ff09ce88c986a871331
X-Git-Newrev: e01bb070d95f00915f00f2b1d2ff61b9283a6cea
X-Patchwork-Hint: ignore
Message-Id: <20240713113033.3E78485FCC@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/xfsprogs: update
 Kconfig package homepage URL
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

commit: https://git.buildroot.net/buildroot/commit/?id=e01bb070d95f00915f00f2b1d2ff61b9283a6cea
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

The old xfs homepage URL [1] seems defunct at the time of this commit.
The http URL redirects to https, the certificate expired on
2024-01-26. If the certificate expiration date is ignored, the site
shows a "502 Bad Gateway" error.

The package README [2] advertise the homepage as [3].

This commit updates the URL to the new one.

[1] http://xfs.org
[2] https://git.kernel.org/pub/scm/fs/xfs/xfsprogs-dev.git/tree/README?h=v6.4.0#n12
[3] https://xfs.wiki.kernel.org

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit daa5d775d729efd529ff7ff8c58c0380018f1e42)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/xfsprogs/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/xfsprogs/Config.in b/package/xfsprogs/Config.in
index d14c3d4698..1a29579d8b 100644
--- a/package/xfsprogs/Config.in
+++ b/package/xfsprogs/Config.in
@@ -18,4 +18,4 @@ config BR2_PACKAGE_XFSPROGS
 	help
 	  The XFS file system utilities and libraries
 
-	  http://xfs.org
+	  https://xfs.wiki.kernel.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

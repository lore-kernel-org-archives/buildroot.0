Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E6C7C27C4F
	for <buildroot@archiver.kernel.org>; Sat, 15 Jun 2024 19:04:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E78FD40A6C;
	Sat, 15 Jun 2024 19:04:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NaiebNhgHwOp; Sat, 15 Jun 2024 19:04:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D00884094B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D00884094B;
	Sat, 15 Jun 2024 19:04:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1529A1BF2FC
 for <buildroot@lists.busybox.net>; Sat, 15 Jun 2024 19:04:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 71DDC405FD
 for <buildroot@lists.busybox.net>; Sat, 15 Jun 2024 19:04:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E68V9IXnTBf6 for <buildroot@lists.busybox.net>;
 Sat, 15 Jun 2024 19:04:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3E30640609
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3E30640609
 for <buildroot@buildroot.org>; Sat, 15 Jun 2024 19:04:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AA9D987F18; Sat, 15 Jun 2024 19:04:15 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 15 Jun 2024 20:29:14 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 892de65e7d71c5f12d84fe8bf3ee296c75210d81
X-Git-Newrev: 35fe226f79e7a1c86822db4faf98115c5acd0a43
X-Patchwork-Hint: ignore
Message-Id: <20240615190415.AA9D987F18@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/pkg-download:
 export TAR for download backends
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

commit: https://git.buildroot.net/buildroot/commit/?id=35fe226f79e7a1c86822db4faf98115c5acd0a43
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Later commits will start using this variable.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
[Arnout: quote TAR="..."]
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
(cherry picked from commit ce6b48c2cf2811b769b03bb2d010d93537b2c176)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pkg-download.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/pkg-download.mk b/package/pkg-download.mk
index 677d3608f5..7760a21bc3 100644
--- a/package/pkg-download.mk
+++ b/package/pkg-download.mk
@@ -107,7 +107,9 @@ endif
 
 define DOWNLOAD
 	$(Q)mkdir -p $($(2)_DL_DIR)
-	$(Q)$(EXTRA_ENV) $($(2)_DL_ENV) \
+	$(Q)$(EXTRA_ENV) \
+	$($(2)_DL_ENV) \
+	TAR="$(TAR)" \
 	BR_NO_CHECK_HASH_FOR="$(if $(BR2_DOWNLOAD_FORCE_CHECK_HASHES),,$(BR_NO_CHECK_HASH_FOR))" \
 		flock $($(2)_DL_DIR)/.lock $(DL_WRAPPER) \
 		-c '$($(2)_DL_VERSION)' \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

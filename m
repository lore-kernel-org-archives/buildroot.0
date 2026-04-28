Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9520FF886D
	for <buildroot@archiver.kernel.org>; Tue, 28 Apr 2026 18:37:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 97DBC83122;
	Tue, 28 Apr 2026 18:37:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qYUY1JSgtXrN; Tue, 28 Apr 2026 18:37:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BD10683DA5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777401448;
	bh=HiDbVyHP5yaMSANH7W2k8tF9paU1tJ8vPslzRd6rghM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=qgP6H8s0UvWm8rS0jMBvPZ+2Eg0dhJ2faxnytFoli+0JmmMvMR5g9LY9sDSzdijML
	 gsUE6AiQWuS+6ue0IQd6dbR3IhgIIFGTvBYbjQgoWccpGG1E4h0lhUC+76lHU7DFKE
	 gGCfum+jx30RVSsKTUpxT3zOWndFbXOJNbxtLvGWObwzJn/ViQ8oJQyTU5RwWeMztx
	 U4DJd2+9zEsdjxh2LUKZkvaNzDjDw4tkQnno8+yG2FtP/k5hYSDekkKvcn8x3Ob1vS
	 HFXfsSAefk/InZ7/sH3g++edAdvefwuE6kVDheXksO+zF3N7YV14ILxHbnYsC7XbAM
	 a5MT5ISRTI7ZA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BD10683DA5;
	Tue, 28 Apr 2026 18:37:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8C3C6231
 for <buildroot@buildroot.org>; Tue, 28 Apr 2026 18:37:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7267640E7D
 for <buildroot@buildroot.org>; Tue, 28 Apr 2026 18:37:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PhRhMzyrtpV8 for <buildroot@buildroot.org>;
 Tue, 28 Apr 2026 18:37:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 923B540E7F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 923B540E7F
 for <buildroot@buildroot.org>; Tue, 28 Apr 2026 18:37:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 430388391B; Tue, 28 Apr 2026 18:37:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 28 Apr 2026 20:35:23 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1be89eb5939d041f912eaa7861aee9a1ce268c6e
X-Git-Newrev: 573f34323207227ebdc660b5a87f404027bb5ea1
X-Patchwork-Hint: ignore
Message-Id: <20260428183726.430388391B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/kodi-pvr-mythtv: bump version to
 21.3.6
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/573f34323207227ebdc660b5a87f404027bb5ea1
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/janbar/pvr.mythtv/blob/21.3.6-Omega/pvr.mythtv/changelog.txt

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/kodi-pvr-mythtv/kodi-pvr-mythtv.hash | 2 +-
 package/kodi-pvr-mythtv/kodi-pvr-mythtv.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-pvr-mythtv/kodi-pvr-mythtv.hash b/package/kodi-pvr-mythtv/kodi-pvr-mythtv.hash
index 004ad86448..4e170fc10f 100644
--- a/package/kodi-pvr-mythtv/kodi-pvr-mythtv.hash
+++ b/package/kodi-pvr-mythtv/kodi-pvr-mythtv.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  37e7ffd44707d135fd5512d560fce34ad02880410142df1b3b607a834634bc99  kodi-pvr-mythtv-21.3.5-Omega.tar.gz
+sha256  3ca903e325edd82d86ece135f2d669562c7bbeb9399c6605c91e920c32975512  kodi-pvr-mythtv-21.3.6-Omega.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-pvr-mythtv/kodi-pvr-mythtv.mk b/package/kodi-pvr-mythtv/kodi-pvr-mythtv.mk
index 063b39f582..a37328fedf 100644
--- a/package/kodi-pvr-mythtv/kodi-pvr-mythtv.mk
+++ b/package/kodi-pvr-mythtv/kodi-pvr-mythtv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_MYTHTV_VERSION = 21.3.5-Omega
+KODI_PVR_MYTHTV_VERSION = 21.3.6-Omega
 KODI_PVR_MYTHTV_SITE = $(call github,janbar,pvr.mythtv,$(KODI_PVR_MYTHTV_VERSION))
 KODI_PVR_MYTHTV_LICENSE = GPL-2.0+
 KODI_PVR_MYTHTV_LICENSE_FILES = LICENSE.md
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

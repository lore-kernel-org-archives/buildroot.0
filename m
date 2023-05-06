Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AEFAC77B73
	for <buildroot@archiver.kernel.org>; Sat,  6 May 2023 16:11:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0AE5C42058;
	Sat,  6 May 2023 16:11:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0AE5C42058
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id znhpJNKGGXko; Sat,  6 May 2023 16:11:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C92EF41F79;
	Sat,  6 May 2023 16:11:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C92EF41F79
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AC09C1BF36A
 for <buildroot@lists.busybox.net>; Sat,  6 May 2023 16:09:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7AB94417B2
 for <buildroot@lists.busybox.net>; Sat,  6 May 2023 16:09:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7AB94417B2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uLNtkllxpm2y for <buildroot@lists.busybox.net>;
 Sat,  6 May 2023 16:09:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7BEBB417D5
 for <buildroot@buildroot.org>; Sat,  6 May 2023 16:09:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7BEBB417D5
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6C1D485EC9; Sat,  6 May 2023 16:09:24 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 6 May 2023 18:02:10 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f292d9b736ad396f6013566da9c1d8273f421e47
X-Git-Newrev: bf9a5c397c1c952fc8b5cd75cf4d651c746759fb
X-Patchwork-Hint: ignore
Message-Id: <20230506160924.6C1D485EC9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mbpfan: bump version to v2.4.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=bf9a5c397c1c952fc8b5cd75cf4d651c746759fb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Add support for alternate SMC path used with newer MacBooks
 - Improved systemd integration
 - Removed developer tests which confused users

https://github.com/linux-on-mac/mbpfan/releases/tag/v2.4.0

Signed-off-by: Christian Stewart <christian@aperture.us>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/mbpfan/mbpfan.hash | 2 +-
 package/mbpfan/mbpfan.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mbpfan/mbpfan.hash b/package/mbpfan/mbpfan.hash
index 9195692d52..5b67744a00 100644
--- a/package/mbpfan/mbpfan.hash
+++ b/package/mbpfan/mbpfan.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  f690e9302da4cf97e582606614d91e1ee4ac495a4939aec7c0b3468c8988eb67  mbpfan-2.3.0.tar.gz
+sha256  e1cdcffaba52be215ae40a8568949190866d500d6ae2a1e96b71ab5372f3580b  mbpfan-2.4.0.tar.gz
 sha256  589ed823e9a84c56feb95ac58e7cf384626b9cbf4fda2a907bc36e103de1bad2  COPYING
diff --git a/package/mbpfan/mbpfan.mk b/package/mbpfan/mbpfan.mk
index 52d823cbdc..0ac161b327 100644
--- a/package/mbpfan/mbpfan.mk
+++ b/package/mbpfan/mbpfan.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MBPFAN_VERSION = 2.3.0
+MBPFAN_VERSION = 2.4.0
 MBPFAN_SITE = $(call github,linux-on-mac,mbpfan,v$(MBPFAN_VERSION))
 MBPFAN_LICENSE = GPL-3.0+
 MBPFAN_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

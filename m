Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55D4BC83030
	for <buildroot@archiver.kernel.org>; Mon,  7 Jul 2025 21:07:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0382E840BC;
	Mon,  7 Jul 2025 21:07:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0PUw-RJNPTju; Mon,  7 Jul 2025 21:07:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3958B840BA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3958B840BA;
	Mon,  7 Jul 2025 21:07:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id C0BB715F
 for <buildroot@buildroot.org>; Mon,  7 Jul 2025 21:07:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A647C4054B
 for <buildroot@buildroot.org>; Mon,  7 Jul 2025 21:07:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f6cZnS6W5Iel for <buildroot@buildroot.org>;
 Mon,  7 Jul 2025 21:07:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EEA1E403B4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id EEA1E403B4
 for <buildroot@buildroot.org>; Mon,  7 Jul 2025 21:07:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D8D8A86173; Mon,  7 Jul 2025 21:07:16 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 7 Jul 2025 22:35:51 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f66e4c2568c5867b3f92f2c78609fafa0252194e
X-Git-Newrev: fd6e64ad549414636909690d5a19d8f40e03bd43
X-Patchwork-Hint: ignore
Message-Id: <20250707210716.D8D8A86173@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/genimage: bump version to 19
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

commit: https://git.buildroot.net/buildroot/commit/?id=fd6e64ad549414636909690d5a19d8f40e03bd43
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This adds support for btrfs partition images, among other things. The
COPYING file changed because FSF postal address has been replaced with
URL [1].

Upstream changelog: https://github.com/pengutronix/genimage/releases/tag/v19

[1] https://github.com/pengutronix/genimage/commit/0909434ea5e3e927b4dd512d7e03ea919da12f8d

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/genimage/genimage.hash | 5 +++--
 package/genimage/genimage.mk   | 2 +-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/genimage/genimage.hash b/package/genimage/genimage.hash
index 232ba6ef66..5c55467737 100644
--- a/package/genimage/genimage.hash
+++ b/package/genimage/genimage.hash
@@ -1,3 +1,4 @@
+# From https://github.com/pengutronix/genimage/releases/tag/v19
+sha256  7ec4fcb865662a8b2ff20284819044ffa84137bf3ca16fb749701291bc01f108  genimage-19.tar.xz
 # Locally calculated
-sha256  ebc3f886c4d80064dd6c6d5e3c2e98e5a670078264108ce2f89ada8a2e13fedd  genimage-18.tar.xz
-sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
+sha256  edaef632cbb643e4e7a221717a6c441a4c1a7c918e6e4d56debc3d8739b233f6  COPYING
diff --git a/package/genimage/genimage.mk b/package/genimage/genimage.mk
index b8ce7ff3c9..5fa34d8eb9 100644
--- a/package/genimage/genimage.mk
+++ b/package/genimage/genimage.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GENIMAGE_VERSION = 18
+GENIMAGE_VERSION = 19
 GENIMAGE_SOURCE = genimage-$(GENIMAGE_VERSION).tar.xz
 GENIMAGE_SITE = https://github.com/pengutronix/genimage/releases/download/v$(GENIMAGE_VERSION)
 HOST_GENIMAGE_DEPENDENCIES = host-pkgconf host-libconfuse
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7645AC47074
	for <buildroot@archiver.kernel.org>; Sun,  7 Jan 2024 16:03:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1B13540363;
	Sun,  7 Jan 2024 16:03:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1B13540363
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3dOyJsqS5eQD; Sun,  7 Jan 2024 16:03:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2444940364;
	Sun,  7 Jan 2024 16:03:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2444940364
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 03A511BF869
 for <buildroot@lists.busybox.net>; Sun,  7 Jan 2024 16:02:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DA56560B2D
 for <buildroot@lists.busybox.net>; Sun,  7 Jan 2024 16:02:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DA56560B2D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cDZFbXYSg-kX for <buildroot@lists.busybox.net>;
 Sun,  7 Jan 2024 16:02:57 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 29C7660B29
 for <buildroot@buildroot.org>; Sun,  7 Jan 2024 16:02:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 29C7660B29
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 15FBE8470B; Sun,  7 Jan 2024 16:02:57 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 7 Jan 2024 17:02:07 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 558a25994b3ccab9b308bb667e464bdff0ab0d61
X-Git-Newrev: c740676c51de9ee66e32cb41bfeed5e6a446ceed
X-Patchwork-Hint: ignore
Message-Id: <20240107160257.15FBE8470B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/musepack: use version friendly to
 release-monitoring
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

commit: https://git.buildroot.net/buildroot/commit/?id=c740676c51de9ee66e32cb41bfeed5e6a446ceed
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update MUSEPACK_VERSION to match what is returned by
https://release-monitoring.org/project/21865

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/musepack/musepack.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/musepack/musepack.mk b/package/musepack/musepack.mk
index d4dd08df36..02fe53d47d 100644
--- a/package/musepack/musepack.mk
+++ b/package/musepack/musepack.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-MUSEPACK_VERSION = r475
+MUSEPACK_VERSION = 475
 MUSEPACK_SITE = http://files.musepack.net/source
-MUSEPACK_SOURCE = musepack_src_$(MUSEPACK_VERSION).tar.gz
+MUSEPACK_SOURCE = musepack_src_r$(MUSEPACK_VERSION).tar.gz
 MUSEPACK_DEPENDENCIES = libcuefile libreplaygain
 MUSEPACK_INSTALL_STAGING = YES
 MUSEPACK_BUILD_OPTS = -j1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

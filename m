Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BBDCC4706C
	for <buildroot@archiver.kernel.org>; Sat, 13 Jan 2024 13:34:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CE78340967;
	Sat, 13 Jan 2024 13:34:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CE78340967
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5qg7wUtxp0NN; Sat, 13 Jan 2024 13:34:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0B84E40970;
	Sat, 13 Jan 2024 13:34:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0B84E40970
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E89AC1BF867
 for <buildroot@lists.busybox.net>; Sat, 13 Jan 2024 13:34:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BA89360D5F
 for <buildroot@lists.busybox.net>; Sat, 13 Jan 2024 13:34:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BA89360D5F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gSX7-akguKlG for <buildroot@lists.busybox.net>;
 Sat, 13 Jan 2024 13:34:12 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1096D60C10
 for <buildroot@buildroot.org>; Sat, 13 Jan 2024 13:34:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1096D60C10
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F3B3685E78; Sat, 13 Jan 2024 13:34:11 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 13 Jan 2024 11:58:08 +0100
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: feef0edb3bcfa9da2cc39b7e762d754583222c6e
X-Git-Newrev: 80fddff9aa2171aaf33ab82615090cbcd13ddc14
X-Patchwork-Hint: ignore
Message-Id: <20240113133411.F3B3685E78@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/musepack: use
 version friendly to release-monitoring
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

commit: https://git.buildroot.net/buildroot/commit/?id=80fddff9aa2171aaf33ab82615090cbcd13ddc14
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

Update MUSEPACK_VERSION to match what is returned by
https://release-monitoring.org/project/21865

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit c740676c51de9ee66e32cb41bfeed5e6a446ceed)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/musepack/musepack.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/musepack/musepack.mk b/package/musepack/musepack.mk
index fc66c684a5..e25ac6df1d 100644
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
 MUSEPACK_MAKE = $(MAKE1)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

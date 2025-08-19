Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D3D7CA0EE6
	for <buildroot@archiver.kernel.org>; Tue, 19 Aug 2025 15:37:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4CF5480799;
	Tue, 19 Aug 2025 15:37:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wyraGcy0kLKm; Tue, 19 Aug 2025 15:37:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 492CE807A9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 492CE807A9;
	Tue, 19 Aug 2025 15:37:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id EFF18E0A
 for <buildroot@buildroot.org>; Tue, 19 Aug 2025 15:37:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E1705403DC
 for <buildroot@buildroot.org>; Tue, 19 Aug 2025 15:37:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C8qVDxDD_Jxp for <buildroot@buildroot.org>;
 Tue, 19 Aug 2025 15:37:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1390640BCA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1390640BCA
 for <buildroot@buildroot.org>; Tue, 19 Aug 2025 15:37:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F3A93876EA; Tue, 19 Aug 2025 15:37:33 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 19 Aug 2025 17:19:14 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 022ff55a39cad5d103b3bf29f887c37ec0b2f0f9
X-Git-Newrev: fe94b611fde271d40c299365a4966a3dbf71cdcc
X-Patchwork-Hint: ignore
Message-Id: <20250819153733.F3A93876EA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ed: bump to version 1.22.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=fe94b611fde271d40c299365a4966a3dbf71cdcc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In particular, the 1.21 release fixes C23 compilation issues caused by a
custom bool definition.

Release 1.21 also includes a change of the COPYRIGHT file, but it is
purely cosmetic.

Changelogs since 1.20.2:
1.21:   https://lists.gnu.org/archive/html/bug-ed/2025-01/msg00002.html
1.21.1: https://lists.gnu.org/archive/html/bug-ed/2025-03/msg00006.html
1.22:   https://lists.gnu.org/archive/html/bug-ed/2025-07/msg00008.html
1.22.1: https://lists.gnu.org/archive/html/bug-ed/2025-08/msg00010.html

Fixes: https://autobuild.buildroot.org/results/3d5/3d523440dc7bebe12fd95564e3c5b5e90bc39af9

Signed-off-by: Florian Larysch <fl@n621.de>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/ed/ed.hash | 6 +++---
 package/ed/ed.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/ed/ed.hash b/package/ed/ed.hash
index d1d99309c6..44d5bc7653 100644
--- a/package/ed/ed.hash
+++ b/package/ed/ed.hash
@@ -1,4 +1,4 @@
-# From https://lists.gnu.org/archive/html/bug-ed/2024-04/msg00003.html
-sha256  65fec7318f48c2ca17f334ac0f4703defe62037bb13cc23920de077b5fa24523  ed-1.20.2.tar.lz
+# From https://lists.gnu.org/archive/html/bug-ed/2025-08/msg00010.html
+sha256  1af541116796d6b9e4b66ef9c45ddce0e15a19ed62bfca362ccd7d472cc1c8fb  ed-1.22.1.tar.lz
 # Locally calculated
-sha256  3d77c1a58fbde5ddba612d1fe09965e20a3804953eca12e8c1892298bb8a5eef  COPYING
+sha256  022e9c2e9cc1aac3622313df6f971fbb39c1d1b0cb45324c16b8a1fe231c5ea6  COPYING
diff --git a/package/ed/ed.mk b/package/ed/ed.mk
index 704744359a..10092d513f 100644
--- a/package/ed/ed.mk
+++ b/package/ed/ed.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ED_VERSION = 1.20.2
+ED_VERSION = 1.22.1
 ED_SITE = $(BR2_GNU_MIRROR)/ed
 ED_SOURCE = ed-$(ED_VERSION).tar.lz
 ED_LICENSE = GPL-2.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

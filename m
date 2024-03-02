Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FFF0C5478C
	for <buildroot@archiver.kernel.org>; Sat,  2 Mar 2024 14:32:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1BCE86076D;
	Sat,  2 Mar 2024 14:32:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pH8fy7j-PNfB; Sat,  2 Mar 2024 14:32:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3E41A60796
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3E41A60796;
	Sat,  2 Mar 2024 14:32:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E89481BF5B4
 for <buildroot@lists.busybox.net>; Sat,  2 Mar 2024 14:32:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D6A17418D1
 for <buildroot@lists.busybox.net>; Sat,  2 Mar 2024 14:32:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dRFH3yT1SArY for <buildroot@lists.busybox.net>;
 Sat,  2 Mar 2024 14:32:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CA6B5418D0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id CA6B5418D0
 for <buildroot@buildroot.org>; Sat,  2 Mar 2024 14:32:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8ED3E87B79; Sat,  2 Mar 2024 14:32:46 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 2 Mar 2024 15:32:03 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2bfad952c374258e37ffdf46a2c450d860640e11
X-Git-Newrev: 86e244b1a5695a570d00755beeaae068dcb30c2d
X-Patchwork-Hint: ignore
Message-Id: <20240302143246.8ED3E87B79@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rauc: bump to 1.11.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=86e244b1a5695a570d00755beeaae068dcb30c2d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This fixes an incompatibility with openssl 3.2 when using codesign
certificate purpose [1].

[1] https://github.com/rauc/rauc/releases/tag/v1.11.1

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/rauc/rauc.hash | 2 +-
 package/rauc/rauc.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rauc/rauc.hash b/package/rauc/rauc.hash
index 8de309f8c7..63aa4715e0 100644
--- a/package/rauc/rauc.hash
+++ b/package/rauc/rauc.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  a28f415c580390dd9e65016a5d90a63ee1cfd7e1b3e864cbb13cb3ac3513391f  rauc-1.11.tar.xz
+sha256  391d13d709abb630c459e79e62e474e68224c5d07c816355784bba75a86a2507  rauc-1.11.1.tar.xz
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/rauc/rauc.mk b/package/rauc/rauc.mk
index aff5ead281..fbdea4e235 100644
--- a/package/rauc/rauc.mk
+++ b/package/rauc/rauc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RAUC_VERSION = 1.11
+RAUC_VERSION = 1.11.1
 RAUC_SITE = https://github.com/rauc/rauc/releases/download/v$(RAUC_VERSION)
 RAUC_SOURCE = rauc-$(RAUC_VERSION).tar.xz
 RAUC_LICENSE = LGPL-2.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

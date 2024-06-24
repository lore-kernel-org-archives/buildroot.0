Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00144C2BD09
	for <buildroot@archiver.kernel.org>; Mon, 24 Jun 2024 13:53:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 92B4A81E52;
	Mon, 24 Jun 2024 13:53:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1K2j1K8UBFjP; Mon, 24 Jun 2024 13:53:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 66119818C4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 66119818C4;
	Mon, 24 Jun 2024 13:53:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8B1661BF479
 for <buildroot@lists.busybox.net>; Mon, 24 Jun 2024 13:53:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 84165404CC
 for <buildroot@lists.busybox.net>; Mon, 24 Jun 2024 13:53:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IRZ9VOZSl6SE for <buildroot@lists.busybox.net>;
 Mon, 24 Jun 2024 13:53:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5FFFF404D1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5FFFF404D1
 for <buildroot@buildroot.org>; Mon, 24 Jun 2024 13:53:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 497D482B2E; Mon, 24 Jun 2024 13:53:04 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 24 Jun 2024 13:55:06 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 60fc945734ddc5b1caafea8f148cd89649a36f31
X-Git-Newrev: 40240ac30afc4c6af765794f38e6815162ca61fa
X-Patchwork-Hint: ignore
Message-Id: <20240624135304.497D482B2E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/xz: bump version to 5.4.7
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

commit: https://git.buildroot.net/buildroot/commit/?id=40240ac30afc4c6af765794f38e6815162ca61fa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- add key hint for download signature check
- update COPYING hash due to [1] (change of home page URL)

For details see [2].

This version was released after the backdoor, but never included the
backdoor code (it's from the older stable branch).

[1] https://github.com/tukaani-project/xz/commit/c5c091332c6953a0ce940cb355ea9e99491429fc

[2] https://github.com/tukaani-project/xz/releases/tag/v5.4.7

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/xz/xz.hash | 8 +++++---
 package/xz/xz.mk   | 2 +-
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/xz/xz.hash b/package/xz/xz.hash
index e8025a8065..ff070f6775 100644
--- a/package/xz/xz.hash
+++ b/package/xz/xz.hash
@@ -1,9 +1,11 @@
 # Locally calculated after checking pgp signature
-# https://github.com/tukaani-project/xz/releases/download/v5.4.6/xz-5.4.6.tar.bz2.sig
-sha256  913851b274e8e1d31781ec949f1c23e8dbcf0ecf6e73a2436dc21769dd3e6f49  xz-5.4.6.tar.bz2
+# https://github.com/tukaani-project/xz/releases/download/v5.4.7/xz-5.4.7.tar.bz2.sig
+# using key 3690C240CE51B4670D30AD1C38EE757D69184620 Lasse Collin <lasse.collin@tukaani.org>
+
+sha256  9976ed9cd0764e962d852d7d519ee1c3a7f87aca3b86e5d021a45650ba3ecb41  xz-5.4.7.tar.bz2
 
 # Hash for license files
-sha256  29a1e305b2e34eefe5d4602d00cde1d528b71c5d9f2eec5106972cf6ddb6f73f  COPYING
+sha256  72d7ef9c98be319fd34ce88b45203b36d5936f9c49e82bf3198ffee5e0c7d87e  COPYING
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING.GPLv2
 sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  COPYING.GPLv3
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LGPLv2.1
diff --git a/package/xz/xz.mk b/package/xz/xz.mk
index 40fa59ca7c..d5dceb0eae 100644
--- a/package/xz/xz.mk
+++ b/package/xz/xz.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XZ_VERSION = 5.4.6
+XZ_VERSION = 5.4.7
 XZ_SOURCE = xz-$(XZ_VERSION).tar.bz2
 XZ_SITE = https://github.com/tukaani-project/xz/releases/download/v$(XZ_VERSION)
 XZ_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26152C433EF
	for <buildroot@archiver.kernel.org>; Mon, 14 Mar 2022 13:21:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CD1318410C;
	Mon, 14 Mar 2022 13:21:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fuq70lDZ1lKc; Mon, 14 Mar 2022 13:21:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B9C5D83F25;
	Mon, 14 Mar 2022 13:21:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8DB321BF989
 for <buildroot@lists.busybox.net>; Mon, 14 Mar 2022 13:21:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 88B5F402C3
 for <buildroot@lists.busybox.net>; Mon, 14 Mar 2022 13:21:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id v0GMdR2_GK3G for <buildroot@lists.busybox.net>;
 Mon, 14 Mar 2022 13:21:14 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id AB9C340169
 for <buildroot@buildroot.org>; Mon, 14 Mar 2022 13:21:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id C302183E68; Mon, 14 Mar 2022 13:12:35 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 14 Mar 2022 14:19:41 +0100
X-Git-Refname: refs/heads/2021.11.x
X-Git-Oldrev: 845c2d2669a9af79b56b7bb538819d96c70bbeed
X-Git-Newrev: 6e5536ce361ffbb7b76b843eb3eaec2e78af84dd
X-Patchwork-Hint: ignore
Message-Id: <20220314131235.C302183E68@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.11.x] package/seatd: security
 bump to version 0.6.4
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

commit: https://git.buildroot.net/buildroot/commit/?id=6e5536ce361ffbb7b76b843eb3eaec2e78af84dd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.11.x

This release contains a security fix in seatd-launch which prevents
removal of files that the calling user did not have privileges to
remove. Release notes:

  https://git.sr.ht/~kennylevinsen/seatd/refs/0.6.4

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 41139cb0997af800c7d89213c5d89652b65ec6cb)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/seatd/seatd.hash | 2 +-
 package/seatd/seatd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/seatd/seatd.hash b/package/seatd/seatd.hash
index 18f65d3aeb..88793b6dd5 100644
--- a/package/seatd/seatd.hash
+++ b/package/seatd/seatd.hash
@@ -1,5 +1,5 @@
 # Calculated locally
-sha256  5226850c163b485aebe71da0d3f4941761637e146a5c9393cb40c52617ad84a8  0.6.3.tar.gz
+sha256  3d4ac288114219ba7721239cafee7bfbeb7cf8e1e7fd653602a369e4ad050bd8  0.6.4.tar.gz
 
 # License files
 sha256  282a494803d666616bd726e0279636b5f6a31387ae19a707459074050f2600d3  LICENSE
diff --git a/package/seatd/seatd.mk b/package/seatd/seatd.mk
index 27d3155b2b..5382cad39b 100644
--- a/package/seatd/seatd.mk
+++ b/package/seatd/seatd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SEATD_VERSION = 0.6.3
+SEATD_VERSION = 0.6.4
 SEATD_SOURCE = $(SEATD_VERSION).tar.gz
 SEATD_SITE = https://git.sr.ht/~kennylevinsen/seatd/archive
 SEATD_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF877CFB43F
	for <buildroot@archiver.kernel.org>; Sun,  6 Oct 2024 14:04:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 72F6760716;
	Sun,  6 Oct 2024 14:04:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RlPD_T4_fGYN; Sun,  6 Oct 2024 14:04:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 65F3160717
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 65F3160717;
	Sun,  6 Oct 2024 14:04:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 669D91BF4DA
 for <buildroot@lists.busybox.net>; Sun,  6 Oct 2024 14:04:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 63010810DE
 for <buildroot@lists.busybox.net>; Sun,  6 Oct 2024 14:04:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X35SiGdVK-pd for <buildroot@lists.busybox.net>;
 Sun,  6 Oct 2024 14:04:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9D459810DD
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9D459810DD
 for <buildroot@buildroot.org>; Sun,  6 Oct 2024 14:04:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8637B85018; Sun,  6 Oct 2024 14:04:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 6 Oct 2024 15:55:01 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d7b03301fe1df001867c5d16dcfd747ff3962ee7
X-Git-Newrev: 5de5ef51b5a7bd3f47f82167b4d966706039a15c
X-Patchwork-Hint: ignore
Message-Id: <20241006140426.8637B85018@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mtd: update to 2.2.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=5de5ef51b5a7bd3f47f82167b4d966706039a15c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

See https://lore.kernel.org/buildroot/5dcaf594-e727-4ec3-af69-86e578029160@sigma-star.at/

Signed-off-by: Brandon Maier <brandon.maier@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/mtd/mtd.hash | 4 ++--
 package/mtd/mtd.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/mtd/mtd.hash b/package/mtd/mtd.hash
index 1efb06f490..0eb90a5118 100644
--- a/package/mtd/mtd.hash
+++ b/package/mtd/mtd.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-# https://infraroot.at/pub/mtd/mtd-utils-2.2.0.tar.bz2.asc
-sha256  250d082f67375ca8451b5fcfc9a23a53ced3ebebd8312c288daf2507bbab1324  mtd-utils-2.2.0.tar.bz2
+# https://infraroot.at/pub/mtd/mtd-utils-2.2.1.tar.bz2.asc
+sha256  f7ae20b2eb79ee83441468f0b99d897024cd96ff853eea59106fb1952065c803  mtd-utils-2.2.1.tar.bz2
 sha256  dcc100d4161cc0b7177545ab6e47216f84857cda3843847c792a25289852dcaa  COPYING
diff --git a/package/mtd/mtd.mk b/package/mtd/mtd.mk
index d3444c88f2..77050e7e40 100644
--- a/package/mtd/mtd.mk
+++ b/package/mtd/mtd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MTD_VERSION = 2.2.0
+MTD_VERSION = 2.2.1
 MTD_SOURCE = mtd-utils-$(MTD_VERSION).tar.bz2
 MTD_SITE = https://infraroot.at/pub/mtd
 MTD_LICENSE = GPL-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

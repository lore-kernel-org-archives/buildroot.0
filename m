Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 560A3C10F1A
	for <buildroot@archiver.kernel.org>; Thu,  9 May 2024 16:22:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1927640560;
	Thu,  9 May 2024 16:22:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bzh62oyBdIc5; Thu,  9 May 2024 16:22:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9BC8F409A3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9BC8F409A3;
	Thu,  9 May 2024 16:22:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0E8391BF337
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 16:22:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0782683E95
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 16:22:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eF5CACEckvxZ for <buildroot@lists.busybox.net>;
 Thu,  9 May 2024 16:22:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4158E820A6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4158E820A6
 for <buildroot@buildroot.org>; Thu,  9 May 2024 16:22:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 222D786C90; Thu,  9 May 2024 16:22:01 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 9 May 2024 18:20:59 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b903aec04f02aca6504140359be9993529a83a49
X-Git-Newrev: 54a412d2c123849a32d9a5c01826f081671db58c
X-Patchwork-Hint: ignore
Message-Id: <20240509162201.222D786C90@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ncdu: bump to version 1.20
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=54a412d2c123849a32d9a5c01826f081671db58c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For change log since 1.19, see:
- https://dev.yorhel.nl/ncdu/changes

The license hash changed: the years were removed. See:
https://code.blicky.net/yorhel/ncdu/commit/a9d608fab119bb98d57b0996f14498ec58bc79b9

This commit also adds the pgp signature check comment in the hash file.

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/ncdu/ncdu.hash | 11 +++++++----
 package/ncdu/ncdu.mk   |  2 +-
 2 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/package/ncdu/ncdu.hash b/package/ncdu/ncdu.hash
index 553e128ed1..cfb44b7d31 100644
--- a/package/ncdu/ncdu.hash
+++ b/package/ncdu/ncdu.hash
@@ -1,7 +1,10 @@
 # From https://dev.yorhel.nl/ncdu
-md5  7986451d5b222b8a99b5382f33a30831  ncdu-1.19.tar.gz
-sha1  3ee7aff60bdaa1c79eb4f27e3d277fc2d76e0043  ncdu-1.19.tar.gz
-sha256  30363019180cde0752c7fb006c12e154920412f4e1b5dc3090654698496bb17d  ncdu-1.19.tar.gz
+# After checking pgp signature from:
+# https://dev.yorhel.nl/download/ncdu-1.20.tar.gz.asc
+# With key 74460D32B80810EBA9AFA2E962394C698C2739FA
+md5  563966db4c3c34d61cc890a85ddedae0  ncdu-1.20.tar.gz
+sha1  1a3543cfbbe3e402d6347cf688468327064941b9  ncdu-1.20.tar.gz
+sha256  5fe2bb841abe72374bb242dbb93293c4ae053078432d896a7481b2ff10be9572  ncdu-1.20.tar.gz
 
 # computed locally
-sha256  40372b6016a489b69a5d198526e0a1c284680900f48a8b725de440452098a97b  COPYING
+sha256  a324e25fe6af7fa45286b34a516b4c5a11544344bc80efb74fc51033b2e76df4  COPYING
diff --git a/package/ncdu/ncdu.mk b/package/ncdu/ncdu.mk
index f14f61fec5..cff824fd74 100644
--- a/package/ncdu/ncdu.mk
+++ b/package/ncdu/ncdu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NCDU_VERSION = 1.19
+NCDU_VERSION = 1.20
 NCDU_SITE = http://dev.yorhel.nl/download
 
 NCDU_DEPENDENCIES = ncurses
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

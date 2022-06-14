Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B1B5C43334
	for <buildroot@archiver.kernel.org>; Tue, 14 Jun 2022 16:59:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B7BAC60B14;
	Tue, 14 Jun 2022 16:59:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Qg1V6YVbcPgI; Tue, 14 Jun 2022 16:59:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E806060AF4;
	Tue, 14 Jun 2022 16:59:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EE39F1BF37A
 for <buildroot@lists.busybox.net>; Tue, 14 Jun 2022 16:58:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B973B60AAD
 for <buildroot@lists.busybox.net>; Tue, 14 Jun 2022 16:58:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yV9gw9fUOuaq for <buildroot@lists.busybox.net>;
 Tue, 14 Jun 2022 16:58:00 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 13E7960AF4
 for <buildroot@buildroot.org>; Tue, 14 Jun 2022 16:58:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 319418705E; Tue, 14 Jun 2022 16:45:52 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 14 Jun 2022 17:58:58 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c253f8498222a8446ce9da4a900acd0b345df289
X-Git-Newrev: 4e54449b3bc6a9c6d7fa06cb0524a8b6c81237a9
X-Patchwork-Hint: ignore
Message-Id: <20220614164552.319418705E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/lsof: bump to version 4.95.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=4e54449b3bc6a9c6d7fa06cb0524a8b6c81237a9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

remove merged patch

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/lsof/0001-remove-susvlegacy-funcs.patch | 12 ------------
 package/lsof/lsof.hash                          |  2 +-
 package/lsof/lsof.mk                            |  2 +-
 3 files changed, 2 insertions(+), 14 deletions(-)

diff --git a/package/lsof/0001-remove-susvlegacy-funcs.patch b/package/lsof/0001-remove-susvlegacy-funcs.patch
deleted file mode 100644
index fca66aee57..0000000000
--- a/package/lsof/0001-remove-susvlegacy-funcs.patch
+++ /dev/null
@@ -1,12 +0,0 @@
-diff -rdup lsof_4.81.orig/lsof_4.81_src/dialects/linux/machine.h lsof_4.81/lsof_4.81_src/dialects/linux/machine.h
---- a/dialects/linux/machine.h	2007-04-24 18:20:58.000000000 +0200
-+++ b/dialects/linux/machine.h	2007-05-15 12:17:03.000000000 +0200
-@@ -616,6 +616,6 @@
-  * zeromem is a macro that uses bzero or memset.
-  */
- 
--#define	zeromem(a, l)	bzero(a, l)
-+#define	zeromem(a, l)	memset(a, 0, l)
- 
- #endif	/* !defined(LSOF_MACHINE_H) */
-
diff --git a/package/lsof/lsof.hash b/package/lsof/lsof.hash
index 9e72023d30..7318c608c1 100644
--- a/package/lsof/lsof.hash
+++ b/package/lsof/lsof.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  c41709c2543ecf9de1e950795790a9786a2f225e51c3cc53d6a9a256f872472b  lsof_4.94.0.linux.tar.bz2
+sha256  e9faa0fbcc48638c1d1f143e93573ac43b65e76646150f83e24bd8c18786303c  lsof_4.95.0.linux.tar.bz2
 sha256  32a728188b19bf86917659d904ab29d0a294b4506e1c98b8b7f1c70ab4975fe1  dialects/linux/dproto.h
diff --git a/package/lsof/lsof.mk b/package/lsof/lsof.mk
index feb6a744e0..21a327b996 100644
--- a/package/lsof/lsof.mk
+++ b/package/lsof/lsof.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LSOF_VERSION = 4.94.0
+LSOF_VERSION = 4.95.0
 LSOF_SOURCE = lsof_$(LSOF_VERSION).linux.tar.bz2
 LSOF_SITE = https://github.com/lsof-org/lsof/releases/download/$(LSOF_VERSION)
 LSOF_LICENSE = lsof license
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

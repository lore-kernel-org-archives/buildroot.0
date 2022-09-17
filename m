Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E1DEC6FA82
	for <buildroot@archiver.kernel.org>; Sat, 17 Sep 2022 20:28:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B5AF16117F;
	Sat, 17 Sep 2022 20:28:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B5AF16117F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0Ng3rH5g_k6L; Sat, 17 Sep 2022 20:28:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D3C326114C;
	Sat, 17 Sep 2022 20:28:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D3C326114C
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 98D691BF39A
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 20:28:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 80AC140207
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 20:28:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 80AC140207
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dROjnGZ0DIiO for <buildroot@lists.busybox.net>;
 Sat, 17 Sep 2022 20:28:08 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6E918401C1
 for <buildroot@buildroot.org>; Sat, 17 Sep 2022 20:28:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6E918401C1
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5D273846BC; Sat, 17 Sep 2022 20:28:08 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 17 Sep 2022 22:22:35 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 748f0ff5616c08a2616b52923635b7b32d47ae3b
X-Git-Newrev: a24002cd2b3ae4f620faa9a077187b0a43ff408e
X-Patchwork-Hint: ignore
Message-Id: <20220917202808.5D273846BC@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/mutt: bump to
 version 2.2.7
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

commit: https://git.buildroot.net/buildroot/commit/?id=a24002cd2b3ae4f620faa9a077187b0a43ff408e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

This is a bug-fix release, fixing a $edit_headers bug on MacOS, along
with a few other small bugs. It also tightens the $query_command parser
to accept a single tab between fields, and changes $pager to accept a %s
expando.

https://gitlab.com/muttmua/mutt/-/blob/mutt-2-2-7-rel/ChangeLog

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 628f3dc54c8e3149f7b5ac727f1b6cf846460b72)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mutt/mutt.hash | 2 +-
 package/mutt/mutt.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mutt/mutt.hash b/package/mutt/mutt.hash
index 0bec59def4..27e439183a 100644
--- a/package/mutt/mutt.hash
+++ b/package/mutt/mutt.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  ffa2d93517cfc606fe01daffc5f12e42062a1c134d3b9af78484ebc5430888d3  mutt-2.2.6.tar.gz
+sha256  eb13858f58bb369f477bf652d90e9b6aaddd0d610acbea3455049e5efad36df1  mutt-2.2.7.tar.gz
 sha256  732f24b69a6c71cd8e01e4672bb8e12cc1cbb88a50a4665e6ca4fd95000a57ee  GPL
diff --git a/package/mutt/mutt.mk b/package/mutt/mutt.mk
index 5b1119c79b..7a4bc1b10c 100644
--- a/package/mutt/mutt.mk
+++ b/package/mutt/mutt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MUTT_VERSION = 2.2.6
+MUTT_VERSION = 2.2.7
 MUTT_SITE = https://bitbucket.org/mutt/mutt/downloads
 MUTT_LICENSE = GPL-2.0+
 MUTT_LICENSE_FILES = GPL
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54488CFB442
	for <buildroot@archiver.kernel.org>; Mon,  7 Oct 2024 06:39:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E4B4580C92;
	Mon,  7 Oct 2024 06:39:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0OedCwTw2XP3; Mon,  7 Oct 2024 06:39:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DB60680C96
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DB60680C96;
	Mon,  7 Oct 2024 06:39:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8896E1BF471
 for <buildroot@lists.busybox.net>; Mon,  7 Oct 2024 06:39:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 831A080C97
 for <buildroot@lists.busybox.net>; Mon,  7 Oct 2024 06:39:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G8Kpo4-SW-zf for <buildroot@lists.busybox.net>;
 Mon,  7 Oct 2024 06:39:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B235880C92
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B235880C92
 for <buildroot@buildroot.org>; Mon,  7 Oct 2024 06:39:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9E1288572E; Mon,  7 Oct 2024 06:39:33 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 7 Oct 2024 08:31:29 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 47b8264fdacb400966adb4aee3f5ed0fdd6b8d18
X-Git-Newrev: 8e3bea74f9331d02287727a7de2ad0fa981775d7
X-Patchwork-Hint: ignore
Message-Id: <20241007063933.9E1288572E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/hwloc: bump to version 2.11.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=8e3bea74f9331d02287727a7de2ad0fa981775d7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For change log since 2.9.3, see:
https://github.com/open-mpi/hwloc/blob/hwloc-2.11.2/NEWS#L20

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/hwloc/hwloc.hash | 6 +++---
 package/hwloc/hwloc.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/hwloc/hwloc.hash b/package/hwloc/hwloc.hash
index 8010b857f0..f85508b7a6 100644
--- a/package/hwloc/hwloc.hash
+++ b/package/hwloc/hwloc.hash
@@ -1,5 +1,5 @@
-# From https://www.open-mpi.org/software/hwloc/v2.9/
-sha1  76b49087619b46d71e18bd1131d35a5ccf5de791  hwloc-2.9.3.tar.bz2
-sha256  5c4062ce556f6d3451fc177ffb8673a2120f81df6835dea6a21a90fbdfff0dec  hwloc-2.9.3.tar.bz2
+# From https://www.open-mpi.org/software/hwloc/v2.11/
+sha1  8c15d9707c2390bcdc564df11395a36c8fc775be  hwloc-2.11.2.tar.bz2
+sha256  f7f88fecae067100f1a1a915b658add0f4f71561259482910a69baea22fe8409  hwloc-2.11.2.tar.bz2
 # Locally computed
 sha256  d79a936a42f3c6cb7c8375a023d43f4435f4664d3a5a2ea6b4623cff83c7fc06  COPYING
diff --git a/package/hwloc/hwloc.mk b/package/hwloc/hwloc.mk
index 8fe9e648a7..0d03757d83 100644
--- a/package/hwloc/hwloc.mk
+++ b/package/hwloc/hwloc.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-HWLOC_VERSION_MAJOR = 2.9
-HWLOC_VERSION = $(HWLOC_VERSION_MAJOR).3
+HWLOC_VERSION_MAJOR = 2.11
+HWLOC_VERSION = $(HWLOC_VERSION_MAJOR).2
 HWLOC_SOURCE = hwloc-$(HWLOC_VERSION).tar.bz2
 HWLOC_SITE = https://download.open-mpi.org/release/hwloc/v$(HWLOC_VERSION_MAJOR)
 HWLOC_LICENSE = BSD-3-Clause
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

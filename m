Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2F7AC6FD1F
	for <buildroot@archiver.kernel.org>; Sun, 24 Mar 2024 15:11:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A493D406F4;
	Sun, 24 Mar 2024 15:11:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CUh1dOwwseLN; Sun, 24 Mar 2024 15:11:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A870D4064E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A870D4064E;
	Sun, 24 Mar 2024 15:11:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5105F1BF4DD
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 15:11:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 965DB606EA
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 15:11:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BqLDmdMnNjFQ for <buildroot@lists.busybox.net>;
 Sun, 24 Mar 2024 15:11:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C913460754
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C913460754
 for <buildroot@buildroot.org>; Sun, 24 Mar 2024 15:11:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 80ECF83B62; Sun, 24 Mar 2024 15:11:25 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 24 Mar 2024 16:00:26 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c1c096f91da5bfc45f1842b6dd12f1f0e016dbc4
X-Git-Newrev: 33139ca6ac738861d3b8783202d04a77e38f09bf
X-Patchwork-Hint: ignore
Message-Id: <20240324151125.80ECF83B62@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/iproute2: bump to version 6.8.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=33139ca6ac738861d3b8783202d04a77e38f09bf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog - https://github.com/iproute2/iproute2/compare/v6.7.0...v6.8.0

Drop 0001-Revert-ss-prevent-Process-column-from-being-printed-.patch.
See the upstream fix
https://github.com/iproute2/iproute2/commit/87d804ca0854b09c07872e9fd6036bf5d3e0cc85

Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 ...revent-Process-column-from-being-printed-.patch | 45 ----------------------
 package/iproute2/iproute2.hash                     |  2 +-
 package/iproute2/iproute2.mk                       |  2 +-
 3 files changed, 2 insertions(+), 47 deletions(-)

diff --git a/package/iproute2/0001-Revert-ss-prevent-Process-column-from-being-printed-.patch b/package/iproute2/0001-Revert-ss-prevent-Process-column-from-being-printed-.patch
deleted file mode 100644
index 10fa472d64..0000000000
--- a/package/iproute2/0001-Revert-ss-prevent-Process-column-from-being-printed-.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From f22c49730c3691c25a1147081363eb35aa9d1048 Mon Sep 17 00:00:00 2001
-From: Stephen Hemminger <stephen@networkplumber.org>
-Date: Sat, 13 Jan 2024 08:51:55 -0800
-Subject: [PATCH] Revert "ss: prevent "Process" column from being printed
- unless requested"
-
-This reverts commit 1607bf531fd2f984438d227ea97312df80e7cf56.
-
-This commit is being reverted because it breaks output of tcp info.
-The order of the columns enum is order sensistive.
-
-Bug: https://bugzilla.kernel.org/show_bug.cgi?id=218372
-Signed-off-by: Stephen Hemminger <stephen@networkplumber.org>
-Upstream: https://git.kernel.org/pub/scm/network/iproute2/iproute2.git/commit/?id=f22c49730c3691c25a1147081363eb35aa9d1048
----
- misc/ss.c | 5 +----
- 1 file changed, 1 insertion(+), 4 deletions(-)
-
-diff --git a/misc/ss.c b/misc/ss.c
-index 09dc1f37..9438382b 100644
---- a/misc/ss.c
-+++ b/misc/ss.c
-@@ -100,8 +100,8 @@ enum col_id {
- 	COL_SERV,
- 	COL_RADDR,
- 	COL_RSERV,
--	COL_PROC,
- 	COL_EXT,
-+	COL_PROC,
- 	COL_MAX
- };
-
-@@ -5795,9 +5795,6 @@ int main(int argc, char *argv[])
- 	if (ssfilter_parse(&current_filter.f, argc, argv, filter_fp))
- 		usage();
-
--	if (!show_processes)
--		columns[COL_PROC].disabled = 1;
--
- 	if (!(current_filter.dbs & (current_filter.dbs - 1)))
- 		columns[COL_NETID].disabled = 1;
-
---
-2.43.0
-
diff --git a/package/iproute2/iproute2.hash b/package/iproute2/iproute2.hash
index 0be058e64b..d57a93de7d 100644
--- a/package/iproute2/iproute2.hash
+++ b/package/iproute2/iproute2.hash
@@ -1,3 +1,3 @@
 # From https://kernel.org/pub/linux/utils/net/iproute2/sha256sums.asc
-sha256  ff942dd9828d7d1f867f61fe72ce433078c31e5d8e4a78e20f02cb5892e8841d  iproute2-6.7.0.tar.xz
+sha256  03a6cca3d71a908d1f15f7b495be2b8fe851f941458dc4664900d7f45fcf68ce  iproute2-6.8.0.tar.xz
 sha256  e6d6a009505e345fe949e1310334fcb0747f28dae2856759de102ab66b722cb4  COPYING
diff --git a/package/iproute2/iproute2.mk b/package/iproute2/iproute2.mk
index 4adb4e3356..3db2ab925d 100644
--- a/package/iproute2/iproute2.mk
+++ b/package/iproute2/iproute2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IPROUTE2_VERSION = 6.7.0
+IPROUTE2_VERSION = 6.8.0
 IPROUTE2_SOURCE = iproute2-$(IPROUTE2_VERSION).tar.xz
 IPROUTE2_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/net/iproute2
 IPROUTE2_DEPENDENCIES = host-bison host-flex host-pkgconf \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6D35C7EE22
	for <buildroot@archiver.kernel.org>; Mon,  8 May 2023 20:03:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7771642A8E;
	Mon,  8 May 2023 20:03:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7771642A8E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hPtLWuSALMZn; Mon,  8 May 2023 20:03:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C498041D3A;
	Mon,  8 May 2023 20:03:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C498041D3A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 65DA51BF868
 for <buildroot@lists.busybox.net>; Mon,  8 May 2023 20:03:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3E89A8458C
 for <buildroot@lists.busybox.net>; Mon,  8 May 2023 20:03:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3E89A8458C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9Q67IPpBQUDM for <buildroot@lists.busybox.net>;
 Mon,  8 May 2023 20:03:13 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5043F84588
 for <buildroot@buildroot.org>; Mon,  8 May 2023 20:03:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5043F84588
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3BF30861AB; Mon,  8 May 2023 20:03:13 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 8 May 2023 21:41:44 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 441c44626f3c8b6181b7b4be0757d4eb2659dcee
X-Git-Newrev: 62962d175d3fbeb0289bce4440005b8129f21efe
X-Patchwork-Hint: ignore
Message-Id: <20230508200313.3BF30861AB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/sysklogd: bump to v2.5.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=62962d175d3fbeb0289bce4440005b8129f21efe
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Add support for -c and -cc to disable log compression
   A single -c disables compression for pipes, another -c (or -cc)
   disables compression for all other log targets
 - The default syslog.conf now logs debug messages again (disabled in
   v2.4.0) due to problems (confusion) reported in the field
 - Dropped not recommended KillMode=process from systemd unit file
 - Fix loss of early log messages running under systemd

Full changelog: https://github.com/troglobit/sysklogd/releases/tag/v2.5.0

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/sysklogd/sysklogd.hash | 2 +-
 package/sysklogd/sysklogd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/sysklogd/sysklogd.hash b/package/sysklogd/sysklogd.hash
index e370716bd9..30ce6d9c0b 100644
--- a/package/sysklogd/sysklogd.hash
+++ b/package/sysklogd/sysklogd.hash
@@ -1,5 +1,5 @@
 # Upstream .sha256 from GitHub
-sha256  01f25931d1508c3e6be4e182f49356c993abc7d035d5835db35f9b61d5085549  sysklogd-2.4.4.tar.gz
+sha256  e1d635944e5a6062c8ea18b9506668ebdaefacea1965147f60cf3fb3a25770e8  sysklogd-2.5.0.tar.gz
 
 # Locally calculated
 sha256  7a71d7603a7c4456df441463e54da35acf151c1be0879246de63544f1f34f477  LICENSE
diff --git a/package/sysklogd/sysklogd.mk b/package/sysklogd/sysklogd.mk
index 68023c9ae2..ebc9f89cf7 100644
--- a/package/sysklogd/sysklogd.mk
+++ b/package/sysklogd/sysklogd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SYSKLOGD_VERSION = 2.4.4
+SYSKLOGD_VERSION = 2.5.0
 SYSKLOGD_SITE = https://github.com/troglobit/sysklogd/releases/download/v$(SYSKLOGD_VERSION)
 SYSKLOGD_LICENSE = BSD-3-Clause
 SYSKLOGD_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

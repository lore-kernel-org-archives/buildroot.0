Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A46D0C54E58
	for <buildroot@archiver.kernel.org>; Mon, 25 Mar 2024 08:00:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6EAC081DFD;
	Mon, 25 Mar 2024 08:00:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z2EugNjphTGh; Mon, 25 Mar 2024 08:00:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3658C81E58
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3658C81E58;
	Mon, 25 Mar 2024 08:00:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5A4421BF20B
 for <buildroot@lists.busybox.net>; Mon, 25 Mar 2024 07:59:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 53D9840675
 for <buildroot@lists.busybox.net>; Mon, 25 Mar 2024 07:59:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id trZBTngodHXT for <buildroot@lists.busybox.net>;
 Mon, 25 Mar 2024 07:59:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4EDFE4059B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4EDFE4059B
 for <buildroot@buildroot.org>; Mon, 25 Mar 2024 07:59:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3922A83D2F; Mon, 25 Mar 2024 07:59:58 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 25 Mar 2024 08:50:47 +0100
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: b6ae0782027e946034a4868b929115b95538249b
X-Git-Newrev: a7b1d7d2b49b95ddd7095e67c2ea67ebf5e1333d
X-Patchwork-Hint: ignore
Message-Id: <20240325075958.3922A83D2F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/bash: bump to
 version 5.2.21
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

commit: https://git.buildroot.net/buildroot/commit/?id=a7b1d7d2b49b95ddd7095e67c2ea67ebf5e1333d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Build tested using the following config option:
    BR2_PACKAGE_BASH=y
$ ./utils/test-pkg -c bash.config  -p bash
                    bootlin-armv5-uclibc [1/6]: OK
                     bootlin-armv7-glibc [2/6]: OK
                   bootlin-armv7m-uclibc [3/6]: SKIPPED
                     bootlin-x86-64-musl [4/6]: OK
                      br-arm-full-static [5/6]: OK
                            sourcery-arm [6/6]: OK
6 builds, 1 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed

Signed-off-by: Kadambini Nema <kadambini.nema@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 4ac57d33fcbe73fcd17a4f002803a81e455d949a)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/bash/bash.hash | 4 ++--
 package/bash/bash.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/bash/bash.hash b/package/bash/bash.hash
index e0a1ebac91..44c1c5ed50 100644
--- a/package/bash/bash.hash
+++ b/package/bash/bash.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature from
-# https://ftp.gnu.org/gnu/bash/bash-5.2.15.tar.gz.sig
-sha256  13720965b5f4fc3a0d4b61dd37e7565c741da9a5be24edc2ae00182fc1b3588c  bash-5.2.15.tar.gz
+# https://ftp.gnu.org/gnu/bash/bash-5.2.21.tar.gz.sig
+sha256  c8e31bdc59b69aaffc5b36509905ba3e5cbb12747091d27b4b977f078560d5b8  bash-5.2.21.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/bash/bash.mk b/package/bash/bash.mk
index 9a73ed8c36..9d173a5c7c 100644
--- a/package/bash/bash.mk
+++ b/package/bash/bash.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BASH_VERSION = 5.2.15
+BASH_VERSION = 5.2.21
 BASH_SITE = $(BR2_GNU_MIRROR)/bash
 BASH_DEPENDENCIES = ncurses readline host-bison
 BASH_LICENSE = GPL-3.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

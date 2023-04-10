Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79AF2C77B61
	for <buildroot@archiver.kernel.org>; Mon, 10 Apr 2023 13:49:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EE107415AE;
	Mon, 10 Apr 2023 13:49:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EE107415AE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MDvtugHlUeoJ; Mon, 10 Apr 2023 13:49:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D912C41579;
	Mon, 10 Apr 2023 13:49:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D912C41579
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1550D1C3B18
 for <buildroot@lists.busybox.net>; Mon, 10 Apr 2023 13:49:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EF05541579
 for <buildroot@lists.busybox.net>; Mon, 10 Apr 2023 13:49:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EF05541579
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SmAt7cBfUCxG for <buildroot@lists.busybox.net>;
 Mon, 10 Apr 2023 13:49:26 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id CE75341554
 for <buildroot@buildroot.org>; Mon, 10 Apr 2023 13:49:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CE75341554
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BC71A83C51; Mon, 10 Apr 2023 13:49:26 +0000 (UTC)
From: Arnout Vandecappelle <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 10 Apr 2023 15:47:43 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2e330dff6a7ce7965ceb0dccdc9dcbcb329167bb
X-Git-Newrev: e09a43abd1170abdeeda9ac6e89040a7f653722b
X-Patchwork-Hint: ignore
Message-Id: <20230410134926.BC71A83C51@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mg: bump to v3.6
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

commit: https://git.buildroot.net/buildroot/commit/?id=e09a43abd1170abdeeda9ac6e89040a7f653722b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Excerpt of https://github.com/troglobit/mg/releases/tag/v3.6:

 - Sync with mg upstream, OpenBSD 7.2, as of April 10 2023
   - Drop trailing whitespace on RET (c-mode)
   - Add zap-to-char and zap-up-to-char, binding the former to M-z
   - Fix dobeep_msgs() usage, does not support format strings, this may
     have caused unexpected crashes for some operations, e.g. goto line
     that does not exist
   - Fix memleaks and possible crashes in ctags support
   - Fall back to /bin/sh if $SHELL is undefined
 - Fix typos and duplicate undo in *quick* help buffer
 - Add support for exuberant/universal Ctags tags file format
 - Add support for M-, to pop-tag-mark, like GNU Emacs

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/mg/mg.hash | 4 ++--
 package/mg/mg.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/mg/mg.hash b/package/mg/mg.hash
index 19cf1e29d5..e8eedb8921 100644
--- a/package/mg/mg.hash
+++ b/package/mg/mg.hash
@@ -1,4 +1,4 @@
-# From https://github.com/troglobit/mg/releases/tag/v3.5
-sha256  a906eab9370c0f24a5fa25923561ad933b74ad339d0b2851d2067badf0d7e4ce  mg-3.5.tar.gz
+# From https://github.com/troglobit/mg/releases/tag/v3.6
+sha256  0e30f99b7606ddd92535aec0ba0118557afa4adca0961267314a4bf7791865fb  mg-3.6.tar.gz
 # Locally computed:
 sha256  7e12e5df4bae12cb21581ba157ced20e1986a0508dd10d0e8a4ab9a4cf94e85c  UNLICENSE
diff --git a/package/mg/mg.mk b/package/mg/mg.mk
index bb3f59a14d..88f8f60257 100644
--- a/package/mg/mg.mk
+++ b/package/mg/mg.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MG_VERSION = 3.5
+MG_VERSION = 3.6
 MG_SITE = https://github.com/troglobit/mg/releases/download/v$(MG_VERSION)
 MG_LICENSE = Public Domain
 MG_LICENSE_FILES = UNLICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8165CD128A
	for <buildroot@archiver.kernel.org>; Sun,  7 Apr 2024 19:39:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6E40340B21;
	Sun,  7 Apr 2024 19:39:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sjCrwbzf7RFZ; Sun,  7 Apr 2024 19:39:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D275440BB3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D275440BB3;
	Sun,  7 Apr 2024 19:39:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4A5841BF473
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 19:39:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1DB0C40784
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 19:39:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2kTeB6nQEaOm for <buildroot@lists.busybox.net>;
 Sun,  7 Apr 2024 19:39:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 146E74071D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 146E74071D
 for <buildroot@buildroot.org>; Sun,  7 Apr 2024 19:39:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7F0A685C10; Sun,  7 Apr 2024 19:39:03 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 7 Apr 2024 21:34:26 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 241b18b51e3219a06e19010ec874b3bb681ca110
X-Git-Newrev: bfa4dd299f1346d5e246a552c491b630c64a6a97
X-Patchwork-Hint: ignore
Message-Id: <20240407193903.7F0A685C10@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/inih: bump to version 58
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

commit: https://git.buildroot.net/buildroot/commit/?id=bfa4dd299f1346d5e246a552c491b630c64a6a97
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This bump will fix the following build failure with gcc 5 raised since
bump to version 57 in commit 65c8a9b6626de83365865dea6fff1749466a36aa
thanks to
https://github.com/benhoyt/inih/commit/4e618f77d4bae216865c5abd972d99b1ba5031e2:

In file included from /home/buildroot/autobuild/run/instance-1/output-1/host/opt/ext-toolchain/mips-linux-gnu/include/c++/5.3.0/cstdint:35:0,
                 from ../cpp/INIReader.h:17,
                 from ../cpp/INIReader.cpp:16:
/home/buildroot/autobuild/run/instance-1/output-1/host/opt/ext-toolchain/mips-linux-gnu/include/c++/5.3.0/bits/c++0x_warning.h:32:2: error: #error This file requires compiler and library support for the ISO C++ 2011 standard. This support is currently experimental, and must be enabled with the -std=c++11 or -std=gnu++11 compiler options.
 #error This file requires compiler and library support for the \
  ^

https://github.com/benhoyt/inih/releases/tag/r58

Fixes: 65c8a9b6626de83365865dea6fff1749466a36aa
 - http://autobuild.buildroot.org/results/7a5ba516cde536e103669a0422d336dd8a3b1dbc

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/inih/inih.hash | 2 +-
 package/inih/inih.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/inih/inih.hash b/package/inih/inih.hash
index 476b544ce6..f20d7ac0b6 100644
--- a/package/inih/inih.hash
+++ b/package/inih/inih.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  f03f98ca35c3adb56b2358573c8d3eda319ccd5287243d691e724b7eafa970b3  inih-57.tar.gz
+sha256  e79216260d5dffe809bda840be48ab0eec7737b2bb9f02d2275c1b46344ea7b7  inih-58.tar.gz
 sha256  9ae3b39e83e9158e44b67733baa3bb2d84e80efdcfb14a5820210a42c7abdf7f  LICENSE.txt
diff --git a/package/inih/inih.mk b/package/inih/inih.mk
index 93032f1ed5..80cde0942b 100644
--- a/package/inih/inih.mk
+++ b/package/inih/inih.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-INIH_VERSION = 57
+INIH_VERSION = 58
 INIH_SITE = $(call github,benhoyt,inih,r$(INIH_VERSION))
 INIH_INSTALL_STAGING = YES
 INIH_LICENSE = BSD-3-Clause
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

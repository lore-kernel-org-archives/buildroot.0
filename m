Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9609CDB47E
	for <buildroot@archiver.kernel.org>; Sun, 15 Oct 2023 19:59:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 87435414BF;
	Sun, 15 Oct 2023 19:59:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 87435414BF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8sJODced3ABN; Sun, 15 Oct 2023 19:59:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5D564414D5;
	Sun, 15 Oct 2023 19:59:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5D564414D5
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B0D071BF21A
 for <buildroot@lists.busybox.net>; Sun, 15 Oct 2023 19:59:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8A54F611A4
 for <buildroot@lists.busybox.net>; Sun, 15 Oct 2023 19:59:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8A54F611A4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kJtH23xa2WHD for <buildroot@lists.busybox.net>;
 Sun, 15 Oct 2023 19:59:13 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id BF850611A3
 for <buildroot@buildroot.org>; Sun, 15 Oct 2023 19:59:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BF850611A3
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AF99B856EE; Sun, 15 Oct 2023 19:59:13 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 15 Oct 2023 21:57:29 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5eac719129f66185a83bba6adff8658b41420159
X-Git-Newrev: 470f0fb1ec0bd2ba03340f2aea34891ca8d7739d
X-Patchwork-Hint: ignore
Message-Id: <20231015195913.AF99B856EE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/nushell: bump to version 0.85
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

commit: https://git.buildroot.net/buildroot/commit/?id=470f0fb1ec0bd2ba03340f2aea34891ca8d7739d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- This bump will fix the following build failure with libressl raised
  since the addition of the package in commit
  f8047ff5987efc80f6ead51edae126911c02a8ad:

  This crate is only compatible with OpenSSL (version 1.0.1 through 1.1.1, or 3.0.0), or LibreSSL 2.5
  through 3.5, but a different version of OpenSSL was found. The build is now aborting
  due to this version mismatch.

- Update hash of license file (year updated with
  https://github.com/nushell/nushell/commit/a256f6d0d15c9fed69365be36b3484c4c8418d21)

https://www.nushell.sh/blog

Fixes:
 - http://autobuild.buildroot.org/results/8b7e277bb67c52a57e7b9f17c30f1780b9c5ea67

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/nushell/nushell.hash | 4 ++--
 package/nushell/nushell.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/nushell/nushell.hash b/package/nushell/nushell.hash
index b553a6c2bc..02fc8214b6 100644
--- a/package/nushell/nushell.hash
+++ b/package/nushell/nushell.hash
@@ -1,3 +1,3 @@
 # Locally generated
-sha256  352e807698d5f95e9bfdd9dd5512acab3cbef315379299a32e5f322a76eb718a  nushell-0.76.0.tar.gz
-sha256  e189616e535e9f7bf410a72e6fc51ad1e0ae461c58d592e186c2669daa5d1e5d  LICENSE
+sha256  94af22278f584b59c7c4b2390e2d15d9934d5207a756309259d1c4b92f5af7ef  nushell-0.85.0.tar.gz
+sha256  2dc1f03f729c21902d869b4d8f8dc528fc730f4c6ad83fc128672bda0ad69196  LICENSE
diff --git a/package/nushell/nushell.mk b/package/nushell/nushell.mk
index b9c1ee6434..779a3c4393 100644
--- a/package/nushell/nushell.mk
+++ b/package/nushell/nushell.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NUSHELL_VERSION = 0.76.0
+NUSHELL_VERSION = 0.85.0
 NUSHELL_SITE = $(call github,nushell,nushell,$(NUSHELL_VERSION))
 NUSHELL_LICENSE = MIT
 NUSHELL_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

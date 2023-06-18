Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E9A5EB64D7
	for <buildroot@archiver.kernel.org>; Sun, 18 Jun 2023 11:50:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D18AC4047D;
	Sun, 18 Jun 2023 11:50:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D18AC4047D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uGj4ANJTL7p3; Sun, 18 Jun 2023 11:50:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id F0E6E40629;
	Sun, 18 Jun 2023 11:50:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F0E6E40629
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 04E6A1BF5AE
 for <buildroot@lists.busybox.net>; Sun, 18 Jun 2023 11:46:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5815560F8F
 for <buildroot@lists.busybox.net>; Sun, 18 Jun 2023 11:46:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5815560F8F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BmcddODnamxX for <buildroot@lists.busybox.net>;
 Sun, 18 Jun 2023 11:45:59 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3B2D260FB8
 for <buildroot@buildroot.org>; Sun, 18 Jun 2023 11:45:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3B2D260FB8
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3960A83BB1; Sun, 18 Jun 2023 11:45:59 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 18 Jun 2023 13:43:56 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c3c4b6356e866cc2d34075869e2e957b57ad2616
X-Git-Newrev: 39ffadd6ae8c472e083c431a957ec575c1cebce2
X-Patchwork-Hint: ignore
Message-Id: <20230618114559.3960A83BB1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/jhead: security bump to version
 3.08
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

commit: https://git.buildroot.net/buildroot/commit/?id=39ffadd6ae8c472e083c431a957ec575c1cebce2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes the following security issue:

- CVE-2022-41751: Jhead 3.06.0.1 allows attackers to execute arbitrary OS
  commands by placing them in a JPEG filename and then using the
  regeneration -rgt50 option.

Update readme.txt hash after a minor tweak of the text:
https://github.com/Matthias-Wandel/jhead/commit/a0eed69daa6ad4b824eb81fb6e3be95de3f783c2

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/jhead/jhead.hash | 4 ++--
 package/jhead/jhead.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/jhead/jhead.hash b/package/jhead/jhead.hash
index bd9c8560d5..1fe856198d 100644
--- a/package/jhead/jhead.hash
+++ b/package/jhead/jhead.hash
@@ -1,3 +1,3 @@
 # Locally calculated from download (no sig, hash)
-sha256  5c5258c3d7a840bf831e22174e4a24cb1de3baf442f7cb73d5ab31b4ae0b0058  jhead-3.06.0.1.tar.gz
-sha256  8b709512c737fc0c1e1024800b9a44c54d14ab02132c636a66c3ac66955c3e95  readme.txt
+sha256  999a81b489c7b2a7264118f194359ecf4c1b714996a2790ff6d5d2f3940f1e9f  jhead-3.08.tar.gz
+sha256  b3971a74d00c834bc7f112d8a0027b25663fd1637a21381a3e5df4bd2b614dff  readme.txt
diff --git a/package/jhead/jhead.mk b/package/jhead/jhead.mk
index a206e2fe34..f07739bc21 100644
--- a/package/jhead/jhead.mk
+++ b/package/jhead/jhead.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-JHEAD_VERSION = 3.06.0.1
+JHEAD_VERSION = 3.08
 JHEAD_SITE = $(call github,Matthias-Wandel,jhead,$(JHEAD_VERSION))
 JHEAD_LICENSE = Public Domain
 JHEAD_LICENSE_FILES = readme.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

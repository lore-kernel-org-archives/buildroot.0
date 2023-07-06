Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64B13EB64D9
	for <buildroot@archiver.kernel.org>; Thu,  6 Jul 2023 10:52:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0777E41834;
	Thu,  6 Jul 2023 10:52:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0777E41834
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KpC47o0sXsGd; Thu,  6 Jul 2023 10:52:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D273241835;
	Thu,  6 Jul 2023 10:52:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D273241835
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E45F01BF28A
 for <buildroot@lists.busybox.net>; Thu,  6 Jul 2023 10:52:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BE78181FAA
 for <buildroot@lists.busybox.net>; Thu,  6 Jul 2023 10:52:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BE78181FAA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QTlmNSwfSJ9D for <buildroot@lists.busybox.net>;
 Thu,  6 Jul 2023 10:52:50 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id F0CF881369
 for <buildroot@buildroot.org>; Thu,  6 Jul 2023 10:52:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F0CF881369
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E0D0086812; Thu,  6 Jul 2023 10:52:49 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 6 Jul 2023 12:32:13 +0200
X-Git-Refname: refs/heads/2023.05.x
X-Git-Oldrev: 748007faee8cd229d21e4cea15d8a966dd79a74f
X-Git-Newrev: 77379306610d4b519a7f483ad91571470b3fd13d
X-Patchwork-Hint: ignore
Message-Id: <20230706105249.E0D0086812@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.05.x] package/jhead: security
 bump to version 3.08
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

commit: https://git.buildroot.net/buildroot/commit/?id=77379306610d4b519a7f483ad91571470b3fd13d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.05.x

Fixes the following security issue:

- CVE-2022-41751: Jhead 3.06.0.1 allows attackers to execute arbitrary OS
  commands by placing them in a JPEG filename and then using the
  regeneration -rgt50 option.

Update readme.txt hash after a minor tweak of the text:
https://github.com/Matthias-Wandel/jhead/commit/a0eed69daa6ad4b824eb81fb6e3be95de3f783c2

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 39ffadd6ae8c472e083c431a957ec575c1cebce2)
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

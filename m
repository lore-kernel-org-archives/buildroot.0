Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAFABEB64D9
	for <buildroot@archiver.kernel.org>; Thu,  6 Jul 2023 10:52:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 42F37417CA;
	Thu,  6 Jul 2023 10:52:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 42F37417CA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5MgEXhdFfqib; Thu,  6 Jul 2023 10:52:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3C8E341827;
	Thu,  6 Jul 2023 10:52:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3C8E341827
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D34221BF28A
 for <buildroot@lists.busybox.net>; Thu,  6 Jul 2023 10:51:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7CAF2414E9
 for <buildroot@lists.busybox.net>; Thu,  6 Jul 2023 10:51:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7CAF2414E9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qXinRvR8WfPp for <buildroot@lists.busybox.net>;
 Thu,  6 Jul 2023 10:51:42 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B637F402A7
 for <buildroot@buildroot.org>; Thu,  6 Jul 2023 10:51:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B637F402A7
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9FA8E86804; Thu,  6 Jul 2023 10:51:42 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 6 Jul 2023 12:32:08 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: bbb1a6e7152491a6a2cb75da7fc6dd8954a05a26
X-Git-Newrev: 678af7a6a81f361e38838896af46376e3f859ece
X-Patchwork-Hint: ignore
Message-Id: <20230706105142.9FA8E86804@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/jhead: security
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

commit: https://git.buildroot.net/buildroot/commit/?id=678af7a6a81f361e38838896af46376e3f859ece
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

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

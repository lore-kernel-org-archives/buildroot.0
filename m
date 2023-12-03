Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07EBCC4167B
	for <buildroot@archiver.kernel.org>; Sun,  3 Dec 2023 21:24:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B29CD400F9;
	Sun,  3 Dec 2023 21:24:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B29CD400F9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id atiMhe_pTUTK; Sun,  3 Dec 2023 21:24:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B1DF640297;
	Sun,  3 Dec 2023 21:24:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B1DF640297
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0E0771BF3EE
 for <buildroot@lists.busybox.net>; Sun,  3 Dec 2023 21:24:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DB90C818A7
 for <buildroot@lists.busybox.net>; Sun,  3 Dec 2023 21:24:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DB90C818A7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lc1X46vXy5gk for <buildroot@lists.busybox.net>;
 Sun,  3 Dec 2023 21:24:02 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0F43F817A6
 for <buildroot@buildroot.org>; Sun,  3 Dec 2023 21:24:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0F43F817A6
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EC314878CC; Sun,  3 Dec 2023 21:24:01 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 3 Dec 2023 22:04:16 +0100
X-Git-Refname: refs/heads/2023.08.x
X-Git-Oldrev: 758b7799cad728c2ab4707e0f29f73f93f93b8d1
X-Git-Newrev: 275d74bd64593ba1d10af458c410a0015cbfcb24
X-Patchwork-Hint: ignore
Message-Id: <20231203212401.EC314878CC@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.08.x] package/putty: fix static
 build
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

commit: https://git.buildroot.net/buildroot/commit/?id=275d74bd64593ba1d10af458c410a0015cbfcb24
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.08.x

Fix the following static build failure raised since bump to version 0.78
in commit 5673ea3ce4d4dd721bb17fc8d5b1283f5c1080b4:

In file included from /home/buildroot/autobuild/instance-0/output-1/build/putty-0.78/putty.h:8,
                 from /home/buildroot/autobuild/instance-0/output-1/build/putty-0.78/callback.c:8:
/home/buildroot/autobuild/instance-0/output-1/build/putty-0.78/unix/platform.h:11:10: fatal error: dlfcn.h: No such file or directory
   11 | #include <dlfcn.h>                     /* Dynamic library loading */
      |          ^~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/06f0b14bd0414f97b06070198e290fb3253348c5

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 3d8e0a263f277ca113b78b1f283292c418528c11)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/putty/putty.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/putty/putty.mk b/package/putty/putty.mk
index 82b7464bb4..c79917dac0 100644
--- a/package/putty/putty.mk
+++ b/package/putty/putty.mk
@@ -17,4 +17,8 @@ else ifeq ($(BR2_PACKAGE_LIBGTK2),y)
 PUTTY_DEPENDENCIES += libgtk2
 endif
 
+ifeq ($(BR2_STATIC_LIBS),y)
+PUTTY_CONF_OPTS += -DCMAKE_C_FLAGS="$(TARGET_CFLAGS) -DNO_LIBDL"
+endif
+
 $(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

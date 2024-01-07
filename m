Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A21C0C47073
	for <buildroot@archiver.kernel.org>; Sun,  7 Jan 2024 22:45:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5D4F36074C;
	Sun,  7 Jan 2024 22:45:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5D4F36074C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tnNqxOtarokh; Sun,  7 Jan 2024 22:45:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AFF7C60672;
	Sun,  7 Jan 2024 22:45:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AFF7C60672
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 34E5E1BF33F
 for <buildroot@lists.busybox.net>; Sun,  7 Jan 2024 22:44:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 65EF160EC8
 for <buildroot@lists.busybox.net>; Sun,  7 Jan 2024 22:44:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 65EF160EC8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oBCJK1OVHnve for <buildroot@lists.busybox.net>;
 Sun,  7 Jan 2024 22:44:12 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id A57CF60ECE
 for <buildroot@buildroot.org>; Sun,  7 Jan 2024 22:44:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A57CF60ECE
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9039D84A21; Sun,  7 Jan 2024 22:44:12 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 7 Jan 2024 23:40:00 +0100
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 4aedd5f93b9bae6802c665593bb521633740b5f9
X-Git-Newrev: d2f9e1ea5259a14e1d0447b7a2dfbcb1e382f674
X-Patchwork-Hint: ignore
Message-Id: <20240107224412.9039D84A21@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/putty: fix static
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

commit: https://git.buildroot.net/buildroot/commit/?id=d2f9e1ea5259a14e1d0447b7a2dfbcb1e382f674
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

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
index d3c8d923f0..529edd51c8 100644
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

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C9E0C47074
	for <buildroot@archiver.kernel.org>; Sun,  7 Jan 2024 22:44:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BAA8160EC8;
	Sun,  7 Jan 2024 22:44:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BAA8160EC8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id g6nYD2UBLIGA; Sun,  7 Jan 2024 22:44:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 14AA260ED2;
	Sun,  7 Jan 2024 22:44:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 14AA260ED2
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8BAC61BF870
 for <buildroot@lists.busybox.net>; Sun,  7 Jan 2024 22:44:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6609B41499
 for <buildroot@lists.busybox.net>; Sun,  7 Jan 2024 22:44:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6609B41499
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bgPNduCHlCO7 for <buildroot@lists.busybox.net>;
 Sun,  7 Jan 2024 22:44:12 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id AB31F409B3
 for <buildroot@buildroot.org>; Sun,  7 Jan 2024 22:44:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AB31F409B3
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 98CD684905; Sun,  7 Jan 2024 22:44:12 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 7 Jan 2024 23:40:12 +0100
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: d2f9e1ea5259a14e1d0447b7a2dfbcb1e382f674
X-Git-Newrev: 02c3ce317a5bab9fe1426eec3d534174fcb5612c
X-Patchwork-Hint: ignore
Message-Id: <20240107224412.98CD684905@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/putty: disable
 gssapi
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

commit: https://git.buildroot.net/buildroot/commit/?id=02c3ce317a5bab9fe1426eec3d534174fcb5612c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

PUTTY_GSSAPI is enabled by default resulting in the following build
failure since bump to version 0.78 in commit
5673ea3ce4d4dd721bb17fc8d5b1283f5c1080b4:

 /home/fabrice/buildroot/output/build/putty-0.79/unix/gss.c:133:10: fatal error: gssapi/gssapi.h: No such file or directory
  133 | #include <gssapi/gssapi.h>
      |          ^~~~~~~~~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/d6d06b5aa0df070c3880399e044fb3cd3a830aec

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 499b4d6d22a704adf65d1db0808952ad386ee1a0)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/putty/putty.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/putty/putty.mk b/package/putty/putty.mk
index 529edd51c8..4c9164d05e 100644
--- a/package/putty/putty.mk
+++ b/package/putty/putty.mk
@@ -10,6 +10,7 @@ PUTTY_LICENSE = MIT
 PUTTY_LICENSE_FILES = LICENCE
 PUTTY_CPE_ID_VENDOR = putty
 PUTTY_DEPENDENCIES = host-pkgconf
+PUTTY_CONF_OPTS = -DPUTTY_GSSAPI=OFF
 
 ifeq ($(BR2_PACKAGE_LIBGTK3),y)
 PUTTY_DEPENDENCIES += libgtk3
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

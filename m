Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43A9CC47DD9
	for <buildroot@archiver.kernel.org>; Wed, 28 Feb 2024 16:43:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EF15F60EAC;
	Wed, 28 Feb 2024 16:43:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PPq7MkMH6L1d; Wed, 28 Feb 2024 16:43:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 99AFE60E89
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 99AFE60E89;
	Wed, 28 Feb 2024 16:43:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D38DE1BF2B3
 for <buildroot@lists.busybox.net>; Wed, 28 Feb 2024 16:43:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C1DAA825E8
 for <buildroot@lists.busybox.net>; Wed, 28 Feb 2024 16:43:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id or2rASLGPw-h for <buildroot@lists.busybox.net>;
 Wed, 28 Feb 2024 16:43:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 12949825B9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 12949825B9
 for <buildroot@buildroot.org>; Wed, 28 Feb 2024 16:43:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F3FEC87BD8; Wed, 28 Feb 2024 16:43:37 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 28 Feb 2024 17:20:38 +0100
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 0617a0191a515edfa72fb4aaba185bd33ea2d691
X-Git-Newrev: 05292fbfdba2b1a8897e1ea94e8277ca6abc9a60
X-Patchwork-Hint: ignore
Message-Id: <20240228164337.F3FEC87BD8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/webkitgtk: make
 gbm support optional
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

commit: https://git.buildroot.net/buildroot/commit/?id=05292fbfdba2b1a8897e1ea94e8277ca6abc9a60
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

This was added upstream in commit:

https://github.com/WebKit/WebKit/commit/22e4c0386605d84f42f2d46fd20bdc46e3078498

The 'USE_OPENGL_OR_ES' flag is default ON, which will enable 'USE_GBM',
so ensure that we unset 'USE_GBM' if we don't have libgbm.

Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
Tested-by: Adrian Perez de Castro <aperez@igalia.com>
Acked-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit c06c0197f95c3ae3408469f7e0702a00d788feb6)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/webkitgtk/webkitgtk.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/webkitgtk/webkitgtk.mk b/package/webkitgtk/webkitgtk.mk
index 4a3f9e61c1..b14a4d16ce 100644
--- a/package/webkitgtk/webkitgtk.mk
+++ b/package/webkitgtk/webkitgtk.mk
@@ -86,6 +86,13 @@ else
 WEBKITGTK_CONF_OPTS += -DENABLE_GLES2=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_HAS_LIBGBM),y)
+WEBKITGTK_CONF_OPTS += -DUSE_GBM=ON
+WEBKITGTK_DEPENDENCIES += libgbm
+else
+WEBKITGTK_CONF_OPTS += -DUSE_GBM=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_LIBGTK3_X11),y)
 WEBKITGTK_CONF_OPTS += -DENABLE_X11_TARGET=ON
 WEBKITGTK_DEPENDENCIES += libgl \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

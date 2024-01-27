Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E12E6C46CD2
	for <buildroot@archiver.kernel.org>; Sat, 27 Jan 2024 16:34:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7950A401F1;
	Sat, 27 Jan 2024 16:34:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7950A401F1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3Et5feZbm80e; Sat, 27 Jan 2024 16:34:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 72797408C9;
	Sat, 27 Jan 2024 16:34:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 72797408C9
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 33C321BF23B
 for <buildroot@lists.busybox.net>; Sat, 27 Jan 2024 16:34:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0D86983B3B
 for <buildroot@lists.busybox.net>; Sat, 27 Jan 2024 16:34:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0D86983B3B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0R_hfUoKDxyF for <buildroot@lists.busybox.net>;
 Sat, 27 Jan 2024 16:34:29 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 53C9283A92
 for <buildroot@buildroot.org>; Sat, 27 Jan 2024 16:34:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 53C9283A92
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3CCB5864CD; Sat, 27 Jan 2024 16:34:29 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 27 Jan 2024 17:31:48 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b9c0e48f68ffb3ffa5ffc9d23edafc89c6a4d41f
X-Git-Newrev: c06c0197f95c3ae3408469f7e0702a00d788feb6
X-Patchwork-Hint: ignore
Message-Id: <20240127163429.3CCB5864CD@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/webkitgtk: make gbm support
 optional
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

commit: https://git.buildroot.net/buildroot/commit/?id=c06c0197f95c3ae3408469f7e0702a00d788feb6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This was added upstream in commit:

https://github.com/WebKit/WebKit/commit/22e4c0386605d84f42f2d46fd20bdc46e3078498

The 'USE_OPENGL_OR_ES' flag is default ON, which will enable 'USE_GBM',
so ensure that we unset 'USE_GBM' if we don't have libgbm.

Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
Tested-by: Adrian Perez de Castro <aperez@igalia.com>
Acked-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/webkitgtk/webkitgtk.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/webkitgtk/webkitgtk.mk b/package/webkitgtk/webkitgtk.mk
index cb7461ccbc..9c68fe73cf 100644
--- a/package/webkitgtk/webkitgtk.mk
+++ b/package/webkitgtk/webkitgtk.mk
@@ -88,6 +88,13 @@ else
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

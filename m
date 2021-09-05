Return-Path: <SRS0=j1wI=N3=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 399BEC433EF
	for <buildroot@archiver.kernel.org>; Sun,  5 Sep 2021 14:05:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 07A7660F21
	for <buildroot@archiver.kernel.org>; Sun,  5 Sep 2021 14:05:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 07A7660F21
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CC91D60709;
	Sun,  5 Sep 2021 14:04:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qFSK3MMtvhg9; Sun,  5 Sep 2021 14:04:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 39249605F6;
	Sun,  5 Sep 2021 14:04:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7D9681BF392
 for <buildroot@lists.busybox.net>; Sun,  5 Sep 2021 14:04:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6D5EC80D8E
 for <buildroot@lists.busybox.net>; Sun,  5 Sep 2021 14:04:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fuOYX_s2Mjys for <buildroot@lists.busybox.net>;
 Sun,  5 Sep 2021 14:04:42 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id AC8EE80D89
 for <buildroot@buildroot.org>; Sun,  5 Sep 2021 14:04:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 869E4885FF; Sun,  5 Sep 2021 14:03:18 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun, 5 Sep 2021 16:03:50 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8b8a61283383d832a660a4448b68f3f996904164
X-Git-Newrev: 2bc053c2b118b9d3de119a57dc9241b3ccdbebb9
X-Patchwork-Hint: ignore
Message-Id: <20210905140318.869E4885FF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/glslsandbox-player: bump to
 version v2021.08.24
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=2bc053c2b118b9d3de119a57dc9241b3ccdbebb9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changes since v2019.08.23:
- Some X11 improvements (fullscreen support)
- New EGL driver debug messages
- Wayland improvements (xdg_shell, fullscreen support)
- KMS/DRM/GBM improvements (use drmGetDevices2())
- Use eglGetPlatformDisplay() if available
- New "nullws" native windowing system
- License hash changed due to copyright date update

Fixes:
http://autobuild.buildroot.net/results/a950e90d5f8405534566df5c7a8875c293cf8845

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/glslsandbox-player/glslsandbox-player.hash | 4 ++--
 package/glslsandbox-player/glslsandbox-player.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/glslsandbox-player/glslsandbox-player.hash b/package/glslsandbox-player/glslsandbox-player.hash
index 66dac9354a..bc8946c62b 100644
--- a/package/glslsandbox-player/glslsandbox-player.hash
+++ b/package/glslsandbox-player/glslsandbox-player.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  3458294a50c3d2fd54f806e46dd7bfba5f1e6aedadd6c396c76d70793419432b  glslsandbox-player-2019.08.23.tar.gz
-sha256  06a79395e8f3a4cc7ad068c6b59dfbe12c0efa4d27791e532345ceb1f41aea8a  LICENSE
+sha256  b4af34889faa6d3a904e980f23aeb720dfb614d50aa01b9b1874fc2ae77dbcf4  glslsandbox-player-2021.08.24.tar.gz
+sha256  970d45d8a3dfd042d303008294f49db8c0c464f7687aa6e28a01b0926e74df85  LICENSE
diff --git a/package/glslsandbox-player/glslsandbox-player.mk b/package/glslsandbox-player/glslsandbox-player.mk
index 5ace69d7dd..341b939110 100644
--- a/package/glslsandbox-player/glslsandbox-player.mk
+++ b/package/glslsandbox-player/glslsandbox-player.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GLSLSANDBOX_PLAYER_VERSION = 2019.08.23
+GLSLSANDBOX_PLAYER_VERSION = 2021.08.24
 GLSLSANDBOX_PLAYER_SITE = $(call github,jolivain,glslsandbox-player,v$(GLSLSANDBOX_PLAYER_VERSION))
 GLSLSANDBOX_PLAYER_AUTORECONF = YES
 GLSLSANDBOX_PLAYER_DEPENDENCIES = libegl libgles host-pkgconf
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

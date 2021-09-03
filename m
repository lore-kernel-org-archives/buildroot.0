Return-Path: <SRS0=/NXK=NZ=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC8BFC433F5
	for <buildroot@archiver.kernel.org>; Fri,  3 Sep 2021 19:51:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7BECB60FD7
	for <buildroot@archiver.kernel.org>; Fri,  3 Sep 2021 19:51:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7BECB60FD7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2A0CD40146;
	Fri,  3 Sep 2021 19:51:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qw2EqobVx4M6; Fri,  3 Sep 2021 19:51:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1827A4020D;
	Fri,  3 Sep 2021 19:51:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 329221BF2F7
 for <buildroot@lists.busybox.net>; Fri,  3 Sep 2021 19:51:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 22203426A6
 for <buildroot@lists.busybox.net>; Fri,  3 Sep 2021 19:51:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Zl1XV2urAxf1 for <buildroot@lists.busybox.net>;
 Fri,  3 Sep 2021 19:51:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EA9E742559
 for <buildroot@buildroot.org>; Fri,  3 Sep 2021 19:51:29 +0000 (UTC)
Received: from b52572-12.ea.freescale.net.net (unknown [37.165.52.250])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 19DECB0051B;
 Fri,  3 Sep 2021 21:51:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1630698686;
 bh=PP4X4jot8HcB2vvWHAvM4CkoeO1jOJX/b27I7dgyiCc=;
 h=From:To:Cc:Subject:Date:From;
 b=q4AtN9vzuvm4Z0FO20TCJWYxe0FuodMmp3ZPnprX8vsntzod+DDXWEwcoUPuaq66R
 DiqOHWGrnqq1VODPFWRxNjki6zeBTLiHxKMYPxEh1ssl9Uk/b2pwYI8x6k07WuvXyX
 UoKSMs2BrvrTJywKQ3lY4d2CsqztPFXAjSeC8YOFVTfdPu5oOfRpiw3adtfY3gyOoa
 Htysavr8R83tpGlGTYHIoliFp6D8aD5zjEhF83syFcqo/Psgs8dJ3cgPcv+u7dXOjJ
 xdGWhHtWmJRw/OLwE7iqZ062ce3lvmJ3Qys52qmZ71YS1rE5FpY1Ta9G70IpD+wp4z
 sEw0FDq2RoOlQ==
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Fri,  3 Sep 2021 21:50:19 +0200
Message-Id: <20210903195021.11686-1-ju.o@free.fr>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/3] package/glslsandbox-player: bump to version
 v2021.08.24
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
Cc: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

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
-- 
2.31.1

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

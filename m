Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38EEBEB64DA
	for <buildroot@archiver.kernel.org>; Sun, 16 Jul 2023 14:14:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ADEED40910;
	Sun, 16 Jul 2023 14:14:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ADEED40910
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id A3HWjuRvkEoZ; Sun, 16 Jul 2023 14:14:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C7007408C4;
	Sun, 16 Jul 2023 14:14:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C7007408C4
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7BD411BF30F
 for <buildroot@lists.busybox.net>; Sun, 16 Jul 2023 14:14:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5DF9E408C4
 for <buildroot@lists.busybox.net>; Sun, 16 Jul 2023 14:14:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5DF9E408C4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YlQs1DmPlwR6 for <buildroot@lists.busybox.net>;
 Sun, 16 Jul 2023 14:14:15 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 41CD3408B5
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 41CD3408B5
 for <buildroot@buildroot.org>; Sun, 16 Jul 2023 14:14:15 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b341.dip0.t-ipconnect.de [84.161.179.65])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 83782A4C00B8;
 Sun, 16 Jul 2023 16:14:12 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:44438)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qL2Vo-0007Cx-0v;
 Sun, 16 Jul 2023 16:14:12 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 16 Jul 2023 16:14:12 +0200
Message-Id: <20230716141412.305840-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1689516852;
 bh=NbXobV+rY0plxfxnnt20FKIz08NiH5+X2TcDzN0M2MA=;
 h=From:To:Cc:Subject:Date:From;
 b=nN7YY9eOloQ5XWL9b7rdHb8sXOEyOwkZxzykRTcZgDV1hYXLY1L95knqJgsr1D2iq
 xYuA1YI09Zq4rj8k9N360osK8Ue04Op6y7QOVMA57VzEJjmw/KHDc6JecPcDicqGR4
 toH/YzzjkjADQqRb1pO5FA/vYYpH86lTdlid0Pefotejozklc5vcdVF3SJbPqvaD+C
 n353SpWbU5BNQsvUWqfImLNseQZ5XY7kDJIJCkHp4ugtNxV5xYJrfCotX/fZaOY4Iq
 nS5ITJzrJxamWdWlwzezg4V9aQS7TyfHGQb1U1bxHNeaueph/WcaVm9BLtZYmtc7gN
 rhM/FWpkV8RgQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=nN7YY9eO
Subject: [Buildroot] [PATCH 1/1] package/piglit: bump version
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
Cc: Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Disable Vulkan tests due to missing dependency libvulkan:
https://gitlab.freedesktop.org/mesa/piglit/-/commit/2519c330fba55ce6efd0dbee07aa67c703124d4f

Fixes python related build error:
AttributeError: module 'collections' has no attribute 'MutableMapping'

Fixes:
http://autobuild.buildroot.net/results/ed3/ed3c5806458efdb9db78732d3709e1d6ec441bcb/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/piglit/piglit.hash | 2 +-
 package/piglit/piglit.mk   | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/piglit/piglit.hash b/package/piglit/piglit.hash
index 923569a6f3..b10645c7a6 100644
--- a/package/piglit/piglit.hash
+++ b/package/piglit/piglit.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  ec2a80c49f10761980334f1591be54ee6f365165d7ac637270b4ca15a12ad674  piglit-2affee53f3ad7a96f5b397a2b6d6408af8a374b0-br1.tar.gz
+sha256  3505bbd3170cdb7cae0284613025ad31285e021fb4d09bcc6570ee05503b3314  piglit-ed58dfbd12be34fa3dab97a7a2987b890e0637f1-br1.tar.gz
 sha256  dcc398730859aee7cc1d6aa57f526f8d181b47bb3a49830e85b5723d5bc2c3bc  COPYING
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  licences/GPL-2
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  licences/GPL-3
diff --git a/package/piglit/piglit.mk b/package/piglit/piglit.mk
index 4d17405d10..da34d156ac 100644
--- a/package/piglit/piglit.mk
+++ b/package/piglit/piglit.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PIGLIT_VERSION = 2affee53f3ad7a96f5b397a2b6d6408af8a374b0
+PIGLIT_VERSION = ed58dfbd12be34fa3dab97a7a2987b890e0637f1
 PIGLIT_SITE = https://gitlab.freedesktop.org/mesa/piglit.git
 PIGLIT_SITE_METHOD = git
 PIGLIT_LICENSE = MIT (code), \
@@ -29,6 +29,7 @@ PIGLIT_DEPENDENCIES = host-pkgconf \
 PIGLIT_CONF_OPTS += \
 	-DPIGLIT_USE_WAFFLE=ON \
 	-DPIGLIT_BUILD_CL_TESTS=OFF \
+	-DPIGLIT_BUILD_VK_TESTS=OFF \
 	-DPIGLIT_BUILD_WGL_TESTS=OFF \
 	-DPYTHON_EXECUTABLE=$(HOST_DIR)/bin/python3
 
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

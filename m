Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 280DDCD8CA8
	for <buildroot@archiver.kernel.org>; Tue,  9 Jun 2026 13:05:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6CDB68598A;
	Tue,  9 Jun 2026 13:05:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TsRzwDb3C2Sv; Tue,  9 Jun 2026 13:05:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C40F08561F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781010310;
	bh=oiOv8Az3qZHi9DOks47ydQoF396amP5OZJAJLJOLlRE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=HNt5eoIF2LQWVHZPZIN+NrYt9N5JGczCHqoKHHRVT4Yv3ackFbIQoEN3stT7ltqWD
	 +x3kwiPeYLldIwgqBCxcuWw/yNDbGVcvAEQf8dnGb+2NYV7fAiHSTMFs+ZU7X1gJJS
	 qc87qkF08BaBlxrxhQzXnU7vmrzNEBADzoBvv2m/PXciLBPm23YpE3qaCr3vGiB7r/
	 FpKY56CZnTi71IoYC4oFBbeao/bNrp5NsIo20s3fYOsTINrFGA8sAFiRA3Az0VqTGK
	 ibOThIN413l+xIUQi0NDfmmLLNq3mNsT9zN15/VZCDNQZurktN/yh3gt1G+5nVKpyc
	 gFVhCOaGQrQew==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C40F08561F;
	Tue,  9 Jun 2026 13:05:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id E80B22EE
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:02:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D1D814272D
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1tBjEW6_9S2l for <buildroot@buildroot.org>;
 Tue,  9 Jun 2026 13:01:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2C698426FA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2C698426FA
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 68FC387E7E; Tue,  9 Jun 2026 13:01:24 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 30 May 2026 22:48:27 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1607ed75dbe6981bf2d270b30ed68136463c1b3e
X-Git-Newrev: ce9bbefb56b3d51b385455d3efb0cdad93f14117
X-Patchwork-Hint: ignore
Message-Id: <20260609130124.68FC387E7E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/stellarium: bump version to 26.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/ce9bbefb56b3d51b385455d3efb0cdad93f14117
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://stellarium.org/release/2026/04/05/stellarium-26.1.html

Added dependency to qt5svg needed since upstream commit
https://github.com/Stellarium/stellarium/commit/a5c374bfa314a75c19aa65cc758c68517ef608ad
which was added with this release.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/stellarium/Config.in       | 1 +
 package/stellarium/stellarium.hash | 6 +++---
 package/stellarium/stellarium.mk   | 3 ++-
 3 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/stellarium/Config.in b/package/stellarium/Config.in
index 566f8edc83..20f32e747a 100644
--- a/package/stellarium/Config.in
+++ b/package/stellarium/Config.in
@@ -12,6 +12,7 @@ config BR2_PACKAGE_STELLARIUM
 	select BR2_PACKAGE_QT5CHARTS
 	select BR2_PACKAGE_QT5LOCATION
 	select BR2_PACKAGE_QT5MULTIMEDIA
+	select BR2_PACKAGE_QT5SVG
 	select BR2_PACKAGE_ZLIB
 	help
 	  Stellarium is a free open source planetarium for your
diff --git a/package/stellarium/stellarium.hash b/package/stellarium/stellarium.hash
index 4298c3dcde..b3f2a9ec9f 100644
--- a/package/stellarium/stellarium.hash
+++ b/package/stellarium/stellarium.hash
@@ -1,8 +1,8 @@
 # From https://github.com/Stellarium/stellarium/releases
-sha256  e376e0dc28eae0f7c4b3686fed9c2129c69a87a371b33e24bd79559a5142d613  stellarium-25.4.tar.xz
-# From https://github.com/Stellarium/stellarium/blob/v25.4/CMakeLists.txt#L849
+sha256  578bada2531e39146ccefcf6a0d202867e403b559f54239e8db9f9c003e04443  stellarium-26.1.tar.xz
+# From https://github.com/Stellarium/stellarium/blob/v26.1/CMakeLists.txt#L858
 sha256  55d0111d48fb11883aaee91465e642b8b640775a4d6993c2d0e7a8092758ef21  release-0.5.2.tar.gz
-# From https://github.com/Stellarium/stellarium/blob/v25.4/plugins/LensDistortionEstimator/src/CMakeLists.txt
+# From https://github.com/Stellarium/stellarium/blob/v26.1/plugins/LensDistortionEstimator/src/CMakeLists.txt#L6
 sha256  6e899e297485e457ec1bf84844de29921aeef674f9d5caf60277df45dca6ff76  v2.9.0.tar.gz
 # Locally computed
 sha256  3aeeb5bb98bf7041ab82cffe15efa28ac58ee2bdf162b71301f5c192be631259  COPYING
diff --git a/package/stellarium/stellarium.mk b/package/stellarium/stellarium.mk
index 8d915b094f..52c219f5fb 100644
--- a/package/stellarium/stellarium.mk
+++ b/package/stellarium/stellarium.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-STELLARIUM_VERSION = 25.4
+STELLARIUM_VERSION = 26.1
 STELLARIUM_SOURCE = stellarium-$(STELLARIUM_VERSION).tar.xz
 STELLARIUM_SITE = https://github.com/Stellarium/stellarium/releases/download/v$(STELLARIUM_VERSION)
 STELLARIUM_LICENSE = GPL-2.0+
@@ -28,6 +28,7 @@ STELLARIUM_DEPENDENCIES = \
 	qt5charts \
 	qt5location \
 	qt5multimedia \
+	qt5svg \
 	zlib
 STELLARIUM_CONF_OPTS = \
 	-DENABLE_MEDIA=ON \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

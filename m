Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D97F1C04A68
	for <buildroot@archiver.kernel.org>; Wed, 27 Jul 2022 07:54:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 85DF6819ED;
	Wed, 27 Jul 2022 07:54:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 85DF6819ED
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iYQvHAC5s2RO; Wed, 27 Jul 2022 07:54:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 94013819B4;
	Wed, 27 Jul 2022 07:54:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 94013819B4
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 556FC1BF3A0
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 07:54:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2DF234099F
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 07:54:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2DF234099F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1O1txgVt1r93 for <buildroot@lists.busybox.net>;
 Wed, 27 Jul 2022 07:54:38 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 262364099D
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 07:54:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 262364099D
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 872798645F; Wed, 27 Jul 2022 07:40:52 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 27 Jul 2022 09:46:27 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 94ab3132cc232f70d1770bcf263e44d2cfa6f6ae
X-Git-Newrev: cda5dff3c1f985f62dc82e8061da31f4e56e3877
X-Patchwork-Hint: ignore
Message-Id: <20220727074052.872798645F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/moby-buildkit: support building as
 host package
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=cda5dff3c1f985f62dc82e8061da31f4e56e3877
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Users may want to use buildkitd and buildkitctl to build images on the host.

Adds package host-moby-buildkit and BR2_PACKAGE_HOST_MOBY_BUILDKIT.

Signed-off-by: Christian Stewart <christian@paral.in>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/Config.in.host                 | 1 +
 package/moby-buildkit/Config.in.host   | 8 ++++++++
 package/moby-buildkit/moby-buildkit.mk | 6 ++++++
 3 files changed, 15 insertions(+)

diff --git a/package/Config.in.host b/package/Config.in.host
index 8078a8304d..99edeafece 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -55,6 +55,7 @@ menu "Host utilities"
 	source "package/meson-tools/Config.in.host"
 	source "package/mfgtools/Config.in.host"
 	source "package/mkpasswd/Config.in.host"
+	source "package/moby-buildkit/Config.in.host"
 	source "package/mtd/Config.in.host"
 	source "package/mtools/Config.in.host"
 	source "package/mxsldr/Config.in.host"
diff --git a/package/moby-buildkit/Config.in.host b/package/moby-buildkit/Config.in.host
new file mode 100644
index 0000000000..a3b18548f8
--- /dev/null
+++ b/package/moby-buildkit/Config.in.host
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_HOST_MOBY_BUILDKIT
+	bool "host moby-buildkit"
+	depends on BR2_PACKAGE_HOST_GO_HOST_ARCH_SUPPORTS
+	help
+	  BuildKit is a toolkit for converting source code to build
+	  artifacts in an efficient expressive and repeatable manner.
+
+	  https://github.com/moby/buildkit
diff --git a/package/moby-buildkit/moby-buildkit.mk b/package/moby-buildkit/moby-buildkit.mk
index d34ff96252..667383bf50 100644
--- a/package/moby-buildkit/moby-buildkit.mk
+++ b/package/moby-buildkit/moby-buildkit.mk
@@ -19,4 +19,10 @@ MOBY_BUILDKIT_LDFLAGS = \
 
 MOBY_BUILDKIT_INSTALL_BINS = $(notdir $(MOBY_BUILDKIT_BUILD_TARGETS))
 
+HOST_MOBY_BUILDKIT_TAGS = cgo
+HOST_MOBY_BUILDKIT_BUILD_TARGETS = cmd/buildctl cmd/buildkitd
+
+HOST_MOBY_BUILDKIT_INSTALL_BINS = $(notdir $(HOST_MOBY_BUILDKIT_BUILD_TARGETS))
+
 $(eval $(golang-package))
+$(eval $(host-golang-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

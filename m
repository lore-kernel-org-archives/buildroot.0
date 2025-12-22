Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BF3DE6ADC7
	for <buildroot@archiver.kernel.org>; Mon, 22 Dec 2025 20:14:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E637460AE1;
	Mon, 22 Dec 2025 20:14:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fQZx3xesMVsg; Mon, 22 Dec 2025 20:14:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C82A060AD3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766434489;
	bh=W96Qi0c9SJtneaZ7th1qP0oBZHSd4wFhUFicpM3FW00=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=pwYYHAZJYFIi/8eMOjro4nnDBanHSc19vscKw1Qmd/crCyoMTQYZG5ZA9gPjsCtsx
	 8mupmxFhwdoRiI8ZA1mc223YNjDnK4kKVBW8zlqMbUZK8d4d88g5/jrOkwZV1pk/lf
	 S3B1A4apIGhJA45RbQm323AZ2gM9U+z4zTiu1K4ZQ5D9RBkx9GUg/Fo7rVc/dcw2at
	 Wfr71c9BijAI4e2enisGl3wzUb6S+lPaSGMDTpT2YSAdXLvAnF9+E+wfyWD32/70Ns
	 AkV1VzVpbWgo6Dzu3N+uVCW4635KDPW7FmpSIwJ+TM5EMnfifzjqRZPaJmrSh4GJgu
	 EBNxsMkXX1fKA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C82A060AD3;
	Mon, 22 Dec 2025 20:14:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2A8C7119
 for <buildroot@buildroot.org>; Mon, 22 Dec 2025 20:14:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0DA628228D
 for <buildroot@buildroot.org>; Mon, 22 Dec 2025 20:14:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XYBYo62nK_j2 for <buildroot@buildroot.org>;
 Mon, 22 Dec 2025 20:14:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EB29382240
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id EB29382240
 for <buildroot@buildroot.org>; Mon, 22 Dec 2025 20:14:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D940C875A9; Mon, 22 Dec 2025 20:14:45 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 22 Dec 2025 20:59:36 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3674e9f74c6487f4108ec09297b7a4f207c3b59f
X-Git-Newrev: c3f7f070e6a8750ba06e63574319902d6a9cbd42
X-Patchwork-Hint: ignore
Message-Id: <20251222201445.D940C875A9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/grout: bump to 0.14.2 version
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=c3f7f070e6a8750ba06e63574319902d6a9cbd42
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

See the release note of the new versions:
https://github.com/DPDK/grout/releases/tag/v0.14.0
https://github.com/DPDK/grout/releases/tag/v0.14.1
https://github.com/DPDK/grout/releases/tag/v0.14.2

Since v0.14.0, Grout uses the libmnl [1], the dependency are updated in
consequence. Grout also requires VRF support in the kernel, as it creates
a VRF on the Linux side to allow TCP/UDP termination by Linux
applications in different L3 domains. [2]

[1] https://github.com/DPDK/grout/commit/2eb97af1e8
[2] https://github.com/DPDK/grout/commit/391f9fa032

Signed-off-by: Maxime Leroy <maxime@leroys.fr>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/grout/Config.in  | 1 +
 package/grout/grout.hash | 2 +-
 package/grout/grout.mk   | 5 ++++-
 3 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/package/grout/Config.in b/package/grout/Config.in
index 7e6e34e07f..1cfec41d7a 100644
--- a/package/grout/Config.in
+++ b/package/grout/Config.in
@@ -13,6 +13,7 @@ config BR2_PACKAGE_GROUT
 	select BR2_PACKAGE_LIBEVENT
 	select BR2_PACKAGE_NUMACTL
 	select BR2_PACKAGE_LIBECOLI
+	select BR2_PACKAGE_LIBMNL
 	select BR2_PACKAGE_UTIL_LINUX
 	select BR2_PACKAGE_UTIL_LINUX_LIBSMARTCOLS
 	help
diff --git a/package/grout/grout.hash b/package/grout/grout.hash
index 248c375710..8c4a84cfe6 100644
--- a/package/grout/grout.hash
+++ b/package/grout/grout.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  6d1ba4fda3fec6cbc5d4f4d48fe2435fabd36b27540a439a01a44361f6998971  grout-0.13.0.tar.gz
+sha256  9b8ccf87c4d003dde276f904616f8ca61e4618cbedfd2d6e02fd39781713757c  grout-0.14.2.tar.gz
 sha256  1e412aae8da58b718c78b3d7a52eb547004384d4347e4746a22ca6af7522930c  licenses/BSD-3-clause.txt
diff --git a/package/grout/grout.mk b/package/grout/grout.mk
index 07ea585a01..7b0fbac4cf 100644
--- a/package/grout/grout.mk
+++ b/package/grout/grout.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GROUT_VERSION = 0.13.0
+GROUT_VERSION = 0.14.2
 GROUT_SITE = $(call github,DPDK,grout,v$(GROUT_VERSION))
 GROUT_LICENSE = BSD-3-Clause
 GROUT_LICENSE_FILES = licenses/BSD-3-clause.txt
@@ -16,12 +16,15 @@ GROUT_DEPENDENCIES = \
 	host-pkgconf \
 	dpdk \
 	libevent \
+	libmnl \
 	numactl \
 	libecoli \
 	util-linux
 
 define GROUT_LINUX_CONFIG_FIXUPS
 	$(call KCONFIG_ENABLE_OPT,CONFIG_TUN)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NET_L3_MASTER)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_VRF)
 endef
 
 $(eval $(meson-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

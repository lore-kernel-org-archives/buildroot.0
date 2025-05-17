Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C26E0C2D0CD
	for <buildroot@archiver.kernel.org>; Sat, 17 May 2025 17:16:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6537F405B7;
	Sat, 17 May 2025 17:16:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QKA78rKuA0gR; Sat, 17 May 2025 17:16:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7BAD540554
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7BAD540554;
	Sat, 17 May 2025 17:16:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id E7CB3E4
 for <buildroot@buildroot.org>; Sat, 17 May 2025 17:16:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E506080F38
 for <buildroot@buildroot.org>; Sat, 17 May 2025 17:16:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wkkmK0nlupg4 for <buildroot@buildroot.org>;
 Sat, 17 May 2025 17:16:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1A9CF80E51
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1A9CF80E51
 for <buildroot@buildroot.org>; Sat, 17 May 2025 17:16:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 08CC886FFD; Sat, 17 May 2025 17:16:56 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 17 May 2025 17:53:52 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9401eb80e7bf4e624c82dc6c9969089f7f054db2
X-Git-Newrev: 9869bae0f9cb662db96eb9a5a683a13123d201c1
X-Patchwork-Hint: ignore
Message-Id: <20250517171656.08CC886FFD@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/grout: bump to 0.10.0 version
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=9869bae0f9cb662db96eb9a5a683a13123d201c1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

See the release note of the new version:
https://github.com/DPDK/grout/releases/tag/v0.10.0

Libcap is not needed anymore for this new version, thus dependencies has
been updated in consequence.

Signed-off-by: Maxime Leroy <maxime@leroys.fr>
Reviewed-by: Vincent Jardin <vjardin@free.fr>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/grout/Config.in  | 3 +--
 package/grout/grout.hash | 2 +-
 package/grout/grout.mk   | 3 +--
 3 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/package/grout/Config.in b/package/grout/Config.in
index 4b3e89210f..0ebf772e51 100644
--- a/package/grout/Config.in
+++ b/package/grout/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_GROUT
 	bool "grout"
 	depends on BR2_PACKAGE_DPDK_ARCH_SUPPORTS # dpdk
 	depends on BR2_TOOLCHAIN_HAS_THREADS # dpdk
-	depends on BR2_USE_MMU # dpdk, numactl, libecoli, util-linux-smartcols, libcap
+	depends on BR2_USE_MMU # dpdk, numactl, libecoli, util-linux-smartcols
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # dpdk
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19 # dpdk
 	depends on BR2_TOOLCHAIN_USES_GLIBC # dpdk
@@ -10,7 +10,6 @@ config BR2_PACKAGE_GROUT
 	depends on !BR2_STATIC_LIBS # libecoli
 	depends on BR2_USE_WCHAR # libecoli
 	select BR2_PACKAGE_DPDK
-	select BR2_PACKAGE_LIBCAP
 	select BR2_PACKAGE_LIBEVENT
 	select BR2_PACKAGE_NUMACTL
 	select BR2_PACKAGE_LIBECOLI
diff --git a/package/grout/grout.hash b/package/grout/grout.hash
index 66b993efc4..388f600a73 100644
--- a/package/grout/grout.hash
+++ b/package/grout/grout.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  0470754b31922645177f4d15654fd345882fb6af4c415229b50b185eeeb8aa95  grout-0.9.1.tar.gz
+sha256  95918642f8bebcaa298bc4128a1522ad837ccfcf3f06b6d9979e0a62c76688d0  grout-0.10.0.tar.gz
 sha256  1e412aae8da58b718c78b3d7a52eb547004384d4347e4746a22ca6af7522930c  LICENSE
diff --git a/package/grout/grout.mk b/package/grout/grout.mk
index 3466f84865..228601dbec 100644
--- a/package/grout/grout.mk
+++ b/package/grout/grout.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GROUT_VERSION = 0.9.1
+GROUT_VERSION = 0.10.0
 GROUT_SITE = $(call github,DPDK,grout,v$(GROUT_VERSION))
 GROUT_LICENSE = BSD-3-Clause
 GROUT_LICENSE_FILES = LICENSE
@@ -15,7 +15,6 @@ GROUT_CONF_ENV = GROUT_VERSION=$(GROUT_VERSION)
 GROUT_DEPENDENCIES = \
 	host-pkgconf \
 	dpdk \
-	libcap \
 	libevent \
 	numactl \
 	libecoli \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

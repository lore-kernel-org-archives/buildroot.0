Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4267C71157
	for <buildroot@archiver.kernel.org>; Wed, 18 Jun 2025 20:22:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8220080BD3;
	Wed, 18 Jun 2025 20:22:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WrOm9yfLC9aY; Wed, 18 Jun 2025 20:22:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A4726811E5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A4726811E5;
	Wed, 18 Jun 2025 20:22:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id B739F16B
 for <buildroot@buildroot.org>; Wed, 18 Jun 2025 20:22:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B4A8340BA0
 for <buildroot@buildroot.org>; Wed, 18 Jun 2025 20:22:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y_aoslN-vLDx for <buildroot@buildroot.org>;
 Wed, 18 Jun 2025 20:22:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0553940BA1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0553940BA1
 for <buildroot@buildroot.org>; Wed, 18 Jun 2025 20:22:23 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EA8ED83EB4; Wed, 18 Jun 2025 20:22:22 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Wed, 18 Jun 2025 22:21:29 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2bf66daeeac07cf6bff018a2491c9db105219d17
X-Git-Newrev: cb5d3daf644395e0b31e09974fe2f47f130b4f7c
X-Patchwork-Hint: ignore
Message-Id: <20250618202222.EA8ED83EB4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/grout: bump to 0.10.3 version
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

commit: https://git.buildroot.net/buildroot/commit/?id=cb5d3daf644395e0b31e09974fe2f47f130b4f7c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

See the release note of the new version:
https://github.com/DPDK/grout/releases/tag/v0.10.3

Locale is not needed anymore for this new version, thus comment on
BR2_GENERATE_LOCALE has been removed in consequence.

Signed-off-by: Maxime Leroy <maxime@leroys.fr>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/grout/Config.in  | 2 --
 package/grout/grout.hash | 4 ++--
 package/grout/grout.mk   | 4 ++--
 3 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/package/grout/Config.in b/package/grout/Config.in
index 0ebf772e51..7e6e34e07f 100644
--- a/package/grout/Config.in
+++ b/package/grout/Config.in
@@ -18,8 +18,6 @@ config BR2_PACKAGE_GROUT
 	help
 	  Graph router based on DPDK
 
-	  NOTE: grout needs a working UTF-8 locale (BR2_GENERATE_LOCALE)
-
 comment "grout needs a glibc toolchain w/ dynamic library, threads, wchar, gcc >= 4.9, headers >= 4.19"
 	depends on BR2_USE_MMU
 	depends on BR2_PACKAGE_DPDK_ARCH_SUPPORTS
diff --git a/package/grout/grout.hash b/package/grout/grout.hash
index 388f600a73..063e518283 100644
--- a/package/grout/grout.hash
+++ b/package/grout/grout.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  95918642f8bebcaa298bc4128a1522ad837ccfcf3f06b6d9979e0a62c76688d0  grout-0.10.0.tar.gz
-sha256  1e412aae8da58b718c78b3d7a52eb547004384d4347e4746a22ca6af7522930c  LICENSE
+sha256  9e07275f7d97e9a02f29ac5df2112ca34a0af579e5435d8990ff6339ab30c3ef  grout-0.10.3.tar.gz
+sha256  1e412aae8da58b718c78b3d7a52eb547004384d4347e4746a22ca6af7522930c  licenses/BSD-3-clause.txt
diff --git a/package/grout/grout.mk b/package/grout/grout.mk
index 228601dbec..46d3cf5f0a 100644
--- a/package/grout/grout.mk
+++ b/package/grout/grout.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-GROUT_VERSION = 0.10.0
+GROUT_VERSION = 0.10.3
 GROUT_SITE = $(call github,DPDK,grout,v$(GROUT_VERSION))
 GROUT_LICENSE = BSD-3-Clause
-GROUT_LICENSE_FILES = LICENSE
+GROUT_LICENSE_FILES = licenses/BSD-3-clause.txt
 
 # Avoid using buildroot commit hash
 GROUT_CONF_ENV = GROUT_VERSION=$(GROUT_VERSION)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

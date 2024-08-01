Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47298C3DA4A
	for <buildroot@archiver.kernel.org>; Thu,  1 Aug 2024 21:05:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 05D6D80DAF;
	Thu,  1 Aug 2024 21:05:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kBxTjfkUhTu4; Thu,  1 Aug 2024 21:04:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1B6C880DD4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1B6C880DD4;
	Thu,  1 Aug 2024 21:04:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D60151BF3F0
 for <buildroot@lists.busybox.net>; Thu,  1 Aug 2024 21:04:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C301A40CE7
 for <buildroot@lists.busybox.net>; Thu,  1 Aug 2024 21:04:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yhCtCobbsPgd for <buildroot@lists.busybox.net>;
 Thu,  1 Aug 2024 21:04:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A912940CD7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A912940CD7
 for <buildroot@buildroot.org>; Thu,  1 Aug 2024 21:04:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0D629838D5; Thu,  1 Aug 2024 21:04:56 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 1 Aug 2024 23:01:04 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 345f48304b553b5aed92c6f5a8a56a160f7278c9
X-Git-Newrev: 99f65ecb6a16e75d92c3f88e4e01959a2948e4d9
X-Patchwork-Hint: ignore
Message-Id: <20240801210456.0D629838D5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/picocom: bump to version 2024-07
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

commit: https://git.buildroot.net/buildroot/commit/?id=99f65ecb6a16e75d92c3f88e4e01959a2948e4d9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This release adds support for no-MMU build.

Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/picocom/Config.in    | 1 -
 package/picocom/picocom.hash | 2 +-
 package/picocom/picocom.mk   | 9 +++++++--
 3 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/package/picocom/Config.in b/package/picocom/Config.in
index 6db71e1791..e2c34c0e72 100644
--- a/package/picocom/Config.in
+++ b/package/picocom/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_PICOCOM
 	bool "picocom"
-	depends on BR2_USE_MMU # fork()
 	help
 	  picocom is a minimal dumb-terminal emulation program. It is,
 	  in principle, very much like minicom, only it's pico instead
diff --git a/package/picocom/picocom.hash b/package/picocom/picocom.hash
index 8107f5633a..170de09cf4 100644
--- a/package/picocom/picocom.hash
+++ b/package/picocom/picocom.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  107d3e49e502ce63f826525f587826990451bcb39492efe2e0463dd62d64f3ea  picocom-2023-04.tar.gz
+sha256  4379de2ec591a5848123f37ccdbc7fbeee6dd3520ef1ce4119d84202fc268a17  picocom-2024-07.tar.gz
 sha256  9273c6b2c55be95f0f0df292d87e8900e5bfdf5b510a6ea09e80306cf45c10f6  LICENSE.txt
diff --git a/package/picocom/picocom.mk b/package/picocom/picocom.mk
index bb55c3c1d1..066a2a4f83 100644
--- a/package/picocom/picocom.mk
+++ b/package/picocom/picocom.mk
@@ -4,14 +4,19 @@
 #
 ################################################################################
 
-PICOCOM_VERSION = 2023-04
+PICOCOM_VERSION = 2024-07
 PICOCOM_SITE = $(call gitlab,wsakernel,picocom,$(PICOCOM_VERSION))
 PICOCOM_LICENSE = GPL-2.0+
 PICOCOM_LICENSE_FILES = LICENSE.txt
 PICOCOM_CPE_ID_VALID = YES
 
+ifeq ($(BR2_USE_MMU),)
+PICOCOM_CPPFLAGS += -DNO_FORK
+endif
+
 define PICOCOM_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)
+	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) \
+		EXTRA_CPPFLAGS="$(PICOCOM_CPPFLAGS)" $(MAKE) -C $(@D)
 endef
 
 define PICOCOM_INSTALL_TARGET_CMDS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

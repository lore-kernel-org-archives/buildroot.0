Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAA1AE784BE
	for <buildroot@archiver.kernel.org>; Sun, 28 Dec 2025 22:51:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7FBD9404BE;
	Sun, 28 Dec 2025 22:51:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hI_B7S3IxUf2; Sun, 28 Dec 2025 22:51:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A9903404C6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766962293;
	bh=fZAT9lCxlocJlXOCgkRZEZwecObHZkuor5N+FH6Uh8s=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=TEOOD6KwXVIUmNUoW2+PQdzl0RWN8OygvSTYB6EnB0FWMMlMbX9ILmxjfxg2zbCNu
	 1I+TmzbSqwxVvAJmT1gh4dRsz1AZG5JGlp2kam3F+eHx5rPvKzbcYUqOMrHQ/jswDw
	 VIgFe8O8xN/GVem4uh/Dwo34Ol3cllh3zjPmEncYLvOSQzjjS29iNgKi1w268gdye/
	 ou7leXDlCglcFCfHYcP4gfGHibBb5n+aQcrU5AdjVbPABXW7aGX3grcDmXnU5bPAmF
	 WeXcTTndkbjsYElw6Ru8Y1aM+LfQVk85VqpiJTaYmJ0LQKSaSeph972yY9Q9qSYdBI
	 sOGijgHie+6hA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A9903404C6;
	Sun, 28 Dec 2025 22:51:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 22897D8
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 22:51:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 09423404BA
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 22:51:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FnXacDHD2FB6 for <buildroot@buildroot.org>;
 Sun, 28 Dec 2025 22:51:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 279F740496
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 279F740496
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 22:51:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 15E8787A09; Sun, 28 Dec 2025 22:51:31 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 28 Dec 2025 23:48:54 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 34a1a42ab1ee218a1e99b21217d5f680d07f78b1
X-Git-Newrev: 4d5e0ccd8fe141c9cbda7137f84c93a834496e0b
X-Patchwork-Hint: ignore
Message-Id: <20251228225131.15E8787A09@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/odhcp6c: bump version to git
 f19dd37fb4
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

commit: https://git.buildroot.net/buildroot/commit/?id=4d5e0ccd8fe141c9cbda7137f84c93a834496e0b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Due to upstream commit
https://git.openwrt.org/?p=project/odhcp6c.git;a=commitdiff;h=adc651ffed55d4b538317e50da1a7ec143dbfd1d
libubox is a mandatory dependency.

Fixes:
https://autobuild.buildroot.net/results/22d/22da3760982b80d5ccba1bef1ca9c90e9b2292d8/
(cmake 4 build error which does not exist in a maintained stable branch)

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
[Julien: add git commit id in commit title]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/odhcp6c/Config.in    |  8 ++++++++
 package/odhcp6c/odhcp6c.hash |  2 +-
 package/odhcp6c/odhcp6c.mk   | 10 ++--------
 3 files changed, 11 insertions(+), 9 deletions(-)

diff --git a/package/odhcp6c/Config.in b/package/odhcp6c/Config.in
index ca3a2f6424..83b38755c3 100644
--- a/package/odhcp6c/Config.in
+++ b/package/odhcp6c/Config.in
@@ -1,8 +1,16 @@
 config BR2_PACKAGE_ODHCP6C
 	bool "odhcp6c"
 	depends on BR2_USE_MMU # fork()
+	depends on !BR2_STATIC_LIBS # libubox
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # libubox -> json-c
+	select BR2_PACKAGE_LIBUBOX
 	help
 	  odhcp6c is a minimal DHCPv6 and RA-client for use in
 	  embedded Linux systems, especially routers.
 
 	  https://git.openwrt.org/project/odhcp6c.git
+
+comment "odhcp6c needs a toolchain w/ dynamic library"
+	depends on BR2_USE_MMU
+	depends on BR2_STATIC_LIBS
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
diff --git a/package/odhcp6c/odhcp6c.hash b/package/odhcp6c/odhcp6c.hash
index f1641d7101..86c9c659c4 100644
--- a/package/odhcp6c/odhcp6c.hash
+++ b/package/odhcp6c/odhcp6c.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  c5cadd71a72e94df6b664d3e9f0b1eeffa779ba9624ab35b6a93c7172fe378a0  odhcp6c-53f07e90b7f1da6977143a488dd5cb73a33b233b-git4.tar.gz
+sha256  e9cfddfcc12c4ca0bf8d8211bb72c7018c0e0f8da6903d680da122b4ce551c56  odhcp6c-f19dd37fb467c9cf10cad57aefa0d048312d7dfd-git4.tar.gz
 sha256  e6d6a009505e345fe949e1310334fcb0747f28dae2856759de102ab66b722cb4  COPYING
diff --git a/package/odhcp6c/odhcp6c.mk b/package/odhcp6c/odhcp6c.mk
index dd3a9d3e28..92688b7237 100644
--- a/package/odhcp6c/odhcp6c.mk
+++ b/package/odhcp6c/odhcp6c.mk
@@ -4,11 +4,12 @@
 #
 ################################################################################
 
-ODHCP6C_VERSION = 53f07e90b7f1da6977143a488dd5cb73a33b233b
+ODHCP6C_VERSION = f19dd37fb467c9cf10cad57aefa0d048312d7dfd
 ODHCP6C_SITE = https://git.openwrt.org/project/odhcp6c.git
 ODHCP6C_SITE_METHOD = git
 ODHCP6C_LICENSE = GPL-2.0
 ODHCP6C_LICENSE_FILES = COPYING
+ODHCP6C_DEPENDENCIES = libubox
 
 define ODHCP6C_INSTALL_SCRIPT
 	$(INSTALL) -m 0755 -D $(@D)/odhcp6c-example-script.sh \
@@ -17,11 +18,4 @@ endef
 
 ODHCP6C_POST_INSTALL_TARGET_HOOKS += ODHCP6C_INSTALL_SCRIPT
 
-ifeq ($(BR2_PACKAGE_LIBUBOX),y)
-ODHCP6C_CONF_OPTS += -DUSE_LIBUBOX=1
-ODHCP6C_DEPENDENCIES += libubox
-else
-ODHCP6C_CONF_OPTS += -DUSE_LIBUBOX=0
-endif
-
 $(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

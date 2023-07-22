Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 062CAC001B0
	for <buildroot@archiver.kernel.org>; Sat, 22 Jul 2023 21:26:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AA5D08367C;
	Sat, 22 Jul 2023 21:26:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AA5D08367C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dXRZXEQczl1S; Sat, 22 Jul 2023 21:26:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8113E838B3;
	Sat, 22 Jul 2023 21:26:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8113E838B3
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4F61B1BF59F
 for <buildroot@lists.busybox.net>; Sat, 22 Jul 2023 21:26:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 28DB6405F9
 for <buildroot@lists.busybox.net>; Sat, 22 Jul 2023 21:26:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 28DB6405F9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id f93l2vie6FOB for <buildroot@lists.busybox.net>;
 Sat, 22 Jul 2023 21:26:50 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id EDEF640500
 for <buildroot@buildroot.org>; Sat, 22 Jul 2023 21:26:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EDEF640500
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DDB96821E8; Sat, 22 Jul 2023 21:26:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 22 Jul 2023 23:25:38 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ea3e60229bc5647e587685023de475276e28584d
X-Git-Newrev: 38f00e4935ec21059c4714518d2351a36da837bc
X-Patchwork-Hint: ignore
Message-Id: <20230722212649.DDB96821E8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/util-linux: bump version to 2.39.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=38f00e4935ec21059c4714518d2351a36da837bc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://mirrors.edge.kernel.org/pub/linux/utils/util-linux/v2.39/v2.39.1-ReleaseNotes

"The main objective of this maintenance release is to address bugs in libmount and
resolve the regression that occurred due to the v2.39 rewrite for the new kernel
mount interface."

It also fix a build issue with waitpid program when built with a toolchain
with headers < 5.3 detected in our gitlab-ci TestDockerCompose.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/4664846019

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/util-linux/Config.in       | 11 +++++++++++
 package/util-linux/util-linux.hash |  2 +-
 package/util-linux/util-linux.mk   |  3 ++-
 3 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/package/util-linux/Config.in b/package/util-linux/Config.in
index b5d8cad15b..be87494b35 100644
--- a/package/util-linux/Config.in
+++ b/package/util-linux/Config.in
@@ -436,6 +436,17 @@ config BR2_PACKAGE_UTIL_LINUX_VIPW
 	help
 	  Edit the password, group, shadow-password or shadow-group file
 
+config BR2_PACKAGE_UTIL_LINUX_WAITPID
+	bool "waitpid"
+	depends on BR2_USE_MMU # fork()
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_3 # pidfd_open
+	help
+	  Utility to wait for arbitrary processes
+
+comment "waitpid needs a toolchain w/ headers >= 5.3"
+	depends on BR2_USE_MMU
+	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_3
+
 config BR2_PACKAGE_UTIL_LINUX_WALL
 	bool "wall"
 	depends on BR2_USE_MMU # fork()
diff --git a/package/util-linux/util-linux.hash b/package/util-linux/util-linux.hash
index ab1807a287..7ecd165459 100644
--- a/package/util-linux/util-linux.hash
+++ b/package/util-linux/util-linux.hash
@@ -1,5 +1,5 @@
 # From https://mirrors.edge.kernel.org/pub/linux/utils/util-linux/v2.39/sha256sums.asc
-sha256  32b30a336cda903182ed61feb3e9b908b762a5e66fe14e43efb88d37162075cb  util-linux-2.39.tar.xz
+sha256  890ae8ff810247bd19e274df76e8371d202cda01ad277681b0ea88eeaa00286b  util-linux-2.39.1.tar.xz
 # License files, locally calculated
 sha256  64dfeae1519bf0e27563d905a71264310fb6a8fa74e5cf99bb36e4d30d7ef455  README.licensing
 sha256  9b718a9460fed5952466421235bc79eb49d4e9eacc920d7a9dd6285ab8fd6c6d  Documentation/licenses/COPYING.BSD-3-Clause
diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index 621e43ba79..bdb4fd6b90 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -8,7 +8,7 @@
 # util-linux-libs/util-linux-libs.mk needs to be updated accordingly as well.
 
 UTIL_LINUX_VERSION_MAJOR = 2.39
-UTIL_LINUX_VERSION = $(UTIL_LINUX_VERSION_MAJOR)
+UTIL_LINUX_VERSION = $(UTIL_LINUX_VERSION_MAJOR).1
 UTIL_LINUX_SOURCE = util-linux-$(UTIL_LINUX_VERSION).tar.xz
 UTIL_LINUX_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/util-linux/v$(UTIL_LINUX_VERSION_MAJOR)
 
@@ -184,6 +184,7 @@ UTIL_LINUX_CONF_OPTS += \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_UTMPDUMP),--enable-utmpdump,--disable-utmpdump) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_UUIDD),--enable-uuidd,--disable-uuidd) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_VIPW),--enable-vipw,--disable-vipw) \
+	$(if $(BR2_PACKAGE_UTIL_LINUX_WAITPID),--enable-waitpid,--disable-waitpid) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_WALL),--enable-wall,--disable-wall) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_WDCTL),--enable-wdctl,--disable-wdctl) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_WIPEFS),--enable-wipefs,--disable-wipefs) \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

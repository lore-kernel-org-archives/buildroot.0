Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43F32CCF9E3
	for <buildroot@archiver.kernel.org>; Sun,  2 Nov 2025 12:39:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0382A6F557;
	Sun,  2 Nov 2025 12:39:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pms4ru6JgHAL; Sun,  2 Nov 2025 12:39:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 72756615DC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 72756615DC;
	Sun,  2 Nov 2025 12:39:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id D5F432A3
 for <buildroot@buildroot.org>; Sun,  2 Nov 2025 12:39:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B4AEB40B21
 for <buildroot@buildroot.org>; Sun,  2 Nov 2025 12:39:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Twvz2_zY3oxy for <buildroot@buildroot.org>;
 Sun,  2 Nov 2025 12:39:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EE254408FA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id EE254408FA
 for <buildroot@buildroot.org>; Sun,  2 Nov 2025 12:39:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DCA6B839C0; Sun,  2 Nov 2025 12:39:30 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 2 Nov 2025 13:09:39 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5b8cd76e1ada85b4d98451cff0f703715a2eb122
X-Git-Newrev: 8b1d8dd25d39df120700666942278b1a99fef416
X-Patchwork-Hint: ignore
Message-Id: <20251102123930.DCA6B839C0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/clamav: bump version to 1.5.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=8b1d8dd25d39df120700666942278b1a99fef416
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://blog.clamav.net/2025/10/clamav-150-released.html
https://blog.clamav.net/2025/10/clamav-151-patch-version-published.html

Added variables to fix build errors:
https://gitlab.com/jolivain/buildroot/-/pipelines/2088905409

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/clamav/clamav.hash | 2 +-
 package/clamav/clamav.mk   | 6 +++++-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/package/clamav/clamav.hash b/package/clamav/clamav.hash
index 5f83d57661..807c8fc2ea 100644
--- a/package/clamav/clamav.hash
+++ b/package/clamav/clamav.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  d874cabf3d4765b35b518ef535658a1e6ec74802006a1d613f9f124aa1343210  clamav-1.4.3.tar.gz
+sha256  64fe4a16a5622c1d71efe9ed7f2c2fbd37f8f237da9f11ff66b73038df71db91  clamav-1.5.1.tar.gz
 sha256  0c4fd2fa9733fc9122503797648710851e4ee6d9e4969dd33fcbd8c63cd2f584  COPYING.txt
 sha256  d72a145c90918184a05ef65a04c9e6f7466faa59bc1b82c8f6a8ddc7ddcb9bed  COPYING/COPYING.bzip2
 sha256  dfb818a0d41411c6fb1c193c68b73018ceadd1994bda41ad541cbff292894bc6  COPYING/COPYING.file
diff --git a/package/clamav/clamav.mk b/package/clamav/clamav.mk
index 93ddfaae5b..bda714ea65 100644
--- a/package/clamav/clamav.mk
+++ b/package/clamav/clamav.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CLAMAV_VERSION = 1.4.3
+CLAMAV_VERSION = 1.5.1
 CLAMAV_SITE = https://www.clamav.net/downloads/production
 CLAMAV_LICENSE = GPL-2.0
 CLAMAV_LICENSE_FILES = \
@@ -45,6 +45,9 @@ CLAMAV_DEPENDENCIES += musl-fts
 CLAMAV_LIBS += -lfts
 endif
 
+CLAMAV_MAKE_OPTS = \
+	CROSS_COMPILE=$(TARGET_CROSS)
+
 CLAMAV_CONF_OPTS = \
 	-DCMAKE_EXE_LINKER_FLAGS="$(CLAMAV_LIBS)" \
 	-DCMAKE_SKIP_INSTALL_RPATH=ON \
@@ -54,6 +57,7 @@ CLAMAV_CONF_OPTS = \
 	-DENABLE_TESTS=OFF \
 	-DHAVE_SYSTEM_LFS_FTS=ON \
 	-DRUST_COMPILER_TARGET=$(RUSTC_TARGET_NAME) \
+	-DCARGO_HOME=$(HOST_DIR)/share/cargo \
 	-Dtest_run_result=ON \
 	-Dtest_run_result__TRYRUN_OUTPUT=ON
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

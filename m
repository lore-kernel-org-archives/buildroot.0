Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5008FCCD184
	for <buildroot@archiver.kernel.org>; Mon,  6 Oct 2025 20:47:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0604684135;
	Mon,  6 Oct 2025 20:47:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iiOuHHY8M-Jb; Mon,  6 Oct 2025 20:47:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0699984321
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0699984321;
	Mon,  6 Oct 2025 20:47:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 21341226
 for <buildroot@buildroot.org>; Mon,  6 Oct 2025 20:47:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 07B9B411DA
 for <buildroot@buildroot.org>; Mon,  6 Oct 2025 20:47:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RZbyWSBj9auM for <buildroot@buildroot.org>;
 Mon,  6 Oct 2025 20:47:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3C924411E2
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3C924411E2
 for <buildroot@buildroot.org>; Mon,  6 Oct 2025 20:47:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 209F1869B3; Mon,  6 Oct 2025 20:47:11 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 6 Oct 2025 22:41:46 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3c6440c1dd1f17e2ae8e084f79b6a1d549f7468d
X-Git-Newrev: d1780555445896ab07d2cba85f4bc4ad907efe75
X-Patchwork-Hint: ignore
Message-Id: <20251006204711.209F1869B3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libao: bump version to 1.2.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=d1780555445896ab07d2cba85f4bc4ad907efe75
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Added upstream patch to fix a missing include, autobuild did not record
any build errors but Arch Linux provides the patch:
https://gitlab.archlinux.org/archlinux/packaging/packages/libao/-/commit/bad3196d4e3030d31b01eb3bd41fff8afc8ca113

Switched to gitlab tarball because the previous site does not provide a
tarball for version 1.2.2 which was tagged in 2016:
https://gitlab.xiph.org/xiph/libao/-/tags/1.2.2

Added autoreconf due to usage of gitlab tarball which does not contain
a configure script.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...fix-missing-include-warning-for-nanosleep.patch | 27 ++++++++++++++++++++++
 package/libao/libao.hash                           |  6 ++---
 package/libao/libao.mk                             |  5 ++--
 3 files changed, 32 insertions(+), 6 deletions(-)

diff --git a/package/libao/0001-pulse-fix-missing-include-warning-for-nanosleep.patch b/package/libao/0001-pulse-fix-missing-include-warning-for-nanosleep.patch
new file mode 100644
index 0000000000..162eec730f
--- /dev/null
+++ b/package/libao/0001-pulse-fix-missing-include-warning-for-nanosleep.patch
@@ -0,0 +1,27 @@
+From 1f998f5d6d77674dad01b181811638578ad68242 Mon Sep 17 00:00:00 2001
+From: Tristan Matthews <tmatth@videolan.org>
+Date: Sun, 15 Jan 2017 12:15:07 -0500
+Subject: [PATCH] pulse: fix missing include warning for nanosleep
+
+Upstream: https://gitlab.xiph.org/xiph/libao/-/commit/1f998f5d6d77674dad01b181811638578ad68242
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ src/plugins/pulse/ao_pulse.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/plugins/pulse/ao_pulse.c b/src/plugins/pulse/ao_pulse.c
+index 9835273..2d10d57 100644
+--- a/src/plugins/pulse/ao_pulse.c
++++ b/src/plugins/pulse/ao_pulse.c
+@@ -30,6 +30,7 @@
+ #include <assert.h>
+ #include <string.h>
+ #include <signal.h>
++#include <time.h>
+ #include <limits.h>
+ 
+ #include <pulse/pulseaudio.h>
+-- 
+GitLab
+
diff --git a/package/libao/libao.hash b/package/libao/libao.hash
index 91c6bd11a7..70e6b4987e 100644
--- a/package/libao/libao.hash
+++ b/package/libao/libao.hash
@@ -1,5 +1,3 @@
-# From http://downloads.xiph.org/releases/ao/SHA256SUMS.txt
-sha256  03ad231ad1f9d64b52474392d63c31197b0bc7bd416e58b1c10a329a5ed89caf  libao-1.2.0.tar.gz
-
-# Hash for license file:
+# Locally computed
+sha256  df8a6d0e238feeccb26a783e778716fb41a801536fe7b6fce068e313c0e2bf4d  libao-1.2.2.tar.gz
 sha256  32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
diff --git a/package/libao/libao.mk b/package/libao/libao.mk
index 19a4c165c6..a9fd739ff3 100644
--- a/package/libao/libao.mk
+++ b/package/libao/libao.mk
@@ -4,13 +4,14 @@
 #
 ################################################################################
 
-LIBAO_VERSION = 1.2.0
-LIBAO_SITE = http://downloads.xiph.org/releases/ao
+LIBAO_VERSION = 1.2.2
+LIBAO_SITE = https://gitlab.xiph.org/xiph/libao/-/archive/$(LIBAO_VERSION)
 LIBAO_DEPENDENCIES = host-pkgconf
 LIBAO_INSTALL_STAGING = YES
 LIBAO_LICENSE = GPL-2.0+
 LIBAO_LICENSE_FILES = COPYING
 LIBAO_CPE_ID_VENDOR = xiph
+LIBAO_AUTORECONF = YES
 LIBAO_CONF_OPTS = \
 	--disable-esd \
 	--disable-wmm \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

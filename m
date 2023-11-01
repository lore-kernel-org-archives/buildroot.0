Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9435C4332F
	for <buildroot@archiver.kernel.org>; Wed,  1 Nov 2023 21:04:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 836DC4EEA5;
	Wed,  1 Nov 2023 21:04:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 836DC4EEA5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id H8bXffhFGZ6O; Wed,  1 Nov 2023 21:04:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6D7084EEB0;
	Wed,  1 Nov 2023 21:04:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6D7084EEB0
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C7E741BF335
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 21:04:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A21BB704F3
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 21:04:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A21BB704F3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0xGWW3zu8JLf for <buildroot@lists.busybox.net>;
 Wed,  1 Nov 2023 21:04:22 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C4DF8704F2
 for <buildroot@buildroot.org>; Wed,  1 Nov 2023 21:04:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C4DF8704F2
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B000286485; Wed,  1 Nov 2023 21:04:21 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 1 Nov 2023 21:56:32 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 30cb3d784c73d56e18eb294907b124053b2c37a0
X-Git-Newrev: 9c874557aa863d5282ca38b28a379730297496c8
X-Patchwork-Hint: ignore
Message-Id: <20231101210421.B000286485@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/nut: bump version to 2.8.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=9c874557aa863d5282ca38b28a379730297496c8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://github.com/networkupstools/nut/blob/master/NEWS.adoc

Removed patch which is included in this release.

Updated license hash due to upstream commit:
https://github.com/networkupstools/nut/commit/3b3773195082a95affab6ec1663c7937b1edce04

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .checkpackageignore                                |  1 -
 ...ents-upsclient-h-ensure-time_t-is-defined.patch | 35 ----------------------
 package/nut/nut.hash                               |  4 +--
 package/nut/nut.mk                                 |  2 +-
 4 files changed, 3 insertions(+), 39 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index fc2c2e1243..fb2d72de0c 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -976,7 +976,6 @@ package/ntp/S49ntp.in Variables
 package/ntpsec/0001-wscript-remove-checks-for-bsd-string.h-fixes-host-co.patch Upstream
 package/ntpsec/0002-wscript-fix-build-without-stack-protector.patch Upstream
 package/numactl/0001-link-with-latomic-if-needed-again.patch Upstream
-package/nut/0001-clients-upsclient-h-ensure-time_t-is-defined.patch Upstream
 package/nuttcp/0001-susv3-legacy.patch Upstream
 package/nvidia-driver/0001-use-LDFLAGS.patch Upstream
 package/octave/0001-Fix-BLAS-library-integer-size-detection.patch Upstream
diff --git a/package/nut/0001-clients-upsclient-h-ensure-time_t-is-defined.patch b/package/nut/0001-clients-upsclient-h-ensure-time_t-is-defined.patch
deleted file mode 100644
index c9fb04b8cd..0000000000
--- a/package/nut/0001-clients-upsclient-h-ensure-time_t-is-defined.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From cafd77993ec5e16634b774b65bf6da9b34a21fc5 Mon Sep 17 00:00:00 2001
-From: Jim Klimov <jimklimov+nut@gmail.com>
-Date: Wed, 31 Aug 2022 11:24:19 +0200
-Subject: [PATCH] clients/upsclient.h: ensure time_t is defined
-
-[Retrieved from:
-https://github.com/networkupstools/nut/commit/cafd77993ec5e16634b774b65bf6da9b34a21fc5]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- clients/upsclient.h | 12 ++++++++++++
- 1 file changed, 12 insertions(+)
-
-diff --git a/clients/upsclient.h b/clients/upsclient.h
-index 08574b8f8b..e346d8f519 100644
---- a/clients/upsclient.h
-+++ b/clients/upsclient.h
-@@ -41,6 +41,18 @@
- 	#include <limits.h>
- #endif
- 
-+/* Not including NUT timehead.h because this is part of end-user API */
-+#ifdef TIME_WITH_SYS_TIME
-+# include <sys/time.h>
-+# include <time.h>
-+#else
-+# ifdef HAVE_SYS_TIME_H
-+#  include <sys/time.h>
-+# else
-+#  include <time.h>
-+# endif
-+#endif
-+
- #ifdef __cplusplus
- /* *INDENT-OFF* */
- extern "C" {
diff --git a/package/nut/nut.hash b/package/nut/nut.hash
index 3dda340a1b..9cd5fcc8de 100644
--- a/package/nut/nut.hash
+++ b/package/nut/nut.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  c3e5a708da797b7c70b653d37b1206a000fcb503b85519fe4cdf6353f792bfe5  nut-2.8.0.tar.gz
-sha256  9f562d0e6be5108a06684dd249686d378abe1653df14b1944e971e084f6751f0  COPYING
+sha256  7da48ee23b1f0d8d72560bb0af84f5c5ae4dbe35452b84cb49840132e47f099c  nut-2.8.1.tar.gz
+sha256  8a3de48b86daffcbe822dd94e514c8a77fe70f77c9005ffd9dcf1709dbdc80c7  COPYING
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  LICENSE-GPL2
 sha256  fc82ca8b6fdb18d4e3e85cfd8ab58d1bcd3f1b29abe782895abd91d64763f8e7  LICENSE-GPL3
diff --git a/package/nut/nut.mk b/package/nut/nut.mk
index 4c322aeb85..c376ffb2e2 100644
--- a/package/nut/nut.mk
+++ b/package/nut/nut.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NUT_VERSION = 2.8.0
+NUT_VERSION = 2.8.1
 NUT_SITE = https://github.com/networkupstools/nut/releases/download/v$(NUT_VERSION)
 NUT_LICENSE = GPL-2.0+, GPL-3.0+ (python scripts), GPL/Artistic (perl client)
 NUT_LICENSE_FILES = COPYING LICENSE-GPL2 LICENSE-GPL3
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

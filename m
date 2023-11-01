Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 363F4C4332F
	for <buildroot@archiver.kernel.org>; Wed,  1 Nov 2023 18:22:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C240B70505;
	Wed,  1 Nov 2023 18:22:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C240B70505
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nDQR26m9EAId; Wed,  1 Nov 2023 18:22:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2208670508;
	Wed,  1 Nov 2023 18:22:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2208670508
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CC1821BF44A
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 18:22:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AD22A431F6
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 18:22:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AD22A431F6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BWp4BX4jTen2 for <buildroot@lists.busybox.net>;
 Wed,  1 Nov 2023 18:22:00 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0167C431CE
 for <buildroot@buildroot.org>; Wed,  1 Nov 2023 18:21:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0167C431CE
Received: from fli4l.lan.fli4l (p54a1b0b0.dip0.t-ipconnect.de [84.161.176.176])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 90801A4C0676;
 Wed,  1 Nov 2023 19:21:56 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:60778)
 by fli4l.lan.fli4l with esmtp (Exim 4.96.2)
 (envelope-from <bernd@kuhls.net>) id 1qyFqm-00052Q-02;
 Wed, 01 Nov 2023 19:21:56 +0100
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed,  1 Nov 2023 19:21:55 +0100
Message-Id: <20231101182155.62163-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1698862916;
 bh=u4DwG6l22pvI2WbqzebmoOn2PTWlGTaw/xoG4cwYYNg=;
 h=From:To:Cc:Subject:Date:From;
 b=gW/922gU0kkzsWAsLggaaowGCRjnDKXZL+DsUon9Qs8z+nU1botJNJBvwZNwP970c
 iL4Lbs/i4N34aCDcJmwzNCXif7fdoLNnEDyhC7Jy5lLU45lqAgGOPPlFoXW6VX8P0I
 H/ZOzyO/xpxrg9PT30rsPUOWfRF1asdXaeCir2yPvrTIzw+I+SPSzhksvmSfk7YiF0
 QaD7JdV7ILudn25WeNo7i114uW2UW1YYyvhIhoWuaeUFwIMkkPyr+F6FVE/+e+NlzB
 +wRhvnvs3+RMIf12VOxfd/c1gjOfZVPtzpMZYfJXGjr1zBvs4W6e5G5OsE/5Mzzg3s
 eWo5Vm/8sH5TA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=gW/922gU
Subject: [Buildroot] [PATCH 1/1] package/nut: bump version to 2.8.1
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes:
https://github.com/networkupstools/nut/blob/master/NEWS.adoc

Removed patch which is included in this release.

Updated license hash due to upstream commit:
https://github.com/networkupstools/nut/commit/3b3773195082a95affab6ec1663c7937b1edce04

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Regarding the license update I am unsure about how to reflect the
changes in NUT_LICENSE.

 .checkpackageignore                           |  1 -
 ...upsclient-h-ensure-time_t-is-defined.patch | 35 -------------------
 package/nut/nut.hash                          |  4 +--
 package/nut/nut.mk                            |  2 +-
 4 files changed, 3 insertions(+), 39 deletions(-)
 delete mode 100644 package/nut/0001-clients-upsclient-h-ensure-time_t-is-defined.patch

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
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

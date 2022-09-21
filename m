Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9835DECAAD8
	for <buildroot@archiver.kernel.org>; Wed, 21 Sep 2022 20:23:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 413B140573;
	Wed, 21 Sep 2022 20:23:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 413B140573
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iwLufaVg1YKM; Wed, 21 Sep 2022 20:23:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BAA3E4053C;
	Wed, 21 Sep 2022 20:23:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BAA3E4053C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9C9901BF34B
 for <buildroot@lists.busybox.net>; Wed, 21 Sep 2022 20:22:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 76ED182FE4
 for <buildroot@lists.busybox.net>; Wed, 21 Sep 2022 20:22:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 76ED182FE4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qVB_8o8kXf2w for <buildroot@lists.busybox.net>;
 Wed, 21 Sep 2022 20:22:40 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C664E83004
 for <buildroot@buildroot.org>; Wed, 21 Sep 2022 20:22:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C664E83004
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B395D85D81; Wed, 21 Sep 2022 20:22:40 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Wed, 21 Sep 2022 22:22:06 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8a501c958faff08980dead7b63e1de4552dfdc2c
X-Git-Newrev: d5649d5afdf4180de0170b627bf3eaa484513b51
X-Patchwork-Hint: ignore
Message-Id: <20220921202240.B395D85D81@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/hawktracer: bump to latest git
 commit
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=d5649d5afdf4180de0170b627bf3eaa484513b51
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop patch (merged upstream)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...orm_features.cmake-fix-DENABLE_CPU_USAGE_.patch | 38 ----------------------
 package/hawktracer/hawktracer.hash                 |  2 +-
 package/hawktracer/hawktracer.mk                   |  2 +-
 3 files changed, 2 insertions(+), 40 deletions(-)

diff --git a/package/hawktracer/0001-cmake-platform_features.cmake-fix-DENABLE_CPU_USAGE_.patch b/package/hawktracer/0001-cmake-platform_features.cmake-fix-DENABLE_CPU_USAGE_.patch
deleted file mode 100644
index 5c8e6e9e65..0000000000
--- a/package/hawktracer/0001-cmake-platform_features.cmake-fix-DENABLE_CPU_USAGE_.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From 65e78e2b972e2fab76b18732941ae611ec782dee Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Fri, 12 Aug 2022 14:51:33 +0200
-Subject: [PATCH] cmake/platform_features.cmake: fix
- -DENABLE_CPU_USAGE_FEATURE=OFF
-
-Fix -DENABLE_CPU_USAGE_FEATURE=OFF to allow the user to disable
-CPU_USAGE and avoid the following build failure without threads:
-
-/home/giuliobenetti/autobuild/run/instance-2/output-1/build/hawktracer-e53b07bc812c4cfe8f6253ddb48ac43de8fa74a8/lib/platform/linux/cpu_usage.c:5:10: fatal error: pthread.h: No such file or directory
-    5 | #include <pthread.h>
-      |          ^~~~~~~~~~~
-
-Fixes:
- - http://autobuild.buildroot.org/results/7edc29e21e441e66ad7c4df1673e506950930913
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/amzn/hawktracer/pull/86]
----
- cmake/platform_features.cmake | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/cmake/platform_features.cmake b/cmake/platform_features.cmake
-index 1abbd41..8d7cfd9 100644
---- a/cmake/platform_features.cmake
-+++ b/cmake/platform_features.cmake
-@@ -18,7 +18,7 @@ macro(_validate_feature_enabled FEATURE_NAME VARIABLE)
- endmacro(_validate_feature_enabled)
- 
- macro(define_platform_feature FEATURE_NAME FEATURE_DEFAULT_FILE DEFAULT_ENABLE)
--    if (NOT "${DEFAULT_ENABLE}" STREQUAL "OFF" OR "${ENABLE_${FEATURE_NAME}_FEATURE}" STREQUAL "ON")
-+    if (NOT "${DEFAULT_ENABLE}" STREQUAL "OFF" AND NOT "${ENABLE_${FEATURE_NAME}_FEATURE}" STREQUAL "OFF")
-         set(OPTION_VALUE ON)
-     else()
-         set(OPTION_VALUE OFF)
--- 
-2.35.1
-
diff --git a/package/hawktracer/hawktracer.hash b/package/hawktracer/hawktracer.hash
index 87aa67c4b6..47a8b35b6b 100644
--- a/package/hawktracer/hawktracer.hash
+++ b/package/hawktracer/hawktracer.hash
@@ -1,3 +1,3 @@
 # Computed locally
-sha256  b6c7fdfbe8178bc7ba49ef840ec18a92d1488ad73ac9f64d2a09042410ad3ef4  hawktracer-e53b07bc812c4cfe8f6253ddb48ac43de8fa74a8.tar.gz
+sha256  a48e26082fd644222d4a20ecfd5a34700865cf572d41b7eac5b0c8242fef9c5f  hawktracer-2ec19d71923344148928ef45fce549eda67030a4.tar.gz
 sha256  2f377333e64ad08ad3afec8ed6c2c96ced2a6d7d67443eb2784a931bb7b3fd59  LICENSE
diff --git a/package/hawktracer/hawktracer.mk b/package/hawktracer/hawktracer.mk
index a14e2e2528..fd635e350d 100644
--- a/package/hawktracer/hawktracer.mk
+++ b/package/hawktracer/hawktracer.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HAWKTRACER_VERSION = e53b07bc812c4cfe8f6253ddb48ac43de8fa74a8
+HAWKTRACER_VERSION = 2ec19d71923344148928ef45fce549eda67030a4
 HAWKTRACER_SITE = $(call github,amzn,hawktracer,$(HAWKTRACER_VERSION))
 HAWKTRACER_LICENSE = MIT
 HAWKTRACER_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

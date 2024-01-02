Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77BD4C46CD2
	for <buildroot@archiver.kernel.org>; Tue,  2 Jan 2024 22:20:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1DD8640A93;
	Tue,  2 Jan 2024 22:20:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1DD8640A93
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id s5gP_jQYe2y4; Tue,  2 Jan 2024 22:20:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7C38B40A7B;
	Tue,  2 Jan 2024 22:20:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7C38B40A7B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C85A51BF276
 for <buildroot@lists.busybox.net>; Tue,  2 Jan 2024 22:20:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E9332416CC
 for <buildroot@lists.busybox.net>; Tue,  2 Jan 2024 22:20:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E9332416CC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7jwdquOdM1ko for <buildroot@lists.busybox.net>;
 Tue,  2 Jan 2024 22:20:00 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 22310416D3
 for <buildroot@buildroot.org>; Tue,  2 Jan 2024 22:20:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 22310416D3
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 10BD383D89; Tue,  2 Jan 2024 22:20:00 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 2 Jan 2024 23:18:36 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3a10a8bf45a5f83d624aed5cc772e21a267a50ae
X-Git-Newrev: d0a27c030af11b6dcaea06f20a1a2d6e8f72ce55
X-Patchwork-Hint: ignore
Message-Id: <20240102222000.10BD383D89@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/iperf: bump to version 2.1.9
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

commit: https://git.buildroot.net/buildroot/commit/?id=d0a27c030af11b6dcaea06f20a1a2d6e8f72ce55
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Update site to use https instead of http because of HSTS
- Drop patch (already in version)

https://sourceforge.net/projects/iperf2/files/

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .checkpackageignore                                |  1 -
 ...0001-fix-single-threaded-compile-breakage.patch | 32 ----------------------
 package/iperf/iperf.hash                           |  4 +--
 package/iperf/iperf.mk                             |  4 +--
 4 files changed, 4 insertions(+), 37 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 5ff39e6f37..40d9fb1ed4 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -564,7 +564,6 @@ package/intel-mediasdk/0001-Don-t-force-fstack-protector.patch Upstream
 package/intltool/0001-perl-5.26-compatibility.patch Upstream
 package/iotop/0001-Fix-build-error-with-Python-3.patch Upstream
 package/iozone/0001-Add-new-targets-for-iozone.patch Upstream
-package/iperf/0001-fix-single-threaded-compile-breakage.patch Upstream
 package/ipmitool/0001-configure.ac-fix-readline-static-build.patch Upstream
 package/ipmitool/0002-Fix-enterprise-numbers-URL.patch Upstream
 package/ipmitool/0003-Do-not-require-the-IANA-PEN-registry-file.patch Upstream
diff --git a/package/iperf/0001-fix-single-threaded-compile-breakage.patch b/package/iperf/0001-fix-single-threaded-compile-breakage.patch
deleted file mode 100644
index 85baf76ea4..0000000000
--- a/package/iperf/0001-fix-single-threaded-compile-breakage.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 6405b7a005bb2364466b56f480d50af0be423d76 Mon Sep 17 00:00:00 2001
-From: Robert McMahon <rjmcmahon@rjmcmahon.com>
-Date: Tue, 27 Sep 2022 20:31:04 -0700
-Subject: [PATCH] fix single threaded compile breakage
-
-[Retrieved (and backported) from:
-https://sourceforge.net/p/iperf2/code/ci/6405b7a005bb2364466b56f480d50af0be423d76]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- include/version.h | 2 +-
- src/Settings.cpp  | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/src/Settings.cpp b/src/Settings.cpp
-index aac1b5f..fc5a181 100644
---- a/src/Settings.cpp
-+++ b/src/Settings.cpp
-@@ -1160,10 +1160,10 @@ void Settings_Interpret (char option, const char *optarg, struct thread_Settings
- 			delete [] tmp;
- 		    }
- 		}
-+	    }
- #else
- 		fprintf(stderr, "bounceback-congest option requires a platform that supports threads\n");
- #endif
--	    }
- 	}
- 	if (bouncebackdelaystart) {
- 	    bouncebackdelaystart = 0;
--- 
-2.35.1
-
diff --git a/package/iperf/iperf.hash b/package/iperf/iperf.hash
index 34218bcf3b..eb6088649d 100644
--- a/package/iperf/iperf.hash
+++ b/package/iperf/iperf.hash
@@ -1,6 +1,6 @@
 # From https://sourceforge.net/projects/iperf2/files/
-sha1  7725efffc6ef46fe5247ee326c39e5fa2eadf1eb  iperf-2.1.8.tar.gz
+sha1  e7b669c2e8747df95b59956e83ff53d3971d7a5f  iperf-2.1.9.tar.gz
 
 # Locally computed:
-sha256  8e2cf2fbc9d0d4d1cf9d109b1e328459f9622993dc9a4c5a7dc8a2088fb7beaf  iperf-2.1.8.tar.gz
+sha256  5c0771aab00ef14520013aef01675977816e23bb8f5d9fde016f90eb2f1be788  iperf-2.1.9.tar.gz
 sha256  5f9f5c4feca3347c3b3c0ada8b16b4e6b698aac4e6f016a24adf61a5915336d1  COPYING
diff --git a/package/iperf/iperf.mk b/package/iperf/iperf.mk
index 47944880a3..1347f766d1 100644
--- a/package/iperf/iperf.mk
+++ b/package/iperf/iperf.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-IPERF_VERSION = 2.1.8
-IPERF_SITE = http://downloads.sourceforge.net/project/iperf2
+IPERF_VERSION = 2.1.9
+IPERF_SITE = https://downloads.sourceforge.net/project/iperf2
 IPERF_LICENSE = MIT-like
 IPERF_LICENSE_FILES = COPYING
 IPERF_CPE_ID_VENDOR = iperf2_project
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

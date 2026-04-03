Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08A10E8538B
	for <buildroot@archiver.kernel.org>; Fri,  3 Apr 2026 17:54:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CA43B827AA;
	Fri,  3 Apr 2026 17:54:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Yiyg1RLtGwws; Fri,  3 Apr 2026 17:54:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6DAC08329E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775238856;
	bh=L2YxVS0bqFdOEkkQKpVy394k+fnANsLuyf/XDNF33K4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Fmc3pk1+RRJsSakKHHqAU0AhDEKTYJvcdFeXh2GEwwV77chMoqxZjxPcoZFyYK3xe
	 wGU7n/mIJFUkazG8GHY8WqmkFa1wTh19bo8rG4BFmKHK319OCsWJOJ9UKK0YOcf3Eq
	 iTbfOiqi258FpcLla64RAhpHr1IJBJv3CNvwehE5kW+jugPbXODekYAZzk9KJhe6Tz
	 TOAydKnM3OYs4wj0H4sXLBQZWCpS23ncggS7KiMX5wGnmpkqBqyjIIWSavaMjoy8Fu
	 NPn3x1ldKLZVpYuf749B/4TUsKK9LvARxuTpU1SRAPpNPpm90y/VkbxuNiCAZufIOV
	 RJgqvVMOUSvOg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6DAC08329E;
	Fri,  3 Apr 2026 17:54:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4AE711A9
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 17:54:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3CDFC411FE
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 17:54:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iXvZDIQXfuZS for <buildroot@buildroot.org>;
 Fri,  3 Apr 2026 17:54:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5807640B56
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5807640B56
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 17:54:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C80D9801DE; Fri,  3 Apr 2026 17:54:13 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 3 Apr 2026 19:51:14 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d6a06ef2af694809f311538a807e2c000e1c5fdb
X-Git-Newrev: ce8f905bac2184bdfc466b072d2e5cc5bbd1e149
X-Patchwork-Hint: ignore
Message-Id: <20260403175413.C80D9801DE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/openscap: bump to version 1.4.3
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
Content-Type: multipart/mixed; boundary="===============8750223914172958440=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8750223914172958440==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/ce8f905bac2184bdfc466b072d2e5cc5bbd1e149
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

The custom patch to enforce project as C project as been merged upstream
since then, but it is not released yet. This commit updates the patch to
apply it on top of 1.4.3, and use the opportunity to fix the patch file
name to match the commit title.

Since version 1.4.0, openscap depends on PCRE2 rather than PCRE.

https://github.com/OpenSCAP/openscap/releases
https://github.com/OpenSCAP/openscap/compare/1.3.12...1.4.3

Signed-off-by: Alexis Lothoré <alexis.lothore@bootlin.com>
[Julien: remove "select BR2_PACKAGE_PCRE_UTF"]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...=> 0001-Set-project-as-C-project-in-CMakeLists.txt.patch} | 12 ++++++------
 package/openscap/Config.in                                   |  3 +--
 package/openscap/openscap.hash                               |  2 +-
 package/openscap/openscap.mk                                 |  6 +++---
 4 files changed, 11 insertions(+), 12 deletions(-)

diff --git a/package/openscap/0001-set-project-as-c-project.patch b/package/openscap/0001-Set-project-as-C-project-in-CMakeLists.txt.patch
similarity index 91%
rename from package/openscap/0001-set-project-as-c-project.patch
rename to package/openscap/0001-Set-project-as-C-project-in-CMakeLists.txt.patch
index c794fbaf44..2ccbfd138d 100644
--- a/package/openscap/0001-set-project-as-c-project.patch
+++ b/package/openscap/0001-Set-project-as-C-project-in-CMakeLists.txt.patch
@@ -1,4 +1,4 @@
-From a742647efd215b682e4cd26b15ac3e580c10ef9f Mon Sep 17 00:00:00 2001
+From d2fa8df126b533317b4b863758cf579fff3a2b45 Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Alexis=20Lothor=C3=A9?= <alexis.lothore@bootlin.com>
 Date: Mon, 16 Feb 2026 13:50:48 +0100
 Subject: [PATCH] Set project as C project in CMakeLists.txt
@@ -53,15 +53,15 @@ test C++ features on the used toolchain.
 [1] https://buildroot.org/
 [2] https://autobuild.buildroot.org/results/1fe550ffa79f0a083a450ae03fe067a8ab7336be/build-end.log
 
-Upstream: https://github.com/OpenSCAP/openscap/pull/2312
-[patch slightly adapted to be applicable on v1.3.12]
+Upstream: https://github.com/OpenSCAP/openscap/commit/bbfb2d7b00cbb8e08d999546734d3ba6ae150736
+[patch slightly adapted to be applicable on v1.4.3]
 Signed-off-by: Alexis Lothoré <alexis.lothore@bootlin.com>
 ---
  CMakeLists.txt | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/CMakeLists.txt b/CMakeLists.txt
-index cb13debb47cf..05b054327951 100644
+index c561116d826c..570812667036 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
 @@ -8,7 +8,7 @@ if(NOT CMAKE_BUILD_TYPE AND NOT CMAKE_CONFIGURATION_TYPES)
@@ -71,8 +71,8 @@ index cb13debb47cf..05b054327951 100644
 -project("openscap")
 +project("openscap" C)
  set(OPENSCAP_VERSION_MAJOR "1")
- set(OPENSCAP_VERSION_MINOR "3")
- set(OPENSCAP_VERSION_PATCH "12")
+ set(OPENSCAP_VERSION_MINOR "4")
+ set(OPENSCAP_VERSION_PATCH "3")
 -- 
 2.53.0
 
diff --git a/package/openscap/Config.in b/package/openscap/Config.in
index 317055c753..942d2b7c46 100644
--- a/package/openscap/Config.in
+++ b/package/openscap/Config.in
@@ -10,8 +10,7 @@ config BR2_PACKAGE_OPENSCAP
 	select BR2_PACKAGE_LIBXSLT
 	select BR2_PACKAGE_LIBXMLSEC1
 	select BR2_PACKAGE_MUSL_FTS if !BR2_TOOLCHAIN_USES_GLIBC
-	select BR2_PACKAGE_PCRE
-	select BR2_PACKAGE_PCRE_UTF
+	select BR2_PACKAGE_PCRE2
 	help
 	  The purpose of this project is to create security policy
 	  content for various platforms
diff --git a/package/openscap/openscap.hash b/package/openscap/openscap.hash
index e98631372d..7a25789b5b 100644
--- a/package/openscap/openscap.hash
+++ b/package/openscap/openscap.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  6e61913fca3a74d310d7cf9354973eeaefa42be909ae649af1df48c3c08bc6ff  openscap-1.3.12.tar.gz
+sha256  96ebe697aafc83eb297a8f29596d57319278112467c46e6aaf3649b311cf8fba  openscap-1.4.3.tar.gz
 sha256  5df07007198989c622f5d41de8d703e7bef3d0e79d62e24332ee739a452af62a  COPYING
diff --git a/package/openscap/openscap.mk b/package/openscap/openscap.mk
index 20427524d7..42f644db55 100644
--- a/package/openscap/openscap.mk
+++ b/package/openscap/openscap.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENSCAP_VERSION = 1.3.12
+OPENSCAP_VERSION = 1.4.3
 OPENSCAP_SITE = https://github.com/OpenSCAP/openscap/releases/download/$(OPENSCAP_VERSION)
 OPENSCAP_LICENSE = LGPL-2.1+
 OPENSCAP_LICENSE_FILES = COPYING
@@ -17,7 +17,7 @@ OPENSCAP_DEPENDENCIES = \
 	libxml2 \
 	libxmlsec1 \
 	libxslt \
-	pcre
+	pcre2
 
 HOST_OPENSCAP_DEPENDENCIES = \
 	host-pkgconf \
@@ -26,7 +26,7 @@ HOST_OPENSCAP_DEPENDENCIES = \
 	host-libxml2 \
 	host-libxmlsec1 \
 	host-libxslt \
-	host-pcre
+	host-pcre2
 
 OPENSCAP_CONF_OPTS = \
 	-DENABLE_OSCAP_UTIL=ON \

--===============8750223914172958440==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8750223914172958440==--

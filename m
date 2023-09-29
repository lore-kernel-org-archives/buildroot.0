Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2F62E728E2
	for <buildroot@archiver.kernel.org>; Fri, 29 Sep 2023 20:02:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9994883CEC;
	Fri, 29 Sep 2023 20:02:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9994883CEC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8jZSvfB0fy1U; Fri, 29 Sep 2023 20:02:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A932083DBB;
	Fri, 29 Sep 2023 20:02:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A932083DBB
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 69CCA1BF357
 for <buildroot@lists.busybox.net>; Fri, 29 Sep 2023 20:01:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 421E760BC4
 for <buildroot@lists.busybox.net>; Fri, 29 Sep 2023 20:01:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 421E760BC4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id S4xrn6ec78Mw for <buildroot@lists.busybox.net>;
 Fri, 29 Sep 2023 20:01:14 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id F195560BB5
 for <buildroot@buildroot.org>; Fri, 29 Sep 2023 20:01:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F195560BB5
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E1591835DB; Fri, 29 Sep 2023 20:01:13 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 29 Sep 2023 21:11:29 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9a4476245f10303e3989eb6760c22973a454eea4
X-Git-Newrev: 57aba033e6cc81b95d006227c45a15eb3fc77d07
X-Patchwork-Hint: ignore
Message-Id: <20230929200113.E1591835DB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/proj: bump to version 9.3.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=57aba033e6cc81b95d006227c45a15eb3fc77d07
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Switch to cmake-package as autotools has been removed since version
  9.0.0
- This bump will fix the following build failure with gcc 13 thanks to
  https://github.com/OSGeo/PROJ/pull/3459/commits/b0b8937c56ced8eb0ffef532b9c691a1a5fc8634:

In file included from proj_json_streaming_writer.cpp:34:
proj_json_streaming_writer.hpp:42:14: error: 'int64_t' in namespace 'std' does not name a type
   42 | typedef std::int64_t GIntBig;
      |              ^~~~~~~

https://github.com/OSGeo/PROJ/blob/9.3.0/NEWS

Fixes:
 - http://autobuild.buildroot.org/results/68416dcbed1ece589a7438b085f57064fc20f87d

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/proj/proj.hash |  6 +++---
 package/proj/proj.mk   | 19 ++++++++++---------
 2 files changed, 13 insertions(+), 12 deletions(-)

diff --git a/package/proj/proj.hash b/package/proj/proj.hash
index 96d94e458e..22e6a43bf7 100644
--- a/package/proj/proj.hash
+++ b/package/proj/proj.hash
@@ -1,5 +1,5 @@
-# Fetched from http://download.osgeo.org/proj/proj-8.1.1.tar.gz.md5
-md5  f017fd7d35311b0d65b2cf0503844690  proj-8.1.1.tar.gz
+# Fetched from http://download.osgeo.org/proj/proj-9.3.0.tar.gz.md5
+md5  f1d70cb8873bb4429a03c437c65c41c4  proj-9.3.0.tar.gz
 # Locally calculated
-sha256  82f1345e5fa530c407cb1fc0752e83f8d08d2b98772941bbdc7820241f7fada2  proj-8.1.1.tar.gz
+sha256  91a3695a004ea28db0448a34460bed4cc3b130e5c7d74339ec999efdab0e547d  proj-9.3.0.tar.gz
 sha256  6a8f30793e877d32e3f88b972f0970a051a3b5a26cd057d3993cb51e21c43319  COPYING
diff --git a/package/proj/proj.mk b/package/proj/proj.mk
index bc924b41fb..0e913fa335 100644
--- a/package/proj/proj.mk
+++ b/package/proj/proj.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PROJ_VERSION = 8.1.1
+PROJ_VERSION = 9.3.0
 PROJ_SITE = http://download.osgeo.org/proj
 PROJ_LICENSE = MIT
 PROJ_LICENSE_FILES = COPYING
@@ -19,22 +19,23 @@ PROJ_CFLAGS += -O0
 PROJ_CXXFLAGS += -O0
 endif
 
-PROJ_CONF_ENV = \
-	CFLAGS="$(PROJ_CFLAGS)" \
-	CXXFLAGS="$(PROJ_CXXFLAGS)"
+PROJ_CONF_OPTS = \
+	-DBUILD_APPS=OFF \
+	-DCMAKE_C_FLAGS="$(PROJ_CFLAGS)" \
+	-DCMAKE_CXX_FLAGS="$(PROJ_CXXFLAGS)"
 
 ifeq ($(BR2_PACKAGE_LIBCURL),y)
 PROJ_DEPENDENCIES += libcurl
-PROJ_CONF_OPTS += --with-curl=$(STAGING_DIR)/usr/bin/curl-config
+PROJ_CONF_OPTS += -DENABLE_CURL=ON
 else
-PROJ_CONF_OPTS += --without-curl
+PROJ_CONF_OPTS += -DENABLE_CURL=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_TIFF),y)
 PROJ_DEPENDENCIES += tiff
-PROJ_CONF_OPTS += --enable-tiff
+PROJ_CONF_OPTS += -DENABLE_TIFF=ON
 else
-PROJ_CONF_OPTS += --disable-tiff
+PROJ_CONF_OPTS += -DENABLE_TIFF=OFF
 endif
 
-$(eval $(autotools-package))
+$(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

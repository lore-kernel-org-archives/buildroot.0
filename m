Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55D08C4828D
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 10:22:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 11DAE41E67;
	Tue,  6 Feb 2024 10:22:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 11DAE41E67
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LnGUd9LiD2eb; Tue,  6 Feb 2024 10:22:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5C15B41E9F;
	Tue,  6 Feb 2024 10:22:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5C15B41E9F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0539B1BF311
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 10:21:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DFAEA41E59
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 10:21:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DFAEA41E59
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KbCtYfrrBlcX for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 10:21:52 +0000 (UTC)
Received: from dd5108.kasserver.com (dd5108.kasserver.com [85.13.130.47])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7D1DC41E78
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 10:21:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7D1DC41E78
Received: from wslxew206.. (ipb21bd56e.dynamic.kabel-deutschland.de
 [178.27.213.110])
 by dd5108.kasserver.com (Postfix) with ESMTPA id B75325240C9E;
 Tue,  6 Feb 2024 11:21:49 +0100 (CET)
From: Andreas Naumann <anaumann@ultratronik.de>
To: buildroot@buildroot.org
Date: Tue,  6 Feb 2024 11:21:44 +0100
Message-Id: <20240206102144.1831146-1-anaumann@ultratronik.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Spamd-Bar: +++
Subject: [Buildroot] [PATCH 1/1] package/glm: Bump to 1.0.0
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
Cc: fontaine.fabrice@gmail.com, Andreas Naumann <anaumann@ultratronik.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

glm did not install headers since [1], at least in a per-package
build. Bumping to 1.0.0 fixes that.
The cmake option to avoid building the lib has changed

Partially fixes [2], where cegui failed to configure because of
the missing glm headers.

[1] 01ad113  package/glm: bump to version 0.9.9.8
[2] http://autobuild.buildroot.org/results/241/241a60f8ecb6fec5dc122d64dd438dd4249f8c3e/

Signed-off-by: Andreas Naumann <anaumann@ultratronik.de>
---
note: 0.9.9.8 from 2020 was the latest tag until a 1.0.0 was cut about
two weeks ago (24th january 2024). I've seen commit 3a4b550 which might
have been responsible but didnt check since 1.0.0 was available.


 package/glm/glm.hash | 2 +-
 package/glm/glm.mk   | 5 ++---
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/glm/glm.hash b/package/glm/glm.hash
index c4e21016047..0084bd0930c 100644
--- a/package/glm/glm.hash
+++ b/package/glm/glm.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  7d508ab72cb5d43227a3711420f06ff99b0a0cb63ee2f93631b162bfe1fe9592  glm-0.9.9.8.tar.gz
+sha256  e51f6c89ff33b7cfb19daafb215f293d106cd900f8d681b9b1295312ccadbd23  glm-1.0.0.tar.gz
 sha256  62d2d642c7d054d4fb4c9b42faad617d6c88fcd91e317f8035aa9f277cc159c3  copying.txt
diff --git a/package/glm/glm.mk b/package/glm/glm.mk
index ef549931f6a..ce8efc11a78 100644
--- a/package/glm/glm.mk
+++ b/package/glm/glm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GLM_VERSION = 0.9.9.8
+GLM_VERSION = 1.0.0
 GLM_SITE = $(call github,g-truc,glm,$(GLM_VERSION))
 GLM_LICENSE = MIT
 GLM_LICENSE_FILES = copying.txt
@@ -17,7 +17,6 @@ GLM_INSTALL_TARGET = NO
 # Don't build libraries as GLM is header-only
 GLM_CONF_OPTS = \
 	-DGLM_TEST_ENABLE=OFF \
-	-DBUILD_SHARED_LIBS=OFF \
-	-DBUILD_STATIC_LIBS=OFF
+	-DGLM_BUILD_LIBRARY=OFF
 
 $(eval $(cmake-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

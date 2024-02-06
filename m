Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23573C4828D
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 14:02:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C552461162;
	Tue,  6 Feb 2024 14:02:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C552461162
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gvaGzn4sosao; Tue,  6 Feb 2024 14:02:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2B0C960608;
	Tue,  6 Feb 2024 14:02:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2B0C960608
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 276301BF5AD
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 14:02:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0D79260608
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 14:02:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0D79260608
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 83EzTMKa54LH for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 14:02:39 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 41DA8605AC
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 14:02:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 41DA8605AC
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2DB8881F76; Tue,  6 Feb 2024 14:02:39 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 6 Feb 2024 14:48:36 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 00702e3ffde1ebce9e2a2cfb63af7992a627c149
X-Git-Newrev: 12b97949ef47161e7117e6092789a00cc8cbaaa7
X-Patchwork-Hint: ignore
Message-Id: <20240206140239.2DB8881F76@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/glm: Bump to 1.0.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=12b97949ef47161e7117e6092789a00cc8cbaaa7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

glm did not install headers since [1], at least in a per-package
build. Bumping to 1.0.0 fixes that.
The cmake option to avoid building the lib has changed

Partially fixes [2], where cegui failed to configure because of
the missing glm headers.

It also fixes kodi-screensaver and kodi-visualisation (no autobuidl
failures so far):
    CMake Error at [...]/output/per-package/kodi-screensaver-asteroids/host/share/cmake-3.28/Modules/FindPackageHandleStandardArgs.cmake:230 (message):
      Could NOT find glm (missing: GLM_INCLUDE_DIR)

[1] 01ad113  package/glm: bump to version 0.9.9.8
[2] http://autobuild.buildroot.org/results/241/241a60f8ecb6fec5dc122d64dd438dd4249f8c3e/

Signed-off-by: Andreas Naumann <anaumann@ultratronik.de>
[yann.morin.1998@free.fr: add kodi failures from Bernd]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/glm/glm.hash | 2 +-
 package/glm/glm.mk   | 5 ++---
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/glm/glm.hash b/package/glm/glm.hash
index c4e2101604..0084bd0930 100644
--- a/package/glm/glm.hash
+++ b/package/glm/glm.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  7d508ab72cb5d43227a3711420f06ff99b0a0cb63ee2f93631b162bfe1fe9592  glm-0.9.9.8.tar.gz
+sha256  e51f6c89ff33b7cfb19daafb215f293d106cd900f8d681b9b1295312ccadbd23  glm-1.0.0.tar.gz
 sha256  62d2d642c7d054d4fb4c9b42faad617d6c88fcd91e317f8035aa9f277cc159c3  copying.txt
diff --git a/package/glm/glm.mk b/package/glm/glm.mk
index ef549931f6..ce8efc11a7 100644
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68116C25B10
	for <buildroot@archiver.kernel.org>; Thu,  9 May 2024 17:23:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 208D740137;
	Thu,  9 May 2024 17:23:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Tf_Pl60nh8h4; Thu,  9 May 2024 17:23:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B0117402BD
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B0117402BD;
	Thu,  9 May 2024 17:23:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D77581BF990
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 17:23:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D1BE26064E
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 17:23:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vMIzcuAjpusl for <buildroot@lists.busybox.net>;
 Thu,  9 May 2024 17:23:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0657960608
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0657960608
 for <buildroot@buildroot.org>; Thu,  9 May 2024 17:23:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E5B2C86D3A; Thu,  9 May 2024 17:23:44 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 9 May 2024 19:03:10 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4947799a0452d9e6b23b252e9488054129fa4c44
X-Git-Newrev: 49afbc1a19e66be92a8d91189fd5b321d1fecef4
X-Patchwork-Hint: ignore
Message-Id: <20240509172344.E5B2C86D3A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/kodi-inputstream-adaptive: bump
 version to 21.4.4-Omega
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

commit: https://git.buildroot.net/buildroot/commit/?id=49afbc1a19e66be92a8d91189fd5b321d1fecef4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Added dependency to pugixml:
https://github.com/xbmc/inputstream.adaptive/commit/31a51a8b0f265ffc5ac62e70c2447334d148c819

Removed dependency to expat:
https://github.com/xbmc/inputstream.adaptive/commit/8816b9089bb4cefc0bf2996db49c3bd1b81b42fe

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/kodi-inputstream-adaptive/Config.in                      | 2 +-
 package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash | 2 +-
 package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk   | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/kodi-inputstream-adaptive/Config.in b/package/kodi-inputstream-adaptive/Config.in
index 3efe3aa114..f1f98b8304 100644
--- a/package/kodi-inputstream-adaptive/Config.in
+++ b/package/kodi-inputstream-adaptive/Config.in
@@ -4,7 +4,7 @@ config BR2_PACKAGE_KODI_INPUTSTREAM_ADAPTIVE
 	depends on BR2_aarch64 || BR2_arm || BR2_i386 || BR2_mipsel \
 		|| BR2_mips64el || BR2_x86_64
 	select BR2_PACKAGE_BENTO4
-	select BR2_PACKAGE_EXPAT
+	select BR2_PACKAGE_PUGIXML
 	help
 	  Kodi inputstream addon for several manifest types
 
diff --git a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash
index e38191c0c4..b7a89a8a02 100644
--- a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash
+++ b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  f67cfef057f8842716db4521a8cd3966c37a1da8fc3fb297527f6f25be20688a  kodi-inputstream-adaptive-20.3.17-Nexus.tar.gz
+sha256  0a1074fe04fb7e9500d578490b4cda12ecfcf433495e15e7bf65861527586167  kodi-inputstream-adaptive-21.4.4-Omega.tar.gz
 sha256  48632d57fbb6ab8f50cbf4deced5c91e733fa7ff292687c4816b77f28e483df9  LICENSE.md
 sha256  02f864f3e07456785625968022ce811c5640301bfd2ae70963efea89d306790a  LICENSES/README.md
 sha256  0b7f5dcb3d2c28ff78d999786028930e762df0baa2f52955782e378ec5b636a8  LICENSES/BSD-2-Clause-Views
diff --git a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk
index ba4f6de61a..e1fe3f37ed 100644
--- a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk
+++ b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_INPUTSTREAM_ADAPTIVE_VERSION = 20.3.17-Nexus
+KODI_INPUTSTREAM_ADAPTIVE_VERSION = 21.4.4-Omega
 KODI_INPUTSTREAM_ADAPTIVE_SITE = $(call github,xbmc,inputstream.adaptive,$(KODI_INPUTSTREAM_ADAPTIVE_VERSION))
 KODI_INPUTSTREAM_ADAPTIVE_LICENSE = \
 	BSD-2-Clause-Views \
@@ -22,6 +22,6 @@ KODI_INPUTSTREAM_ADAPTIVE_LICENSE_FILES = \
 	LICENSES/GPL-2.0-or-later \
 	LICENSES/RSA-MD
 
-KODI_INPUTSTREAM_ADAPTIVE_DEPENDENCIES = bento4 expat kodi
+KODI_INPUTSTREAM_ADAPTIVE_DEPENDENCIES = bento4 kodi pugixml
 
 $(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

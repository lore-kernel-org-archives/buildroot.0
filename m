Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 663D8C433F5
	for <buildroot@archiver.kernel.org>; Sat, 14 May 2022 21:47:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 17D7D60D91;
	Sat, 14 May 2022 21:47:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3GZRE63rXln2; Sat, 14 May 2022 21:47:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 26A8760A6A;
	Sat, 14 May 2022 21:47:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 91E3D1BF616
 for <buildroot@lists.busybox.net>; Sat, 14 May 2022 21:47:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8DF6882611
 for <buildroot@lists.busybox.net>; Sat, 14 May 2022 21:47:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yN3L42B8qN6c for <buildroot@lists.busybox.net>;
 Sat, 14 May 2022 21:47:15 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id CE5DB81C38
 for <buildroot@buildroot.org>; Sat, 14 May 2022 21:47:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 54B1785DAB; Sat, 14 May 2022 21:36:18 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 14 May 2022 23:06:06 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c42d2c34a2782fd15371b38c4d3d7348a3859727
X-Git-Newrev: 97324175c0e5cbf5457a9f5a80a1bce13aadd81a
X-Patchwork-Hint: ignore
Message-Id: <20220514213618.54B1785DAB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/swupdate: bump to version 2022.05
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

commit: https://git.buildroot.net/buildroot/commit/?id=97324175c0e5cbf5457a9f5a80a1bce13aadd81a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop libubootenv and efibootmgr dependencies which are now
optional runtime dependencies.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/swupdate/swupdate.hash |  2 +-
 package/swupdate/swupdate.mk   | 16 +---------------
 2 files changed, 2 insertions(+), 16 deletions(-)

diff --git a/package/swupdate/swupdate.hash b/package/swupdate/swupdate.hash
index e431ecf40b..638b586e8a 100644
--- a/package/swupdate/swupdate.hash
+++ b/package/swupdate/swupdate.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  4d078e57bb91e17025ee8cb1bb54c25532e8d2dbe329bba6a7a0328ac34a07e3  swupdate-2021.11.tar.gz
+sha256  1e819f71b19626bde1a4906ced39d3406ca240b458d3c4a998bd9c7333eba260  swupdate-2022.05.tar.gz
 sha256  4cf04ed34ff0ebbf5c71345b56e6af5093fc17206364cca0ebbae92ef3940683  LICENSES/BSD-1-Clause.txt
 sha256  e27a3e87706b3aa5ff2e50eaafe2e6ed5397fbf2d7679eaf444a6d000518a3a6  LICENSES/BSD-3-Clause.txt
 sha256  0558101984550fa84d1d13c2af11d116c20079d2be58711e8d99cadce7009192  LICENSES/CC0-1.0.txt
diff --git a/package/swupdate/swupdate.mk b/package/swupdate/swupdate.mk
index 065ae772ba..b2f50d2b71 100644
--- a/package/swupdate/swupdate.mk
+++ b/package/swupdate/swupdate.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SWUPDATE_VERSION = 2021.11
+SWUPDATE_VERSION = 2022.05
 SWUPDATE_SITE = $(call github,sbabic,swupdate,$(SWUPDATE_VERSION))
 SWUPDATE_LICENSE = GPL-2.0, GPL-2.0+, LGPL-2.1+, MIT, ISC, BSD-1-Clause, BSD-3-Clause, CC0-1.0, CC-BY-SA-4.0, OFL-1.1
 SWUPDATE_LICENSE_FILES = LICENSES/BSD-1-Clause.txt \
@@ -32,13 +32,6 @@ else
 SWUPDATE_MAKE_ENV += HAVE_LIBEXT2FS=n
 endif
 
-ifeq ($(BR2_PACKAGE_EFIBOOTMGR),y)
-SWUPDATE_DEPENDENCIES += efibootmgr
-SWUPDATE_MAKE_ENV += HAVE_LIBEBGENV=y
-else
-SWUPDATE_MAKE_ENV += HAVE_LIBEBGENV=n
-endif
-
 ifeq ($(BR2_PACKAGE_JSON_C),y)
 SWUPDATE_DEPENDENCIES += json-c
 SWUPDATE_MAKE_ENV += HAVE_JSON_C=y
@@ -158,13 +151,6 @@ define SWUPDATE_SET_SYSTEMD
 endef
 endif
 
-ifeq ($(BR2_PACKAGE_LIBUBOOTENV),y)
-SWUPDATE_DEPENDENCIES += libubootenv
-SWUPDATE_MAKE_ENV += HAVE_LIBUBOOTENV=y
-else
-SWUPDATE_MAKE_ENV += HAVE_LIBUBOOTENV=n
-endif
-
 ifeq ($(BR2_PACKAGE_WOLFSSL),y)
 SWUPDATE_DEPENDENCIES += wolfssl
 SWUPDATE_MAKE_ENV += HAVE_WOLFSSL=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

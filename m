Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82058ECAAA1
	for <buildroot@archiver.kernel.org>; Tue, 30 Aug 2022 16:17:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 298C740BC6;
	Tue, 30 Aug 2022 16:17:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 298C740BC6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Z50-i0PaEthl; Tue, 30 Aug 2022 16:17:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2A2CE40BA9;
	Tue, 30 Aug 2022 16:17:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2A2CE40BA9
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 101DF1BF3A8
 for <buildroot@lists.busybox.net>; Tue, 30 Aug 2022 16:15:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 014D840B8B
 for <buildroot@lists.busybox.net>; Tue, 30 Aug 2022 16:15:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 014D840B8B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lWD7xgbkmk5f for <buildroot@lists.busybox.net>;
 Tue, 30 Aug 2022 16:15:02 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1B70640BAE
 for <buildroot@buildroot.org>; Tue, 30 Aug 2022 16:15:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1B70640BAE
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 660BE88098; Tue, 30 Aug 2022 15:59:58 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 30 Aug 2022 18:07:58 +0200
X-Git-Refname: refs/heads/2022.05.x
X-Git-Oldrev: 839106302e8ef95373ea9db1f6d70eb91ef3f2d0
X-Git-Newrev: c3983b5e8c027e64c41a9fa4b6c86d2ca2d75b7a
X-Patchwork-Hint: ignore
Message-Id: <20220830155958.660BE88098@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.05.x] package/jack2: libsndfile
 is optional, not mandatory
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

commit: https://git.buildroot.net/buildroot/commit/?id=c3983b5e8c027e64c41a9fa4b6c86d2ca2d75b7a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.05.x

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 69284b6700e5f45e25a583e87b86ed1eb95038fd)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/jack2/Config.in | 1 -
 package/jack2/jack2.mk  | 9 ++++++++-
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/package/jack2/Config.in b/package/jack2/Config.in
index e02449ba87..f5ac0399eb 100644
--- a/package/jack2/Config.in
+++ b/package/jack2/Config.in
@@ -5,7 +5,6 @@ config BR2_PACKAGE_JACK2
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
-	select BR2_PACKAGE_LIBSNDFILE
 	select BR2_PACKAGE_ALSA_LIB
 	select BR2_PACKAGE_ALSA_LIB_HWDEP
 	select BR2_PACKAGE_ALSA_LIB_SEQ
diff --git a/package/jack2/jack2.mk b/package/jack2/jack2.mk
index 4059fa689c..3b45474cc4 100644
--- a/package/jack2/jack2.mk
+++ b/package/jack2/jack2.mk
@@ -9,7 +9,7 @@ JACK2_SITE = $(call github,jackaudio,jack2,v$(JACK2_VERSION))
 JACK2_LICENSE = GPL-2.0+ (jack server), LGPL-2.1+ (jack library)
 JACK2_LICENSE_FILES = COPYING
 JACK2_CPE_ID_VENDOR = jackaudio
-JACK2_DEPENDENCIES = libsndfile alsa-lib
+JACK2_DEPENDENCIES = alsa-lib
 JACK2_INSTALL_STAGING = YES
 
 JACK2_CONF_OPTS = --alsa
@@ -26,6 +26,13 @@ else
 JACK2_CONF_OPTS += --samplerate=no
 endif
 
+ifeq ($(BR2_PACKAGE_LIBSNDFILE),y)
+JACK2_DEPENDENCIES += libsndfile
+JACK2_CONF_OPTS += --sndfile=yes
+else
+JACK2_CONF_OPTS += --sndfile=no
+endif
+
 ifeq ($(BR2_PACKAGE_OPUS),y)
 JACK2_DEPENDENCIES += opus
 JACK2_CONF_OPTS += --opus=yes
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

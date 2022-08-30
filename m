Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CC97ECAAA1
	for <buildroot@archiver.kernel.org>; Tue, 30 Aug 2022 16:20:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E2E3241720;
	Tue, 30 Aug 2022 16:20:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E2E3241720
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9509Dn-rfD3v; Tue, 30 Aug 2022 16:20:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B5DA5409FF;
	Tue, 30 Aug 2022 16:19:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B5DA5409FF
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1733C1BF3A8
 for <buildroot@lists.busybox.net>; Tue, 30 Aug 2022 16:15:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 58C7E40BAB
 for <buildroot@lists.busybox.net>; Tue, 30 Aug 2022 16:15:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 58C7E40BAB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 58TOtpYhxlQM for <buildroot@lists.busybox.net>;
 Tue, 30 Aug 2022 16:15:11 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 280C640BB1
 for <buildroot@buildroot.org>; Tue, 30 Aug 2022 16:15:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 280C640BB1
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 65FF7880E2; Tue, 30 Aug 2022 16:00:07 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 30 Aug 2022 18:09:05 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 91e70f944f73ba9a79b24fb159d93eb731a8e562
X-Git-Newrev: dbf8744aff6c316894923dc68a0977194f229337
X-Patchwork-Hint: ignore
Message-Id: <20220830160007.65FF7880E2@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/jack2:
 libsamplerate is optional, not mandatoy
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

commit: https://git.buildroot.net/buildroot/commit/?id=dbf8744aff6c316894923dc68a0977194f229337
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 61170e696dfbc0ed6e5e10966f426d473a938590)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/jack2/Config.in | 1 -
 package/jack2/jack2.mk  | 9 ++++++++-
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/package/jack2/Config.in b/package/jack2/Config.in
index 8abdda6376..e02449ba87 100644
--- a/package/jack2/Config.in
+++ b/package/jack2/Config.in
@@ -5,7 +5,6 @@ config BR2_PACKAGE_JACK2
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
-	select BR2_PACKAGE_LIBSAMPLERATE
 	select BR2_PACKAGE_LIBSNDFILE
 	select BR2_PACKAGE_ALSA_LIB
 	select BR2_PACKAGE_ALSA_LIB_HWDEP
diff --git a/package/jack2/jack2.mk b/package/jack2/jack2.mk
index 6939aac9a6..4059fa689c 100644
--- a/package/jack2/jack2.mk
+++ b/package/jack2/jack2.mk
@@ -9,7 +9,7 @@ JACK2_SITE = $(call github,jackaudio,jack2,v$(JACK2_VERSION))
 JACK2_LICENSE = GPL-2.0+ (jack server), LGPL-2.1+ (jack library)
 JACK2_LICENSE_FILES = COPYING
 JACK2_CPE_ID_VENDOR = jackaudio
-JACK2_DEPENDENCIES = libsamplerate libsndfile alsa-lib
+JACK2_DEPENDENCIES = libsndfile alsa-lib
 JACK2_INSTALL_STAGING = YES
 
 JACK2_CONF_OPTS = --alsa
@@ -19,6 +19,13 @@ JACK2_DEPENDENCIES += libexecinfo
 JACK2_CONF_ENV += LDFLAGS="$(TARGET_LDFLAGS) -lexecinfo"
 endif
 
+ifeq ($(BR2_PACKAGE_LIBSAMPLERATE),y)
+JACK2_DEPENDENCIES += libsamplerate
+JACK2_CONF_OPTS += --samplerate=yes
+else
+JACK2_CONF_OPTS += --samplerate=no
+endif
+
 ifeq ($(BR2_PACKAGE_OPUS),y)
 JACK2_DEPENDENCIES += opus
 JACK2_CONF_OPTS += --opus=yes
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 052F0C77B7A
	for <buildroot@archiver.kernel.org>; Wed,  7 Jun 2023 20:44:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A59B882ADD;
	Wed,  7 Jun 2023 20:44:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A59B882ADD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7NTlRgIZYYuI; Wed,  7 Jun 2023 20:44:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D24DB82BE5;
	Wed,  7 Jun 2023 20:44:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D24DB82BE5
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B166F1BF969
 for <buildroot@lists.busybox.net>; Wed,  7 Jun 2023 20:44:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 988E960B19
 for <buildroot@lists.busybox.net>; Wed,  7 Jun 2023 20:44:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 988E960B19
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wDZltXcrdk5i for <buildroot@lists.busybox.net>;
 Wed,  7 Jun 2023 20:44:15 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id B503160AE1
 for <buildroot@buildroot.org>; Wed,  7 Jun 2023 20:44:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B503160AE1
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9EF5686D72; Wed,  7 Jun 2023 20:44:15 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 7 Jun 2023 22:24:34 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 29e79c1f54407d0bb6cd9a3a27c65a4cbe3ccdcd
X-Git-Newrev: 17393a78e53a3b56aa0416369604ccb1dde414ef
X-Patchwork-Hint: ignore
Message-Id: <20230607204415.9EF5686D72@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/at-spi2-core: security bump to
 version 2.48.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=17393a78e53a3b56aa0416369604ccb1dde414ef
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://gitlab.gnome.org/GNOME/at-spi2-core/-/blob/AT_SPI2_CORE_2_48_3/NEWS

Fixes a couple of use after frees when finalizing devices.
Added systemd option to not fail if dbus-broker is detected on the host
machine.

Fixes:
- http://autobuild.buildroot.net/results/a4908a2c8cb75b602794e890fccb8dd42ef6ff41

Signed-off-by: Daniel Lang <dalang@gmx.at>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/at-spi2-core/at-spi2-core.hash | 4 ++--
 package/at-spi2-core/at-spi2-core.mk   | 9 ++++++++-
 2 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/package/at-spi2-core/at-spi2-core.hash b/package/at-spi2-core/at-spi2-core.hash
index db3ea7096e..8f856e1cac 100644
--- a/package/at-spi2-core/at-spi2-core.hash
+++ b/package/at-spi2-core/at-spi2-core.hash
@@ -1,5 +1,5 @@
-# From https://download.gnome.org/sources/at-spi2-core/2.48/at-spi2-core-2.48.2.sha256sum
-sha256  86ebcb55f678381d7ed7825736add42dfccb70ad3b981dfd65d72e58f87828ee  at-spi2-core-2.48.2.tar.xz
+# From https://download.gnome.org/sources/at-spi2-core/2.48/at-spi2-core-2.48.3.sha256sum
+sha256  37316df43ca9989ce539d54cf429a768c28bb38a0b34950beadd0421827edf55  at-spi2-core-2.48.3.tar.xz
 
 # locally calculated
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/at-spi2-core/at-spi2-core.mk b/package/at-spi2-core/at-spi2-core.mk
index e9a93b3eda..0ca5bc1817 100644
--- a/package/at-spi2-core/at-spi2-core.mk
+++ b/package/at-spi2-core/at-spi2-core.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 AT_SPI2_CORE_VERSION_MAJOR = 2.48
-AT_SPI2_CORE_VERSION = $(AT_SPI2_CORE_VERSION_MAJOR).2
+AT_SPI2_CORE_VERSION = $(AT_SPI2_CORE_VERSION_MAJOR).3
 AT_SPI2_CORE_SOURCE = at-spi2-core-$(AT_SPI2_CORE_VERSION).tar.xz
 AT_SPI2_CORE_SITE = https://download.gnome.org/sources/at-spi2-core/$(AT_SPI2_CORE_VERSION_MAJOR)
 AT_SPI2_CORE_LICENSE = LGPL-2.1+
@@ -29,6 +29,13 @@ else
 AT_SPI2_CORE_CONF_OPTS += -Dintrospection=disabled
 endif
 
+ifeq ($(BR2_PACKAGE_SYSTEMD),y)
+AT_SPI2_CORE_CONF_OPTS += -Duse_systemd=true
+AT_SPI2_CORE_DEPENDENCIES += systemd
+else
+AT_SPI2_CORE_CONF_OPTS += -Duse_systemd=false
+endif
+
 AT_SPI2_CORE_LDFLAGS = $(TARGET_LDFLAGS) $(TARGET_NLS_LIBS)
 
 $(eval $(meson-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

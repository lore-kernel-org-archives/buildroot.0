Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AABC0EE6454
	for <buildroot@archiver.kernel.org>; Thu, 12 Sep 2024 07:30:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 488C040581;
	Thu, 12 Sep 2024 07:30:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L0CLLJ98nkBa; Thu, 12 Sep 2024 07:30:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D80E2405A7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D80E2405A7;
	Thu, 12 Sep 2024 07:30:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3B21D1BF2F7
 for <buildroot@lists.busybox.net>; Thu, 12 Sep 2024 07:30:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 36733405A7
 for <buildroot@lists.busybox.net>; Thu, 12 Sep 2024 07:30:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4-dBRWc7FXHO for <buildroot@lists.busybox.net>;
 Thu, 12 Sep 2024 07:30:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8FD7940581
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8FD7940581
 for <buildroot@buildroot.org>; Thu, 12 Sep 2024 07:30:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8339586FC5; Thu, 12 Sep 2024 07:30:28 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 12 Sep 2024 09:04:52 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 57fdc3cb8eb90970bd488b8c3906750376e46764
X-Git-Newrev: 93b72692c36f8357e867650f4b8fac91dff375f5
X-Patchwork-Hint: ignore
Message-Id: <20240912073028.8339586FC5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pipewire: bump version to 1.2.2
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=93b72692c36f8357e867650f4b8fac91dff375f5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Disabled roc & snap dependencies, which don't exist in buildroot.
Added libselinux optional dependency.

The bluez plugin now uses libglib2 explicitly. Although this dependency
is implied by bluez5_utils, track it explicitly in the .mk file as well.

Signed-off-by: George Kiagiadakis <george.kiagiadakis@collabora.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/pipewire/pipewire.hash |  2 +-
 package/pipewire/pipewire.mk   | 17 +++++++++++++----
 2 files changed, 14 insertions(+), 5 deletions(-)

diff --git a/package/pipewire/pipewire.hash b/package/pipewire/pipewire.hash
index 3370d86641..8ea3890675 100644
--- a/package/pipewire/pipewire.hash
+++ b/package/pipewire/pipewire.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  2b6e0c4d2e544f5030fa7f4ecf1edd9e5eed15dda1c97135e8a1fded9f3425fe  pipewire-0.3.81.tar.bz2
+sha256  b3817f7b9abf14a6dbcb6ea18b186ba8771f703cb395e4a38366b4e051c40054  pipewire-1.2.2.tar.bz2
 sha256  8909c319a7e27dbb33a15b9035f89ab3b7b2f6a12f8bcddc755206a8db1ada44  COPYING
 sha256  be4be5d77424833edf31f53fc1f1cecb6996b9e2d747d9e6fb8f878362ebc92b  LICENSE
diff --git a/package/pipewire/pipewire.mk b/package/pipewire/pipewire.mk
index 481ef22d38..eb86a98494 100644
--- a/package/pipewire/pipewire.mk
+++ b/package/pipewire/pipewire.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PIPEWIRE_VERSION = 0.3.81
+PIPEWIRE_VERSION = 1.2.2
 PIPEWIRE_SOURCE = pipewire-$(PIPEWIRE_VERSION).tar.bz2
 PIPEWIRE_SITE = https://gitlab.freedesktop.org/pipewire/pipewire/-/archive/$(PIPEWIRE_VERSION)
 PIPEWIRE_LICENSE = MIT, LGPL-2.1+ (libspa-alsa), GPL-2.0 (libjackserver)
@@ -34,10 +34,12 @@ PIPEWIRE_CONF_OPTS += \
 	-Dsession-managers=[] \
 	-Dlegacy-rtkit=false \
 	-Davb=disabled \
+	-Droc=disabled \
 	-Dlibcanberra=disabled \
 	-Dlibmysofa=disabled \
 	-Dlibffado=disabled \
-	-Dflatpak=disabled
+	-Dflatpak=disabled \
+	-Dsnap=disabled
 
 ifeq ($(BR2_PACKAGE_DBUS),y)
 PIPEWIRE_CONF_OPTS += -Ddbus=enabled
@@ -105,9 +107,9 @@ else
 PIPEWIRE_CONF_OPTS += -Dpipewire-jack=disabled -Djack=disabled
 endif
 
-ifeq ($(BR2_PACKAGE_BLUEZ5_UTILS)$(BR2_PACKAGE_SBC),yy)
+ifeq ($(BR2_PACKAGE_BLUEZ5_UTILS)$(BR2_PACKAGE_SBC)$(BR2_PACKAGE_LIBGLIB2),yyy)
 PIPEWIRE_CONF_OPTS += -Dbluez5=enabled
-PIPEWIRE_DEPENDENCIES += bluez5_utils sbc
+PIPEWIRE_DEPENDENCIES += bluez5_utils sbc libglib2
 ifeq ($(BR2_PACKAGE_MODEM_MANAGER),y)
 PIPEWIRE_CONF_OPTS += -Dbluez5-backend-native-mm=enabled
 PIPEWIRE_DEPENDENCIES += modem-manager
@@ -245,6 +247,13 @@ else
 PIPEWIRE_CONF_OPTS += -Draop=disabled
 endif
 
+ifeq ($(BR2_PACKAGE_LIBSELINUX),y)
+PIPEWIRE_CONF_OPTS += -Dselinux=enabled
+PIPEWIRE_DEPENDENCIES += libselinux
+else
+PIPEWIRE_CONF_OPTS += -Dselinux=disabled
+endif
+
 define PIPEWIRE_USERS
 	pipewire -1 pipewire -1 * - - audio,video PipeWire System Daemon
 endef
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

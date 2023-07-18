Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60648EB64DC
	for <buildroot@archiver.kernel.org>; Tue, 18 Jul 2023 21:26:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C4F96417B4;
	Tue, 18 Jul 2023 21:26:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C4F96417B4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EfnZjW2YI-4U; Tue, 18 Jul 2023 21:26:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AE2E0417AE;
	Tue, 18 Jul 2023 21:26:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AE2E0417AE
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5E2411BF350
 for <buildroot@lists.busybox.net>; Tue, 18 Jul 2023 21:26:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 342B141496
 for <buildroot@lists.busybox.net>; Tue, 18 Jul 2023 21:26:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 342B141496
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GnS4JcnrNwKK for <buildroot@lists.busybox.net>;
 Tue, 18 Jul 2023 21:26:45 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6AF8A40280
 for <buildroot@buildroot.org>; Tue, 18 Jul 2023 21:26:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6AF8A40280
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 57D478746A; Tue, 18 Jul 2023 21:26:45 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 18 Jul 2023 23:23:25 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 70a40164122050877c59cbbb8f4be389b95e269e
X-Git-Newrev: 6a7c9332402d019181ef1b6b02a9e5d84c6463c7
X-Patchwork-Hint: ignore
Message-Id: <20230718212645.57D478746A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pipewire: bump version to 0.3.74
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

commit: https://git.buildroot.net/buildroot/commit/?id=6a7c9332402d019181ef1b6b02a9e5d84c6463c7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog:
https://gitlab.freedesktop.org/pipewire/pipewire/-/blob/master/NEWS

Added optional dependency to opus, disabled features with missing
dependencies in buildroot.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/pipewire/pipewire.hash |  2 +-
 package/pipewire/pipewire.mk   | 11 ++++++++++-
 2 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/package/pipewire/pipewire.hash b/package/pipewire/pipewire.hash
index 0e027aaa55..98de073bdb 100644
--- a/package/pipewire/pipewire.hash
+++ b/package/pipewire/pipewire.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  c78c95cdff2774418f0a9468e94a1b2800761d322f13104df6501e1a0dc92558  pipewire-0.3.65.tar.bz2
+sha256  b30d886b87aa8c055af6d6c7261d1d04336f3a75221c31afe1ea8ba86184bf70  pipewire-0.3.74.tar.bz2
 sha256  8909c319a7e27dbb33a15b9035f89ab3b7b2f6a12f8bcddc755206a8db1ada44  COPYING
 sha256  be4be5d77424833edf31f53fc1f1cecb6996b9e2d747d9e6fb8f878362ebc92b  LICENSE
diff --git a/package/pipewire/pipewire.mk b/package/pipewire/pipewire.mk
index d6bd2434bf..9d32da7c72 100644
--- a/package/pipewire/pipewire.mk
+++ b/package/pipewire/pipewire.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PIPEWIRE_VERSION = 0.3.65
+PIPEWIRE_VERSION = 0.3.74
 PIPEWIRE_SOURCE = pipewire-$(PIPEWIRE_VERSION).tar.bz2
 PIPEWIRE_SITE = https://gitlab.freedesktop.org/pipewire/pipewire/-/archive/$(PIPEWIRE_VERSION)
 PIPEWIRE_LICENSE = MIT, LGPL-2.1+ (libspa-alsa), GPL-2.0 (libjackserver)
@@ -35,6 +35,8 @@ PIPEWIRE_CONF_OPTS += \
 	-Dlegacy-rtkit=false \
 	-Davb=disabled \
 	-Dlibcanberra=disabled \
+	-Dlibmysofa=disabled \
+	-Dlibffado=disabled \
 	-Dflatpak=disabled
 
 ifeq ($(BR2_PACKAGE_DBUS),y)
@@ -189,6 +191,13 @@ else
 PIPEWIRE_CONF_OPTS += -Dpw-cat=disabled -Dsndfile=disabled
 endif
 
+ifeq ($(BR2_PACKAGE_OPUS),y)
+PIPEWIRE_CONF_OPTS += -Dopus=enabled
+PIPEWIRE_DEPENDENCIES += opus
+else
+PIPEWIRE_CONF_OPTS += -Dopus=disabled
+endif
+
 ifeq ($(BR2_PACKAGE_PULSEAUDIO),y)
 PIPEWIRE_CONF_OPTS += -Dlibpulse=enabled
 PIPEWIRE_DEPENDENCIES += pulseaudio
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

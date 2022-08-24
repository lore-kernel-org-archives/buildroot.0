Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4A2AC00140
	for <buildroot@archiver.kernel.org>; Wed, 24 Aug 2022 10:10:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 54C4940B00;
	Wed, 24 Aug 2022 10:10:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 54C4940B00
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JRC8MfOhwdRR; Wed, 24 Aug 2022 10:10:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6315240160;
	Wed, 24 Aug 2022 10:10:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6315240160
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4C3241BF592
 for <buildroot@lists.busybox.net>; Wed, 24 Aug 2022 10:09:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D7CF360E2C
 for <buildroot@lists.busybox.net>; Wed, 24 Aug 2022 10:09:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D7CF360E2C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id K0emtRnOnKyl for <buildroot@lists.busybox.net>;
 Wed, 24 Aug 2022 10:09:53 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1CC5260E0B
 for <buildroot@buildroot.org>; Wed, 24 Aug 2022 10:09:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1CC5260E0B
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 8670187C6F; Wed, 24 Aug 2022 09:55:03 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 24 Aug 2022 12:08:51 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: f0520470951528eb07710338e7427a1fd0159b48
X-Git-Newrev: 8bf3d6a1b7f1584344d39e14f6e275cf14b1b4fa
X-Patchwork-Hint: ignore
Message-Id: <20220824095503.8670187C6F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/libinput: enable
 installation of python tools
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

commit: https://git.buildroot.net/buildroot/commit/?id=8bf3d6a1b7f1584344d39e14f6e275cf14b1b4fa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Now that we have a python-libevdev package, let's allow the
installation of the libinput Python tools, using a new
BR2_PACKAGE_LIBINPUT_PYTHON_TOOLS option.

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Cc: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libinput/Config.in   | 22 ++++++++++++++++++++++
 package/libinput/libinput.mk |  2 ++
 2 files changed, 24 insertions(+)

diff --git a/package/libinput/Config.in b/package/libinput/Config.in
index 14e4e70f96..1a8fcc7ed4 100644
--- a/package/libinput/Config.in
+++ b/package/libinput/Config.in
@@ -13,5 +13,27 @@ config BR2_PACKAGE_LIBINPUT
 
 	  http://freedesktop.org/wiki/Software/libinput/
 
+if BR2_PACKAGE_LIBINPUT
+
+config BR2_PACKAGE_LIBINPUT_PYTHON_TOOLS
+	bool "install python tools "
+	depends on BR2_PACKAGE_PYTHON3
+	select BR2_PACKAGE_PYTHON_LIBEVDEV # runtime
+	select BR2_PACKAGE_PYTHON_PYUDEV # runtime
+	select BR2_PACKAGE_PYTHON_PYYAML # runtime
+	help
+	  Install python tools:
+	  libinput-analyze-per-slot-delta,
+	  libinput-analyze-recording,
+	  libinput-analyze-touch-down-state,
+	  libinput-measure-fuzz,
+	  libinput-measure-touchpad-pressure,
+	  libinput-measure-touchpad-size,
+	  libinput-measure-touchpad-tap,
+	  libinput-measure-touch-size,
+	  libinput-replay
+
+endif
+
 comment "libinput needs udev /dev management"
 	depends on !BR2_PACKAGE_HAS_UDEV
diff --git a/package/libinput/libinput.mk b/package/libinput/libinput.mk
index 1529411355..3454907bab 100644
--- a/package/libinput/libinput.mk
+++ b/package/libinput/libinput.mk
@@ -30,6 +30,7 @@ else
 LIBINPUT_CONF_OPTS += -Ddebug-gui=false
 endif
 
+ifeq ($(BR2_PACKAGE_LIBINPUT_PYTHON_TOOLS),)
 LIBINPUT_PYTHON_TOOLS = libinput-analyze-per-slot-delta \
 	libinput-analyze-recording \
 	libinput-analyze-touch-down-state \
@@ -46,5 +47,6 @@ define LIBINPUT_REMOVE_UNNEEDED_FILES
 	)
 endef
 LIBINPUT_POST_INSTALL_TARGET_HOOKS += LIBINPUT_REMOVE_UNNEEDED_FILES
+endif
 
 $(eval $(meson-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

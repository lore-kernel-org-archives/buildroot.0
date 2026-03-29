Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70CC2F3D5FF
	for <buildroot@archiver.kernel.org>; Sun, 29 Mar 2026 11:06:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1CFAD60A9E;
	Sun, 29 Mar 2026 11:06:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K5BXPjnOetgI; Sun, 29 Mar 2026 11:06:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B288F60A7B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774782404;
	bh=XwvB3asxL0M5nYQDNBRTlRcdyYK5jnhnOVQemO/zTtk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=sgz0FXSFWIdmbFEyUlgIO1D7NOnkaV0AAH4keZ60UancM1pBjpggghbjRQYCVQQ2h
	 AMrDYrfvbcUSq0gTzt4DozHDjR8ixQRA8aC49WJ1G3suhSogesUpEmVtV5m+rAe2St
	 aX3t9DnmnDGw56PymWh2C4dWIp7HjwhFR0G5prU/a+knaksGqCxCBvH3uDGNFmnBXW
	 RvHXWSgbl5T2HbPwfqy2mbv8xlniV7otvDv0StdxyS6aH4x2dDjXOr3oXzNwp3+QyX
	 iIbOdnK7tVbHE4oaKysrVrTjYwCyCCl/eDScOnU8LqrOFfOv3+dQwgkmEBpGVDkxAo
	 rmDsumhHG0Tgg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B288F60A7B;
	Sun, 29 Mar 2026 11:06:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 691FB374
 for <buildroot@buildroot.org>; Sun, 29 Mar 2026 11:06:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4C9B5810B7
 for <buildroot@buildroot.org>; Sun, 29 Mar 2026 11:06:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2Ir37gLg9wth for <buildroot@buildroot.org>;
 Sun, 29 Mar 2026 11:06:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3A2E68103B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3A2E68103B
 for <buildroot@buildroot.org>; Sun, 29 Mar 2026 11:06:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 89A917FDB7; Sun, 29 Mar 2026 11:06:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 29 Mar 2026 12:03:28 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bdd2384cc266ada6cca762c8e9b7ff0bd924f9ba
X-Git-Newrev: 6c0ceb48b3d6561315e4e5c66329fa635ba89dd1
X-Patchwork-Hint: ignore
Message-Id: <20260329110635.89A917FDB7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-farama-notifications: new
 package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/6c0ceb48b3d6561315e4e5c66329fa635ba89dd1
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Add support for the python-farama-notifications package,
which provides a unified notification mechanism for all
libraries maintained by the FaramaFoundation.

This package is used by Farama projects such as gymnasium
to deliver runtime and deprecation notifications in a
consistent way.

Signed-off-by: Xukai Wang <kingxukai@zohomail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 DEVELOPERS                                                 |  1 +
 package/Config.in                                          |  1 +
 package/python-farama-notifications/Config.in              |  7 +++++++
 .../python-farama-notifications.hash                       |  5 +++++
 .../python-farama-notifications.mk                         | 14 ++++++++++++++
 5 files changed, 28 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 781d82ecd1..a4d5d37eff 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3481,6 +3481,7 @@ F:	configs/ti_am64x_sk_defconfig
 
 N:	Xukai Wang <kingxukai@zohomail.com>
 F:	package/python-cloudpickle/
+F:	package/python-farama-notifications/
 
 N:	Yair Ben Avraham <yairba@protonmail.com>
 F:	package/casync/
diff --git a/package/Config.in b/package/Config.in
index c113a9780e..a9a2785102 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1108,6 +1108,7 @@ menu "External python modules"
 	source "package/python-evdev/Config.in"
 	source "package/python-executing/Config.in"
 	source "package/python-falcon/Config.in"
+	source "package/python-farama-notifications/Config.in"
 	source "package/python-fastapi/Config.in"
 	source "package/python-fastapi-sessions/Config.in"
 	source "package/python-fastui/Config.in"
diff --git a/package/python-farama-notifications/Config.in b/package/python-farama-notifications/Config.in
new file mode 100644
index 0000000000..06be45d996
--- /dev/null
+++ b/package/python-farama-notifications/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_FARAMA_NOTIFICATIONS
+	bool "python-farama-notifications"
+	help
+	  Notifications for all Farama Foundation maintained
+	  libraries.
+
+	  https://github.com/Farama-Foundation/Farama-Notifications
diff --git a/package/python-farama-notifications/python-farama-notifications.hash b/package/python-farama-notifications/python-farama-notifications.hash
new file mode 100644
index 0000000000..b8ef65f8a8
--- /dev/null
+++ b/package/python-farama-notifications/python-farama-notifications.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/farama-notifications/json
+md5  5caeb9a1f37a2e4ccdeff13858f41444  Farama-Notifications-0.0.4.tar.gz
+sha256  13fceff2d14314cf80703c8266462ebf3733c7d165336eee998fc58e545efd18  Farama-Notifications-0.0.4.tar.gz
+# Locally computed sha256 checksums
+sha256  7ff6336b33ae4c168086e899a11b7c91d369b6758cee20f9469d563f004f89eb  LICENSE
diff --git a/package/python-farama-notifications/python-farama-notifications.mk b/package/python-farama-notifications/python-farama-notifications.mk
new file mode 100644
index 0000000000..2ed06ad150
--- /dev/null
+++ b/package/python-farama-notifications/python-farama-notifications.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-farama-notifications
+#
+################################################################################
+
+PYTHON_FARAMA_NOTIFICATIONS_VERSION = 0.0.4
+PYTHON_FARAMA_NOTIFICATIONS_SOURCE = Farama-Notifications-$(PYTHON_FARAMA_NOTIFICATIONS_VERSION).tar.gz
+PYTHON_FARAMA_NOTIFICATIONS_SITE = https://files.pythonhosted.org/packages/2e/2c/8384832b7a6b1fd6ba95bbdcae26e7137bb3eedc955c42fd5cdcc086cfbf
+PYTHON_FARAMA_NOTIFICATIONS_SETUP_TYPE = setuptools
+PYTHON_FARAMA_NOTIFICATIONS_LICENSE = MIT
+PYTHON_FARAMA_NOTIFICATIONS_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

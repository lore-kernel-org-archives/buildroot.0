Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0110C7EE23
	for <buildroot@archiver.kernel.org>; Thu, 11 May 2023 12:32:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2E2088421C;
	Thu, 11 May 2023 12:32:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2E2088421C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mR1mWVsFghWb; Thu, 11 May 2023 12:32:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4651183F98;
	Thu, 11 May 2023 12:32:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4651183F98
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1F8E71BF297
 for <buildroot@lists.busybox.net>; Thu, 11 May 2023 12:32:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EC91860BAA
 for <buildroot@lists.busybox.net>; Thu, 11 May 2023 12:32:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EC91860BAA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id metXorYQ04v6 for <buildroot@lists.busybox.net>;
 Thu, 11 May 2023 12:32:51 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DFA7860BA9
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DFA7860BA9
 for <buildroot@buildroot.org>; Thu, 11 May 2023 12:32:50 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.localdomain ([89.144.220.58]) by mail.gmx.net
 (mrgmx004 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1MzQg6-1qA6760ojY-00vMeR; Thu, 11 May 2023 14:32:48 +0200
From: Daniel Lang <dalang@gmx.at>
To: buildroot@buildroot.org
Date: Thu, 11 May 2023 14:30:40 +0200
Message-Id: <20230511123040.398221-1-dalang@gmx.at>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Provags-ID: V03:K1:1WwrRKqDNUiwL/8uEwG+t+6nPWQZECCTWQQMplFju0FzOqALCxi
 GJu2Y/mmWh+iaD4dy6b2c3Gl8YBSUbfBTNwHOZNJsJBOYvQY5A7eapY+iD2pXjupvt59/t0
 b9sd2AFAmze6kIUtiA3DUB0kKPg7HE8KN97vDwVcSAFm/khGweBiB4lfbhD/bzRPc2gJI2E
 3SO6CFNsUFiHyuDeHy0Pg==
UI-OutboundReport: notjunk:1;M01:P0:2Unn50k6S8c=;cFVTV8hMR/SQWLsMUsKkTFRoPqD
 +dx/QHXu/Ntj7+tvJSY9BgyOhKm13FpskBMjoeUmGuRQoGquBt6QAAyQjVlKAhqmp8OgQZ7Rl
 ykPnWRm4yc+JGS/9pj7Z6v9mTBF3+bnMMfWtoEoQVzhEkTC+BErSQ1egwRjKnSTeyQG5AQhx5
 8MSv522Ss/V8qt6WXKU99zgh9qYcCGjGxLq1mPFq5HZaxdWwgNPhNEHQg8HP/WcyhLLK86e/H
 94Em9qr6Yt10mamQ+7EsFBmPWJrkwFHrGFP87I8U3+EupgFokSOGUYqT1QvY42jX1y6hD3eks
 su9LioMh97EPT9v6dzqMkJ9CQSFf9tJMG+nIumSaEqNgzXsg9oc2PBabA7UtcOJPF+i4ULvhY
 nrlfRsbQ6Ch/TTgTL6skx0Rf3DUUr9/iwvWo7yLoAiI4Xf/Tyjj/tPRUtpceEntbEmHrp/ROS
 Z/uXEER3qiI1t4eFUCAhahJcTOOiw7ItxUOMqzTn+9qlI5g0VQ7R7serNGhqkLq+zMNbeEelv
 2POS4bCpYH3e8veP1BGm1AhkgdINEfOoddiUartQpcwW0sF11LeHpSQTL2VN+NB9bS7Nk/3Kf
 TLQhYHjoudVRc947EFSI0PZTQTYoZ2hJGK+CWrRuQaZ9p0+uEHNKYdKsEujAQQLMf+DKVgJw6
 dSZu1/9TkSupyP61bIcI1PU/8f8jxl5bkhWAa2FFo56JBP6cp1E4ZqMIjQMwTfLLbL/2Bzc+4
 H3ynxgs3CE1pypi5SemRomfUCpY45mO8ITqicuq+A70vzZudQU1ZfoEQrYKimyEtL21/bHOOU
 lhac6CF8sgrK+viPk7iserlIabz2LVw9y1+kQN45AzRplVg4bpLUvmsNsNygA2fJIDqlckE2r
 9IvJA2X4/iXh5K8sVTyhl4VrloKn6U6SNNkkVMVGqJN5ioyp8/mh3vPAgiwM90Zk42XyLqDFo
 HiVdSXkTv2tFdasEYgIqMQzcinA=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.at; s=s31663417; 
 t=1683808368; i=dalang@gmx.at;
 bh=XjeK742C0uWREC0RyKti6G0ddV+frhtRlxDGf9pIcpU=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=IApVmdNwbVHuiSPvfAV/6VVnY6mGM0HUxQRRQ+mjK0Fq1o1G4GmpYQ+uFVMK5ZxJ5
 3VcO/pd4XhyUq4ODSkz6ZgmBhMC0xc30nKPdqef2YqvhOEdw9W1hM1CMc6BqmjqC1/
 Ib89eQKnPvBooaRdktO5YgHT/zsFQJ9xx9JPbbhwL0BIuESneM462KItF8Pd+3je7w
 2GSP7cHXpYJu17GfGPK6dv13p2yrLFrsV1WjGtbxhprOBPTXuR8ub3iuUSxBxSZ4BM
 vPUwGv85Vuq3j/esGmH5CpENOCmffO4/iT7jGC/Pmg0aINPoTdCzcJvRVAVVKCI9ha
 AzyRCLrh5iwkQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.at header.i=dalang@gmx.at
 header.a=rsa-sha256 header.s=s31663417 header.b=IApVmdNw
Subject: [Buildroot] [PATCH] package/at-spi2-core: bump to version 2.48.1
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://gitlab.gnome.org/GNOME/at-spi2-core/-/blob/AT_SPI2_CORE_2_48_1/NEWS

Upstream patch is included in this version.

Signed-off-by: Daniel Lang <dalang@gmx.at>
---
 ...iring-libsystemd-when-configured-to-.patch | 93 -------------------
 package/at-spi2-core/at-spi2-core.hash        |  4 +-
 package/at-spi2-core/at-spi2-core.mk          |  2 +-
 3 files changed, 3 insertions(+), 96 deletions(-)
 delete mode 100644 package/at-spi2-core/0001-meson-Avoid-requiring-libsystemd-when-configured-to-.patch

diff --git a/package/at-spi2-core/0001-meson-Avoid-requiring-libsystemd-when-configured-to-.patch b/package/at-spi2-core/0001-meson-Avoid-requiring-libsystemd-when-configured-to-.patch
deleted file mode 100644
index 78d206ed79..0000000000
--- a/package/at-spi2-core/0001-meson-Avoid-requiring-libsystemd-when-configured-to-.patch
+++ /dev/null
@@ -1,93 +0,0 @@
-From aeb14ffccaabe65a64e976576d71f30eb2165f43 Mon Sep 17 00:00:00 2001
-From: Adrian Perez de Castro <aperez@igalia.com>
-Date: Mon, 24 Apr 2023 12:09:50 +0300
-Subject: [PATCH] meson: Avoid requiring libsystemd when configured to use
- dbus-daemon
-
-Checks for dbus-daemon and dbus-broker only when they are chosen
-with default_bus. This avoids requiring the systemd libraries if
-one wants the built at-spi2-core to use dbus-daemon, but dbus-worker
-is somehow available in the $PATH. A typical scenario is cross
-compilation, where the build host may have a dbus-broker program
-available, but the target system may not have it (or may not have
-nor want to use the systemd libraries).
-
-Upstream: https://gitlab.gnome.org/GNOME/at-spi2-core/-/merge_requests/134
-Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
----
- bus/meson.build | 53 ++++++++++++++++++++++++-------------------------
- 1 file changed, 26 insertions(+), 27 deletions(-)
-
-diff --git a/bus/meson.build b/bus/meson.build
-index 22a1bce6..2f3c5621 100644
---- a/bus/meson.build
-+++ b/bus/meson.build
-@@ -46,39 +46,38 @@ launcher_args = [
-              '-DDATADIR="@0@"'.format(atspi_datadir),
-            ]
- 
--if get_option('dbus_daemon') != 'default'
--  launcher_args += '-DDBUS_DAEMON="@0@"'.format(get_option('dbus_daemon'))
--else
--  dbus_daemon = find_program('dbus-daemon',
--                             '/sbin/dbus-daemon',
--                             '/usr/sbin/dbus-daemon',
--                             '/libexec/dbus-daemon',
--                             '/usr/libexec/dbus-daemon',
--                             '/usr/lib/dbus-daemon',
--                             '/usr/pkg/bin/dbus-daemon',
--                             required: false)
--  if dbus_daemon.found()
--    launcher_args += '-DDBUS_DAEMON="@0@"'.format(dbus_daemon.full_path())
--  endif
--endif
--
- needs_systemd = false
--if get_option('dbus_broker') != 'default'
--  launcher_args += '-DDBUS_BROKER="@0@"'.format(get_option('dbus_broker'))
--  needs_systemd = true
-+if get_option('default_bus') == 'dbus-daemon'
-+  if get_option('dbus_daemon') != 'default'
-+    launcher_args += '-DDBUS_DAEMON="@0@"'.format(get_option('dbus_daemon'))
-+  else
-+    dbus_daemon = find_program('dbus-daemon',
-+                               '/sbin/dbus-daemon',
-+                               '/usr/sbin/dbus-daemon',
-+                               '/libexec/dbus-daemon',
-+                               '/usr/libexec/dbus-daemon',
-+                               '/usr/lib/dbus-daemon',
-+                               '/usr/pkg/bin/dbus-daemon',
-+                               required: false)
-+    if dbus_daemon.found()
-+      launcher_args += '-DDBUS_DAEMON="@0@"'.format(dbus_daemon.full_path())
-+    endif
-+  endif
- else
--  dbus_broker = find_program('dbus-broker-launch',
--                             required: false)
--  if dbus_broker.found()
--    launcher_args += '-DDBUS_BROKER="@0@"'.format(dbus_broker.full_path())
-+  launcher_args += '-DWANT_DBUS_BROKER'
-+  if get_option('dbus_broker') != 'default'
-+    launcher_args += '-DDBUS_BROKER="@0@"'.format(get_option('dbus_broker'))
-     needs_systemd = true
-+  else
-+    dbus_broker = find_program('dbus-broker-launch',
-+                               required: false)
-+    if dbus_broker.found()
-+      launcher_args += '-DDBUS_BROKER="@0@"'.format(dbus_broker.full_path())
-+      needs_systemd = true
-+    endif
-   endif
- endif
- 
--if get_option('default_bus') == 'dbus-broker'
--  launcher_args += '-DWANT_DBUS_BROKER'
--endif
--
- if needs_systemd
-   systemd_dep = dependency('libsystemd')
- else
--- 
-2.34.1
-
diff --git a/package/at-spi2-core/at-spi2-core.hash b/package/at-spi2-core/at-spi2-core.hash
index 9cf80d1cc0..d5b096efd0 100644
--- a/package/at-spi2-core/at-spi2-core.hash
+++ b/package/at-spi2-core/at-spi2-core.hash
@@ -1,5 +1,5 @@
-# From https://download.gnome.org/sources/at-spi2-core/2.48/at-spi2-core-2.48.0.sha256sum
-sha256  905a5b6f1790b68ee803bffa9f5fab4ceb591fb4fae0b2f8c612c54f1d4e8a30  at-spi2-core-2.48.0.tar.xz
+# From https://download.gnome.org/sources/at-spi2-core/2.48/at-spi2-core-2.48.1.sha256sum
+sha256  abfe36b601884144699a577fed1e2cb2b5d6fdd88d60aa4d2e886d3737692e6d  at-spi2-core-2.48.1.tar.xz
 
 # locally calculated
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/at-spi2-core/at-spi2-core.mk b/package/at-spi2-core/at-spi2-core.mk
index e4489f6f88..3288b1aa2c 100644
--- a/package/at-spi2-core/at-spi2-core.mk
+++ b/package/at-spi2-core/at-spi2-core.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 AT_SPI2_CORE_VERSION_MAJOR = 2.48
-AT_SPI2_CORE_VERSION = $(AT_SPI2_CORE_VERSION_MAJOR).0
+AT_SPI2_CORE_VERSION = $(AT_SPI2_CORE_VERSION_MAJOR).1
 AT_SPI2_CORE_SOURCE = at-spi2-core-$(AT_SPI2_CORE_VERSION).tar.xz
 AT_SPI2_CORE_SITE = https://download.gnome.org/sources/at-spi2-core/$(AT_SPI2_CORE_VERSION_MAJOR)
 AT_SPI2_CORE_LICENSE = LGPL-2.1+
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F801C77B7F
	for <buildroot@archiver.kernel.org>; Sun, 14 May 2023 13:29:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F1D6781F88;
	Sun, 14 May 2023 13:29:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F1D6781F88
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tngQmtdYnnjz; Sun, 14 May 2023 13:29:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D79FE81F39;
	Sun, 14 May 2023 13:29:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D79FE81F39
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 321431BF5A4
 for <buildroot@lists.busybox.net>; Sun, 14 May 2023 13:29:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1224860B83
 for <buildroot@lists.busybox.net>; Sun, 14 May 2023 13:29:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1224860B83
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EvMZD1SX1ymH for <buildroot@lists.busybox.net>;
 Sun, 14 May 2023 13:29:45 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0783D60B69
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0783D60B69
 for <buildroot@buildroot.org>; Sun, 14 May 2023 13:29:43 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.localdomain ([89.144.220.58]) by mail.gmx.net
 (mrgmx104 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1MTiTt-1pbHCL44pZ-00U537; Sun, 14 May 2023 15:29:41 +0200
From: Daniel Lang <dalang@gmx.at>
To: buildroot@buildroot.org
Date: Sun, 14 May 2023 15:28:31 +0200
Message-Id: <20230514132831.3555614-1-dalang@gmx.at>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Provags-ID: V03:K1:BRMO3hggEkMYNX8tj9TMoODwimdRyeRMg9xfCEPKEs2F+r/X0UU
 uGuFbco7WvCfxwuHjxhYerQuhXVvJJfU0pWZ4M3/whshKroBEAJW8faYs7CWHROmtPmWD7r
 ggwKXYsvAFbdXV0/PnyCd9hqxn8rwkyw5diA6Wpcu33MksaD/JkRdAee+WnEJ505/mdux8o
 zbZvgPxkfPd4bDoo0a8Aw==
UI-OutboundReport: notjunk:1;M01:P0:yNU3NoYTTZU=;ObyujAe/6EFTDc4HvxZuuh2n1MX
 pzvYtG0Mw1fl89YIhEMak4z69Jqhg7qrjbY/gVYzcEYxwP1weCtBt9Q6eDaEZsfa4SqEbKTtN
 /v9Twye9ebWF1j68xRCBfoC2o+kWR9XP+TpF5Po2QZBK0EzSH14TeRsi+wB67Tp+ItkAWWEqx
 +IekLL/AJ8EzgOcN7JyYgElFHfps2ENQMdPriQgltiGFFaiXmbtvUYVbQMBG3/fOjLMmpNaAZ
 oQVR+g8IRvoIHEq2/5aacz9nW9OIdHMU70nn1E7ZCrTg3p1CJBSAvrxyR+btXUkhe5HKBfvIK
 CGwvXFbdOqBioZikia7tUmg0g6xG5vjf3ZpDnsFer7k0yvi62FHnmBBR3swFxNNtBDp0Sf+wt
 hEscUJeYRICgruj0lbvNSgXoa5ICRn8XRxWnx3hnt2EfymB4ISskB3sysJpNy0XVLkVijh+vz
 WPBRz/X6rV8xhpQ+CfPM9qQVyrAHNfGHyQek1mzYPnm8oOPjgbtv/g7f/bcszEGc7QFiBC5hJ
 50qoQx2PIgtZtNY/gFVcCjHd2DpryN33uBcYNH0f6cOsflounpbDvnX6ptcbzQ6LVvqCmGHfa
 hDIqKoiB+lH8rQXj1zVWxl3RrKUZ+J8eNQkjx5KE/R4Z57Fip6V64UbGNd6f1BMW8cmej/YIr
 ksYKEaxpgDfG04Up/jTFO7Ug3HLU6lSwW51e8y1AwonMxAqYeS9UvqJXZkWsiyQQUtZQWeWu0
 bEg7YDUI1RJ1yIsM984HHK5OIipszcle2jopbwf2dowlTros5sM9fptIEcQVMxzSAH2k69Rxl
 ht1PbGtJm9cDFRb2NpAeE8PMsOGpvXlJsaDTEGrFEwQ9jgktBlJyQ+F5EsEu9CT8NrN9rfyy/
 W+6KTqTAv3x3IP7urMAi/6KW3r9geMLLlueXtxF8+tKAMHEPm7dc85yIWUeMRgMnqcIO6hb+c
 KL39/coTHCAXLEOWGFVjQ1m07hw=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.at; s=s31663417; 
 t=1684070981; i=dalang@gmx.at;
 bh=yRM6baCB+7JoesVcx2pj/wgMC8X2I79a5eNUvD6oO/U=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=Tfha6PohCX6MEtYfUzVRb7dOFBVWj5uP8VzzEfBmHUaeRsSI/HWxIMMCA443/KoCY
 HdGmZWzJqxi3DS8Lf5yWDYQtr1XW/hOdDTsx6tc/Pe3ufDCuy+YXk+GU9ifuILr+s2
 5FiMthuLAOLf7fv8Zcwmjm2tZ7vG8HXrjel1us972kKATMAfMlafPwFma6KCORwQ7d
 MN4+tATrLqBA7/dgAOuqSCl4sEDrR3Fmmq2eqDjx8arZ1s5Wts2YNi1Ww3ftaSnVc2
 XzPvzNxuEf49HsvA9s/HowLb/MsklOPsXjXp6jD8K8patqnLUxV37a/KtY3x3htPLx
 8nUICozr/bcJA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.at header.i=dalang@gmx.at
 header.a=rsa-sha256 header.s=s31663417 header.b=Tfha6Poh
Subject: [Buildroot] [PATCH v2] package/at-spi2-core: bump to version 2.48.2
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

https://gitlab.gnome.org/GNOME/at-spi2-core/-/blob/AT_SPI2_CORE_2_48_2/NEWS

Upstream patch is included in this version.

Signed-off-by: Daniel Lang <dalang@gmx.at>

---
v1 -> v2:
bump to 2.48.2 instead of 2.48.1

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
index 9cf80d1cc0..db3ea7096e 100644
--- a/package/at-spi2-core/at-spi2-core.hash
+++ b/package/at-spi2-core/at-spi2-core.hash
@@ -1,5 +1,5 @@
-# From https://download.gnome.org/sources/at-spi2-core/2.48/at-spi2-core-2.48.0.sha256sum
-sha256  905a5b6f1790b68ee803bffa9f5fab4ceb591fb4fae0b2f8c612c54f1d4e8a30  at-spi2-core-2.48.0.tar.xz
+# From https://download.gnome.org/sources/at-spi2-core/2.48/at-spi2-core-2.48.2.sha256sum
+sha256  86ebcb55f678381d7ed7825736add42dfccb70ad3b981dfd65d72e58f87828ee  at-spi2-core-2.48.2.tar.xz
 
 # locally calculated
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/at-spi2-core/at-spi2-core.mk b/package/at-spi2-core/at-spi2-core.mk
index e4489f6f88..e9a93b3eda 100644
--- a/package/at-spi2-core/at-spi2-core.mk
+++ b/package/at-spi2-core/at-spi2-core.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 AT_SPI2_CORE_VERSION_MAJOR = 2.48
-AT_SPI2_CORE_VERSION = $(AT_SPI2_CORE_VERSION_MAJOR).0
+AT_SPI2_CORE_VERSION = $(AT_SPI2_CORE_VERSION_MAJOR).2
 AT_SPI2_CORE_SOURCE = at-spi2-core-$(AT_SPI2_CORE_VERSION).tar.xz
 AT_SPI2_CORE_SITE = https://download.gnome.org/sources/at-spi2-core/$(AT_SPI2_CORE_VERSION_MAJOR)
 AT_SPI2_CORE_LICENSE = LGPL-2.1+
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

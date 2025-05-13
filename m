Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4E51C3ABC3
	for <buildroot@archiver.kernel.org>; Tue, 13 May 2025 20:33:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3491540925;
	Tue, 13 May 2025 20:33:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IGMcl_G7m5Um; Tue, 13 May 2025 20:33:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 37F8540B8E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 37F8540B8E;
	Tue, 13 May 2025 20:33:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id EEA3412A
 for <buildroot@buildroot.org>; Tue, 13 May 2025 20:33:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D4B97812BB
 for <buildroot@buildroot.org>; Tue, 13 May 2025 20:33:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c_dpZZM-c1Np for <buildroot@buildroot.org>;
 Tue, 13 May 2025 20:33:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1A94F80DBB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1A94F80DBB
 for <buildroot@buildroot.org>; Tue, 13 May 2025 20:33:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0953D8688C; Tue, 13 May 2025 20:33:10 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Tue, 13 May 2025 22:31:05 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 999fb19d4b09c9ced3425668b7c3a12a9dd88b87
X-Git-Newrev: 778da2b7195f8ba93d17282c00a4aaffaf5d4908
X-Patchwork-Hint: ignore
Message-Id: <20250513203310.0953D8688C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/dbus-glib: bump version to 0.114
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=778da2b7195f8ba93d17282c00a4aaffaf5d4908
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For change log, see [1].

A notable change is that this release fixes GCC 15 build issues
and some deprecation warnings.

Updated license files and hashes due to upstream commit [2].
There is not an actual license change.

[1] https://gitlab.freedesktop.org/dbus/dbus-glib/-/blob/dbus-glib-0.114/NEWS
[2] https://gitlab.freedesktop.org/dbus/dbus-glib/-/commit/ad08ba0c6ba2d69783d41254e0cf03b2ae1647db

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Florian Larysch <fl@n621.de>
Tested-by: Florian Larysch <fl@n621.de>
[Julien: add extra info in the commit log]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/dbus-glib/dbus-glib.hash | 6 ++++--
 package/dbus-glib/dbus-glib.mk   | 7 +++++--
 2 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/package/dbus-glib/dbus-glib.hash b/package/dbus-glib/dbus-glib.hash
index 072dde3d69..1ce3c6b63d 100644
--- a/package/dbus-glib/dbus-glib.hash
+++ b/package/dbus-glib/dbus-glib.hash
@@ -1,5 +1,7 @@
 # Locally calculated after checking pgp signature
-sha256  7d550dccdfcd286e33895501829ed971eeb65c614e73aadb4a08aeef719b143a  dbus-glib-0.112.tar.gz
+sha256  c09c5c085b2a0e391b8ee7d783a1d63fe444e96717cc1814d61b5e8fc2827a7c  dbus-glib-0.114.tar.gz
 
 # Locally calculated
-sha256  589bc300214a8b9ecd121f51570fe6342617487fd8fc0fb1f4ec26a13d5b96f8  COPYING
+sha256  095e2affe38031d0ca80db5dbf06881306e5f5125f6ba422297396bdfe02b3d5  COPYING
+sha256  93bb4f7417aa775bab9026cc3d0af28aeb64451fc5a8ec651876785edd8eaf9b  LICENSES/AFL-2.1.txt
+sha256  aaf135472f81c5b4a0dca9367e5bb5e9750032b5bebe5442b36e4c0a47430df3  LICENSES/GPL-2.0-or-later.txt
diff --git a/package/dbus-glib/dbus-glib.mk b/package/dbus-glib/dbus-glib.mk
index 0d247e1d89..5c13c0b37f 100644
--- a/package/dbus-glib/dbus-glib.mk
+++ b/package/dbus-glib/dbus-glib.mk
@@ -4,11 +4,14 @@
 #
 ################################################################################
 
-DBUS_GLIB_VERSION = 0.112
+DBUS_GLIB_VERSION = 0.114
 DBUS_GLIB_SITE = http://dbus.freedesktop.org/releases/dbus-glib
 DBUS_GLIB_INSTALL_STAGING = YES
 DBUS_GLIB_LICENSE = AFL-2.1 or GPL-2.0+
-DBUS_GLIB_LICENSE_FILES = COPYING
+DBUS_GLIB_LICENSE_FILES = \
+	COPYING \
+	LICENSES/AFL-2.1.txt \
+	LICENSES/GPL-2.0-or-later.txt
 DBUS_GLIB_CPE_ID_VENDOR = freedesktop
 
 DBUS_GLIB_CONF_ENV = \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

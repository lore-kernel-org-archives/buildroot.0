Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE086C4332F
	for <buildroot@archiver.kernel.org>; Sat,  4 Nov 2023 21:21:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 685DD60D4D;
	Sat,  4 Nov 2023 21:21:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 685DD60D4D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nRE--iKH3CzQ; Sat,  4 Nov 2023 21:21:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A4AF060BCF;
	Sat,  4 Nov 2023 21:21:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A4AF060BCF
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 590451BF2F9
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 21:20:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3025D4038B
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 21:20:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3025D4038B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fNIoeE08d1_e for <buildroot@lists.busybox.net>;
 Sat,  4 Nov 2023 21:20:57 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 00A6C40273
 for <buildroot@buildroot.org>; Sat,  4 Nov 2023 21:20:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 00A6C40273
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DCBBE86339; Sat,  4 Nov 2023 21:20:56 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 4 Nov 2023 22:20:40 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 489562aca728a70ec74e9860ae94627cdb2eb163
X-Git-Newrev: b66e581eb17605fc8cc3d9e90c03000a717b2f57
X-Patchwork-Hint: ignore
Message-Id: <20231104212056.DCBBE86339@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gsettings-desktop-schemas: bump to
 version 45.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=b66e581eb17605fc8cc3d9e90c03000a717b2f57
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This update is required to install the latest version of the GNOME desktop.

Currently, only gvfs depends on this package, and we have confirmed that
gvfs can be built.

Signed-off-by: Takumi Takahashi <takumiiinn@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                                       | 3 +++
 package/gsettings-desktop-schemas/gsettings-desktop-schemas.hash | 4 ++--
 package/gsettings-desktop-schemas/gsettings-desktop-schemas.mk   | 4 ++--
 3 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 75d2ade9e9..14bf8d982c 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2835,6 +2835,9 @@ F:	package/reproc/
 F:	package/termcolor/
 F:	package/tl-expected/
 
+N:	Takumi Takahashi <takumiiinn@gmail.com>
+F:	package/gsettings-desktop-schemas/
+
 N:	Tan En De <ende.tan@starfivetech.com>
 F:	package/libkcapi/
 
diff --git a/package/gsettings-desktop-schemas/gsettings-desktop-schemas.hash b/package/gsettings-desktop-schemas/gsettings-desktop-schemas.hash
index bad8eab91d..0d80c87e06 100644
--- a/package/gsettings-desktop-schemas/gsettings-desktop-schemas.hash
+++ b/package/gsettings-desktop-schemas/gsettings-desktop-schemas.hash
@@ -1,5 +1,5 @@
-# From https://download.gnome.org/sources/gsettings-desktop-schemas/3.36/gsettings-desktop-schemas-3.36.1.sha256sum
-sha256  004bdbe43cf8290f2de7d8537e14d8957610ca479a4fa368e34dbd03f03ec9d9  gsettings-desktop-schemas-3.36.1.tar.xz
+# From https://download.gnome.org/sources/gsettings-desktop-schemas/45/gsettings-desktop-schemas-45.0.sha256sum
+sha256  365c8d04daf79b38c8b3dc9626349a024f9e4befdd31fede74b42f7a9fbe0ae2  gsettings-desktop-schemas-45.0.tar.xz
 
 # Hash for license file
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/gsettings-desktop-schemas/gsettings-desktop-schemas.mk b/package/gsettings-desktop-schemas/gsettings-desktop-schemas.mk
index b77397d565..b47097b9fe 100644
--- a/package/gsettings-desktop-schemas/gsettings-desktop-schemas.mk
+++ b/package/gsettings-desktop-schemas/gsettings-desktop-schemas.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-GSETTINGS_DESKTOP_SCHEMAS_VERSION_MAJOR = 3.36
-GSETTINGS_DESKTOP_SCHEMAS_VERSION = $(GSETTINGS_DESKTOP_SCHEMAS_VERSION_MAJOR).1
+GSETTINGS_DESKTOP_SCHEMAS_VERSION_MAJOR = 45
+GSETTINGS_DESKTOP_SCHEMAS_VERSION = $(GSETTINGS_DESKTOP_SCHEMAS_VERSION_MAJOR).0
 GSETTINGS_DESKTOP_SCHEMAS_SOURCE = gsettings-desktop-schemas-$(GSETTINGS_DESKTOP_SCHEMAS_VERSION).tar.xz
 GSETTINGS_DESKTOP_SCHEMAS_SITE = https://download.gnome.org/sources/gsettings-desktop-schemas/$(GSETTINGS_DESKTOP_SCHEMAS_VERSION_MAJOR)
 GSETTINGS_DESKTOP_SCHEMAS_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

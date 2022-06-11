Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51FD6C43334
	for <buildroot@archiver.kernel.org>; Sat, 11 Jun 2022 12:21:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E33A861298;
	Sat, 11 Jun 2022 12:21:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Fpo5y4U981e9; Sat, 11 Jun 2022 12:21:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 10A8C61291;
	Sat, 11 Jun 2022 12:21:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A65961BF418
 for <buildroot@lists.busybox.net>; Sat, 11 Jun 2022 12:21:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9512161290
 for <buildroot@lists.busybox.net>; Sat, 11 Jun 2022 12:21:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UFLSENnJFK78 for <buildroot@lists.busybox.net>;
 Sat, 11 Jun 2022 12:21:00 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mailout12.t-online.de (mailout12.t-online.de [194.25.134.22])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9D7A46128F
 for <buildroot@buildroot.org>; Sat, 11 Jun 2022 12:21:00 +0000 (UTC)
Received: from fwd72.dcpf.telekom.de (fwd72.aul.t-online.de [10.223.144.98])
 by mailout12.t-online.de (Postfix) with SMTP id 097C89044
 for <buildroot@buildroot.org>; Sat, 11 Jun 2022 14:20:58 +0200 (CEST)
Received: from fli4l.lan.fli4l ([91.58.12.97]) by fwd72.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1o006r-4gFOb30; Sat, 11 Jun 2022 14:20:57 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:38588)
 by fli4l.lan.fli4l with esmtp (Exim 4.95)
 (envelope-from <bernd.kuhls@t-online.de>) id 1o006r-0004Zq-Eb
 for buildroot@buildroot.org; Sat, 11 Jun 2022 14:20:57 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sat, 11 Jun 2022 14:20:57 +0200
Message-Id: <20220611122057.1226707-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1654950057-01439E5E-85D52BC6/0/0 CLEAN NORMAL
X-TOI-MSGID: 09db20a4-db5a-45ee-b3c6-363e2b296614
Subject: [Buildroot] [PATCH 1/1] package/openvpn: bump version to 2.5.7
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changelog:
https://github.com/OpenVPN/openvpn/blob/release/2.5/Changes.rst

Removed patch which is now included in this release.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 ...h-pam-c-add-missing-include-limits-h.patch | 41 -------------------
 package/openvpn/openvpn.hash                  |  2 +-
 package/openvpn/openvpn.mk                    |  2 +-
 3 files changed, 2 insertions(+), 43 deletions(-)
 delete mode 100644 package/openvpn/0001-auth-pam-c-add-missing-include-limits-h.patch

diff --git a/package/openvpn/0001-auth-pam-c-add-missing-include-limits-h.patch b/package/openvpn/0001-auth-pam-c-add-missing-include-limits-h.patch
deleted file mode 100644
index 34a6dbd034..0000000000
--- a/package/openvpn/0001-auth-pam-c-add-missing-include-limits-h.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From 0fed64a91d894b46105bf7e8b16edea4d90ab70c Mon Sep 17 00:00:00 2001
-From: Antonio Quartulli <a@unstable.cc>
-Date: Thu, 21 Apr 2022 15:19:09 +0200
-Subject: [PATCH] auth-pam.c: add missing include limits.h
-
-On most systems limits.h is pulled in by some other header and thus no
-error is ever triggered, but it's possible to find the right environment
-which lackis this and prevents compiling auth-pam.c (possibly when using
-LibreSSL).
-
-Include the header explicitly as it includes the definition of PATH_MAX.
-
-(note that this bug is fixed in Gentoo since 2020 by including a custom
-patch, but apparently the issue was never reported upstream)
-
-Reported-by: Michelangelo Scopelliti <kernelpanic@gmx.com>
-Signed-off-by: Antonio Quartulli <a@unstable.cc>
-Acked-by: Gert Doering <gert@greenie.muc.de>
-Message-Id: <20220421131909.32053-1-a@unstable.cc>
-URL: https://www.mail-archive.com/openvpn-devel@lists.sourceforge.net/msg24136.html
-Signed-off-by: Gert Doering <gert@greenie.muc.de>
-
-[Retrieved from:
-https://github.com/OpenVPN/openvpn/commit/0fed64a91d894b46105bf7e8b16edea4d90ab70c]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- src/plugins/auth-pam/auth-pam.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/plugins/auth-pam/auth-pam.c b/src/plugins/auth-pam/auth-pam.c
-index f893b51fe3..7033944568 100644
---- a/src/plugins/auth-pam/auth-pam.c
-+++ b/src/plugins/auth-pam/auth-pam.c
-@@ -47,6 +47,7 @@
- #include <fcntl.h>
- #include <signal.h>
- #include <syslog.h>
-+#include <limits.h>
- #include "utils.h"
- 
- #include <openvpn-plugin.h>
diff --git a/package/openvpn/openvpn.hash b/package/openvpn/openvpn.hash
index bd598a5186..0959b7f838 100644
--- a/package/openvpn/openvpn.hash
+++ b/package/openvpn/openvpn.hash
@@ -1,3 +1,3 @@
 # Locally calculated after checking signature
-sha256  333a7ef3d5b317968aca2c77bdc29aa7c6d6bb3316eb3f79743b59c53242ad3d  openvpn-2.5.6.tar.gz
+sha256  08340a389905c84196b6cd750add1bc0fa2d46a1afebfd589c24120946c13e68  openvpn-2.5.7.tar.gz
 sha256  1fcb78d7e478bb8a9408010bdc91b36e213b1facfad093df3f7ce7e28af19043  COPYRIGHT.GPL
diff --git a/package/openvpn/openvpn.mk b/package/openvpn/openvpn.mk
index db2f53a5f3..5c602e0448 100644
--- a/package/openvpn/openvpn.mk
+++ b/package/openvpn/openvpn.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENVPN_VERSION = 2.5.6
+OPENVPN_VERSION = 2.5.7
 OPENVPN_SITE = https://swupdate.openvpn.net/community/releases
 OPENVPN_DEPENDENCIES = host-pkgconf
 OPENVPN_LICENSE = GPL-2.0
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08459C38A02
	for <buildroot@archiver.kernel.org>; Sun, 30 Oct 2022 19:44:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ACA8A60AF6;
	Sun, 30 Oct 2022 19:44:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ACA8A60AF6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dgsGKxiu2Sk0; Sun, 30 Oct 2022 19:44:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D806C60AE4;
	Sun, 30 Oct 2022 19:44:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D806C60AE4
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 14F891BF2A1
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 19:44:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A189560AE4
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 19:44:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A189560AE4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4gKZwf1_jbr7 for <buildroot@lists.busybox.net>;
 Sun, 30 Oct 2022 19:44:31 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9908760AE0
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9908760AE0
 for <buildroot@buildroot.org>; Sun, 30 Oct 2022 19:44:31 +0000 (UTC)
Received: from fwd85.dcpf.telekom.de (fwd85.aul.t-online.de [10.223.144.111])
 by mailout03.t-online.de (Postfix) with SMTP id 7E9616C4C
 for <buildroot@buildroot.org>; Sun, 30 Oct 2022 20:44:28 +0100 (CET)
Received: from fli4l.lan.fli4l ([79.214.197.145]) by fwd85.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1opEEK-1oq6Ij0; Sun, 30 Oct 2022 20:44:24 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:48982)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1opEEJ-00073p-38
 for buildroot@buildroot.org; Sun, 30 Oct 2022 20:44:24 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sun, 30 Oct 2022 20:44:23 +0100
Message-Id: <20221030194423.1208535-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1667159064-2D8B7EA1-0B6B2EC7/0/0 CLEAN NORMAL
X-TOI-MSGID: baec8e6f-9a79-40e7-8c6b-02e4cfae1514
Subject: [Buildroot] [PATCH 1/1] package/flac: bump version to 1.4.2
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

Changelog: https://xiph.org/flac/changelog.html

Switched _SITE to https and update project URL.

Upstream removed the dependency to host-nasm:
https://github.com/xiph/flac/commit/75ef7958df603ca6de29fa00e82615e0da017903#diff-49473dca262eeab3b4a43002adb08b4db31020d190caaad1594b47f1d5daa810L474

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/flac/Config.in |  2 +-
 package/flac/flac.hash |  4 ++--
 package/flac/flac.mk   | 11 ++---------
 3 files changed, 5 insertions(+), 12 deletions(-)

diff --git a/package/flac/Config.in b/package/flac/Config.in
index 267acb7f34..62aca290fe 100644
--- a/package/flac/Config.in
+++ b/package/flac/Config.in
@@ -4,7 +4,7 @@ config BR2_PACKAGE_FLAC
 	help
 	  FLAC is an Open Source lossless audio codec.
 
-	  http://flac.sourceforge.net/
+	  https://xiph.org/flac/
 
 comment "flac needs a toolchain w/ wchar"
 	depends on !BR2_USE_WCHAR
diff --git a/package/flac/flac.hash b/package/flac/flac.hash
index 1f7763fd6e..b993ebd759 100644
--- a/package/flac/flac.hash
+++ b/package/flac/flac.hash
@@ -1,5 +1,5 @@
-# From http://downloads.xiph.org/releases/flac/SHA256SUMS.txt
-sha256  af41c0733c93c237c3e52f64dd87e3b0d9af38259f1c7d11e8cbf583c48c2506  flac-1.4.0.tar.xz
+# From https://ftp.osuosl.org/pub/xiph/releases/flac/SHA256SUMS.txt
+sha256  e322d58a1f48d23d9dd38f432672865f6f79e73a6f9cc5a5f57fcaa83eb5a8e4  flac-1.4.2.tar.xz
 # Locally computed
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING.GPL
 sha256  5df07007198989c622f5d41de8d703e7bef3d0e79d62e24332ee739a452af62a  COPYING.LGPL
diff --git a/package/flac/flac.mk b/package/flac/flac.mk
index 91d5840d72..ebb4778521 100644
--- a/package/flac/flac.mk
+++ b/package/flac/flac.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-FLAC_VERSION = 1.4.0
-FLAC_SITE = http://downloads.xiph.org/releases/flac
+FLAC_VERSION = 1.4.2
+FLAC_SITE = https://ftp.osuosl.org/pub/xiph/releases/flac
 FLAC_SOURCE = flac-$(FLAC_VERSION).tar.xz
 FLAC_INSTALL_STAGING = YES
 FLAC_DEPENDENCIES = $(if $(BR2_PACKAGE_LIBICONV),libiconv)
@@ -27,11 +27,4 @@ else
 FLAC_CONF_OPTS += --disable-ogg
 endif
 
-ifeq ($(BR2_X86_CPU_HAS_SSE),y)
-FLAC_DEPENDENCIES += host-nasm
-FLAC_CONF_OPTS += --enable-sse
-else
-FLAC_CONF_OPTS += --disable-sse
-endif
-
 $(eval $(autotools-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

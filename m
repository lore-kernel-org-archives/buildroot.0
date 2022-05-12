Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 497D5C433F5
	for <buildroot@archiver.kernel.org>; Thu, 12 May 2022 18:54:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id ED22240133;
	Thu, 12 May 2022 18:54:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DZGu9k2kIX6p; Thu, 12 May 2022 18:54:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EB13D400FB;
	Thu, 12 May 2022 18:54:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 66A631BF9CB
 for <buildroot@lists.busybox.net>; Thu, 12 May 2022 18:54:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4FE4940132
 for <buildroot@lists.busybox.net>; Thu, 12 May 2022 18:54:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eGvhjcyaRT_0 for <buildroot@lists.busybox.net>;
 Thu, 12 May 2022 18:53:59 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 69FA4400D0
 for <buildroot@buildroot.org>; Thu, 12 May 2022 18:53:59 +0000 (UTC)
Received: from fwd77.dcpf.telekom.de (fwd77.aul.t-online.de [10.223.144.103])
 by mailout03.t-online.de (Postfix) with SMTP id A1E6B3D80
 for <buildroot@buildroot.org>; Thu, 12 May 2022 20:53:56 +0200 (CEST)
Received: from fli4l.lan.fli4l ([79.214.203.41]) by fwd77.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1npDwi-0Sp6qf0; Thu, 12 May 2022 20:53:56 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:48510)
 by fli4l.lan.fli4l with esmtp (Exim 4.95)
 (envelope-from <bernd.kuhls@t-online.de>) id 1npDwh-0004aZ-LC
 for buildroot@buildroot.org; Thu, 12 May 2022 20:53:55 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Thu, 12 May 2022 20:53:33 +0200
Message-Id: <20220512185355.873825-3-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220512185355.873825-1-bernd.kuhls@t-online.de>
References: <20220512185355.873825-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1652381636-0001606D-1065483A/0/0 CLEAN NORMAL
X-TOI-MSGID: 04bf3856-5282-4acd-9598-dbb536bda06d
Subject: [Buildroot] [PATCH 03/25] package/x11r7/xlib_libXcursor: bump
 version to 1.2.1
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

Release notes:
https://lists.x.org/archives/xorg-announce/2022-April/003136.html

Removed md5 and sha1 hashes, not provided by upstream anymore.
Switched tarball to upstream-provided .xz format.

Updated license hash due to upstream commit "Convert COPYING from
ISO-8859-1 to UTF-8":
https://gitlab.freedesktop.org/xorg/lib/libxcursor/-/commit/66accad188420c40f0d62b409bfd2af605bb6f05

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xlib_libXcursor/xlib_libXcursor.hash | 10 ++++------
 package/x11r7/xlib_libXcursor/xlib_libXcursor.mk   |  4 ++--
 2 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/package/x11r7/xlib_libXcursor/xlib_libXcursor.hash b/package/x11r7/xlib_libXcursor/xlib_libXcursor.hash
index 3a12253d40..11575edbf5 100644
--- a/package/x11r7/xlib_libXcursor/xlib_libXcursor.hash
+++ b/package/x11r7/xlib_libXcursor/xlib_libXcursor.hash
@@ -1,7 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2019-March/002972.html
-md5 9b9be0e289130fb820aedf67705fc549  libXcursor-1.2.0.tar.bz2
-sha1 cca0b34955d3c2f657f05a2a2c40f75353ddd912  libXcursor-1.2.0.tar.bz2
-sha256 3ad3e9f8251094af6fe8cb4afcf63e28df504d46bfa5a5529db74a505d628782  libXcursor-1.2.0.tar.bz2
-sha512 2b12d0fd17e311ce269dbba58588698885815eb07aa44d48525ed5cd9e5f379bb90138a792a191e2f74888ab10b3ca9a4f507f21de0984ed79748973ab927a03  libXcursor-1.2.0.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2022-April/003136.html
+sha256  46c143731610bafd2070159a844571b287ac26192537d047a39df06155492104  libXcursor-1.2.1.tar.xz
+sha512  ebb42a39855aab86d0c11fe6ad33d011cf56a6dc5c309bef643460319c03df239b7e09fe88777bb25c0e9ff8aceac6bf66e51cc04a2d5ee463b3bc3bbf1674e3  libXcursor-1.2.1.tar.xz
 # Locally computed
-sha256 1f1588aff23eec0cb6bb9cfe02f8a75abbe43faf3d9b1eff54b7fbc42774b3ad  COPYING
+sha256  ad2e9d279088c5d612fb0e506ea8bb7d9f01b411e7f4b97b64589c3cd48a68f1  COPYING
diff --git a/package/x11r7/xlib_libXcursor/xlib_libXcursor.mk b/package/x11r7/xlib_libXcursor/xlib_libXcursor.mk
index 79d9904010..4a1ffcce9e 100644
--- a/package/x11r7/xlib_libXcursor/xlib_libXcursor.mk
+++ b/package/x11r7/xlib_libXcursor/xlib_libXcursor.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-XLIB_LIBXCURSOR_VERSION = 1.2.0
-XLIB_LIBXCURSOR_SOURCE = libXcursor-$(XLIB_LIBXCURSOR_VERSION).tar.bz2
+XLIB_LIBXCURSOR_VERSION = 1.2.1
+XLIB_LIBXCURSOR_SOURCE = libXcursor-$(XLIB_LIBXCURSOR_VERSION).tar.xz
 XLIB_LIBXCURSOR_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXCURSOR_LICENSE = MIT
 XLIB_LIBXCURSOR_LICENSE_FILES = COPYING
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

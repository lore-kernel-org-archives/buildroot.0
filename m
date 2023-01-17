Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30402C3DA78
	for <buildroot@archiver.kernel.org>; Tue, 17 Jan 2023 21:31:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BDE5F81959;
	Tue, 17 Jan 2023 21:31:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BDE5F81959
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7DtQm0dzxGYv; Tue, 17 Jan 2023 21:31:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EC26681C18;
	Tue, 17 Jan 2023 21:31:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EC26681C18
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8F0A91BF5DB
 for <buildroot@lists.busybox.net>; Tue, 17 Jan 2023 21:30:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6B08F60AD4
 for <buildroot@lists.busybox.net>; Tue, 17 Jan 2023 21:30:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6B08F60AD4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MgHN_Vsqqpou for <buildroot@lists.busybox.net>;
 Tue, 17 Jan 2023 21:30:32 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5E0C0606BF
Received: from mailout09.t-online.de (mailout09.t-online.de [194.25.134.84])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5E0C0606BF
 for <buildroot@buildroot.org>; Tue, 17 Jan 2023 21:30:32 +0000 (UTC)
Received: from fwd71.dcpf.telekom.de (fwd71.aul.t-online.de [10.223.144.97])
 by mailout09.t-online.de (Postfix) with SMTP id 2C573A8DA
 for <buildroot@buildroot.org>; Tue, 17 Jan 2023 22:30:25 +0100 (CET)
Received: from fli4l.lan.fli4l ([84.161.183.179]) by fwd71.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1pHtXB-4Msp4G0; Tue, 17 Jan 2023 22:30:21 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:49210)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1pHsEd-00005F-0Y
 for buildroot@buildroot.org; Tue, 17 Jan 2023 21:07:07 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Tue, 17 Jan 2023 21:07:07 +0100
Message-Id: <20230117200707.2730524-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1673991021-417E8C4D-88083DB1/0/0 CLEAN NORMAL
X-TOI-MSGID: f09ba04f-fed3-47e2-96a8-46dae816265d
Subject: [Buildroot] [PATCH 1/1] package/x11r7/xlib_libXpm: security bump
 version to 3.5.15
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
https://lists.x.org/archives/xorg-announce/2023-January/003313.html

Fixes CVE-2022-4883, CVE-2022-44617 & CVE-2022-46285:
https://lists.x.org/archives/xorg-announce/2023-January/003312.html

Updated license hash due to upstream commit:
https://gitlab.freedesktop.org/xorg/lib/libxpm/-/commit/501494c6c68a84114fdd0b44d4b67ef9cde776c9

Added configure option to disable compressed pixmaps support:
https://gitlab.freedesktop.org/xorg/lib/libxpm/-/commit/4841039e5385f264d12757903894f47c64f59361

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xlib_libXpm/xlib_libXpm.hash | 8 ++++----
 package/x11r7/xlib_libXpm/xlib_libXpm.mk   | 3 ++-
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/x11r7/xlib_libXpm/xlib_libXpm.hash b/package/x11r7/xlib_libXpm/xlib_libXpm.hash
index 9ccfb4c8de..733c404543 100644
--- a/package/x11r7/xlib_libXpm/xlib_libXpm.hash
+++ b/package/x11r7/xlib_libXpm/xlib_libXpm.hash
@@ -1,6 +1,6 @@
-# From https://lists.x.org/archives/xorg-announce/2022-November/003261.html
-sha256  f7eb8f69c039281def8258ae6859adb5f050fbe161ab3d6a2d6ef109a603eac2  libXpm-3.5.14.tar.xz
-sha512  c3fe554453068a6b188d3cad2cb3648e84b7f1909aea8f213daadce3d444b34361c3b2edce14a4fd481f97e4dc45c3125e2483ff4f44b3390a75829ed2782e4b  libXpm-3.5.14.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2023-January/003313.html
+sha256  60bb906c5c317a6db863e39b69c4a83fdbd2ae2154fcf47640f8fefc9fdfd1c1  libXpm-3.5.15.tar.xz
+sha512  955d716fcea2c9d868ab941c56f017b39bfa0f47fd2904e9b04c6a9be17f23f8b8c906da9c90a89a789f1f399d419641705ff5b6f9921820e34d4807c7a1992f  libXpm-3.5.15.tar.xz
 # Locally calculated
-sha256  ed3b06bb3b75a0954bd6837a96b41a4676f60dfeee647271613aadecc0fd596e  COPYING
+sha256  a80d706759624a04aa90fd62bc644a360fc3d72e08dcbfb129f167c11ca285de  COPYING
 sha256  cbe4ced0abc8a32bea471204ae01038c202758ce4e772d3d329a341ffa761e71  COPYRIGHT
diff --git a/package/x11r7/xlib_libXpm/xlib_libXpm.mk b/package/x11r7/xlib_libXpm/xlib_libXpm.mk
index 417dcfec38..970ec93407 100644
--- a/package/x11r7/xlib_libXpm/xlib_libXpm.mk
+++ b/package/x11r7/xlib_libXpm/xlib_libXpm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XLIB_LIBXPM_VERSION = 3.5.14
+XLIB_LIBXPM_VERSION = 3.5.15
 XLIB_LIBXPM_SOURCE = libXpm-$(XLIB_LIBXPM_VERSION).tar.xz
 XLIB_LIBXPM_SITE = https://xorg.freedesktop.org/archive/individual/lib
 XLIB_LIBXPM_LICENSE = MIT
@@ -16,6 +16,7 @@ XLIB_LIBXPM_DEPENDENCIES = xlib_libX11 xlib_libXext xlib_libXt xorgproto \
 	$(if $(BR2_PACKAGE_LIBICONV),libiconv) \
 	$(TARGET_NLS_DEPENDENCIES)
 XLIB_LIBXPM_CONF_ENV = LIBS=$(TARGET_NLS_LIBS)
+XLIB_LIBXPM_CONF_OPTS = --disable-open-zfile
 
 ifeq ($(BR2_SYSTEM_ENABLE_NLS),)
 XLIB_LIBXPM_CONF_ENV += ac_cv_search_gettext=no
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

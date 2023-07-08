Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 189E1EB64DC
	for <buildroot@archiver.kernel.org>; Sat,  8 Jul 2023 20:05:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B738060E27;
	Sat,  8 Jul 2023 20:05:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B738060E27
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HKq2dRPKsJix; Sat,  8 Jul 2023 20:05:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D3A0360E29;
	Sat,  8 Jul 2023 20:05:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D3A0360E29
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CAAB51BF3DF
 for <buildroot@lists.busybox.net>; Sat,  8 Jul 2023 20:05:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B1FFB60BDD
 for <buildroot@lists.busybox.net>; Sat,  8 Jul 2023 20:05:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B1FFB60BDD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qjfxzgqhGpZe for <buildroot@lists.busybox.net>;
 Sat,  8 Jul 2023 20:05:26 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 85FA960B4C
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 85FA960B4C
 for <buildroot@buildroot.org>; Sat,  8 Jul 2023 20:05:26 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6cfe4.dip0.t-ipconnect.de [79.214.207.228])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id A3C2AA4C0E88;
 Sat,  8 Jul 2023 22:04:48 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:55090)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qIEAh-0000uD-2a;
 Sat, 08 Jul 2023 22:04:47 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  8 Jul 2023 22:04:47 +0200
Message-Id: <20230708200447.3919009-7-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230708200447.3919009-1-bernd@kuhls.net>
References: <20230708200447.3919009-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1688846688;
 bh=Uyf0J6vewM3KuOyzApMGdrYls0CIiRVTjyIjxlZbEsw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=BB7gFQWFEEVcD3V9jPYSnenJ08Nscz/pgCqgcvol8+Z3xkq0SYoFjzG+SZ09LooOZ
 o5LXdJeZX+8p6RS2IVn5ykPUxPLzeWOZwN5PK/pLe6h8WxN1rZ+C99auEcNDI0E0x+
 c183UCfcZtvkKA9ejaYmYxujKx8XqGF5DfpO/3QKJeoA+k+Wr9QLWMW/G4JTORwx/c
 Stv3UQpTDg+ObdOh9/ANGB3KhvOgjD9um4riYvH0mbmMJgjNudmAX3ex/nMMwprGrY
 v2e5lGN7jjaA2UZjVbtALepDOpiOBdgDKzAqLvqKYesUIqHwu1p27rDl1Xg08C/xJP
 v0JSlbRHzhhDw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=BB7gFQWF
Subject: [Buildroot] [PATCH 7/7] package/kodi-imagedecoder-raw: new package
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
Cc: Pieter De Gendt <pieter.degendt@gmail.com>,
 Samuel Martin <s.martin49@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/kodi-imagedecoder-raw/Config.in             |  9 +++++++++
 .../kodi-imagedecoder-raw.hash                      |  3 +++
 .../kodi-imagedecoder-raw/kodi-imagedecoder-raw.mk  | 13 +++++++++++++
 package/kodi/Config.in                              |  1 +
 4 files changed, 26 insertions(+)
 create mode 100644 package/kodi-imagedecoder-raw/Config.in
 create mode 100644 package/kodi-imagedecoder-raw/kodi-imagedecoder-raw.hash
 create mode 100644 package/kodi-imagedecoder-raw/kodi-imagedecoder-raw.mk

diff --git a/package/kodi-imagedecoder-raw/Config.in b/package/kodi-imagedecoder-raw/Config.in
new file mode 100644
index 0000000000..b71e8d019e
--- /dev/null
+++ b/package/kodi-imagedecoder-raw/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_KODI_IMAGEDECODER_RAW
+	bool "kodi-imagedecoder-raw"
+	select BR2_PACKAGE_JPEG
+	select BR2_PACKAGE_LCMS2
+	select BR2_PACKAGE_LIBRAW
+	help
+	  RAW image decoder add-on for Kodi
+
+	  https://github.com/xbmc/imagedecoder.raw
diff --git a/package/kodi-imagedecoder-raw/kodi-imagedecoder-raw.hash b/package/kodi-imagedecoder-raw/kodi-imagedecoder-raw.hash
new file mode 100644
index 0000000000..8be6ed98da
--- /dev/null
+++ b/package/kodi-imagedecoder-raw/kodi-imagedecoder-raw.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  6235c0be431bbb814b3e464753af9ad17febf6001f77cbf030e6c6e1cdc41a04  kodi-imagedecoder-raw-20.1.0-Nexus.tar.gz
+sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-imagedecoder-raw/kodi-imagedecoder-raw.mk b/package/kodi-imagedecoder-raw/kodi-imagedecoder-raw.mk
new file mode 100644
index 0000000000..171956df41
--- /dev/null
+++ b/package/kodi-imagedecoder-raw/kodi-imagedecoder-raw.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# kodi-imagedecoder-raw
+#
+################################################################################
+
+KODI_IMAGEDECODER_RAW_VERSION = 20.1.0-Nexus
+KODI_IMAGEDECODER_RAW_SITE = $(call github,xbmc,imagedecoder.raw,$(KODI_IMAGEDECODER_RAW_VERSION))
+KODI_IMAGEDECODER_RAW_LICENSE = GPL-2.0+
+KODI_IMAGEDECODER_RAW_LICENSE_FILES = LICENSE.md
+KODI_IMAGEDECODER_RAW_DEPENDENCIES = kodi jpeg lcms2 libraw
+
+$(eval $(cmake-package))
diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index 30f04f0552..710add0568 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -292,6 +292,7 @@ endmenu
 
 menu "Image decoder addons"
 	source "package/kodi-imagedecoder-heif/Config.in"
+	source "package/kodi-imagedecoder-raw/Config.in"
 endmenu
 
 menu "Peripheral addons"
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 534EAEB64DA
	for <buildroot@archiver.kernel.org>; Sat,  8 Jul 2023 20:04:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D1F7E60A9D;
	Sat,  8 Jul 2023 20:04:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D1F7E60A9D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aQW-f_xwOics; Sat,  8 Jul 2023 20:04:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EE40D607DE;
	Sat,  8 Jul 2023 20:04:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EE40D607DE
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 67F241BF3DF
 for <buildroot@lists.busybox.net>; Sat,  8 Jul 2023 20:04:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3ED91607DE
 for <buildroot@lists.busybox.net>; Sat,  8 Jul 2023 20:04:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3ED91607DE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id R-vMQgTRJwvw for <buildroot@lists.busybox.net>;
 Sat,  8 Jul 2023 20:04:50 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3FFD1607C0
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3FFD1607C0
 for <buildroot@buildroot.org>; Sat,  8 Jul 2023 20:04:50 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6cfe4.dip0.t-ipconnect.de [79.214.207.228])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 8D99AA4C0930;
 Sat,  8 Jul 2023 22:04:47 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:55090)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qIEAh-0000uD-12;
 Sat, 08 Jul 2023 22:04:47 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  8 Jul 2023 22:04:41 +0200
Message-Id: <20230708200447.3919009-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: --
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1688846687;
 bh=Zwo3oJWdf6sUCcNLUVHhSxbxhM+mbgjtZywXzbdVCFU=;
 h=From:To:Cc:Subject:Date:From;
 b=OdwYu44X1B2UJxxk9YnfSsMVuHpV2Ng3hltBnXoENBVFVwHSq71XoBeofUvNDRl0B
 gh8WNTD6CZKUmJ12xWhMEOAXe2lLcTSRLYTcItOIkNgZtjjJ+3/04ya67gI9RqRtEE
 urLJshcKhk1S7TKqe0nLEVsP7ZzdPQHE/3dHqiHx8MsvVuSX85P0U5wa+PmGSdXh7f
 0h0+GbsRe2DU16vdNADyjUeVarVZP3HhsqoNMKnK87VmGH2gMhH50Ea4q47457EoCr
 uhfgfXhCtKme+O+1IyifY/AWfcifNijPLRuQPA1p2ZJdsVUo2XgR7MyspfvFanwg4F
 a/pTW4s6bzLaw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=OdwYu44X
Subject: [Buildroot] [PATCH 1/7] package/libde265: new package
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

Optional dependency of the upcoming libheif package.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 DEVELOPERS                     |  1 +
 package/Config.in              |  1 +
 package/libde265/Config.in     | 12 ++++++++++++
 package/libde265/libde265.hash |  3 +++
 package/libde265/libde265.mk   | 13 +++++++++++++
 5 files changed, 30 insertions(+)
 create mode 100644 package/libde265/Config.in
 create mode 100644 package/libde265/libde265.hash
 create mode 100644 package/libde265/libde265.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 188c579010..53a58923e3 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -366,6 +366,7 @@ F:	package/libcdio/
 F:	package/libcec/
 F:	package/libcodec2/
 F:	package/libcrossguid/
+F:	package/libde265/
 F:	package/libdeflate/
 F:	package/libdrm/
 F:	package/libdvbcsa/
diff --git a/package/Config.in b/package/Config.in
index 3abbce72a1..58d02a5918 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1831,6 +1831,7 @@ menu "Multimedia"
 	source "package/libbluray/Config.in"
 	source "package/libcamera/Config.in"
 	source "package/libcamera-apps/Config.in"
+	source "package/libde265/Config.in"
 	source "package/libdvbcsa/Config.in"
 	source "package/libdvbpsi/Config.in"
 	source "package/libdvbsi/Config.in"
diff --git a/package/libde265/Config.in b/package/libde265/Config.in
new file mode 100644
index 0000000000..2436beff41
--- /dev/null
+++ b/package/libde265/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_LIBDE265
+	bool "libde265"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	help
+	  libde265 is an open source implementation of the h.265 video
+	  codec.
+
+	  https://github.com/strukturag/libde265
+
+comment "libde265 needs a toolchain w/ threads, C++"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP
diff --git a/package/libde265/libde265.hash b/package/libde265/libde265.hash
new file mode 100644
index 0000000000..168b5db395
--- /dev/null
+++ b/package/libde265/libde265.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  62185ea2182e68cf68bba20cc6eb4c287407b509cf0a827d7ddb75614db77b5c  libde265-1.0.12.tar.gz
+sha256  02cc1585a20677992e0ba578fa692635dc193735f2691dc81de924b51c4e8020  COPYING
diff --git a/package/libde265/libde265.mk b/package/libde265/libde265.mk
new file mode 100644
index 0000000000..60424c0de6
--- /dev/null
+++ b/package/libde265/libde265.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# libde265
+#
+################################################################################
+
+LIBDE265_VERSION = 1.0.12
+LIBDE265_SITE = https://github.com/strukturag/libde265/releases/download/v$(LIBDE265_VERSION)
+LIBDE265_LICENSE = LGPL-3.0+
+LIBDE265_LICENSE_FILES = COPYING
+LIBDE265_INSTALL_STAGING = YES
+
+$(eval $(cmake-package))
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

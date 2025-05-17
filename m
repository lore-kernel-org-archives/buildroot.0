Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DF3EC2D0CD
	for <buildroot@archiver.kernel.org>; Sat, 17 May 2025 15:02:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 17F0560DFD;
	Sat, 17 May 2025 15:02:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VwgkAo1iZVlh; Sat, 17 May 2025 15:02:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2542D60D8C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2542D60D8C;
	Sat, 17 May 2025 15:02:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id D6E641DE
 for <buildroot@buildroot.org>; Sat, 17 May 2025 15:02:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C81EB60D8C
 for <buildroot@buildroot.org>; Sat, 17 May 2025 15:02:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9nwuxaNwzPU6 for <buildroot@buildroot.org>;
 Sat, 17 May 2025 15:02:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1591060D58
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1591060D58
 for <buildroot@buildroot.org>; Sat, 17 May 2025 15:02:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0269686F7F; Sat, 17 May 2025 15:02:10 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 17 May 2025 17:01:42 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 236363b12562b3aa2cd0ab30861870c4c7e8345b
X-Git-Newrev: dad998a8070bc07838f78453fcb7906fefab22ba
X-Patchwork-Hint: ignore
Message-Id: <20250517150210.0269686F7F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/lpac: new package
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=dad998a8070bc07838f78453fcb7906fefab22ba
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS             |  1 +
 package/Config.in      |  1 +
 package/lpac/Config.in | 16 ++++++++++++++++
 package/lpac/lpac.hash |  5 +++++
 package/lpac/lpac.mk   | 41 +++++++++++++++++++++++++++++++++++++++++
 5 files changed, 64 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 2e472d4838..7bc7385586 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3504,6 +3504,7 @@ F:	package/libuci/
 F:	package/libxmlb/
 F:	package/linux-firmware/
 F:	package/linux-serial-test/
+F:	package/lpac/
 F:	package/modem-manager/
 F:	package/ncftp/
 F:	package/nftables/
diff --git a/package/Config.in b/package/Config.in
index 68da6f9f62..d09cfe066a 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2559,6 +2559,7 @@ endif
 	source "package/linux-zigbee/Config.in"
 	source "package/linuxptp/Config.in"
 	source "package/lldpd/Config.in"
+	source "package/lpac/Config.in"
 	source "package/lrzsz/Config.in"
 	source "package/lynx/Config.in"
 	source "package/macchanger/Config.in"
diff --git a/package/lpac/Config.in b/package/lpac/Config.in
new file mode 100644
index 0000000000..6cfe11cc67
--- /dev/null
+++ b/package/lpac/Config.in
@@ -0,0 +1,16 @@
+config BR2_PACKAGE_LPAC
+	bool "lpac"
+	depends on BR2_TOOLCHAIN_HAS_THREADS # pcsc-lite
+	depends on BR2_USE_MMU # pcsc-lite
+	depends on !BR2_STATIC_LIBS # pcsc-lite
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # pcsc-lite
+	select BR2_PACKAGE_PCSC_LITE
+	help
+	  C-based eUICC LPA.
+
+	  https://github.com/estkme-group/lpac
+
+comment "lpac needs a toolchain w/ threads, dynamic library, gcc >= 4.9"
+	depends on BR2_USE_MMU
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
diff --git a/package/lpac/lpac.hash b/package/lpac/lpac.hash
new file mode 100644
index 0000000000..bf93ef245f
--- /dev/null
+++ b/package/lpac/lpac.hash
@@ -0,0 +1,5 @@
+# Locally computed:
+sha256  3d87080a625b10430eebb82f89e2d24e16a84a8435a9c40b3718fd88c82028ba  lpac-2.2.1.tar.gz
+sha256  8486a10c4393cee1c25392769ddd3b2d6c242d6ec7928e1414efff7dfb2f07ef  src/LICENSE
+sha256  b673293d21e887eaa9b971696b33f0f9141839900c65c83e560afa469d291ba6  euicc/LICENSE
+sha256  163766832b15cc9c90d593216360c67af579b8b36932b297fca2aeb61544de2f  cjson/LICENSE
diff --git a/package/lpac/lpac.mk b/package/lpac/lpac.mk
new file mode 100644
index 0000000000..36cd4d591d
--- /dev/null
+++ b/package/lpac/lpac.mk
@@ -0,0 +1,41 @@
+################################################################################
+#
+# lpac
+#
+################################################################################
+
+LPAC_VERSION = 2.2.1
+LPAC_SITE = $(call github,estkme-group,lpac,v$(LPAC_VERSION))
+LPAC_LICENSE = LGPL-2.1+ (library), AGPL-3.0 (programs), MIT (cjson)
+LPAC_LICENSE_FILES = src/LICENSE euicc/LICENSE cjson/LICENSE
+LPAC_DEPENDENCIES = pcsc-lite
+
+ifeq ($(BR2_PACKAGE_LIBCURL),y)
+LPAC_DEPENDENCIES += libcurl
+LPAC_CONF_OPTS += -DLPAC_WITH_HTTP_CURL=ON
+else
+LPAC_CONF_OPTS += -DLPAC_WITH_HTTP_CURL=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_LIBQMI),y)
+LPAC_DEPENDENCIES += libqmi
+LPAC_CONF_OPTS += -DLPAC_WITH_APDU_QMI=ON
+else
+LPAC_CONF_OPTS += -DLPAC_WITH_APDU_QMI=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_LIBQRTR_GLIB),y)
+LPAC_DEPENDENCIES += libqmi libqrtr-glib
+LPAC_CONF_OPTS += -DLPAC_WITH_APDU_QMI_QRTR=ON
+else
+LPAC_CONF_OPTS += -DLPAC_WITH_APDU_QMI_QRTR=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_LIBMBIM),y)
+LPAC_DEPENDENCIES += libmbim
+LPAC_CONF_OPTS += -DLPAC_WITH_APDU_MBIM=ON
+else
+LPAC_CONF_OPTS += -DLPAC_WITH_APDU_MBIM=OFF
+endif
+
+$(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

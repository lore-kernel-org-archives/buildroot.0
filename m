Return-Path: <SRS0=PVMq=MM=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3814CC07E95
	for <buildroot@archiver.kernel.org>; Tue, 20 Jul 2021 20:24:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A784360BBB
	for <buildroot@archiver.kernel.org>; Tue, 20 Jul 2021 20:24:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A784360BBB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot-bounces@busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 75F9360861;
	Tue, 20 Jul 2021 20:24:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Lb3leEh-uWpW; Tue, 20 Jul 2021 20:24:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C65D060769;
	Tue, 20 Jul 2021 20:24:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 665661BF45A
 for <buildroot@lists.busybox.net>; Tue, 20 Jul 2021 20:24:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 555D2402BC
 for <buildroot@lists.busybox.net>; Tue, 20 Jul 2021 20:24:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id n_aiQ0GosShQ for <buildroot@lists.busybox.net>;
 Tue, 20 Jul 2021 20:24:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8A0904018D
 for <buildroot@buildroot.org>; Tue, 20 Jul 2021 20:24:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 60B1385F3C; Tue, 20 Jul 2021 19:50:21 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Tue, 20 Jul 2021 22:24:18 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 570763cfd8e74e15ea64700cdfd42d419c48cf0f
X-Git-Newrev: b4c76008fcbb7a183e19d6c6fe06f28e63b64cbd
X-Patchwork-Hint: ignore
Message-ID: <20210720195021.60B1385F3C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rtl8812au-aircrack-ng: new package
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>
Message-ID: <20210720202418.KoIpmPR_hzwtZ9hNPo6R1jpCSVusyRjGqW0C4-QPJ1M@z>

commit: https://git.buildroot.net/buildroot/commit/?id=b4c76008fcbb7a183e19d6c6fe06f28e63b64cbd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add rtl8812au-aircrack-ng (alternative to rtl8821au), recommended
e.g. for Alfa cards ([1]) and as opposed to rtl8821au does not crash
in case of configured for IBSS mode and supports iw set freq command in
monitor mode.

[1] https://docs.alfa.com.tw/Support/Linux/RTL8811AU

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                             |  1 +
 package/Config.in                                      |  1 +
 package/rtl8812au-aircrack-ng/Config.in                | 10 ++++++++++
 .../rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.hash   |  3 +++
 package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.mk | 18 ++++++++++++++++++
 5 files changed, 33 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index c519a6cfbb..65ab98351e 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2156,6 +2156,7 @@ F:	package/qt5/
 F:	package/quotatool/
 F:	package/racehound/
 F:	package/redir/
+F:	package/rtl8812au-aircrack-ng/
 F:	package/uredir/
 F:	package/wayland-utils/
 
diff --git a/package/Config.in b/package/Config.in
index e883cf3780..de9378e11c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -549,6 +549,7 @@ endmenu
 	source "package/rtl8189fs/Config.in"
 	source "package/rtl8723bs/Config.in"
 	source "package/rtl8723bu/Config.in"
+	source "package/rtl8812au-aircrack-ng/Config.in"
 	source "package/rtl8821au/Config.in"
 	source "package/sane-backends/Config.in"
 	source "package/sdparm/Config.in"
diff --git a/package/rtl8812au-aircrack-ng/Config.in b/package/rtl8812au-aircrack-ng/Config.in
new file mode 100644
index 0000000000..70cbd15221
--- /dev/null
+++ b/package/rtl8812au-aircrack-ng/Config.in
@@ -0,0 +1,10 @@
+comment "rtl8812au-aircrack-ng needs a Linux kernel to be built"
+	depends on !BR2_LINUX_KERNEL
+
+config BR2_PACKAGE_RTL8812AU_AIRCRACK_NG
+	bool "rtl8812au-aircrack-ng"
+	depends on BR2_LINUX_KERNEL
+	help
+	  rtl8812au wifi driver (aircrack-ng repository)
+
+	  https://github.com/aircrack-ng/rtl8812au
diff --git a/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.hash b/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.hash
new file mode 100644
index 0000000000..5503b4f22e
--- /dev/null
+++ b/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  2c5d8286a00273343fc10d0e16afc52e788ac73b7df57c8159e58a40707f61da  rtl8812au-aircrack-ng-b8167e66b4ac046b3b76c2c40008d84528e91594.tar.gz
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
diff --git a/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.mk b/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.mk
new file mode 100644
index 0000000000..d42d953496
--- /dev/null
+++ b/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.mk
@@ -0,0 +1,18 @@
+################################################################################
+#
+# rtl8812au-aircrack-ng
+#
+################################################################################
+
+RTL8812AU_AIRCRACK_NG_VERSION = b8167e66b4ac046b3b76c2c40008d84528e91594
+RTL8812AU_AIRCRACK_NG_SITE = $(call github,aircrack-ng,rtl8812au,$(RTL8812AU_AIRCRACK_NG_VERSION))
+RTL8812AU_AIRCRACK_NG_LICENSE = GPL-2.0
+RTL8812AU_AIRCRACK_NG_LICENSE_FILES = LICENSE
+
+RTL8812AU_AIRCRACK_NG_MODULE_MAKE_OPTS = \
+	CONFIG_88XXAU=m \
+	KVER=$(LINUX_VERSION_PROBED) \
+	USER_EXTRA_CFLAGS="-DCONFIG_$(call qstrip,$(BR2_ENDIAN))_ENDIAN"
+
+$(eval $(kernel-module))
+$(eval $(generic-package))
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot

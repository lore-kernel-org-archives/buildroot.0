Return-Path: <SRS0=b2+E=PU=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE442C433F5
	for <buildroot@archiver.kernel.org>; Mon,  1 Nov 2021 18:29:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0856060F42
	for <buildroot@archiver.kernel.org>; Mon,  1 Nov 2021 18:29:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0856060F42
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=buildroot.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BED4540244;
	Mon,  1 Nov 2021 18:29:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6D6F0jCbJ-rZ; Mon,  1 Nov 2021 18:29:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 26DB440240;
	Mon,  1 Nov 2021 18:29:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 347E11BF2FD
 for <buildroot@lists.busybox.net>; Mon,  1 Nov 2021 18:29:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 312E0605DB
 for <buildroot@lists.busybox.net>; Mon,  1 Nov 2021 18:29:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=libero.it
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DAaoRvn3005t for <buildroot@lists.busybox.net>;
 Mon,  1 Nov 2021 18:29:55 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from libero.it (smtp-32.italiaonline.it [213.209.10.32])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 05040605D5
 for <buildroot@buildroot.org>; Mon,  1 Nov 2021 18:29:54 +0000 (UTC)
Received: from passgat-Modern-14-A10M.homenet.telecomitalia.it
 ([213.45.67.127]) by smtp-32.iol.local with ESMTPA
 id hc44mkEUUdfuohc47mCYU7; Mon, 01 Nov 2021 19:29:52 +0100
x-libjamoibt: 1601
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=libero.it; s=s2021;
 t=1635791392; bh=4/mEKMeJCoKpcm+dB1wHSnJlkD8g0SUSN5hSW3zo3pw=;
 h=From;
 b=FRibtbaI7K4UuXk/RtpJ02nP6jxmYG5EX0L525AqYecWtvEiV02Of/ZH0W2yB7Yu7
 g/ejnO27kC7kw2ejA2G046U/C3FXCIuAw++iHayJLEPhiCo4hLqtu+7P6RCqo/fkad
 elHzcksmaDeYUJZKy2BUaEHFL/p/0YzlPBxFh4xC33RYEOI5iMXvNHRasQbriBWirD
 46eFHnw4usD1kMMYK3gRzhCYiW/xbNp4wH+b0AHkIx/tX0qHCr7cyJLT7v+kndf8Dy
 ENqW63IM7zQC7qLKdyOQb6EkAwuftAX4u/DB85sT4fdfQz4giqxIf+cOms4lz8Maoi
 pOlLhc3RkEgIA==
X-CNFS-Analysis: v=2.4 cv=IrzbzJzg c=1 sm=1 tr=0 ts=61803220 cx=a_exe
 a=Vk63IOK+/LoQucGDvce7tA==:117 a=Vk63IOK+/LoQucGDvce7tA==:17 a=NEAV23lmAAAA:8
 a=HxmO1Doc_dIJdd6kAt0A:9
To: buildroot@buildroot.org
Date: Mon,  1 Nov 2021 19:29:40 +0100
Message-Id: <20211101182940.12343-1-dariobin@libero.it>
X-Mailer: git-send-email 2.17.1
X-CMAE-Envelope: MS4xfEKayJ4Dphka0Tw5edwM/PPFOHc9ph8hF7WzWS0waioBOlsI1wm/COjyQ51rGSQTei2SEAFmDHtgbiIh59b2PgJisWsrfTyFOf4KHRk/PYmG+XMFUpRj
 6j4fHpvYf8luS2/3vkRApr4Sru3ZIhScVN0oZERcSNvcsp+H59VnChod5Lp2AIgVObEHO1qmtnhfPvCKJsLBMY0EoW/X/rXQdrJqgR5egHy+iQAH0QeTF1NF
 i4WG5GDctFjlhUE4vYOCLJ10XIxEjjI8LKv6985KnJu9x6Ne2n+S0g7B2sSyJo41sUE8e5UYK3y7Ie8woY/Bwg==
Subject: [Buildroot] [PATCH 1/1] package/davinci-bootcount: new package
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
From: Dario Binacchi via buildroot <buildroot@buildroot.org>
Reply-To: Dario Binacchi <dariobin@libero.it>
Cc: Dario Binacchi <dariobin@libero.it>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

U-Boot implements a boot count scheme that can be used to detect
multiple failed attempts to boot Linux. On Davinci platform (TI AM 335x)
the `bootcount' value is stored in the RTC SCRATCH2 register. This tool
allows to read and write this register from userspace.

Signed-off-by: Dario Binacchi <dariobin@libero.it>
---
 package/Config.in                              |  1 +
 package/davinci-bootcount/Config.in            | 11 +++++++++++
 package/davinci-bootcount/davinci_bootcount.mk | 15 +++++++++++++++
 3 files changed, 27 insertions(+)
 create mode 100644 package/davinci-bootcount/Config.in
 create mode 100644 package/davinci-bootcount/davinci_bootcount.mk

diff --git a/package/Config.in b/package/Config.in
index c23755a421..a8a05cdfcd 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -452,6 +452,7 @@ endmenu
 	source "package/cwiid/Config.in"
 	source "package/dahdi-linux/Config.in"
 	source "package/dahdi-tools/Config.in"
+	source "package/davinci-bootcount/Config.in"
 	source "package/dbus/Config.in"
 	source "package/dbus-cpp/Config.in"
 	source "package/dbus-glib/Config.in"
diff --git a/package/davinci-bootcount/Config.in b/package/davinci-bootcount/Config.in
new file mode 100644
index 0000000000..da3b3605a0
--- /dev/null
+++ b/package/davinci-bootcount/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_DAVINCI_BOOTCOUNT
+	bool "davinci bootcount"
+	default n
+	help
+	  U-Boot implements a boot count scheme that can be used to
+	  detect multiple failed attempts to boot Linux. On Davinci
+	  platform (TI AM 335x) the `bootcount' is stored in the RTC
+	  SCRATCH2 register. This tool allows to read and write this
+	  register from userspace.
+
+	  https://github.com/VoltServer/uboot-davinci-bootcount
diff --git a/package/davinci-bootcount/davinci_bootcount.mk b/package/davinci-bootcount/davinci_bootcount.mk
new file mode 100644
index 0000000000..434da494d7
--- /dev/null
+++ b/package/davinci-bootcount/davinci_bootcount.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# davinci-bootcount
+#
+################################################################################
+
+DAVINCI_BOOTCOUNT_VERSION = 0973689c7556a953d2b468e4d8d46758c6d467b4
+DAVINCI_BOOTCOUNT_SITE = "https://github.com/VoltServer/uboot-davinci-bootcount"
+DAVINCI_BOOTCOUNT_SITE_METHOD = git
+DAVINCI_BOOTCOUNT_INSTALL_TARGET = YES
+DAVINCI_BOOTCOUNT_LICENSE = GPL-3.0
+DAVINCI_BOOTCOUNT_LICENSE_FILES = COPYING
+DAVINCI_BOOTCOUNT_AUTORECONF = YES
+
+$(eval $(autotools-package))
-- 
2.17.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

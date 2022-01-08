Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53333C433F5
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 20:55:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D5004400C1;
	Sat,  8 Jan 2022 20:55:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id U76fbXyTDjxx; Sat,  8 Jan 2022 20:55:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D1DD240122;
	Sat,  8 Jan 2022 20:55:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EE9A11BF847
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 20:55:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DC6F081448
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 20:55:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 64Q6r8iKWjsI for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 20:55:41 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 17D8081443
 for <buildroot@buildroot.org>; Sat,  8 Jan 2022 20:55:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 0BC928345E; Sat,  8 Jan 2022 20:49:28 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 8 Jan 2022 21:54:08 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0651b22d638faecb3688f1fd4e0760c31bfba893
X-Git-Newrev: 65da7755d9266f245b711a19dd97499594415bde
X-Patchwork-Hint: ignore
Message-Id: <20220108204928.0BC928345E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] rtl8189es: new package
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=65da7755d9266f245b711a19dd97499594415bde
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This package adds the rtl8189es WiFi driver.
   repo: https://github.com/jwrdegoede/rtl8189ES_linux.git
   branch: master

Driver is known to support Realtek RTL8189ES-VB-CG chip.

Signed-off-by: Louis Aussedat <aussedat.louis@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 DEVELOPERS                       |  1 +
 package/Config.in                |  1 +
 package/rtl8189es/Config.in      | 10 ++++++++++
 package/rtl8189es/rtl8189es.hash |  2 ++
 package/rtl8189es/rtl8189es.mk   | 17 +++++++++++++++++
 5 files changed, 31 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 2eeba07002..c0ea5777f2 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1665,6 +1665,7 @@ F:	package/python-dnspython/
 F:	package/python-future/
 F:	package/python-huepy/
 F:	package/python-tqdm/
+F:	package/rtl8189es/
 
 N:	Louis-Paul Cordier <lpdev@cordier.org>
 F:	package/intel-gmmlib/
diff --git a/package/Config.in b/package/Config.in
index d32a87fe20..c933f51d10 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -554,6 +554,7 @@ endmenu
 	source "package/rs485conf/Config.in"
 	source "package/rtc-tools/Config.in"
 	source "package/rtl8188eu/Config.in"
+	source "package/rtl8189es/Config.in"
 	source "package/rtl8189fs/Config.in"
 	source "package/rtl8723bs/Config.in"
 	source "package/rtl8723bu/Config.in"
diff --git a/package/rtl8189es/Config.in b/package/rtl8189es/Config.in
new file mode 100644
index 0000000000..2e3474e5e1
--- /dev/null
+++ b/package/rtl8189es/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_RTL8189ES
+	bool "rtl8189es"
+	depends on BR2_LINUX_KERNEL
+	help
+	  Wireless driver rtl8189es.
+
+	  https://github.com/jwrdegoede/rtl8189ES_linux.git
+
+comment "rtl8189es needs a Linux kernel to be built"
+	depends on !BR2_LINUX_KERNEL
diff --git a/package/rtl8189es/rtl8189es.hash b/package/rtl8189es/rtl8189es.hash
new file mode 100644
index 0000000000..624c51ac0d
--- /dev/null
+++ b/package/rtl8189es/rtl8189es.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  bf972b6494844c66885dc6846228994fac6075477cf9a7122ffd521e25ac791c  rtl8189es-2c8d44ae26485052f39d933a3a132b3ff395803a.tar.gz
diff --git a/package/rtl8189es/rtl8189es.mk b/package/rtl8189es/rtl8189es.mk
new file mode 100644
index 0000000000..9e4053ae83
--- /dev/null
+++ b/package/rtl8189es/rtl8189es.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# rtl8189es
+#
+################################################################################
+
+RTL8189ES_VERSION = 2c8d44ae26485052f39d933a3a132b3ff395803a
+RTL8189ES_SITE = $(call github,jwrdegoede,rtl8189ES_linux,$(RTL8189ES_VERSION))
+RTL8189ES_LICENSE = GPL-2.0
+
+RTL8189ES_MODULE_MAKE_OPTS = \
+	CONFIG_RTL8189ES=m \
+	KVER=$(LINUX_VERSION_PROBED) \
+	KSRC=$(LINUX_DIR)
+
+$(eval $(kernel-module))
+$(eval $(generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC49CEC8739
	for <buildroot@archiver.kernel.org>; Thu,  7 Sep 2023 15:22:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 716C783544;
	Thu,  7 Sep 2023 15:22:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 716C783544
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ADNgF8yuxyUZ; Thu,  7 Sep 2023 15:22:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8E9B883B0B;
	Thu,  7 Sep 2023 15:22:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8E9B883B0B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 182E31BF313
 for <buildroot@lists.busybox.net>; Thu,  7 Sep 2023 14:52:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E226241E50
 for <buildroot@lists.busybox.net>; Thu,  7 Sep 2023 14:51:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E226241E50
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sexn6qyGdQKO for <buildroot@lists.busybox.net>;
 Thu,  7 Sep 2023 14:51:32 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0B8AD41D83
 for <buildroot@buildroot.org>; Thu,  7 Sep 2023 14:51:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0B8AD41D83
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F03C1869E0; Thu,  7 Sep 2023 14:51:28 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 10 Aug 2023 23:30:19 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b574a9606e62e79a3b7f8aa3e14199ea73fc6826
X-Git-Newrev: 928b7219cd7079864eadadc66dbff21c5cd72804
X-Patchwork-Hint: ignore
Message-Id: <20230907145128.F03C1869E0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rauc-hawkbit-updater: new package
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8663352697600233794=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8663352697600233794==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=928b7219cd7079864eadadc66dbff21c5cd72804
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add useful tool for bridging RAUC with the Hawkbit API.

Signed-off-by: Colin Foster <colin.foster@in-advantage.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                           |  3 +++
 package/Config.in                                    |  1 +
 package/rauc-hawkbit-updater/Config.in               | 20 ++++++++++++++++++++
 .../rauc-hawkbit-updater/rauc-hawkbit-updater.hash   |  3 +++
 package/rauc-hawkbit-updater/rauc-hawkbit-updater.mk | 15 +++++++++++++++
 5 files changed, 42 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 0bed35fd8e..3f9b29fe46 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -638,6 +638,9 @@ N:	Clément Péron <peron.clem@gmail.com>
 F:	board/beelink/gs1/
 F:	configs/beelink_gs1_defconfig
 
+N:	Colin Foster <colin.foster@in-advantage.com>
+F:	package/rauc-hawkbit-updater/
+
 N:	Corentin Guillevic <corentin.guillevic@smile.fr>
 F:	package/libloki/
 
diff --git a/package/Config.in b/package/Config.in
index 9ee1893e45..4c763447e4 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2715,6 +2715,7 @@ menu "System tools"
 	source "package/quota/Config.in"
 	source "package/quotatool/Config.in"
 	source "package/rauc/Config.in"
+	source "package/rauc-hawkbit-updater/Config.in"
 	source "package/rsyslog/Config.in"
 	source "package/runc/Config.in"
 	source "package/s390-tools/Config.in"
diff --git a/package/rauc-hawkbit-updater/Config.in b/package/rauc-hawkbit-updater/Config.in
new file mode 100644
index 0000000000..dafc2f883c
--- /dev/null
+++ b/package/rauc-hawkbit-updater/Config.in
@@ -0,0 +1,20 @@
+config BR2_PACKAGE_RAUC_HAWKBIT_UPDATER
+	bool "rauc-hawkbit-updater"
+	depends on BR2_TOOLCHAIN_HAS_THREADS # rauc, json-glib
+	depends on BR2_USE_MMU # rauc, json-glib
+	depends on BR2_USE_WCHAR # rauc, json-glib
+	select BR2_PACKAGE_JSON_GLIB
+	select BR2_PACKAGE_LIBCURL
+	# runtime
+	select BR2_PACKAGE_RAUC
+	help
+	  rauc-hawkbit-updater is a link between Pengutronix RAUC and
+	  the Eclipse Hawkbit API. Hawkbit can communicate to remote
+	  update servers, and use the d-bus interface to trigger
+	  updates from RAUC.
+
+	  http://rauc.io/
+
+comment "rauc-hawkbit-updater needs a toolchain w/ wchar, threads"
+	depends on BR2_USE_MMU
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/rauc-hawkbit-updater/rauc-hawkbit-updater.hash b/package/rauc-hawkbit-updater/rauc-hawkbit-updater.hash
new file mode 100644
index 0000000000..c65ead3784
--- /dev/null
+++ b/package/rauc-hawkbit-updater/rauc-hawkbit-updater.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  42318e96a464e6c716edb45c48bd3ec3b874462973db902fbe099a395e4acb4b  rauc-hawkbit-updater-1.3.tar.xz
+sha256  041234c81fd6fe6c531ea1a886b9e740b9ee06759d1a910a14edbd06f4aa62c7  LICENSE
diff --git a/package/rauc-hawkbit-updater/rauc-hawkbit-updater.mk b/package/rauc-hawkbit-updater/rauc-hawkbit-updater.mk
new file mode 100644
index 0000000000..10ba91abbb
--- /dev/null
+++ b/package/rauc-hawkbit-updater/rauc-hawkbit-updater.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# rauc-hawkbit-updater
+#
+################################################################################
+
+RAUC_HAWKBIT_UPDATER_VERSION = 1.3
+RAUC_HAWKBIT_UPDATER_SITE = https://github.com/rauc/rauc-hawkbit-updater/releases/download/v$(RAUC_HAWKBIT_UPDATER_VERSION)
+RAUC_HAWKBIT_UPDATER_SOURCE = rauc-hawkbit-updater-$(RAUC_HAWKBIT_UPDATER_VERSION).tar.xz
+RAUC_HAWKBIT_UPDATER_LICENSE = LGPL-2.1
+RAUC_HAWKBIT_UPDATER_LICENSE_FILES = LICENSE
+RAUC_HAWKBIT_UPDATER_CPE_ID_VENDOR = pengutronix
+RAUC_HAWKBIT_UPDATER_DEPENDENCIES = json-glib libcurl
+
+$(eval $(meson-package))

--===============8663352697600233794==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8663352697600233794==--

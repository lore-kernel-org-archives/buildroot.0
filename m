Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9021C07E9D
	for <buildroot@archiver.kernel.org>; Sat, 24 Sep 2022 14:40:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 75F0A40B68;
	Sat, 24 Sep 2022 14:40:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 75F0A40B68
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LqqN2mbCY3ds; Sat, 24 Sep 2022 14:40:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7A18C408AE;
	Sat, 24 Sep 2022 14:40:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7A18C408AE
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D460F1BF325
 for <buildroot@lists.busybox.net>; Sat, 24 Sep 2022 14:40:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BC70460B98
 for <buildroot@lists.busybox.net>; Sat, 24 Sep 2022 14:40:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BC70460B98
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SXAESbJHMsYg for <buildroot@lists.busybox.net>;
 Sat, 24 Sep 2022 14:40:35 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D53B860B89
 for <buildroot@buildroot.org>; Sat, 24 Sep 2022 14:40:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D53B860B89
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C207D84708; Sat, 24 Sep 2022 14:40:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 24 Sep 2022 16:40:21 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 15972770cf34ed0b0ba330e3cc42c04f1c80c3c8
X-Git-Newrev: 4052bad5adc47b9fe964548e7608e9b784acaf28
X-Patchwork-Hint: ignore
Message-Id: <20220924144035.C207D84708@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/open-isns: new package
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=4052bad5adc47b9fe964548e7608e9b784acaf28
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: TIAN Yuanhao <tianyuanhao3@163.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                       |  3 +++
 package/Config.in                |  1 +
 package/open-isns/Config.in      |  7 +++++++
 package/open-isns/open-isns.hash |  3 +++
 package/open-isns/open-isns.mk   | 32 ++++++++++++++++++++++++++++++++
 5 files changed, 46 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 103b5f223c..4a760a9b9a 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2782,6 +2782,9 @@ F:	package/python-influxdb/
 N:	Sven Oliver Moll <svolli@svolli.de>
 F:	package/most/
 
+N:	TIAN Yuanhao <tianyuanhao3@163.com>
+F:	package/open-isns/
+
 N:	Theo Debrouwere <t.debrouwere@televic.com>
 F:	board/beagleboardx15/
 F:	configs/beagleboardx15_defconfig
diff --git a/package/Config.in b/package/Config.in
index afe2dcc21d..360a1645c9 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1922,6 +1922,7 @@ menu "Networking"
 	source "package/nss-myhostname/Config.in"
 	source "package/nss-pam-ldapd/Config.in"
 	source "package/omniorb/Config.in"
+	source "package/open-isns/Config.in"
 	source "package/open62541/Config.in"
 	source "package/openldap/Config.in"
 	source "package/openmpi/Config.in"
diff --git a/package/open-isns/Config.in b/package/open-isns/Config.in
new file mode 100644
index 0000000000..a9bf7bbc1d
--- /dev/null
+++ b/package/open-isns/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_OPEN_ISNS
+	bool "open-isns"
+	depends on BR2_USE_MMU # fork()
+	help
+	  iSNS server and client for Linux.
+
+	  https://github.com/open-iscsi/open-isns
diff --git a/package/open-isns/open-isns.hash b/package/open-isns/open-isns.hash
new file mode 100644
index 0000000000..653fabaa9f
--- /dev/null
+++ b/package/open-isns/open-isns.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  9611344733c0cdf14395f60880950ea4c3c7d6b765565b6493ad3e1afbe216de  open-isns-0.102.tar.gz
+sha256  00a89b0d18aacd4114decf79122db87bf35bddaf2bc50e383c9c9f4c263390b2  COPYING
diff --git a/package/open-isns/open-isns.mk b/package/open-isns/open-isns.mk
new file mode 100644
index 0000000000..ae8fb41578
--- /dev/null
+++ b/package/open-isns/open-isns.mk
@@ -0,0 +1,32 @@
+################################################################################
+#
+# open-isns
+#
+################################################################################
+
+OPEN_ISNS_VERSION = 0.102
+OPEN_ISNS_SITE = $(call github,open-iscsi,open-isns,v$(OPEN_ISNS_VERSION))
+OPEN_ISNS_LICENSE = LGPL-2.1+
+OPEN_ISNS_LICENSE_FILES = COPYING
+OPEN_ISNS_INSTALL_STAGING = YES
+
+OPEN_ISNS_CONF_OPTS = -Dslp=disabled
+
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+OPEN_ISNS_DEPENDENCIES += openssl
+OPEN_ISNS_CONF_OPTS += -Dsecurity=enabled
+else
+OPEN_ISNS_CONF_OPTS += -Dsecurity=disabled
+endif
+
+ifeq ($(BR2_INIT_SYSTEMD),)
+define OPEN_ISNS_REMOVE_SYSTEMD_UNITS
+	rm $(TARGET_DIR)/usr/lib/systemd/system/isnsd.service
+	rm $(TARGET_DIR)/usr/lib/systemd/system/isnsd.socket
+	rmdir --ignore-fail-on-non-empty $(TARGET_DIR)/usr/lib/systemd/system
+	rmdir --ignore-fail-on-non-empty $(TARGET_DIR)/usr/lib/systemd
+endef
+OPEN_ISNS_POST_INSTALL_TARGET_HOOKS += OPEN_ISNS_REMOVE_SYSTEMD_UNITS
+endif
+
+$(eval $(meson-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

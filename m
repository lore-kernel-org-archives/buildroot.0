Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC8EDE7D26E
	for <buildroot@archiver.kernel.org>; Tue, 26 Sep 2023 09:12:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4DF1860DDF;
	Tue, 26 Sep 2023 09:12:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4DF1860DDF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AR-khwjU6dUZ; Tue, 26 Sep 2023 09:12:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6A06D6140B;
	Tue, 26 Sep 2023 09:12:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6A06D6140B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0B9FB1BF97A
 for <buildroot@lists.busybox.net>; Tue, 26 Sep 2023 09:12:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D8BB9822B6
 for <buildroot@lists.busybox.net>; Tue, 26 Sep 2023 09:12:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D8BB9822B6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ex6RSPYaSkyk for <buildroot@lists.busybox.net>;
 Tue, 26 Sep 2023 09:12:03 +0000 (UTC)
Received: from smtpcmd0756.aruba.it (smtpcmd0756.aruba.it [62.149.156.56])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B425282288
 for <buildroot@buildroot.org>; Tue, 26 Sep 2023 09:12:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B425282288
Received: from localhost.localdomain ([146.241.127.78])
 by Aruba Outgoing Smtp  with ESMTPSA
 id l46pqeQaNDAHrl46pqH9TP; Tue, 26 Sep 2023 11:12:00 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Tue, 26 Sep 2023 11:11:55 +0200
Message-Id: <20230926091158.3767645-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfOv1FuaCKyh6FlXHwcAkBphtIY7i6wu2Ny3O/TuDIEiTKTqbM30VwVvPdKdAB56SnoCbBOxE3g1W5S8cPm5L8+883txGn9x/7gVNupa55IC0yZJBgel8
 +gTgD482XnJxCv9bp9yghZVd+zWl1545v3Zog4zmhaJXTGdK2wumdi9YOH7iWRwzxEfC1tQ8BSnPR+dJtrkVGQSGzAHDbzirO4RpEY1ird92N9VOTqQTu3vV
 AfVtyK0cgAC4lGizVLUasEoWhYnn9fhIMvwswLivjcDDRcs7ZBWRm2xBdqewXZ87b++dlhxsuKAL6KLWHWEyPMylSvveG6Xdme25d/9zIYBnUhIwXsy65f0D
 0k+rvAe4PGp6yqun38Y4iHZQP8984p566nZ+yrTAFCIOVKobFwHJsVU/6ntJyf4gTmjvLdWxL1wejklA5PSijymS+45Qtg==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1695719520; bh=a18TMQPVlnUUt3A4pohzmQlbtHNqK5uLCBgicXx1YFs=;
 h=From:To:Subject:Date:MIME-Version;
 b=ClqlydVhyHOdAI1/r2GSrnE4TkcUGnzsPqMvvnUmk1Q5sTh40aL5UK2bEaBB3RCNZ
 3tCC+sy/iPfOoiv8GM84Odvl5bDOgByyQrpSZHx7lqiXcWpQfUlJe6ZkD9TOMx9/H0
 z2LjzaH+9k8mJ0ZR/qSaR4m7A/O/DLheB9t5+rpotb2Bn+ZwiL960ARu5z2ZXDt1Yd
 e1teQbmxT7EofIzmUVaKxcnWyhI7xmsx4KEV7Oxx0uY1JaAiZZ8FN3/HVO9U4WZkpH
 d4tEsplFBxKOusYbcnqfNx6VWsXB3NiWxwpAFGQxgzM1+5kJOJ9tY6Wm32zNXeF029
 7d2MzGBvkp6TA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=ClqlydVh
Subject: [Buildroot] [PATCH v2 1/4] package/libtraceevent: new package
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
Cc: Pierre Floury <pierre.floury@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Maxime Chevallier <maxime.chevallier@bootlin.com>

Introduce the libtraceevent library, that used to be bundled with the
trace-cmd tool. This library is now used by several tools and libraries
such as trace-cmd, libtracefs and rtla.

This package tries to install libraries in /usr/local/lib by default,
hence the redefinition of the "prefix" variable, so that the library
gets installed in "/usr/lib" instead.

The same applies to the pkgconfig handling of the proved Makefile, which
installs the .pc files in the /usr/local area by default, hence the
redefinition of the pkgconfig_dir to either the correct directory within the
staging area, or to empty value for the target to avoid installing the .pc
in that case.

Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
[Giulio: bump version to 1.7.3 and add hash file]
Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
Giulio:
V1->V2:
* bump to version 1.7.3
* add hash file
---
 DEVELOPERS                               |  3 +++
 package/Config.in                        |  1 +
 package/libtraceevent/Config.in          |  9 +++++++
 package/libtraceevent/libtraceevent.hash |  4 +++
 package/libtraceevent/libtraceevent.mk   | 33 ++++++++++++++++++++++++
 5 files changed, 50 insertions(+)
 create mode 100644 package/libtraceevent/Config.in
 create mode 100644 package/libtraceevent/libtraceevent.hash
 create mode 100644 package/libtraceevent/libtraceevent.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 38973a75dc..306c3cf2be 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2096,6 +2096,9 @@ F:	package/postgresql/
 F:	package/protozero/
 F:	package/timescaledb/
 
+N:	Maxime Chevallier <maxime.chevallier@bootlin.com>
+F:	package/libtraceevent/
+
 N:	Michael Durrant <mdurrant@arcturusnetworks.com>
 F:	board/arcturus/
 F:	configs/arcturus_ucp1020_defconfig
diff --git a/package/Config.in b/package/Config.in
index 1e8b6f90c1..cb7afd188e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -117,6 +117,7 @@ menu "Debugging, profiling and benchmark"
 	source "package/kyua/Config.in"
 	source "package/latencytop/Config.in"
 	source "package/libbpf/Config.in"
+	source "package/libtraceevent/Config.in"
 	source "package/lmbench/Config.in"
 	source "package/lsof/Config.in"
 	source "package/ltp-testsuite/Config.in"
diff --git a/package/libtraceevent/Config.in b/package/libtraceevent/Config.in
new file mode 100644
index 0000000000..d351e3b4de
--- /dev/null
+++ b/package/libtraceevent/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_LIBTRACEEVENT
+	bool "libtraceevent"
+	help
+	  libtraceevent is a library that interfaces with the ftrace
+	  subsystem in the linux kernel.
+	  It used to be bundled directly in the trace-cmd
+	  tool, but it was eventually extracted so that it can be used
+	  by multiple other tools and libraries, such as libtracefs and
+	  rtla.
diff --git a/package/libtraceevent/libtraceevent.hash b/package/libtraceevent/libtraceevent.hash
new file mode 100644
index 0000000000..15c4883afd
--- /dev/null
+++ b/package/libtraceevent/libtraceevent.hash
@@ -0,0 +1,4 @@
+# Locally computed
+sha256  097b72e0d907f3107825fb2edf0188324bf70dc9da360f6efa68dc484ffde541  libtraceevent-1.7.3.tar.gz
+sha256  f6b78c087c3ebdf0f3c13415070dd480a3f35d8fc76f3d02180a407c1c812f79  GPL-2.0
+sha256  0b9a4febcdee6de55872501d5c1a8f5d8b0d1650cd4d5351995ceb22e889f8ca  LGPL-2.1
diff --git a/package/libtraceevent/libtraceevent.mk b/package/libtraceevent/libtraceevent.mk
new file mode 100644
index 0000000000..75c23f7410
--- /dev/null
+++ b/package/libtraceevent/libtraceevent.mk
@@ -0,0 +1,33 @@
+################################################################################
+#
+# libtraceevent
+#
+################################################################################
+
+LIBTRACEEVENT_VERSION = 1.7.3
+LIBTRACEEVENT_SITE = https://git.kernel.org/pub/scm/libs/libtrace/libtraceevent.git/snapshot
+LIBTRACEEVENT_INSTALL_STAGING = YES
+LIBTRACEEVENT_LICENSE = GPL-2.0, LGPL-2.1
+LIBTRACEEVENT_LICENSE_FILES = LICENSES/GPL-2.0 LICENSES/LGPL-2.1
+
+define LIBTRACEEVENT_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)
+endef
+
+define LIBTRACEEVENT_INSTALL_STAGING_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE1) -C $(@D) $(TARGET_CONFIGURE_OPTS) \
+	DESTDIR=$(STAGING_DIR) \
+	pkgconfig_dir="/usr/lib/pkgconfig" \
+	prefix="/usr" \
+	install
+endef
+
+define LIBTRACEEVENT_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE1) -C $(@D) $(TARGET_CONFIGURE_OPTS) \
+	DESTDIR=$(TARGET_DIR) \
+	pkgconfig_dir="" \
+	prefix="/usr" \
+	install
+endef
+
+$(eval $(generic-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35C69CDB465
	for <buildroot@archiver.kernel.org>; Sat, 14 Oct 2023 21:58:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8138F81F4D;
	Sat, 14 Oct 2023 21:58:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8138F81F4D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xH-NDdUL-ORX; Sat, 14 Oct 2023 21:58:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 67AAF81F69;
	Sat, 14 Oct 2023 21:58:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 67AAF81F69
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4AF6F1BF83E
 for <buildroot@lists.busybox.net>; Sat, 14 Oct 2023 21:57:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 246CE607C9
 for <buildroot@lists.busybox.net>; Sat, 14 Oct 2023 21:57:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 246CE607C9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1f9iTq_PDQ69 for <buildroot@lists.busybox.net>;
 Sat, 14 Oct 2023 21:57:47 +0000 (UTC)
Received: from smtpdh17-1.aruba.it (smtpdh17-1.aruba.it [62.149.155.116])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0551C606BF
 for <buildroot@buildroot.org>; Sat, 14 Oct 2023 21:57:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0551C606BF
Received: from localhost.localdomain ([146.241.127.78])
 by Aruba Outgoing Smtp  with ESMTPSA
 id rmdiq6C0m6PZFrmdiqeJjT; Sat, 14 Oct 2023 23:57:43 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sat, 14 Oct 2023 23:57:39 +0200
Message-Id: <20231014215741.716289-2-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231014215741.716289-1-giulio.benetti@benettiengineering.com>
References: <20231014215741.716289-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfDTBDC5btgH/FKL2LPsVUZ1Ix4HFQmX+D3+xwXEKQCtbu0GpEJmvNsHSQzwTYfX7iZXZnhUMmWiQCeP9tTPLEOOnJZyJI+DRvtkRiQGuLpb9T6PTb1Va
 KnEDeezeZZsOtpY0NS1/lGZsFIk7uj7HJtnEqUlePoPWaB4sT67EbuetIUdi5/RfNbUCfUuBM3O/Fc3la5HboFcGvXsZYwkj/vjI6syqwowrn3iSL485bcEf
 1dWEYQ17Tf9RZLYd+Tp4dOKuuL2xv/Ft4Po/Y6o47yA9/bkwLH+d4MPechnyB6/pVmkaR0oY1R9LRNs6IuS/rwHmO9Net97gQFX8vHL9Vr8QEWr5P6jva0pp
 L+y18cFu54Iu95JheFB13Qs21OhCC6nXf1nOn26XNB58d/H3dzwVKTTdzN+J+/SexgblWrfB0T4l4znB155J7lGmH8zu7Q==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1697320663; bh=GuEcdo27f45lLTCU/INYnwF89ufHmoIhXncL+IfX6eE=;
 h=From:To:Subject:Date:MIME-Version;
 b=PJTbReiX2uv/b40crABST01dnXMts8knaWyYvgEeXmhNUqaFqQuK89uAiQb1qs4KP
 NyYHQ+4Thf/CpLgEYF50iUOHnPUJLrwE7iBh0++uaHPA/kCUrrKncD2vMhUREoNqrz
 i9Qjp9nwvgOokeOTuisKS//igIV1cObPgLif6JTikDfs+VltiOB+7nuRjsdZmDzu0T
 09NUckUKoRtgiQzfCas1OHn6HWVFl1Ldkpa2glL+YrEwuKAO/nzn9tJU7/qLgTZTaP
 pVCaIm5p56emgTlrjWJdC1aDojzdSXmqCMnxC9s361aQhMZSB4dRJBOblSHEWseJOd
 d8RaKGm3gYLlQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=PJTbReiX
Subject: [Buildroot] [PATCH v4 2/4] package/libtracefs: new package
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Pierre Floury <pierre.floury@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Maxime Chevallier <maxime.chevallier@bootlin.com>

Introduce the libtracefs library, that is used to be bundled with the
trace-cmd tool. This library is now used by several tools and libraries
such as trace-cmd and rtla, and is used as an interface to the ftrace
kernel subsystem through tracefs.

To build with meson, this package requires to disable documentation
generation, and since this is not possible add a local patch pending
upstream that adds -Ddoc=false support to libtracefs.

Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
[Giulio:
	- bump version to 1.7.0 and add hash file
	- move to meson build system
]
Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
V1->V2:
* bump to version 1.7.0
* add hash file
V2->V3:
* switch to meson build system
---
 DEVELOPERS                                    |  2 +
 package/Config.in                             |  1 +
 ...-add-option-to-disable-documentation.patch | 51 +++++++++++++++++++
 package/libtracefs/Config.in                  |  6 +++
 package/libtracefs/libtracefs.hash            |  4 ++
 package/libtracefs/libtracefs.mk              | 18 +++++++
 6 files changed, 82 insertions(+)
 create mode 100644 package/libtracefs/0001-libtracefs-add-option-to-disable-documentation.patch
 create mode 100644 package/libtracefs/Config.in
 create mode 100644 package/libtracefs/libtracefs.hash
 create mode 100644 package/libtracefs/libtracefs.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 5506082545..5c4bc87e16 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1222,6 +1222,7 @@ F:	package/libnspr/
 F:	package/libnss/
 F:	package/libnvme/
 F:	package/libtraceevent/
+F:	package/libtracefs
 F:	package/mali-driver/
 F:	package/minicom/
 F:	package/mmc-utils/
@@ -2114,6 +2115,7 @@ F:	package/timescaledb/
 
 N:	Maxime Chevallier <maxime.chevallier@bootlin.com>
 F:	package/libtraceevent/
+F:	package/libtracefs
 
 N:	Michael Durrant <mdurrant@arcturusnetworks.com>
 F:	board/arcturus/
diff --git a/package/Config.in b/package/Config.in
index 2b3d3e612f..821bd1b366 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -118,6 +118,7 @@ menu "Debugging, profiling and benchmark"
 	source "package/latencytop/Config.in"
 	source "package/libbpf/Config.in"
 	source "package/libtraceevent/Config.in"
+	source "package/libtracefs/Config.in"
 	source "package/lmbench/Config.in"
 	source "package/lsof/Config.in"
 	source "package/ltp-testsuite/Config.in"
diff --git a/package/libtracefs/0001-libtracefs-add-option-to-disable-documentation.patch b/package/libtracefs/0001-libtracefs-add-option-to-disable-documentation.patch
new file mode 100644
index 0000000000..0813451008
--- /dev/null
+++ b/package/libtracefs/0001-libtracefs-add-option-to-disable-documentation.patch
@@ -0,0 +1,51 @@
+From 881e23ed774360f93ca81f820d7897bd9bbd6d63 Mon Sep 17 00:00:00 2001
+From: Giulio Benetti <giulio.benetti@benettiengineering.com>
+Date: Sat, 30 Sep 2023 22:40:08 +0200
+Subject: [PATCH] libtracefs: add option to disable documentation
+
+On some Linux environment builder(i.e. Buildroot) host asciidoc is not
+provided since by default all man/docs are not installed to target but
+meson.build at the moment build ascii and html documentation and
+requires asciidoc making the building to fail. So let's add doc option
+set to true by default to let the user to override it and not produce
+the documentation.
+
+Upstream: https://patchwork.kernel.org/project/linux-trace-devel/patch/20230930204008.2528607-1-giulio.benetti@benettiengineering.com/
+
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+---
+ meson.build       | 3 +++
+ meson_options.txt | 2 ++
+ 2 files changed, 5 insertions(+)
+
+diff --git a/meson.build b/meson.build
+index 9d42d78..f1e492e 100644
+--- a/meson.build
++++ b/meson.build
+@@ -39,6 +39,8 @@ if cunit_dep.found()
+     subdir('utest')
+ endif
+ subdir('samples')
++
++if get_option('doc')
+ subdir('Documentation')
+ 
+ custom_target(
+@@ -46,3 +48,4 @@ custom_target(
+     output: 'docs',
+     depends: [html, man],
+     command: ['echo'])
++endif
+diff --git a/meson_options.txt b/meson_options.txt
+index 1d92c28..5533a88 100644
+--- a/meson_options.txt
++++ b/meson_options.txt
+@@ -14,3 +14,5 @@ option('man-bold-literal', type : 'boolean', value : false,
+        description : 'enable bold literals')
+ option('docbook-suppress-sp', type : 'boolean', value : false,
+        description : 'docbook suppress sp')
++option('doc', type : 'boolean', value: true,
++       description : 'produce documentation')
+-- 
+2.34.1
+
diff --git a/package/libtracefs/Config.in b/package/libtracefs/Config.in
new file mode 100644
index 0000000000..92ce0986df
--- /dev/null
+++ b/package/libtracefs/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_LIBTRACEFS
+	bool "libtracefs"
+	select BR2_PACKAGE_LIBTRACEEVENT
+	help
+	  libtracefs is used to easily interface with the ftrace
+	  interface through the tracefs virtual filesystem.
diff --git a/package/libtracefs/libtracefs.hash b/package/libtracefs/libtracefs.hash
new file mode 100644
index 0000000000..676fcf1111
--- /dev/null
+++ b/package/libtracefs/libtracefs.hash
@@ -0,0 +1,4 @@
+# Locally computed
+sha256  411fcbf3434ecbaefa6c2b1bf092266293a672e2d7ee46fdd6b402753cb8bd16  libtracefs-1.7.0.tar.gz
+sha256  f6b78c087c3ebdf0f3c13415070dd480a3f35d8fc76f3d02180a407c1c812f79  GPL-2.0
+sha256  0b9a4febcdee6de55872501d5c1a8f5d8b0d1650cd4d5351995ceb22e889f8ca  LGPL-2.1
diff --git a/package/libtracefs/libtracefs.mk b/package/libtracefs/libtracefs.mk
new file mode 100644
index 0000000000..cb705d4298
--- /dev/null
+++ b/package/libtracefs/libtracefs.mk
@@ -0,0 +1,18 @@
+################################################################################
+#
+# libtracefs
+#
+################################################################################
+
+LIBTRACEFS_VERSION = 1.7.0
+LIBTRACEFS_SITE = https://git.kernel.org/pub/scm/libs/libtrace/libtracefs.git/snapshot
+LIBTRACEFS_INSTALL_STAGING = YES
+LIBTRACEFS_LICENSE = GPL-2.0, LGPL-2.1
+LIBTRACEFS_LICENSE_FILES = LICENSES/GPL-2.0 LICENSES/LGPL-2.1
+
+LIBTRACEFS_DEPENDENCIES = host-pkgconf libtraceevent
+
+LIBTRACEFS_CONF_OPTS = \
+	-Ddoc=false
+
+$(eval $(meson-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

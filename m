Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDFA7C07545
	for <buildroot@archiver.kernel.org>; Tue, 24 Oct 2023 14:43:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 90ADD4EF2E;
	Tue, 24 Oct 2023 14:43:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 90ADD4EF2E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id a_uE-xbIVEyt; Tue, 24 Oct 2023 14:43:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6B5784EF25;
	Tue, 24 Oct 2023 14:43:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6B5784EF25
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D879A1BF2C4
 for <buildroot@lists.busybox.net>; Tue, 24 Oct 2023 14:43:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B123A4EEE2
 for <buildroot@lists.busybox.net>; Tue, 24 Oct 2023 14:43:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B123A4EEE2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Mx28eA5yJl6d for <buildroot@lists.busybox.net>;
 Tue, 24 Oct 2023 14:43:11 +0000 (UTC)
Received: from smtpcmd0642.aruba.it (smtpcmd0642.aruba.it [62.149.156.42])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 36C7A4EF2C
 for <buildroot@buildroot.org>; Tue, 24 Oct 2023 14:43:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 36C7A4EF2C
Received: from localhost.localdomain ([146.241.115.208])
 by Aruba Outgoing Smtp  with ESMTPSA
 id vIccqa0A1F9g1vIcdq3zjP; Tue, 24 Oct 2023 16:43:07 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Tue, 24 Oct 2023 16:42:54 +0200
Message-Id: <20231024144256.2708299-2-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231024144256.2708299-1-giulio.benetti@benettiengineering.com>
References: <20231024144256.2708299-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfOBlLKlf/KLc5g+ryybK6Ihldu5EIrKHbAKDm6yIFdzlICGwwQ4JjURmhbG0J8Dx6MT6Hnkx4F9jGHBWiE5DBAxASeUEOijFIjOvNDwbD/Hx0+liyMLY
 FWZ+HrwSNqrQQl/mv3D8D/A9epooDXSQqmuphs7YC68MAgL1t4FXth/m4JZRjU/K+77UiuoYXJMC0qmsefTFWDMePjemt7PbmYnBK4lY7fkg+FPU1rvDDZKV
 C3Tip/Bo5MGJZqeaxbbIYPrR8AeUxbvA8SE5rVqtJgJsrjTpldUnbWXikNvpMrwskvK+DX7kXeK3AMFwl111Yn0ElzTpuXMl+pX27ITaSPdSxGzr87xS8buU
 C/GnGyh10js3DF2d5khLUjVJbe8XrNbbHVD2ltR3XhpMVNSkLdu0/ifKCSFudOrWs/aUsVK73B/FYODI5qrgji5oAkANew6qT0u2bOiYLlMjY010K38=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1698158587; bh=EPhF+CDvO9SFHgBJqp/YbVrbOEofN54vEteSKk3qHzY=;
 h=From:To:Subject:Date:MIME-Version;
 b=JxcldLLDGTIh7eSlhrbDDAyp0V3tlQKTdg1RlFRv2AQswhkuekSwdRsTpPhOEUejy
 5Z6nscZa1yeFEEDojcN0Bt2XRpKAusd4b42+Bddgl69otpsMNh/AXEpq21H0TkvVlu
 usVyBW3T6wOdDcTLSlwLZTlZU0lOu/MKy1sIUWoVqr4pfttmBtLk+qpsy84Y3yq7Z7
 rKLLp1TVzOm0BchV6QWaAJ8gpzMMT9HO8gfLq8fRFaYC4NMWDkcn1NT/KomlBXYSYT
 DGZteWpiPuUlIme5flSTeZzxBLiP9wZt02KTmzlJ9RcWecl4JQPYe55t5PijQ7ev5U
 GaUbyISiGVvAA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=JxcldLLD
Subject: [Buildroot] [PATCH v5 2/4] package/libtracefs: new package
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
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Pierre Floury <pierre.floury@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Andreas Ziegler <br015@umbiko.net>
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
---
V1->V2:
* bump to version 1.7.0
* add hash file
V2->V3:
* switch to meson build system
V4->V5:
* add host-flex/bison dependencies as suggested by Andreas Ziegler
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
index 47c054bb56..09af18c54c 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1226,6 +1226,7 @@ F:	package/libnspr/
 F:	package/libnss/
 F:	package/libnvme/
 F:	package/libtraceevent/
+F:	package/libtracefs
 F:	package/mali-driver/
 F:	package/minicom/
 F:	package/mmc-utils/
@@ -2118,6 +2119,7 @@ F:	package/timescaledb/
 
 N:	Maxime Chevallier <maxime.chevallier@bootlin.com>
 F:	package/libtraceevent/
+F:	package/libtracefs
 
 N:	Michael Durrant <mdurrant@arcturusnetworks.com>
 F:	board/arcturus/
diff --git a/package/Config.in b/package/Config.in
index 15f6bdee16..18cbb745dd 100644
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
index 0000000000..1e6e19a234
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
+LIBTRACEFS_DEPENDENCIES = host-bison host-flex host-pkgconf libtraceevent
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

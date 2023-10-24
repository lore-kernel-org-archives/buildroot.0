Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29853C07545
	for <buildroot@archiver.kernel.org>; Tue, 24 Oct 2023 14:43:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C4B3A4EF4B;
	Tue, 24 Oct 2023 14:43:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C4B3A4EF4B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id t14fIw8XYSB2; Tue, 24 Oct 2023 14:43:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A3C894EEDA;
	Tue, 24 Oct 2023 14:43:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A3C894EEDA
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9A88F1BF2C4
 for <buildroot@lists.busybox.net>; Tue, 24 Oct 2023 14:43:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4067D432FE
 for <buildroot@lists.busybox.net>; Tue, 24 Oct 2023 14:43:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4067D432FE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ffE3w03VJlGD for <buildroot@lists.busybox.net>;
 Tue, 24 Oct 2023 14:43:10 +0000 (UTC)
Received: from smtpcmd0642.aruba.it (smtpcmd0642.aruba.it [62.149.156.42])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1108A43304
 for <buildroot@buildroot.org>; Tue, 24 Oct 2023 14:43:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1108A43304
Received: from localhost.localdomain ([146.241.115.208])
 by Aruba Outgoing Smtp  with ESMTPSA
 id vIccqa0A1F9g1vIccq3zj1; Tue, 24 Oct 2023 16:43:07 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Tue, 24 Oct 2023 16:42:53 +0200
Message-Id: <20231024144256.2708299-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfOBlLKlf/KLc5g+ryybK6Ihldu5EIrKHbAKDm6yIFdzlICGwwQ4JjURmhbG0J8Dx6MT6Hnkx4F9jGHBWiE5DBAxASeUEOijFIjOvNDwbD/Hx0+liyMLY
 FWZ+HrwSNqrQQl/mv3D8D/A9epooDXSQqmuphs7YC68MAgL1t4FXth/m4JZRjU/K+77UiuoYXJMC0qmsefTFWDMePjemt7PbmYnBK4lY7fkg+FPU1rvDDZKV
 C3Tip/Bo5MGJZqeaxbbIYPrR8AeUxbvA8SE5rVqtJgJsrjTpldUnbWXikNvpMrwskvK+DX7kXeK3AMFwl111Yn0ElzTpuXMl+pX27ITaSPdSxGzr87xS8buU
 C/GnGyh10js3DF2d5khLUjVJbe8XrNbbHVD2ltR3XhpMVNSkLdu0/ifKCSFudOrWs/aUsVK73B/FYODI5qrgji5oAkANew6qT0u2bOiYLlMjY010K38=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1698158587; bh=rA0GxWOPzBuOYzXxwAwh+5WoVvofkS0rrEIONNSAdns=;
 h=From:To:Subject:Date:MIME-Version;
 b=S1hvXbOnVN73oyX3KODzloOdH3EYuwaUEbuSh1fGuAbpbceK/Ag+ug6BWW1MDNY0x
 epyxBFp7NgGfK8FZKw2YYQA4DARVVOO2cXBdTUdEMoiJNY0O8DkwDodef1kLQPMswC
 JibWtHOHnkSfK9GiDFqFqi+KJOX+HS7soG7P5mYnf4+4FgmcHcpS27ctgG/BPwrhuV
 oYM76vf3W82PDq3jNKh+PVS//QpeM8NwYp+DtAxbUojS6XxmR7NmZuw5vnZlXJD98b
 VSR36i81D6us2BrPFaA1Hi+LCstMFYhbTZxJlPhsZklbSbPjpKrQByVeQcd2DFebsx
 ieJUdCRUHL9wA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=S1hvXbOn
Subject: [Buildroot] [PATCH v5 1/4] package/libtraceevent: new package
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

Introduce the libtraceevent library, that is used to be bundled with the
trace-cmd tool. This library is now used by several tools and libraries
such as trace-cmd, libtracefs and rtla.

To build with meson, this package requires to disable documentation
generation, and since this is not possible add a local patch pending
upstream that adds -Ddoc=false support to libtraceevent.

Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
[Giulio:
	- bump version to 1.7.3 and add hash file
	- move to meson build system
]
Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
V1->V2:
* bump to version 1.7.3
* add hash file
V3->V4:
* switch to meson build system
---
 DEVELOPERS                                    |  4 ++
 package/Config.in                             |  1 +
 ...-add-option-to-disable-documentation.patch | 51 +++++++++++++++++++
 package/libtraceevent/Config.in               |  9 ++++
 package/libtraceevent/libtraceevent.hash      |  4 ++
 package/libtraceevent/libtraceevent.mk        | 16 ++++++
 6 files changed, 85 insertions(+)
 create mode 100644 package/libtraceevent/0001-libtraceevent-add-option-to-disable-documentation.patch
 create mode 100644 package/libtraceevent/Config.in
 create mode 100644 package/libtraceevent/libtraceevent.hash
 create mode 100644 package/libtraceevent/libtraceevent.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 382d28fb79..47c054bb56 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1225,6 +1225,7 @@ F:	package/libfuse3/
 F:	package/libnspr/
 F:	package/libnss/
 F:	package/libnvme/
+F:	package/libtraceevent/
 F:	package/mali-driver/
 F:	package/minicom/
 F:	package/mmc-utils/
@@ -2115,6 +2116,9 @@ F:	package/postgresql/
 F:	package/protozero/
 F:	package/timescaledb/
 
+N:	Maxime Chevallier <maxime.chevallier@bootlin.com>
+F:	package/libtraceevent/
+
 N:	Michael Durrant <mdurrant@arcturusnetworks.com>
 F:	board/arcturus/
 F:	configs/arcturus_ucp1020_defconfig
diff --git a/package/Config.in b/package/Config.in
index 319a18c770..15f6bdee16 100644
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
diff --git a/package/libtraceevent/0001-libtraceevent-add-option-to-disable-documentation.patch b/package/libtraceevent/0001-libtraceevent-add-option-to-disable-documentation.patch
new file mode 100644
index 0000000000..ba55315175
--- /dev/null
+++ b/package/libtraceevent/0001-libtraceevent-add-option-to-disable-documentation.patch
@@ -0,0 +1,51 @@
+From 62740520e25c9afbdfbd8cd8ef2e1c6b02d91915 Mon Sep 17 00:00:00 2001
+From: Giulio Benetti <giulio.benetti@benettiengineering.com>
+Date: Sat, 30 Sep 2023 22:40:17 +0200
+Subject: [PATCH] libtraceevent: add option to disable documentation
+
+On some Linux environment builder(i.e. Buildroot) host asciidoc is not
+provided since by default all man/docs are not installed to target but
+meson.build at the moment build ascii and html documentation and
+requires asciidoc making the building to fail. So let's add doc option
+set to true by default to let the user to override it and not produce
+the documentation.
+
+Upstream: https://patchwork.kernel.org/project/linux-trace-devel/patch/20230930204017.2528627-1-giulio.benetti@benettiengineering.com/
+
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+---
+ meson.build       | 3 +++
+ meson_options.txt | 2 ++
+ 2 files changed, 5 insertions(+)
+
+diff --git a/meson.build b/meson.build
+index b61c873..9a18e02 100644
+--- a/meson.build
++++ b/meson.build
+@@ -45,6 +45,8 @@ if cunit_dep.found()
+     subdir('utest')
+ endif
+ subdir('samples')
++
++if get_option('doc')
+ subdir('Documentation')
+ 
+ custom_target(
+@@ -52,3 +54,4 @@ custom_target(
+     output: 'docs',
+     depends: [html, man],
+     command: ['echo'])
++endif
+diff --git a/meson_options.txt b/meson_options.txt
+index b2294f6..9a40dad 100644
+--- a/meson_options.txt
++++ b/meson_options.txt
+@@ -16,3 +16,5 @@ option('man-bold-literal', type : 'boolean', value : false,
+        description : 'enable bold literals')
+ option('docbook-suppress-sp', type : 'boolean', value : false,
+        description : 'docbook suppress sp')
++option('doc', type : 'boolean', value: true,
++       description : 'produce documentation')
+-- 
+2.34.1
+
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
index 0000000000..1a3dae463e
--- /dev/null
+++ b/package/libtraceevent/libtraceevent.mk
@@ -0,0 +1,16 @@
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
+LIBTRACEEVENT_CONF_OPTS = \
+	-Ddoc=false
+
+$(eval $(meson-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1CBEC46CD2
	for <buildroot@archiver.kernel.org>; Sat,  6 Jan 2024 14:11:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7D2CA60B48;
	Sat,  6 Jan 2024 14:11:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7D2CA60B48
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JtiwqlExBJvs; Sat,  6 Jan 2024 14:11:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BB08A60B4E;
	Sat,  6 Jan 2024 14:11:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BB08A60B4E
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EDDF51BF362
 for <buildroot@lists.busybox.net>; Sat,  6 Jan 2024 14:11:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CBAA94209C
 for <buildroot@lists.busybox.net>; Sat,  6 Jan 2024 14:11:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CBAA94209C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EKyisc137R7b for <buildroot@lists.busybox.net>;
 Sat,  6 Jan 2024 14:11:32 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 029454209B
 for <buildroot@buildroot.org>; Sat,  6 Jan 2024 14:11:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 029454209B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E1B7B846CF; Sat,  6 Jan 2024 14:11:31 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 6 Jan 2024 14:43:35 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d1c067e01be4ec60498cc6db263cdd07382a2998
X-Git-Newrev: 1474f1b34b178defca1d16d18a2446fadda9a12b
X-Patchwork-Hint: ignore
Message-Id: <20240106141131.E1B7B846CF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libtraceevent: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=1474f1b34b178defca1d16d18a2446fadda9a12b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
[yann.morin.1998@free.fr:
  - bump to 1.8.1, drop patch applied upstream
  - add "homepage" to help text
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 DEVELOPERS                               |  4 ++++
 package/Config.in                        |  1 +
 package/libtraceevent/Config.in          | 11 +++++++++++
 package/libtraceevent/libtraceevent.hash |  4 ++++
 package/libtraceevent/libtraceevent.mk   | 17 +++++++++++++++++
 5 files changed, 37 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 2b67c616fa..4461216122 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1235,6 +1235,7 @@ F:	package/libfuse3/
 F:	package/libnspr/
 F:	package/libnss/
 F:	package/libnvme/
+F:	package/libtraceevent/
 F:	package/mali-driver/
 F:	package/minicom/
 F:	package/mongoose/
@@ -2131,6 +2132,9 @@ F:	package/postgresql/
 F:	package/protozero/
 F:	package/timescaledb/
 
+N:	Maxime Chevallier <maxime.chevallier@bootlin.com>
+F:	package/libtraceevent/
+
 N:	Michael Durrant <mdurrant@arcturusnetworks.com>
 F:	board/arcturus/
 F:	configs/arcturus_ucp1020_defconfig
diff --git a/package/Config.in b/package/Config.in
index a2cc80aa27..a6d76c4b3d 100644
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
index 0000000000..399238eef1
--- /dev/null
+++ b/package/libtraceevent/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_LIBTRACEEVENT
+	bool "libtraceevent"
+	help
+	  libtraceevent is a library that interfaces with the ftrace
+	  subsystem in the linux kernel.
+	  It used to be bundled directly in the trace-cmd
+	  tool, but it was eventually extracted so that it can be used
+	  by multiple other tools and libraries, such as libtracefs and
+	  rtla.
+
+	  https://git.kernel.org/pub/scm/libs/libtrace/libtraceevent.git/
diff --git a/package/libtraceevent/libtraceevent.hash b/package/libtraceevent/libtraceevent.hash
new file mode 100644
index 0000000000..b2ffbc9c0a
--- /dev/null
+++ b/package/libtraceevent/libtraceevent.hash
@@ -0,0 +1,4 @@
+# Locally computed
+sha256  1801f416b317e2ae0430ce964cf22b9ecb9fb5cd9c6c2d1073b29953c3309bca  libtraceevent-1.8.1.tar.gz
+sha256  f6b78c087c3ebdf0f3c13415070dd480a3f35d8fc76f3d02180a407c1c812f79  GPL-2.0
+sha256  0b9a4febcdee6de55872501d5c1a8f5d8b0d1650cd4d5351995ceb22e889f8ca  LGPL-2.1
diff --git a/package/libtraceevent/libtraceevent.mk b/package/libtraceevent/libtraceevent.mk
new file mode 100644
index 0000000000..d348fc51f6
--- /dev/null
+++ b/package/libtraceevent/libtraceevent.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# libtraceevent
+#
+################################################################################
+
+LIBTRACEEVENT_VERSION = 1.8.1
+LIBTRACEEVENT_SITE = https://git.kernel.org/pub/scm/libs/libtrace/libtraceevent.git/snapshot
+LIBTRACEEVENT_LICENSE = GPL-2.0, LGPL-2.1
+LIBTRACEEVENT_LICENSE_FILES = LICENSES/GPL-2.0 LICENSES/LGPL-2.1
+
+LIBTRACEEVENT_INSTALL_STAGING = YES
+
+LIBTRACEEVENT_CONF_OPTS = \
+	-Ddoc=false
+
+$(eval $(meson-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

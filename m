Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA7BCC4332F
	for <buildroot@archiver.kernel.org>; Fri,  3 Nov 2023 09:33:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 62B7C60E72;
	Fri,  3 Nov 2023 09:33:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 62B7C60E72
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oC-DFrdBLXIY; Fri,  3 Nov 2023 09:32:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CBB35610C3;
	Fri,  3 Nov 2023 09:32:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CBB35610C3
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5C4341BF27E
 for <buildroot@lists.busybox.net>; Fri,  3 Nov 2023 09:31:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 386C9416F8
 for <buildroot@lists.busybox.net>; Fri,  3 Nov 2023 09:31:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 386C9416F8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yR57BXntcPrn for <buildroot@lists.busybox.net>;
 Fri,  3 Nov 2023 09:31:44 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4FBAF433DD
 for <buildroot@buildroot.org>; Fri,  3 Nov 2023 09:31:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4FBAF433DD
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3A5348655A; Fri,  3 Nov 2023 09:31:44 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 3 Nov 2023 10:30:24 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 770384bb94829ba8cea87a8de5ec8e3f0b9c7d64
X-Git-Newrev: 1da9c0e1be29f1d54cdf451c52c802ae84e1b5f2
X-Patchwork-Hint: ignore
Message-Id: <20231103093144.3A5348655A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/iodine: bump to version 0.8.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=1da9c0e1be29f1d54cdf451c52c802ae84e1b5f2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Replace non upstreamable patch
- Use LICENSE file added with
  https://github.com/yarrick/iodine/commit/721b7f0d9bae2997328d53fb6fc351cf67eb5d9d

https://github.com/yarrick/iodine/blob/v0.8.0/CHANGELOG

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .checkpackageignore                                |  1 -
 .../iodine/0001-disable-systemd-and-selinux.patch  | 29 ----------------
 ...1-src-osflags-fully-fix-cross-compilation.patch | 40 ++++++++++++++++++++++
 package/iodine/iodine.hash                         |  5 +--
 package/iodine/iodine.mk                           | 10 ++++--
 5 files changed, 50 insertions(+), 35 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 45f175cd55..7740914ff9 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -581,7 +581,6 @@ package/input-event-daemon/S99input-event-daemon ConsecutiveEmptyLines Indent Va
 package/intel-gmmlib/0001-Drop-hardening-related-flags.patch Upstream
 package/intel-mediasdk/0001-Don-t-force-fstack-protector.patch Upstream
 package/intltool/0001-perl-5.26-compatibility.patch Upstream
-package/iodine/0001-disable-systemd-and-selinux.patch Upstream
 package/iotop/0001-Fix-build-error-with-Python-3.patch Upstream
 package/iozone/0001-Add-new-targets-for-iozone.patch Upstream
 package/iperf/0001-fix-single-threaded-compile-breakage.patch Upstream
diff --git a/package/iodine/0001-disable-systemd-and-selinux.patch b/package/iodine/0001-disable-systemd-and-selinux.patch
deleted file mode 100644
index 965abb7cff..0000000000
--- a/package/iodine/0001-disable-systemd-and-selinux.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-Disable selinux and systemd support since they check for host headers.
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
-
-diff -Nura iodine-0.7.0.orig/src/osflags iodine-0.7.0/src/osflags
---- iodine-0.7.0.orig/src/osflags	2015-02-20 14:59:00.799958145 -0300
-+++ iodine-0.7.0/src/osflags	2015-02-20 15:05:54.791135141 -0300
-@@ -18,8 +18,8 @@
- 		;;
- 		Linux)
- 			FLAGS="";
--			[ -e /usr/include/selinux/selinux.h ] && FLAGS="$FLAGS -lselinux";
--			[ -e /usr/include/systemd/sd-daemon.h ] && FLAGS="$FLAGS -lsystemd-daemon";
-+			#[ -e /usr/include/selinux/selinux.h ] && FLAGS="$FLAGS -lselinux";
-+			#[ -e /usr/include/systemd/sd-daemon.h ] && FLAGS="$FLAGS -lsystemd-daemon";
- 			echo $FLAGS;
- 		;;
- 	esac
-@@ -34,8 +34,8 @@
- 		;;
- 		Linux)
- 			FLAGS="-D_GNU_SOURCE"
--			[ -e /usr/include/selinux/selinux.h ] && FLAGS="$FLAGS -DHAVE_SETCON";
--			[ -e /usr/include/systemd/sd-daemon.h ] && FLAGS="$FLAGS -DHAVE_SYSTEMD";
-+			#[ -e /usr/include/selinux/selinux.h ] && FLAGS="$FLAGS -DHAVE_SETCON";
-+			#[ -e /usr/include/systemd/sd-daemon.h ] && FLAGS="$FLAGS -DHAVE_SYSTEMD";
- 			echo $FLAGS;
- 		;;
- 	esac
diff --git a/package/iodine/0001-src-osflags-fully-fix-cross-compilation.patch b/package/iodine/0001-src-osflags-fully-fix-cross-compilation.patch
new file mode 100644
index 0000000000..c6dc321a6f
--- /dev/null
+++ b/package/iodine/0001-src-osflags-fully-fix-cross-compilation.patch
@@ -0,0 +1,40 @@
+From a5d71d076168f8ad1e7dd30b35f1569f180f429c Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Thu, 2 Nov 2023 23:03:15 +0100
+Subject: [PATCH] src/osflags: fully fix cross-compilation
+
+Cross-compilation was only partially fixed by
+https://github.com/yarrick/iodine/commit/024481c94b97ef37981621cdc38f8b20f8919418
+as selinux was still enabled depending on host file existence
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Upstream: https://github.com/yarrick/iodine/pull/93
+---
+ src/osflags | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/osflags b/src/osflags
+index 9a437bd..39ca5fa 100755
+--- a/src/osflags
++++ b/src/osflags
+@@ -20,7 +20,7 @@ link)
+ 		;;
+ 		Linux)
+ 			FLAGS="";
+-			[ -e /usr/include/selinux/selinux.h ] && FLAGS="$FLAGS -lselinux";
++			"$PKG_CONFIG" --exists libselinux && FLAGS="$FLAGS $($PKG_CONFIG --libs libselinux)";
+ 			"$PKG_CONFIG" --exists libsystemd-daemon && FLAGS="$FLAGS $($PKG_CONFIG --libs libsystemd-daemon)";
+ 			"$PKG_CONFIG" --exists libsystemd && FLAGS="$FLAGS $($PKG_CONFIG --libs libsystemd)";
+ 			echo $FLAGS;
+@@ -40,7 +40,7 @@ cflags)
+ 		;;
+ 		Linux)
+ 			FLAGS="-D_GNU_SOURCE"
+-			[ -e /usr/include/selinux/selinux.h ] && FLAGS="$FLAGS -DHAVE_SETCON";
++			"$PKG_CONFIG" --exists libselinux && FLAGS="$FLAGS -DHAVE_SETCON";
+ 			"$PKG_CONFIG" --exists libsystemd-daemon && FLAGS="$FLAGS -DHAVE_SYSTEMD";
+ 			"$PKG_CONFIG" --exists libsystemd && FLAGS="$FLAGS -DHAVE_SYSTEMD";
+ 			echo $FLAGS;
+-- 
+2.42.0
+
diff --git a/package/iodine/iodine.hash b/package/iodine/iodine.hash
index 4ba7aa95b8..6f765a2462 100644
--- a/package/iodine/iodine.hash
+++ b/package/iodine/iodine.hash
@@ -1,4 +1,5 @@
 # From http://code.kryo.se/iodine/
-md5  fdbf3b81cd69caf5230d76a8b039fd99  iodine-0.7.0.tar.gz
+md5  6f2a53476cbc09bbffe7e07d6e9dd19d  iodine-0.8.0.tar.gz
 # Locally computed
-sha256  f41a252b2218759aa351270b7ad9791bdd323836b940e35c0614837a5d24dcb7  README
+sha256  546e92cf8617f7970ea81c850b1063eb189c68c406d0c6a67e02c55e72e714c6  iodine-0.8.0.tar.gz
+sha256  9541123931e4df4ec84612e056a92ecaab905fe201deaf932b895406565fbb85  LICENSE
diff --git a/package/iodine/iodine.mk b/package/iodine/iodine.mk
index 521ca3d927..998f92503d 100644
--- a/package/iodine/iodine.mk
+++ b/package/iodine/iodine.mk
@@ -4,13 +4,17 @@
 #
 ################################################################################
 
-IODINE_VERSION = 0.7.0
+IODINE_VERSION = 0.8.0
 IODINE_SITE = http://code.kryo.se/iodine
-IODINE_DEPENDENCIES = zlib
 IODINE_LICENSE = MIT
-IODINE_LICENSE_FILES = README
+IODINE_LICENSE_FILES = LICENSE
 IODINE_CPE_ID_VENDOR = kryo
 IODINE_SELINUX_MODULES = iodine
+IODINE_DEPENDENCIES = \
+	host-pkgconf \
+	$(if $(BR2_PACKAGE_LIBSELINUX),libselinux) \
+	$(if $(BR2_PACKAGE_SYSTEMD),systemd) \
+	zlib
 
 IODINE_CFLAGS = $(TARGET_CFLAGS)
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

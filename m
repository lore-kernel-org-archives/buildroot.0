Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 769DFC4332F
	for <buildroot@archiver.kernel.org>; Sat,  4 Nov 2023 21:35:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3101B60DFE;
	Sat,  4 Nov 2023 21:35:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3101B60DFE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DB6qUt8cKvmA; Sat,  4 Nov 2023 21:35:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4AA5960AF4;
	Sat,  4 Nov 2023 21:35:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4AA5960AF4
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B53A11BF2F9
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 21:35:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8C6D160AE9
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 21:35:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8C6D160AE9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id s_mxMqNF_CX6 for <buildroot@lists.busybox.net>;
 Sat,  4 Nov 2023 21:35:39 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id A54AF60AF6
 for <buildroot@buildroot.org>; Sat,  4 Nov 2023 21:35:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A54AF60AF6
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 87C1886737; Sat,  4 Nov 2023 21:35:39 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 4 Nov 2023 22:33:48 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bfa3cd74d017ba47b91729f131daf5d5993c5265
X-Git-Newrev: f9f5b3a6cbc4e62beefdd0448842ef0c8c3eb6f6
X-Patchwork-Hint: ignore
Message-Id: <20231104213539.87C1886737@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libnfs: bump to version 5.0.2
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
Content-Type: multipart/mixed; boundary="===============5583655767619986510=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5583655767619986510==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=f9f5b3a6cbc4e62beefdd0448842ef0c8c3eb6f6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Update patch
- Handle pthread support added with
  https://github.com/sahlberg/libnfs/commit/f55637619ecbeb7c7bbd4143768b6b45100be86c

https://github.com/sahlberg/libnfs/blob/libnfs-5.0.2/CHANGELOG

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .checkpackageignore                              | 1 -
 package/libnfs/0001-Fix-include-sys-time.h.patch | 9 +++++----
 package/libnfs/libnfs.hash                       | 2 +-
 package/libnfs/libnfs.mk                         | 8 +++++++-
 4 files changed, 13 insertions(+), 7 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 9db01a5fde..ff26d44a0a 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -705,7 +705,6 @@ package/libmpeg2/0003-fix-arm-detection.patch Upstream
 package/libmpeg2/0004-fix-sparc.patch Upstream
 package/libnetfilter_conntrack/0001-conntrack-fix-build-with-kernel-5-15-and-musl.patch Upstream
 package/libnfc/0001-autotools-make-example-build-optional.patch Upstream
-package/libnfs/0001-Fix-include-sys-time.h.patch Upstream
 package/libnids/0001-libpcap-use-pkg-config.patch Upstream
 package/libnl/0001-Add-musl-workaround-to-the-libc-compat.h-copy.patch Upstream
 package/libnss/0001-Bug-1801182-Allow-overriding-OS_ARCH-OS_TEST-and-OS_.patch Upstream
diff --git a/package/libnfs/0001-Fix-include-sys-time.h.patch b/package/libnfs/0001-Fix-include-sys-time.h.patch
index 15b281672a..c3779f13a2 100644
--- a/package/libnfs/0001-Fix-include-sys-time.h.patch
+++ b/package/libnfs/0001-Fix-include-sys-time.h.patch
@@ -11,10 +11,11 @@ POSIX says `struct timeval` is defined if <sys/time.h> is included.
 Instead of the mess that is currently done based on the system on which
 the stuff is being compiled, include it unconditionally.
 
-Reported upstream:
-https://github.com/sahlberg/libnfs/issues/272
+Upstream: https://github.com/sahlberg/libnfs/issues/272
 
 Signed-off-by: Jörg Krause <joerg.krause@embedded.rocks>
+[Fabrice: update for 5.0.2]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 ---
  include/nfsc/libnfs.h | 5 -----
  1 file changed, 5 deletions(-)
@@ -27,8 +28,8 @@ index 09dcf1c..b6db58c 100755
  #define _LIBNFS_H_
  
  #include <stdint.h>
--#if defined(__ANDROID__) || defined(AROS) \
-- || ( defined(__APPLE__) && defined(__MACH__) )
+-#if defined(__ANDROID__) || defined(AROS) || defined(__PPU__) \
+- || ( defined(__APPLE__) && defined(__MACH__) ) || defined(__FreeBSD__) || defined(__OpenBSD__)
  #include <sys/time.h>
 -#else
 -#include <time.h>
diff --git a/package/libnfs/libnfs.hash b/package/libnfs/libnfs.hash
index ffb6c62073..b67a5d2eda 100644
--- a/package/libnfs/libnfs.hash
+++ b/package/libnfs/libnfs.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  6ee77e9fe220e2d3e3b1f53cfea04fb319828cc7dbb97dd9df09e46e901d797d  libnfs-4.0.0.tar.gz
+sha256  637e56643b19da9fba98f06847788c4dad308b723156a64748041035dcdf9bd3  libnfs-5.0.2.tar.gz
 sha256  edd960c0142b8ada98b43b6396b78f4e557b0bc70ac601a51e397ad04070e2c5  COPYING
 sha256  d9406ced95457941032aa11d04623b8ab71f2827a3395ebef137aec475be35b1  LICENCE-BSD.txt
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  LICENCE-LGPL-2.1.txt
diff --git a/package/libnfs/libnfs.mk b/package/libnfs/libnfs.mk
index 5f950b5cde..b013decfc7 100644
--- a/package/libnfs/libnfs.mk
+++ b/package/libnfs/libnfs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNFS_VERSION = 4.0.0
+LIBNFS_VERSION = 5.0.2
 LIBNFS_SITE = $(call github,sahlberg,libnfs,libnfs-$(LIBNFS_VERSION))
 LIBNFS_INSTALL_STAGING = YES
 LIBNFS_AUTORECONF = YES
@@ -16,4 +16,10 @@ ifeq ($(BR2_PACKAGE_LIBTIRPC),y)
 LIBNFS_DEPENDENCIES += libtirpc
 endif
 
+ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
+LIBNFS_CONF_OPTS += --enable-threads
+else
+LIBNFS_CONF_OPTS += --disable-threads
+endif
+
 $(eval $(autotools-package))

--===============5583655767619986510==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5583655767619986510==--

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F13E8C4332F
	for <buildroot@archiver.kernel.org>; Wed,  1 Nov 2023 21:44:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9AD7B43297;
	Wed,  1 Nov 2023 21:44:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9AD7B43297
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id I71GaAOvzUiX; Wed,  1 Nov 2023 21:44:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D06BF4328F;
	Wed,  1 Nov 2023 21:44:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D06BF4328F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0EF781BF966
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 21:44:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E9EFE4EEC8
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 21:44:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E9EFE4EEC8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id z3am3wDklqJj for <buildroot@lists.busybox.net>;
 Wed,  1 Nov 2023 21:44:27 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 51DEB4EE3E
 for <buildroot@buildroot.org>; Wed,  1 Nov 2023 21:44:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 51DEB4EE3E
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3CAE986494; Wed,  1 Nov 2023 21:44:27 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 1 Nov 2023 22:30:01 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 69f48f1a59e2227e04dbfcd61b7307e4f9e990d4
X-Git-Newrev: 0ff153461fe7bb19d4a2b95226b59a519b0e0d66
X-Patchwork-Hint: ignore
Message-Id: <20231101214427.3CAE986494@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libnet: bump to v1.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=0ff153461fe7bb19d4a2b95226b59a519b0e0d66
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changes:
 - Major upgrade, no API or ABI breaking changes (that we know of).
   https://github.com/libnet/libnet/releases/tag/v1.3

Packaging:
 - Verified builds on *all* test-pkg archs & toolchains
 - Verified test-pkg also with ngrep, suricata, and mz
 - Drop backported int64_t patch
 - Disable doxygen (html docs) in build
 - sha256sum of tarball now generated upstream

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .checkpackageignore                                |  1 -
 ...nstead-of-__int64_t-for-mingw-cross-build.patch | 31 ----------------------
 package/libnet/libnet.hash                         |  6 ++---
 package/libnet/libnet.mk                           |  6 +++--
 4 files changed, 7 insertions(+), 37 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index fb2d72de0c..d956951a87 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -709,7 +709,6 @@ package/libmpeg2/0001-altivec.patch Upstream
 package/libmpeg2/0002-armv4l.patch Upstream
 package/libmpeg2/0003-fix-arm-detection.patch Upstream
 package/libmpeg2/0004-fix-sparc.patch Upstream
-package/libnet/0001-Use-standard-int64_t-instead-of-__int64_t-for-mingw-cross-build.patch Upstream
 package/libnetfilter_conntrack/0001-conntrack-fix-build-with-kernel-5-15-and-musl.patch Upstream
 package/libnfc/0001-autotools-make-example-build-optional.patch Upstream
 package/libnfs/0001-Fix-include-sys-time.h.patch Upstream
diff --git a/package/libnet/0001-Use-standard-int64_t-instead-of-__int64_t-for-mingw-cross-build.patch b/package/libnet/0001-Use-standard-int64_t-instead-of-__int64_t-for-mingw-cross-build.patch
deleted file mode 100644
index 793b3069c8..0000000000
--- a/package/libnet/0001-Use-standard-int64_t-instead-of-__int64_t-for-mingw-cross-build.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From a1659e261888bdbed51803132d52d9a6c6803c8a Mon Sep 17 00:00:00 2001
-From: Joachim Nilsson <troglobit@gmail.com>
-Date: Sat, 19 Oct 2019 12:26:26 +0200
-Subject: [PATCH] Use standard int64_t instead of __int64_t for mingw cross
- build
-
-Signed-off-by: Joachim Nilsson <troglobit@gmail.com>
-[Retrieved from:
-https://github.com/libnet/libnet/commit/a1659e261888bdbed51803132d52d9a6c6803c8a]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- include/libnet/libnet-structures.h | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/include/libnet/libnet-structures.h b/include/libnet/libnet-structures.h
-index 6084caa..34fffc6 100644
---- a/include/libnet/libnet-structures.h
-+++ b/include/libnet/libnet-structures.h
-@@ -49,9 +49,9 @@ struct libnet_port_list_chain
- /* libnet statistics structure */
- struct libnet_stats
- {
--    __int64_t packets_sent;               /* packets sent */
--    __int64_t packet_errors;              /* packets errors */
--    __int64_t bytes_written;              /* bytes written */
-+    int64_t packets_sent;               /* packets sent */
-+    int64_t packet_errors;              /* packets errors */
-+    int64_t bytes_written;              /* bytes written */
- };
- 
- 
diff --git a/package/libnet/libnet.hash b/package/libnet/libnet.hash
index 6962ffc83f..eafe6ec361 100644
--- a/package/libnet/libnet.hash
+++ b/package/libnet/libnet.hash
@@ -1,5 +1,5 @@
-# From https://github.com/libnet/libnet/releases/download/v1.2/libnet-1.2.tar.gz.md5
-md5  a36c669e0cdfda6a2aa3adfb1f6fe60a  libnet-1.2.tar.gz
+# From https://github.com/libnet/libnet/releases/
+sha256  ad1e2dd9b500c58ee462acd839d0a0ea9a2b9248a1287840bc601e774fb6b28f  libnet-1.3.tar.gz
+
 # Locally computed
-sha256  caa4868157d9e5f32e9c7eac9461efeff30cb28357f7f6bf07e73933fb4edaa7  libnet-1.2.tar.gz
 sha256  a06f600f67f239898d85f083aeed82ce6015b1c57599ab1def00fb68787ef388  LICENSE
diff --git a/package/libnet/libnet.mk b/package/libnet/libnet.mk
index a5a814f4d2..a803fcd17a 100644
--- a/package/libnet/libnet.mk
+++ b/package/libnet/libnet.mk
@@ -4,12 +4,14 @@
 #
 ################################################################################
 
-LIBNET_VERSION = 1.2
+LIBNET_VERSION = 1.3
 LIBNET_SITE = \
 	https://github.com/libnet/libnet/releases/download/v$(LIBNET_VERSION)
 LIBNET_INSTALL_STAGING = YES
 # PF_PACKET is always available on Linux
-LIBNET_CONF_OPTS = libnet_cv_have_packet_socket=yes
+LIBNET_CONF_OPTS = \
+	libnet_cv_have_packet_socket=yes \
+	--disable-doxygen-doc
 LIBNET_LICENSE = BSD-2-Clause, BSD-3-Clause
 LIBNET_LICENSE_FILES = LICENSE
 LIBNET_CPE_ID_VENDOR = libnet_project
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

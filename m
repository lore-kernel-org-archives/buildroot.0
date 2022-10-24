Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02A1AC67871
	for <buildroot@archiver.kernel.org>; Mon, 24 Oct 2022 21:44:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8A8B240499;
	Mon, 24 Oct 2022 21:44:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8A8B240499
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Qx-88vTgEyh5; Mon, 24 Oct 2022 21:44:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 23406403AC;
	Mon, 24 Oct 2022 21:44:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 23406403AC
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0C2291BF966
 for <buildroot@lists.busybox.net>; Mon, 24 Oct 2022 21:43:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DC34A60A74
 for <buildroot@lists.busybox.net>; Mon, 24 Oct 2022 21:43:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DC34A60A74
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FT7xW_Si6ftk for <buildroot@lists.busybox.net>;
 Mon, 24 Oct 2022 21:43:02 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id DC34760A7D
 for <buildroot@buildroot.org>; Mon, 24 Oct 2022 21:43:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DC34760A7D
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CC6FF8704B; Mon, 24 Oct 2022 21:43:02 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 24 Oct 2022 23:27:36 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: cf8e0288c003b39ebc852cb3876c3b78608296ff
X-Git-Newrev: ede944f53509f825aa983de19d34fc30259b812c
X-Patchwork-Hint: ignore
Message-Id: <20221024214302.CC6FF8704B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/iperf: bump to version 2.1.8
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
Content-Type: multipart/mixed; boundary="===============7726428156267533311=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7726428156267533311==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=ede944f53509f825aa983de19d34fc30259b812c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

2.1.8 (as of August 5th, 2022)
------------------------------
- Add support for --bounceback to perform a repsonsiveness test (see man
  page for other options)
- add support for working loads with --bounceback
- Fix to wait_tick with Mac OS X
- Various python pyflows commits
- add support for client side tcp-write-time histograms and mean/min/max
- add support for human readable dscp or -T values (see man page)
- udp_accept no longer accepts packets from a previous run as a new
  connection, this can occur with long network delays
- multiple isoch bug fixes for both UDP and TCP
- isoch server provides mean/min/max/stdev for both frames and packets
- UDP max MTU discovery, requires configure.ac will support
  --enable-discover-defaultlen prior to compile

- Drop first patch (already in version)
- Drop second patch (not needed since
  https://sourceforge.net/p/iperf2/code/ci/de5cb9954617309eecb8ae7d24b14e6b1e0c11eb)

https://sourceforge.net/projects/iperf2/files/

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/iperf/0001-Fix-build-with-musl-libc.patch  | 67 ----------------------
 .../iperf/0002-compat-gettcpinfo.c-fix-build.patch | 34 -----------
 package/iperf/iperf.hash                           |  4 +-
 package/iperf/iperf.mk                             |  2 +-
 4 files changed, 3 insertions(+), 104 deletions(-)

diff --git a/package/iperf/0001-Fix-build-with-musl-libc.patch b/package/iperf/0001-Fix-build-with-musl-libc.patch
deleted file mode 100644
index 269079ee1e..0000000000
--- a/package/iperf/0001-Fix-build-with-musl-libc.patch
+++ /dev/null
@@ -1,67 +0,0 @@
-From 6766ab322a9eb8c73f8276be9cdea356eb124de0 Mon Sep 17 00:00:00 2001
-From: Baruch Siach <baruch@tkos.co.il>
-Date: Thu, 11 Nov 2021 07:58:10 +0200
-Subject: [PATCH] Fix build with musl libc
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-musl libc defines its own struct ethhdr that conflicts with the kernel
-define one. The kernel headers provide a way to suppress its struct
-ethhdr. For that to work the libc headers must precede the kernel. Move
-the kernel linux/if_tun.h include below libc net/ethernet.h. That fixes
-the following build failure:
-
-In file included from .../arm-buildroot-linux-musleabihf/sysroot/usr/include/net/ethernet.h:10,
-                 from ../include/headers.h:117,
-                 from Thread.c:72:
-.../arm-buildroot-linux-musleabihf/sysroot/usr/include/netinet/if_ether.h:116:8: error: redefinition of ‘struct ethhdr’
-  116 | struct ethhdr {
-      |        ^~~~~~
-In file included from .../arm-buildroot-linux-musleabihf/sysroot/usr/include/linux/if_tun.h:20,
-                 from ../include/headers.h:110,
-                 from Thread.c:72:
-.../arm-buildroot-linux-musleabihf/sysroot/usr/include/linux/if_ether.h:148:8: note: originally defined here
-  148 | struct ethhdr {
-      |        ^~~~~~
-
-Fixes bug #157.
-
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
----
-Upstream status: sent to Robert McMahon <rjmcmahon@rjmcmahon.com>
-
- include/headers.h | 10 +++++-----
- 1 file changed, 5 insertions(+), 5 deletions(-)
-
-diff --git a/include/headers.h b/include/headers.h
-index 00e0ea0dba42..887490475381 100644
---- a/include/headers.h
-+++ b/include/headers.h
-@@ -106,11 +106,6 @@ typedef bool _Bool;
- #include <net/if.h>
- #endif
- 
--#if ((HAVE_TUNTAP_TAP) || (HAVE_TUNTAP_TUN))
--#include <linux/if_tun.h>
--#include <sys/ioctl.h>
--#endif
--
- 
- // AF_PACKET HEADERS
- #if defined(HAVE_LINUX_FILTER_H) && defined(HAVE_AF_PACKET)
-@@ -146,6 +141,11 @@ typedef bool _Bool;
- #define  IPV6HDRLEN 40
- #endif // HAVE_AF_PACKET
- 
-+#if ((HAVE_TUNTAP_TAP) || (HAVE_TUNTAP_TUN))
-+#include <linux/if_tun.h>
-+#include <sys/ioctl.h>
-+#endif
-+
- #ifdef WIN32
- 
- /* Windows config file */
--- 
-2.33.0
-
diff --git a/package/iperf/0002-compat-gettcpinfo.c-fix-build.patch b/package/iperf/0002-compat-gettcpinfo.c-fix-build.patch
deleted file mode 100644
index 786c7d1873..0000000000
--- a/package/iperf/0002-compat-gettcpinfo.c-fix-build.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From a3339604bafa99f66e12687efc2c50d2e2df1276 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sun, 12 Dec 2021 20:03:04 +0100
-Subject: [PATCH] compat/gettcpinfo.c: fix build
-
-Fix the following build failure raised since commit
-c8f861a0a07b0606a581f2658c71959ad9417923:
-
-gettcpinfo.c: In function 'gettcpinfo':
-gettcpinfo.c:101:42: error: expected declaration or statement at end of input
-  101 | inline void gettcpinfo (int sock, struct ReportStruct *sample) {
-      |                                          ^~~~~~~~~~~~
-
-Fixes:
- - http://autobuild.buildroot.org/results/073e070478f0cda34784af96bb3a802c3aac8f72
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- compat/gettcpinfo.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/compat/gettcpinfo.c b/compat/gettcpinfo.c
-index 4e11e2a..1d3791a 100644
---- a/compat/gettcpinfo.c
-+++ b/compat/gettcpinfo.c
-@@ -99,4 +99,5 @@ inline void gettcpinfo (SOCKET sock, struct ReportStruct *sample) {
- };
- #else
- inline void gettcpinfo (int sock, struct ReportStruct *sample) {
-+};
- #endif
--- 
-2.33.0
-
diff --git a/package/iperf/iperf.hash b/package/iperf/iperf.hash
index 2e1f433dc7..34218bcf3b 100644
--- a/package/iperf/iperf.hash
+++ b/package/iperf/iperf.hash
@@ -1,6 +1,6 @@
 # From https://sourceforge.net/projects/iperf2/files/
-sha1  41bd049625cbecda2bf5b6a6cc12a6c5baec549b  iperf-2.1.6.tar.gz
+sha1  7725efffc6ef46fe5247ee326c39e5fa2eadf1eb  iperf-2.1.8.tar.gz
 
 # Locally computed:
-sha256  4a43e44439b95622aebeee55754a17d1c94076032e90620dfc1ab9908cb9e080  iperf-2.1.6.tar.gz
+sha256  8e2cf2fbc9d0d4d1cf9d109b1e328459f9622993dc9a4c5a7dc8a2088fb7beaf  iperf-2.1.8.tar.gz
 sha256  5f9f5c4feca3347c3b3c0ada8b16b4e6b698aac4e6f016a24adf61a5915336d1  COPYING
diff --git a/package/iperf/iperf.mk b/package/iperf/iperf.mk
index f999ff4ac2..47944880a3 100644
--- a/package/iperf/iperf.mk
+++ b/package/iperf/iperf.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IPERF_VERSION = 2.1.6
+IPERF_VERSION = 2.1.8
 IPERF_SITE = http://downloads.sourceforge.net/project/iperf2
 IPERF_LICENSE = MIT-like
 IPERF_LICENSE_FILES = COPYING

--===============7726428156267533311==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7726428156267533311==--

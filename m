Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0A51D2E9E3
	for <buildroot@archiver.kernel.org>; Mon, 11 Nov 2024 12:17:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5C10260745;
	Mon, 11 Nov 2024 12:17:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uIecKDPAXkzA; Mon, 11 Nov 2024 12:17:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 332A560746
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 332A560746;
	Mon, 11 Nov 2024 12:17:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 917C3DB1
 for <buildroot@buildroot.org>; Mon, 11 Nov 2024 12:17:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5BA14405CF
 for <buildroot@buildroot.org>; Mon, 11 Nov 2024 12:17:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j_BJnYJrdI3n for <buildroot@buildroot.org>;
 Mon, 11 Nov 2024 12:17:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1E297405DF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1E297405DF
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1E297405DF
 for <buildroot@buildroot.org>; Mon, 11 Nov 2024 12:17:06 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 622FBB00563;
 Mon, 11 Nov 2024 13:17:02 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>
Date: Mon, 11 Nov 2024 13:16:56 +0100
Message-ID: <20241111121656.237340-1-ju.o@free.fr>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1731327423;
 bh=nDXg9VuwWE3/bOp10LUgJY9hR7aBI7CgdDvQCDaXswQ=;
 h=From:To:Cc:Subject:Date:From;
 b=WsDmYI+BXWIb2zDtsrCuFj+t1Q2KlubeEtYwFbHyVy5vSC9cS5mFApFmO2O6UVICo
 zoTdnryU34ycX7pxogCryPGEoSUJuIMRKY5QN81xtc2ZAK63a8RjdkfxzD/o/9fNN2
 +yXQCHLutNhfB/PHKtfGiP9C+pxscjMzgHK3Tg6fplOgVO/u1Gr4HEJWGNrD3Rn/tg
 DNyWL/FuShcNQU6ZOaBlTP9Bj9PT3Va/AXb9D14r8jmwxCIu9WdktV1ecfluGC7ePd
 pX9gLpguse01cZTjFED7nAy76sLuw1BxSWe8mDMcpRLVFnHM9lGXMpOmIFRDlTA/B3
 3RrH4cszlCi0A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=WsDmYI+B
Subject: [Buildroot] [PATCH 1/1] package/iperf: bump to version 2.2.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

For release note, see after the file list at:
https://sourceforge.net/projects/iperf2/files/

This commit also adds a package patch to fix the build with musl
libc toolchains.

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Patch tested in:
https://gitlab.com/jolivain/buildroot/-/pipelines/1536373099
---
 ...cksums.c-needs-to-define-_GNU_SOURCE.patch | 53 +++++++++++++++++++
 package/iperf/iperf.hash                      |  6 +--
 package/iperf/iperf.mk                        |  2 +-
 3 files changed, 57 insertions(+), 4 deletions(-)
 create mode 100644 package/iperf/0001-checksums.c-needs-to-define-_GNU_SOURCE.patch

diff --git a/package/iperf/0001-checksums.c-needs-to-define-_GNU_SOURCE.patch b/package/iperf/0001-checksums.c-needs-to-define-_GNU_SOURCE.patch
new file mode 100644
index 0000000000..5233be0f7c
--- /dev/null
+++ b/package/iperf/0001-checksums.c-needs-to-define-_GNU_SOURCE.patch
@@ -0,0 +1,53 @@
+From 3ac9376c2bc67433b9cd21e7d7650c1c7e939bcc Mon Sep 17 00:00:00 2001
+From: Julien Olivain <ju.o@free.fr>
+Date: Mon, 11 Nov 2024 11:41:28 +0100
+Subject: [PATCH] checksums.c needs to define _GNU_SOURCE
+
+When compiling with musl libc [1], iperf2 fail to build with error:
+
+    checksums.c: In function 'udpchecksum':
+    checksums.c:175:17: error: 'const struct udphdr' has no member named 'check'
+      175 |     if (!udp_hdr->check) {
+          |                 ^~
+
+This failure was introduced in commit [2], in version 2.2.1. This is
+due to the switch from using <linux/udp.h> (which always define "struct
+udphdr" members), to <netinet/udp.h> which define members in musl libc
+only when _GNU_SOURCE is defined. See [3].
+
+Note: those use of udphdr members in checksums.c were introduced in
+commit [4], in version 2.1.1.
+
+This commit fixes the issue by defining _GNU_SOURCE in checksums.c.
+
+This issue was found in the iperf integration in Buildroot Linux [5].
+
+[1] https://www.musl-libc.org/
+[2] https://sourceforge.net/p/iperf2/code/ci/2a5fe6ffd4519ef3c6fc95704096646f897bd124/
+[3] https://git.musl-libc.org/cgit/musl/tree/include/netinet/udp.h?h=v1.2.5#n11
+[4] https://sourceforge.net/p/iperf2/code/ci/2ba97baecb4930e373ee5f51fc84115246e85096/
+[5] https://buildroot.org/
+
+Upstream: https://sourceforge.net/p/iperf2/tickets/342/
+Signed-off-by: Julien Olivain <ju.o@free.fr>
+---
+ src/checksums.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/src/checksums.c b/src/checksums.c
+index 852f1952..d7a8109e 100644
+--- a/src/checksums.c
++++ b/src/checksums.c
+@@ -47,6 +47,9 @@
+  * by Robert J. McMahon (rjmcmahon@rjmcmahon.com, bob.mcmahon@broadcom.com)
+  * -------------------------------------------------------------------
+  */
++#ifndef _GNU_SOURCE
++#define _GNU_SOURCE
++#endif
+ #include "headers.h"
+ 
+ /*
+-- 
+2.47.0
+
diff --git a/package/iperf/iperf.hash b/package/iperf/iperf.hash
index e4d40d5940..626f23f387 100644
--- a/package/iperf/iperf.hash
+++ b/package/iperf/iperf.hash
@@ -1,7 +1,7 @@
 # From https://sourceforge.net/projects/iperf2/files/
-md5  34bb6ac1abeb801bf3f729794dc5ac36  iperf-2.2.0.tar.gz
-sha1  bcbd101ab36f3faacaab1a765a96806ca49a1495  iperf-2.2.0.tar.gz
+md5  dc7ef2413a09b619e52cad199ad038ba  iperf-2.2.1.tar.gz
+sha1  9b30b1f3140d4f714555fee5ed21aa2bf4046aee  iperf-2.2.1.tar.gz
 
 # Locally computed:
-sha256  16810a9575e4c6dd65e4a18ab5df3cdac6730b3c832cf080a8990f132f68364a  iperf-2.2.0.tar.gz
+sha256  754ab0a7e28033dbea81308ef424bc7df4d6e2fe31b60cc536b61b51fefbd8fb  iperf-2.2.1.tar.gz
 sha256  5f9f5c4feca3347c3b3c0ada8b16b4e6b698aac4e6f016a24adf61a5915336d1  COPYING
diff --git a/package/iperf/iperf.mk b/package/iperf/iperf.mk
index 303614668a..62ed9d6e5f 100644
--- a/package/iperf/iperf.mk
+++ b/package/iperf/iperf.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IPERF_VERSION = 2.2.0
+IPERF_VERSION = 2.2.1
 IPERF_SITE = https://downloads.sourceforge.net/project/iperf2
 IPERF_LICENSE = MIT-like
 IPERF_LICENSE_FILES = COPYING
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

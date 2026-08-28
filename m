Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63D1AC61DB9
	for <buildroot@archiver.kernel.org>; Fri, 28 Aug 2026 19:38:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CF63080DE7;
	Fri, 28 Aug 2026 19:38:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sMupKhn_PB_K; Fri, 28 Aug 2026 19:38:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787945908;
	bh=EuYeXYjhj6q3CAoe0jpVZyhqSmIGJYu6tJKs67SQAwU=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=n6wsy/OcYFMb91GhRJwMcKTYSqnV9fmCwQlXjE2glalsfqto7+L2eW+JpLrTx1vrN
	 xyygQsJ3YOeyt79PscN0xdpLCrWfKDvdohhb1UPq1dmCXzNVmmSn2gRkf+Icqsl5k2
	 vpYhRpbHlUMbTDeHEU/ZpPQiK+LaLK3SqDOzr6fv6CpeIAGWiVU+f29aOwKCgyrgFL
	 MGXB4IXSUKIeIXLitCiDISvsNnN8zqdH99fnzoNkADcOUGmVlYr/SGZsBL5LCCAZ3P
	 sgwbfchY4TtkIAi9lXmDOqrLHA+xQ/cABez2Oq8eHk701GbfrFqpkOoz1Yg9b52TT7
	 q+FvT3AH8pc6g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 80C3280F01;
	Fri, 28 Aug 2026 19:38:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9B6F71DE
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 19:38:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8D040606B6
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 19:38:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s5olBhlrwzVo for <buildroot@buildroot.org>;
 Fri, 28 Aug 2026 19:38:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3C55A60679
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 19:38:25 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id F2F721A18B3;
 Fri, 28 Aug 2026 19:38:23 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id C879360537;
 Fri, 28 Aug 2026 19:38:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id EC5CF11C780FF; 
 Fri, 28 Aug 2026 21:38:18 +0200 (CEST)
To: Buildroot List <buildroot@buildroot.org>
Cc: Andreas Ziegler <br025@umbiko.net>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 28 Aug 2026 21:38:01 +0200
Message-ID: <20260828193802.2404390-3-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260828193802.2404390-1-thomas.petazzoni@bootlin.com>
References: <20260828193802.2404390-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Subject: [Buildroot] [PATCH v2 2/2] package/libnfs: bump version to 7.0.1
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Andreas Ziegler <br025@umbiko.net>

Change log:
https://github.com/sahlberg/libnfs/compare/libnfs-6.0.2...libnfs-7.0.1

All patches are dropped as they are all included in 7.0.1.

Signed-off-by: Andreas Ziegler <br025@umbiko.net>
[Thomas: bump to 7.0.1]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...t-and-use-const-qualifier-from-point.patch |  37 ------
 ...t-qualifier-from-pointer-target-type.patch | 117 ------------------
 ...void-cast-to-allow-compile-for-arm32.patch |  68 ----------
 package/libnfs/libnfs.hash                    |   2 +-
 package/libnfs/libnfs.mk                      |   2 +-
 5 files changed, 2 insertions(+), 224 deletions(-)
 delete mode 100644 package/libnfs/0001-Do-not-edit-const-and-use-const-qualifier-from-point.patch
 delete mode 100644 package/libnfs/0002-use-const-qualifier-from-pointer-target-type.patch
 delete mode 100644 package/libnfs/0003-socket-use-void-cast-to-allow-compile-for-arm32.patch

diff --git a/package/libnfs/0001-Do-not-edit-const-and-use-const-qualifier-from-point.patch b/package/libnfs/0001-Do-not-edit-const-and-use-const-qualifier-from-point.patch
deleted file mode 100644
index d463ecd356..0000000000
--- a/package/libnfs/0001-Do-not-edit-const-and-use-const-qualifier-from-point.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 89a795fee97a3da348c28dbd58500100a13dcec0 Mon Sep 17 00:00:00 2001
-From: Rudi Heitbaum <rudi@heitbaum.com>
-Date: Sun, 25 Jan 2026 08:30:43 +0000
-Subject: [PATCH] Do not edit const and use const qualifier from pointer target
- type
-
-Fixes:
-    ../../lib/libnfs.c: In function 'nfs_set_context_args':
-    ../../lib/libnfs.c:301:30: error: initialization discards 'const' qualifier from pointer target type [-Werror=discarded-qualifiers]
-      301 |                 char *strp = strchr(val, ',');
-          |                              ^~~~~~
-
-Upstream: https://github.com/sahlberg/libnfs/commit/89a795fee97a3da348c28dbd58500100a13dcec0
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- lib/libnfs.c | 3 +--
- 1 file changed, 1 insertion(+), 2 deletions(-)
-
-diff --git a/lib/libnfs.c b/lib/libnfs.c
-index bbe6666..162492b 100755
---- a/lib/libnfs.c
-+++ b/lib/libnfs.c
-@@ -316,9 +316,8 @@ nfs_set_context_args(struct nfs_context *nfs, const char *arg, const char *val)
- 	} else if (!strcmp(arg, "wsize")) {
- 		nfs_set_writemax(nfs, atoi(val));
- 	} else if (!strcmp(arg, "readdir-buffer")) {
--		char *strp = strchr(val, ',');
-+		const char *strp = strchr(val, ',');
- 		if (strp) {
--			*strp = 0;
- 			strp++;
- 			nfs_set_readdir_max_buffer_size(nfs, atoi(val), atoi(strp));
- 		} else {
--- 
-2.47.3
-
diff --git a/package/libnfs/0002-use-const-qualifier-from-pointer-target-type.patch b/package/libnfs/0002-use-const-qualifier-from-pointer-target-type.patch
deleted file mode 100644
index 6fe8f6433b..0000000000
--- a/package/libnfs/0002-use-const-qualifier-from-pointer-target-type.patch
+++ /dev/null
@@ -1,117 +0,0 @@
-From 6a06cb6dba0065705179329729cca2f95a842a63 Mon Sep 17 00:00:00 2001
-From: Rudi Heitbaum <rudi@heitbaum.com>
-Date: Sun, 25 Jan 2026 08:42:18 +0000
-Subject: [PATCH] use const qualifier from pointer target type
-
-Fixes:
-    ../../lib/nfs_v3.c: In function 'nfs3_mknod_async':
-    ../../lib/nfs_v3.c:3260:13: error: assignment discards 'const' qualifier from pointer target type [-Werror=discarded-qualifiers]
-     3260 |         ptr = strrchr(path, '/');
-          |             ^
-    ../../lib/nfs_v3.c: In function 'nfs3_unlink_async':
-    ../../lib/nfs_v3.c:3361:13: error: assignment discards 'const' qualifier from pointer target type [-Werror=discarded-qualifiers]
-     3361 |         ptr = strrchr(path, '/');
-          |             ^
-    ../../lib/nfs_v3.c: In function 'nfs3_rmdir_async':
-    ../../lib/nfs_v3.c:3472:13: error: assignment discards 'const' qualifier from pointer target type [-Werror=discarded-qualifiers]
-     3472 |         ptr = strrchr(path, '/');
-          |             ^
-    ../../lib/nfs_v3.c: In function 'nfs3_mkdir2_async':
-    ../../lib/nfs_v3.c:3574:13: error: assignment discards 'const' qualifier from pointer target type [-Werror=discarded-qualifiers]
-     3574 |         ptr = strrchr(path, '/');
-          |             ^
-
-Upstream: https://github.com/sahlberg/libnfs/commit/6a06cb6dba0065705179329729cca2f95a842a63
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- lib/nfs_v3.c | 24 ++++++++++++------------
- 1 file changed, 12 insertions(+), 12 deletions(-)
-
-diff --git a/lib/nfs_v3.c b/lib/nfs_v3.c
-index addd0ae..2c32fff 100644
---- a/lib/nfs_v3.c
-+++ b/lib/nfs_v3.c
-@@ -3244,7 +3244,7 @@ int
- nfs3_mknod_async(struct nfs_context *nfs, const char *path, int mode, int dev,
-                  nfs_cb cb, void *private_data)
- {
--	char *ptr;
-+	const char *ptr;
- 	struct mknod_cb_data *cb_data;
- 
- 	cb_data = malloc(sizeof(struct mknod_cb_data));
-@@ -3262,8 +3262,8 @@ nfs3_mknod_async(struct nfs_context *nfs, const char *path, int mode, int dev,
-                                       "buffer for mknod path");
-                         return -1;
-                 }
--                ptr = strrchr(cb_data->path, '/');
--                *ptr = 0;
-+                char *ptr2 = strrchr(cb_data->path, '/');
-+                *ptr2 = 0;
-         } else {
-                 cb_data->path = malloc(strlen(path) + 2);
-                 if (cb_data->path == NULL) {
-@@ -3353,7 +3353,7 @@ nfs3_unlink_async(struct nfs_context *nfs, const char *path, nfs_cb cb,
-                   void *private_data)
- {
- 	char *new_path;
--	char *ptr;
-+	const char *ptr;
- 
-         ptr = strrchr(path, '/');
-         if (ptr) {
-@@ -3363,8 +3363,8 @@ nfs3_unlink_async(struct nfs_context *nfs, const char *path, nfs_cb cb,
-                                       "buffer for unlink path");
-                         return -1;
-                 }
--                ptr = strrchr(new_path, '/');
--                *ptr = 0;
-+                char *ptr2 = strrchr(new_path, '/');
-+                *ptr2 = 0;
-         } else {
-                 new_path = malloc(strlen(path) + 2);
-                 if (new_path == NULL) {
-@@ -3464,7 +3464,7 @@ nfs3_rmdir_async(struct nfs_context *nfs, const char *path, nfs_cb cb,
-                  void *private_data)
- {
- 	char *new_path;
--	char *ptr;
-+	const char *ptr;
- 
-         ptr = strrchr(path, '/');
-         if (ptr) {
-@@ -3474,8 +3474,8 @@ nfs3_rmdir_async(struct nfs_context *nfs, const char *path, nfs_cb cb,
-                                       "buffer for rmdir path");
-                         return -1;
-                 }
--                ptr = strrchr(new_path, '/');
--                *ptr = 0;
-+                char *ptr2 = strrchr(new_path, '/');
-+                *ptr2 = 0;
-         } else {
-                 new_path = malloc(strlen(path) + 2);
-                 if (new_path == NULL) {
-@@ -3566,7 +3566,7 @@ nfs3_mkdir2_async(struct nfs_context *nfs, const char *path, int mode,
-                  nfs_cb cb, void *private_data)
- {
- 	char *new_path;
--	char *ptr;
-+	const char *ptr;
- 
-         ptr = strrchr(path, '/');
-         if (ptr) {
-@@ -3576,8 +3576,8 @@ nfs3_mkdir2_async(struct nfs_context *nfs, const char *path, int mode,
-                                       "buffer for mkdir path");
-                         return -1;
-                 }
--                ptr = strrchr(new_path, '/');
--                *ptr = 0;
-+                char *ptr2 = strrchr(new_path, '/');
-+                *ptr2 = 0;
-         } else {
-                 new_path = malloc(strlen(path) + 2);
-                 if (new_path == NULL) {
--- 
-2.47.3
-
diff --git a/package/libnfs/0003-socket-use-void-cast-to-allow-compile-for-arm32.patch b/package/libnfs/0003-socket-use-void-cast-to-allow-compile-for-arm32.patch
deleted file mode 100644
index 1f71a391e7..0000000000
--- a/package/libnfs/0003-socket-use-void-cast-to-allow-compile-for-arm32.patch
+++ /dev/null
@@ -1,68 +0,0 @@
-From c66dc9a65723e610fd02da38471d68b8289eb074 Mon Sep 17 00:00:00 2001
-From: Rudi Heitbaum <rudi@heitbaum.com>
-Date: Tue, 14 Jan 2025 14:09:36 +0000
-Subject: [PATCH] socket: use void cast to allow compile for arm32
-
-When compiling for arm32 the error: cast increases required alignment
-of target type occurs.
-
-/lib/socket.c: In function 'rpc_read_from_socket':
-lib/socket.c:586:49: error: cast increases required alignment of target type [-Werror=cast-align]
-  586 |                         rpc->rm_xid[1] = ntohl(*(uint32_t *)&buf[0]);
-      |                                                 ^
-lib/socket.c:587:61: error: cast increases required alignment of target type [-Werror=cast-align]
-  587 |                         rpc->pdu = rpc_find_pdu(rpc, ntohl(*(uint32_t *)&buf[0]));
-      |                                                             ^
-lib/socket.c:799:35: error: cast increases required alignment of target type [-Werror=cast-align]
-  799 |                                 *((uint32_t *)rpc->inbuf) = htonl(rpc->rm_xid[1]);
-      |                                   ^
-lib/socket.c:861:71: error: cast increases required alignment of target type [-Werror=cast-align]
-  861 |                                                 const READ3res *res = (READ3res *) rpc->pdu->zdr_decode_buf;
-      |                                                                       ^
-
-cast via (void *) to allow the compile to suceed, as all of the source buffers should be 32bit aligned.
-
-Signed-off-by: Rudi Heitbaum <rudi@heitbaum.com>
-
-Upstream: https://github.com/sahlberg/libnfs/commit/a01d42a0d9682d3e506d3c78680db8c7d158fe88
-Signed-off-by: Florian Larysch <fl@n621.de>
----
- lib/socket.c | 8 ++++----
- 1 file changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/lib/socket.c b/lib/socket.c
-index f51ca4d..5b9fce5 100644
---- a/lib/socket.c
-+++ b/lib/socket.c
-@@ -583,8 +583,8 @@ rpc_read_from_socket(struct rpc_context *rpc)
- 		}
- 		if (!rpc->is_server_context) {
- 			rpc->rm_xid[0] = count;
--			rpc->rm_xid[1] = ntohl(*(uint32_t *)&buf[0]);
--			rpc->pdu = rpc_find_pdu(rpc, ntohl(*(uint32_t *)&buf[0]));
-+			rpc->rm_xid[1] = ntohl(*(uint32_t *)(void *)&buf[0]);
-+			rpc->pdu = rpc_find_pdu(rpc, ntohl(*(uint32_t *)(void *)&buf[0]));
- 			if (rpc->pdu == NULL) {
- 				rpc_set_error(rpc, "Failed to match incoming PDU/XID."
- 						" Ignoring PDU");
-@@ -796,7 +796,7 @@ rpc_read_from_socket(struct rpc_context *rpc)
-                                 }
- 
-                                 /* Copy the next 4 bytes into inbuf */
--                                *((uint32_t *)rpc->inbuf) = htonl(rpc->rm_xid[1]);
-+                                *((uint32_t *)(void *)rpc->inbuf) = htonl(rpc->rm_xid[1]);
- 
-                                 /* but set inpos to 0, we will update it above
-                                  * that we have already read these 4 bytes in
-@@ -858,7 +858,7 @@ rpc_read_from_socket(struct rpc_context *rpc)
-                                                  * If the READ failed, bail out here as there is no
-                                                  * data.
-                                                  */
--                                                const READ3res *res = (READ3res *) rpc->pdu->zdr_decode_buf;
-+                                                const READ3res *res = (READ3res *)(void *) rpc->pdu->zdr_decode_buf;
-                                                 if (res->status != NFS3_OK) {
-                                                         goto payload_finished;
-                                                 }
--- 
-2.53.0
-
diff --git a/package/libnfs/libnfs.hash b/package/libnfs/libnfs.hash
index c0e5ef5c81..4aefc83f80 100644
--- a/package/libnfs/libnfs.hash
+++ b/package/libnfs/libnfs.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  4e5459cc3e0242447879004e9ad28286d4d27daa42cbdcde423248fad911e747  libnfs-6.0.2.tar.gz
+sha256  d25c70537d60f1ab307b9cb5e9fb01acff71065fc9547b54dfaec109ba993003  libnfs-7.0.0.tar.gz
 sha256  edd960c0142b8ada98b43b6396b78f4e557b0bc70ac601a51e397ad04070e2c5  COPYING
 sha256  d9406ced95457941032aa11d04623b8ab71f2827a3395ebef137aec475be35b1  LICENCE-BSD.txt
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  LICENCE-LGPL-2.1.txt
diff --git a/package/libnfs/libnfs.mk b/package/libnfs/libnfs.mk
index 12afb7c697..57ccbf1c2b 100644
--- a/package/libnfs/libnfs.mk
+++ b/package/libnfs/libnfs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNFS_VERSION = 6.0.2
+LIBNFS_VERSION = 7.0.0
 LIBNFS_SITE = $(call github,sahlberg,libnfs,libnfs-$(LIBNFS_VERSION))
 LIBNFS_INSTALL_STAGING = YES
 LIBNFS_AUTORECONF = YES
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

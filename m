Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46627E77188
	for <buildroot@archiver.kernel.org>; Thu, 26 Dec 2024 21:11:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D19F3401F6;
	Thu, 26 Dec 2024 21:11:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NpQGcfpXOomG; Thu, 26 Dec 2024 21:11:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7D4484021C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7D4484021C;
	Thu, 26 Dec 2024 21:11:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 60251F1B
 for <buildroot@buildroot.org>; Thu, 26 Dec 2024 21:11:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 40C80607A3
 for <buildroot@buildroot.org>; Thu, 26 Dec 2024 21:11:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Kfm3WD3g8893 for <buildroot@buildroot.org>;
 Thu, 26 Dec 2024 21:11:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::224;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org BBE7A605EA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BBE7A605EA
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BBE7A605EA
 for <buildroot@buildroot.org>; Thu, 26 Dec 2024 21:11:47 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id 8B7D5E0003;
 Thu, 26 Dec 2024 21:11:44 +0000 (UTC)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 26 Dec 2024 22:11:42 +0100
Message-ID: <20241226211143.2507882-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1735247504;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=4diOqBdqdpFKXJDqAGB5R3H60tel+qGBDfsleVrmFow=;
 b=X8jsdj+t0PZBGtmMhElJeBws5svr1UYDWKWkd6inL8tEem44nGZXvyzB8rrx8h7aab/mD5
 oh2bQfEID66DFw6TMViedq8jMQS8iCebBR6/XKXHblsddhGFreoA+y02UNQzv2yWSe3wg4
 4+6oDNkPL+uXzXYGM4Rxur/1AwHizmxy4R5jBazv36R90CigN0weLfkLfySgZFJ3CE34Rg
 5R6RPMG3jIzDI3akJf4TDkeG5e5d+eV9zCKnETifT/kJIJGRyJmm5rEmtYMot0pvlULoIo
 ubNSKdFIC8ILhSOY8fGa5N1ItGAq/UWT7IuIxan3eTDgAc9N1LDflT9JArsEZA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=X8jsdj+t
Subject: [Buildroot] [PATCH] package/cloop: bump to 3.14.1.3+nmu1
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

This is the latest version available in Debian (which is our upstream
for this package). The changelog is:

   [ Ben Hutchings ]
   * Fix FTBFS with gcc 11 (Closes: #1005413):
     - Remove exception specifications
   * Fix module build for recent kernel versions (Closes: #1005414):
     - Stop generating module vermagic in cloop.c. This has always been handled
       by modpost and doing it here now results in build failure.
     - Avoid using inode::i_bdev, which was removed in Linux 5.11.
     - Use set_disk_ro() instead of set_device_ro(). The latter was not meant to
       be used by device drivers and was removed in Linux 5.11.
     - Use blk_{mq_alloc,cleanup}_disk() instead of separate queue and disk
       allocation and cleanup on Linux 5.15+, since alloc_disk() was removed.
     - Handle potential failure of add_disk() on Linux 5.15+.
     - Use kernel_read() instead of vfs_read() and set_fs(). set_fs() is no
       longer defined on some architectures, and kernel_read() has had large
       file support since Linux 2.6.31.
 .
   [ Vagrant Cascadian ]
   * debian/rules: Build tarball reproducibly, using consistent time, uid,
     gid and sort order. Thanks to Dhole for the initial patch.

The "Fix FTBFS with gcc 11" allows us to remove the -std=c++14
workaround added in commit
7e147e778fc3397cd2a069c8127fa4d2cc6c0355 ("package/cloop: fix build
with gcc >= 9").

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/cloop/cloop.hash | 4 ++--
 package/cloop/cloop.mk   | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/cloop/cloop.hash b/package/cloop/cloop.hash
index eb922764bb..a4f7056049 100644
--- a/package/cloop/cloop.hash
+++ b/package/cloop/cloop.hash
@@ -1,5 +1,5 @@
-# From http://snapshot.debian.org/archive/debian/20200419T152225Z/pool/main/c/cloop/cloop_3.14.1.3.dsc
-sha256  e3079e70f9edae8ed1ac64694af08f6c7dc710ca65a56e4770dcb1325a293193  cloop_3.14.1.3.tar.xz
+# From http://snapshot.debian.org/archive/debian-debug/20221223T030115Z/pool/main/c/cloop/cloop_3.14.1.3%2Bnmu1.dsc
+sha256  04060d88231208b0db8ae8c3b54b0a46ee12139b617ebfc80b03d2ddd2cdb6ba  cloop_3.14.1.3+nmu1.tar.xz
 
 # Hash for license files
 sha256  91df39d1816bfb17a4dda2d3d2c83b1f6f2d38d53e53e41e8f97ad5ac46a0cad  advancecomp-1.15/COPYING
diff --git a/package/cloop/cloop.mk b/package/cloop/cloop.mk
index 6f6d5fe6a8..f42edee28b 100644
--- a/package/cloop/cloop.mk
+++ b/package/cloop/cloop.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-CLOOP_VERSION = 3.14.1.3
+CLOOP_VERSION = 3.14.1.3+nmu1
 CLOOP_SOURCE = cloop_$(CLOOP_VERSION).tar.xz
-CLOOP_SITE = http://snapshot.debian.org/archive/debian/20200419T152225Z/pool/main/c/cloop
+CLOOP_SITE = http://snapshot.debian.org/archive/debian-debug/20221223T030115Z/pool/main/c/cloop
 CLOOP_LICENSE = GPL-2.0 (module), GPL-2.0+ (advancecomp)
 CLOOP_LICENSE_FILES = README advancecomp-1.15/COPYING
 
@@ -14,7 +14,7 @@ HOST_CLOOP_DEPENDENCIES = host-zlib
 
 define HOST_CLOOP_BUILD_CMDS
 	$(HOST_CONFIGURE_OPTS) $(MAKE1) -C $(@D) APPSONLY=yes \
-		CFLAGS="$(HOST_CFLAGS) -D_GNU_SOURCE" CPPFLAGS="-std=c++14"
+		CFLAGS="$(HOST_CFLAGS) -D_GNU_SOURCE"
 endef
 
 define HOST_CLOOP_INSTALL_CMDS
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

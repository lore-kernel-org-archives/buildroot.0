Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53589C001DC
	for <buildroot@archiver.kernel.org>; Sun, 30 Jul 2023 18:55:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 92C5D40A9A;
	Sun, 30 Jul 2023 18:55:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 92C5D40A9A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OOeCjyBIJrGa; Sun, 30 Jul 2023 18:55:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DA27E40A52;
	Sun, 30 Jul 2023 18:55:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DA27E40A52
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1F0B81BF390
 for <buildroot@lists.busybox.net>; Sun, 30 Jul 2023 18:55:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E5CDB60F78
 for <buildroot@lists.busybox.net>; Sun, 30 Jul 2023 18:55:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E5CDB60F78
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 17kPv3eYeAI1 for <buildroot@lists.busybox.net>;
 Sun, 30 Jul 2023 18:55:31 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 76DDF60F12
 for <buildroot@buildroot.org>; Sun, 30 Jul 2023 18:55:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 76DDF60F12
Received: from fli4l.lan.fli4l (p4fd6c649.dip0.t-ipconnect.de [79.214.198.73])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 69F79A4C0367;
 Sun, 30 Jul 2023 20:55:27 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:39370)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qQBZf-0000qj-0Q;
 Sun, 30 Jul 2023 20:55:27 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 30 Jul 2023 20:55:26 +0200
Message-Id: <20230730185526.2695488-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1690743327;
 bh=KE5sBMFfaLMQ/tNb67I7mBaQ6jethe5zMFWduLVUNfA=;
 h=From:To:Cc:Subject:Date:From;
 b=KmcmhRs2aew7T3qgPygBtb0P1Rl13j+0QoR7la4wQHFmuRwvoI5KW2TqYag+JBUUm
 jBfQa7/NjTmb/+C8Oa5tzCbAUQDPhTVKL/sSYMekIrcISNKTLB/IhhdYs9P9SqRMKv
 pQ18QNo3FCsGR2ZLYYwKel9YVoDf9e7ka/bHhFB66kDwBBJWFzHKZu6qmtyptmf8C7
 jbo3ZMl7AFzFktL1k82p+RHdTEGfCZk4f3vwJWD4PVuoUosMbfPYgB/tKebpWU0CqZ
 urP51z2matnsqXKiyGJCmoiRSbI9x9VhfypmKER0YjIKdQ/wg36ZqpPeEuBx5bOCVL
 isYnipkRdSlrA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=KmcmhRs2
Subject: [Buildroot] [PATCH 1/1] package/libiberty: bump version to 2.40
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
Cc: Akshay Bhat <nodeax@gmail.com>, "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Akshay Bhat <nodeax@gmail.com>

If the libiberty package is not the same version as the one packaged
with binutils AND if libiberty is installed before binutils, then the
below error is observed. Hence for now let us keep the versions in sync.

/usr/bin/ld: ../libiberty/libiberty.a(hashtab.o):(.data.rel.local+0x0)
: multiple definition of `htab_eq_pointer'

Fixes:
http://autobuild.buildroot.net/results/f07/f077ec588b395102ad501a18c85d5030c0765031/

Build-tested using these four defconfigs:
----------
BR2_arceb=y
----------
BR2_BINUTILS_VERSION_2_38_X=y
----------
(empty defconfig meaning binutils-2.39)
----------
BR2_BINUTILS_VERSION_2_40_X=y
----------
each using these commands:

$ make host-libiberty
$ make host-binutils

Signed-off-by: Akshay Bhat <nodeax@gmail.com>
[Bernd: bump to version 2.40, replace hash file with link to binutils]
Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libiberty/libiberty.hash | 6 +-----
 package/libiberty/libiberty.mk   | 2 +-
 2 files changed, 2 insertions(+), 6 deletions(-)
 mode change 100644 => 120000 package/libiberty/libiberty.hash

diff --git a/package/libiberty/libiberty.hash b/package/libiberty/libiberty.hash
deleted file mode 100644
index 0dafcea520..0000000000
--- a/package/libiberty/libiberty.hash
+++ /dev/null
@@ -1,5 +0,0 @@
-# From ftp://gcc.gnu.org/pub/binutils/releases/sha512.sum
-sha512  d326408f12a03d9a61a9de56584c2af12f81c2e50d2d7e835d51565df8314df01575724afa1e43bd0db45cfc9916b41519b67dfce03232aa4978704492a6994a  binutils-2.32.tar.xz
-
-# Locally computed, same as binutils.hash
-sha256  56bdea73b6145ef6ac5259b3da390b981d840c24cb03b8e1cbc678de7ecfa18d  COPYING.LIB
diff --git a/package/libiberty/libiberty.hash b/package/libiberty/libiberty.hash
new file mode 120000
index 0000000000..e0655d3af3
--- /dev/null
+++ b/package/libiberty/libiberty.hash
@@ -0,0 +1 @@
+../binutils/binutils.hash
\ No newline at end of file
diff --git a/package/libiberty/libiberty.mk b/package/libiberty/libiberty.mk
index 6235a8b956..e7a02c963a 100644
--- a/package/libiberty/libiberty.mk
+++ b/package/libiberty/libiberty.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBIBERTY_VERSION = 2.32
+LIBIBERTY_VERSION = 2.40
 LIBIBERTY_SOURCE = binutils-$(LIBIBERTY_VERSION).tar.xz
 LIBIBERTY_SITE = $(BR2_GNU_MIRROR)/binutils
 HOST_LIBIBERTY_DL_SUBDIR = binutils
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

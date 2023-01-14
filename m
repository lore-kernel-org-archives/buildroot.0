Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AF0DC636D6
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 02:19:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CEBEC702C7;
	Tue, 21 Feb 2023 02:19:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CEBEC702C7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VPEYejZc9ffr; Tue, 21 Feb 2023 02:19:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E0D10702CD;
	Tue, 21 Feb 2023 02:19:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E0D10702CD
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E5C4B1BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 21:00:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A848F6FB74
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A848F6FB74
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GUTeApSvifHa for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:32 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id BBA876FB6F
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BBA876FB6F
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B96E9828C8; Mon, 20 Feb 2023 20:52:32 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 14 Jan 2023 22:18:05 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: dce238f045f25d75b31681ea56ea5b9c668912dd
X-Git-Newrev: c9d6f0e1c8a99eec548b1690e1bb58d90189a44d
X-Patchwork-Hint: ignore
Message-Id: <20230220205232.B96E9828C8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/libbpf: bump to
 version 1.1.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=c9d6f0e1c8a99eec548b1690e1bb58d90189a44d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Drop patch which is now upstream.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...-Fix-cross-compilation-for-32-bit-targets.patch | 38 ----------------------
 package/libbpf/libbpf.hash                         |  2 +-
 package/libbpf/libbpf.mk                           |  2 +-
 3 files changed, 2 insertions(+), 40 deletions(-)

diff --git a/package/libbpf/0001-Makefile-Fix-cross-compilation-for-32-bit-targets.patch b/package/libbpf/0001-Makefile-Fix-cross-compilation-for-32-bit-targets.patch
deleted file mode 100644
index 12c22f3147..0000000000
--- a/package/libbpf/0001-Makefile-Fix-cross-compilation-for-32-bit-targets.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From 68e6f83f223ebf3fbf0d94c0f4592e5e6773f0c1 Mon Sep 17 00:00:00 2001
-From: Tobias Waldekranz <tobias@waldekranz.com>
-Date: Fri, 14 Oct 2022 21:14:14 +0200
-Subject: [PATCH] Makefile: Fix cross-compilation for 32-bit targets
-
-Determining the correct library installation path (lib vs. lib64)
-using uname(1) breaks in cross compilation scenarios where word widths
-differ between the host and target system.
-
-Instead, source the information from the compilers '-dumpmachine'
-option (supported by both GCC and Clang).
-
-We call this the "host" architecture, using the same nomenclature as
-Autotools (--host configure option).
-
-Upstream: https://github.com/libbpf/libbpf/commit/68e6f83f223ebf3fbf0d94c0f4592e5e6773f0c1
-Signed-off-by: Tobias Waldekranz <tobias@waldekranz.com>
----
- src/Makefile | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/src/Makefile b/src/Makefile
-index 3cd0854..d535f81 100644
---- a/src/Makefile
-+++ b/src/Makefile
-@@ -77,7 +77,8 @@ INSTALL = install
- 
- DESTDIR ?=
- 
--ifeq ($(filter-out %64 %64be %64eb %64le %64el s390x, $(shell uname -m)),)
-+HOSTARCH = $(firstword $(subst -, ,$(shell $(CC) -dumpmachine)))
-+ifeq ($(filter-out %64 %64be %64eb %64le %64el s390x, $(HOSTARCH)),)
- 	LIBSUBDIR := lib64
- else
- 	LIBSUBDIR := lib
--- 
-2.34.1
-
diff --git a/package/libbpf/libbpf.hash b/package/libbpf/libbpf.hash
index 4305872d9f..75f2b1695c 100644
--- a/package/libbpf/libbpf.hash
+++ b/package/libbpf/libbpf.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  3d6afde67682c909e341bf194678a8969f17628705af25f900d5f68bd299cb03  libbpf-1.0.1.tar.gz
+sha256  5da826c968fdb8a2f714701cfef7a4b7078be030cf58b56143b245816301cbb8  libbpf-1.1.0.tar.gz
 sha256  847f4addbd56e2d5be20c4ea0845e972672fc07b755fadaae5f7abd35d71e349  LICENSE
 sha256  e1638b9a0c68ca90fad3df1d6b4e430804d2fbdc15e58d02cffddfae38953bbf  LICENSE.BSD-2-Clause
 sha256  0b9a4febcdee6de55872501d5c1a8f5d8b0d1650cd4d5351995ceb22e889f8ca  LICENSE.LGPL-2.1
diff --git a/package/libbpf/libbpf.mk b/package/libbpf/libbpf.mk
index 820f1dc4bf..b498136ace 100644
--- a/package/libbpf/libbpf.mk
+++ b/package/libbpf/libbpf.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBBPF_VERSION = 1.0.1
+LIBBPF_VERSION = 1.1.0
 LIBBPF_SITE = $(call github,libbpf,libbpf,v$(LIBBPF_VERSION))
 LIBBPF_LICENSE = GPL-2.0, LGPL-2.1, BSD-2-Clause
 LIBBPF_LICENSE_FILES = LICENSE LICENSE.BSD-2-Clause LICENSE.LGPL-2.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

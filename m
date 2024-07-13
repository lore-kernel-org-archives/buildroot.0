Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D27CDC3DA45
	for <buildroot@archiver.kernel.org>; Sat, 13 Jul 2024 19:56:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8F71A404C3;
	Sat, 13 Jul 2024 19:56:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x6Y1muygEaBH; Sat, 13 Jul 2024 19:56:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 76F45405D7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 76F45405D7;
	Sat, 13 Jul 2024 19:56:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7737B1BF3F6
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 19:55:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B83BA60718
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 19:55:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0uJvd3MuBvOO for <buildroot@lists.busybox.net>;
 Sat, 13 Jul 2024 19:55:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C42C060785
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C42C060785
 for <buildroot@buildroot.org>; Sat, 13 Jul 2024 19:55:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B897686604; Sat, 13 Jul 2024 19:55:53 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 13 Jul 2024 21:54:43 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 115e9493b8e3b50cd56b93c47d669319d02698a7
X-Git-Newrev: 19b145777385a31864d7d719201e765d1b0af35d
X-Patchwork-Hint: ignore
Message-Id: <20240713195553.B897686604@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mupdf: bump to version 1.23.9
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
Content-Type: multipart/mixed; boundary="===============9073449288291838662=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============9073449288291838662==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=19b145777385a31864d7d719201e765d1b0af35d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop patch which is now upstream.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
[bump to 1.23.9]
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...Add-missing-limits.h-include-for-UINT_MAX.patch | 70 ----------------------
 package/mupdf/mupdf.hash                           |  4 +-
 package/mupdf/mupdf.mk                             |  2 +-
 3 files changed, 3 insertions(+), 73 deletions(-)

diff --git a/package/mupdf/0001-Add-missing-limits.h-include-for-UINT_MAX.patch b/package/mupdf/0001-Add-missing-limits.h-include-for-UINT_MAX.patch
deleted file mode 100644
index 95f2f86666..0000000000
--- a/package/mupdf/0001-Add-missing-limits.h-include-for-UINT_MAX.patch
+++ /dev/null
@@ -1,70 +0,0 @@
-From ebce9f1b129ebc8f2b17afa02a4ffcb9453c11d9 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
-Date: Mon, 24 Apr 2023 17:27:35 +0200
-Subject: [PATCH] Add missing limits.h include for UINT_MAX
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-encode-basic.c uses 'UINT_MAX', which is available in the 'limits.h'
-header.
-
-In some configurations that build with zlib from [1], by chance
-limits.h gets indirectly included when including 'z-imp.h' (the
-includes are: 'z-imp.h' -> 'zlib.h' -> 'zconf.h' -> 'limits.h'), so
-the build succeeds.
-
-When using other zlib implementations however (for example from [2]),
-limits.h is not necessarily included indirectly, which leads to the
-build failing in the following way:
-
-source/fitz/encode-basic.c: In function 'deflate_write':
-source/fitz/encode-basic.c:343:27: error: 'UINT_MAX' undeclared (first use in this function)
-  343 |         newbufsize = n >= UINT_MAX ? UINT_MAX : deflateBound(&state->z, n);
-      |                           ^~~~~~~~
-source/fitz/encode-basic.c:26:1: note: 'UINT_MAX' is defined in header '<limits.h>'; did you forget to '#include <limits.h>'?
-
-Add the missing include, so that the build succeeds no matter if zlib
-indirectly includes 'limit.h' or not.
-
-Similarly, also add it in output-ps.c where it's also missing.
-
-[1]: https://zlib.net/
-[2]: https://github.com/zlib-ng/zlib-ng
-
-Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
-Upstream: https://bugs.ghostscript.com/show_bug.cgi?id=706667
----
- source/fitz/encode-basic.c | 2 ++
- source/fitz/output-ps.c    | 2 ++
- 2 files changed, 4 insertions(+)
-
-diff --git a/source/fitz/encode-basic.c b/source/fitz/encode-basic.c
-index 03a4ff76b..84f0c35e6 100644
---- a/source/fitz/encode-basic.c
-+++ b/source/fitz/encode-basic.c
-@@ -24,6 +24,8 @@
- 
- #include "z-imp.h"
- 
-+#include <limits.h>
-+
- struct ahx
- {
- 	fz_output *chain;
-diff --git a/source/fitz/output-ps.c b/source/fitz/output-ps.c
-index ef22c3cd6..3dc8ea17d 100644
---- a/source/fitz/output-ps.c
-+++ b/source/fitz/output-ps.c
-@@ -24,6 +24,8 @@
- 
- #include "z-imp.h"
- 
-+#include <limits.h>
-+
- typedef struct ps_band_writer_s
- {
- 	fz_band_writer super;
--- 
-2.39.1
-
diff --git a/package/mupdf/mupdf.hash b/package/mupdf/mupdf.hash
index 1f636097ed..580235eeca 100644
--- a/package/mupdf/mupdf.hash
+++ b/package/mupdf/mupdf.hash
@@ -1,8 +1,8 @@
 # From https://mupdf.com/downloads/index.html:
-sha1  b9907729d604f0bf3846b45cd5891e10d7a66e24  mupdf-1.22.0-source.tar.lz
+sha1  d79600bccd70ab9d0e8ee19dae4e275f2af95ced  mupdf-1.23.9-source.tar.lz
 
 # Locally computed:
-sha256  bed78a0abf8496b30c523497292de979db633eca57e02f6cd0f3c7c042551c3e  mupdf-1.22.0-source.tar.lz
+sha256  2c2f89deb9f425ba637dac226191d547f2b40975c4d21a340965f52c001e15c5  mupdf-1.23.9-source.tar.lz
 
 # Hash for license files:
 sha256  57c8ff33c9c0cfc3ef00e650a1cc910d7ee479a8bc509f6c9209a7c2a11399d6  COPYING
diff --git a/package/mupdf/mupdf.mk b/package/mupdf/mupdf.mk
index d813d9b7de..1c63059954 100644
--- a/package/mupdf/mupdf.mk
+++ b/package/mupdf/mupdf.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # python-pymupdf's version must match mupdf's version
-MUPDF_VERSION = 1.22.0
+MUPDF_VERSION = 1.23.9
 MUPDF_SOURCE = mupdf-$(MUPDF_VERSION)-source.tar.lz
 MUPDF_SITE = https://mupdf.com/downloads/archive
 MUPDF_LICENSE = AGPL-3.0+

--===============9073449288291838662==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============9073449288291838662==--

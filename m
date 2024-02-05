Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11C78C4828D
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 21:33:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B219D40A8A;
	Mon,  5 Feb 2024 21:33:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B219D40A8A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7KEZ0GSJ3uQp; Mon,  5 Feb 2024 21:33:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 877B240B5B;
	Mon,  5 Feb 2024 21:33:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 877B240B5B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AA5D41BF341
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 21:32:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8EA6281E10
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 21:32:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8EA6281E10
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0W2CcQ4BPgz9 for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 21:32:40 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 97A7581E9E
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 21:32:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 97A7581E9E
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 855CE86E0D; Mon,  5 Feb 2024 21:32:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 5 Feb 2024 22:32:05 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 467eb0c337cac8447181c5a126032976a26c13f1
X-Git-Newrev: dc125743d4e984ac4d0b1c07bafc99d075fc9686
X-Patchwork-Hint: ignore
Message-Id: <20240205213240.855CE86E0D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/minizip-zlib: bump to version 1.3.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=dc125743d4e984ac4d0b1c07bafc99d075fc9686
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop patch (already in version)

https://github.com/madler/zlib/releases/tag/v1.3.1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...overflows-of-zip-header-fields-in-minizip.patch | 39 ----------------------
 package/minizip-zlib/minizip-zlib.hash             |  2 +-
 package/minizip-zlib/minizip-zlib.mk               |  4 +--
 3 files changed, 2 insertions(+), 43 deletions(-)

diff --git a/package/minizip-zlib/0001-Reject-overflows-of-zip-header-fields-in-minizip.patch b/package/minizip-zlib/0001-Reject-overflows-of-zip-header-fields-in-minizip.patch
deleted file mode 100644
index f4eacc7fdc..0000000000
--- a/package/minizip-zlib/0001-Reject-overflows-of-zip-header-fields-in-minizip.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 73331a6a0481067628f065ffe87bb1d8f787d10c Mon Sep 17 00:00:00 2001
-From: Hans Wennborg <hans@chromium.org>
-Date: Fri, 18 Aug 2023 11:05:33 +0200
-Subject: [PATCH] Reject overflows of zip header fields in minizip.
-
-This checks the lengths of the file name, extra field, and comment
-that would be put in the zip headers, and rejects them if they are
-too long. They are each limited to 65535 bytes in length by the zip
-format. This also avoids possible buffer overflows if the provided
-fields are too long.
-
-Upstream: https://github.com/madler/zlib/commit/73331a6a0481067628f065ffe87bb1d8f787d10c
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- contrib/minizip/zip.c | 11 +++++++++++
- 1 file changed, 11 insertions(+)
-
-diff --git a/contrib/minizip/zip.c b/contrib/minizip/zip.c
-index 3d3d4cadd..0446109b2 100644
---- a/contrib/minizip/zip.c
-+++ b/contrib/minizip/zip.c
-@@ -1043,6 +1043,17 @@ extern int ZEXPORT zipOpenNewFileInZip4_64(zipFile file, const char* filename, c
-       return ZIP_PARAMERROR;
- #endif
- 
-+    // The filename and comment length must fit in 16 bits.
-+    if ((filename!=NULL) && (strlen(filename)>0xffff))
-+        return ZIP_PARAMERROR;
-+    if ((comment!=NULL) && (strlen(comment)>0xffff))
-+        return ZIP_PARAMERROR;
-+    // The extra field length must fit in 16 bits. If the member also requires
-+    // a Zip64 extra block, that will also need to fit within that 16-bit
-+    // length, but that will be checked for later.
-+    if ((size_extrafield_local>0xffff) || (size_extrafield_global>0xffff))
-+        return ZIP_PARAMERROR;
-+
-     zi = (zip64_internal*)file;
- 
-     if (zi->in_opened_file_inzip == 1)
diff --git a/package/minizip-zlib/minizip-zlib.hash b/package/minizip-zlib/minizip-zlib.hash
index 23bfda8474..cbd9313870 100644
--- a/package/minizip-zlib/minizip-zlib.hash
+++ b/package/minizip-zlib/minizip-zlib.hash
@@ -1,4 +1,4 @@
 # From http://www.zlib.net/
-sha256  8a9ba2898e1d0d774eca6ba5b4627a11e5588ba85c8851336eb38de4683050a7  zlib-1.3.tar.xz
+sha256  38ef96b8dfe510d42707d9c781877914792541133e1870841463bfa73f883e32  zlib-1.3.1.tar.xz
 # License files, locally calculated
 sha256  845efc77857d485d91fb3e0b884aaa929368c717ae8186b66fe1ed2495753243  LICENSE
diff --git a/package/minizip-zlib/minizip-zlib.mk b/package/minizip-zlib/minizip-zlib.mk
index 81fee3c687..6d4a2d2e20 100644
--- a/package/minizip-zlib/minizip-zlib.mk
+++ b/package/minizip-zlib/minizip-zlib.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MINIZIP_ZLIB_VERSION = 1.3
+MINIZIP_ZLIB_VERSION = 1.3.1
 MINIZIP_ZLIB_SOURCE = zlib-$(MINIZIP_ZLIB_VERSION).tar.xz
 MINIZIP_ZLIB_SITE = http://www.zlib.net
 MINIZIP_ZLIB_LICENSE = Zlib
@@ -16,7 +16,5 @@ MINIZIP_ZLIB_AUTORECONF = YES
 MINIZIP_ZLIB_DEPENDENCIES = zlib
 # demos must be disabled to avoid a conflict with BR2_PACKAGE_MINIZIP_DEMOS
 MINIZIP_ZLIB_CONF_OPTS = --disable-demos
-# 0001-Reject-overflows-of-zip-header-fields-in-minizip.patch
-MINIZIP_ZLIB_IGNORE_CVES += CVE-2023-45853
 
 $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

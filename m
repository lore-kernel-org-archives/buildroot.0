Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33531CCD1BF
	for <buildroot@archiver.kernel.org>; Fri, 24 Oct 2025 21:30:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DBE4C40CE3;
	Fri, 24 Oct 2025 21:30:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id br_D8aT_tYnk; Fri, 24 Oct 2025 21:30:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F3B6C40CE4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id F3B6C40CE4;
	Fri, 24 Oct 2025 21:30:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9CD4619D
 for <buildroot@buildroot.org>; Fri, 24 Oct 2025 21:30:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 830A940CE3
 for <buildroot@buildroot.org>; Fri, 24 Oct 2025 21:30:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xaNpv2jMejrH for <buildroot@buildroot.org>;
 Fri, 24 Oct 2025 21:30:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.162;
 helo=smtpcmd14162.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org AE77840CE4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AE77840CE4
Received: from smtpcmd14162.aruba.it (smtpcmd14162.aruba.it [62.149.156.162])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AE77840CE4
 for <buildroot@buildroot.org>; Fri, 24 Oct 2025 21:30:01 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id CPMEvcwIb4OeoCPMEv4rLR; Fri, 24 Oct 2025 23:29:59 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Fri, 24 Oct 2025 23:29:58 +0200
Message-ID: <20251024212958.4091720-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfLXt4kJgnJqvfL/sb5WeOwdqqLBd/KdsuRutw289xGFw0T7tAVbadmKopFzgG1iK4Phqcf06b0RbIKPMrl20TcybF0WiL7o7+ovUuMJAhLv0mTrxEz9Q
 sF3ebS/XvzWMAYH9rWbyvzfXNPGEP8Wi3zfIQn01Em+CVzhDlanSmPvUc0fNajGMvKzQ1W1ID8/yidaRAop5JPn2dg/M0B4oiJejJQyuA6vpXci3OAaICWTZ
 377pbpXz8/oC9t7FBTtZ3CFXcs2+duX+ef4ADVVdO6U=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1761341399; bh=6cpvx6PWRjoE8G+tJpaF0Y/xA4nfQiYC4ZFb371yd/s=;
 h=From:To:Subject:Date:MIME-Version;
 b=HrmLjHSzbgqa9dx51tuIybDYTDU8wBJoy1a0tkv2HXGIKqb5Y1ZYvxmE/B90APJcW
 pxsRRRZn+z6KQsF9JF1EW2iBqfxfxG/TqnLtzPAFw/6lTDCUiUXocKd2eJ+W1Y2gPv
 1M/NH+N6AfWCBWG77uuDIWUs7qwXOhwxdZkygJZvwVQgZdNasqBTuzdlXFq/OHcLmF
 Ceh8xI8ZI96lh/d/7vo9B47jDEMtBOvo14eOk3m2c//KEYHrBLjHo5blxVT1NXq3hk
 5NqO9Jz14F9dTYmRtp5TfJTtlqakqyadqSvEkyTAyPCawwZxuv0hjsxzv7dXR9TqG2
 jbPwRKJiaHoOg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=HrmLjHSz
Subject: [Buildroot] [PATCH] package/liblo: bump to version 0.34
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

Drop upstreamed local patch

Release Notes:
https://sourceforge.net/p/liblo/git/ci/master/tree/NEWS

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 ...-fix-build-failure-as-static-library.patch | 34 -------------------
 package/liblo/liblo.hash                      |  8 ++---
 package/liblo/liblo.mk                        |  2 +-
 3 files changed, 5 insertions(+), 39 deletions(-)
 delete mode 100644 package/liblo/0001-server.c-fix-build-failure-as-static-library.patch

diff --git a/package/liblo/0001-server.c-fix-build-failure-as-static-library.patch b/package/liblo/0001-server.c-fix-build-failure-as-static-library.patch
deleted file mode 100644
index caeee536a0..0000000000
--- a/package/liblo/0001-server.c-fix-build-failure-as-static-library.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 74b228c74c7821dbe16d7730040030eed2f01a28 Mon Sep 17 00:00:00 2001
-From: Giulio Benetti <giulio.benetti@benettiengineering.com>
-Date: Mon, 7 Jul 2025 22:58:10 +0200
-Subject: [PATCH] server.c: fix build failure as static library
-
-As static library strncpy() can't determine precise maximum characters
-because strlen() is variable, so to fix build failure let's convert 3
-lines into one by using strdup() that does the same as the actual code.
-
-Upstream: https://sourceforge.net/p/liblo/patches/9/
-Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
----
- src/server.c | 5 +----
- 1 file changed, 1 insertion(+), 4 deletions(-)
-
-diff --git a/src/server.c b/src/server.c
-index 130f6d5..1236279 100644
---- a/src/server.c
-+++ b/src/server.c
-@@ -2062,10 +2062,7 @@ static void dispatch_method(lo_server s, const char *path,
-                     char *tmp;
-                     char *sec;
- 
--                    int tmplen = (int) strlen(it->path + len) + 1;
--                    tmp = (char*) malloc(strlen(it->path + len) + 1);
--                    strncpy(tmp, it->path + len, tmplen);
--                    tmp[tmplen-1]=0;
-+                    tmp = strdup(it->path + len);
-                     sec = strchr(tmp, '/');
-                     if (sec)
-                         *sec = '\0';
--- 
-2.39.5
-
diff --git a/package/liblo/liblo.hash b/package/liblo/liblo.hash
index a87b6233dd..9a45674744 100644
--- a/package/liblo/liblo.hash
+++ b/package/liblo/liblo.hash
@@ -1,7 +1,7 @@
-# From http://sourceforge.net/projects/liblo/files/liblo/0.32/
-sha1  e660cf3f630f9255a626102b4ff5082114ebd8a1  liblo-0.32.tar.gz
-md5  a93a7a9da084e6a0937bde6fc324a52a  liblo-0.32.tar.gz
+# From http://sourceforge.net/projects/liblo/files/liblo/0.34/
+sha1  0bcc3f30a4cdd2f41fe6c20c48f92bcaeaa8e6bc  liblo-0.34.tar.gz
+md5  14a65154e8f2609f558ce2648f1c99ef  liblo-0.34.tar.gz
 
 # Locally computed
-sha256  5df05f2a0395fc5ac90f6b538b8c82bb21941406fd1a70a765c7336a47d70208  liblo-0.32.tar.gz
+sha256  69aa0cd365dba5ea7799b850a7da659ad303e6074bbd67f4ab84e4d6f5f6c3a4  liblo-0.34.tar.gz
 sha256  5df07007198989c622f5d41de8d703e7bef3d0e79d62e24332ee739a452af62a  COPYING
diff --git a/package/liblo/liblo.mk b/package/liblo/liblo.mk
index c47e06c0a3..ab30feab81 100644
--- a/package/liblo/liblo.mk
+++ b/package/liblo/liblo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBLO_VERSION = 0.32
+LIBLO_VERSION = 0.34
 LIBLO_SITE = http://downloads.sourceforge.net/project/liblo/liblo/$(LIBLO_VERSION)
 
 LIBLO_LICENSE = LGPL-2.1+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

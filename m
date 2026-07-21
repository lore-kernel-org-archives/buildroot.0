Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6854CC4451C
	for <buildroot@archiver.kernel.org>; Tue, 21 Jul 2026 20:03:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2AF8C80DD9;
	Tue, 21 Jul 2026 20:03:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ndaplCaPCiyA; Tue, 21 Jul 2026 20:03:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2F16580DEE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784664208;
	bh=Glut7puFCuTKRk/h2SvtXZ4aJVVL8QG9g3XfmW3rzVE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=eeASQ7PQppHvZo/aEDu1/+ww6XflagMnH1T/6cIqswMmc3Nt+5mxZsO23XQ8gf0g3
	 a/7RGRiVCqz7geNucQMF1NfTCxDwgfSjkmG5FBpmv6b9UB0a0AcEeNiJ1foKfW4pb2
	 a1HeqPQrMAteseMu3YwoaUxE8rNzgk1CXFB+UiOS05RBeJ1bklzXacSZ1dkkHu306w
	 6SqkeZUQAZgqMogo1jzol+TZ0WMFinZOfwxwvN5noGZClts/3JvwwbwCAh3zPT0Des
	 jXgsJ1NQ/52L7PvCHNvayvkpPUzVzgPI2p+pCXeN9x/DTvrS5bt17hFi41v9mMZdfx
	 iypQNQKIbT3AA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2F16580DEE;
	Tue, 21 Jul 2026 20:03:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1318642A
 for <buildroot@buildroot.org>; Tue, 21 Jul 2026 20:03:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E32B2402F5
 for <buildroot@buildroot.org>; Tue, 21 Jul 2026 20:03:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0aY6mNEkAuet for <buildroot@buildroot.org>;
 Tue, 21 Jul 2026 20:03:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EFB1D40015
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id EFB1D40015
 for <buildroot@buildroot.org>; Tue, 21 Jul 2026 20:03:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 95DBD8913C; Tue, 21 Jul 2026 20:02:47 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 21 Jul 2026 21:56:10 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f939799014026257af6841bda3c594d64f094566
X-Git-Newrev: 0c8bd5739c1d63550bc80f0b204f67ff8a2854c8
X-Patchwork-Hint: ignore
Message-Id: <20260721200247.95DBD8913C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/dropbear: security bump version to
 2026.93
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8742153743052906494=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8742153743052906494==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/0c8bd5739c1d63550bc80f0b204f67ff8a2854c8
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://matt.ucc.asn.au/dropbear/CHANGES

- Security: Fix a use-after-free in X11 forwarding that could possibly lead
  to memory corruption. This is vulnerable to authenticated users if X11
  forwarding is enabled. By default X11 forwarding is not built.
  In 2026.89 the server is running as the authenticated user for X11
  forwarding, in earlier versions it runs as root.
  This removes X11 "single connection" which has probably never been used.
  Reported by @peter-pe
  https://github.com/mkj/dropbear/commit/882f83806d5e133037cd28e954a878984ef7b9c4

Added patch to fix build errors which would be introduced by this bump:
https://github.com/mkj/dropbear/commit/86baa66fc934bb55a911eacec28d93d86fb0e6f8

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .../0001-scp-fix-build-with-gcc-14.x.patch         | 40 ++++++++++++++++++++++
 package/dropbear/dropbear.hash                     |  2 +-
 package/dropbear/dropbear.mk                       |  2 +-
 3 files changed, 42 insertions(+), 2 deletions(-)

diff --git a/package/dropbear/0001-scp-fix-build-with-gcc-14.x.patch b/package/dropbear/0001-scp-fix-build-with-gcc-14.x.patch
new file mode 100644
index 0000000000..0c2b5cbdb5
--- /dev/null
+++ b/package/dropbear/0001-scp-fix-build-with-gcc-14.x.patch
@@ -0,0 +1,40 @@
+From 0c67372257575f6ec59364aba5ca579c126b7678 Mon Sep 17 00:00:00 2001
+From: Voxel <voxel@andreev.msk.ru>
+Date: Tue, 21 Jul 2026 19:28:00 +0200
+Subject: [PATCH] scp: fix build with gcc >= 14.x
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Fixes build errors seen with gcc 14.x:
+
+src/scp.c: In function ‘sink’:
+src/scp.c:1214:32: error: implicit declaration of function ‘ascii_isdigit’
+ [-Wimplicit-function-declaration]
+
+src/scp.c: In function ‘okname’:
+src/scp.c:1501:22: error: implicit declaration of function ‘ascii_isalpha’
+ [-Wimplicit-function-declaration]
+
+Upstream: https://github.com/mkj/dropbear/pull/474
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ src/scp.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/scp.c b/src/scp.c
+index d7266fdd..633b4dba 100644
+--- a/src/scp.c
++++ b/src/scp.c
+@@ -81,6 +81,7 @@
+ #include "compat.h"
+ #include "scpmisc.h"
+ #include "progressmeter.h"
++#include "dbutil.h"
+ 
+ void bwlimit(int);
+ 
+-- 
+2.47.3
+
diff --git a/package/dropbear/dropbear.hash b/package/dropbear/dropbear.hash
index 9df81ea4b5..2538132463 100644
--- a/package/dropbear/dropbear.hash
+++ b/package/dropbear/dropbear.hash
@@ -1,5 +1,5 @@
 # From https://matt.ucc.asn.au/dropbear/releases/SHA256SUM.asc
-sha256  91dcb5234de8dea68dd82c55411c9fc986b457ab58372a780ee8a870419c2f7e  dropbear-2026.92.tar.bz2
+sha256  310a6087952897c182efbe16088fa0c4d07c467e850a22699472137278fabf09  dropbear-2026.93.tar.bz2
 
 # License file, locally computed
 sha256  a99ce657d790b761c132ee7e0de18edb437ae6361e536d991c6a12f36e770445  LICENSE
diff --git a/package/dropbear/dropbear.mk b/package/dropbear/dropbear.mk
index e7e6703057..e595ebc10c 100644
--- a/package/dropbear/dropbear.mk
+++ b/package/dropbear/dropbear.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DROPBEAR_VERSION = 2026.92
+DROPBEAR_VERSION = 2026.93
 DROPBEAR_SITE = https://matt.ucc.asn.au/dropbear/releases
 DROPBEAR_SOURCE = dropbear-$(DROPBEAR_VERSION).tar.bz2
 DROPBEAR_LICENSE = MIT, BSD-2-Clause, Public domain

--===============8742153743052906494==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8742153743052906494==--

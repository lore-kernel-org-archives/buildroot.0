Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAAFFC5516F
	for <buildroot@archiver.kernel.org>; Fri, 31 Jul 2026 11:56:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 98CBE60AAE;
	Fri, 31 Jul 2026 11:56:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Fj8vZ9SoVuZY; Fri, 31 Jul 2026 11:56:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A0B8960ADC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785499015;
	bh=o+9A0W65ARZ2aHtWmGurZ+++R8BbTow1XGvNpgieNpE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=JJt5YHu4xm1M7BQfXhE+k9fXA7TtHOo8KeNqDOZjvI9MsY5TZvsAvnBpraVYblOcZ
	 ChbOBZQogR6Fxhz6ZASBw9o59UgZYeyZV0gEHUUUo6aPvoXiLR+yNpgceeWu8hciUu
	 UfdNm/DVV9FIy54Kgt1ih/3ZrEJubSYrB/7sEzDg1D0aBcHwqB1vTgtCx0D+rUley4
	 0my7yvHNMHZw99Wjm8+RaRX7cMVJ8vTBNcKqC/s2qlSCpZM5hG5wrHkzKNuNXtgy+y
	 a7u4ofuVXnIwKkCFObOVcL6/pXK8/ON087uwn5GGXGOtx3fYgNcKmHGgiZHEicYPdF
	 ehwSNnhETGZqw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A0B8960ADC;
	Fri, 31 Jul 2026 11:56:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id ED6E837F
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 11:56:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DE73C80F91
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 11:56:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dRw7FkArbNiT for <buildroot@buildroot.org>;
 Fri, 31 Jul 2026 11:56:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AA68A810A2
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id AA68A810A2
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 11:56:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9C6D58B743; Fri, 31 Jul 2026 11:56:05 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 28 Jul 2026 12:04:34 +0200
X-Git-Refname: refs/heads/2026.05.x
X-Git-Oldrev: 0be222379c3993f27a32b5173059c1f0c1d3b125
X-Git-Newrev: c0b1e7e2512f1aeaf01e8bea4258d7c2e1ce6f5b
X-Patchwork-Hint: ignore
Message-Id: <20260731115605.9C6D58B743@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.05.x] package/dropbear:
 security bump version to 2026.93
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7827962226483085375=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7827962226483085375==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/c0b1e7e2512f1aeaf01e8bea4258d7c2e1ce6f5b
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.05.x

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
(cherry picked from commit 0c8bd5739c1d63550bc80f0b204f67ff8a2854c8)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
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

--===============7827962226483085375==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7827962226483085375==--

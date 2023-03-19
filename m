Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4521C6FD1F
	for <buildroot@archiver.kernel.org>; Sun, 19 Mar 2023 16:28:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 52BC581ABA;
	Sun, 19 Mar 2023 16:28:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 52BC581ABA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LtR7mpHylBPB; Sun, 19 Mar 2023 16:28:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 94CCE81A73;
	Sun, 19 Mar 2023 16:28:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 94CCE81A73
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 536831BF2F8
 for <buildroot@lists.busybox.net>; Sun, 19 Mar 2023 16:28:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2D83D81A73
 for <buildroot@lists.busybox.net>; Sun, 19 Mar 2023 16:28:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2D83D81A73
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lNpBJcAKMAgW for <buildroot@lists.busybox.net>;
 Sun, 19 Mar 2023 16:28:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 361AA81A6A
 for <buildroot@buildroot.org>; Sun, 19 Mar 2023 16:28:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 361AA81A6A
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 232098742C; Sun, 19 Mar 2023 16:28:24 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 19 Mar 2023 17:28:02 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1c36821be1ffa7a55a7c87da7e224b457091c562
X-Git-Newrev: 25defd685737913fcac59b00819c82118df533f9
X-Patchwork-Hint: ignore
Message-Id: <20230319162824.232098742C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ifupdown: bump to 0.8.41
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
Content-Type: multipart/mixed; boundary="===============0912305903730129651=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0912305903730129651==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=25defd685737913fcac59b00819c82118df533f9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

MUSL support is patched by defining FNM_EXTMATCH to zero, which omits
GNU-only extended pattern matching.

Signed-off-by: Martin Hundebøll <martin@geanix.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...define-GNU-only-FNM_EXTMATCH-to-zero-on-n.patch | 41 ++++++++++++++++++++++
 package/ifupdown/ifupdown.hash                     |  4 +--
 package/ifupdown/ifupdown.mk                       |  5 +--
 3 files changed, 46 insertions(+), 4 deletions(-)

diff --git a/package/ifupdown/0001-archcommon-define-GNU-only-FNM_EXTMATCH-to-zero-on-n.patch b/package/ifupdown/0001-archcommon-define-GNU-only-FNM_EXTMATCH-to-zero-on-n.patch
new file mode 100644
index 0000000000..b1b58f1e7e
--- /dev/null
+++ b/package/ifupdown/0001-archcommon-define-GNU-only-FNM_EXTMATCH-to-zero-on-n.patch
@@ -0,0 +1,41 @@
+From e27fe4b483194ee57736c228b7a6c56696ae8a06 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@geanix.com>
+Date: Thu, 16 Mar 2023 09:29:20 +0100
+Subject: [PATCH] archcommon: define GNU-only FNM_EXTMATCH to zero on non-glibc
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+FNM_EXTMATCH is a GNU extension that enables extended pattern matching
+for fnmatch(3). Defining it to zero on non-glibc builds makes ifupdown
+usable, albeit with a sligthy reduced pattern matching feature set.
+
+Signed-off-by: Martin Hundebøll <martin@geanix.com>
+Upstream-status: Denied [https://salsa.debian.org/debian/ifupdown/-/merge_requests/5]
+---
+ archcommon.h | 10 ++++++++++
+ 1 file changed, 10 insertions(+)
+
+diff --git a/archcommon.h b/archcommon.h
+index 818b0b6..981e84f 100644
+--- a/archcommon.h
++++ b/archcommon.h
+@@ -1,5 +1,15 @@
+ #include "header.h"
+ 
++/*
++ * FNM_EXTMATCH is a GNU extension, so it isn't available when compiling
++ * with MUSL. Defining FNM_EXTMATCH to zero is safe, as the flag merely
++ * enables extended pattern matching, which MUSL users should be able to
++ * live without.
++ */
++#ifndef FNM_EXTMATCH
++#define FNM_EXTMATCH 0
++#endif
++
+ bool execable(const char *);
+ 
+ #define iface_is_link() (!_iface_has(ifd->real_iface, ":."))
+-- 
+2.39.2
+
diff --git a/package/ifupdown/ifupdown.hash b/package/ifupdown/ifupdown.hash
index f8844a60a6..f5c2d2d34c 100644
--- a/package/ifupdown/ifupdown.hash
+++ b/package/ifupdown/ifupdown.hash
@@ -1,4 +1,4 @@
-# From http://ftp.de.debian.org/debian/pool/main/i/ifupdown/ifupdown_0.8.16.dsc
-sha256  601416c12e39ac29022951a2867aed5c607f732ac57fd51517bfba92a4cc4fb0  ifupdown_0.8.16.tar.xz
+# From http://snapshot.debian.org/archive/debian/20230222T205615Z/pool/main/i/ifupdown/ifupdown_0.8.41.dsc
+sha256  222c5bef313a9e71d9be4b946c73c8606c98f9e0229153191d9c6d8fb9b3599c  ifupdown_0.8.41.tar.xz
 # Locally computed
 sha256  32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
diff --git a/package/ifupdown/ifupdown.mk b/package/ifupdown/ifupdown.mk
index e62c2a79c5..14c36db0db 100644
--- a/package/ifupdown/ifupdown.mk
+++ b/package/ifupdown/ifupdown.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-IFUPDOWN_VERSION = 0.8.16
+IFUPDOWN_VERSION = 0.8.41
 IFUPDOWN_SOURCE = ifupdown_$(IFUPDOWN_VERSION).tar.xz
-IFUPDOWN_SITE = http://snapshot.debian.org/archive/debian/20160922T165503Z/pool/main/i/ifupdown
+IFUPDOWN_SITE = http://snapshot.debian.org/archive/debian/20230222T205615Z/pool/main/i/ifupdown
 IFUPDOWN_LICENSE = GPL-2.0+
 IFUPDOWN_LICENSE_FILES = COPYING
 IFUPDOWN_CPE_ID_VENDOR = debian
@@ -14,6 +14,7 @@ IFUPDOWN_CPE_ID_VENDOR = debian
 define IFUPDOWN_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) \
 		CFLAGS="$(TARGET_CFLAGS) -std=gnu99 -D'IFUPDOWN_VERSION=\"$(IFUPDOWN_VERSION)\"'" \
+		ARCH=linux \
 		-C $(@D)
 endef
 

--===============0912305903730129651==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0912305903730129651==--

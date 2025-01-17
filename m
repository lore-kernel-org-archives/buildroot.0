Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F7FDC02183
	for <buildroot@archiver.kernel.org>; Fri, 17 Jan 2025 21:10:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B376A7048F;
	Fri, 17 Jan 2025 21:10:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6DB7jHeZ1LGG; Fri, 17 Jan 2025 21:09:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D76B46FBC0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D76B46FBC0;
	Fri, 17 Jan 2025 21:09:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7F4FFB89
 for <buildroot@buildroot.org>; Fri, 17 Jan 2025 21:09:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5B2474130F
 for <buildroot@buildroot.org>; Fri, 17 Jan 2025 21:09:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C7iEajVuvQgo for <buildroot@buildroot.org>;
 Fri, 17 Jan 2025 21:09:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 539C9412F9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 539C9412F9
 for <buildroot@buildroot.org>; Fri, 17 Jan 2025 21:09:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4BA2B85DA8; Fri, 17 Jan 2025 21:09:56 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Fri, 17 Jan 2025 21:54:26 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fa06ef964e86523077ace43d2f91a8555e8dcc11
X-Git-Newrev: 027c9ce67ca21409faed9f9add7222cb3e5ba4d4
X-Patchwork-Hint: ignore
Message-Id: <20250117210956.4BA2B85DA8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/uclibc: update to 1.0.51
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=027c9ce67ca21409faed9f9add7222cb3e5ba4d4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

See here for a changes made to this release:
https://mailman.openadk.org/mailman3/hyperkitty/list/devel@uclibc-ng.org/thread/4AHYRGXTYIYVUACYB3Q4JK5Y44ALZRAU/

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...4n32-time64-Select-correct-_dl_fstat-impl.patch | 34 ----------------------
 package/uclibc/uclibc.hash                         |  4 +--
 package/uclibc/uclibc.mk                           |  2 +-
 3 files changed, 3 insertions(+), 37 deletions(-)

diff --git a/package/uclibc/0001-mips64n32-time64-Select-correct-_dl_fstat-impl.patch b/package/uclibc/0001-mips64n32-time64-Select-correct-_dl_fstat-impl.patch
deleted file mode 100644
index c27e606b89..0000000000
--- a/package/uclibc/0001-mips64n32-time64-Select-correct-_dl_fstat-impl.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 0dedba1051d781bfb3dd3b50101aa0e880cb6cde Mon Sep 17 00:00:00 2001
-From: Dmitry Chestnykh <dm.chestnykh@gmail.com>
-Date: Sat, 7 Sep 2024 10:48:47 +0300
-Subject: [PATCH] mips64n32, time64: Select correct _dl_fstat impl
-
-With time64 enabled we have to use statx() instead of stat() or fstat()
-If the _dl_fstat implementation isn't selected correctly
-we can have multiple errors inside dynamic linker
-during startup of the system and of the almost every process
-Add sparc exclusion like in other places inside this header
-
-Signed-off-by: Dmitry Chestnykh <dm.chestnykh@gmail.com>
-Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
-Upstream: https://cgit.uclibc-ng.org/cgi/cgit/uclibc-ng.git/commit/?id=0dedba1051d781bfb3dd3b50101aa0e880cb6cde
----
- ldso/include/dl-syscall.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/ldso/include/dl-syscall.h b/ldso/include/dl-syscall.h
-index 180d03012..c143b8d45 100644
---- a/ldso/include/dl-syscall.h
-+++ b/ldso/include/dl-syscall.h
-@@ -168,7 +168,7 @@ static __always_inline int _dl_stat(const char *file_name,
- #if defined __NR_fstat64 && !defined __NR_fstat && (!defined(__UCLIBC_USE_TIME64__) || defined(__sparc__))
- # define __NR__dl_fstat __NR_fstat64
- static __always_inline _syscall2(int, _dl_fstat, int, fd, struct stat *, buf)
--#elif defined __NR_fstat
-+#elif defined __NR_fstat && !defined __UCLIBC_USE_TIME64__ || defined(__sparc__)
- # define __NR__dl_fstat __NR_fstat
- static __always_inline _syscall2(int, _dl_fstat, int, fd, struct stat *, buf)
- #elif defined __NR_statx && defined __UCLIBC_HAVE_STATX__
--- 
-2.30.2
-
diff --git a/package/uclibc/uclibc.hash b/package/uclibc/uclibc.hash
index dbc3966906..398a1c04c4 100644
--- a/package/uclibc/uclibc.hash
+++ b/package/uclibc/uclibc.hash
@@ -1,4 +1,4 @@
-# From https://downloads.uclibc-ng.org/releases/1.0.50/uClibc-ng-1.0.50.tar.xz.sha256
-sha256  aed867251f4823a74ea5e3a3993d3a7c123280abe15e38dc206770c3968f21cf  uClibc-ng-1.0.50.tar.xz
+# From https://downloads.uclibc-ng.org/releases/1.0.51/uClibc-ng-1.0.51.tar.xz.sha256
+sha256  3484c8c7a0503c08f7e5fa7473c987414050726f31e8593d02d984f512d1a0cb  uClibc-ng-1.0.51.tar.xz
 # Locally calculated
 sha256  ec60b993835e2c6b79e6d9226345f4e614e686eb57dc13b6420c15a33a8996e5  COPYING.LIB
diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
index 600d72ce7b..fdd5850874 100644
--- a/package/uclibc/uclibc.mk
+++ b/package/uclibc/uclibc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UCLIBC_VERSION = 1.0.50
+UCLIBC_VERSION = 1.0.51
 UCLIBC_SOURCE = uClibc-ng-$(UCLIBC_VERSION).tar.xz
 UCLIBC_SITE = https://downloads.uclibc-ng.org/releases/$(UCLIBC_VERSION)
 UCLIBC_LICENSE = LGPL-2.1+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C3B1C7EE25
	for <buildroot@archiver.kernel.org>; Mon,  8 May 2023 21:00:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2247542084;
	Mon,  8 May 2023 21:00:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2247542084
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OeLycfK7DROY; Mon,  8 May 2023 21:00:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AEA3941F82;
	Mon,  8 May 2023 21:00:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AEA3941F82
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7BD7C1BF34E
 for <buildroot@lists.busybox.net>; Mon,  8 May 2023 21:00:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 625508443B
 for <buildroot@lists.busybox.net>; Mon,  8 May 2023 21:00:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 625508443B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TR0PIJHRzAYk for <buildroot@lists.busybox.net>;
 Mon,  8 May 2023 21:00:06 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 932368443F
 for <buildroot@buildroot.org>; Mon,  8 May 2023 21:00:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 932368443F
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8127986248; Mon,  8 May 2023 21:00:06 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 8 May 2023 22:58:54 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3686e16b5213431ee44d6599486d05d9c07854d1
X-Git-Newrev: e5b8646c19937ce030598e0037df9da1c75be727
X-Patchwork-Hint: ignore
Message-Id: <20230508210006.8127986248@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gloox: bump version to 1.0.27
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=e5b8646c19937ce030598e0037df9da1c75be727
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yair Ben-Avraham <yairba@protonmail.com>
[yann.morin.1998@free.fr: regenerate .checkpackageignore]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .checkpackageignore                                |  1 -
 ...0001-src-connectiontcpserver-cpp-fix-musl.patch | 25 ----------------------
 package/gloox/gloox.hash                           |  2 +-
 package/gloox/gloox.mk                             |  2 +-
 4 files changed, 2 insertions(+), 28 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 3ac032400b..05459362ee 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -584,7 +584,6 @@ package/gli/0001-Optional-building-tests.patch Upstream
 package/glmark2/0001-wscript-use-find_program-to-find-wayland-scanner.patch Upstream
 package/glmark2/0002-libmatrix-Add-missing-utility-include.patch Upstream
 package/glog/0001-added-emscripten-support.patch Upstream
-package/gloox/0001-src-connectiontcpserver-cpp-fix-musl.patch Upstream
 package/glorytun/0001-Add-support-for-Apple-silicon.patch Upstream
 package/glorytun/0002-aegis256.c-fix-aarch64-build-with-uclibc.patch Upstream
 package/gmp/0001-mpz-inp_raw.c-Avoid-bit-size-overflows.patch Upstream
diff --git a/package/gloox/0001-src-connectiontcpserver-cpp-fix-musl.patch b/package/gloox/0001-src-connectiontcpserver-cpp-fix-musl.patch
deleted file mode 100644
index 56a2d4982c..0000000000
--- a/package/gloox/0001-src-connectiontcpserver-cpp-fix-musl.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-src/connectiontcpserver.cpp: fix musl build
-
-Build on musl fails on:
-
-connectiontcpserver.cpp:131:13: error: 'strerror' was not declared in this scope
-           + strerror( err ) + " (errno: " + util::int2string( err ) + ")";
-             ^~~~~~~~
-
-Fixes:
- - http://autobuild.buildroot.org/results/a61a91bb6e1156eff5fb756f9dccfc2bb6c0f277
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://bugs.camaya.net/ticket/?id=291]
-
-diff -Nuar gloox-1.0.23-orig/src/connectiontcpserver.cpp gloox-1.0.23/src/connectiontcpserver.cpp
---- gloox-1.0.23-orig/src/connectiontcpserver.cpp	2020-06-05 23:22:59.624018949 +0200
-+++ gloox-1.0.23/src/connectiontcpserver.cpp	2020-06-05 23:26:20.708027221 +0200
-@@ -36,6 +36,7 @@
- # include <resolv.h>
- # include <netdb.h>
- # include <arpa/inet.h>
-+# include <string.h>
- # include <sys/socket.h>
- # include <sys/un.h>
- # include <sys/select.h>
diff --git a/package/gloox/gloox.hash b/package/gloox/gloox.hash
index 6419db90f8..66a3c2d1be 100644
--- a/package/gloox/gloox.hash
+++ b/package/gloox/gloox.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  ae1462be2a2eb8fe5cd054825143617c53c2c9c7195606cb5a5ba68c0f68f9c9  gloox-1.0.24.tar.bz2
+sha256  0b8b7371439bc58d9e51384b616c964b18b7b41b87af1b7855104380eda86ffb  gloox-1.0.27.tar.bz2
 sha256  40a20c41c8dabb8ba61bea983fa8f2f6989e67fac56bb62c2249053807fd26af  LICENSE
diff --git a/package/gloox/gloox.mk b/package/gloox/gloox.mk
index b741d5ebc1..3495db96f0 100644
--- a/package/gloox/gloox.mk
+++ b/package/gloox/gloox.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GLOOX_VERSION = 1.0.24
+GLOOX_VERSION = 1.0.27
 GLOOX_SOURCE = gloox-$(GLOOX_VERSION).tar.bz2
 GLOOX_SITE = https://camaya.net/download
 GLOOX_LICENSE = GPL-3.0 with OpenSSL exception
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

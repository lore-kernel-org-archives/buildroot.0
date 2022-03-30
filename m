Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDDBFC433EF
	for <buildroot@archiver.kernel.org>; Wed, 30 Mar 2022 18:06:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 849E36127D;
	Wed, 30 Mar 2022 18:06:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id F6sXdaBLIJ_Q; Wed, 30 Mar 2022 18:06:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 83E9761278;
	Wed, 30 Mar 2022 18:06:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D3DE61BF45A
 for <buildroot@lists.busybox.net>; Wed, 30 Mar 2022 18:06:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C00C8843C5
 for <buildroot@lists.busybox.net>; Wed, 30 Mar 2022 18:06:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cL3Zhe_QmshL for <buildroot@lists.busybox.net>;
 Wed, 30 Mar 2022 18:06:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mailout08.t-online.de (mailout08.t-online.de [194.25.134.20])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 94EB2843B9
 for <buildroot@buildroot.org>; Wed, 30 Mar 2022 18:06:09 +0000 (UTC)
Received: from fwd78.dcpf.telekom.de (fwd78.aul.t-online.de [10.223.144.104])
 by mailout08.t-online.de (Postfix) with SMTP id 89C4360BF
 for <buildroot@buildroot.org>; Wed, 30 Mar 2022 20:06:06 +0200 (CEST)
Received: from fli4l.lan.fli4l ([84.161.188.174]) by fwd78.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1nZchq-0ISkbJ0; Wed, 30 Mar 2022 20:06:06 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:55608)
 by fli4l.lan.fli4l with esmtp (Exim 4.95)
 (envelope-from <bernd.kuhls@t-online.de>) id 1nZchp-000162-QL
 for buildroot@buildroot.org; Wed, 30 Mar 2022 20:06:05 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Wed, 30 Mar 2022 20:06:05 +0200
Message-Id: <20220330180605.557933-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1648663566-0000AD4E-05C89A3B/0/0 CLEAN NORMAL
X-TOI-MSGID: 5269a4c2-6866-46fb-b3f9-4629e803bd78
Subject: [Buildroot] [PATCH v2 1/1] package/libzlib: security bump version
 to 1.2.12
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes CVE-2018-25032.

Release notes:
http://madler.net/pipermail/zlib-announce_madler.net/2022/000012.html

Changelog: https://github.com/madler/zlib/blob/master/ChangeLog

Added upstream patch to fix build error.

Updated license hash due to version bump, reformatted hashes:
https://github.com/madler/zlib/commit/21767c654d31d2dccdde4330529775c6c5fd5389

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v2: added upstream patch to fix build error

 ...hat-discarded-provided-CC-definition.patch | 28 +++++++++++++++++++
 package/libzlib/libzlib.hash                  |  4 +--
 package/libzlib/libzlib.mk                    |  2 +-
 3 files changed, 31 insertions(+), 3 deletions(-)
 create mode 100644 package/libzlib/0001-Fix-configure-issue-that-discarded-provided-CC-definition.patch

diff --git a/package/libzlib/0001-Fix-configure-issue-that-discarded-provided-CC-definition.patch b/package/libzlib/0001-Fix-configure-issue-that-discarded-provided-CC-definition.patch
new file mode 100644
index 0000000000..398e1c9481
--- /dev/null
+++ b/package/libzlib/0001-Fix-configure-issue-that-discarded-provided-CC-definition.patch
@@ -0,0 +1,28 @@
+From 05796d3d8d5546cf1b4dfe2cd72ab746afae505d Mon Sep 17 00:00:00 2001
+From: Mark Adler <madler@alumni.caltech.edu>
+Date: Mon, 28 Mar 2022 18:34:10 -0700
+Subject: [PATCH] Fix configure issue that discarded provided CC definition.
+
+Downloaded from upstream commit:
+https://github.com/madler/zlib/commit/05796d3d8d5546cf1b4dfe2cd72ab746afae505d
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ configure | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/configure b/configure
+index 52ff4a04e..3fa3e8618 100755
+--- a/configure
++++ b/configure
+@@ -174,7 +174,10 @@ if test -z "$CC"; then
+   else
+     cc=${CROSS_PREFIX}cc
+   fi
++else
++  cc=${CC}
+ fi
++
+ cflags=${CFLAGS-"-O3"}
+ # to force the asm version use: CFLAGS="-O3 -DASMV" ./configure
+ case "$cc" in
diff --git a/package/libzlib/libzlib.hash b/package/libzlib/libzlib.hash
index e3736b1011..e6ca974e2f 100644
--- a/package/libzlib/libzlib.hash
+++ b/package/libzlib/libzlib.hash
@@ -1,4 +1,4 @@
 # From http://www.zlib.net/
-sha256 4ff941449631ace0d4d203e3483be9dbc9da454084111f97ea0a2114e19bf066  zlib-1.2.11.tar.xz
+sha256  7db46b8d7726232a621befaab4a1c870f00a90805511c0e0090441dac57def18  zlib-1.2.12.tar.xz
 # License files, locally calculated
-sha256 7960b6b1cc63e619abb77acaea5427159605afee8c8b362664f4effc7d7f7d15  README
+sha256  fc2c3368901700f0acdeb1d8afeaca5923296768ec6824ecdf627aac396001fd  README
diff --git a/package/libzlib/libzlib.mk b/package/libzlib/libzlib.mk
index a10fc748d1..933732d6ba 100644
--- a/package/libzlib/libzlib.mk
+++ b/package/libzlib/libzlib.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBZLIB_VERSION = 1.2.11
+LIBZLIB_VERSION = 1.2.12
 LIBZLIB_SOURCE = zlib-$(LIBZLIB_VERSION).tar.xz
 LIBZLIB_SITE = http://www.zlib.net
 LIBZLIB_LICENSE = Zlib
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <SRS0=Qe4W=PG=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10292C433EF
	for <buildroot@archiver.kernel.org>; Mon, 18 Oct 2021 19:48:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B9916611EF
	for <buildroot@archiver.kernel.org>; Mon, 18 Oct 2021 19:48:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B9916611EF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 84B83400EF;
	Mon, 18 Oct 2021 19:48:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id o-DRgzpdDjK5; Mon, 18 Oct 2021 19:48:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 88F6B40204;
	Mon, 18 Oct 2021 19:48:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E09BA1BF350
 for <buildroot@lists.busybox.net>; Mon, 18 Oct 2021 19:48:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D0F8360629
 for <buildroot@lists.busybox.net>; Mon, 18 Oct 2021 19:48:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WUD4pM4Xe5D6 for <buildroot@lists.busybox.net>;
 Mon, 18 Oct 2021 19:48:32 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0C3CB605FB
 for <buildroot@buildroot.org>; Mon, 18 Oct 2021 19:48:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id BC00E876B8; Mon, 18 Oct 2021 19:45:27 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Mon, 18 Oct 2021 21:48:04 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 97408545ad05344cf8a4194d72ba8c6b876795ea
X-Git-Newrev: c7c8179259257281d7f8a4cf7a779ee74310496d
X-Patchwork-Hint: ignore
Message-Id: <20211018194527.BC00E876B8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mg: bump version to v3.5,
 drop backported patch
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

commit: https://git.buildroot.net/buildroot/commit/?id=c7c8179259257281d7f8a4cf7a779ee74310496d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Drop backported patch for GCC 10 build problem, part of release
 - Use upstream sha256 instead of locally computed

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../mg/0001-src-def.h-fix-build-with-gcc-10.patch  | 38 ----------------------
 package/mg/mg.hash                                 |  5 ++-
 package/mg/mg.mk                                   |  2 +-
 3 files changed, 3 insertions(+), 42 deletions(-)

diff --git a/package/mg/0001-src-def.h-fix-build-with-gcc-10.patch b/package/mg/0001-src-def.h-fix-build-with-gcc-10.patch
deleted file mode 100644
index d88e2f44f0..0000000000
--- a/package/mg/0001-src-def.h-fix-build-with-gcc-10.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From 29c83c917bd4f5d0c37ff0ab5da1a85762bd5530 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sat, 5 Sep 2020 14:50:20 +0200
-Subject: [PATCH] src/def.h: fix build with gcc 10
-
-Define hlp as extern to avoid the following build failure with gcc 10
-(which defaults to -fno-common):
-
-  CCLD     mg
-/home/buildroot/autobuild/run/instance-1/output-1/host/lib/gcc/arm-buildroot-linux-gnueabihf/10.2.0/../../../../arm-buildroot-linux-gnueabihf/bin/ld: mg-bell.o:(.bss+0x0): multiple definition of `hlp'; mg-basic.o:(.bss+0x0): first defined here
-
-Fixes:
- - http://autobuild.buildroot.org/results/aacc02abf41e120e0d0b22faa38642e6d149d73f
-
-[backport of upstream 29c83c917bd4f5d0c37ff0ab5da1a85762bd5530]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[yann.morin.1998@free.fr: backport actual patch after MR was accepted]
-Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
----
- src/def.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/def.h b/src/def.h
-index e4c049c..cd59725 100644
---- a/src/def.h
-+++ b/src/def.h
-@@ -650,7 +650,7 @@ int		 excline(char *);
- char		*skipwhite(char *);
- 
- /* help.c X */
--const char	*hlp;
-+extern const char	*hlp;
- int		 desckey(int, int);
- int		 wallchart(int, int);
- int		 help_help(int, int);
--- 
-2.28.0
-
diff --git a/package/mg/mg.hash b/package/mg/mg.hash
index 758a5232d4..9257daf5ac 100644
--- a/package/mg/mg.hash
+++ b/package/mg/mg.hash
@@ -1,5 +1,4 @@
-# From https://github.com/troglobit/mg/releases/tag/v3.4
-md5 6b79855d54770bcb23e5457ebde8296c  mg-3.4.tar.gz
+# From https://github.com/troglobit/mg/releases/tag/v3.5
+sha256 a906eab9370c0f24a5fa25923561ad933b74ad339d0b2851d2067badf0d7e4ce  mg-3.5.tar.gz
 # Locally computed:
-sha256 1a620cf5b2dd4b00006d6c929ac8e2a70eeab5f807a0d6e5334b878aa182b713  mg-3.4.tar.gz
 sha256 7e12e5df4bae12cb21581ba157ced20e1986a0508dd10d0e8a4ab9a4cf94e85c  UNLICENSE
diff --git a/package/mg/mg.mk b/package/mg/mg.mk
index e3b79da006..bb3f59a14d 100644
--- a/package/mg/mg.mk
+++ b/package/mg/mg.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MG_VERSION = 3.4
+MG_VERSION = 3.5
 MG_SITE = https://github.com/troglobit/mg/releases/download/v$(MG_VERSION)
 MG_LICENSE = Public Domain
 MG_LICENSE_FILES = UNLICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

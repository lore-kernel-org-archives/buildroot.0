Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90B24E8FDA2
	for <buildroot@archiver.kernel.org>; Fri, 26 Dec 2025 12:24:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 04BC34094D;
	Fri, 26 Dec 2025 12:24:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GMDdxDRNY5XQ; Fri, 26 Dec 2025 12:24:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 089884092D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766751857;
	bh=nM+VPvEJj/8Ar7ebln4BArOvjlV0Ss3ZkcTDMI81qhc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=OmYrfq7NE6ziGA2TnE6I1lZxNBztx/IZF2PkJJuRe/Oa0XUdSaEcrlXv5RREBwcyj
	 ynNq8EYsJlFMq7ja837dtefjrbVKWtEc7iQ56P/oFphVMA70oldvkPqGlErhdvhj1P
	 20cm3S2z7mx28/kiZQfua+N5UGgOwJFruB5iIy+9gJeWMnH9V3ma+ht9mxMnKVb53g
	 quUK/rtyF0K+TTxbKtTUvUgvdbXH+nxPhX2arVZHGnwgHCsqcIPi6dqD50ZTcddnOh
	 6NJOMAr/qwaPakeqljy2tc5vgV1nsE2OCVS/7X9eXKfQYnH4AZM0pHlosN0jgLm/7Q
	 9LJDi13XtUvJQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 089884092D;
	Fri, 26 Dec 2025 12:24:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2E7F6EC
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 12:24:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1415540442
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 12:24:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WTOb2nw83Jsm for <buildroot@buildroot.org>;
 Fri, 26 Dec 2025 12:24:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2AD234092D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2AD234092D
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 12:24:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 22AC3876CC; Fri, 26 Dec 2025 12:24:14 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 26 Dec 2025 13:19:20 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 39bcd458910accea8de4b3de792badcae5000bf4
X-Git-Newrev: 3afac89183899ac0f74737043e581fe65a8aac15
X-Patchwork-Hint: ignore
Message-Id: <20251226122414.22AC3876CC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/dash: bump to version 0.5.13
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=3afac89183899ac0f74737043e581fe65a8aac15
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For change log, see:
https://git.kernel.org/pub/scm/utils/dash/dash.git/log/?h=v0.5.13

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
[Julien:
 - replace change log link
 - import upstream sha512 to match hash file comment
 - add pgp signature comment
]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .../0001-configure.ac-drop-Wl-fatal-warnings.patch | 45 ----------------------
 package/dash/dash.hash                             |  7 +++-
 package/dash/dash.mk                               |  2 +-
 3 files changed, 6 insertions(+), 48 deletions(-)

diff --git a/package/dash/0001-configure.ac-drop-Wl-fatal-warnings.patch b/package/dash/0001-configure.ac-drop-Wl-fatal-warnings.patch
deleted file mode 100644
index eaa5d6cc60..0000000000
--- a/package/dash/0001-configure.ac-drop-Wl-fatal-warnings.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From 7d07f683b83ef9fbdf258ce61b022b32f06f253a Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Fri, 16 Feb 2024 17:26:28 +0100
-Subject: [PATCH] configure.ac: drop -Wl,--fatal-warnings
-
-Drop -Wl,--fatal-warnings with --enable-static to avoid the following
-static build failure:
-
-configure:4778: checking for strtod
-configure:4778: /home/autobuild/autobuild/instance-8/output-1/host/bin/powerpc-buildroot-linux-uclibcspe-gcc -o conftest -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -mabi=spe -mfloat-gprs=single -Wa,-me500 -Os -g0  -static -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -static -Wl,--fatal-warnings conftest.c  >&5
-/home/autobuild/autobuild/instance-8/output-1/host/lib/gcc/powerpc-buildroot-linux-uclibcspe/8.4.0/../../../../powerpc-buildroot-linux-uclibcspe/bin/ld: warning: conftest has a LOAD segment with RWX permissions
-collect2: error: ld returned 1 exit status
-
-[...]
-
-In file included from arith_yylex.c:44:
-system.h:74:22: error: static declaration of 'strtod' follows non-static declaration
- static inline double strtod(const char *nptr, char **endptr)
-                      ^~~~~~
-
-Fixes:
- - http://autobuild.buildroot.org/results/a54fdc7d1b94beb47203373ae35b08d9cea8d42c
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Upstream: https://lore.kernel.org/dash/20240216163319.860768-1-fontaine.fabrice@gmail.com
----
- configure.ac | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index 5524650..6993364 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -34,7 +34,7 @@ fi
- AC_ARG_ENABLE(static, AS_HELP_STRING(--enable-static, \
- 				     [Build statical linked program]))
- if test "$enable_static" = "yes"; then
--	export LDFLAGS="-static -Wl,--fatal-warnings"
-+	export LDFLAGS="-static"
- fi
- 
- AC_ARG_ENABLE(fnmatch, AS_HELP_STRING(--disable-fnmatch, \
--- 
-2.43.0
-
diff --git a/package/dash/dash.hash b/package/dash/dash.hash
index 8ae8a77177..4697d958a3 100644
--- a/package/dash/dash.hash
+++ b/package/dash/dash.hash
@@ -1,4 +1,7 @@
-# From http://gondor.apana.org.au/~herbert/dash/files/dash-0.5.12.tar.gz.sha512sum
-sha512  13bd262be0089260cbd13530a9cf34690c0abeb2f1920eb5e61be7951b716f9f335b86279d425dbfae56cbd49231a8fdffdff70601a5177da3d543be6fc5eb17  dash-0.5.12.tar.gz
+# From http://gondor.apana.org.au/~herbert/dash/files/dash-0.5.13.tar.gz.sha512sum
+# After checking pgp signature
+# using key 9F9D45FE50AE361530983792C7271D0A49B18BA7
+sha512  428de1f65ab77d5fee88bbf4ba8642d77abfda223a4ede423d09db9faa4f0347199b3be841d63b93a7ed68f714ef54ff41b2dc936e4b7ebb19b74499ed4e6a01  dash-0.5.13.tar.gz
 # Locally calculated
+sha256  fd8da121e306b27f59330613417b182b8844f11e269531cc4720bf523e3e06d7  dash-0.5.13.tar.gz
 sha256  254a7894923ff62e69184a991dcbccae97edee58a1105e8efbe78caf10595d72  COPYING
diff --git a/package/dash/dash.mk b/package/dash/dash.mk
index f030e4ec91..eb646e1a4f 100644
--- a/package/dash/dash.mk
+++ b/package/dash/dash.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DASH_VERSION = 0.5.12
+DASH_VERSION = 0.5.13
 DASH_SITE = http://gondor.apana.org.au/~herbert/dash/files
 DASH_LICENSE = BSD-3-Clause, GPL-2.0+ (mksignames.c)
 DASH_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

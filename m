Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70485C4332F
	for <buildroot@archiver.kernel.org>; Sat,  4 Nov 2023 20:26:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1B57340370;
	Sat,  4 Nov 2023 20:26:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1B57340370
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dt7cSptqs4z6; Sat,  4 Nov 2023 20:26:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 02ED0403C0;
	Sat,  4 Nov 2023 20:26:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 02ED0403C0
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 226DD1BF20B
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 20:25:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id ED7DA40273
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 20:25:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ED7DA40273
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7dd7x8PgpvJ6 for <buildroot@lists.busybox.net>;
 Sat,  4 Nov 2023 20:25:57 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B7F9B4033F
 for <buildroot@buildroot.org>; Sat,  4 Nov 2023 20:25:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B7F9B4033F
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A4A3386734; Sat,  4 Nov 2023 20:25:57 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 4 Nov 2023 21:24:33 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 61848605cd26d29f54c16de862aedba7cf334be4
X-Git-Newrev: 54561069652baf87cd814055c4ba5c71d9cc6ead
X-Patchwork-Hint: ignore
Message-Id: <20231104202557.A4A3386734@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mpg123: bump version to 1.32.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=54561069652baf87cd814055c4ba5c71d9cc6ead
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Removed patch which was applied upstream:
https://github.com/madebr/mpg123/commit/e1e6aa201a88d9d7f91c806b71270dd0013c6ca6

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/mpg123/0001-mpg123-buildfix.patch | 24 ------------------------
 package/mpg123/mpg123.hash                |  6 +++---
 package/mpg123/mpg123.mk                  |  2 +-
 3 files changed, 4 insertions(+), 28 deletions(-)

diff --git a/package/mpg123/0001-mpg123-buildfix.patch b/package/mpg123/0001-mpg123-buildfix.patch
deleted file mode 100644
index cc731ea967..0000000000
--- a/package/mpg123/0001-mpg123-buildfix.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
-Upstream: https://sourceforge.net/p/mpg123/bugs/353/
-
-diff -Nur mpg123-1.31.3.orig/src/libmpg123/getcpuflags.h mpg123-1.31.3/src/libmpg123/getcpuflags.h
---- mpg123-1.31.3.orig/src/libmpg123/getcpuflags.h	2023-03-15 09:02:58.000000000 +0100
-+++ mpg123-1.31.3/src/libmpg123/getcpuflags.h	2023-08-07 15:57:19.444106173 +0200
-@@ -44,6 +44,8 @@
- 
- unsigned int getcpuflags(struct cpuflags* cf);
- 
-+#if ((defined OPT_X86) || (defined OPT_X86_64) || (defined OPT_NEON) || (defined OPT_NEON64)) && (defined OPT_MULTI)
-+
- #ifdef WANT_GETCPUFLAGS
- #include <string.h>
- // Wrapper needed for ignorant clang memory sanitizer that chokes
-@@ -55,8 +57,6 @@
- }
- #endif
- 
--#if ((defined OPT_X86) || (defined OPT_X86_64) || (defined OPT_NEON) || (defined OPT_NEON64)) && (defined OPT_MULTI)
--
- // We really evaluate the CPU flags.
- #define OPT_CPU_FLAGS
- 
diff --git a/package/mpg123/mpg123.hash b/package/mpg123/mpg123.hash
index 39ded93fb9..0fe4699606 100644
--- a/package/mpg123/mpg123.hash
+++ b/package/mpg123/mpg123.hash
@@ -1,6 +1,6 @@
-# From https://sourceforge.net/projects/mpg123/files/mpg123/1.31.3/
-sha1  c41b98e4c5ac55a5b3787b5aa309a71a6d458145  mpg123-1.31.3.tar.bz2
+# From https://sourceforge.net/projects/mpg123/files/mpg123/1.32.3/
+sha1  3a94848a620db7917c757cb21e261c711e44618f  mpg123-1.32.3.tar.bz2
 # Locally calculated
-sha256  1ca77d3a69a5ff845b7a0536f783fee554e1041139a6b978f6afe14f5814ad1a  mpg123-1.31.3.tar.bz2
+sha256  2d9913a57d4ee8f497a182c6e82582602409782a4fb481e989feebf4435867b4  mpg123-1.32.3.tar.bz2
 # License file
 sha256  c22482728a634a8dfdb4ff72a96d4c1ed64cd8f3e79335c401751ac591609366  COPYING
diff --git a/package/mpg123/mpg123.mk b/package/mpg123/mpg123.mk
index 5ec5590267..4de5f99bdf 100644
--- a/package/mpg123/mpg123.mk
+++ b/package/mpg123/mpg123.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MPG123_VERSION = 1.31.3
+MPG123_VERSION = 1.32.3
 MPG123_SOURCE = mpg123-$(MPG123_VERSION).tar.bz2
 MPG123_SITE = https://downloads.sourceforge.net/project/mpg123/mpg123/$(MPG123_VERSION)
 MPG123_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

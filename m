Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DC9EC4708C
	for <buildroot@archiver.kernel.org>; Mon,  5 Dec 2022 12:22:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B4134408E5;
	Mon,  5 Dec 2022 12:22:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B4134408E5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bfY1bpjm7Ofd; Mon,  5 Dec 2022 12:21:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 98F28408CC;
	Mon,  5 Dec 2022 12:21:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 98F28408CC
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 46E681BF352
 for <buildroot@lists.busybox.net>; Mon,  5 Dec 2022 11:28:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 046B240570
 for <buildroot@lists.busybox.net>; Mon,  5 Dec 2022 11:26:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 046B240570
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MUUlqhadbQDB for <buildroot@lists.busybox.net>;
 Mon,  5 Dec 2022 11:26:13 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 44BE5408EF
 for <buildroot@buildroot.org>; Mon,  5 Dec 2022 11:26:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 44BE5408EF
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 42B7A85BA2; Mon,  5 Dec 2022 11:26:12 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 1 Dec 2022 22:09:02 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0d3c376bd8418ada72bda68818efff1d942db61b
X-Git-Newrev: 48bf3224880dd69ea7bdbb6d73e7b4a6042340ff
X-Patchwork-Hint: ignore
Message-Id: <20221205112612.42B7A85BA2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libpng: bump to version 1.6.39
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

commit: https://git.buildroot.net/buildroot/commit/?id=48bf3224880dd69ea7bdbb6d73e7b4a6042340ff
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libpng/0001-Disable-pngfix-and-png-fix-itxt.patch | 4 ++--
 package/libpng/libpng.hash                                | 8 ++++----
 package/libpng/libpng.mk                                  | 2 +-
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/libpng/0001-Disable-pngfix-and-png-fix-itxt.patch b/package/libpng/0001-Disable-pngfix-and-png-fix-itxt.patch
index d232e4d62f..d16bdb2b11 100644
--- a/package/libpng/0001-Disable-pngfix-and-png-fix-itxt.patch
+++ b/package/libpng/0001-Disable-pngfix-and-png-fix-itxt.patch
@@ -40,8 +40,8 @@ index a66f6aa..4e67782 100644
 -bin_PROGRAMS = pngfix$(EXEEXT) png-fix-itxt$(EXEEXT)
 +bin_PROGRAMS =
  @PNG_ARM_NEON_TRUE@am__append_2 = arm/arm_init.c\
- @PNG_ARM_NEON_TRUE@	arm/filter_neon.S arm/filter_neon_intrinsics.c
- 
+ @PNG_ARM_NEON_TRUE@	arm/filter_neon.S arm/filter_neon_intrinsics.c \
+ @PNG_ARM_NEON_TRUE@	arm/palette_neon_intrinsics.c
 -- 
 2.7.3
 
diff --git a/package/libpng/libpng.hash b/package/libpng/libpng.hash
index 34b0a8a8b6..c1f65c93af 100644
--- a/package/libpng/libpng.hash
+++ b/package/libpng/libpng.hash
@@ -1,6 +1,6 @@
-# From https://sourceforge.net/projects/libpng/files/libpng16/1.6.38/
-md5  122e6b7837811698563083b352bc8ca2  libpng-1.6.38.tar.xz
-sha1  60960ed110094843e5efa221df6a7d21614a4dba  libpng-1.6.38.tar.xz
+# From https://sourceforge.net/projects/libpng/files/libpng16/1.6.39/
+md5  aa1ae92e172417039bda072b702f6326  libpng-1.6.39.tar.xz
+sha1  3f2386d61eccae211ec4f57899e4ac2ca60d390b  libpng-1.6.39.tar.xz
 # Locally computed:
-sha256  b3683e8b8111ebf6f1ac004ebb6b0c975cd310ec469d98364388e9cedbfa68be  libpng-1.6.38.tar.xz
+sha256  1f4696ce70b4ee5f85f1e1623dc1229b210029fa4b7aee573df3e2ba7b036937  libpng-1.6.39.tar.xz
 sha256  dfe5a536b0e5a531f844fb9c101a3089aca60772a503893b8e15f9457e369960  LICENSE
diff --git a/package/libpng/libpng.mk b/package/libpng/libpng.mk
index 43b4f373f1..a18c36fe78 100644
--- a/package/libpng/libpng.mk
+++ b/package/libpng/libpng.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBPNG_VERSION = 1.6.38
+LIBPNG_VERSION = 1.6.39
 LIBPNG_SERIES = 16
 LIBPNG_SOURCE = libpng-$(LIBPNG_VERSION).tar.xz
 LIBPNG_SITE = http://downloads.sourceforge.net/project/libpng/libpng$(LIBPNG_SERIES)/$(LIBPNG_VERSION)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

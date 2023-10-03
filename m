Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C11EE75455
	for <buildroot@archiver.kernel.org>; Tue,  3 Oct 2023 12:32:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D9528420A9;
	Tue,  3 Oct 2023 12:32:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D9528420A9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TVv6LjWdPKzF; Tue,  3 Oct 2023 12:32:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9ED484212B;
	Tue,  3 Oct 2023 12:32:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9ED484212B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 594C11BF352
 for <buildroot@lists.busybox.net>; Tue,  3 Oct 2023 12:32:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2FBB98235A
 for <buildroot@lists.busybox.net>; Tue,  3 Oct 2023 12:32:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2FBB98235A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RTQF7gNFzqo5 for <buildroot@lists.busybox.net>;
 Tue,  3 Oct 2023 12:32:11 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2AC7382373
 for <buildroot@buildroot.org>; Tue,  3 Oct 2023 12:32:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2AC7382373
Received: from fli4l.lan.fli4l (p54a1b0e1.dip0.t-ipconnect.de [84.161.176.225])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id B85FCA4C00A8
 for <buildroot@buildroot.org>; Tue,  3 Oct 2023 14:32:08 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:44858)
 by fli4l.lan.fli4l with esmtp (Exim 4.96.1)
 (envelope-from <bernd@kuhls.net>) id 1qneZM-0000pY-1Z
 for buildroot@buildroot.org; Tue, 03 Oct 2023 14:32:08 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue,  3 Oct 2023 14:32:08 +0200
Message-Id: <20231003123208.2688289-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1696336328;
 bh=mb3jxXo/+Q0qUmyyrHwAp/C1HqTvtyFQXuD9lMysClY=;
 h=From:To:Subject:Date:From;
 b=crBYyiKmaTZiGexTQwS3mXYu52V4WF+s+/MCbC0rlq0D03lPPcivpFBfYCwW5kdnr
 HUlfLPY2Blj1AEu+nKnf841m3FARglwypDUMVNYwMJP+yiaZH9gqJvC3WJ8AtXDYWg
 BMqNBnGfMwLzAvX/HaMMEwdrDeZzrM0B6aH3e92yaPim3c4g/u6g0dBkwiSkuf05ep
 Jz8wWh0v5BrUPNYPd3O0lZHE1F0a0+Wf6vDQb6chivSMOsEHatnNC2jqpBIYWAhE8v
 l2pXdTIBVf4ukiqPnZaE20aop5spr1IlivWH99Ok/hK/bGJK0gaGZGi9VL2aznZnQZ
 bjX1jHeNv/byA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=crBYyiKm
Subject: [Buildroot] [PATCH 1/1] package/mpg123: bump version to 1.32.3
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

Removed patch which was applied upstream:
https://github.com/madebr/mpg123/commit/e1e6aa201a88d9d7f91c806b71270dd0013c6ca6

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/mpg123/0001-mpg123-buildfix.patch | 24 -----------------------
 package/mpg123/mpg123.hash                |  6 +++---
 package/mpg123/mpg123.mk                  |  2 +-
 3 files changed, 4 insertions(+), 28 deletions(-)
 delete mode 100644 package/mpg123/0001-mpg123-buildfix.patch

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
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

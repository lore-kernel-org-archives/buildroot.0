Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 202B8EB64DD
	for <buildroot@archiver.kernel.org>; Wed,  9 Aug 2023 08:41:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 965528230F;
	Wed,  9 Aug 2023 08:41:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 965528230F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QT8dX3jMZin5; Wed,  9 Aug 2023 08:41:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E65338149B;
	Wed,  9 Aug 2023 08:41:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E65338149B
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 11FC41BF3B0
 for <buildroot@lists.busybox.net>; Wed,  9 Aug 2023 08:41:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id ECDF541451
 for <buildroot@lists.busybox.net>; Wed,  9 Aug 2023 08:40:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ECDF541451
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mQ0toVhvywwz for <buildroot@lists.busybox.net>;
 Wed,  9 Aug 2023 08:40:58 +0000 (UTC)
X-Greylist: delayed 305 seconds by postgrey-1.37 at util1.osuosl.org;
 Wed, 09 Aug 2023 08:40:58 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3FFCC400BB
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.13])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3FFCC400BB
 for <buildroot@buildroot.org>; Wed,  9 Aug 2023 08:40:58 +0000 (UTC)
Received: from evilbit.green-communications.fr ([92.154.77.116]) by
 mrelayeu.kundenserver.de (mreue107 [213.165.67.119]) with ESMTPSA (Nemesis)
 id 1MHFwM-1qY6dy1ocy-00DEFL; Wed, 09 Aug 2023 10:35:50 +0200
From: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
To: buildroot@buildroot.org
Date: Wed,  9 Aug 2023 10:33:28 +0200
Message-Id: <20230809083328.1348-1-nicolas.cavallari@green-communications.fr>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Provags-ID: V03:K1:wYzjpgHvbU1QMCKofi3qr6lT6K9JKdcrv42ACgG8Ld6TFqeg0P7
 cWrai3nM70dd49x3VN5Q/Z8DwyzBM2Bt7duaYJkUDM3yW4N+P7e+Q8hhco7WL4fIBGU3SuO
 5SbVFS87M9g/L2DLvbXBg7+VHW2zJ06s4c24TZ3dM/EqdYxb7756mvLT+nTYMSZXGVtgaU0
 eenyWK5rEqptjXT8dYi8A==
UI-OutboundReport: notjunk:1;M01:P0:cHttQ3qhI8Q=;vuDmpGrWO1iG8JbMcgQssULN/06
 zfUkkDNF8E2SbyURzYxdfTg9YTWrV8Svl7pvXjzxwZqWri5mvnSCed/AgL2SnLreDzWS6y///
 tc89tMc2/NDAdtBHArH5hY3hPJyWdP6wcHFPG/NqdqjuQvK/mGOCGGfxOw2RQ1V3lz5Mk5xwj
 SX7lvyRZNpM61ad9bL40+mnrjQGu+BtsrjY+gKAyWGmBEp3c+cs5NSRaol0ys5RIOHOc6zJ6n
 TZAaKUHABooqwKMSm7zmNu5w9srT55q70JEn1ZRPj7fb6LNgpFlJpQiTpNJdepzUH1QdJAnhT
 o4XCGFFpmp73OiXzFHfP1bNyh9egZ1S0OT4xwN1puANUs5eesrFZpb4UWG9z4CsEpaxSb3kZK
 kg2EfVYj0Cr1TvqdMjgzNTUrQm19CJJtaIBTlas2Fgi7rN2kisYvcOSkOrSKs8qo0L6SvyyOK
 3dJdzS3k/4FXK0Cz+CxMe5tyjADsrGSEgXvIdX7Umy3GgiiPntFQoqKu+xoo4JINlvuYWDKvR
 /uZ1IHWT7m7Zj5Yqt8LDe27ccTXtXKdh5X93MOySgJPX34uxcNVpEdh80/xFQmN1zkwK+qSiw
 S4JRaqAKvGgn+lpDnVbhyDiCK1MH9R9mpzoqKVLSx+tOSDLjNmr6UoK7rMvg49kmDVPXwCGsB
 0jgiaixtKnE6U9nvzHSZESvk2wuf7aRxj/Naw34XoyqZ+0KGWZjYw/TBSuo6stygvncsVJ1Aj
 n3BJmggCcB+h96nzeZphj8zeg91lkb6bET7D1sfY3k1f+PDG5pqac0OlFxlyQm/Cf3aA7WCiO
 UXGDTvsTCrtcmUl4rUorRns7cARutJGt2mw/57RiDZjzF1NWFzWGCHvzkdAnUqsEIj3gVpMOI
 ALLFeyse599yHuw==
Subject: [Buildroot] [PATCH 1/1] package/libgit2: bump to 1.7.0
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

This version makes it explicit that it uses libxdiff, a library which is
not maintained upstream since 2008.  It now have numerous forks, none of
them sticking out.  For now, use the one which is bundled in the libgit2
sources.
---
 package/libgit2/libgit2.hash | 2 +-
 package/libgit2/libgit2.mk   | 6 ++++--
 2 files changed, 5 insertions(+), 3 deletions(-)

Tested with test-pkg -a with 12 configurations
540 builds, 142 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed

diff --git a/package/libgit2/libgit2.hash b/package/libgit2/libgit2.hash
index 4dd6519ca3..1997c3ba8e 100644
--- a/package/libgit2/libgit2.hash
+++ b/package/libgit2/libgit2.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  d25866a4ee275a64f65be2d9a663680a5cf1ed87b7ee4c534997562c828e500d  libgit2-1.6.4.tar.gz
+sha256  d9d0f84a86bf98b73e68997f5c1543cc5067d0ca9c7a5acaba3e8d117ecefef3  libgit2-1.7.0.tar.gz
 sha256  6f3c2cd59b057e366c1acc073b038135c52d77892bb33bd4d931c5369d3f062b  COPYING
diff --git a/package/libgit2/libgit2.mk b/package/libgit2/libgit2.mk
index 9ddf2374bb..93505f7d85 100644
--- a/package/libgit2/libgit2.mk
+++ b/package/libgit2/libgit2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBGIT2_VERSION = 1.6.4
+LIBGIT2_VERSION = 1.7.0
 LIBGIT2_SITE = $(call github,libgit2,libgit2,v$(LIBGIT2_VERSION))
 LIBGIT2_LICENSE = \
 	GPL-2.0 with linking exception, \
@@ -12,7 +12,8 @@ LIBGIT2_LICENSE = \
 	BSD-3-Clause (sha256), \
 	wildmatch license (wildmatch), \
 	CC0-1.0 (xoroshiro256), \
-	BSD-2-Clause (basename_r)
+	BSD-2-Clause (basename_r), \
+	LGPL-2.1+ (libxdiff)
 LIBGIT2_LICENSE_FILES = COPYING
 LIBGIT2_CPE_ID_VENDOR = libgit2_project
 LIBGIT2_INSTALL_STAGING = YES
@@ -23,6 +24,7 @@ LIBGIT2_CONF_OPTS = \
 	-DREGEX_BACKEND=regcomp \
 	-DUSE_HTTP_PARSER=system \
 	-DUSE_NTLMCLIENT=OFF \
+	-DUSE_XDIFF=builtin \
 	-DUSE_THREADS=$(if $(BR2_TOOLCHAIN_HAS_THREADS),ON,OFF)
 
 LIBGIT2_SUPPORTS_IN_SOURCE_BUILD = NO
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

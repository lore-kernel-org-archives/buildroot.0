Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A47BCD5BD0
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 13:04:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0ADA342E18;
	Sat, 30 May 2026 13:04:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I9zwp52WNaFr; Sat, 30 May 2026 13:04:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2A35542E26
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780146281;
	bh=4O0rb0G2wmc+ndfuacW7fzllm5Rix7mHG8yHzqj2EN4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=AHLCxgwBtNZ+SxwNjhZ6mM+0VO6OQ45dZOdowkC/YN06vkbHgsNSuaAVPrnxH/GYn
	 Y7y6T/IF7s8jVUD++wLyOw+aQT8x21oj+96mn9A6+BOBF+jpEPhqI2f8jsz9XxWCyt
	 yV6bk/Bv2QU+Sv8JcppnSSRMtIF1Tu6LtHW8omR8hQAQggciSqzi9P/nuc/9Ge0O3/
	 hv5zZJCt2//9y+CwPjaAP5FVY1I+fMrO8USDJ3D2AHQ52gysDrejfv4w0tMJe4TfYd
	 guhYlEzjcUYfgd5cxmO7jHCmVUgtUj3GbguTOLdL0SMKAIX66D08jDbNzib51Qk49e
	 8Zdn8cdv0GEcQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2A35542E26;
	Sat, 30 May 2026 13:04:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id A81C4F4
 for <buildroot@buildroot.org>; Sat, 30 May 2026 13:04:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 98E2C42E26
 for <buildroot@buildroot.org>; Sat, 30 May 2026 13:04:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mSAl2aviQyWT for <buildroot@buildroot.org>;
 Sat, 30 May 2026 13:04:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C086742E18
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C086742E18
 for <buildroot@buildroot.org>; Sat, 30 May 2026 13:04:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B4E48874FD; Sat, 30 May 2026 13:04:24 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 30 May 2026 13:05:38 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 7b977650468d0b296d9d9fcc96ef929adc53eed7
X-Git-Newrev: 9233cf95933f69fe3e3f4aa23fbb26da148e09cc
X-Patchwork-Hint: ignore
Message-Id: <20260530130424.B4E48874FD@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/swipl: bump version to
 10.0.2
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/9233cf95933f69fe3e3f4aa23fbb26da148e09cc
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/next

For change log since version 9.2.9, see:
https://www.swi-prolog.org/ChangeLog?branch=stable&from=9.2.9&to=10.0.2

This new version can no longer build in the source tree. Therefore,
this commit adds SWIPL_SUPPORTS_IN_SOURCE_BUILD = NO. Also, the target
swipl needs the host-swipl binary. It is searched by the cmake script.
This commit changes SWIPL_NATIVE_FRIEND variable to point to the
out-of-source build directory.

swipl has now a stricter ABI check of its prolog library bytecode
compiled files, compared to its builtin expected ABI:
https://github.com/SWI-Prolog/swipl/blob/V10.0.2/src/pl-init.c#L263

When cross-compiling, swipl is built on one side, and library files
are built with the host-swipl. The ABI string of the host-swipl and
target swipl must match. If not matching, swipl fail to start at
runtime with the error:

    FATAL: could not find SWI-Prolog home
      Tried source: compiled in
        Found /usr/lib/swipl: ABI mismatch

This ABI string includes a signature of builtin modules. See:
https://github.com/SWI-Prolog/swipl/blob/V10.0.2/src/pl-init.c#L1653
https://github.com/SWI-Prolog/swipl/blob/V10.0.2/src/pl-ext.c#L330

The swipl ncurses support is made with one those builtin module.
ncurses development files are likely present on host and likely not
enabled or needed on target, hence producing a different ABI
signature. For that reason, this commit disables ncurses on both the
host and target.

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/swipl/swipl.hash | 2 +-
 package/swipl/swipl.mk   | 8 ++++++--
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/package/swipl/swipl.hash b/package/swipl/swipl.hash
index efc3aa963f..4dada84df5 100644
--- a/package/swipl/swipl.hash
+++ b/package/swipl/swipl.hash
@@ -1,4 +1,4 @@
 # From https://www.swi-prolog.org/download/stable
-sha256  53f428e2d9bbdf30e53b06c9c42def9a13ff82fc36a111d410fc8b0bc889ee2d  swipl-9.2.9.tar.gz
+sha256  e42cc098f7b8a6051c4f79a99b55162d467098aba60f69649bdc7583f0734b57  swipl-10.0.2.tar.gz
 # Locally calculated
 sha256  770594d0f4463b71f1485f00e4bc5cf4b6f667d62ef6bc9bde2fee236541992a  LICENSE
diff --git a/package/swipl/swipl.mk b/package/swipl/swipl.mk
index 20faaefe7c..801e5b800a 100644
--- a/package/swipl/swipl.mk
+++ b/package/swipl/swipl.mk
@@ -4,11 +4,13 @@
 #
 ################################################################################
 
-SWIPL_VERSION = 9.2.9
+SWIPL_VERSION = 10.0.2
 SWIPL_SITE = https://www.swi-prolog.org/download/stable/src
 SWIPL_LICENSE = BSD-2-Clause
 SWIPL_LICENSE_FILES = LICENSE
 
+SWIPL_SUPPORTS_IN_SOURCE_BUILD = NO
+
 HOST_SWIPL_DEPENDENCIES = host-zlib
 
 SWIPL_DEPENDENCIES = host-swipl zlib
@@ -16,6 +18,7 @@ SWIPL_DEPENDENCIES = host-swipl zlib
 # A host-swipl is needed to compile the target prolog boot
 # boot.prl file.
 HOST_SWIPL_CONF_OPTS = \
+	-DHAVE_CURSES_H=0 \
 	-DBUILD_PDF_DOCUMENTATION=OFF \
 	-DSWIPL_PACKAGES=OFF \
 	-DUSE_GMP=OFF \
@@ -29,12 +32,13 @@ HOST_SWIPL_CONF_OPTS = \
 # the path set to this variable. Therefore, we cannot use the host
 # "swipl" binary installed in $(HOST_DIR)/usr/bin.
 SWIPL_CONF_OPTS = \
+	-DHAVE_CURSES_H=0 \
 	-DBUILD_PDF_DOCUMENTATION=OFF \
 	-DHAVE_WEAK_ATTRIBUTE=1 \
 	-DLLROUND_OK=1 \
 	-DMODF_OK=1 \
 	-DQSORT_R_GNU=1 \
-	-DSWIPL_NATIVE_FRIEND=$(HOST_SWIPL_SRCDIR) \
+	-DSWIPL_NATIVE_FRIEND=$(HOST_SWIPL_BUILDDIR) \
 	-DSWIPL_PACKAGES=OFF \
 	-DUSE_TCMALLOC=OFF \
 	-DCMAKE_CXX_COMPILER=true
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

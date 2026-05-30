Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FDB6CD8C92
	for <buildroot@archiver.kernel.org>; Tue,  9 Jun 2026 13:04:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 58FD885B4E;
	Tue,  9 Jun 2026 13:04:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fri9_Q9cFvwJ; Tue,  9 Jun 2026 13:04:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 21E9F85B2A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781010243;
	bh=sKnOesO52N1Eqha4Lr4P/oPcEZletJPgBuWWlu89hvw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=q5ti+UPNJSHXwfn5vpMXGehKLj0G9hTI4/Mp3AlmbBkWBiOdZ1ZrGGth9RMAShnRG
	 pICnARVCe8a68qHIVs4UQOa+Zra/6VQAeE+LyO3LQEbTgsaKHHUNJ6bjd5uLa0o/cA
	 naTLrGqvl8WAwqWfwW6uFxFJrAh5dFWMTnqAK+8i4UNuWCeRAK1Om63p4jmZCYLm7k
	 Q+wip8VgCGhupnkzKLfu9aQt5bErxs3aLvi386jamx5dTxmtlZ9XBYKAaL5+FVejzQ
	 oxfJ9JT5Tf3CrQMcuyLHDJaYn3L5L1yEkLDp3XWz1hvq8hOKHMsn9i+KFlkUCf75oP
	 nJ+FWcWBcIzDA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 21E9F85B2A;
	Tue,  9 Jun 2026 13:04:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8AF34190
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:02:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 77BD7426DB
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OyTKuMk9G87I for <buildroot@buildroot.org>;
 Tue,  9 Jun 2026 13:01:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 86CAC426E8
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 86CAC426E8
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C12F287E7E; Tue,  9 Jun 2026 13:01:21 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 30 May 2026 13:05:38 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7b977650468d0b296d9d9fcc96ef929adc53eed7
X-Git-Newrev: 9233cf95933f69fe3e3f4aa23fbb26da148e09cc
X-Patchwork-Hint: ignore
Message-Id: <20260609130121.C12F287E7E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/swipl: bump version to 10.0.2
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
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

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

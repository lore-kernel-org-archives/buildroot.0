Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10890CCD1BF
	for <buildroot@archiver.kernel.org>; Fri, 24 Oct 2025 21:33:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D22C440AA6;
	Fri, 24 Oct 2025 21:33:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U-i5ow3Wf4uK; Fri, 24 Oct 2025 21:33:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0763240AB5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0763240AB5;
	Fri, 24 Oct 2025 21:33:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id A848543F
 for <buildroot@buildroot.org>; Fri, 24 Oct 2025 21:33:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 95D8D60DDF
 for <buildroot@buildroot.org>; Fri, 24 Oct 2025 21:33:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ajh6awaeJ0ZH for <buildroot@buildroot.org>;
 Fri, 24 Oct 2025 21:33:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D1B64605F1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D1B64605F1
 for <buildroot@buildroot.org>; Fri, 24 Oct 2025 21:33:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CC6B88781F; Fri, 24 Oct 2025 21:33:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 24 Oct 2025 23:18:55 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 879c9f0fc60ca3036c1ec115904d9441bf9e72a2
X-Git-Newrev: c555b6565f2747047603dc8022f81b7ea14b4890
X-Patchwork-Hint: ignore
Message-Id: <20251024213336.CC6B88781F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libbsd: bump version to 0.12.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=c555b6565f2747047603dc8022f81b7ea14b4890
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://archive.hadrons.org/software/libbsd/libbsd-0.11.8.announce
https://archive.hadrons.org/software/libbsd/libbsd-0.12.0.announce
https://archive.hadrons.org/software/libbsd/libbsd-0.12.1.announce
https://archive.hadrons.org/software/libbsd/libbsd-0.12.2.announce

Update hash of license file, which has changed due to:
- Copyright year updates.
- Switch arc4random(3bsd) man page from OpenBSD to NetBSD. This gets
  rid of the last BSD-4-clause licensed file in the project.
- Remove written-by attribution.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
[Julien:
 - fix upstream hash url in hash file comment
 - remove BSD-4-Clause from _LICENSE
]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libbsd/libbsd.hash | 8 ++++----
 package/libbsd/libbsd.mk   | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/libbsd/libbsd.hash b/package/libbsd/libbsd.hash
index 8b1af44758..d125c1059e 100644
--- a/package/libbsd/libbsd.hash
+++ b/package/libbsd/libbsd.hash
@@ -1,5 +1,5 @@
-# From https://archive.hadrons.org/software/libbsd/libbsd-0.11.7.announce
-sha256  9baa186059ebbf25c06308e9f991fda31f7183c0f24931826d83aa6abd8a0261  libbsd-0.11.7.tar.xz
-sha512  51fda4724f41dd8a4628afd58c21236a7588d9045e337e06eeabf83805a9aaaa53705441ca901ad11f1c65f18e881523bdc97721a7d3d6a5cced27f2450d09a2  libbsd-0.11.7.tar.xz
+# From https://archive.hadrons.org/software/libbsd/libbsd-0.12.2.announce
+sha256  b88cc9163d0c652aaf39a99991d974ddba1c3a9711db8f1b5838af2a14731014  libbsd-0.12.2.tar.xz
+sha512  ce43e4f0486d5f00d4a8119ee863eaaa2f968cae4aa3d622976bb31ad601dfc565afacef7ebade5eba33fff1c329b5296c6387c008d1e1805d878431038f8b21  libbsd-0.12.2.tar.xz
 # Locally computed
-sha256  7aab3a07716d31ca72e66c1073ef8a0fa0be0daa5df7c3b2cc0c668589142336  COPYING
+sha256  978426553ab7b9cfb4503d98e578a77b8c3142c099100aa9791fd21be5a95f97  COPYING
diff --git a/package/libbsd/libbsd.mk b/package/libbsd/libbsd.mk
index 27937c4611..557b49fca6 100644
--- a/package/libbsd/libbsd.mk
+++ b/package/libbsd/libbsd.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-LIBBSD_VERSION = 0.11.7
+LIBBSD_VERSION = 0.12.2
 LIBBSD_SOURCE = libbsd-$(LIBBSD_VERSION).tar.xz
 LIBBSD_SITE = https://libbsd.freedesktop.org/releases
-LIBBSD_LICENSE = BSD-2-Clause, BSD-3-Clause, BSD-4-Clause, BSD-5-Clause, \
+LIBBSD_LICENSE = BSD-2-Clause, BSD-3-Clause, BSD-5-Clause, \
 		MIT, ISC, Beerware
 LIBBSD_LICENSE_FILES = COPYING
 LIBBSD_CPE_ID_VENDOR = freedesktop
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

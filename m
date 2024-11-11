Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B5C3D3ABF5
	for <buildroot@archiver.kernel.org>; Mon, 11 Nov 2024 20:27:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C2B8A80DB1;
	Mon, 11 Nov 2024 20:27:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PSy2s56GJ3I6; Mon, 11 Nov 2024 20:27:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B604580E23
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B604580E23;
	Mon, 11 Nov 2024 20:27:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id E5948DB1
 for <buildroot@buildroot.org>; Mon, 11 Nov 2024 20:27:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9F99840131
 for <buildroot@buildroot.org>; Mon, 11 Nov 2024 20:27:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1bOqIRVpCoLU for <buildroot@buildroot.org>;
 Mon, 11 Nov 2024 20:27:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9578A40155
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9578A40155
 for <buildroot@buildroot.org>; Mon, 11 Nov 2024 20:27:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8095786116; Mon, 11 Nov 2024 20:27:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 11 Nov 2024 21:25:26 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5456830db9d1e897b38195eb8e2933f4478d71d4
X-Git-Newrev: 77fcce23c6d91ed492fac35a215af1bf46ad34a3
X-Patchwork-Hint: ignore
Message-Id: <20241111202736.8095786116@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/findutils: bump version to 4.10.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=77fcce23c6d91ed492fac35a215af1bf46ad34a3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For release announce, see:
https://lists.gnu.org/archive/html/info-gnu/2024-07/msg00002.html

This commit also updates the hash file comment, to use the sha256 hash
published in the release announce, to provide the signature URL and the
pgp key id used for the signature verification.

See the gnulib documentation for details [1]. Contrary to what the
option name might suggest, it doesn't really disable Y2038 support,
but only the check that the system is Y2038 compliant. So even with
--disable-year2038, if the system is Y2038 compliant (uses a 64-bit
arch, uses the musl C library, or uses the glibc C library with
BR2_TIME_BITS_64=y), findutils will be Y2038 compliant.

[1] https://www.gnu.org/software/gnulib/manual/html_node/Avoiding-the-year-2038-problem.html

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/findutils/findutils.hash | 7 +++++--
 package/findutils/findutils.mk   | 3 ++-
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/package/findutils/findutils.hash b/package/findutils/findutils.hash
index 0284c0e7b2..a431827784 100644
--- a/package/findutils/findutils.hash
+++ b/package/findutils/findutils.hash
@@ -1,5 +1,8 @@
-# Locally calculated after checking pgp signature
-sha256  a2bfb8c09d436770edc59f50fa483e785b161a3b7b9d547573cb08065fd462fe  findutils-4.9.0.tar.xz
+# From: https://lists.gnu.org/archive/html/info-gnu/2024-07/msg00002.html
+# After checking pgp signature
+# https://ftp.gnu.org/pub/gnu/findutils/findutils-4.10.0.tar.xz.sig
+# with key A5189DB69C1164D33002936646502EF796917195
+sha256  1387e0b67ff247d2abde998f90dfbf70c1491391a59ddfecb8ae698789f0a4f5  findutils-4.10.0.tar.xz
 
 # Hash for license file
 sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  COPYING
diff --git a/package/findutils/findutils.mk b/package/findutils/findutils.mk
index 9731a35047..ad1fbdd6c6 100644
--- a/package/findutils/findutils.mk
+++ b/package/findutils/findutils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FINDUTILS_VERSION = 4.9.0
+FINDUTILS_VERSION = 4.10.0
 FINDUTILS_SOURCE = findutils-$(FINDUTILS_VERSION).tar.xz
 FINDUTILS_SITE = $(BR2_GNU_MIRROR)/findutils
 FINDUTILS_LICENSE = GPL-3.0+
@@ -14,6 +14,7 @@ FINDUTILS_CONF_ENV = \
 	gl_cv_func_stdin=yes \
 	ac_cv_func_working_mktime=yes \
 	gl_cv_func_wcwidth_works=yes
+FINDUTILS_CONF_OPTS = --disable-year2038
 
 ifeq ($(BR2_PACKAGE_LIBSELINUX),y)
 FINDUTILS_DEPENDENCIES += libselinux
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

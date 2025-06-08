Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8248DC5AD49
	for <buildroot@archiver.kernel.org>; Sun,  8 Jun 2025 13:48:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 48D57813A3;
	Sun,  8 Jun 2025 13:48:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9Tn9vfA8hNGw; Sun,  8 Jun 2025 13:48:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6A26D810B9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6A26D810B9;
	Sun,  8 Jun 2025 13:48:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1E2FB1A4
 for <buildroot@buildroot.org>; Sun,  8 Jun 2025 13:48:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 82D7C60B6F
 for <buildroot@buildroot.org>; Sun,  8 Jun 2025 13:48:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZBAZZ-Gf8Y06 for <buildroot@buildroot.org>;
 Sun,  8 Jun 2025 13:48:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BFC0560DDF
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id BFC0560DDF
 for <buildroot@buildroot.org>; Sun,  8 Jun 2025 13:48:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B0D5787A99; Sun,  8 Jun 2025 13:48:25 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 8 Jun 2025 15:43:17 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 992cea79eb336d9989c004b25e04d75281f8354a
X-Git-Newrev: 26c4821638eff99f8676b3072e5c9bb3267562b7
X-Patchwork-Hint: ignore
Message-Id: <20250608134825.B0D5787A99@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/diffutils: bump
 version to 3.12
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=26c4821638eff99f8676b3072e5c9bb3267562b7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Release notes:
Version 3.12 - https://lists.gnu.org/archive/html/info-gnu/2025-04/msg00005.html
Version 3.11 - https://lists.gnu.org/archive/html/info-gnu/2025-02/msg00003.html

Fix the following error seen during cross-compilation error by assuming that
strcasecmp function is always available.
- "configure: error: cannot run test program while cross compiling"

Signed-off-by: Kadambini Nema <kadambini.nema@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/diffutils/diffutils.hash | 6 +++---
 package/diffutils/diffutils.mk   | 3 ++-
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/diffutils/diffutils.hash b/package/diffutils/diffutils.hash
index df160a124d..81a3bdd1ff 100644
--- a/package/diffutils/diffutils.hash
+++ b/package/diffutils/diffutils.hash
@@ -1,6 +1,6 @@
-# From https://lists.gnu.org/archive/html/info-gnu/2023-05/msg00009.html
-sha1  c16a9cf107ad1f0f791b6d00852dc5e961c1c451  diffutils-3.10.tar.xz
+# From https://lists.gnu.org/archive/html/info-gnu/2025-04/msg00005.html
+sha1  c2f302726d2709c6881c4657430a671abe5eedfa  diffutils-3.12.tar.xz
 # Locally calculated after checking pgp signature
-sha256  90e5e93cc724e4ebe12ede80df1634063c7a855692685919bfe60b556c9bd09e  diffutils-3.10.tar.xz
+sha256  7c8b7f9fc8609141fdea9cece85249d308624391ff61dedaf528fcb337727dfd  diffutils-3.12.tar.xz
 # Locally calculated
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/diffutils/diffutils.mk b/package/diffutils/diffutils.mk
index 1119266863..8ab74ce583 100644
--- a/package/diffutils/diffutils.mk
+++ b/package/diffutils/diffutils.mk
@@ -4,13 +4,14 @@
 #
 ################################################################################
 
-DIFFUTILS_VERSION = 3.10
+DIFFUTILS_VERSION = 3.12
 DIFFUTILS_SOURCE = diffutils-$(DIFFUTILS_VERSION).tar.xz
 DIFFUTILS_SITE = $(BR2_GNU_MIRROR)/diffutils
 DIFFUTILS_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
 DIFFUTILS_LICENSE = GPL-3.0+
 DIFFUTILS_LICENSE_FILES = COPYING
 DIFFUTILS_CPE_ID_VENDOR = gnu
+DIFFUTILS_CONF_ENV += gl_cv_func_strcasecmp_works=yes
 
 # Since glibc >= 2.26, don't try to use getopt_long replacement bundled
 # with diffutils. It will conflict with the one from glibc.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

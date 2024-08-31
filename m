Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A1D5CD13DD
	for <buildroot@archiver.kernel.org>; Sat, 31 Aug 2024 17:13:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1295284107;
	Sat, 31 Aug 2024 17:13:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wJoKLckPsW3b; Sat, 31 Aug 2024 17:13:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4626184161
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4626184161;
	Sat, 31 Aug 2024 17:13:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BB97B1BF5E6
 for <buildroot@lists.busybox.net>; Sat, 31 Aug 2024 17:12:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5B44141963
 for <buildroot@lists.busybox.net>; Sat, 31 Aug 2024 17:12:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eYL2BDVnZYWK for <buildroot@lists.busybox.net>;
 Sat, 31 Aug 2024 17:12:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A321141988
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A321141988
 for <buildroot@buildroot.org>; Sat, 31 Aug 2024 17:12:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9EC1A867D4; Sat, 31 Aug 2024 17:12:28 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 31 Aug 2024 19:10:55 +0200
X-Git-Refname: refs/heads/2024.05.x
X-Git-Oldrev: a36740decfdc67b9ee5c0efd991e8b20e097454f
X-Git-Newrev: b22f174148d3ff2a824bd71abb0d1100b1624f36
X-Patchwork-Hint: ignore
Message-Id: <20240831171228.9EC1A867D4@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.05.x] package/quotatool: bump
 to version 1.6.4
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

commit: https://git.buildroot.net/buildroot/commit/?id=b22f174148d3ff2a824bd71abb0d1100b1624f36
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.05.x

- Switch site to get latest release
- Send patch upstream
- This bump will fix the following build failure with gcc >= 14:

  src/main.c: In function 'main':
  src/main.c:211:17: error: implicit declaration of function 'quota_reset_grace'; did you mean 'xfs_reset_grace'? [-Wimplicit-function-declaration]
    211 |           if (! quota_reset_grace(quota, (argdata->block_reset ? GRACE_BLOCK : GRACE_INODE)))
        |                 ^~~~~~~~~~~~~~~~~
        |                 xfs_reset_grace

https://github.com/ekenberg/quotatool/blob/v1.6.4/ChangeLog

Fixes:
 - http://autobuild.buildroot.org/results/1855bc61fb231fadab77840dcd7ef75c414fe5be

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 940d2ccfbb488acb45fb106e41ae5f0b06a116aa)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .checkpackageignore                                                   | 1 -
 .../quotatool/0001-fix-missing-__P-definition-for-musl-compile.patch  | 1 +
 package/quotatool/quotatool.hash                                      | 2 +-
 package/quotatool/quotatool.mk                                        | 4 ++--
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index f643e1ef87..07cc5a5c11 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1299,7 +1299,6 @@ package/qt5cinex/0001-Fix-execution-problem-with-Qt5.3.patch lib_patch.Upstream
 package/quagga/0001-fix-ipctl-forwarding.patch lib_patch.Upstream
 package/quagga/0002-lib-prefix.h-fix-build-with-gcc-10.patch lib_patch.Upstream
 package/quagga/0003-Fix-build-with-gcc-10.patch lib_patch.Upstream
-package/quotatool/0001-fix-missing-__P-definition-for-musl-compile.patch lib_patch.Upstream
 package/racehound/0001-Fix-module-install-path-lib-instead-of-usr-lib-prefi.patch lib_patch.Upstream
 package/rapidxml/0001-ensure-internal-print-operations-are-declared-before.patch lib_patch.Upstream
 package/raspberrypi-usbboot/0001-Makefile-allow-passing-CFLAGS-LDFLAGS.patch lib_patch.Upstream
diff --git a/package/quotatool/0001-fix-missing-__P-definition-for-musl-compile.patch b/package/quotatool/0001-fix-missing-__P-definition-for-musl-compile.patch
index 927e62ba8c..534c7fe945 100644
--- a/package/quotatool/0001-fix-missing-__P-definition-for-musl-compile.patch
+++ b/package/quotatool/0001-fix-missing-__P-definition-for-musl-compile.patch
@@ -15,6 +15,7 @@ Fixes:
                  ^~~
 
 Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+Upstream: https://github.com/ekenberg/quotatool/pull/28
 ---
  src/linux/linux_quota.h | 1 +
  1 file changed, 1 insertion(+)
diff --git a/package/quotatool/quotatool.hash b/package/quotatool/quotatool.hash
index d41fd4ed1b..9ce9ceaec1 100644
--- a/package/quotatool/quotatool.hash
+++ b/package/quotatool/quotatool.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  e53adc480d54ae873d160dc0e88d78095f95d9131e528749fd982245513ea090  quotatool-1.6.2.tar.gz
+sha256  ef6b0494c505278ae140d1e105417d73703b4b9e08a1ee1f95dca1e0c19497b7  quotatool-1.6.4.tar.gz
 
 # Hash for license files:
 sha256  94686eeb98a40edc64106c6f8644068d8a08816a510a3cde75e50f1bf470564d  COPYING
diff --git a/package/quotatool/quotatool.mk b/package/quotatool/quotatool.mk
index 7b63c01316..5a60ff7bc1 100644
--- a/package/quotatool/quotatool.mk
+++ b/package/quotatool/quotatool.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-QUOTATOOL_VERSION = 1.6.2
-QUOTATOOL_SITE = http://quotatool.ekenberg.se
+QUOTATOOL_VERSION = 1.6.4
+QUOTATOOL_SITE = $(call github,ekenberg,quotatool,v$(QUOTATOOL_VERSION))
 QUOTATOOL_LICENSE = GPL-2.0
 QUOTATOOL_LICENSE_FILES = COPYING
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

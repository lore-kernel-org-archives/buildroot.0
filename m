Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C17D9C3DA61
	for <buildroot@archiver.kernel.org>; Wed, 24 Jul 2024 16:18:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5AE5040DFC;
	Wed, 24 Jul 2024 16:18:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 518gpGM-cKnQ; Wed, 24 Jul 2024 16:18:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E386340DDC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E386340DDC;
	Wed, 24 Jul 2024 16:18:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B3B4E1BF29C
 for <buildroot@lists.busybox.net>; Wed, 24 Jul 2024 16:18:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9FE5340316
 for <buildroot@lists.busybox.net>; Wed, 24 Jul 2024 16:18:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gHFeJC41XlLu for <buildroot@lists.busybox.net>;
 Wed, 24 Jul 2024 16:18:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 72473402B0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 72473402B0
 for <buildroot@buildroot.org>; Wed, 24 Jul 2024 16:18:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5765B87421; Wed, 24 Jul 2024 16:18:11 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 23 Jul 2024 23:17:28 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d79f40dbbe98983bc657d4c82d46b38b8283351b
X-Git-Newrev: 940d2ccfbb488acb45fb106e41ae5f0b06a116aa
X-Patchwork-Hint: ignore
Message-Id: <20240724161811.5765B87421@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/quotatool: bump to version 1.6.4
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

commit: https://git.buildroot.net/buildroot/commit/?id=940d2ccfbb488acb45fb106e41ae5f0b06a116aa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
---
 .checkpackageignore                                                   | 1 -
 .../quotatool/0001-fix-missing-__P-definition-for-musl-compile.patch  | 1 +
 package/quotatool/quotatool.hash                                      | 2 +-
 package/quotatool/quotatool.mk                                        | 4 ++--
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 53b55fb993..b84fa90bbd 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1186,7 +1186,6 @@ package/qt5cinex/0001-Fix-execution-problem-with-Qt5.3.patch lib_patch.Upstream
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

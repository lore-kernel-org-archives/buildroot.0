Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05242D13572
	for <buildroot@archiver.kernel.org>; Sun, 27 Oct 2024 18:41:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B43FA40202;
	Sun, 27 Oct 2024 18:41:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8aCRlqw9KF9P; Sun, 27 Oct 2024 18:41:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6A6C740169
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6A6C740169;
	Sun, 27 Oct 2024 18:41:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 039F8AEE
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 18:41:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2006140554
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 18:41:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VKRbrOQcHpVd for <buildroot@buildroot.org>;
 Sun, 27 Oct 2024 18:41:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F010D4055A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id F010D4055A
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 18:41:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EC5528424E; Sun, 27 Oct 2024 18:41:08 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 27 Oct 2024 19:14:28 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a57d613fd3694ae9e6c7a10b2b88b7bb277128ed
X-Git-Newrev: d52ba28fbe40e42ccf68c50ec12f04ce9fde7734
X-Patchwork-Hint: ignore
Message-Id: <20241027184108.EC5528424E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/monit: security bump version to
 5.34.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=d52ba28fbe40e42ccf68c50ec12f04ce9fde7734
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog:
https://bitbucket.org/tildeslash/monit/src/monit-5-34-2/CHANGES

Fixes CVE-2011-1473.

Rebased patch 0002, switched _SITE to https.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/monit/0002-configure.ac-fixes-missing-config-macro-dir.patch | 4 +++-
 package/monit/monit.hash                                             | 4 ++--
 package/monit/monit.mk                                               | 4 ++--
 3 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/package/monit/0002-configure.ac-fixes-missing-config-macro-dir.patch b/package/monit/0002-configure.ac-fixes-missing-config-macro-dir.patch
index 31b20b3cbc..3bee55cb5e 100644
--- a/package/monit/0002-configure.ac-fixes-missing-config-macro-dir.patch
+++ b/package/monit/0002-configure.ac-fixes-missing-config-macro-dir.patch
@@ -10,6 +10,8 @@ Upstream: N/A (specific to buildroot)
 Signed-off-by: Jens Maus <mail@jens-maus.de>
 [Dario: make the patch to be applied with fuzz factor 0]
 Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
+[Bernd: rebased against 5.34.2]
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 ---
  configure.ac          | 2 +-
  libmonit/configure.ac | 2 +-
@@ -21,7 +23,7 @@ index 3c3d30a2..f4c5ea07 100644
 +++ b/configure.ac
 @@ -8,7 +8,7 @@
  # Example: 5.0_beta2
- AC_INIT([monit], [5.33.0], [monit-general@nongnu.org])
+ AC_INIT([monit], [5.34.2], [monit-general@nongnu.org])
  AC_CONFIG_AUX_DIR(config)
 -AC_CONFIG_MACRO_DIR([m4])
 +AC_CONFIG_MACRO_DIRS([m4 config])
diff --git a/package/monit/monit.hash b/package/monit/monit.hash
index 1d9feca57b..276e0a19d8 100644
--- a/package/monit/monit.hash
+++ b/package/monit/monit.hash
@@ -1,4 +1,4 @@
-# From https://mmonit.com/monit/dist/monit-5.33.0.tar.gz.sha256
-sha256  1ace889c0183473a9d70160df6533bb6e1338dc1354f5928507803e1e2a863b5  monit-5.33.0.tar.gz
+# From https://mmonit.com/monit/dist/monit-5.34.2.tar.gz.sha256
+sha256  291ca3d898e9b425b6d0c1768728fecd6c1cf4c268c79db15fda26285ad5b832  monit-5.34.2.tar.gz
 # Locally computed
 sha256  d5a4f52b1a5e1e7fe14e01a76aac8b08dc6bbea15466058f271456c97aac1ada  COPYING
diff --git a/package/monit/monit.mk b/package/monit/monit.mk
index e3a4fac936..a2d8073c31 100644
--- a/package/monit/monit.mk
+++ b/package/monit/monit.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-MONIT_VERSION = 5.33.0
-MONIT_SITE = http://mmonit.com/monit/dist
+MONIT_VERSION = 5.34.2
+MONIT_SITE = https://mmonit.com/monit/dist
 MONIT_LICENSE = AGPL-3.0 with OpenSSL exception
 MONIT_LICENSE_FILES = COPYING
 MONIT_CPE_ID_VENDOR = mmonit
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

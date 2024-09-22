Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 435F1CF9C6C
	for <buildroot@archiver.kernel.org>; Sun, 22 Sep 2024 10:37:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DF99A817E4;
	Sun, 22 Sep 2024 10:37:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id It-1bX_XyRtj; Sun, 22 Sep 2024 10:37:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C98F484331
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C98F484331;
	Sun, 22 Sep 2024 10:37:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BED161BF47A
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 10:35:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EA2B240648
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 10:34:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N5CTaH-VrlNh for <buildroot@lists.busybox.net>;
 Sun, 22 Sep 2024 10:34:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2C0574064A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2C0574064A
 for <buildroot@buildroot.org>; Sun, 22 Sep 2024 10:34:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2781E805F4; Sun, 22 Sep 2024 10:34:42 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 22 Sep 2024 12:30:51 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 432cb5cd0ea64e499b253e1ccba6d93f167a5e0a
X-Git-Newrev: c8027a021ba8951fa9c85f1c93cea46f6d97cfb4
X-Patchwork-Hint: ignore
Message-Id: <20240922103442.2781E805F4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-watchdog: bump to version
 5.0.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=c8027a021ba8951fa9c85f1c93cea46f6d97cfb4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop all runtime dependendencies which are no longer required.

License hash changed due to header update:
https://github.com/gorakhargosh/watchdog/commit/80576b4124dc0892a393365754ffe4e1521e3427

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-watchdog/Config.in            | 4 ----
 package/python-watchdog/python-watchdog.hash | 6 +++---
 package/python-watchdog/python-watchdog.mk   | 4 ++--
 3 files changed, 5 insertions(+), 9 deletions(-)

diff --git a/package/python-watchdog/Config.in b/package/python-watchdog/Config.in
index 18f569ee44..06518e0fde 100644
--- a/package/python-watchdog/Config.in
+++ b/package/python-watchdog/Config.in
@@ -1,9 +1,5 @@
 config BR2_PACKAGE_PYTHON_WATCHDOG
 	bool "python-watchdog"
-	select BR2_PACKAGE_PYTHON_ARGH # runtime
-	select BR2_PACKAGE_PYTHON_PATHTOOLS # runtime
-	select BR2_PACKAGE_PYTHON_PYYAML # runtime
-	select BR2_PACKAGE_PYTHON_SETUPTOOLS # runtime
 	help
 	  Python API and shell utilities to monitor file system events.
 
diff --git a/package/python-watchdog/python-watchdog.hash b/package/python-watchdog/python-watchdog.hash
index 0653787110..0d6047e21b 100644
--- a/package/python-watchdog/python-watchdog.hash
+++ b/package/python-watchdog/python-watchdog.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/watchdog/json
-md5  04cda210c7ffd04582d2466328ee7368  watchdog-2.2.1.tar.gz
-sha256  cdcc23c9528601a8a293eb4369cbd14f6b4f34f07ae8769421252e9c22718b6f  watchdog-2.2.1.tar.gz
+md5  7e4eff2cd9a3e62f0dccd55801d5b0c0  watchdog-5.0.2.tar.gz
+sha256  dcebf7e475001d2cdeb020be630dc5b687e9acdd60d16fea6bb4508e7b94cf76  watchdog-5.0.2.tar.gz
 # Locally computed sha256 checksums
-sha256  02c8760f988a76e92a9d6cb525456a86f7b0fd1953870dd491de5955cb974d41  COPYING
+sha256  39f081828db6f94c70123fa4fb30c1bce3e215a8fdece53a49991fe076a69c08  COPYING
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/python-watchdog/python-watchdog.mk b/package/python-watchdog/python-watchdog.mk
index 9c058e38ad..2a2b80b04b 100644
--- a/package/python-watchdog/python-watchdog.mk
+++ b/package/python-watchdog/python-watchdog.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_WATCHDOG_VERSION = 2.2.1
+PYTHON_WATCHDOG_VERSION = 5.0.2
 PYTHON_WATCHDOG_SOURCE = watchdog-$(PYTHON_WATCHDOG_VERSION).tar.gz
-PYTHON_WATCHDOG_SITE = https://files.pythonhosted.org/packages/11/6f/0396d373e039b89c60e23a1a9025edc6dd203121fe0af7d1427e85d5ec98
+PYTHON_WATCHDOG_SITE = https://files.pythonhosted.org/packages/cd/5e/95dcd86d8339fcf76385f7fad5e49cbfd989b6c6199127121c9587febc65
 PYTHON_WATCHDOG_SETUP_TYPE = setuptools
 PYTHON_WATCHDOG_LICENSE = Apache-2.0
 PYTHON_WATCHDOG_LICENSE_FILES = LICENSE COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

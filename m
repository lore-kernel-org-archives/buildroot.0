Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E21FCD1288
	for <buildroot@archiver.kernel.org>; Wed,  3 Apr 2024 20:04:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 604BA40250;
	Wed,  3 Apr 2024 20:04:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Sf2sn8F2Zzvw; Wed,  3 Apr 2024 20:04:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DA91940251
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DA91940251;
	Wed,  3 Apr 2024 20:04:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3A64A1BF4D5
 for <buildroot@lists.busybox.net>; Wed,  3 Apr 2024 20:04:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 270F360797
 for <buildroot@lists.busybox.net>; Wed,  3 Apr 2024 20:04:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mSE9ubMATyZF for <buildroot@lists.busybox.net>;
 Wed,  3 Apr 2024 20:04:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6792160784
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6792160784
 for <buildroot@buildroot.org>; Wed,  3 Apr 2024 20:04:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 51132847A4; Wed,  3 Apr 2024 20:04:11 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 3 Apr 2024 21:59:29 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 399deb6764d6c201547a54c5cad9fe54fbee995e
X-Git-Newrev: 796df3ff83b68b584ba1a30d621ba333a59dd1f7
X-Patchwork-Hint: ignore
Message-Id: <20240403200411.51132847A4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/scons: bump to verion 4.7.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=796df3ff83b68b584ba1a30d621ba333a59dd1f7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop no longer needed HOST_SCONS_INSTALL_OPTS.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/scons/scons.hash | 6 ++++--
 package/scons/scons.mk   | 7 ++-----
 2 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/package/scons/scons.hash b/package/scons/scons.hash
index 48b5077b2e..8dca99830e 100644
--- a/package/scons/scons.hash
+++ b/package/scons/scons.hash
@@ -1,3 +1,5 @@
-# Locally computed:
-sha256  ce26aac95d350a79a4192196b0beac3cb24f4ccabce0123eb28d3370f576f072  SCons-4.5.2.tar.gz
+# md5, sha256 from https://pypi.org/pypi/scons/json
+md5  f5a740e94864408902c62bdb47687d9d  SCons-4.7.0.tar.gz
+sha256  d8b617f6610a73e46509de70dcf82f76861b79762ff602d546f4e80918ec81f3  SCons-4.7.0.tar.gz
+# Locally computed sha256 checksums
 sha256  2f6ac9a1fc98394d18b80dba9bedb9d5626006d44db3fecf7cf3e21cff7e8b1c  LICENSE
diff --git a/package/scons/scons.mk b/package/scons/scons.mk
index ffd6abf609..b6bfaa0237 100644
--- a/package/scons/scons.mk
+++ b/package/scons/scons.mk
@@ -4,16 +4,13 @@
 #
 ################################################################################
 
-SCONS_VERSION = 4.5.2
+SCONS_VERSION = 4.7.0
 SCONS_SOURCE = SCons-$(SCONS_VERSION).tar.gz
-SCONS_SITE = http://downloads.sourceforge.net/project/scons/scons/$(SCONS_VERSION)
+SCONS_SITE = https://files.pythonhosted.org/packages/7b/68/6895065c86c65a9388eb760a43ea695ec5b9b1c98a9675a3bcd682dbe9c0
 SCONS_LICENSE = MIT
 SCONS_LICENSE_FILES = LICENSE
 SCONS_SETUP_TYPE = setuptools
 
-HOST_SCONS_INSTALL_OPTS = \
-	--install-lib=$(HOST_DIR)/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages
-
 $(eval $(host-python-package))
 
 # variables used by other packages
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

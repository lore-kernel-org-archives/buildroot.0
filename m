Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 509CBC4332F
	for <buildroot@archiver.kernel.org>; Fri, 10 Nov 2023 21:11:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DE6534284E;
	Fri, 10 Nov 2023 21:11:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DE6534284E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OPyNxqAHcn6E; Fri, 10 Nov 2023 21:11:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 28A4742850;
	Fri, 10 Nov 2023 21:11:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 28A4742850
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DF92D1BF41B
 for <buildroot@lists.busybox.net>; Fri, 10 Nov 2023 21:11:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B3EF76F6FB
 for <buildroot@lists.busybox.net>; Fri, 10 Nov 2023 21:11:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B3EF76F6FB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qbaDNpXbxUB1 for <buildroot@lists.busybox.net>;
 Fri, 10 Nov 2023 21:11:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id DEE5A60B88
 for <buildroot@buildroot.org>; Fri, 10 Nov 2023 21:11:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DEE5A60B88
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C64B786FE7; Fri, 10 Nov 2023 21:11:08 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 10 Nov 2023 22:06:00 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 37a1a194b1fea92ee1af36aecb254bbf6df7ad2c
X-Git-Newrev: 80adc6bee2269fdbeda3d5c5025383360416588f
X-Patchwork-Hint: ignore
Message-Id: <20231110211108.C64B786FE7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-systemd: bump version to 235
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=80adc6bee2269fdbeda3d5c5025383360416588f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Remove the "# Should be kept in sync with $(SYSTEMD_VERSION)" line from
python-systemd.mk, as this package is not updated on a regular basis and does
not keep up to date with systemd.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/python-systemd/python-systemd.hash | 4 ++--
 package/python-systemd/python-systemd.mk   | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-systemd/python-systemd.hash b/package/python-systemd/python-systemd.hash
index 789b48590d..6cc6639218 100644
--- a/package/python-systemd/python-systemd.hash
+++ b/package/python-systemd/python-systemd.hash
@@ -1,5 +1,5 @@
 # md5 from https://pypi.python.org/pypi/systemd-python/
-md5  5071ea5bcb976186e92a3f5e75df221d  systemd-python-234.tar.gz
+md5  93f3ca09f35719ca6a4edd1d62d38dd4  systemd-python-235.tar.gz
 # Locally computed
-sha256  fd0e44bf70eadae45aadc292cb0a7eb5b0b6372cd1b391228047d33895db83e7  systemd-python-234.tar.gz
+sha256  4e57f39797fd5d9e2d22b8806a252d7c0106c936039d1e71c8c6b8008e695c0a  systemd-python-235.tar.gz
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  LICENSE.txt
diff --git a/package/python-systemd/python-systemd.mk b/package/python-systemd/python-systemd.mk
index 3ccfd57ce5..fdc5d7e278 100644
--- a/package/python-systemd/python-systemd.mk
+++ b/package/python-systemd/python-systemd.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-PYTHON_SYSTEMD_VERSION = 234 # Should be kept in sync with $(SYSTEMD_VERSION)
+PYTHON_SYSTEMD_VERSION = 235
 PYTHON_SYSTEMD_SOURCE = systemd-python-$(PYTHON_SYSTEMD_VERSION).tar.gz
-PYTHON_SYSTEMD_SITE = https://pypi.python.org/packages/e8/a8/00ba0f605837a8f69523e6c3a4fb14675a6430c163f836540129c50b3aef
-PYTHON_SYSTEMD_SETUP_TYPE = distutils
+PYTHON_SYSTEMD_SITE = https://files.pythonhosted.org/packages/10/9e/ab4458e00367223bda2dd7ccf0849a72235ee3e29b36dce732685d9b7ad9
+PYTHON_SYSTEMD_SETUP_TYPE = setuptools
 PYTHON_SYSTEMD_LICENSE = LGPL-2.1
 PYTHON_SYSTEMD_LICENSE_FILES = LICENSE.txt
 PYTHON_SYSTEMD_DEPENDENCIES = systemd # To be able to link against libsystemd
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

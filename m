Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1388C282C1
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 16:38:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B4EB64F4BB;
	Fri, 28 Feb 2025 16:38:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SzbYF4MdvzAe; Fri, 28 Feb 2025 16:38:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B46134F4A8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B46134F4A8;
	Fri, 28 Feb 2025 16:38:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 128A568
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:31:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 22BC74251E
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zyqLNixofmkN for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:29:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 93AD7424A7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 93AD7424A7
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 90B89820F8; Fri, 28 Feb 2025 16:29:39 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Fri, 13 Dec 2024 23:06:21 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 96e7f24164de9fc3df84c511e456b3840b631a29
X-Git-Newrev: 3a3f1f542c16f6c09445e353895052259f6c0ded
X-Patchwork-Hint: ignore
Message-Id: <20250228162939.90B89820F8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/python-daemon: bump to
 version 3.1.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=3a3f1f542c16f6c09445e353895052259f6c0ded
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Change PYTHON_DAEMON_SOURCE as package's download name has changed
from python-daemon to python_daemon.

Fixes:
https://autobuild.buildroot.org/results/be73c9a41b3ad3dea8a924ab98f6fe804e6808fa/
https://autobuild.buildroot.org/results/4cb684c6e8758b728d54ea367d1f279b2065bd83/

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-daemon/python-daemon.hash | 4 ++--
 package/python-daemon/python-daemon.mk   | 7 ++++---
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/python-daemon/python-daemon.hash b/package/python-daemon/python-daemon.hash
index 695b8fb9b3..f2834279ce 100644
--- a/package/python-daemon/python-daemon.hash
+++ b/package/python-daemon/python-daemon.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/python-daemon/json
-md5  4c369b8c6d3de956d8f9dfb2c872c284  python-daemon-3.0.1.tar.gz
-sha256  6c57452372f7eaff40934a1c03ad1826bf5e793558e87fef49131e6464b4dae5  python-daemon-3.0.1.tar.gz
+md5  d42ee28735506ea1cb51c348530d6d94  python_daemon-3.1.2.tar.gz
+sha256  f7b04335adc473de877f5117e26d5f1142f4c9f7cd765408f0877757be5afbf4  python_daemon-3.1.2.tar.gz
 # Locally computed sha256
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE.ASF-2
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSE.GPL-3
diff --git a/package/python-daemon/python-daemon.mk b/package/python-daemon/python-daemon.mk
index f4d4205a31..ef380bfe3b 100644
--- a/package/python-daemon/python-daemon.mk
+++ b/package/python-daemon/python-daemon.mk
@@ -4,11 +4,12 @@
 #
 ################################################################################
 
-PYTHON_DAEMON_VERSION = 3.0.1
-PYTHON_DAEMON_SITE = https://files.pythonhosted.org/packages/84/50/97b81327fccbb70eb99f3c95bd05a0c9d7f13fb3f4cfd975885110d1205a
+PYTHON_DAEMON_VERSION = 3.1.2
+PYTHON_DAEMON_SOURCE = python_daemon-$(PYTHON_DAEMON_VERSION).tar.gz
+PYTHON_DAEMON_SITE = https://files.pythonhosted.org/packages/3d/37/4f10e37bdabc058a32989da2daf29e57dc59dbc5395497f3d36d5f5e2694
 PYTHON_DAEMON_LICENSE = Apache-2.0 (library), GPL-3.0+ (test, build)
 PYTHON_DAEMON_LICENSE_FILES = LICENSE.ASF-2 LICENSE.GPL-3
 PYTHON_DAEMON_SETUP_TYPE = setuptools
-PYTHON_DAEMON_DEPENDENCIES = host-python-docutils
+PYTHON_DAEMON_DEPENDENCIES = host-python-changelog-chug host-python-docutils
 
 $(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

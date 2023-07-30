Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A0E5EB64DD
	for <buildroot@archiver.kernel.org>; Sun, 30 Jul 2023 21:55:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1062F60804;
	Sun, 30 Jul 2023 21:55:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1062F60804
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Rkjafrhy1y2M; Sun, 30 Jul 2023 21:55:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7359661030;
	Sun, 30 Jul 2023 21:55:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7359661030
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1ABC01BF401
 for <buildroot@lists.busybox.net>; Sun, 30 Jul 2023 21:55:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0185340B12
 for <buildroot@lists.busybox.net>; Sun, 30 Jul 2023 21:55:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0185340B12
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XCOJpxZWoMXE for <buildroot@lists.busybox.net>;
 Sun, 30 Jul 2023 21:55:45 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 14F70404B0
 for <buildroot@buildroot.org>; Sun, 30 Jul 2023 21:55:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 14F70404B0
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0018983D57; Sun, 30 Jul 2023 21:55:44 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 30 Jul 2023 23:44:28 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 71b5ea4030a25f84375a5e23d0eae6cf49ffe5a8
X-Git-Newrev: 941b6565ddad49298293272f55c5e55489dc8fdc
X-Patchwork-Hint: ignore
Message-Id: <20230730215545.0018983D57@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-libconf: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=941b6565ddad49298293272f55c5e55489dc8fdc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

python-libconf is a pure-Python reader/writer for configuration files in
libconfig format, which is often used in C/C++ projects.

https://github.com/ChrisAichinger/python-libconf

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                 |  1 +
 package/python-libconf/python-libconf.hash |  4 ++++
 package/python-libconf/python-libconf.mk   | 13 +++++++++++++
 3 files changed, 18 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 51e7e3439d..19cc5709e4 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1183,6 +1183,7 @@ F:	package/mali-driver/
 F:	package/minicom/
 F:	package/mmc-utils/
 F:	package/nfs-utils/
+F:	package/python-libconf/
 F:	package/python-uvloop/
 F:	package/qt5/
 F:	package/rockchip-mali/
diff --git a/package/python-libconf/python-libconf.hash b/package/python-libconf/python-libconf.hash
new file mode 100644
index 0000000000..d05efd37fd
--- /dev/null
+++ b/package/python-libconf/python-libconf.hash
@@ -0,0 +1,4 @@
+# Locally calculated
+sha256  66897870fcafce05624eafcc99e2dc8e150124e91019d9c29cc4f3bef64311dd  python-libconf-2.0.1.tar.gz
+# Locally computed sha256 checksums
+sha256  3c2afc8c9f7a12032f225e6fa870e85af14d1b71236afe28d94a4b67e5e8c873  LICENSE
diff --git a/package/python-libconf/python-libconf.mk b/package/python-libconf/python-libconf.mk
new file mode 100644
index 0000000000..b349e3e60e
--- /dev/null
+++ b/package/python-libconf/python-libconf.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# python-libconf
+#
+################################################################################
+
+PYTHON_LIBCONF_VERSION = 2.0.1
+PYTHON_LIBCONF_SITE = $(call github,ChrisAichinger,python-libconf,$(PYTHON_LIBCONF_VERSION))
+PYTHON_LIBCONF_SETUP_TYPE = setuptools
+PYTHON_LIBCONF_LICENSE = MIT
+PYTHON_LIBCONF_LICENSE_FILES = LICENSE
+
+$(eval $(host-python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

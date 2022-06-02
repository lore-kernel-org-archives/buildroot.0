Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F39EAC43334
	for <buildroot@archiver.kernel.org>; Thu,  2 Jun 2022 13:48:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8EDAA607CA;
	Thu,  2 Jun 2022 13:48:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GyoMnFWT-w_I; Thu,  2 Jun 2022 13:48:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A0FA960B2E;
	Thu,  2 Jun 2022 13:48:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 995621BF32D
 for <buildroot@lists.busybox.net>; Thu,  2 Jun 2022 13:48:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 84D8E4012E
 for <buildroot@lists.busybox.net>; Thu,  2 Jun 2022 13:48:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id F56uDFFiBXUa for <buildroot@lists.busybox.net>;
 Thu,  2 Jun 2022 13:48:12 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id AE2BC400D2
 for <buildroot@buildroot.org>; Thu,  2 Jun 2022 13:48:12 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 92E05869E1; Thu,  2 Jun 2022 13:36:32 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 2 Jun 2022 15:46:50 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 9ac8fb266e9dd8c94ba89c9501571d9021fd838d
X-Git-Newrev: ca3acb36121f50ea3125814153b8bc384d5bdf89
X-Patchwork-Hint: ignore
Message-Id: <20220602133632.92E05869E1@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/python-sip: bump to
 version 4.19.25
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

commit: https://git.buildroot.net/buildroot/commit/?id=ca3acb36121f50ea3125814153b8bc384d5bdf89
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This version is the minimum version needed to support newer versions of PyQT.

Changes:
  - Update the URL as this version is not hosted on sourceforge.
  - Add --no-stubs to prevent the error: No such file or directory: sip.pyi
  - Add 0001-remove-join-from-sip-h-files-string.patch to prevent python-sip
    from attempting to copy the entire hosts /usr directory when
    installing.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0001-remove-join-from-sip-h-files-string.patch | 33 ++++++++++++++++++++++
 package/python-sip/python-sip.hash                 | 10 +++----
 package/python-sip/python-sip.mk                   |  6 ++--
 3 files changed, 40 insertions(+), 9 deletions(-)

diff --git a/package/python-sip/0001-remove-join-from-sip-h-files-string.patch b/package/python-sip/0001-remove-join-from-sip-h-files-string.patch
new file mode 100644
index 0000000000..e7a0d606e9
--- /dev/null
+++ b/package/python-sip/0001-remove-join-from-sip-h-files-string.patch
@@ -0,0 +1,33 @@
+From 009e5cf0750134ed5403aae23ef53a177764ca04 Mon Sep 17 00:00:00 2001
+From: Adam Duskett <aduskett@gmail.com>
+Date: Wed, 29 Dec 2021 13:49:15 -0800
+Subject: [PATCH] remove join from sip_h.files string
+
+When cross compiling, the configure system appends the hosts /usr/ directory 
+to the path of which to find files that python-sip will install. This leads to
+python-sip attempting to install everything under the hosts /usr directory into
+the targets /usr/include/python directory.
+
+Remove the .join() in the sip_h.files string to prevent the above issue.
+
+Signed-off-by: Adam Duskett <aduskett@gmail.com>
+---
+ configure.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.py b/configure.py
+index 25bcaa7..fc8f2dc 100644
+--- a/configure.py
++++ b/configure.py
+@@ -408,7 +408,7 @@ def create_makefiles(macros):
+             # There will only be one element.
+             files, path = gen_installs[0]
+             pro.write("\n")
+-            pro.write("sip_h.files = %s\n" % " ".join(files))
++            pro.write("sip_h.files = %s\n" % files)
+             pro.write("sip_h.path = %s\n" % quote(path))
+             pro.write("INSTALLS += sip_h\n")
+ 
+-- 
+2.33.1
+
diff --git a/package/python-sip/python-sip.hash b/package/python-sip/python-sip.hash
index 6adf44d410..0108924cdc 100644
--- a/package/python-sip/python-sip.hash
+++ b/package/python-sip/python-sip.hash
@@ -1,7 +1,5 @@
-# From https://sourceforge.net/projects/pyqt/files/sip/sip-4.18/
-md5 78724bf2a79878201c3bc81a1d8248ea	sip-4.18.tar.gz
 # Locally calculated:
-sha256 f1dc5c81c07a9ad97edcd4a0af964a41e420024ba7ca165afd2b351efd249cb6	 sip-4.18.tar.gz
-sha256 accecbfda71ad4497bce0d451796706e734e405e5ecf3b3f9ee0cc68300a3d9c  LICENSE
-sha256 7ebb61006e46b9e9340dd135d5f4afbbcb1d1d6c6709f74473b35929007b9aeb  LICENSE-GPL2
-sha256 63cb5f5c1ea39b732c495f354f971e40f6db84c567ca5573a68bb65af07741f8  LICENSE-GPL3
+sha256  b39d93e937647807bac23579edbff25fe46d16213f708370072574ab1f1b4211  sip-4.19.25.tar.gz
+sha256  accecbfda71ad4497bce0d451796706e734e405e5ecf3b3f9ee0cc68300a3d9c  LICENSE
+sha256  7ebb61006e46b9e9340dd135d5f4afbbcb1d1d6c6709f74473b35929007b9aeb  LICENSE-GPL2
+sha256  63cb5f5c1ea39b732c495f354f971e40f6db84c567ca5573a68bb65af07741f8  LICENSE-GPL3
diff --git a/package/python-sip/python-sip.mk b/package/python-sip/python-sip.mk
index 01ccb1ddd5..3e015fa16c 100644
--- a/package/python-sip/python-sip.mk
+++ b/package/python-sip/python-sip.mk
@@ -4,12 +4,11 @@
 #
 ################################################################################
 
-PYTHON_SIP_VERSION = 4.18
+PYTHON_SIP_VERSION = 4.19.25
 PYTHON_SIP_SOURCE = sip-$(PYTHON_SIP_VERSION).tar.gz
-PYTHON_SIP_SITE = http://downloads.sourceforge.net/project/pyqt/sip/sip-$(PYTHON_SIP_VERSION)
+PYTHON_SIP_SITE = https://www.riverbankcomputing.com/static/Downloads/sip/$(PYTHON_SIP_VERSION)
 PYTHON_SIP_LICENSE = SIP license or GPL-2.0 or GPL-3.0
 PYTHON_SIP_LICENSE_FILES = LICENSE LICENSE-GPL2 LICENSE-GPL3
-
 PYTHON_SIP_DEPENDENCIES = python3 qt5base
 HOST_PYTHON_SIP_DEPENDENCIES = host-python3
 
@@ -34,6 +33,7 @@ define PYTHON_SIP_CONFIGURE_CMDS
 			--incdir $(STAGING_DIR)/usr/include/python$(PYTHON3_VERSION_MAJOR) \
 			--sipdir $(TARGET_DIR)/usr/share/sip \
 			--sysroot $(STAGING_DIR)/usr \
+			--no-stubs \
 			--use-qmake && \
 		$(HOST_DIR)/bin/qmake)
 endef
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 17 Oct 2017 10:49:02 +0200
Subject: [Buildroot] [git commit branch/2017.08.x] package/iucode-tool:
	security bump to version 2.2
Message-ID: <20171017090326.AD84B7FD24@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=43416012b46676281d187e7bd0df0905b6611c44
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.08.x

Version 2.1.1 fixed CVE-2017-0357:
https://gitlab.com/iucode-tool/iucode-tool/commit/657ce44ac462bcec35a3e12f9e7f53ca92ae62b7

Dropped IUCODE_TOOL_CONF_ENV after version 2.2 added a configure check
for libargp:
https://gitlab.com/iucode-tool/iucode-tool/commit/b14bed6771e7ab48371b272a0c68dd017767142a

Added hash for license file.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit 1462c07914f5e53cb7816ad86abee3e31b2bc1b6)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/iucode-tool/iucode-tool.hash | 3 ++-
 package/iucode-tool/iucode-tool.mk   | 3 +--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/iucode-tool/iucode-tool.hash b/package/iucode-tool/iucode-tool.hash
index c1f3bef..1dab8de 100644
--- a/package/iucode-tool/iucode-tool.hash
+++ b/package/iucode-tool/iucode-tool.hash
@@ -1,2 +1,3 @@
 # Locally computed
-sha256	33271652032f20f866a212bc98ea01a8db65c4ac839fa820aa23da974fd6ff62	iucode-tool_1.5.tar.xz
+sha256 9810daf925b8a9ca244adc4e1916bcab65601c9ebe87e91c2281f78055982971  iucode-tool_2.2.tar.xz
+sha256 ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/iucode-tool/iucode-tool.mk b/package/iucode-tool/iucode-tool.mk
index e8ae36c..fb746c3 100644
--- a/package/iucode-tool/iucode-tool.mk
+++ b/package/iucode-tool/iucode-tool.mk
@@ -4,11 +4,10 @@
 #
 ################################################################################
 
-IUCODE_TOOL_VERSION = 1.5
+IUCODE_TOOL_VERSION = 2.2
 IUCODE_TOOL_SOURCE = iucode-tool_$(IUCODE_TOOL_VERSION).tar.xz
 IUCODE_TOOL_SITE = https://gitlab.com/iucode-tool/releases/raw/master
 ifeq ($(BR2_PACKAGE_ARGP_STANDALONE),y)
-IUCODE_TOOL_CONF_ENV = LIBS="-largp"
 IUCODE_TOOL_DEPENDENCIES = argp-standalone
 endif
 IUCODE_TOOL_LICENSE = GPL-2.0+

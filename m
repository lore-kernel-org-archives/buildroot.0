From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon,  6 Mar 2017 08:01:50 +0100
Subject: [Buildroot] [PATCH 1/1] Revert "package/libcec: bump version to
	4.0.2", bump to 3.1.0
Message-ID: <20170306070150.31199-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This reverts commit bf1c9828f2c7ef37a0af4da5532472fb7e03ba67 and bumps
the version to 3.1.0 at the same time to be compatible with
libplatform-2.1.0.

Kodi-16.1-Jarvis is incompatible with libcec >= 4.0, support for this
libcec version was added in Kodi 17.0-Krypton:
https://github.com/xbmc/xbmc/pull/10775

Fixes: https://bugs.busybox.net/show_bug.cgi?id=9711

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libcec/libcec.hash | 2 +-
 package/libcec/libcec.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libcec/libcec.hash b/package/libcec/libcec.hash
index 5416c20fe..37ccb540f 100644
--- a/package/libcec/libcec.hash
+++ b/package/libcec/libcec.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 b8b8dd31f3ebdd5472f03ab7d401600ea0d959b1288b9ca24bf457ef60e2ba27  libcec-4.0.2.tar.gz
+sha256 09109d21a1b03f42c9e341d12600f2e4c41038d640269fa75408e2d36126f921  libcec-3.1.0.tar.gz
diff --git a/package/libcec/libcec.mk b/package/libcec/libcec.mk
index f00e10f5d..ad2e6a4c5 100644
--- a/package/libcec/libcec.mk
+++ b/package/libcec/libcec.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBCEC_VERSION = 4.0.2
-LIBCEC_SITE = $(call github,Pulse-Eight,libcec,libcec-$(LIBCEC_VERSION))
+LIBCEC_VERSION = 3.1.0
+LIBCEC_SITE = https://github.com/Pulse-Eight/libcec/archive
 LIBCEC_LICENSE = GPLv2+
 LIBCEC_LICENSE_FILES = COPYING
 
-- 
2.11.0

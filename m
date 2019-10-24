From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 24 Oct 2019 20:06:53 +0200
Subject: [Buildroot] [PATCH 1/1] package/libnetconf2: fixup the 'v' prefix
 in the version
Message-ID: <20191024180653.13243-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In order for the luvi version to match what is given by
release-monitoring.org, the 'v' prefix should be encoded in
LIBNETCONF2_SITE and not LIBNETCONF2_VERSION.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libnetconf2/libnetconf2.hash | 2 +-
 package/libnetconf2/libnetconf2.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libnetconf2/libnetconf2.hash b/package/libnetconf2/libnetconf2.hash
index c6d1f5185d..9b78049ffb 100644
--- a/package/libnetconf2/libnetconf2.hash
+++ b/package/libnetconf2/libnetconf2.hash
@@ -1,2 +1,2 @@
-sha256 760061fb1c1fe87a2a068d5a9e5affcef280044c5940ef344854e9ea7ec26452  libnetconf2-v0.12-r2.tar.gz
+sha256 760061fb1c1fe87a2a068d5a9e5affcef280044c5940ef344854e9ea7ec26452  libnetconf2-0.12-r2.tar.gz
 sha256 085122ea91161812dda9cd2f42d8c50ecc3a48cc1a4f15044d86cfc5aa887577  LICENSE
diff --git a/package/libnetconf2/libnetconf2.mk b/package/libnetconf2/libnetconf2.mk
index c3999b3e29..49a6de60a9 100644
--- a/package/libnetconf2/libnetconf2.mk
+++ b/package/libnetconf2/libnetconf2.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBNETCONF2_VERSION = v0.12-r2
-LIBNETCONF2_SITE = $(call github,CESNET,libnetconf2,$(LIBNETCONF2_VERSION))
+LIBNETCONF2_VERSION = 0.12-r2
+LIBNETCONF2_SITE = $(call github,CESNET,libnetconf2,v$(LIBNETCONF2_VERSION))
 LIBNETCONF2_INSTALL_STAGING = YES
 LIBNETCONF2_LICENSE = BSD-3-Clause
 LIBNETCONF2_LICENSE_FILES = LICENSE
-- 
2.23.0

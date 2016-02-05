From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri,  5 Feb 2016 15:28:19 -0300
Subject: [Buildroot] [PATCH] libbsd: security bump to version 0.8.2
Message-ID: <1454696899-19572-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
CVE-2016-2090 - denial of service due to a buffer overflow in the
"fgetwln"-function.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libbsd/libbsd.hash | 2 +-
 package/libbsd/libbsd.mk   | 3 +--
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/libbsd/libbsd.hash b/package/libbsd/libbsd.hash
index be4ba50..f77c0aa 100644
--- a/package/libbsd/libbsd.hash
+++ b/package/libbsd/libbsd.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	9e8f34ffa9c8579c87965a55a82d8ac37a1dc64858f717b7c49452ade277cc62	libbsd-0.6.0.tar.xz
+sha256	b2f644cae94a6e2fe109449c20ad79a0f6ee4faec2205b07eefa0020565e250a	libbsd-0.8.2.tar.xz
diff --git a/package/libbsd/libbsd.mk b/package/libbsd/libbsd.mk
index 99a9572..62dee06 100644
--- a/package/libbsd/libbsd.mk
+++ b/package/libbsd/libbsd.mk
@@ -4,12 +4,11 @@
 #
 ################################################################################
 
-LIBBSD_VERSION = 0.6.0
+LIBBSD_VERSION = 0.8.2
 LIBBSD_SOURCE = libbsd-$(LIBBSD_VERSION).tar.xz
 LIBBSD_SITE = http://libbsd.freedesktop.org/releases
 LIBBSD_LICENSE = BSD-3c, MIT
 LIBBSD_LICENSE_FILES = COPYING
-
 LIBBSD_INSTALL_STAGING = YES
 
 $(eval $(autotools-package))
-- 
2.4.10

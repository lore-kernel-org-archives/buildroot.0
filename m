From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 27 Jun 2014 17:09:26 -0300
Subject: [Buildroot] [PATCH] liboauth: bump to version 1.0.3
Message-ID: <1403899766-32567-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add license information as well.
It could be "or GPL" as well but since we link to openssl that's a murky path
as stated in the README so just leave it at MIT.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/liboauth/liboauth.mk | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/liboauth/liboauth.mk b/package/liboauth/liboauth.mk
index 6ade856..d247068 100644
--- a/package/liboauth/liboauth.mk
+++ b/package/liboauth/liboauth.mk
@@ -4,11 +4,12 @@
 #
 ################################################################################
 
-LIBOAUTH_VERSION = 0.9.6
+LIBOAUTH_VERSION = 1.0.3
 LIBOAUTH_SITE = http://liboauth.sourceforge.net/pool
 LIBOAUTH_INSTALL_STAGING = YES
-
 LIBOAUTH_DEPENDENCIES += host-pkgconf openssl
+LIBOAUTH_LICENSE = MIT
+LIBOAUTH_LICENSE_FILES = COPYING.MIT
 
 ifeq ($(BR2_PACKAGE_LIBCURL),y)
 LIBOAUTH_DEPENDENCIES += libcurl
-- 
1.8.5.5

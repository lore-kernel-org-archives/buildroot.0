From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 4 Oct 2018 15:23:55 +0200
Subject: [Buildroot] [git commit] package/multicat: bump version to 2.3
Message-ID: <20181004132323.829028CA36@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ec069c27d0b5b2d441843f5d2dfeefabb0c00a3e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Removed patch 0001, applied upstream.
Added sha256 hash provided by upstream.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../multicat/0001-Fix-build-with-musl-libc.patch   | 62 ----------------------
 package/multicat/multicat.hash                     |  7 +--
 package/multicat/multicat.mk                       |  2 +-
 3 files changed, 5 insertions(+), 66 deletions(-)

diff --git a/package/multicat/0001-Fix-build-with-musl-libc.patch b/package/multicat/0001-Fix-build-with-musl-libc.patch
deleted file mode 100644
index d68b861a1d..0000000000
--- a/package/multicat/0001-Fix-build-with-musl-libc.patch
+++ /dev/null
@@ -1,62 +0,0 @@
-From 19c37f8d02cfe3a0490981cd9c3370fe544b76ac Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Cl=C3=A9ment=20Vasseur?= <clement.vasseur@gmail.com>
-Date: Thu, 30 Nov 2017 16:05:49 +0000
-Subject: [PATCH] Fix build with musl libc
-
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
----
-Upstream status: commit 19c37f8d02cf
-
- multicat.c | 7 ++-----
- util.h     | 3 ++-
- 2 files changed, 4 insertions(+), 6 deletions(-)
-
-diff --git a/multicat.c b/multicat.c
-index eeab930fc1db..e8b6874d6f4c 100644
---- a/multicat.c
-+++ b/multicat.c
-@@ -1,7 +1,7 @@
- /*****************************************************************************
-  * multicat.c: netcat-equivalent for multicast
-  *****************************************************************************
-- * Copyright (C) 2009, 2011-2012, 2015-2016 VideoLAN
-+ * Copyright (C) 2009, 2011-2012, 2015-2017 VideoLAN
-  * $Id$
-  *
-  * Authors: Christophe Massiot <massiot@via.ecp.fr>
-@@ -43,10 +43,7 @@
- #include <poll.h>
- #include <sys/ioctl.h>
- #include <syslog.h>
--
--#ifdef __FreeBSD__
--#   include <sys/uio.h>
--#endif
-+#include <sys/uio.h>
- 
- #ifdef SIOCGSTAMPNS
- #   define HAVE_TIMESTAMPS
-diff --git a/util.h b/util.h
-index 1959a2edb155..724e7d843d22 100644
---- a/util.h
-+++ b/util.h
-@@ -1,7 +1,7 @@
- /*****************************************************************************
-  * util.h: Utils for the multicat suite
-  *****************************************************************************
-- * Copyright (C) 2009, 2011, 2014-2016 VideoLAN
-+ * Copyright (C) 2009, 2011, 2014-2017 VideoLAN
-  * $Id$
-  *
-  * Authors: Christophe Massiot <massiot@via.ecp.fr>
-@@ -23,6 +23,7 @@
- 
- #include <netinet/udp.h>
- #include <netinet/ip.h>
-+#include <sys/types.h>
- 
- #if defined(__APPLE__) || defined(__FreeBSD__)
- #define POLLRDHUP 0
--- 
-2.17.0
-
diff --git a/package/multicat/multicat.hash b/package/multicat/multicat.hash
index 0f718d0e0e..9cf84bc50f 100644
--- a/package/multicat/multicat.hash
+++ b/package/multicat/multicat.hash
@@ -1,5 +1,6 @@
-# from https://get.videolan.org/multicat/2.2/multicat-2.2.tar.bz2.md5
-md5 91bd35aa5aa94c370664276bd5af6f48 multicat-2.2.tar.bz2
+# From https://get.videolan.org/multicat/2.3/multicat-2.3.tar.bz2.md5
+md5 cf4e4bc07d72eda110050d755db14620  multicat-2.3.tar.bz2
+# From https://get.videolan.org/multicat/2.3/multicat-2.3.tar.bz2.sha256
+sha256 2be162e9e8b2e6f6aa7686431f102db6c72c8288bd82dbc67ffed631f4a3361e  multicat-2.3.tar.bz2
 # locally calculated
-sha256 fa4e48b38665658df7719293f9358df08f59f3eb7f7b77df510b35951e316b40 multicat-2.2.tar.bz2
 sha256 94f68aec169fb6c9937eade757251714d38a56812be5dbfc3973914a71ad8d2d COPYING
diff --git a/package/multicat/multicat.mk b/package/multicat/multicat.mk
index 67cebec26a..1d31ec869d 100644
--- a/package/multicat/multicat.mk
+++ b/package/multicat/multicat.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MULTICAT_VERSION = 2.2
+MULTICAT_VERSION = 2.3
 MULTICAT_SOURCE = multicat-$(MULTICAT_VERSION).tar.bz2
 MULTICAT_SITE = https://get.videolan.org/multicat/$(MULTICAT_VERSION)
 MULTICAT_LICENSE = GPL-2.0+

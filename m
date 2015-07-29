From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 29 Jul 2015 07:24:06 -0300
Subject: [Buildroot] [PATCH] bind: security bump to version 9.9.7-P2
Message-ID: <1438165446-14091-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes CVE-2015-5477 - An error in handling TKEY queries can cause named
to exit with a REQUIRE assertion failure.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/bind/bind.hash | 4 ++--
 package/bind/bind.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/bind/bind.hash b/package/bind/bind.hash
index e74c773..6bc2d1b 100644
--- a/package/bind/bind.hash
+++ b/package/bind/bind.hash
@@ -1,2 +1,2 @@
-# Verified from ftp://ftp.isc.org/isc/bind9/9.9.7-P1/bind-9.9.7-P1.tar.gz.sha256.asc
-sha256	bd086ff58afaf03cfb8dc695c79b6bd6d0217ef56750a78ff0668b2b3acda34d	bind-9.9.7-P1.tar.gz
+# Verified from ftp://ftp.isc.org/isc/bind9/9.9.7-P2/bind-9.9.7-P2.tar.gz.sha256.asc
+sha256	f5f433567e5f68d61460d86f691471259a49b6d10d7422acbd88b7fdb038b518	bind-9.9.7-P2.tar.gz
diff --git a/package/bind/bind.mk b/package/bind/bind.mk
index 98a19ea..6201991 100644
--- a/package/bind/bind.mk
+++ b/package/bind/bind.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BIND_VERSION = 9.9.7-P1
+BIND_VERSION = 9.9.7-P2
 BIND_SITE = ftp://ftp.isc.org/isc/bind9/$(BIND_VERSION)
 BIND_INSTALL_STAGING = YES
 BIND_CONFIG_SCRIPTS = bind9-config isc-config.sh
-- 
2.3.6

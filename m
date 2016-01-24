From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 24 Jan 2016 13:22:56 +0100
Subject: [Buildroot] [PATCH 1/1] package/tinc: bump version to fix musl build
Message-ID: <1453638176-26367-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The autobuilders did not catch the error yet because they failed
earlier with other packages, but I am continuing the build based
on the defconfig from:
http://autobuild.buildroot.net/results/6cc/6cc0f8c067e07deea688b9b97284601a596b898c/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/tinc/tinc.hash | 4 ++--
 package/tinc/tinc.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/tinc/tinc.hash b/package/tinc/tinc.hash
index 721b6bd..f7df90b 100644
--- a/package/tinc/tinc.hash
+++ b/package/tinc/tinc.hash
@@ -1,2 +1,2 @@
-# Locally calculated after checking pgp signature
-sha256	498e58f9f39e3922030a63cf62baf4b46a40fbda8d90b23ec0f084f4a9f9b687	tinc-1.0.24.tar.gz
+# Locally calculated
+sha256	2b4319ddb3bd2867e72532a233f640a58c2f4d83f1088183ae544b268646ba21	tinc-1.0.26.tar.gz
diff --git a/package/tinc/tinc.mk b/package/tinc/tinc.mk
index f7edd79..4155c12 100644
--- a/package/tinc/tinc.mk
+++ b/package/tinc/tinc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TINC_VERSION = 1.0.24
+TINC_VERSION = 1.0.26
 TINC_SITE = http://www.tinc-vpn.org/packages
 TINC_DEPENDENCIES = lzo openssl zlib
 TINC_LICENSE = GPLv2+ with OpenSSL exception
-- 
2.7.0.rc3

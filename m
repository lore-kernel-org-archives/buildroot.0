From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 23 Jul 2020 23:56:23 +0200
Subject: [Buildroot] [PATCH 2/2] package/squid: security bump to version 4.12
In-Reply-To: <20200723215623.890307-1-fontaine.fabrice@gmail.com>
References: <20200723215623.890307-1-fontaine.fabrice@gmail.com>
Message-ID: <20200723215623.890307-2-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Fix CVE-2020-15049: Cache Poisoning Issue in HTTP Request processing
- Fix CVE-2020-14058: Denial of Service issue in TLS handshake
- Fix CVE-2020-14059: Denial of Service when using SMP cache

This version also fix a build failure with systemd

Fixes:
 - http://autobuild.buildroot.org/results/4f586c497577d6c96289e821430fa2c2f61eda2a

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/squid/squid.hash | 8 ++++----
 package/squid/squid.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/squid/squid.hash b/package/squid/squid.hash
index 3c8ab64d35..a3ef655185 100644
--- a/package/squid/squid.hash
+++ b/package/squid/squid.hash
@@ -1,6 +1,6 @@
-# From http://www.squid-cache.org/Versions/v4/squid-4.11.tar.xz.asc
-md5  10f34e852153a9996aa4614670e2bda1  squid-4.11.tar.xz
-sha1  053277bf5497163ffc9261b9807abda5959bb6fc  squid-4.11.tar.xz
+# From http://www.squid-cache.org/Versions/v4/squid-4.12.tar.xz.asc
+md5  ad7a4a8a0031cae3435717a759173829  squid-4.12.tar.xz
+sha1  316b8a343aa542b5e7469d33b9d726bee00679c6  squid-4.12.tar.xz
 # Locally calculated
-sha256  4ed947612410263f57ad0e39bfd087e60fb714f028d7d3b0e469943efd34287d  squid-4.11.tar.xz
+sha256  f42a03c8b3dc020722c88bf1a87da8cb0c087b2f66b41d8256c77ee1b527e317  squid-4.12.tar.xz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/squid/squid.mk b/package/squid/squid.mk
index ef2f84085c..6bce74b7d6 100644
--- a/package/squid/squid.mk
+++ b/package/squid/squid.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SQUID_VERSION = 4.11
+SQUID_VERSION = 4.12
 SQUID_SOURCE = squid-$(SQUID_VERSION).tar.xz
 SQUID_SITE = http://www.squid-cache.org/Versions/v4
 SQUID_LICENSE = GPL-2.0+
-- 
2.27.0

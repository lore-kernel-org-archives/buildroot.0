From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun,  8 May 2016 10:14:28 -0300
Subject: [Buildroot] [PATCH] squid: security bump to version 3.5.18
Message-ID: <1462713268-26789-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
CVE-2016-4553 - Cache Poisoning issue in HTTP Request handling
CVE-2016-4554 - Header Smuggling issue in HTTP Request processing
CVE-2016-4555 - Multiple Denial of Service issues in ESI Response
processing (client_side_request.cc)
CVE-2016-4556 - Multiple Denial of Service issues in ESI Response
processing (Esi.cc)

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/squid/squid.hash | 6 +++---
 package/squid/squid.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/squid/squid.hash b/package/squid/squid.hash
index 4f0090e..8ddc71e 100644
--- a/package/squid/squid.hash
+++ b/package/squid/squid.hash
@@ -1,3 +1,3 @@
-# From http://www.squid-cache.org/Versions/v3/3.5/squid-3.5.17.tar.xz.asc
-md5	2dc73cc01e77b1bd16d9070780ae79b1	squid-3.5.17.tar.xz
-sha1	8ef6fe7d778df9538a4aa29d7e8ace52246e7a23	squid-3.5.17.tar.xz
+# From http://www.squid-cache.org/Versions/v3/3.5/squid-3.5.18.tar.xz.asc
+md5	9ae3843c341e8a142e963ab937c51cdd	squid-3.5.18.tar.xz
+sha1	cd0596fdc3d6f11bb0ed50d8deb11ea950f0242d	squid-3.5.18.tar.xz
diff --git a/package/squid/squid.mk b/package/squid/squid.mk
index 1d601b5..4bdc7b7 100644
--- a/package/squid/squid.mk
+++ b/package/squid/squid.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 SQUID_VERSION_MAJOR = 3.5
-SQUID_VERSION = $(SQUID_VERSION_MAJOR).17
+SQUID_VERSION = $(SQUID_VERSION_MAJOR).18
 SQUID_SOURCE = squid-$(SQUID_VERSION).tar.xz
 SQUID_SITE = http://www.squid-cache.org/Versions/v3/$(SQUID_VERSION_MAJOR)
 SQUID_LICENSE = GPLv2+
-- 
2.7.3

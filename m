From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 20 Apr 2016 20:45:11 +0200
Subject: [Buildroot] [git commit] squid: security bump to version 3.5.17
Message-ID: <20160420190130.782998022B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b157124a32efa995d05254f987acf9238f0d430e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
SQUID-2016:5 (CVE-2016-4051) - Buffer overflow in cachemgr.cgi
SQUID-2016:6 (CVE-2016-4052) - Multiple issues in ESI processing.
CVE-2016-4053 & CVE-2016-4054 which are part of SQUID-2016:6.

Switch to xz-compressed tarball as well.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/squid/squid.hash | 6 +++---
 package/squid/squid.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/squid/squid.hash b/package/squid/squid.hash
index 37cfaa1..4f0090e 100644
--- a/package/squid/squid.hash
+++ b/package/squid/squid.hash
@@ -1,3 +1,3 @@
-# From http://www.squid-cache.org/Versions/v3/3.5/squid-3.5.16.tar.bz2.asc
-md5 ab9c92f4a579e056cd8afafa0a95f612  squid-3.5.16.tar.bz2
-sha1 f3a2b8a7451b79d24e8fd166306e2c7248ef3be9  squid-3.5.16.tar.bz2
+# From http://www.squid-cache.org/Versions/v3/3.5/squid-3.5.17.tar.xz.asc
+md5	2dc73cc01e77b1bd16d9070780ae79b1	squid-3.5.17.tar.xz
+sha1	8ef6fe7d778df9538a4aa29d7e8ace52246e7a23	squid-3.5.17.tar.xz
diff --git a/package/squid/squid.mk b/package/squid/squid.mk
index b2e0c98..1d601b5 100644
--- a/package/squid/squid.mk
+++ b/package/squid/squid.mk
@@ -5,8 +5,8 @@
 ################################################################################
 
 SQUID_VERSION_MAJOR = 3.5
-SQUID_VERSION = $(SQUID_VERSION_MAJOR).16
-SQUID_SOURCE = squid-$(SQUID_VERSION).tar.bz2
+SQUID_VERSION = $(SQUID_VERSION_MAJOR).17
+SQUID_SOURCE = squid-$(SQUID_VERSION).tar.xz
 SQUID_SITE = http://www.squid-cache.org/Versions/v3/$(SQUID_VERSION_MAJOR)
 SQUID_LICENSE = GPLv2+
 SQUID_LICENSE_FILES = COPYING

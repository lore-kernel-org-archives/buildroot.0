From: Peter Seiderer <ps.report@gmx.net>
Date: Sun, 13 Jun 2021 00:27:49 +0200
Subject: [Buildroot] [PATCH v1 2/2] package/squid: security bump to version
 4.15
In-Reply-To: <20210612222749.25669-1-ps.report@gmx.net>
References: <20210612222749.25669-1-ps.report@gmx.net>
Message-ID: <20210612222749.25669-2-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Peter Korsgaard <peter@korsgaard.com>

Fixes the following security issues:

- CVE-2021-28651: Denial of Service in URN processing
  Due to a buffer management bug Squid is vulnerable to a Denial of service
  attack against the server it is operating on.

  This attack is limited to proxies which attempt to resolve a "urn:"
  resource identifier.  Support for this resolving is enabled by default in
  all Squid.

  https://github.com/squid-cache/squid/security/advisories/GHSA-ch36-9jhx-phm4

- CVE-2021-28652: Denial of Service issue in Cache Manager
  Due to an incorrect parser validation bug Squid is vulnerable to a Denial
  of Service attack against the Cache Manager API.

  https://github.com/squid-cache/squid/security/advisories/GHSA-m47m-9hvw-7447

- CVE-2021-28662: Denial of Service in HTTP Response Processing
  Due to an input validation bug Squid is vulnerable to a Denial of Service
  against all clients using the proxy.

  https://github.com/squid-cache/squid/security/advisories/GHSA-jjq6-mh2h-g39h

- CVE-2021-31806, CVE-2021-31807, CVE-2021-31808: Multiple Issues in HTTP
  Range header
  Due to an incorrect input validation bug Squid is vulnerable to
  a Denial of Service attack against all clients using the proxy.

  https://github.com/squid-cache/squid/security/advisories/GHSA-pxwq-f3qr-w2xf

- CVE-2021-33620: Denial of Service in HTTP Response processing
  Due to an input validation bug Squid is vulnerable to a Denial of Service
  against all clients using the proxy.

  https://github.com/squid-cache/squid/security/advisories/GHSA-572g-rvwr-6c7f

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/squid/squid.hash | 8 ++++----
 package/squid/squid.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/squid/squid.hash b/package/squid/squid.hash
index a2aaba5fd5..12a9e5d293 100644
--- a/package/squid/squid.hash
+++ b/package/squid/squid.hash
@@ -1,6 +1,6 @@
-# From http://www.squid-cache.org/Versions/v4/squid-4.14.tar.xz.asc
-md5  7d9ba82703cd770b2ede169a0c1de94a  squid-4.14.tar.xz
-sha1  71ae13a845a6a7ffc69ce11086ea3e427625bc08  squid-4.14.tar.xz
+# From http://www.squid-cache.org/Versions/v4/squid-4.15.tar.xz.asc
+md5  a593de9dc888dfeca4f1f7db2cd7d3b9  squid-4.15.tar.xz
+sha1  60bda34ba39657e2d870c8c1d2acece8a69c3075  squid-4.15.tar.xz
 # Locally calculated
-sha256  f1097daa6434897c159bc100978b51347c0339041610845d0afa128151729ffc  squid-4.14.tar.xz
+sha256  b693a4e5ab2811a8a854f60de0a62afbbf3a952bb1d047952c9ae01321f84a25  squid-4.15.tar.xz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/squid/squid.mk b/package/squid/squid.mk
index 7e6865f8ed..b23a8d26ed 100644
--- a/package/squid/squid.mk
+++ b/package/squid/squid.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SQUID_VERSION = 4.14
+SQUID_VERSION = 4.15
 SQUID_SOURCE = squid-$(SQUID_VERSION).tar.xz
 SQUID_SITE = http://www.squid-cache.org/Versions/v4
 SQUID_LICENSE = GPL-2.0+
-- 
2.31.1

From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 30 Mar 2021 17:15:49 +0200
Subject: [Buildroot] [git commit] package/squid: security bump to version
 4.14
Message-ID: <20210330145156.038428A592@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7b5638460359b41381cd04464ec076e2306dc2fd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes the following security issues:

- CVE-2020-25097: HTTP Request Smuggling

  Due to improper input validation Squid is vulnerable to an HTTP Request
  Smuggling attack.

For more details, see the advisory:
https://github.com/squid-cache/squid/security/advisories/GHSA-jvf6-h9gj-pmj6

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/squid/squid.hash | 8 ++++----
 package/squid/squid.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/squid/squid.hash b/package/squid/squid.hash
index b7e051960e..a2aaba5fd5 100644
--- a/package/squid/squid.hash
+++ b/package/squid/squid.hash
@@ -1,6 +1,6 @@
-# From http://www.squid-cache.org/Versions/v4/squid-4.13.tar.xz.asc
-md5  492e54afc15821141ff1d1d9903854d6  squid-4.13.tar.xz
-sha1  cac95c18789e9ecd6620c2f278fc3900498c065b  squid-4.13.tar.xz
+# From http://www.squid-cache.org/Versions/v4/squid-4.14.tar.xz.asc
+md5  7d9ba82703cd770b2ede169a0c1de94a  squid-4.14.tar.xz
+sha1  71ae13a845a6a7ffc69ce11086ea3e427625bc08  squid-4.14.tar.xz
 # Locally calculated
-sha256  6891a0f540e60779b4f24f1802a302f813c6f473ec7336a474ed68c3e2e53ee0  squid-4.13.tar.xz
+sha256  f1097daa6434897c159bc100978b51347c0339041610845d0afa128151729ffc  squid-4.14.tar.xz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/squid/squid.mk b/package/squid/squid.mk
index a3ccbbcf8e..7e6865f8ed 100644
--- a/package/squid/squid.mk
+++ b/package/squid/squid.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SQUID_VERSION = 4.13
+SQUID_VERSION = 4.14
 SQUID_SOURCE = squid-$(SQUID_VERSION).tar.xz
 SQUID_SITE = http://www.squid-cache.org/Versions/v4
 SQUID_LICENSE = GPL-2.0+

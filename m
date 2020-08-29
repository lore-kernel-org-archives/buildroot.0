From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 29 Aug 2020 13:37:11 +0200
Subject: [Buildroot] [git commit branch/2020.05.x] package/squid: security
 bump to version 4.13
Message-ID: <20200829112950.B3E8F82B49@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=37fcf4c346d748d2e3a913334de31ccb3bb46aac
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.05.x

Fixes the following security issues:

CVE-2020-15810: HTTP(S) Request Smuggling
Due to incorrect data validation Squid is vulnerable to HTTP Request
Smuggling attacks against HTTP and HTTPS traffic.  This leads to cache
poisoning.
https://github.com/squid-cache/squid/security/advisories/GHSA-3365-q9qx-f98m

CVE-2020-15811: HTTP(S) Request Splitting
Due to incorrect data validation Squid is vulnerable to HTTP Request
Splitting attacks against HTTP and HTTPS traffic.  This leads to cache
poisoning.
https://github.com/squid-cache/squid/security/advisories/GHSA-c7p8-xqhm-49wv

CVE-2020-24606: Denial of Service processing Cache Digest Response
Due to Improper Input Validation Squid is vulnerable to a Denial of Service
attack against the machine operating Squid.
https://github.com/squid-cache/squid/security/advisories/GHSA-vvj7-xjgq-g2jg

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 71ac106bb3b4759d5a050ecade9ba687a27801ff)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/squid/squid.hash | 8 ++++----
 package/squid/squid.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/squid/squid.hash b/package/squid/squid.hash
index a3ef655185..b7e051960e 100644
--- a/package/squid/squid.hash
+++ b/package/squid/squid.hash
@@ -1,6 +1,6 @@
-# From http://www.squid-cache.org/Versions/v4/squid-4.12.tar.xz.asc
-md5  ad7a4a8a0031cae3435717a759173829  squid-4.12.tar.xz
-sha1  316b8a343aa542b5e7469d33b9d726bee00679c6  squid-4.12.tar.xz
+# From http://www.squid-cache.org/Versions/v4/squid-4.13.tar.xz.asc
+md5  492e54afc15821141ff1d1d9903854d6  squid-4.13.tar.xz
+sha1  cac95c18789e9ecd6620c2f278fc3900498c065b  squid-4.13.tar.xz
 # Locally calculated
-sha256  f42a03c8b3dc020722c88bf1a87da8cb0c087b2f66b41d8256c77ee1b527e317  squid-4.12.tar.xz
+sha256  6891a0f540e60779b4f24f1802a302f813c6f473ec7336a474ed68c3e2e53ee0  squid-4.13.tar.xz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/squid/squid.mk b/package/squid/squid.mk
index 6bce74b7d6..1ba375e547 100644
--- a/package/squid/squid.mk
+++ b/package/squid/squid.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SQUID_VERSION = 4.12
+SQUID_VERSION = 4.13
 SQUID_SOURCE = squid-$(SQUID_VERSION).tar.xz
 SQUID_SITE = http://www.squid-cache.org/Versions/v4
 SQUID_LICENSE = GPL-2.0+

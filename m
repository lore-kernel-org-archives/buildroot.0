From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 7 May 2020 23:13:43 +0200
Subject: [Buildroot] [git commit] package/squid: security bump to version
 4.11
Message-ID: <20200507205816.AF65690F0A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b365c642369ca76cb138fd0b5be6457865a3d5ce
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix CVE-2020-11945: An issue was discovered in Squid before 5.0.2. A
remote attacker can replay a sniffed Digest Authentication nonce to gain
access to resources that are otherwise forbidden. This occurs because
the attacker can overflow the nonce reference counter (a short integer).
Remote code execution may occur if the pooled token credentials are
freed (instead of replayed as valid credentials).

http://www.squid-cache.org/Advisories/SQUID-2020_4.txt

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/squid/squid.hash | 8 ++++----
 package/squid/squid.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/squid/squid.hash b/package/squid/squid.hash
index 765e67cf3d..3c8ab64d35 100644
--- a/package/squid/squid.hash
+++ b/package/squid/squid.hash
@@ -1,6 +1,6 @@
-# From http://www.squid-cache.org/Versions/v4/squid-4.10.tar.xz.asc
-md5  af7ac6e70f9bd03ae4fcec0c9b99c38a  squid-4.10.tar.xz
-sha1  b8b267771550bb8c7f2b2968b305118090e7217a  squid-4.10.tar.xz
+# From http://www.squid-cache.org/Versions/v4/squid-4.11.tar.xz.asc
+md5  10f34e852153a9996aa4614670e2bda1  squid-4.11.tar.xz
+sha1  053277bf5497163ffc9261b9807abda5959bb6fc  squid-4.11.tar.xz
 # Locally calculated
-sha256  98f0100afd8a42ea5f6b81eb98b0e4b36d7a54beab1c73d2f1705ab49b025f1f  squid-4.10.tar.xz
+sha256  4ed947612410263f57ad0e39bfd087e60fb714f028d7d3b0e469943efd34287d  squid-4.11.tar.xz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/squid/squid.mk b/package/squid/squid.mk
index aeaec425e4..d281eee3ed 100644
--- a/package/squid/squid.mk
+++ b/package/squid/squid.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SQUID_VERSION = 4.10
+SQUID_VERSION = 4.11
 SQUID_SOURCE = squid-$(SQUID_VERSION).tar.xz
 SQUID_SITE = http://www.squid-cache.org/Versions/v4
 SQUID_LICENSE = GPL-2.0+

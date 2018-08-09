From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 9 Aug 2018 23:00:40 +0200
Subject: [Buildroot] [git commit branch/2018.05.x] package/apache: security
 bump version to 2.4.34
Message-ID: <20180809205417.E116D8B75C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=49b179424bbf1227081c8d385f21ebc9c2c52104
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.05.x

Fixes:
  *) SECURITY: CVE-2018-8011 (cve.mitre.org)
     mod_md: DoS via Coredumps on specially crafted requests

  *) SECURITY: CVE-2018-1333 (cve.mitre.org)
     mod_http2: DoS for HTTP/2 connections by specially crafted requests

Changelog: http://www.apache.org/dist/httpd/CHANGES_2.4.34

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 8ef1aaa08478a2d84c17e8bd12e33b0802433ac1)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/apache/apache.hash | 5 +++--
 package/apache/apache.mk   | 2 +-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/apache/apache.hash b/package/apache/apache.hash
index 76c7c766cb..74a48ae914 100644
--- a/package/apache/apache.hash
+++ b/package/apache/apache.hash
@@ -1,3 +1,4 @@
-# From http://archive.apache.org/dist/httpd/httpd-2.4.33.tar.bz2.sha256
-sha256 de02511859b00d17845b9abdd1f975d5ccb5d0b280c567da5bf2ad4b70846f05 httpd-2.4.33.tar.bz2
+# From http://archive.apache.org/dist/httpd/httpd-2.4.34.tar.bz2.sha256
+sha256 fa53c95631febb08a9de41fd2864cfff815cf62d9306723ab0d4b8d7aa1638f0 httpd-2.4.34.tar.bz2
+# Locally computed
 sha256 c49c0819a726b70142621715dae3159c47b0349c2bc9db079070f28dadac0229 LICENSE
diff --git a/package/apache/apache.mk b/package/apache/apache.mk
index 23414fe44d..446e58c43a 100644
--- a/package/apache/apache.mk
+++ b/package/apache/apache.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-APACHE_VERSION = 2.4.33
+APACHE_VERSION = 2.4.34
 APACHE_SOURCE = httpd-$(APACHE_VERSION).tar.bz2
 APACHE_SITE = http://archive.apache.org/dist/httpd
 APACHE_LICENSE = Apache-2.0

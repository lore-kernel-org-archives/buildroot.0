From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 30 Sep 2018 09:59:17 +0200
Subject: [Buildroot] [PATCH 1/1] package/apache: security bump to version
 2.4.35
Message-ID: <20180930075917.6025-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes: CVE-2018-11763: mod_http2, DoS via continuous SETTINGS frames
https://lists.apache.org/thread.html/d435b0267a76501b9e06c552b20c887171064cde38e46d678da4d3dd@%3Cannounce.httpd.apache.org%3E

Release notes:
https://lists.apache.org/thread.html/5d604774652fc073b1b161584d0d1efbdba7898c40ae2e2334725e5f@%3Cannounce.httpd.apache.org%3E

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/apache/apache.hash | 4 ++--
 package/apache/apache.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/apache/apache.hash b/package/apache/apache.hash
index 74a48ae914..32743656fd 100644
--- a/package/apache/apache.hash
+++ b/package/apache/apache.hash
@@ -1,4 +1,4 @@
-# From http://archive.apache.org/dist/httpd/httpd-2.4.34.tar.bz2.sha256
-sha256 fa53c95631febb08a9de41fd2864cfff815cf62d9306723ab0d4b8d7aa1638f0 httpd-2.4.34.tar.bz2
+# From http://archive.apache.org/dist/httpd/httpd-2.4.35.tar.bz2.sha256
+sha256 2607c6fdd4d12ac3f583127629291e9432b247b782396a563bec5678aae69b56 httpd-2.4.35.tar.bz2
 # Locally computed
 sha256 c49c0819a726b70142621715dae3159c47b0349c2bc9db079070f28dadac0229 LICENSE
diff --git a/package/apache/apache.mk b/package/apache/apache.mk
index d50e3774ff..3ac317216d 100644
--- a/package/apache/apache.mk
+++ b/package/apache/apache.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-APACHE_VERSION = 2.4.34
+APACHE_VERSION = 2.4.35
 APACHE_SOURCE = httpd-$(APACHE_VERSION).tar.bz2
 APACHE_SITE = http://archive.apache.org/dist/httpd
 APACHE_LICENSE = Apache-2.0
-- 
2.19.0

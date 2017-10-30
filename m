From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 30 Oct 2017 21:11:01 +0200
Subject: [Buildroot] [PATCH 1/2] apr: security bump to version 1.6.3
Message-ID: <6c5b5801af6b7ce17eae8176827b0ce141a15c94.1509390662.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes CVE-2017-12613: Out-of-bounds array deref in apr_time_exp*()
functions.

Use upstream provided SHA256 hash.

Add license has.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/apr/apr.hash | 6 ++++--
 package/apr/apr.mk   | 2 +-
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/apr/apr.hash b/package/apr/apr.hash
index 7a5969e52fdb..be130a5d780c 100644
--- a/package/apr/apr.hash
+++ b/package/apr/apr.hash
@@ -1,2 +1,4 @@
-# From http://archive.apache.org/dist/apr/apr-1.6.2.tar.bz2.sha1
-sha1 01b0d4faa0194825e8e525b9ac7ccfb832471d50  apr-1.6.2.tar.bz2
+# From http://www.apache.org/dist/apr/apr-1.6.3.tar.bz2.sha256
+sha256 131f06d16d7aabd097fa992a33eec2b6af3962f93e6d570a9bd4d85e95993172  apr-1.6.3.tar.bz2
+# Locally calculated
+sha256 f854aeef66ecd55a126226e82b3f26793fc3b1c584647f6a0edc5639974c38ad  LICENSE
diff --git a/package/apr/apr.mk b/package/apr/apr.mk
index ffb30991ecbf..58b1d86b2845 100644
--- a/package/apr/apr.mk
+++ b/package/apr/apr.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-APR_VERSION = 1.6.2
+APR_VERSION = 1.6.3
 APR_SOURCE = apr-$(APR_VERSION).tar.bz2
 APR_SITE = http://archive.apache.org/dist/apr
 APR_LICENSE = Apache-2.0
-- 
2.14.2

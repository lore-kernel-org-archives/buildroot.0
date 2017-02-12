From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 12 Feb 2017 22:59:58 +0100
Subject: [Buildroot] [PATCH] bind: security bump to version 9.11.0-P3
Message-ID: <20170212215958.9654-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes CVE-2017-3135: Combination of DNS64 and RPZ Can Lead to Crash:

https://kb.isc.org/article/AA-01453

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/bind/bind.hash | 4 ++--
 package/bind/bind.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/bind/bind.hash b/package/bind/bind.hash
index dc472b121..780e43b9a 100644
--- a/package/bind/bind.hash
+++ b/package/bind/bind.hash
@@ -1,2 +1,2 @@
-# Verified from http://ftp.isc.org/isc/bind9/9.11.0-P2/bind-9.11.0-P2.tar.gz.sha256.asc
-sha256 d651f83ce1c08c83d6ac8201685c4f2b5fdb79794f3a4f93c3948e0ef439c1e5  bind-9.11.0-P2.tar.gz
+# Verified from http://ftp.isc.org/isc/bind9/9.11.0-P3/bind-9.11.0-P3.tar.gz.sha256.asc
+sha256 0feee0374bcbdee73a9d4277f3c5007622279572d520d7c27a4b64015d8ca9e9  bind-9.11.0-P3.tar.gz
diff --git a/package/bind/bind.mk b/package/bind/bind.mk
index 714308977..860ee9d5e 100644
--- a/package/bind/bind.mk
+++ b/package/bind/bind.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BIND_VERSION = 9.11.0-P2
+BIND_VERSION = 9.11.0-P3
 BIND_SITE = ftp://ftp.isc.org/isc/bind9/$(BIND_VERSION)
 # bind does not support parallel builds.
 BIND_MAKE = $(MAKE1)
-- 
2.11.0

From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 22 Jan 2019 19:15:42 +0100
Subject: [Buildroot] [PATCH] package/apache: security bump to version 2.4.38
Message-ID: <20190122181542.11918-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes the following security vulnerabilities:

  *) SECURITY: CVE-2018-17199 (cve.mitre.org)
     mod_session: mod_session_cookie does not respect expiry time allowing
     sessions to be reused.  [Hank Ibell]

  *) SECURITY: CVE-2018-17189 (cve.mitre.org)
     mod_http2: fixes a DoS attack vector. By sending slow request bodies
     to resources not consuming them, httpd cleanup code occupies a server
     thread unnecessarily. This was changed to an immediate stream reset
     which discards all stream state and incoming data.  [Stefan Eissing]

  *) SECURITY: CVE-2019-0190 (cve.mitre.org)
     mod_ssl: Fix infinite loop triggered by a client-initiated
     renegotiation in TLSv1.2 (or earlier) with OpenSSL 1.1.1 and
     later.  PR 63052.  [Joe Orton]

For more details, see the CHANGES file:
https://www.apache.org/dist/httpd/CHANGES_2.4.38

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/apache/apache.hash | 4 ++--
 package/apache/apache.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/apache/apache.hash b/package/apache/apache.hash
index 6d21f0f614..fd42cd4872 100644
--- a/package/apache/apache.hash
+++ b/package/apache/apache.hash
@@ -1,4 +1,4 @@
-# From http://archive.apache.org/dist/httpd/httpd-2.4.35.tar.bz2.sha256
-sha256 3498dc5c6772fac2eb7307dc7963122ffe243b5e806e0be4fb51974ff759d726 httpd-2.4.37.tar.bz2
+# From http://archive.apache.org/dist/httpd/httpd-2.4.38.tar.bz2.sha256
+sha256 7dc65857a994c98370dc4334b260101a7a04be60e6e74a5c57a6dee1bc8f394a httpd-2.4.38.tar.bz2
 # Locally computed
 sha256 c49c0819a726b70142621715dae3159c47b0349c2bc9db079070f28dadac0229 LICENSE
diff --git a/package/apache/apache.mk b/package/apache/apache.mk
index a95ac69f31..dd8f175f9c 100644
--- a/package/apache/apache.mk
+++ b/package/apache/apache.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-APACHE_VERSION = 2.4.37
+APACHE_VERSION = 2.4.38
 APACHE_SOURCE = httpd-$(APACHE_VERSION).tar.bz2
 APACHE_SITE = http://archive.apache.org/dist/httpd
 APACHE_LICENSE = Apache-2.0
-- 
2.11.0

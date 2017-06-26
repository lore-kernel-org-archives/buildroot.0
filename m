From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 26 Jun 2017 09:58:50 +0200
Subject: [Buildroot] [git commit branch/2017.05.x] apache: security bump to
	version 2.4.26
Message-ID: <20170626081139.72DC87FB5D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=151b58389c83842bf246e6808b7f46363b1a8c7d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.05.x

Fixes the following security issues:

CVE-2017-3167: In Apache httpd 2.2.x before 2.2.33 and 2.4.x before 2.4.26,
use of the ap_get_basic_auth_pw() by third-party modules outside of the
authentication phase may lead to authentication requirements being bypassed.

CVE-2017-3169: In Apache httpd 2.2.x before 2.2.33 and 2.4.x before 2.4.26,
mod_ssl may dereference a NULL pointer when third-party modules call
ap_hook_process_connection() during an HTTP request to an HTTPS port.

CVE-2017-7659: A maliciously constructed HTTP/2 request could cause
mod_http2 to dereference a NULL pointer and crash the server process.

CVE-2017-7668: The HTTP strict parsing changes added in Apache httpd 2.2.32
and 2.4.24 introduced a bug in token list parsing, which allows
ap_find_token() to search past the end of its input string.  By maliciously
crafting a sequence of request headers, an attacker may be able to cause a
segmentation fault, or to force ap_find_token() to return an incorrect
value.

CVE-2017-7679: In Apache httpd 2.2.x before 2.2.33 and 2.4.x before 2.4.26,
mod_mime can read one byte past the end of a buffer when sending a malicious
Content-Type response header.

While we're at it, use the upstream sha256 checksum instead of sha1.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit e8a15fd693261306c6e9a0733569a89d5b795295)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/apache/apache.hash | 4 ++--
 package/apache/apache.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/apache/apache.hash b/package/apache/apache.hash
index 38fd883..fe7174a 100644
--- a/package/apache/apache.hash
+++ b/package/apache/apache.hash
@@ -1,2 +1,2 @@
-# From http://www.apache.org/dist/httpd/httpd-2.4.23.tar.bz2.sha1
-sha1 bd6d138c31c109297da2346c6e7b93b9283993d2  httpd-2.4.25.tar.bz2
+# From http://www.apache.org/dist/httpd/httpd-2.4.26.tar.bz2.sha256
+sha256 a07eb52fafc879e0149d31882f7da63173e72df4478db4dc69f7a775b663d387 httpd-2.4.26.tar.bz2
diff --git a/package/apache/apache.mk b/package/apache/apache.mk
index ae629bd..b276b8d 100644
--- a/package/apache/apache.mk
+++ b/package/apache/apache.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-APACHE_VERSION = 2.4.25
+APACHE_VERSION = 2.4.26
 APACHE_SOURCE = httpd-$(APACHE_VERSION).tar.bz2
 APACHE_SITE = http://archive.apache.org/dist/httpd
 APACHE_LICENSE = Apache-2.0

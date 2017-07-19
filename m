From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 20 Jul 2017 00:12:10 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] package/apache: security
	bump to version 2.4.27
Message-ID: <20170720055508.AD644800CC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=baf5a9d8c751b16e6c8aa4dee6577751c3d53e94
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

Fixes the following security issues:

CVE-2017-9788 - Uninitialized memory reflection in mod_auth_digest

The value placeholder in [Proxy-]Authorization headers of type 'Digest' was
not initialized or reset before or between successive key=value assignments.
by mod_auth_digest.

Providing an initial key with no '=' assignment could reflect the stale
value of uninitialized pool memory used by the prior request, leading to
leakage of potentially confidential information, and a segfault.

CVE-2017-9789 - Read after free in mod_http2

When under stress, closing many connections, the HTTP/2 handling code would
sometimes access memory after it has been freed, resulting in potentially
erratic behaviour.

Announcement: http://www.apache.org/dist/httpd/Announcement2.4.html
Release notes: http://www.apache.org/dist/httpd/CHANGES_2.4.27

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit cf9b7cedac14de7cf5650589bf4c37635b5438a9)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/apache/apache.hash | 4 ++--
 package/apache/apache.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/apache/apache.hash b/package/apache/apache.hash
index fe7174a..f29ae45 100644
--- a/package/apache/apache.hash
+++ b/package/apache/apache.hash
@@ -1,2 +1,2 @@
-# From http://www.apache.org/dist/httpd/httpd-2.4.26.tar.bz2.sha256
-sha256 a07eb52fafc879e0149d31882f7da63173e72df4478db4dc69f7a775b663d387 httpd-2.4.26.tar.bz2
+# From http://www.apache.org/dist/httpd/httpd-2.4.27.tar.bz2.sha256
+sha256 71fcc128238a690515bd8174d5330a5309161ef314a326ae45c7c15ed139c13a httpd-2.4.27.tar.bz2
diff --git a/package/apache/apache.mk b/package/apache/apache.mk
index b276b8d..857e538 100644
--- a/package/apache/apache.mk
+++ b/package/apache/apache.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-APACHE_VERSION = 2.4.26
+APACHE_VERSION = 2.4.27
 APACHE_SOURCE = httpd-$(APACHE_VERSION).tar.bz2
 APACHE_SITE = http://archive.apache.org/dist/httpd
 APACHE_LICENSE = Apache-2.0

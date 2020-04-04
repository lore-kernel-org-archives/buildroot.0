From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 4 Apr 2020 17:26:49 +0200
Subject: [Buildroot] [git commit] package/apache: security bump to version
 2.4.43
Message-ID: <20200404151743.F16228B4D3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2bf40ad66b16744972443127e9ee6f8d8f32c476
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes the following security issues:

  *) SECURITY: CVE-2020-1934 (cve.mitre.org)
     mod_proxy_ftp: Use of uninitialized value with malicious backend FTP
     server. [Eric Covener]

  *) SECURITY: CVE-2020-1927 (cve.mitre.org)
     rewrite, core: Set PCRE_DOTALL flag by default to avoid unpredictable
     matches and substitutions with encoded line break characters.
     The fix for CVE-2019-10098 was not effective.  [Ruediger Pluem]

The LICENSE file has been updated to fix a s/waranties/warranties/ typo, so
update the hash to match and adjust the spacing to match recent agreements:

-This software is provided "as is" and any express or implied waranties,
+This software is provided "as is" and any express or implied warranties,

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/apache/apache.hash | 6 +++---
 package/apache/apache.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/apache/apache.hash b/package/apache/apache.hash
index 24c00eb94c..7b0e4ad8e7 100644
--- a/package/apache/apache.hash
+++ b/package/apache/apache.hash
@@ -1,4 +1,4 @@
-# From http://archive.apache.org/dist/httpd/httpd-2.4.41.tar.bz2.sha256
-sha256 133d48298fe5315ae9366a0ec66282fa4040efa5d566174481077ade7d18ea40 httpd-2.4.41.tar.bz2
+# From http://archive.apache.org/dist/httpd/httpd-2.4.43.tar.bz2.sha256
+sha256  a497652ab3fc81318cdc2a203090a999150d86461acff97c1065dc910fe10f43  httpd-2.4.43.tar.bz2
 # Locally computed
-sha256 c49c0819a726b70142621715dae3159c47b0349c2bc9db079070f28dadac0229 LICENSE
+sha256  47b8c2b6c3309282a99d4a3001575c790fead690cc14734628c4667d2bbffc43  LICENSE
diff --git a/package/apache/apache.mk b/package/apache/apache.mk
index 5fcb9e5371..48a64eae0e 100644
--- a/package/apache/apache.mk
+++ b/package/apache/apache.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-APACHE_VERSION = 2.4.41
+APACHE_VERSION = 2.4.43
 APACHE_SOURCE = httpd-$(APACHE_VERSION).tar.bz2
 APACHE_SITE = http://archive.apache.org/dist/httpd
 APACHE_LICENSE = Apache-2.0

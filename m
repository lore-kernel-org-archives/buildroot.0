From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 17 Oct 2014 14:17:48 +0200
Subject: [Buildroot] [git commit] libxml2: security bump to version 2.9.2
Message-ID: <20141017121829.1AC12B328C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=841c63ce669d67481450b57f0f99b44c736d97dc
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
CVE-2014-3660 - billion laugh variant
CVE-2014-0191 - Do not fetch external parameter entities

Also add hash file.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libxml2/libxml2.hash |    2 ++
 package/libxml2/libxml2.mk   |    3 ++-
 2 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/package/libxml2/libxml2.hash b/package/libxml2/libxml2.hash
new file mode 100644
index 0000000..69f4fdc
--- /dev/null
+++ b/package/libxml2/libxml2.hash
@@ -0,0 +1,2 @@
+# Locally calculated after checking pgp signature
+sha256	5178c30b151d044aefb1b08bf54c3003a0ac55c59c866763997529d60770d5bc	libxml2-2.9.2.tar.gz
diff --git a/package/libxml2/libxml2.mk b/package/libxml2/libxml2.mk
index f27c993..4e296fa 100644
--- a/package/libxml2/libxml2.mk
+++ b/package/libxml2/libxml2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBXML2_VERSION = 2.9.1
+LIBXML2_VERSION = 2.9.2
 LIBXML2_SITE = ftp://xmlsoft.org/libxml2
 LIBXML2_INSTALL_STAGING = YES
 LIBXML2_AUTORECONF = YES
@@ -19,6 +19,7 @@ endif
 LIBXML2_CONF_OPTS = --with-gnu-ld --without-python --without-debug --without-lzma
 
 HOST_LIBXML2_DEPENDENCIES = host-pkgconf
+LIBXML2_DEPENDENCIES = host-pkgconf
 
 HOST_LIBXML2_CONF_OPTS = --without-zlib --without-lzma --without-python
 

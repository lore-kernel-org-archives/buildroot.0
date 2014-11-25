From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 25 Nov 2014 22:33:01 +0100
Subject: [Buildroot] [git commit] libpng: security bump to version 1.6.15
Message-ID: <20141125213632.6F1AD7FEF8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b89ce67523b6c18ded565b36fcc09876434cd026
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes an out-of-bounds memory access in png_user_version_check().

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...isable-tools.patch => 0001-disable-tools.patch} |    0
 ...refix.patch => 0002-ignore-symbol-prefix.patch} |    0
 package/libpng/libpng.hash                         |    3 +++
 package/libpng/libpng.mk                           |    2 +-
 4 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/package/libpng/libpng-01-disable-tools.patch b/package/libpng/0001-disable-tools.patch
similarity index 100%
rename from package/libpng/libpng-01-disable-tools.patch
rename to package/libpng/0001-disable-tools.patch
diff --git a/package/libpng/libpng-02-ignore-symbol-prefix.patch b/package/libpng/0002-ignore-symbol-prefix.patch
similarity index 100%
rename from package/libpng/libpng-02-ignore-symbol-prefix.patch
rename to package/libpng/0002-ignore-symbol-prefix.patch
diff --git a/package/libpng/libpng.hash b/package/libpng/libpng.hash
new file mode 100644
index 0000000..37f6067
--- /dev/null
+++ b/package/libpng/libpng.hash
@@ -0,0 +1,3 @@
+# From http://sourceforge.net/projects/libpng/files/libpng16/1.6.15/
+md5	a95cb387c53215b034203b41ec57c7e5	libpng-1.6.15.tar.xz
+sha1	bddeac8ca97fbcf54d6d32c6eefed5d94b49df88	libpng-1.6.15.tar.xz
diff --git a/package/libpng/libpng.mk b/package/libpng/libpng.mk
index 99510ca..67bf141 100644
--- a/package/libpng/libpng.mk
+++ b/package/libpng/libpng.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBPNG_VERSION = 1.6.12
+LIBPNG_VERSION = 1.6.15
 LIBPNG_SERIES = 16
 LIBPNG_SOURCE = libpng-$(LIBPNG_VERSION).tar.xz
 LIBPNG_SITE = http://downloads.sourceforge.net/project/libpng/libpng${LIBPNG_SERIES}/$(LIBPNG_VERSION)

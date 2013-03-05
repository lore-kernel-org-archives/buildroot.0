From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 5 Mar 2013 08:55:44 +0100
Subject: [Buildroot] [git commit] new package: libtasn1
Message-ID: <20130305075651.3CE629AECB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e4d32a7a465e98770cb1da7afddf4b2d6b154790
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Libtasn1 is the ASN.1 library used by GnuTLS, GNU Shishi and some
other packages. It was written by Fabio Fiorina, and has been
shipped as part of GnuTLS for some time but is now a proper
GNU package.

[Peter: Both licenses are '+']
Signed-off-by: Stefan Fr??berg <stefan.froberg@petroprogram.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in            |    1 +
 package/libtasn1/Config.in   |    6 ++++++
 package/libtasn1/libtasn1.mk |   14 ++++++++++++++
 3 files changed, 21 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 56fdd2f..3706763 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -555,6 +555,7 @@ source "package/libglib2/Config.in"
 source "package/libical/Config.in"
 source "package/libnspr/Config.in"
 source "package/libsigc/Config.in"
+source "package/libtasn1/Config.in"
 source "package/libtpl/Config.in"
 source "package/libseccomp/Config.in"
 source "package/liburcu/Config.in"
diff --git a/package/libtasn1/Config.in b/package/libtasn1/Config.in
new file mode 100644
index 0000000..181fc69
--- /dev/null
+++ b/package/libtasn1/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_LIBTASN1
+	bool "libtasn1"
+	help
+	  ASN.1 library
+
+	  http://www.gnu.org/software/libtasn1
diff --git a/package/libtasn1/libtasn1.mk b/package/libtasn1/libtasn1.mk
new file mode 100644
index 0000000..d874b9a
--- /dev/null
+++ b/package/libtasn1/libtasn1.mk
@@ -0,0 +1,14 @@
+#############################################################
+#
+# libtasn1
+#
+#############################################################
+
+LIBTASN1_VERSION = 3.2
+LIBTASN1_SITE = http://ftp.gnu.org/gnu/libtasn1
+LIBTASN1_DEPENDENCIES = host-bison
+LIBTASN1_LICENSE = GPLv3+ LGPLv2.1+
+LIBTASN1_LICENSE_FILES = COPYING COPYING.LIB
+LIBTASN1_INSTALL_STAGING = YES
+
+$(eval $(autotools-package))

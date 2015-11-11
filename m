From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 11 Nov 2015 14:59:48 +0100
Subject: [Buildroot] [git commit branch/next] libnet: new package
Message-ID: <20151111140001.B58D481ED2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9d3855012c9ff5769451175fa47abeca908e40a9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

[Thomas: add hash file.]

Signed-off-by: Joris Lijssens <joris.lijssens@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in          |    1 +
 package/libnet/Config.in   |    7 +++++++
 package/libnet/libnet.hash |    3 +++
 package/libnet/libnet.mk   |   13 +++++++++++++
 4 files changed, 24 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index bdc3063..e0b42c0 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1019,6 +1019,7 @@ menu "Networking"
 	source "package/libmnl/Config.in"
 	source "package/libmodbus/Config.in"
 	source "package/libndp/Config.in"
+	source "package/libnet/Config.in"
 	source "package/libnetfilter_acct/Config.in"
 	source "package/libnetfilter_conntrack/Config.in"
 	source "package/libnetfilter_cthelper/Config.in"
diff --git a/package/libnet/Config.in b/package/libnet/Config.in
new file mode 100644
index 0000000..7186972
--- /dev/null
+++ b/package/libnet/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_LIBNET
+	bool "libnet"
+	help
+	  libnet provides a portable framework for low-level network
+	  packet construction.
+
+	  http://sourceforge.net/projects/libnet-dev
diff --git a/package/libnet/libnet.hash b/package/libnet/libnet.hash
new file mode 100644
index 0000000..dd33490
--- /dev/null
+++ b/package/libnet/libnet.hash
@@ -0,0 +1,3 @@
+# From https://sourceforge.net/projects/libnet-dev/files/
+sha1 dffff71c325584fdcf99b80567b60f8ad985e34c libnet-1.1.6.tar.gz
+md5 710296fe424a49344e5fcc0d09e53317 libnet-1.1.6.tar.gz
diff --git a/package/libnet/libnet.mk b/package/libnet/libnet.mk
new file mode 100644
index 0000000..d021f76
--- /dev/null
+++ b/package/libnet/libnet.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# libnet
+#
+################################################################################
+
+LIBNET_VERSION = 1.1.6
+LIBNET_SITE = http://sourceforge.net/projects/libnet-dev/files
+LIBNET_INSTALL_STAGING = YES
+LIBNET_LICENSE = BSD-2c
+LIBNET_LICENSE_FILES = doc/COPYING
+
+$(eval $(autotools-package))

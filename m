From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 30 Dec 2015 23:28:04 +0100
Subject: [Buildroot] [git commit] libdvbpsi: new package
Message-ID: <20151230222912.133D7822F7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=086b38d9ceba4b1f61fe28ebabb03dbf0dac111a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libdvbpsi is a library used by vlc for decoding MPEG TS

[Thomas:
 - add missing Config.in comment about the thread dependency.]

Signed-off-by: Pieterjan Camerlynck <pieterjan.camerlynck@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                |  1 +
 package/libdvbpsi/Config.in      | 12 ++++++++++++
 package/libdvbpsi/libdvbpsi.hash |  4 ++++
 package/libdvbpsi/libdvbpsi.mk   | 14 ++++++++++++++
 4 files changed, 31 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 25e574f..9145d15 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1017,6 +1017,7 @@ menu "Multimedia"
 	source "package/libbluray/Config.in"
 	source "package/libdcadec/Config.in"
 	source "package/libdvbcsa/Config.in"
+	source "package/libdvbpsi/Config.in"
 	source "package/libdvbsi/Config.in"
 	source "package/libdvdnav/Config.in"
 	source "package/libdvdread/Config.in"
diff --git a/package/libdvbpsi/Config.in b/package/libdvbpsi/Config.in
new file mode 100644
index 0000000..4d543bc
--- /dev/null
+++ b/package/libdvbpsi/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_LIBDVBPSI
+	bool "libdvbpsi"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	help
+	  libdvbpsi is a simple library designed for decoding and
+	  generation of MPEG TS and DVB PSI tables according to standards
+	  ISO/IEC 13818 and ITU-T H.222.0.
+
+	  http://www.videolan.org/developers/libdvbpsi.html
+
+comment "libdvbpsi needs a toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/libdvbpsi/libdvbpsi.hash b/package/libdvbpsi/libdvbpsi.hash
new file mode 100644
index 0000000..cf76616
--- /dev/null
+++ b/package/libdvbpsi/libdvbpsi.hash
@@ -0,0 +1,4 @@
+# From http://download.videolan.org/pub/libdvbpsi/1.3.0/libdvbpsi-1.3.0.tar.bz2.md5
+md5	2b217039a1299000c39423441f77e76a	libdvbpsi-1.3.0.tar.bz2
+# From http://download.videolan.org/pub/libdvbpsi/1.3.0/libdvbpsi-1.3.0.tar.bz2.sha256
+sha256	a2fed1d11980662f919bbd1f29e2462719e0f6227e1a531310bd5a706db0a1fe	libdvbpsi-1.3.0.tar.bz2
diff --git a/package/libdvbpsi/libdvbpsi.mk b/package/libdvbpsi/libdvbpsi.mk
new file mode 100644
index 0000000..218c19e
--- /dev/null
+++ b/package/libdvbpsi/libdvbpsi.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# libdvbpsi
+#
+################################################################################
+
+LIBDVBPSI_VERSION = 1.3.0
+LIBDVBPSI_SITE = http://download.videolan.org/pub/libdvbpsi/$(LIBDVBPSI_VERSION)
+LIBDVBPSI_SOURCE = libdvbpsi-$(LIBDVBPSI_VERSION).tar.bz2
+LIBDVBPSI_LICENSE = LGPLv2.1+
+LIBDVBPSI_LICENSE_FILES = COPYING
+LIBDVBPSI_INSTALL_STAGING = YES
+
+$(eval $(autotools-package))

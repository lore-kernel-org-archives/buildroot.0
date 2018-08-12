From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 12 Aug 2018 23:43:18 +0200
Subject: [Buildroot] [git commit branch/next] perl-io-interface: new package
Message-ID: <20180812213645.A4AF88C9DA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7c1defe10459568758410ec6740a519492455f89
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Christopher McCrory <chrismcc@gmail.com>
Acked-by: Francois Perrad <francois.perrad@gadz.org>
[Thomas: fix LICENSE variable.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                       |  1 +
 package/Config.in                                |  1 +
 package/perl-io-interface/Config.in              | 10 ++++++++++
 package/perl-io-interface/perl-io-interface.hash |  6 ++++++
 package/perl-io-interface/perl-io-interface.mk   | 14 ++++++++++++++
 5 files changed, 32 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 8348ce102f..ed5ca12991 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -489,6 +489,7 @@ F:	package/perl-date-manip/
 F:	package/perl-dbi/
 F:	package/perl-device-serialport/
 F:	package/perl-file-slurp/
+F:	package/perl-io-interface/
 
 N:	Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
 F:	package/audit/
diff --git a/package/Config.in b/package/Config.in
index ba5b0e1699..ac145b3a0f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -697,6 +697,7 @@ menu "Perl libraries/modules"
 	source "package/perl-http-message/Config.in"
 	source "package/perl-http-negotiate/Config.in"
 	source "package/perl-io-html/Config.in"
+	source "package/perl-io-interface/Config.in"
 	source "package/perl-io-socket-ssl/Config.in"
 	source "package/perl-json-tiny/Config.in"
 	source "package/perl-libwww-perl/Config.in"
diff --git a/package/perl-io-interface/Config.in b/package/perl-io-interface/Config.in
new file mode 100644
index 0000000000..7aa7064ec0
--- /dev/null
+++ b/package/perl-io-interface/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_PERL_IO_INTERFACE
+	bool "perl-io-interface"
+	depends on !BR2_STATIC_LIBS
+	help
+	  Access and modify network interface card configuration
+
+	  https://metacpan.org/release/IO-Interface
+
+comment "perl-io-interface needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
diff --git a/package/perl-io-interface/perl-io-interface.hash b/package/perl-io-interface/perl-io-interface.hash
new file mode 100644
index 0000000000..75e572f918
--- /dev/null
+++ b/package/perl-io-interface/perl-io-interface.hash
@@ -0,0 +1,6 @@
+# retrieved by scancpan from http://cpan.metacpan.org/
+md5    806f97aff5a7361b6f54cd494f4cc9fd IO-Interface-1.09.tar.gz
+sha256 e63e81c52eb1e0e60ec2d983f5552d2493e117179925c96757f23c4bd9fa713a IO-Interface-1.09.tar.gz
+
+# computed by scancpan
+sha256 b5a5bf59bd1be13f7f498e5aa2ea5c0c603c04a095dcf03a06aa5b83bbccf921 LICENSE
diff --git a/package/perl-io-interface/perl-io-interface.mk b/package/perl-io-interface/perl-io-interface.mk
new file mode 100644
index 0000000000..c0b399ace8
--- /dev/null
+++ b/package/perl-io-interface/perl-io-interface.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# perl-io-interface
+#
+################################################################################
+
+PERL_IO_INTERFACE_VERSION = 1.09
+PERL_IO_INTERFACE_SOURCE = IO-Interface-$(PERL_IO_INTERFACE_VERSION).tar.gz
+PERL_IO_INTERFACE_SITE = $(BR2_CPAN_MIRROR)/authors/id/L/LD/LDS
+PERL_IO_INTERFACE_DEPENDENCIES = host-perl-module-build
+PERL_IO_INTERFACE_LICENSE = Artistic-2.0
+PERL_IO_INTERFACE_LICENSE_FILES = LICENSE
+
+$(eval $(perl-package))

From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 12 Aug 2018 23:37:23 +0200
Subject: [Buildroot] [git commit branch/next] perl-device-serialport: new
 package
Message-ID: <20180812213055.1285C8C9C4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cd1788f676833da41a315851cdeb9bd55d4c2e10
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Christopher McCrory <chrismcc@gmail.com>
Acked-by: Francois Perrad <francois.perrad@gadz.org>
[Thomas: add _LICENSE variable.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                                 |  1 +
 package/Config.in                                          |  1 +
 package/perl-device-serialport/Config.in                   | 10 ++++++++++
 package/perl-device-serialport/perl-device-serialport.hash |  6 ++++++
 package/perl-device-serialport/perl-device-serialport.mk   | 13 +++++++++++++
 5 files changed, 31 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 3c80c20cf0..a1c037aedb 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -487,6 +487,7 @@ F:	package/perl-class-std/
 F:	package/perl-data-uuid/
 F:	package/perl-date-manip/
 F:	package/perl-dbi/
+F:	package/perl-device-serialport/
 
 N:	Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
 F:	package/audit/
diff --git a/package/Config.in b/package/Config.in
index 8d80c41560..23a5628f50 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -677,6 +677,7 @@ menu "Perl libraries/modules"
 	source "package/perl-date-manip/Config.in"
 	source "package/perl-datetime-tiny/Config.in"
 	source "package/perl-dbi/Config.in"
+	source "package/perl-device-serialport/Config.in"
 	source "package/perl-digest-hmac/Config.in"
 	source "package/perl-digest-md5/Config.in"
 	source "package/perl-digest-sha1/Config.in"
diff --git a/package/perl-device-serialport/Config.in b/package/perl-device-serialport/Config.in
new file mode 100644
index 0000000000..f14e9794d0
--- /dev/null
+++ b/package/perl-device-serialport/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_PERL_DEVICE_SERIALPORT
+	bool "perl-device-serialport"
+	depends on !BR2_STATIC_LIBS
+	help
+	  Linux/POSIX emulation of Win32::SerialPort functions.
+
+	  https://metacpan.org/release/Device-SerialPort
+
+comment "perl-device-serialport needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
diff --git a/package/perl-device-serialport/perl-device-serialport.hash b/package/perl-device-serialport/perl-device-serialport.hash
new file mode 100644
index 0000000000..35ddc13d3f
--- /dev/null
+++ b/package/perl-device-serialport/perl-device-serialport.hash
@@ -0,0 +1,6 @@
+# retrieved by scancpan from http://cpan.metacpan.org/
+md5    82c698151f934eb28c65d1838cee7d9e Device-SerialPort-1.04.tar.gz
+sha256 d392567cb39b4ea606c0e0acafd8ed72320311b995336ece5fcefcf9b150e9d7 Device-SerialPort-1.04.tar.gz
+
+# computed by scancpan
+sha256 59432e84eca65c10c4b627f8af0b00833685856b68242b816aea2a38283a124c README
diff --git a/package/perl-device-serialport/perl-device-serialport.mk b/package/perl-device-serialport/perl-device-serialport.mk
new file mode 100644
index 0000000000..a87a7447bd
--- /dev/null
+++ b/package/perl-device-serialport/perl-device-serialport.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# perl-device-serialport
+#
+################################################################################
+
+PERL_DEVICE_SERIALPORT_VERSION = 1.04
+PERL_DEVICE_SERIALPORT_SOURCE = Device-SerialPort-$(PERL_DEVICE_SERIALPORT_VERSION).tar.gz
+PERL_DEVICE_SERIALPORT_SITE = $(BR2_CPAN_MIRROR)/authors/id/C/CO/COOK
+PERL_DBI_LICENSE = Artistic or GPL-1.0+
+PERL_DEVICE_SERIALPORT_LICENSE_FILES = README
+
+$(eval $(perl-package))

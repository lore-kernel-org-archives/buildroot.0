From: Christopher McCrory <chrismcc@gmail.com>
Date: Fri, 10 Aug 2018 09:14:52 -0700
Subject: [Buildroot] [PATCH 08/18] perl-device-serialport: new package
In-Reply-To: <20180810161502.21598-1-chrismcc@gmail.com>
References: <20180810161502.21598-1-chrismcc@gmail.com>
Message-ID: <20180810161502.21598-9-chrismcc@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Christopher McCrory <chrismcc@gmail.com>
---
 package/Config.in                                          |  1 +
 package/perl-device-serialport/Config.in                   | 10 ++++++++++
 package/perl-device-serialport/perl-device-serialport.hash |  6 ++++++
 package/perl-device-serialport/perl-device-serialport.mk   | 12 ++++++++++++
 4 files changed, 29 insertions(+)
 create mode 100644 package/perl-device-serialport/Config.in
 create mode 100644 package/perl-device-serialport/perl-device-serialport.hash
 create mode 100644 package/perl-device-serialport/perl-device-serialport.mk

diff --git a/package/Config.in b/package/Config.in
index 73adb62e0b..cd01657802 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -678,6 +678,7 @@ menu "Perl libraries/modules"
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
index 0000000000..635179f80a
--- /dev/null
+++ b/package/perl-device-serialport/perl-device-serialport.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# perl-device-serialport
+#
+################################################################################
+
+PERL_DEVICE_SERIALPORT_VERSION = 1.04
+PERL_DEVICE_SERIALPORT_SOURCE = Device-SerialPort-$(PERL_DEVICE_SERIALPORT_VERSION).tar.gz
+PERL_DEVICE_SERIALPORT_SITE = $(BR2_CPAN_MIRROR)/authors/id/C/CO/COOK
+PERL_DEVICE_SERIALPORT_LICENSE_FILES = README
+
+$(eval $(perl-package))
-- 
2.14.4

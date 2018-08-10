From: Christopher McCrory <chrismcc@gmail.com>
Date: Fri, 10 Aug 2018 09:14:54 -0700
Subject: [Buildroot] [PATCH 10/18] perl-io-interface: new package
In-Reply-To: <20180810161502.21598-1-chrismcc@gmail.com>
References: <20180810161502.21598-1-chrismcc@gmail.com>
Message-ID: <20180810161502.21598-11-chrismcc@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Christopher McCrory <chrismcc@gmail.com>
---
 package/Config.in                                |  1 +
 package/perl-io-interface/Config.in              | 10 ++++++++++
 package/perl-io-interface/perl-io-interface.hash |  6 ++++++
 package/perl-io-interface/perl-io-interface.mk   | 14 ++++++++++++++
 4 files changed, 31 insertions(+)
 create mode 100644 package/perl-io-interface/Config.in
 create mode 100644 package/perl-io-interface/perl-io-interface.hash
 create mode 100644 package/perl-io-interface/perl-io-interface.mk

diff --git a/package/Config.in b/package/Config.in
index a458e56871..13a1b60588 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -698,6 +698,7 @@ menu "Perl libraries/modules"
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
index 0000000000..24f4eeb0b3
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
+PERL_IO_INTERFACE_LICENSE = Artistic or GPL-1.0+
+PERL_IO_INTERFACE_LICENSE_FILES = LICENSE
+
+$(eval $(perl-package))
-- 
2.14.4

From: Christopher McCrory <chrismcc@gmail.com>
Date: Sat, 11 Aug 2018 11:27:40 -0700
Subject: [Buildroot] [PATCH 08/17] perl-io-socket-multicast: new package
In-Reply-To: <20180811182749.20924-1-chrismcc@gmail.com>
References: <20180811182749.20924-1-chrismcc@gmail.com>
Message-ID: <20180811182749.20924-9-chrismcc@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Christopher McCrory <chrismcc@gmail.com>
---
 DEVELOPERS                                                 |  1 +
 package/Config.in                                          |  1 +
 package/perl-io-socket-multicast/Config.in                 | 11 +++++++++++
 .../perl-io-socket-multicast/perl-io-socket-multicast.hash |  6 ++++++
 .../perl-io-socket-multicast/perl-io-socket-multicast.mk   | 14 ++++++++++++++
 5 files changed, 33 insertions(+)
 create mode 100644 package/perl-io-socket-multicast/Config.in
 create mode 100644 package/perl-io-socket-multicast/perl-io-socket-multicast.hash
 create mode 100644 package/perl-io-socket-multicast/perl-io-socket-multicast.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 78934320c6..10ca624070 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -493,6 +493,7 @@ F:	package/perl-device-serialport
 F:	package/perl-dist-checkconflicts
 F:	package/perl-file-slurp
 F:	package/perl-io-interface
+F:	package/perl-io-socket-multicast
 F:	package/perl-json-maybexs
 F:	package/perl-module-runtime
 F:	package/perl-number-bytes-human
diff --git a/package/Config.in b/package/Config.in
index 1eac9b3726..fd5aba3e53 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -702,6 +702,7 @@ menu "Perl libraries/modules"
 	source "package/perl-http-negotiate/Config.in"
 	source "package/perl-io-html/Config.in"
 	source "package/perl-io-interface/Config.in"
+	source "package/perl-io-socket-multicast/Config.in"
 	source "package/perl-io-socket-ssl/Config.in"
 	source "package/perl-json-maybexs/Config.in"
 	source "package/perl-json-tiny/Config.in"
diff --git a/package/perl-io-socket-multicast/Config.in b/package/perl-io-socket-multicast/Config.in
new file mode 100644
index 0000000000..f63a4e1bf9
--- /dev/null
+++ b/package/perl-io-socket-multicast/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_PERL_IO_SOCKET_MULTICAST
+	bool "perl-io-socket-multicast"
+	depends on !BR2_STATIC_LIBS
+	select BR2_PACKAGE_PERL_IO_INTERFACE
+	help
+	  Send and receive multicast messages
+
+	  https://metacpan.org/release/IO-Socket-Multicast
+
+comment "perl-io-socket-multicast needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
diff --git a/package/perl-io-socket-multicast/perl-io-socket-multicast.hash b/package/perl-io-socket-multicast/perl-io-socket-multicast.hash
new file mode 100644
index 0000000000..c12da12c41
--- /dev/null
+++ b/package/perl-io-socket-multicast/perl-io-socket-multicast.hash
@@ -0,0 +1,6 @@
+# retrieved by scancpan from http://cpan.metacpan.org/
+md5    c96e6cbb367b1d11ffe7bb9fbd833540 IO-Socket-Multicast-1.12.tar.gz
+sha256 70e8af4aa21d19bab5edd9f43a6b3d6277748a65145d46ff0ea2ae4c59495c72 IO-Socket-Multicast-1.12.tar.gz
+
+# computed by scancpan
+sha256 ea33bda0e2ec6734e29895a37cd1fc005d86f2abbe7e9943e0213ae64844a697 README
diff --git a/package/perl-io-socket-multicast/perl-io-socket-multicast.mk b/package/perl-io-socket-multicast/perl-io-socket-multicast.mk
new file mode 100644
index 0000000000..41e4fe404c
--- /dev/null
+++ b/package/perl-io-socket-multicast/perl-io-socket-multicast.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# perl-io-socket-multicast
+#
+################################################################################
+
+PERL_IO_SOCKET_MULTICAST_VERSION = 1.12
+PERL_IO_SOCKET_MULTICAST_SOURCE = IO-Socket-Multicast-$(PERL_IO_SOCKET_MULTICAST_VERSION).tar.gz
+PERL_IO_SOCKET_MULTICAST_SITE = $(BR2_CPAN_MIRROR)/authors/id/B/BR/BRAMBLE
+PERL_IO_SOCKET_MULTICAST_DEPENDENCIES = perl-io-interface
+PERL_IO_SOCKET_MULTICAST_LICENSE = Artistic or GPL-1.0+
+PERL_IO_SOCKET_MULTICAST_LICENSE_FILES = README
+
+$(eval $(perl-package))
-- 
2.14.4

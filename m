From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 07 Sep 2018 11:15:56 -0000
Subject: [Buildroot] [git commit] perl-io-socket-multicast: new package
Message-ID: <20180907111458.735B980F7F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=252b4aa1b82254cbb808654cb0962685d12ab174
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Christopher McCrory <chrismcc@gmail.com>
Acked-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                                 |  1 +
 package/Config.in                                          |  1 +
 package/perl-io-socket-multicast/Config.in                 | 11 +++++++++++
 .../perl-io-socket-multicast/perl-io-socket-multicast.hash |  6 ++++++
 .../perl-io-socket-multicast/perl-io-socket-multicast.mk   | 14 ++++++++++++++
 5 files changed, 33 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 60b2f2da1a..0831f962e2 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -492,6 +492,7 @@ F:	package/perl-dbi/
 F:	package/perl-device-serialport/
 F:	package/perl-file-slurp/
 F:	package/perl-io-interface/
+F:	package/perl-io-socket-multicast/
 F:	package/perl-json-maybexs/
 F:	package/perl-module-runtime/
 F:	package/perl-number-bytes-human/
diff --git a/package/Config.in b/package/Config.in
index c9bc7bec42..fba6d1116b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -700,6 +700,7 @@ menu "Perl libraries/modules"
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

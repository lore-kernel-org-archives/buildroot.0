From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 8 Oct 2018 10:41:28 +0200
Subject: [Buildroot] [git commit] perl-stream-buffered: new package
Message-ID: <20181008084042.2289A8E1FA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3836c7416351936ad267801b2ad1d7a7fe59c994
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/Config.in                                      |  1 +
 package/perl-stream-buffered/Config.in                 |  6 ++++++
 package/perl-stream-buffered/perl-stream-buffered.hash |  6 ++++++
 package/perl-stream-buffered/perl-stream-buffered.mk   | 13 +++++++++++++
 4 files changed, 26 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index d028756971..c11c70ca8f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -738,6 +738,7 @@ menu "Perl libraries/modules"
 	source "package/perl-params-util/Config.in"
 	source "package/perl-path-tiny/Config.in"
 	source "package/perl-posix-strftime-compiler/Config.in"
+	source "package/perl-stream-buffered/Config.in"
 	source "package/perl-sub-install/Config.in"
 	source "package/perl-sys-cpu/Config.in"
 	source "package/perl-sys-meminfo/Config.in"
diff --git a/package/perl-stream-buffered/Config.in b/package/perl-stream-buffered/Config.in
new file mode 100644
index 0000000000..a748ebbf77
--- /dev/null
+++ b/package/perl-stream-buffered/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PERL_STREAM_BUFFERED
+	bool "perl-stream-buffered"
+	help
+	  temporary buffer to save bytes
+
+	  https://github.com/plack/Stream-Buffered
diff --git a/package/perl-stream-buffered/perl-stream-buffered.hash b/package/perl-stream-buffered/perl-stream-buffered.hash
new file mode 100644
index 0000000000..a40955d8f6
--- /dev/null
+++ b/package/perl-stream-buffered/perl-stream-buffered.hash
@@ -0,0 +1,6 @@
+# retrieved by scancpan from http://cpan.metacpan.org/
+md5    b030fecaa784cd573289ae797c7aeae9 Stream-Buffered-0.03.tar.gz
+sha256 9b2d4390b5de6b0cf4558e4ad04317a73c5e13dd19af29149c4e47c37fb2423b Stream-Buffered-0.03.tar.gz
+
+# computed by scancpan
+sha256 68e8c38e6d2f2b0570a908411f8321b80a7e35ea44f43729807c9ac9a025f591 LICENSE
diff --git a/package/perl-stream-buffered/perl-stream-buffered.mk b/package/perl-stream-buffered/perl-stream-buffered.mk
new file mode 100644
index 0000000000..677ac979f1
--- /dev/null
+++ b/package/perl-stream-buffered/perl-stream-buffered.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# perl-stream-buffered
+#
+################################################################################
+
+PERL_STREAM_BUFFERED_VERSION = 0.03
+PERL_STREAM_BUFFERED_SOURCE = Stream-Buffered-$(PERL_STREAM_BUFFERED_VERSION).tar.gz
+PERL_STREAM_BUFFERED_SITE = $(BR2_CPAN_MIRROR)/authors/id/D/DO/DOY
+PERL_STREAM_BUFFERED_LICENSE = Artistic or GPL-1.0+
+PERL_STREAM_BUFFERED_LICENSE_FILES = LICENSE
+
+$(eval $(perl-package))

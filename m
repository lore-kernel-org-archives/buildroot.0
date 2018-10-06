From: Francois Perrad <fperrad@gmail.com>
Date: Sat,  6 Oct 2018 18:55:12 +0200
Subject: [Buildroot] [PATCH 08/20] perl-stream-buffered: new package
In-Reply-To: <20181006165524.23778-1-francois.perrad@gadz.org>
References: <20181006165524.23778-1-francois.perrad@gadz.org>
Message-ID: <20181006165524.23778-9-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/Config.in                                   |  1 +
 package/perl-stream-buffered/Config.in              |  6 ++++++
 .../perl-stream-buffered/perl-stream-buffered.hash  |  6 ++++++
 .../perl-stream-buffered/perl-stream-buffered.mk    | 13 +++++++++++++
 4 files changed, 26 insertions(+)
 create mode 100644 package/perl-stream-buffered/Config.in
 create mode 100644 package/perl-stream-buffered/perl-stream-buffered.hash
 create mode 100644 package/perl-stream-buffered/perl-stream-buffered.mk

diff --git a/package/Config.in b/package/Config.in
index a596121f6..03e1fb072 100644
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
index 000000000..a748ebbf7
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
index 000000000..a40955d8f
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
index 000000000..677ac979f
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
-- 
2.17.1

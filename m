From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 8 Oct 2018 16:39:18 +0200
Subject: [Buildroot] [git commit] perl-http-headers-fast: new package
Message-ID: <20181008143840.4D8A68E362@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e9a116473fa2f7d409cb01e4950ae3072a4da3e9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/Config.in                                          |  1 +
 package/perl-http-headers-fast/Config.in                   |  7 +++++++
 package/perl-http-headers-fast/perl-http-headers-fast.hash |  6 ++++++
 package/perl-http-headers-fast/perl-http-headers-fast.mk   | 14 ++++++++++++++
 4 files changed, 28 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index a3f971aa55..8007928c91 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -708,6 +708,7 @@ menu "Perl libraries/modules"
 	source "package/perl-http-daemon/Config.in"
 	source "package/perl-http-date/Config.in"
 	source "package/perl-http-entity-parser/Config.in"
+	source "package/perl-http-headers-fast/Config.in"
 	source "package/perl-http-message/Config.in"
 	source "package/perl-http-multipartparser/Config.in"
 	source "package/perl-http-negotiate/Config.in"
diff --git a/package/perl-http-headers-fast/Config.in b/package/perl-http-headers-fast/Config.in
new file mode 100644
index 0000000000..7272aaad49
--- /dev/null
+++ b/package/perl-http-headers-fast/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PERL_HTTP_HEADERS_FAST
+	bool "perl-http-headers-fast"
+	select BR2_PACKAGE_PERL_HTTP_DATE
+	help
+	  faster implementation of HTTP::Headers
+
+	  https://github.com/tokuhirom/HTTP-Headers-Fast
diff --git a/package/perl-http-headers-fast/perl-http-headers-fast.hash b/package/perl-http-headers-fast/perl-http-headers-fast.hash
new file mode 100644
index 0000000000..0cba0f95a7
--- /dev/null
+++ b/package/perl-http-headers-fast/perl-http-headers-fast.hash
@@ -0,0 +1,6 @@
+# retrieved by scancpan from http://cpan.metacpan.org/
+md5    024fde06808fc47db61a62655afacb41 HTTP-Headers-Fast-0.21.tar.gz
+sha256 5e68ed8e3e67531e1d43c6a2cdfd0ee2daddf2e5b94c1a2648f3a6500a6f12d5 HTTP-Headers-Fast-0.21.tar.gz
+
+# computed by scancpan
+sha256 511724425acf76d736145cfbf7c775b024c70ae8674ebf9a24dfda2c8e4032a3 LICENSE
diff --git a/package/perl-http-headers-fast/perl-http-headers-fast.mk b/package/perl-http-headers-fast/perl-http-headers-fast.mk
new file mode 100644
index 0000000000..2ad2d23163
--- /dev/null
+++ b/package/perl-http-headers-fast/perl-http-headers-fast.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# perl-http-headers-fast
+#
+################################################################################
+
+PERL_HTTP_HEADERS_FAST_VERSION = 0.21
+PERL_HTTP_HEADERS_FAST_SOURCE = HTTP-Headers-Fast-$(PERL_HTTP_HEADERS_FAST_VERSION).tar.gz
+PERL_HTTP_HEADERS_FAST_SITE = $(BR2_CPAN_MIRROR)/authors/id/T/TO/TOKUHIROM
+PERL_HTTP_HEADERS_FAST_DEPENDENCIES = host-perl-module-build-tiny perl-http-date
+PERL_HTTP_HEADERS_FAST_LICENSE = Artistic or GPL-1.0+
+PERL_HTTP_HEADERS_FAST_LICENSE_FILES = LICENSE
+
+$(eval $(perl-package))

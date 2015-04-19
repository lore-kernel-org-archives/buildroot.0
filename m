From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 19 Apr 2015 10:33:30 +0200
Subject: [Buildroot] [PATCH 17/20] perl-net-http: New package
In-Reply-To: <1429432413-17038-1-git-send-email-bernd.kuhls@t-online.de>
References: <1429432413-17038-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1429432413-17038-18-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/Config.in                        |    1 +
 package/perl-net-http/Config.in          |    7 +++++++
 package/perl-net-http/perl-net-http.hash |    3 +++
 package/perl-net-http/perl-net-http.mk   |   14 ++++++++++++++
 4 files changed, 25 insertions(+)
 create mode 100644 package/perl-net-http/Config.in
 create mode 100644 package/perl-net-http/perl-net-http.hash
 create mode 100644 package/perl-net-http/perl-net-http.mk

diff --git a/package/Config.in b/package/Config.in
index 024b286..3e421c5 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -523,6 +523,7 @@ menu "Perl libraries/modules"
 	source "package/perl-lwp-mediatypes/Config.in"
 	source "package/perl-mojolicious/Config.in"
 	source "package/perl-net-dns/Config.in"
+	source "package/perl-net-http/Config.in"
 	source "package/perl-net-ssleay/Config.in"
 	source "package/perl-netaddr-ip/Config.in"
 	source "package/perl-path-tiny/Config.in"
diff --git a/package/perl-net-http/Config.in b/package/perl-net-http/Config.in
new file mode 100644
index 0000000..6f18dd5
--- /dev/null
+++ b/package/perl-net-http/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PERL_NET_HTTP
+	bool "perl-net-http"
+	select BR2_PACKAGE_PERL_URI
+	help
+	  The `Net::HTTP' class is a low-level HTTP client.
+
+	  http://github.com/libwww-perl/net-http
diff --git a/package/perl-net-http/perl-net-http.hash b/package/perl-net-http/perl-net-http.hash
new file mode 100644
index 0000000..9f5f11b
--- /dev/null
+++ b/package/perl-net-http/perl-net-http.hash
@@ -0,0 +1,3 @@
+# retrieved by scancpan from http://cpan.metacpan.org/
+md5    b6da691523456089d7a812ac398bc77e Net-HTTP-6.07.tar.gz
+sha256 9f31e0325a5a0930ad309fa019da9d208e57e236fb0598675ed883c820240364 Net-HTTP-6.07.tar.gz
diff --git a/package/perl-net-http/perl-net-http.mk b/package/perl-net-http/perl-net-http.mk
new file mode 100644
index 0000000..a73dfec
--- /dev/null
+++ b/package/perl-net-http/perl-net-http.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# perl-net-http
+#
+################################################################################
+
+PERL_NET_HTTP_VERSION = 6.07
+PERL_NET_HTTP_SOURCE = Net-HTTP-$(PERL_NET_HTTP_VERSION).tar.gz
+PERL_NET_HTTP_SITE = $(BR2_CPAN_MIRROR)/authors/id/M/MS/MSCHILLI
+PERL_NET_HTTP_DEPENDENCIES = perl-uri
+PERL_NET_HTTP_LICENSE = Artistic or GPLv1+
+PERL_NET_HTTP_LICENSE_FILES = README
+
+$(eval $(perl-package))
-- 
1.7.10.4

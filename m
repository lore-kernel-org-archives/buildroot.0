From: Francois Perrad <fperrad@gmail.com>
Date: Mon, 28 Oct 2019 20:25:14 +0100
Subject: [Buildroot] [PATCH 2/8] package/perl-http-daemon: bump to version
 6.06
In-Reply-To: <20191028192520.8656-1-francois.perrad@gadz.org>
References: <20191028192520.8656-1-francois.perrad@gadz.org>
Message-ID: <20191028192520.8656-2-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

license lives now in its own file

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl-http-daemon/Config.in             | 4 ++--
 package/perl-http-daemon/perl-http-daemon.hash | 6 +++---
 package/perl-http-daemon/perl-http-daemon.mk   | 7 ++++---
 3 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/package/perl-http-daemon/Config.in b/package/perl-http-daemon/Config.in
index bc03b8c8c..0c7ffe723 100644
--- a/package/perl-http-daemon/Config.in
+++ b/package/perl-http-daemon/Config.in
@@ -4,6 +4,6 @@ config BR2_PACKAGE_PERL_HTTP_DAEMON
 	select BR2_PACKAGE_PERL_HTTP_MESSAGE # runtime
 	select BR2_PACKAGE_PERL_LWP_MEDIATYPES # runtime
 	help
-	  a simple http server class.
+	  A simple http server class.
 
-	  https://metacpan.org/release/HTTP-Daemon
+	  https://github.com/libwww-perl/HTTP-Daemon
diff --git a/package/perl-http-daemon/perl-http-daemon.hash b/package/perl-http-daemon/perl-http-daemon.hash
index f7bf64f63..b2e5dbceb 100644
--- a/package/perl-http-daemon/perl-http-daemon.hash
+++ b/package/perl-http-daemon/perl-http-daemon.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    ed0ae02d25d7f1e89456d4d69732adc2 HTTP-Daemon-6.01.tar.gz
-sha256 43fd867742701a3f9fcc7bd59838ab72c6490c0ebaf66901068ec6997514adc2 HTTP-Daemon-6.01.tar.gz
+md5    c5d6e1d84f7f09770d9ce52d4bddef59 HTTP-Daemon-6.06.tar.gz
+sha256 fc03a161b54553f766457a4267e7066767f54ad01cacfe9a91d7caa2a0319bad HTTP-Daemon-6.06.tar.gz
 
 # computed by scancpan
-sha256 6a23ab5e150eeab25c21065446beda077352181aa024972ae06965c377f5b15f README
+sha256 e84ac5ab84ace59952d2640e0ca4522eb0aaa8c2aa696352d1252aa109ea20bc LICENCE
diff --git a/package/perl-http-daemon/perl-http-daemon.mk b/package/perl-http-daemon/perl-http-daemon.mk
index 99e053f42..3fb89db92 100644
--- a/package/perl-http-daemon/perl-http-daemon.mk
+++ b/package/perl-http-daemon/perl-http-daemon.mk
@@ -4,11 +4,12 @@
 #
 ################################################################################
 
-PERL_HTTP_DAEMON_VERSION = 6.01
+PERL_HTTP_DAEMON_VERSION = 6.06
 PERL_HTTP_DAEMON_SOURCE = HTTP-Daemon-$(PERL_HTTP_DAEMON_VERSION).tar.gz
-PERL_HTTP_DAEMON_SITE = $(BR2_CPAN_MIRROR)/authors/id/G/GA/GAAS
+PERL_HTTP_DAEMON_SITE = $(BR2_CPAN_MIRROR)/authors/id/O/OA/OALDERS
+PERL_HTTP_DAEMON_DEPENDENCIES = host-perl-module-build-tiny
 PERL_HTTP_DAEMON_LICENSE = Artistic or GPL-1.0+
-PERL_HTTP_DAEMON_LICENSE_FILES = README
+PERL_HTTP_DAEMON_LICENSE_FILES = LICENCE
 PERL_HTTP_DAEMON_DISTNAME = HTTP-Daemon
 
 $(eval $(perl-package))
-- 
2.20.1

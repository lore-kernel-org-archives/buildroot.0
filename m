From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 19 Apr 2015 10:33:28 +0200
Subject: [Buildroot] [PATCH 15/20] perl-http-daemon: New package
In-Reply-To: <1429432413-17038-1-git-send-email-bernd.kuhls@t-online.de>
References: <1429432413-17038-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1429432413-17038-16-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/Config.in                              |    1 +
 package/perl-http-daemon/Config.in             |    8 ++++++++
 package/perl-http-daemon/perl-http-daemon.hash |    3 +++
 package/perl-http-daemon/perl-http-daemon.mk   |   14 ++++++++++++++
 4 files changed, 26 insertions(+)
 create mode 100644 package/perl-http-daemon/Config.in
 create mode 100644 package/perl-http-daemon/perl-http-daemon.hash
 create mode 100644 package/perl-http-daemon/perl-http-daemon.mk

diff --git a/package/Config.in b/package/Config.in
index 4b43207..7c91393 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -513,6 +513,7 @@ menu "Perl libraries/modules"
 	source "package/perl-html-parser/Config.in"
 	source "package/perl-html-tagset/Config.in"
 	source "package/perl-http-cookies/Config.in"
+	source "package/perl-http-daemon/Config.in"
 	source "package/perl-http-date/Config.in"
 	source "package/perl-http-message/Config.in"
 	source "package/perl-io-html/Config.in"
diff --git a/package/perl-http-daemon/Config.in b/package/perl-http-daemon/Config.in
new file mode 100644
index 0000000..3d69b88
--- /dev/null
+++ b/package/perl-http-daemon/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_PERL_HTTP_DAEMON
+	bool "perl-http-daemon"
+	select BR2_PACKAGE_PERL_HTTP_MESSAGE
+	help
+	  Instances of the `HTTP::Daemon' class are HTTP/1.1 servers that listen
+	  on a socket for incoming requests.
+
+	  http://github.com/gisle/http-daemon
diff --git a/package/perl-http-daemon/perl-http-daemon.hash b/package/perl-http-daemon/perl-http-daemon.hash
new file mode 100644
index 0000000..f4f6023
--- /dev/null
+++ b/package/perl-http-daemon/perl-http-daemon.hash
@@ -0,0 +1,3 @@
+# retrieved by scancpan from http://cpan.metacpan.org/
+md5    ed0ae02d25d7f1e89456d4d69732adc2 HTTP-Daemon-6.01.tar.gz
+sha256 43fd867742701a3f9fcc7bd59838ab72c6490c0ebaf66901068ec6997514adc2 HTTP-Daemon-6.01.tar.gz
diff --git a/package/perl-http-daemon/perl-http-daemon.mk b/package/perl-http-daemon/perl-http-daemon.mk
new file mode 100644
index 0000000..42d2873
--- /dev/null
+++ b/package/perl-http-daemon/perl-http-daemon.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# perl-http-daemon
+#
+################################################################################
+
+PERL_HTTP_DAEMON_VERSION = 6.01
+PERL_HTTP_DAEMON_SOURCE = HTTP-Daemon-$(PERL_HTTP_DAEMON_VERSION).tar.gz
+PERL_HTTP_DAEMON_SITE = $(BR2_CPAN_MIRROR)/authors/id/G/GA/GAAS
+PERL_HTTP_DAEMON_DEPENDENCIES = perl-http-message
+PERL_HTTP_DAEMON_LICENSE = Artistic or GPLv1+
+PERL_HTTP_DAEMON_LICENSE_FILES = README
+
+$(eval $(perl-package))
-- 
1.7.10.4

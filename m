From: Francois Perrad <fperrad@gmail.com>
Date: Thu, 23 Jul 2015 18:47:20 +0200
Subject: [Buildroot] [PATCH 05/15] perl-http-daemon: fix dependencies
In-Reply-To: <1437670050-27014-1-git-send-email-francois.perrad@gadz.org>
References: <1437670050-27014-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1437670050-27014-5-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl-http-daemon/Config.in           | 2 ++
 package/perl-http-daemon/perl-http-daemon.mk | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/perl-http-daemon/Config.in b/package/perl-http-daemon/Config.in
index 3d69b88..e09328c 100644
--- a/package/perl-http-daemon/Config.in
+++ b/package/perl-http-daemon/Config.in
@@ -1,6 +1,8 @@
 config BR2_PACKAGE_PERL_HTTP_DAEMON
 	bool "perl-http-daemon"
+	select BR2_PACKAGE_PERL_HTTP_DATE
 	select BR2_PACKAGE_PERL_HTTP_MESSAGE
+	select BR2_PACKAGE_PERL_LWP_MEDIATYPES
 	help
 	  Instances of the `HTTP::Daemon' class are HTTP/1.1 servers that listen
 	  on a socket for incoming requests.
diff --git a/package/perl-http-daemon/perl-http-daemon.mk b/package/perl-http-daemon/perl-http-daemon.mk
index 42d2873..6c009a3 100644
--- a/package/perl-http-daemon/perl-http-daemon.mk
+++ b/package/perl-http-daemon/perl-http-daemon.mk
@@ -7,7 +7,7 @@
 PERL_HTTP_DAEMON_VERSION = 6.01
 PERL_HTTP_DAEMON_SOURCE = HTTP-Daemon-$(PERL_HTTP_DAEMON_VERSION).tar.gz
 PERL_HTTP_DAEMON_SITE = $(BR2_CPAN_MIRROR)/authors/id/G/GA/GAAS
-PERL_HTTP_DAEMON_DEPENDENCIES = perl-http-message
+PERL_HTTP_DAEMON_DEPENDENCIES = perl perl-http-date perl-http-message perl-lwp-mediatypes
 PERL_HTTP_DAEMON_LICENSE = Artistic or GPLv1+
 PERL_HTTP_DAEMON_LICENSE_FILES = README
 
-- 
2.1.4

From: Francois Perrad <fperrad@gmail.com>
Date: Thu, 23 Jul 2015 18:47:21 +0200
Subject: [Buildroot] [PATCH 06/15] perl-http-message: bump to version 6.10
In-Reply-To: <1437670050-27014-1-git-send-email-francois.perrad@gadz.org>
References: <1437670050-27014-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1437670050-27014-6-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl-http-message/perl-http-message.hash |  4 ++--
 package/perl-http-message/perl-http-message.mk   | 13 ++++---------
 2 files changed, 6 insertions(+), 11 deletions(-)

diff --git a/package/perl-http-message/perl-http-message.hash b/package/perl-http-message/perl-http-message.hash
index ff6268d..851dfa5 100644
--- a/package/perl-http-message/perl-http-message.hash
+++ b/package/perl-http-message/perl-http-message.hash
@@ -1,3 +1,3 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    e563ac516e28d33f65bc0f295f625f85 HTTP-Message-6.06.tar.gz
-sha256 087e97009c5239dca4631cf433d836771b3fc5ba5685eef1965f9d3415cbad63 HTTP-Message-6.06.tar.gz
+md5    b8a68ce1898691c536714eeae3f963d4 HTTP-Message-6.10.tar.gz
+sha256 bd990d3ce6545b8499ca69790847e248cf402614b48f975f8d2ef48cb8cf4c68 HTTP-Message-6.10.tar.gz
diff --git a/package/perl-http-message/perl-http-message.mk b/package/perl-http-message/perl-http-message.mk
index 12eda90..07cafee 100644
--- a/package/perl-http-message/perl-http-message.mk
+++ b/package/perl-http-message/perl-http-message.mk
@@ -4,16 +4,11 @@
 #
 ################################################################################
 
-PERL_HTTP_MESSAGE_VERSION = 6.06
+PERL_HTTP_MESSAGE_VERSION = 6.10
 PERL_HTTP_MESSAGE_SOURCE = HTTP-Message-$(PERL_HTTP_MESSAGE_VERSION).tar.gz
-PERL_HTTP_MESSAGE_SITE = $(BR2_CPAN_MIRROR)/authors/id/G/GA/GAAS
+PERL_HTTP_MESSAGE_SITE = $(BR2_CPAN_MIRROR)/authors/id/E/ET/ETHER
+PERL_HTTP_MESSAGE_DEPENDENCIES = perl perl-encode-locale perl-http-date perl-io-html perl-lwp-mediatypes perl-uri
 PERL_HTTP_MESSAGE_LICENSE = Artistic or GPLv1+
-PERL_HTTP_MESSAGE_LICENSE_FILES = README
-PERL_HTTP_MESSAGE_DEPENDENCIES = \
-	perl-encode-locale \
-	perl-http-date \
-	perl-io-html \
-	perl-lwp-mediatypes \
-	perl-uri
+PERL_HTTP_MESSAGE_LICENSE_FILES = LICENSE
 
 $(eval $(perl-package))
-- 
2.1.4

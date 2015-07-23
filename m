From: Francois Perrad <fperrad@gmail.com>
Date: Thu, 23 Jul 2015 18:47:29 +0200
Subject: [Buildroot] [PATCH 14/15] perl-www-robotrules: fix dependencies
In-Reply-To: <1437670050-27014-1-git-send-email-francois.perrad@gadz.org>
References: <1437670050-27014-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1437670050-27014-14-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl-www-robotrules/Config.in              | 2 +-
 package/perl-www-robotrules/perl-www-robotrules.mk | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/perl-www-robotrules/Config.in b/package/perl-www-robotrules/Config.in
index 83dbcfb..e80f5a0 100644
--- a/package/perl-www-robotrules/Config.in
+++ b/package/perl-www-robotrules/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_PERL_WWW_ROBOTRULES
 	bool "perl-www-robotrules"
-	select PERL_URI
+	select BR2_PACKAGE_PERL_URI
 	help
 	  This module provides functions that deal the date formats used by the
 	  HTTP protocol (and then some more)
diff --git a/package/perl-www-robotrules/perl-www-robotrules.mk b/package/perl-www-robotrules/perl-www-robotrules.mk
index 0c68b98..e74baab 100644
--- a/package/perl-www-robotrules/perl-www-robotrules.mk
+++ b/package/perl-www-robotrules/perl-www-robotrules.mk
@@ -7,7 +7,7 @@
 PERL_WWW_ROBOTRULES_VERSION = 6.02
 PERL_WWW_ROBOTRULES_SOURCE = WWW-RobotRules-$(PERL_WWW_ROBOTRULES_VERSION).tar.gz
 PERL_WWW_ROBOTRULES_SITE = $(BR2_CPAN_MIRROR)/authors/id/G/GA/GAAS
-PERL_WWW_ROBOTRULES_DEPENDENCIES = perl-uri
+PERL_WWW_ROBOTRULES_DEPENDENCIES = perl perl-uri
 PERL_WWW_ROBOTRULES_LICENSE = Artistic or GPLv1+
 PERL_WWW_ROBOTRULES_LICENSE_FILES = README
 
-- 
2.1.4

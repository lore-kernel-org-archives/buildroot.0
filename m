From: Francois Perrad <fperrad@gmail.com>
Date: Sun, 15 Jun 2014 18:59:21 +0200
Subject: [Buildroot] [PATCH 2/2] perl-mojolicious: new package
In-Reply-To: <1402851561-23157-1-git-send-email-francois.perrad@gadz.org>
References: <1402851561-23157-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1402851561-23157-2-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/Config.in                            |  1 +
 package/perl-mojolicious/Config.in           |  6 ++++++
 package/perl-mojolicious/perl-mojolicious.mk | 13 +++++++++++++
 3 files changed, 20 insertions(+)
 create mode 100644 package/perl-mojolicious/Config.in
 create mode 100644 package/perl-mojolicious/perl-mojolicious.mk

diff --git a/package/Config.in b/package/Config.in
index f43e985..5e16ffa 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -423,6 +423,7 @@ endif
 	source "package/perl/Config.in"
 if BR2_PACKAGE_PERL
 menu "Perl libraries/modules"
+source "package/perl-mojolicious/Config.in"
 endmenu
 endif
 	source "package/php/Config.in"
diff --git a/package/perl-mojolicious/Config.in b/package/perl-mojolicious/Config.in
new file mode 100644
index 0000000..8c9c25a
--- /dev/null
+++ b/package/perl-mojolicious/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PERL_MOJOLICIOUS
+	bool "perl-mojolicious"
+	help
+	  Real-time web framework
+	  
+	  http://mojolicio.us
diff --git a/package/perl-mojolicious/perl-mojolicious.mk b/package/perl-mojolicious/perl-mojolicious.mk
new file mode 100644
index 0000000..e4ced7e
--- /dev/null
+++ b/package/perl-mojolicious/perl-mojolicious.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# perl-mojolicious
+#
+################################################################################
+
+PERL_MOJOLICIOUS_VERSION = 5.07
+PERL_MOJOLICIOUS_SOURCE = Mojolicious-$(PERL_MOJOLICIOUS_VERSION).tar.gz
+PERL_MOJOLICIOUS_SITE = $(BR2_CPAN_MIRROR)/authors/id/S/SR/SRI/
+PERL_MOJOLICIOUS_DEPENDENCIES = perl 
+PERL_MOJOLICIOUS_LICENSE = artistic_2
+
+$(eval $(perl-package))
-- 
1.9.1

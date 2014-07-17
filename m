From: Francois Perrad <fperrad@gmail.com>
Date: Thu, 17 Jul 2014 18:33:01 +0200
Subject: [Buildroot] [PATCH 4/5] perl-gdtextutil: new package
In-Reply-To: <1405614782-3667-1-git-send-email-francois.perrad@gadz.org>
References: <1405614782-3667-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1405614782-3667-4-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/Config.in                          |  1 +
 package/perl-gdtextutil/Config.in          |  6 ++++++
 package/perl-gdtextutil/perl-gdtextutil.mk | 12 ++++++++++++
 3 files changed, 19 insertions(+)
 create mode 100644 package/perl-gdtextutil/Config.in
 create mode 100644 package/perl-gdtextutil/perl-gdtextutil.mk

diff --git a/package/Config.in b/package/Config.in
index 98dd316..8a7801a 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -429,6 +429,7 @@ endif
 if BR2_PACKAGE_PERL
 menu "Perl libraries/modules"
 	source "package/perl-gd/Config.in"
+	source "package/perl-gdtextutil/Config.in"
 	source "package/perl-io-socket-ssl/Config.in"
 	source "package/perl-mojolicious/Config.in"
 	source "package/perl-net-ssleay/Config.in"
diff --git a/package/perl-gdtextutil/Config.in b/package/perl-gdtextutil/Config.in
new file mode 100644
index 0000000..9baf0a0
--- /dev/null
+++ b/package/perl-gdtextutil/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PERL_GDTEXTUTIL
+	bool "perl-gdtextutil"
+	help
+	  Text utilities for use with GD
+
+	  https://metacpan.org/release/GDTextUtil
diff --git a/package/perl-gdtextutil/perl-gdtextutil.mk b/package/perl-gdtextutil/perl-gdtextutil.mk
new file mode 100644
index 0000000..6a5c2d7
--- /dev/null
+++ b/package/perl-gdtextutil/perl-gdtextutil.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# perl-gdtextutil
+#
+################################################################################
+
+PERL_GDTEXTUTIL_VERSION = 0.86
+PERL_GDTEXTUTIL_SOURCE = GDTextUtil-$(PERL_GDTEXTUTIL_VERSION).tar.gz
+PERL_GDTEXTUTIL_SITE = $(BR2_CPAN_MIRROR)/authors/id/M/MV/MVERB/
+PERL_GDTEXTUTIL_DEPENDENCIES = perl
+
+$(eval $(perl-package))
-- 
1.9.1

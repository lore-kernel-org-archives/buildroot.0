From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 19 Apr 2015 12:17:06 +0200
Subject: [Buildroot] [PATCH v2 11/25] package/perl-lwp-mediatypes: New
	package
In-Reply-To: <1429438640-9367-1-git-send-email-bernd.kuhls@t-online.de>
References: <1429438640-9367-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1429438640-9367-12-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/Config.in                                    |    1 +
 package/perl-lwp-mediatypes/Config.in                |    7 +++++++
 package/perl-lwp-mediatypes/perl-lwp-mediatypes.hash |    3 +++
 package/perl-lwp-mediatypes/perl-lwp-mediatypes.mk   |   14 ++++++++++++++
 4 files changed, 25 insertions(+)
 create mode 100644 package/perl-lwp-mediatypes/Config.in
 create mode 100644 package/perl-lwp-mediatypes/perl-lwp-mediatypes.hash
 create mode 100644 package/perl-lwp-mediatypes/perl-lwp-mediatypes.mk

diff --git a/package/Config.in b/package/Config.in
index 794aa7a..501f767 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -516,6 +516,7 @@ menu "Perl libraries/modules"
 	source "package/perl-io-html/Config.in"
 	source "package/perl-io-socket-ssl/Config.in"
 	source "package/perl-json-tiny/Config.in"
+	source "package/perl-lwp-mediatypes/Config.in"
 	source "package/perl-mojolicious/Config.in"
 	source "package/perl-net-dns/Config.in"
 	source "package/perl-net-ssleay/Config.in"
diff --git a/package/perl-lwp-mediatypes/Config.in b/package/perl-lwp-mediatypes/Config.in
new file mode 100644
index 0000000..b362e9c
--- /dev/null
+++ b/package/perl-lwp-mediatypes/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PERL_LWP_MEDIATYPES
+	bool "perl-lwp-mediatypes"
+	help
+	  This module provides functions for handling media (also known as MIME)
+	  types and encodings.
+
+	  https://github.com/gisle/lwp-mediatypes
diff --git a/package/perl-lwp-mediatypes/perl-lwp-mediatypes.hash b/package/perl-lwp-mediatypes/perl-lwp-mediatypes.hash
new file mode 100644
index 0000000..0f6fee9
--- /dev/null
+++ b/package/perl-lwp-mediatypes/perl-lwp-mediatypes.hash
@@ -0,0 +1,3 @@
+# retrieved by scancpan from http://cpan.metacpan.org/
+md5    8c5f25fb64b974d22aff424476ba13c9 LWP-MediaTypes-6.02.tar.gz
+sha256 18790b0cc5f0a51468495c3847b16738f785a2d460403595001e0b932e5db676 LWP-MediaTypes-6.02.tar.gz
diff --git a/package/perl-lwp-mediatypes/perl-lwp-mediatypes.mk b/package/perl-lwp-mediatypes/perl-lwp-mediatypes.mk
new file mode 100644
index 0000000..2442d41
--- /dev/null
+++ b/package/perl-lwp-mediatypes/perl-lwp-mediatypes.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# perl-lwp-mediatypes
+#
+################################################################################
+
+PERL_LWP_MEDIATYPES_VERSION = 6.02
+PERL_LWP_MEDIATYPES_SOURCE = LWP-MediaTypes-$(PERL_LWP_MEDIATYPES_VERSION).tar.gz
+PERL_LWP_MEDIATYPES_SITE = $(BR2_CPAN_MIRROR)/authors/id/G/GA/GAAS
+PERL_LWP_MEDIATYPES_DEPENDENCIES = perl
+PERL_LWP_MEDIATYPES_LICENSE = Artistic or GPLv1+
+PERL_LWP_MEDIATYPES_LICENSE_FILES = README
+
+$(eval $(perl-package))
-- 
1.7.10.4

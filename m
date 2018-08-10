From: Christopher McCrory <chrismcc@gmail.com>
Date: Fri, 10 Aug 2018 09:14:50 -0700
Subject: [Buildroot] [PATCH 06/18] perl-date-manip: new package
In-Reply-To: <20180810161502.21598-1-chrismcc@gmail.com>
References: <20180810161502.21598-1-chrismcc@gmail.com>
Message-ID: <20180810161502.21598-7-chrismcc@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Christopher McCrory <chrismcc@gmail.com>
---
 package/Config.in                            |  1 +
 package/perl-date-manip/Config.in            |  6 ++++++
 package/perl-date-manip/perl-date-manip.hash |  6 ++++++
 package/perl-date-manip/perl-date-manip.mk   | 13 +++++++++++++
 4 files changed, 26 insertions(+)
 create mode 100644 package/perl-date-manip/Config.in
 create mode 100644 package/perl-date-manip/perl-date-manip.hash
 create mode 100644 package/perl-date-manip/perl-date-manip.mk

diff --git a/package/Config.in b/package/Config.in
index dad6916c64..c5edc5cb76 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -675,6 +675,7 @@ menu "Perl libraries/modules"
 	source "package/perl-crypt-openssl-random/Config.in"
 	source "package/perl-crypt-openssl-rsa/Config.in"
 	source "package/perl-data-uuid/Config.in"
+	source "package/perl-date-manip/Config.in"
 	source "package/perl-datetime-tiny/Config.in"
 	source "package/perl-digest-hmac/Config.in"
 	source "package/perl-digest-md5/Config.in"
diff --git a/package/perl-date-manip/Config.in b/package/perl-date-manip/Config.in
new file mode 100644
index 0000000000..cbfb5c5b30
--- /dev/null
+++ b/package/perl-date-manip/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PERL_DATE_MANIP
+	bool "perl-date-manip"
+	help
+	  Date manipulation routines
+
+	  https://metacpan.org/release/Date-Manip
diff --git a/package/perl-date-manip/perl-date-manip.hash b/package/perl-date-manip/perl-date-manip.hash
new file mode 100644
index 0000000000..f02f657822
--- /dev/null
+++ b/package/perl-date-manip/perl-date-manip.hash
@@ -0,0 +1,6 @@
+# retrieved by scancpan from http://cpan.metacpan.org/
+md5    b41b0d476fd7eae3ce81324386266a85 Date-Manip-6.72.tar.gz
+sha256 38f4dd9d94b41092ca7b9da2ef72c3bb8b8c8bff6da14d785c612f3cc7a94da6 Date-Manip-6.72.tar.gz
+
+# computed by scancpan
+sha256 8ba2a138654f8b59b7e1e3ad0d4c81918b9148ff95078b172ccbb45fa241431d LICENSE
diff --git a/package/perl-date-manip/perl-date-manip.mk b/package/perl-date-manip/perl-date-manip.mk
new file mode 100644
index 0000000000..a5e1609a88
--- /dev/null
+++ b/package/perl-date-manip/perl-date-manip.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# perl-date-manip
+#
+################################################################################
+
+PERL_DATE_MANIP_VERSION = 6.72
+PERL_DATE_MANIP_SOURCE = Date-Manip-$(PERL_DATE_MANIP_VERSION).tar.gz
+PERL_DATE_MANIP_SITE = $(BR2_CPAN_MIRROR)/authors/id/S/SB/SBECK
+PERL_DATE_MANIP_LICENSE = Artistic or GPL-1.0+
+PERL_DATE_MANIP_LICENSE_FILES = LICENSE
+
+$(eval $(perl-package))
-- 
2.14.4

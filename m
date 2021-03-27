From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 27 Mar 2021 18:13:35 +0100
Subject: [Buildroot] [PATCH 1/2] perl-parse-yapp: new package
Message-ID: <20210327171336.95774-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Host version is needed for samba 4.14.x.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/Config.in                            |  1 +
 package/perl-parse-yapp/Config.in            |  6 ++++++
 package/perl-parse-yapp/perl-parse-yapp.hash |  3 +++
 package/perl-parse-yapp/perl-parse-yapp.mk   | 17 +++++++++++++++++
 4 files changed, 27 insertions(+)
 create mode 100644 package/perl-parse-yapp/Config.in
 create mode 100644 package/perl-parse-yapp/perl-parse-yapp.hash
 create mode 100644 package/perl-parse-yapp/perl-parse-yapp.mk

diff --git a/package/Config.in b/package/Config.in
index 2be9c4c634..9d950b7181 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -821,6 +821,7 @@ menu "Perl libraries/modules"
 	source "package/perl-number-bytes-human/Config.in"
 	source "package/perl-package-stash/Config.in"
 	source "package/perl-params-util/Config.in"
+	source "package/perl-parse-yapp/Config.in"
 	source "package/perl-path-tiny/Config.in"
 	source "package/perl-plack/Config.in"
 	source "package/perl-posix-strftime-compiler/Config.in"
diff --git a/package/perl-parse-yapp/Config.in b/package/perl-parse-yapp/Config.in
new file mode 100644
index 0000000000..5cde3d9211
--- /dev/null
+++ b/package/perl-parse-yapp/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PERL_PARSE_YAPP
+	bool "perl-parse-yapp"
+	help
+	  A perl frontend to the Parse::Yapp module
+
+	  https://metacpan.org/release/Parse-Yapp
diff --git a/package/perl-parse-yapp/perl-parse-yapp.hash b/package/perl-parse-yapp/perl-parse-yapp.hash
new file mode 100644
index 0000000000..d5880a2a71
--- /dev/null
+++ b/package/perl-parse-yapp/perl-parse-yapp.hash
@@ -0,0 +1,3 @@
+# locally computed
+sha256  3810e998308fba2e0f4f26043035032b027ce51ce5c8a52a8b8e340ca65f13e5  Parse-Yapp-1.21.tar.gz
+sha256  a5d97e3ee50ba12b7897841a117790f723795e4a61e5ad1668dc064956c84e96  lib/Parse/Yapp.pm
diff --git a/package/perl-parse-yapp/perl-parse-yapp.mk b/package/perl-parse-yapp/perl-parse-yapp.mk
new file mode 100644
index 0000000000..94f51243fd
--- /dev/null
+++ b/package/perl-parse-yapp/perl-parse-yapp.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# perl-parse-yapp
+#
+################################################################################
+
+PERL_PARSE_YAPP_VERSION = 1.21
+PERL_PARSE_YAPP_SOURCE = Parse-Yapp-$(PERL_PARSE_YAPP_VERSION).tar.gz
+PERL_PARSE_YAPP_SITE = $(BR2_CPAN_MIRROR)/authors/id/W/WB/WBRASWELL
+PERL_PARSE_YAPP_DEPENDENCIES = host-perl-module-build
+PERL_PARSE_YAPP_LICENSE = Artistic or GPL-1.0+
+PERL_PARSE_YAPP_LICENSE_FILES = lib/Parse/Yapp.pm
+PERL_PARSE_YAPP_DISTNAME = Parse-Yapp
+HOST_PERL_PARSE_YAPP_DEPENDENCIES = host-perl-module-build
+
+$(eval $(perl-package))
+$(eval $(host-perl-package))
-- 
2.29.2

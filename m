From: Francois Perrad <fperrad@gmail.com>
Date: Sat,  6 Oct 2018 18:55:08 +0200
Subject: [Buildroot] [PATCH 04/20] perl-filesys-notify-simple: new package
In-Reply-To: <20181006165524.23778-1-francois.perrad@gadz.org>
References: <20181006165524.23778-1-francois.perrad@gadz.org>
Message-ID: <20181006165524.23778-5-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/Config.in                                   |  1 +
 package/perl-filesys-notify-simple/Config.in        |  6 ++++++
 .../perl-filesys-notify-simple.hash                 |  6 ++++++
 .../perl-filesys-notify-simple.mk                   | 13 +++++++++++++
 4 files changed, 26 insertions(+)
 create mode 100644 package/perl-filesys-notify-simple/Config.in
 create mode 100644 package/perl-filesys-notify-simple/perl-filesys-notify-simple.hash
 create mode 100644 package/perl-filesys-notify-simple/perl-filesys-notify-simple.mk

diff --git a/package/Config.in b/package/Config.in
index c009ee2ea..fc3d8fadf 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -695,6 +695,7 @@ menu "Perl libraries/modules"
 	source "package/perl-file-listing/Config.in"
 	source "package/perl-file-slurp/Config.in"
 	source "package/perl-file-util/Config.in"
+	source "package/perl-filesys-notify-simple/Config.in"
 	source "package/perl-gd/Config.in"
 	source "package/perl-gdgraph/Config.in"
 	source "package/perl-gdtextutil/Config.in"
diff --git a/package/perl-filesys-notify-simple/Config.in b/package/perl-filesys-notify-simple/Config.in
new file mode 100644
index 000000000..69469d7a6
--- /dev/null
+++ b/package/perl-filesys-notify-simple/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PERL_FILESYS_NOTIFY_SIMPLE
+	bool "perl-filesys-notify-simple"
+	help
+	  Simple and dumb file system watcher
+
+	  https://github.com/miyagawa/Filesys-Notify-Simple
diff --git a/package/perl-filesys-notify-simple/perl-filesys-notify-simple.hash b/package/perl-filesys-notify-simple/perl-filesys-notify-simple.hash
new file mode 100644
index 000000000..a48394504
--- /dev/null
+++ b/package/perl-filesys-notify-simple/perl-filesys-notify-simple.hash
@@ -0,0 +1,6 @@
+# retrieved by scancpan from http://cpan.metacpan.org/
+md5    6042cd96abcc7bf69f959142d00b8143 Filesys-Notify-Simple-0.13.tar.gz
+sha256 ade3d3db882ce2137e527201893d4b8c12b2dbd15009bb89c31cb91ba6495ba2 Filesys-Notify-Simple-0.13.tar.gz
+
+# computed by scancpan
+sha256 bd61ca40272d971750f0a2bd0122629865355c5f4a2aa9e70c0d325e75d0da3a LICENSE
diff --git a/package/perl-filesys-notify-simple/perl-filesys-notify-simple.mk b/package/perl-filesys-notify-simple/perl-filesys-notify-simple.mk
new file mode 100644
index 000000000..fff4c0ab5
--- /dev/null
+++ b/package/perl-filesys-notify-simple/perl-filesys-notify-simple.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# perl-filesys-notify-simple
+#
+################################################################################
+
+PERL_FILESYS_NOTIFY_SIMPLE_VERSION = 0.13
+PERL_FILESYS_NOTIFY_SIMPLE_SOURCE = Filesys-Notify-Simple-$(PERL_FILESYS_NOTIFY_SIMPLE_VERSION).tar.gz
+PERL_FILESYS_NOTIFY_SIMPLE_SITE = $(BR2_CPAN_MIRROR)/authors/id/M/MI/MIYAGAWA
+PERL_FILESYS_NOTIFY_SIMPLE_LICENSE = Artistic or GPL-1.0+
+PERL_FILESYS_NOTIFY_SIMPLE_LICENSE_FILES = LICENSE
+
+$(eval $(perl-package))
-- 
2.17.1

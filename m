From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 8 Oct 2018 10:26:02 +0200
Subject: [Buildroot] [git commit] perl-filesys-notify-simple: new package
Message-ID: <20181008083554.083728E1E9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d361c389681f859f2eae87bbf600a2b37eafdd0e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/Config.in                                           |  1 +
 package/perl-filesys-notify-simple/Config.in                |  6 ++++++
 .../perl-filesys-notify-simple.hash                         |  6 ++++++
 .../perl-filesys-notify-simple.mk                           | 13 +++++++++++++
 4 files changed, 26 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index e89899b83e..52e554e72b 100644
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
index 0000000000..69469d7a6d
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
index 0000000000..a48394504a
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
index 0000000000..fff4c0ab57
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

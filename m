From: Francois Perrad <fperrad@gmail.com>
Date: Wed, 20 Nov 2013 18:01:57 +0100
Subject: [Buildroot] [pkg-perl infra 09/12] libcurses-perl: new package
In-Reply-To: <1384966920-9454-1-git-send-email-francois.perrad@gadz.org>
References: <1384966920-9454-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1384966920-9454-10-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

(depends on ncurses)

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/cpan/Config.in                        |    1 +
 package/cpan/libcurses-perl/Config.in         |    6 ++++++
 package/cpan/libcurses-perl/libcurses-perl.mk |   15 +++++++++++++++
 3 files changed, 22 insertions(+)
 create mode 100644 package/cpan/libcurses-perl/Config.in
 create mode 100644 package/cpan/libcurses-perl/libcurses-perl.mk

diff --git a/package/cpan/Config.in b/package/cpan/Config.in
index c821064..a4cd89d 100644
--- a/package/cpan/Config.in
+++ b/package/cpan/Config.in
@@ -1,2 +1,3 @@
+source "package/cpan/libcurses-perl/Config.in"
 source "package/cpan/libmodule-build-perl/Config.in"
 source "package/cpan/libxml-parser-perl/Config.in"
diff --git a/package/cpan/libcurses-perl/Config.in b/package/cpan/libcurses-perl/Config.in
new file mode 100644
index 0000000..fdca059
--- /dev/null
+++ b/package/cpan/libcurses-perl/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_LIBCURSES_PERL
+	bool "libcurses-perl"
+	select BR2_PACKAGE_NCURSES
+	help
+	  terminal screen handling and optimization
+
diff --git a/package/cpan/libcurses-perl/libcurses-perl.mk b/package/cpan/libcurses-perl/libcurses-perl.mk
new file mode 100644
index 0000000..81ba645
--- /dev/null
+++ b/package/cpan/libcurses-perl/libcurses-perl.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# libcurses-perl
+#
+################################################################################
+
+LIBCURSES_PERL_VERSION = 1.28
+LIBCURSES_PERL_AUTHOR = GIRAFFED
+LIBCURSES_PERL_SOURCE = Curses-$(LIBCURSES_PERL_VERSION).tgz
+LIBCURSES_PERL_SITE = $(BR2_CPAN_MIRROR)/authors/id/G/GI/GIRAFFED/
+LIBCURSES_PERL_DEPENDENCIES = perl ncurses
+HOST_LIBCURSES_PERL_DEPENDENCIES = host-ncurses
+
+$(eval $(perl-package))
+$(eval $(host-perl-package))
-- 
1.7.9.5

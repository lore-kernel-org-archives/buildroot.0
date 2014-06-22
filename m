From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 22 Jun 2014 19:27:20 +0200
Subject: [Buildroot] [git commit] perl-mojolicious: new package
Message-ID: <20140622172750.66A769CC73@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=970b061e6701ee2939d0a9c4543048392e9814ac
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Thomas: as noted by Arnout, remove trailing whitespace, and fix the
license to Artistic-2.0. Also, adjust the indentation in
package/Config.in to the new standard.]

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                            |    1 +
 package/perl-mojolicious/Config.in           |    6 ++++++
 package/perl-mojolicious/perl-mojolicious.mk |   13 +++++++++++++
 3 files changed, 20 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index f43e985..1264053 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -423,6 +423,7 @@ endif
 	source "package/perl/Config.in"
 if BR2_PACKAGE_PERL
 menu "Perl libraries/modules"
+	source "package/perl-mojolicious/Config.in"
 endmenu
 endif
 	source "package/php/Config.in"
diff --git a/package/perl-mojolicious/Config.in b/package/perl-mojolicious/Config.in
new file mode 100644
index 0000000..766d109
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
index 0000000..2c713e6
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
+PERL_MOJOLICIOUS_LICENSE = Artistic-2.0
+
+$(eval $(perl-package))

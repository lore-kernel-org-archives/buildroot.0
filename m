From: Francois Perrad <fperrad@gmail.com>
Date: Fri, 28 Nov 2014 18:23:43 +0100
Subject: [Buildroot] [PATCH] perl-gd: fix configure/build
Message-ID: <1417195423-17839-1-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

see http://autobuild.buildroot.net/results/e74/e74efded899744d757cb798c44f096b54898f95a/

this new patch prevents the use of a host gdlib-config

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl-gd/perl-gd-04-no-autoconfig.patch | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 package/perl-gd/perl-gd-04-no-autoconfig.patch

diff --git a/package/perl-gd/perl-gd-04-no-autoconfig.patch b/package/perl-gd/perl-gd-04-no-autoconfig.patch
new file mode 100644
index 0000000..c067d41
--- /dev/null
+++ b/package/perl-gd/perl-gd-04-no-autoconfig.patch
@@ -0,0 +1,19 @@
+prevents the use of gdlib-config in a cross-compilation environment
+
+Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
+
+Index: b/Makefile.PL
+===================================================================
+--- a/Makefile.PL
++++ b/Makefile.PL
+@@ -272,6 +272,7 @@
+ exit 0;
+
+ sub try_to_autoconfigure {
++  return; # hack for BR
+   my ($options,$lib_gd_path,$INC,$LIBPATH,$LIBS) = @_;
+   my $config = `gdlib-config --all`;
+   return unless $config;
+--
+2.1.0
+
-- 
2.1.0

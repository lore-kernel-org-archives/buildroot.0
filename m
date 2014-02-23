From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 23 Feb 2014 22:37:34 +0100
Subject: [Buildroot] [git commit] host-perl-module-build: new package
Message-ID: <20140228133416.8B79C9BBF9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=649ce56f1924e2deb9abbd960cce153e0d780b48
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Some Perl packages depend on very recent versions of Module-Build
which are not yet shipped with a stable perl version.
But the cpan client is able to update Module-Build as pre-requirement.
On Buildroot, we must install the latest Module-Build.

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Reviewed-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/perl-module-build/perl-module-build.mk |   12 ++++++++++++
 1 files changed, 12 insertions(+), 0 deletions(-)

diff --git a/package/perl-module-build/perl-module-build.mk b/package/perl-module-build/perl-module-build.mk
new file mode 100644
index 0000000..a95278d
--- /dev/null
+++ b/package/perl-module-build/perl-module-build.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# perl-module-build
+#
+################################################################################
+
+PERL_MODULE_BUILD_VERSION = 0.4204
+PERL_MODULE_BUILD_SOURCE = Module-Build-$(PERL_MODULE_BUILD_VERSION).tar.gz
+PERL_MODULE_BUILD_SITE = $(BR2_CPAN_MIRROR)/authors/id/L/LE/LEONT/
+PERL_MODULE_BUILD_LICENSE = Artistic or GPLv1+
+
+$(eval $(host-perl-package))

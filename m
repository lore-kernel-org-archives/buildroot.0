From: Francois Perrad <fperrad@gmail.com>
Date: Sun, 23 Feb 2014 15:17:18 +0100
Subject: [Buildroot] [pkg-perl infra v11 4/6] host-perl-module-build: new
	package
In-Reply-To: <1393165041-21015-1-git-send-email-francois.perrad@gadz.org>
References: <1393165041-21015-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1393165041-21015-5-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Some Perl packages depend on very recent versions of Module-Build
which are not yet shipped with a stable perl version.
But the cpan client is able to update Module-Build as pre-requirement.
On Buildroot, we must install the latest Module-Build.

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Reviewed-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/perl-module-build/perl-module-build.mk |   12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 package/perl-module-build/perl-module-build.mk

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
-- 
1.7.9.5

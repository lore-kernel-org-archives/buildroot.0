From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 13 Aug 2018 23:16:01 +0200
Subject: [Buildroot] [git commit branch/next] perl-module-implementation:
 new package
Message-ID: <20180813210948.3667F8D1FB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=84e9a557f1978d8356f9928a90faff933de8e51c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Christopher McCrory <chrismcc@gmail.com>
Acked-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                                 |  1 +
 package/Config.in                                          |  1 +
 package/perl-module-implementation/Config.in               |  9 +++++++++
 .../perl-module-implementation.hash                        |  6 ++++++
 .../perl-module-implementation.mk                          | 14 ++++++++++++++
 5 files changed, 31 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 6d0e3ecceb..f96a18a5f7 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -495,6 +495,7 @@ F:	package/perl-io-interface/
 F:	package/perl-io-socket-multicast/
 F:	package/perl-json-maybexs/
 F:	package/perl-mime-tools/
+F:	package/perl-module-implementation/
 F:	package/perl-module-runtime/
 F:	package/perl-number-bytes-human/
 F:	package/perl-params-util/
diff --git a/package/Config.in b/package/Config.in
index 85046ae56e..7a7142802a 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -711,6 +711,7 @@ menu "Perl libraries/modules"
 	source "package/perl-mime-base64-urlsafe/Config.in"
 	source "package/perl-mime-base64/Config.in"
 	source "package/perl-mime-tools/Config.in"
+	source "package/perl-module-implementation/Config.in"
 	source "package/perl-module-runtime/Config.in"
 	source "package/perl-mojolicious-plugin-authentication/Config.in"
 	source "package/perl-mojolicious/Config.in"
diff --git a/package/perl-module-implementation/Config.in b/package/perl-module-implementation/Config.in
new file mode 100644
index 0000000000..354197649d
--- /dev/null
+++ b/package/perl-module-implementation/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_PERL_MODULE_IMPLEMENTATION
+	bool "perl-module-implementation"
+	select BR2_PACKAGE_PERL_MODULE_RUNTIME
+	select BR2_PACKAGE_PERL_TRY_TINY
+	help
+	  Loads one of several alternate underlying implementations
+	  for a module
+
+	  http://metacpan.org/release/Module-Implementation
diff --git a/package/perl-module-implementation/perl-module-implementation.hash b/package/perl-module-implementation/perl-module-implementation.hash
new file mode 100644
index 0000000000..caf365c024
--- /dev/null
+++ b/package/perl-module-implementation/perl-module-implementation.hash
@@ -0,0 +1,6 @@
+# retrieved by scancpan from http://cpan.metacpan.org/
+md5    52e3fe0ca6b1eff0488d59b7aacc0667 Module-Implementation-0.09.tar.gz
+sha256 c15f1a12f0c2130c9efff3c2e1afe5887b08ccd033bd132186d1e7d5087fd66d Module-Implementation-0.09.tar.gz
+
+# computed by scancpan
+sha256 dd34e4dbcadfaa3db992201873e1cbb4b4f4c18e9bf000821d5c768e66d7ff0b LICENSE
diff --git a/package/perl-module-implementation/perl-module-implementation.mk b/package/perl-module-implementation/perl-module-implementation.mk
new file mode 100644
index 0000000000..50ee8610a5
--- /dev/null
+++ b/package/perl-module-implementation/perl-module-implementation.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# perl-module-implementation
+#
+################################################################################
+
+PERL_MODULE_IMPLEMENTATION_VERSION = 0.09
+PERL_MODULE_IMPLEMENTATION_SOURCE = Module-Implementation-$(PERL_MODULE_IMPLEMENTATION_VERSION).tar.gz
+PERL_MODULE_IMPLEMENTATION_SITE = $(BR2_CPAN_MIRROR)/authors/id/D/DR/DROLSKY
+PERL_MODULE_IMPLEMENTATION_DEPENDENCIES = perl-module-runtime perl-try-tiny
+PERL_MODULE_IMPLEMENTATION_LICENSE = Artistic-2.0
+PERL_MODULE_IMPLEMENTATION_LICENSE_FILES = LICENSE
+
+$(eval $(perl-package))

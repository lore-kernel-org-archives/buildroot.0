From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 07 Sep 2018 11:15:48 -0000
Subject: [Buildroot] [git commit] perl-module-runtime: new package
Message-ID: <20180907111455.0D3407F950@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8e09dc05c2d07b8334101c3f80cf02c767efd5f0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Christopher McCrory <chrismcc@gmail.com>
Acked-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                           |  1 +
 package/Config.in                                    |  1 +
 package/perl-module-runtime/Config.in                |  6 ++++++
 package/perl-module-runtime/perl-module-runtime.hash |  6 ++++++
 package/perl-module-runtime/perl-module-runtime.mk   | 14 ++++++++++++++
 5 files changed, 28 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index e88f951274..91659b364b 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -491,6 +491,7 @@ F:	package/perl-device-serialport/
 F:	package/perl-file-slurp/
 F:	package/perl-io-interface/
 F:	package/perl-json-maybexs/
+F:	package/perl-module-runtime/
 
 N:	Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
 F:	package/audit/
diff --git a/package/Config.in b/package/Config.in
index 32a567ca23..4a6fd22238 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -707,6 +707,7 @@ menu "Perl libraries/modules"
 	source "package/perl-mailtools/Config.in"
 	source "package/perl-mime-base64-urlsafe/Config.in"
 	source "package/perl-mime-base64/Config.in"
+	source "package/perl-module-runtime/Config.in"
 	source "package/perl-mojolicious-plugin-authentication/Config.in"
 	source "package/perl-mojolicious/Config.in"
 	source "package/perl-net-dns/Config.in"
diff --git a/package/perl-module-runtime/Config.in b/package/perl-module-runtime/Config.in
new file mode 100644
index 0000000000..fca29f66df
--- /dev/null
+++ b/package/perl-module-runtime/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PERL_MODULE_RUNTIME
+	bool "perl-module-runtime"
+	help
+	  runtime module handling
+
+	  https://metacpan.org/release/Module-Runtime
diff --git a/package/perl-module-runtime/perl-module-runtime.hash b/package/perl-module-runtime/perl-module-runtime.hash
new file mode 100644
index 0000000000..c52cb75504
--- /dev/null
+++ b/package/perl-module-runtime/perl-module-runtime.hash
@@ -0,0 +1,6 @@
+# retrieved by scancpan from http://cpan.metacpan.org/
+md5    d3d47222fa2e3dfcb4526f6cc8437b20 Module-Runtime-0.016.tar.gz
+sha256 68302ec646833547d410be28e09676db75006f4aa58a11f3bdb44ffe99f0f024 Module-Runtime-0.016.tar.gz
+
+# computed by scancpan
+sha256 ad1761020436687e8493208336ef53e84589fdba212da59b05b8111cca75ddc1 README
diff --git a/package/perl-module-runtime/perl-module-runtime.mk b/package/perl-module-runtime/perl-module-runtime.mk
new file mode 100644
index 0000000000..5ba95f7056
--- /dev/null
+++ b/package/perl-module-runtime/perl-module-runtime.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# perl-module-runtime
+#
+################################################################################
+
+PERL_MODULE_RUNTIME_VERSION = 0.016
+PERL_MODULE_RUNTIME_SOURCE = Module-Runtime-$(PERL_MODULE_RUNTIME_VERSION).tar.gz
+PERL_MODULE_RUNTIME_SITE = $(BR2_CPAN_MIRROR)/authors/id/Z/ZE/ZEFRAM
+PERL_MODULE_RUNTIME_DEPENDENCIES = host-perl-module-build
+PERL_MODULE_RUNTIME_LICENSE = Artistic or GPL-1.0+
+PERL_MODULE_RUNTIME_LICENSE_FILES = README
+
+$(eval $(perl-package))

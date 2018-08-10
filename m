From: Christopher McCrory <chrismcc@gmail.com>
Date: Fri, 10 Aug 2018 09:14:56 -0700
Subject: [Buildroot] [PATCH 12/18] perl-module-runtime: new package
In-Reply-To: <20180810161502.21598-1-chrismcc@gmail.com>
References: <20180810161502.21598-1-chrismcc@gmail.com>
Message-ID: <20180810161502.21598-13-chrismcc@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Christopher McCrory <chrismcc@gmail.com>
---
 package/Config.in                                    |  1 +
 package/perl-module-runtime/Config.in                |  6 ++++++
 package/perl-module-runtime/perl-module-runtime.hash |  6 ++++++
 package/perl-module-runtime/perl-module-runtime.mk   | 14 ++++++++++++++
 4 files changed, 27 insertions(+)
 create mode 100644 package/perl-module-runtime/Config.in
 create mode 100644 package/perl-module-runtime/perl-module-runtime.hash
 create mode 100644 package/perl-module-runtime/perl-module-runtime.mk

diff --git a/package/Config.in b/package/Config.in
index 40964d3406..a20dfe57d7 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -708,6 +708,7 @@ menu "Perl libraries/modules"
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
-- 
2.14.4

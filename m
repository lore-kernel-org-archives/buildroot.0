From: Christopher McCrory <chrismcc@gmail.com>
Date: Sat, 11 Aug 2018 11:27:47 -0700
Subject: [Buildroot] [PATCH 15/17] perl-module-build: add target
In-Reply-To: <20180811182749.20924-1-chrismcc@gmail.com>
References: <20180811182749.20924-1-chrismcc@gmail.com>
Message-ID: <20180811182749.20924-16-chrismcc@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Christopher McCrory <chrismcc@gmail.com>
---
 DEVELOPERS                                     | 1 +
 package/Config.in                              | 1 +
 package/perl-module-build/Config.in            | 6 ++++++
 package/perl-module-build/perl-module-build.mk | 1 +
 4 files changed, 9 insertions(+)
 create mode 100644 package/perl-module-build/Config.in

diff --git a/DEVELOPERS b/DEVELOPERS
index d056cadf1f..b9d510f3a6 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -496,6 +496,7 @@ F:	package/perl-io-interface
 F:	package/perl-io-socket-multicast
 F:	package/perl-json-maybexs
 F:	package/perl-mime-tools
+F:	package/perl-module-build
 F:	package/perl-module-implementation
 F:	package/perl-module-runtime
 F:	package/perl-number-bytes-human
diff --git a/package/Config.in b/package/Config.in
index 4cedcec11a..3dc8a8717a 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -713,6 +713,7 @@ menu "Perl libraries/modules"
 	source "package/perl-mime-base64-urlsafe/Config.in"
 	source "package/perl-mime-base64/Config.in"
 	source "package/perl-mime-tools/Config.in"
+	source "package/perl-module-build/Config.in"
 	source "package/perl-module-implementation/Config.in"
 	source "package/perl-module-runtime/Config.in"
 	source "package/perl-mojolicious-plugin-authentication/Config.in"
diff --git a/package/perl-module-build/Config.in b/package/perl-module-build/Config.in
new file mode 100644
index 0000000000..ee4354cc6a
--- /dev/null
+++ b/package/perl-module-build/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PERL_MODULE_BUILD
+	bool "perl-module-build"
+	help
+	  Build and install Perl modules
+
+	  https://metacpan.org/release/Module-Build
diff --git a/package/perl-module-build/perl-module-build.mk b/package/perl-module-build/perl-module-build.mk
index 42c9c11141..0a79b64d00 100644
--- a/package/perl-module-build/perl-module-build.mk
+++ b/package/perl-module-build/perl-module-build.mk
@@ -10,4 +10,5 @@ PERL_MODULE_BUILD_SITE = $(BR2_CPAN_MIRROR)/authors/id/L/LE/LEONT
 PERL_MODULE_BUILD_LICENSE = Artistic or GPL-1.0+
 PERL_MODULE_BUILD_LICENSE_FILES = LICENSE
 
+$(eval $(perl-package))
 $(eval $(host-perl-package))
-- 
2.14.4

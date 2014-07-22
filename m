From: Francois Perrad <fperrad@gmail.com>
Date: Tue, 22 Jul 2014 20:17:54 +0200
Subject: [Buildroot] [PATCH 2/4] perl-json-tiny: new package
In-Reply-To: <1406053076-25453-1-git-send-email-francois.perrad@gadz.org>
References: <1406053076-25453-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1406053076-25453-2-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/Config.in                        |  1 +
 package/perl-json-tiny/Config.in         |  6 ++++++
 package/perl-json-tiny/perl-json-tiny.mk | 14 ++++++++++++++
 3 files changed, 21 insertions(+)
 create mode 100644 package/perl-json-tiny/Config.in
 create mode 100644 package/perl-json-tiny/perl-json-tiny.mk

diff --git a/package/Config.in b/package/Config.in
index aa2f783..b89a98e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -436,6 +436,7 @@ menu "Perl libraries/modules"
 	source "package/perl-gdgraph/Config.in"
 	source "package/perl-gdtextutil/Config.in"
 	source "package/perl-io-socket-ssl/Config.in"
+	source "package/perl-json-tiny/Config.in"
 	source "package/perl-mojolicious/Config.in"
 	source "package/perl-net-ssleay/Config.in"
 	source "package/perl-xml-libxml/Config.in"
diff --git a/package/perl-json-tiny/Config.in b/package/perl-json-tiny/Config.in
new file mode 100644
index 0000000..ce943ca
--- /dev/null
+++ b/package/perl-json-tiny/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PERL_JSON_TINY
+	bool "perl-json-tiny"
+	help
+	  Minimalistic JSON. No dependencies.
+
+	  https://metacpan.org/release/JSON-Tiny
diff --git a/package/perl-json-tiny/perl-json-tiny.mk b/package/perl-json-tiny/perl-json-tiny.mk
new file mode 100644
index 0000000..fd99ee7
--- /dev/null
+++ b/package/perl-json-tiny/perl-json-tiny.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# perl-json-tiny
+#
+################################################################################
+
+PERL_JSON_TINY_VERSION = 0.49
+PERL_JSON_TINY_SOURCE = JSON-Tiny-$(PERL_JSON_TINY_VERSION).tar.gz
+PERL_JSON_TINY_SITE = $(BR2_CPAN_MIRROR)/authors/id/D/DA/DAVIDO/
+PERL_JSON_TINY_DEPENDENCIES = perl
+PERL_JSON_TINY_LICENSE = Artistic-2.0
+PERL_JSON_TINY_LICENSE_FILES = LICENSE
+
+$(eval $(perl-package))
-- 
1.9.1

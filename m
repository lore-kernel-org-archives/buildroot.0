From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 13 Aug 2018 14:11:00 +0200
Subject: [Buildroot] [git commit branch/next] perl-mime-tools: new package
Message-ID: <20180813120913.8358982891@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a8df4f293513e0c9c7279fcdd0ee2d2333d22f98
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Christopher McCrory <chrismcc@gmail.com>
Acked-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                   |  1 +
 package/Config.in                            |  1 +
 package/perl-mime-tools/Config.in            |  7 +++++++
 package/perl-mime-tools/perl-mime-tools.hash |  6 ++++++
 package/perl-mime-tools/perl-mime-tools.mk   | 14 ++++++++++++++
 5 files changed, 29 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 0831f962e2..6d0e3ecceb 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -494,6 +494,7 @@ F:	package/perl-file-slurp/
 F:	package/perl-io-interface/
 F:	package/perl-io-socket-multicast/
 F:	package/perl-json-maybexs/
+F:	package/perl-mime-tools/
 F:	package/perl-module-runtime/
 F:	package/perl-number-bytes-human/
 F:	package/perl-params-util/
diff --git a/package/Config.in b/package/Config.in
index fba6d1116b..85046ae56e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -710,6 +710,7 @@ menu "Perl libraries/modules"
 	source "package/perl-mailtools/Config.in"
 	source "package/perl-mime-base64-urlsafe/Config.in"
 	source "package/perl-mime-base64/Config.in"
+	source "package/perl-mime-tools/Config.in"
 	source "package/perl-module-runtime/Config.in"
 	source "package/perl-mojolicious-plugin-authentication/Config.in"
 	source "package/perl-mojolicious/Config.in"
diff --git a/package/perl-mime-tools/Config.in b/package/perl-mime-tools/Config.in
new file mode 100644
index 0000000000..740651d1d0
--- /dev/null
+++ b/package/perl-mime-tools/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PERL_MIME_TOOLS
+	bool "perl-mime-tools"
+	select BR2_PACKAGE_PERL_MAILTOOLS
+	help
+	  Tools to manipulate MIME messages
+
+	  https://metacpan.org/release/MIME-tools
diff --git a/package/perl-mime-tools/perl-mime-tools.hash b/package/perl-mime-tools/perl-mime-tools.hash
new file mode 100644
index 0000000000..41e13eb0b2
--- /dev/null
+++ b/package/perl-mime-tools/perl-mime-tools.hash
@@ -0,0 +1,6 @@
+# retrieved by scancpan from http://cpan.metacpan.org/
+md5    a2f0e07da2ff4b0478908544cc4b40fa MIME-tools-5.509.tar.gz
+sha256 64579f0c923d81d9a2194586e47c3475519e2646e4b5c102a8920759facf6973 MIME-tools-5.509.tar.gz
+
+# computed by scancpan
+sha256 151cd94e37eb05239c5a678c7d1c4d9d5241a7c9c138760b85152bc1947e2b93 COPYING
diff --git a/package/perl-mime-tools/perl-mime-tools.mk b/package/perl-mime-tools/perl-mime-tools.mk
new file mode 100644
index 0000000000..03bea508ef
--- /dev/null
+++ b/package/perl-mime-tools/perl-mime-tools.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# perl-mime-tools
+#
+################################################################################
+
+PERL_MIME_TOOLS_VERSION = 5.509
+PERL_MIME_TOOLS_SOURCE = MIME-tools-$(PERL_MIME_TOOLS_VERSION).tar.gz
+PERL_MIME_TOOLS_SITE = $(BR2_CPAN_MIRROR)/authors/id/D/DS/DSKOLL
+PERL_MIME_TOOLS_DEPENDENCIES = perl-mailtools
+PERL_MIME_TOOLS_LICENSE = Artistic or GPL-1.0+
+PERL_MIME_TOOLS_LICENSE_FILES = COPYING
+
+$(eval $(perl-package))

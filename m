From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun,  3 Jun 2018 10:11:33 +0200
Subject: [Buildroot] [PATCH 1/2] host-perl-autodie: new package
Message-ID: <20180603081134.1933-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Replace functions with ones that succeed or die with lexical scope

https://metacpan.org/release/autodie

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/perl-autodie/perl-autodie.hash |  6 ++++++
 package/perl-autodie/perl-autodie.mk   | 13 +++++++++++++
 2 files changed, 19 insertions(+)
 create mode 100644 package/perl-autodie/perl-autodie.hash
 create mode 100644 package/perl-autodie/perl-autodie.mk

diff --git a/package/perl-autodie/perl-autodie.hash b/package/perl-autodie/perl-autodie.hash
new file mode 100644
index 0000000000..7eb157c73a
--- /dev/null
+++ b/package/perl-autodie/perl-autodie.hash
@@ -0,0 +1,6 @@
+# retrieved by scancpan from http://cpan.metacpan.org/
+md5    2739e6599a2aa47601fe91b2a27b29d9 autodie-2.29.tar.gz
+sha256 f5b77917e7004179c93ff8511c8a4c1ea19df3da6379f78b55b57791c45229bf autodie-2.29.tar.gz
+
+# computed by scancpan
+sha256 d03cbb6193f7c27bcdce8464624624275cdbde207a94896c4ebb3bac1f9f5c5c LICENSE
diff --git a/package/perl-autodie/perl-autodie.mk b/package/perl-autodie/perl-autodie.mk
new file mode 100644
index 0000000000..dbe458854b
--- /dev/null
+++ b/package/perl-autodie/perl-autodie.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# perl-autodie
+#
+################################################################################
+
+PERL_AUTODIE_VERSION = 2.29
+PERL_AUTODIE_SOURCE = autodie-$(PERL_AUTODIE_VERSION).tar.gz
+PERL_AUTODIE_SITE = $(BR2_CPAN_MIRROR)/authors/id/P/PJ/PJF
+PERL_AUTODIE_LICENSE = Artistic or GPL-1.0+
+PERL_AUTODIE_LICENSE_FILES = LICENSE
+
+$(eval $(host-perl-package))
-- 
2.14.1

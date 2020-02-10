From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Mon, 10 Feb 2020 12:26:33 +0100
Subject: [Buildroot] [PATCHv2 10/12] package/perl-path-class: new host
 package
In-Reply-To: <20200210112636.8155-1-patrickdepinguin@gmail.com>
References: <20200210112636.8155-1-patrickdepinguin@gmail.com>
Message-ID: <20200210112636.8155-11-patrickdepinguin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>

Dependency for perl-crypt-ssleay (added in a subsequent commit)

Added via utils/scancpan, without changes.

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
---
 DEVELOPERS                                   |  1 +
 package/perl-path-class/perl-path-class.hash |  6 ++++++
 package/perl-path-class/perl-path-class.mk   | 15 +++++++++++++++
 3 files changed, 22 insertions(+)
 create mode 100644 package/perl-path-class/perl-path-class.hash
 create mode 100644 package/perl-path-class/perl-path-class.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 647c4f94f1..c8b71ee7c1 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2393,6 +2393,7 @@ F:	package/perl-mozilla-ca/
 F:	package/perl-net-snmp/
 F:	package/perl-net-ssh2/
 F:	package/perl-net-telnet/
+F:	package/perl-path-class/
 F:	package/pigz/
 F:	package/xenomai/
 F:	support/scripts/size-stats
diff --git a/package/perl-path-class/perl-path-class.hash b/package/perl-path-class/perl-path-class.hash
new file mode 100644
index 0000000000..d2741dfca4
--- /dev/null
+++ b/package/perl-path-class/perl-path-class.hash
@@ -0,0 +1,6 @@
+# retrieved by scancpan from http://cpan.metacpan.org/
+md5    13e6db714f6d5a0e62ca1c4a7fc4d0f3 Path-Class-0.37.tar.gz
+sha256 654781948602386f2cb2e4473a739f17dc6953d92aabc2498a4ca2561bc248ce Path-Class-0.37.tar.gz
+
+# computed by scancpan
+sha256 636b5c82eabfe3d4cd86126db9502fd537d1442ad2c88c93dbe221e62b5f1710 LICENSE
diff --git a/package/perl-path-class/perl-path-class.mk b/package/perl-path-class/perl-path-class.mk
new file mode 100644
index 0000000000..185b7f6391
--- /dev/null
+++ b/package/perl-path-class/perl-path-class.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# perl-path-class
+#
+################################################################################
+
+PERL_PATH_CLASS_VERSION = 0.37
+PERL_PATH_CLASS_SOURCE = Path-Class-$(PERL_PATH_CLASS_VERSION).tar.gz
+PERL_PATH_CLASS_SITE = $(BR2_CPAN_MIRROR)/authors/id/K/KW/KWILLIAMS
+HOST_PERL_PATH_CLASS_DEPENDENCIES = host-perl-module-build
+PERL_PATH_CLASS_LICENSE = Artistic or GPL-1.0+
+PERL_PATH_CLASS_LICENSE_FILES = LICENSE
+PERL_PATH_CLASS_DISTNAME = Path-Class
+
+$(eval $(host-perl-package))
-- 
2.24.1

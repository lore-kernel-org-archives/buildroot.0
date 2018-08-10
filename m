From: Christopher McCrory <chrismcc@gmail.com>
Date: Fri, 10 Aug 2018 09:14:49 -0700
Subject: [Buildroot] [PATCH 05/18] perl-data-uuid: new package
In-Reply-To: <20180810161502.21598-1-chrismcc@gmail.com>
References: <20180810161502.21598-1-chrismcc@gmail.com>
Message-ID: <20180810161502.21598-6-chrismcc@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Christopher McCrory <chrismcc@gmail.com>
---
 package/Config.in                          |  1 +
 package/perl-data-uuid/Config.in           | 10 ++++++++++
 package/perl-data-uuid/perl-data-uuid.hash |  6 ++++++
 package/perl-data-uuid/perl-data-uuid.mk   | 13 +++++++++++++
 4 files changed, 30 insertions(+)
 create mode 100644 package/perl-data-uuid/Config.in
 create mode 100644 package/perl-data-uuid/perl-data-uuid.hash
 create mode 100644 package/perl-data-uuid/perl-data-uuid.mk

diff --git a/package/Config.in b/package/Config.in
index d1f0947d6d..dad6916c64 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -674,6 +674,7 @@ menu "Perl libraries/modules"
 	source "package/perl-crypt-cbc/Config.in"
 	source "package/perl-crypt-openssl-random/Config.in"
 	source "package/perl-crypt-openssl-rsa/Config.in"
+	source "package/perl-data-uuid/Config.in"
 	source "package/perl-datetime-tiny/Config.in"
 	source "package/perl-digest-hmac/Config.in"
 	source "package/perl-digest-md5/Config.in"
diff --git a/package/perl-data-uuid/Config.in b/package/perl-data-uuid/Config.in
new file mode 100644
index 0000000000..e0752c44ab
--- /dev/null
+++ b/package/perl-data-uuid/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_PERL_DATA_UUID
+	bool "perl-data-uuid"
+	depends on !BR2_STATIC_LIBS
+	help
+	  Globally/Universally Unique Identifiers (GUIDs/UUIDs)
+
+	  https://metacpan.org/release/Data-UUID
+
+comment "perl-data-uuid needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
diff --git a/package/perl-data-uuid/perl-data-uuid.hash b/package/perl-data-uuid/perl-data-uuid.hash
new file mode 100644
index 0000000000..5086936d4e
--- /dev/null
+++ b/package/perl-data-uuid/perl-data-uuid.hash
@@ -0,0 +1,6 @@
+# retrieved by scancpan from http://cpan.metacpan.org/
+md5    7619929e8fe205a7fb83bc1c29ecbf99 Data-UUID-1.221.tar.gz
+sha256 3cc7b2a3a7b74b45a059e013f7fd878078500ea4b7269036f84556b022078667 Data-UUID-1.221.tar.gz
+
+# computed by scancpan
+sha256 0560c8eea8e1fb8173faa6c2e9b7e9f8728b8ae8250a814709a53c30b778d5fb LICENSE
diff --git a/package/perl-data-uuid/perl-data-uuid.mk b/package/perl-data-uuid/perl-data-uuid.mk
new file mode 100644
index 0000000000..24d61c6ce3
--- /dev/null
+++ b/package/perl-data-uuid/perl-data-uuid.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# perl-data-uuid
+#
+################################################################################
+
+PERL_DATA_UUID_VERSION = 1.221
+PERL_DATA_UUID_SOURCE = Data-UUID-$(PERL_DATA_UUID_VERSION).tar.gz
+PERL_DATA_UUID_SITE = $(BR2_CPAN_MIRROR)/authors/id/R/RJ/RJBS
+PERL_DATA_UUID_LICENSE = bsd
+PERL_DATA_UUID_LICENSE_FILES = LICENSE
+
+$(eval $(perl-package))
-- 
2.14.4

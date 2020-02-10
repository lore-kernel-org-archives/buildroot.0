From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Mon, 10 Feb 2020 12:26:27 +0100
Subject: [Buildroot] [PATCHv2 04/12]
 package/perl-mojolicious-plugin-cspheader: new package
In-Reply-To: <20200210112636.8155-1-patrickdepinguin@gmail.com>
References: <20200210112636.8155-1-patrickdepinguin@gmail.com>
Message-ID: <20200210112636.8155-5-patrickdepinguin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Joeri Barbarien <joeri.barbarien@nokia.com>

Added via utils/scancpan, without changes.

Signed-off-by: Joeri Barbarien <joeri.barbarien@nokia.com>
Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
---
 DEVELOPERS                                         |  1 +
 package/Config.in                                  |  1 +
 .../perl-mojolicious-plugin-cspheader/Config.in    |  8 ++++++++
 .../perl-mojolicious-plugin-cspheader.hash         |  6 ++++++
 .../perl-mojolicious-plugin-cspheader.mk           | 14 ++++++++++++++
 5 files changed, 30 insertions(+)
 create mode 100644 package/perl-mojolicious-plugin-cspheader/Config.in
 create mode 100644 package/perl-mojolicious-plugin-cspheader/perl-mojolicious-plugin-cspheader.hash
 create mode 100644 package/perl-mojolicious-plugin-cspheader/perl-mojolicious-plugin-cspheader.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 37976a7d43..c7b98fb349 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2384,6 +2384,7 @@ F:	package/perl-math-prime-util/
 F:	package/perl-mime-base64-urlsafe/
 F:	package/perl-mojolicious-plugin-authentication/
 F:	package/perl-mojolicious-plugin-authorization/
+F:	package/perl-mojolicious-plugin-cspheader/
 F:	package/perl-net-snmp/
 F:	package/perl-net-ssh2/
 F:	package/perl-net-telnet/
diff --git a/package/Config.in b/package/Config.in
index f487ed2b96..c85f0676cf 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -780,6 +780,7 @@ menu "Perl libraries/modules"
 	source "package/perl-mojolicious/Config.in"
 	source "package/perl-mojolicious-plugin-authentication/Config.in"
 	source "package/perl-mojolicious-plugin-authorization/Config.in"
+	source "package/perl-mojolicious-plugin-cspheader/Config.in"
 	source "package/perl-moo/Config.in"
 	source "package/perl-net-dns/Config.in"
 	source "package/perl-net-http/Config.in"
diff --git a/package/perl-mojolicious-plugin-cspheader/Config.in b/package/perl-mojolicious-plugin-cspheader/Config.in
new file mode 100644
index 0000000000..841b309470
--- /dev/null
+++ b/package/perl-mojolicious-plugin-cspheader/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_PERL_MOJOLICIOUS_PLUGIN_CSPHEADER
+	bool "perl-mojolicious-plugin-cspheader"
+	select BR2_PACKAGE_PERL_MOJOLICIOUS # runtime
+	help
+	  Mojolicious Plugin to add Content-Security-Policy header to
+	  every HTTP response.
+
+	  https://metacpan.org/release/Mojolicious-Plugin-CSPHeader
diff --git a/package/perl-mojolicious-plugin-cspheader/perl-mojolicious-plugin-cspheader.hash b/package/perl-mojolicious-plugin-cspheader/perl-mojolicious-plugin-cspheader.hash
new file mode 100644
index 0000000000..d0f9dc3ab0
--- /dev/null
+++ b/package/perl-mojolicious-plugin-cspheader/perl-mojolicious-plugin-cspheader.hash
@@ -0,0 +1,6 @@
+# retrieved by scancpan from http://cpan.metacpan.org/
+md5    3d1b01c393e7ed576e4b503d26a88a3e Mojolicious-Plugin-CSPHeader-0.06.tar.gz
+sha256 0523a170af6620dab5b746725f171a138b6cff3d2d84e1a30af891741550f4a7 Mojolicious-Plugin-CSPHeader-0.06.tar.gz
+
+# computed by scancpan
+sha256 4bb36edd2bcafef11ca615f69607953a31ee05ae172b69990aee317e95653456 LICENSE
diff --git a/package/perl-mojolicious-plugin-cspheader/perl-mojolicious-plugin-cspheader.mk b/package/perl-mojolicious-plugin-cspheader/perl-mojolicious-plugin-cspheader.mk
new file mode 100644
index 0000000000..438d6d517e
--- /dev/null
+++ b/package/perl-mojolicious-plugin-cspheader/perl-mojolicious-plugin-cspheader.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# perl-mojolicious-plugin-cspheader
+#
+################################################################################
+
+PERL_MOJOLICIOUS_PLUGIN_CSPHEADER_VERSION = 0.06
+PERL_MOJOLICIOUS_PLUGIN_CSPHEADER_SOURCE = Mojolicious-Plugin-CSPHeader-$(PERL_MOJOLICIOUS_PLUGIN_CSPHEADER_VERSION).tar.gz
+PERL_MOJOLICIOUS_PLUGIN_CSPHEADER_SITE = $(BR2_CPAN_MIRROR)/authors/id/L/LD/LDIDRY
+PERL_MOJOLICIOUS_PLUGIN_CSPHEADER_LICENSE = Artistic or GPL-1.0+
+PERL_MOJOLICIOUS_PLUGIN_CSPHEADER_LICENSE_FILES = LICENSE
+PERL_MOJOLICIOUS_PLUGIN_CSPHEADER_DISTNAME = Mojolicious-Plugin-CSPHeader
+
+$(eval $(perl-package))
-- 
2.24.1

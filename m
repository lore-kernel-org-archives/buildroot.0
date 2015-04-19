From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 19 Apr 2015 12:16:59 +0200
Subject: [Buildroot] [PATCH v2 04/25] package/perl-net-dns: New package
In-Reply-To: <1429438640-9367-1-git-send-email-bernd.kuhls@t-online.de>
References: <1429438640-9367-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1429438640-9367-5-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/Config.in                      |    1 +
 package/perl-net-dns/Config.in         |   11 +++++++++++
 package/perl-net-dns/perl-net-dns.hash |    3 +++
 package/perl-net-dns/perl-net-dns.mk   |   14 ++++++++++++++
 4 files changed, 29 insertions(+)
 create mode 100644 package/perl-net-dns/Config.in
 create mode 100644 package/perl-net-dns/perl-net-dns.hash
 create mode 100644 package/perl-net-dns/perl-net-dns.mk

diff --git a/package/Config.in b/package/Config.in
index 07221f8..d6ef132 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -513,6 +513,7 @@ menu "Perl libraries/modules"
 	source "package/perl-io-socket-ssl/Config.in"
 	source "package/perl-json-tiny/Config.in"
 	source "package/perl-mojolicious/Config.in"
+	source "package/perl-net-dns/Config.in"
 	source "package/perl-net-ssleay/Config.in"
 	source "package/perl-netaddr-ip/Config.in"
 	source "package/perl-path-tiny/Config.in"
diff --git a/package/perl-net-dns/Config.in b/package/perl-net-dns/Config.in
new file mode 100644
index 0000000..52fb4d8
--- /dev/null
+++ b/package/perl-net-dns/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_PERL_NET_DNS
+	bool "perl-net-dns"
+	depends on !BR2_STATIC_LIBS
+	select BR2_PACKAGE_PERL_DIGEST_HMAC
+	help
+	  Net::DNS is a DNS resolver implemented in Perl.
+
+	  http://www.net-dns.org
+
+comment "perl-net-dns needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
diff --git a/package/perl-net-dns/perl-net-dns.hash b/package/perl-net-dns/perl-net-dns.hash
new file mode 100644
index 0000000..01d2772
--- /dev/null
+++ b/package/perl-net-dns/perl-net-dns.hash
@@ -0,0 +1,3 @@
+# retrieved by scancpan from http://cpan.metacpan.org/
+md5    f1d48107ff6b366479ad035783486d7a Net-DNS-0.83.tar.gz
+sha256 8e1108d1801b9695909859323e1ed2f7ffb3b03dd3d2028a19fb79fc1a1d7c39 Net-DNS-0.83.tar.gz
diff --git a/package/perl-net-dns/perl-net-dns.mk b/package/perl-net-dns/perl-net-dns.mk
new file mode 100644
index 0000000..75c0a1b
--- /dev/null
+++ b/package/perl-net-dns/perl-net-dns.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# perl-net-dns
+#
+################################################################################
+
+PERL_NET_DNS_VERSION = 0.83
+PERL_NET_DNS_SOURCE = Net-DNS-$(PERL_NET_DNS_VERSION).tar.gz
+PERL_NET_DNS_SITE = $(BR2_CPAN_MIRROR)/authors/id/N/NL/NLNETLABS
+PERL_NET_DNS_DEPENDENCIES = perl perl-digest-hmac
+PERL_NET_DNS_LICENSE = Artistic or GPLv1+
+PERL_NET_DNS_LICENSE_FILES = README
+
+$(eval $(perl-package))
-- 
1.7.10.4

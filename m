From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 19 Apr 2015 10:33:18 +0200
Subject: [Buildroot] [PATCH 05/20] perl-net-dns: New package
In-Reply-To: <1429432413-17038-1-git-send-email-bernd.kuhls@t-online.de>
References: <1429432413-17038-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1429432413-17038-6-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/Config.in                      |    1 +
 package/perl-net-dns/Config.in         |    7 +++++++
 package/perl-net-dns/perl-net-dns.hash |    3 +++
 package/perl-net-dns/perl-net-dns.mk   |   15 +++++++++++++++
 4 files changed, 26 insertions(+)
 create mode 100644 package/perl-net-dns/Config.in
 create mode 100644 package/perl-net-dns/perl-net-dns.hash
 create mode 100644 package/perl-net-dns/perl-net-dns.mk

diff --git a/package/Config.in b/package/Config.in
index 95f3624..3e85dba 100644
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
index 0000000..24ce481
--- /dev/null
+++ b/package/perl-net-dns/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PERL_NET_DNS
+	bool "perl-net-dns"
+	select BR2_PACKAGE_PERL_DIGEST_HMAC
+	help
+	  Net::DNS is a DNS resolver implemented in Perl.
+
+	  http://www.net-dns.org
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
index 0000000..444785f
--- /dev/null
+++ b/package/perl-net-dns/perl-net-dns.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# perl-net-dns
+#
+################################################################################
+
+PERL_NET_DNS_VERSION = 0.83
+PERL_NET_DNS_SOURCE = Net-DNS-$(PERL_NET_DNS_VERSION).tar.gz
+PERL_NET_DNS_SITE = $(BR2_CPAN_MIRROR)/authors/id/N/NL/NLNETLABS
+PERL_NET_DNS_DEPENDENCIES = perl-digest-hmac
+PERL_NET_DNS_LICENSE = Artistic or GPLv1+
+PERL_NET_DNS_LICENSE_FILES = README
+
+$(eval $(perl-package))
+$(eval $(host-perl-package))
-- 
1.7.10.4

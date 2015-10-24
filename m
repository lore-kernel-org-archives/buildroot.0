From: Francois Perrad <fperrad@gmail.com>
Date: Sat, 24 Oct 2015 18:26:54 +0200
Subject: [Buildroot] [PATCH 07/11] perl-net-dns: bump to version 1.02
In-Reply-To: <1445704018-9780-1-git-send-email-francois.perrad@gadz.org>
References: <1445704018-9780-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1445704018-9780-7-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl-net-dns/Config.in         | 4 ----
 package/perl-net-dns/perl-net-dns.hash | 4 ++--
 package/perl-net-dns/perl-net-dns.mk   | 4 ++--
 3 files changed, 4 insertions(+), 8 deletions(-)

diff --git a/package/perl-net-dns/Config.in b/package/perl-net-dns/Config.in
index 52fb4d8..24ce481 100644
--- a/package/perl-net-dns/Config.in
+++ b/package/perl-net-dns/Config.in
@@ -1,11 +1,7 @@
 config BR2_PACKAGE_PERL_NET_DNS
 	bool "perl-net-dns"
-	depends on !BR2_STATIC_LIBS
 	select BR2_PACKAGE_PERL_DIGEST_HMAC
 	help
 	  Net::DNS is a DNS resolver implemented in Perl.
 
 	  http://www.net-dns.org
-
-comment "perl-net-dns needs a toolchain w/ dynamic library"
-	depends on BR2_STATIC_LIBS
diff --git a/package/perl-net-dns/perl-net-dns.hash b/package/perl-net-dns/perl-net-dns.hash
index 01d2772..6533e2b 100644
--- a/package/perl-net-dns/perl-net-dns.hash
+++ b/package/perl-net-dns/perl-net-dns.hash
@@ -1,3 +1,3 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    f1d48107ff6b366479ad035783486d7a Net-DNS-0.83.tar.gz
-sha256 8e1108d1801b9695909859323e1ed2f7ffb3b03dd3d2028a19fb79fc1a1d7c39 Net-DNS-0.83.tar.gz
+md5    adbb3fd9bc1677d8fd79605925a35106 Net-DNS-1.02.tar.gz
+sha256 9473c322b036592663bb20383e85190a682d142688b162efc975a61bcc7534f2 Net-DNS-1.02.tar.gz
diff --git a/package/perl-net-dns/perl-net-dns.mk b/package/perl-net-dns/perl-net-dns.mk
index f93b084..59d2b60 100644
--- a/package/perl-net-dns/perl-net-dns.mk
+++ b/package/perl-net-dns/perl-net-dns.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-PERL_NET_DNS_VERSION = 0.83
+PERL_NET_DNS_VERSION = 1.02
 PERL_NET_DNS_SOURCE = Net-DNS-$(PERL_NET_DNS_VERSION).tar.gz
 PERL_NET_DNS_SITE = $(BR2_CPAN_MIRROR)/authors/id/N/NL/NLNETLABS
 PERL_NET_DNS_DEPENDENCIES = perl-digest-hmac
-PERL_NET_DNS_LICENSE = Artistic or GPLv1+
+PERL_NET_DNS_LICENSE = MIT
 PERL_NET_DNS_LICENSE_FILES = README
 
 $(eval $(perl-package))
-- 
2.5.0

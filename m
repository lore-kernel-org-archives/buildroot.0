From: Francois Perrad <fperrad@gmail.com>
Date: Mon, 26 Oct 2015 18:45:00 +0100
Subject: [Buildroot] [PATCH 1/2] perl-netaddr-ip: remove !BR2_STATIC_LIBS
	constraint
Message-ID: <1445881501-3104-1-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

with the option -noxs, the Pure Perl version is always built.

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl-netaddr-ip/Config.in          | 3 ---
 package/perl-netaddr-ip/perl-netaddr-ip.mk | 2 ++
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/perl-netaddr-ip/Config.in b/package/perl-netaddr-ip/Config.in
index 7ccb20a..1525830 100644
--- a/package/perl-netaddr-ip/Config.in
+++ b/package/perl-netaddr-ip/Config.in
@@ -1,10 +1,7 @@
 config BR2_PACKAGE_PERL_NETADDR_IP
 	bool "perl-netaddr-ip"
-	depends on !BR2_STATIC_LIBS
 	help
 	  Manages IPv4 and IPv6 addresses and subnets
 
 	  https://metacpan.org/release/NetAddr-IP
 
-comment "perl-netaddr-ip needs a toolchain w/ dynamic library"
-	depends on BR2_STATIC_LIBS
diff --git a/package/perl-netaddr-ip/perl-netaddr-ip.mk b/package/perl-netaddr-ip/perl-netaddr-ip.mk
index 2e5a82a..f2eec6c 100644
--- a/package/perl-netaddr-ip/perl-netaddr-ip.mk
+++ b/package/perl-netaddr-ip/perl-netaddr-ip.mk
@@ -10,6 +10,8 @@ PERL_NETADDR_IP_SITE = $(BR2_CPAN_MIRROR)/authors/id/M/MI/MIKER
 PERL_NETADDR_IP_LICENSE = Artistic or GPLv1+
 PERL_NETADDR_IP_LICENSE_FILES = Artistic Copying
 
+# we always build the Pure Perl version.
+# the build of the native part of NetAddr::IP::Util is buggy.
 PERL_NETADDR_IP_CONF_OPTS = -noxs
 
 $(eval $(perl-package))
-- 
2.5.0

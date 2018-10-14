From: Francois Perrad <fperrad@gmail.com>
Date: Sun, 14 Oct 2018 18:35:04 +0200
Subject: [Buildroot] [PATCH 3/3] perl-netaddr-ip: fix build of the XS version
In-Reply-To: <20181014163504.28519-1-francois.perrad@gadz.org>
References: <20181014163504.28519-1-francois.perrad@gadz.org>
Message-ID: <20181014163504.28519-4-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

thank to PERL_NETADDR_IP_PATCH_XS_MAKEFILES

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl-netaddr-ip/perl-netaddr-ip.mk | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/perl-netaddr-ip/perl-netaddr-ip.mk b/package/perl-netaddr-ip/perl-netaddr-ip.mk
index a1f02c691..6ff97202a 100644
--- a/package/perl-netaddr-ip/perl-netaddr-ip.mk
+++ b/package/perl-netaddr-ip/perl-netaddr-ip.mk
@@ -9,9 +9,11 @@ PERL_NETADDR_IP_SOURCE = NetAddr-IP-$(PERL_NETADDR_IP_VERSION).tar.gz
 PERL_NETADDR_IP_SITE = $(BR2_CPAN_MIRROR)/authors/id/M/MI/MIKER
 PERL_NETADDR_IP_LICENSE = Artistic or GPL-1.0+
 PERL_NETADDR_IP_LICENSE_FILES = Artistic Copying
+PERL_NETADDR_IP_PATCH_XS_MAKEFILES = Lite/Makefile Lite/Util/Makefile
 
-# we always build the Pure Perl version.
-# the build of the native part of NetAddr::IP::Util is buggy.
+ifeq ($(BR2_STATIC_LIBS),y)
+# build only the Pure Perl version.
 PERL_NETADDR_IP_CONF_OPTS = -noxs
+endif
 
 $(eval $(perl-package))
-- 
2.17.1

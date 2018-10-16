From: Francois Perrad <fperrad@gmail.com>
Date: Tue, 16 Oct 2018 21:55:05 +0200
Subject: [Buildroot] [PATCH 3/3] perl-netaddr-ip: build the XS version
In-Reply-To: <20181016195505.30438-1-francois.perrad@gadz.org>
References: <20181016195505.30438-1-francois.perrad@gadz.org>
Message-ID: <20181016195505.30438-3-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

the generated subdirectory Makefiles are now fixed

now, the Pure Perl version is only useful when BR2_STATIC_LIBS

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl-netaddr-ip/perl-netaddr-ip.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/perl-netaddr-ip/perl-netaddr-ip.mk b/package/perl-netaddr-ip/perl-netaddr-ip.mk
index a1f02c691..e96e42a85 100644
--- a/package/perl-netaddr-ip/perl-netaddr-ip.mk
+++ b/package/perl-netaddr-ip/perl-netaddr-ip.mk
@@ -10,8 +10,8 @@ PERL_NETADDR_IP_SITE = $(BR2_CPAN_MIRROR)/authors/id/M/MI/MIKER
 PERL_NETADDR_IP_LICENSE = Artistic or GPL-1.0+
 PERL_NETADDR_IP_LICENSE_FILES = Artistic Copying
 
-# we always build the Pure Perl version.
-# the build of the native part of NetAddr::IP::Util is buggy.
+ifeq ($(BR2_STATIC_LIBS),y)
 PERL_NETADDR_IP_CONF_OPTS = -noxs
+endif
 
 $(eval $(perl-package))
-- 
2.17.1

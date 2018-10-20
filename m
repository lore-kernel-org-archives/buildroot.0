From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 20 Oct 2018 19:30:14 +0200
Subject: [Buildroot] [git commit] perl-netaddr-ip: build the XS version
Message-ID: <20181020172849.2E8AA83C69@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=86658b0b18719c93fca359be65904ff366be9985
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

the generated subdirectory Makefiles are now fixed

now, the Pure Perl version is only useful when BR2_STATIC_LIBS

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/perl-netaddr-ip/perl-netaddr-ip.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/perl-netaddr-ip/perl-netaddr-ip.mk b/package/perl-netaddr-ip/perl-netaddr-ip.mk
index a1f02c6912..e96e42a852 100644
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

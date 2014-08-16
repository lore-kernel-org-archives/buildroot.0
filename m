From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 16 Aug 2014 09:27:44 +0200
Subject: [Buildroot] [git commit] perl-net-ssleay: fix build
Message-ID: <20140816072751.20AE29D44D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3cb705aa845c96e19f8b32e9994d5d319ce22930
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

the new option OPTIMIZE needs the same replacement.

see http://autobuild.buildroot.net/results/278f9d121273a16cedc009c0b8df0a8659d8fb73/

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/perl-net-ssleay/perl-net-ssleay.mk |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/package/perl-net-ssleay/perl-net-ssleay.mk b/package/perl-net-ssleay/perl-net-ssleay.mk
index 9e9b8a7..b17975c 100644
--- a/package/perl-net-ssleay/perl-net-ssleay.mk
+++ b/package/perl-net-ssleay/perl-net-ssleay.mk
@@ -15,10 +15,11 @@ PERL_NET_SSLEAY_LICENSE_FILES = LICENSE
 # suffers from: don't search for openssl, they pick the host-system one.
 PERL_NET_SSLEAY_CONF_ENV = OPENSSL_PREFIX=$(STAGING_DIR)/usr
 
-# Remove problematic single quotes in LDDLFLAGS & CCFLAGS definition
+# Remove problematic single quotes in LDDLFLAGS, CCFLAGS & OPTIMIZE definition
 define PERL_NET_SSLEAY_FIX_MAKEFILE
 	$(SED) "s/^LDDLFLAGS = '\(.*\)'/LDDLFLAGS = \1/" $(@D)/Makefile
 	$(SED) "s/^CCFLAGS = '\(.*\)'/CCFLAGS = \1/" $(@D)/Makefile
+	$(SED) "s/^OPTIMIZE = '\(.*\)'/OPTIMIZE = \1/" $(@D)/Makefile
 endef
 PERL_NET_SSLEAY_POST_CONFIGURE_HOOKS += PERL_NET_SSLEAY_FIX_MAKEFILE
 

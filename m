From: Francois Perrad <fperrad@gmail.com>
Date: Thu, 24 Jul 2014 20:15:56 +0200
Subject: [Buildroot] [PATCH] perl-net-ssleay: fix configure
Message-ID: <1406225756-29824-1-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

CCFLAGS needs the same replacement as LDDLFAGS

see http://autobuild.buildroot.net/results/299/299d6fa6b2ccf97987ffd9c99130c25dd55ca9b4/

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl-net-ssleay/perl-net-ssleay.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/perl-net-ssleay/perl-net-ssleay.mk b/package/perl-net-ssleay/perl-net-ssleay.mk
index 7234d1e..fb9b385 100644
--- a/package/perl-net-ssleay/perl-net-ssleay.mk
+++ b/package/perl-net-ssleay/perl-net-ssleay.mk
@@ -15,9 +15,10 @@ PERL_NET_SSLEAY_LICENSE_FILES = LICENSE
 # suffers from: don't search for openssl, they pick the host-system one.
 PERL_NET_SSLEAY_CONF_ENV = OPENSSL_PREFIX=$(STAGING_DIR)/usr
 
-# Remove problematic single quotes in LDDLFLAGS definition
+# Remove problematic single quotes in LDDLFLAGS & CCFLAGS definition
 define PERL_NET_SSLEAY_FIX_MAKEFILE
 	$(SED) "s/^LDDLFLAGS = '\(.*\)'/LDDLFLAGS = \1/" $(@D)/Makefile
+	$(SED) "s/^CCFLAGS = '\(.*\)'/CCFLAGS = \1/" $(@D)/Makefile
 endef
 PERL_NET_SSLEAY_POST_CONFIGURE_HOOKS += PERL_NET_SSLEAY_FIX_MAKEFILE
 
-- 
1.9.1

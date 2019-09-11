From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed, 11 Sep 2019 19:01:50 +0200
Subject: [Buildroot] [PATCH 1/1] package/perl-class-std-fast: fixup the 'v'
 prefix in the version
Message-ID: <20190911170150.26936-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In order for the perl-class-std-fast version to match what is given by
release-monitoring.org, the 'v' prefix should be encoded in
PERL_CLASS_STD_FAST_SOURCE and not PERL_CLASS_STD_FAST_VERSION.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/perl-class-std-fast/perl-class-std-fast.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/perl-class-std-fast/perl-class-std-fast.mk b/package/perl-class-std-fast/perl-class-std-fast.mk
index 57e57b1954..b5d32398a5 100644
--- a/package/perl-class-std-fast/perl-class-std-fast.mk
+++ b/package/perl-class-std-fast/perl-class-std-fast.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PERL_CLASS_STD_FAST_VERSION = v0.0.8
-PERL_CLASS_STD_FAST_SOURCE = Class-Std-Fast-$(PERL_CLASS_STD_FAST_VERSION).tar.gz
+PERL_CLASS_STD_FAST_VERSION = 0.0.8
+PERL_CLASS_STD_FAST_SOURCE = Class-Std-Fast-v$(PERL_CLASS_STD_FAST_VERSION).tar.gz
 PERL_CLASS_STD_FAST_SITE = $(BR2_CPAN_MIRROR)/authors/id/A/AC/ACID
 PERL_CLASS_STD_FAST_DEPENDENCIES = host-perl-module-build
 PERL_CLASS_STD_FAST_LICENSE = Artistic or GPL-1.0+
-- 
2.23.0.rc1

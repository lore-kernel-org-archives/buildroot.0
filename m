From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed, 17 Feb 2021 07:49:49 +0100
Subject: [Buildroot] [PATCH 1/1] package/perl-extutils-pkgconfig: set PATH
 to BR_PATH
Message-ID: <20210217064949.1787888-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Set PATH to BR_PATH to allow perl-extutils-pkgconfig to find pkg-config
binary

Fixes:
 - http://autobuild.buildroot.org/results/d87787fbf2a8cb9bbaa3b59d1e8004ad1459536a

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/perl-extutils-pkgconfig/perl-extutils-pkgconfig.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/perl-extutils-pkgconfig/perl-extutils-pkgconfig.mk b/package/perl-extutils-pkgconfig/perl-extutils-pkgconfig.mk
index ba85b36187..cb11e9f588 100644
--- a/package/perl-extutils-pkgconfig/perl-extutils-pkgconfig.mk
+++ b/package/perl-extutils-pkgconfig/perl-extutils-pkgconfig.mk
@@ -13,4 +13,6 @@ PERL_EXTUTILS_PKGCONFIG_DISTNAME = ExtUtils-PkgConfig
 
 HOST_PERL_EXTUTILS_PKGCONFIG_DEPENDENCIES = host-pkgconf
 
+HOST_PERL_EXTUTILS_PKGCONFIG_CONF_ENV = PATH=$(BR_PATH)
+
 $(eval $(host-perl-package))
-- 
2.30.0

From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 17 Feb 2021 17:25:26 +0100
Subject: [Buildroot] [git commit] package/perl-extutils-pkgconfig: set PATH
 to BR_PATH
Message-ID: <20210217160408.C00F184ABE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=91b39d039e5411748783e18dec312534066ed4b1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Set PATH to BR_PATH to allow perl-extutils-pkgconfig to find pkg-config
binary

Fixes:
 - http://autobuild.buildroot.org/results/d87787fbf2a8cb9bbaa3b59d1e8004ad1459536a

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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

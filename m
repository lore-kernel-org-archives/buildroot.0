From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue, 16 Feb 2021 21:30:15 +0100
Subject: [Buildroot] [git commit] package/perl-extutils-pkgconfig: new
 package
Message-ID: <20210216202627.D8810810CA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d48e5e82ac5889c8b81e8f4d333cf3c179f4d5b9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

host-perl-extutils-pkgconfig is needed by perl-gd to find gd in version
2.3.0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Acked-by: Francois Perrad <francois.perrad@gadz.org>
[Arnout:
 - remove Config.in - it's host-only
 - add DEVELOPERS entry
 - use HOST_PERL_EXTUTILS_PKGCONFIG_DEPENDENCIES]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 DEVELOPERS                                               |  1 +
 .../perl-extutils-pkgconfig/perl-extutils-pkgconfig.hash |  6 ++++++
 .../perl-extutils-pkgconfig/perl-extutils-pkgconfig.mk   | 16 ++++++++++++++++
 3 files changed, 23 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 7666493ddc..12e1f83cf7 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -875,6 +875,7 @@ F:	package/ncmpc/
 F:	package/oniguruma/
 F:	package/oprofile/
 F:	package/pcmanfm/
+F:	package/perl-extutils-pkgconfig/
 F:	package/python-backcall/
 F:	package/python-jedi/
 F:	package/python-parso/
diff --git a/package/perl-extutils-pkgconfig/perl-extutils-pkgconfig.hash b/package/perl-extutils-pkgconfig/perl-extutils-pkgconfig.hash
new file mode 100644
index 0000000000..7028b96be5
--- /dev/null
+++ b/package/perl-extutils-pkgconfig/perl-extutils-pkgconfig.hash
@@ -0,0 +1,6 @@
+# retrieved by scancpan from http://cpan.metacpan.org/
+md5  b86318f2b6ac6af3ee985299e1e38fe5  ExtUtils-PkgConfig-1.16.tar.gz
+sha256  bbeaced995d7d8d10cfc51a3a5a66da41ceb2bc04fedcab50e10e6300e801c6e  ExtUtils-PkgConfig-1.16.tar.gz
+
+# computed by scancpan
+sha256  1ca66d6d9d2e14426825889848f0b5b4d4e153afcd74b8f42a1f2937c3a9973d  README
diff --git a/package/perl-extutils-pkgconfig/perl-extutils-pkgconfig.mk b/package/perl-extutils-pkgconfig/perl-extutils-pkgconfig.mk
new file mode 100644
index 0000000000..ba85b36187
--- /dev/null
+++ b/package/perl-extutils-pkgconfig/perl-extutils-pkgconfig.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# perl-extutils-pkgconfig
+#
+################################################################################
+
+PERL_EXTUTILS_PKGCONFIG_VERSION = 1.16
+PERL_EXTUTILS_PKGCONFIG_SOURCE = ExtUtils-PkgConfig-$(PERL_EXTUTILS_PKGCONFIG_VERSION).tar.gz
+PERL_EXTUTILS_PKGCONFIG_SITE = $(BR2_CPAN_MIRROR)/authors/id/X/XA/XAOC
+PERL_EXTUTILS_PKGCONFIG_LICENSE = LGPL-2.1
+PERL_EXTUTILS_PKGCONFIG_LICENSE_FILES = README
+PERL_EXTUTILS_PKGCONFIG_DISTNAME = ExtUtils-PkgConfig
+
+HOST_PERL_EXTUTILS_PKGCONFIG_DEPENDENCIES = host-pkgconf
+
+$(eval $(host-perl-package))

From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 4 Feb 2014 11:24:04 +0100
Subject: [Buildroot] [git commit] gnupg: depend on libiconv if appropriate
Message-ID: <20140204102557.754E69C73B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1e7602327a318540cb92efd14b8cb092a4ab19bd
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

If iconv is built before gnupg, this package will link against it; if it is
built after this package, it will not be linked against it.  To make the
build reproducible, make sure that iconv is always built before this
package.

Signed-off-by: Bernd Kuhls <berndkuhls@hotmail.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gnupg/gnupg.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/gnupg/gnupg.mk b/package/gnupg/gnupg.mk
index 39a37d0..c334ac6 100644
--- a/package/gnupg/gnupg.mk
+++ b/package/gnupg/gnupg.mk
@@ -9,7 +9,7 @@ GNUPG_SOURCE = gnupg-$(GNUPG_VERSION).tar.bz2
 GNUPG_SITE = ftp://ftp.gnupg.org/gcrypt/gnupg
 GNUPG_LICENSE = GPLv3+
 GNUPG_LICENSE_FILES = COPYING
-GNUPG_DEPENDENCIES = zlib ncurses
+GNUPG_DEPENDENCIES = zlib ncurses $(if $(BR2_PACKAGE_LIBICONV),libiconv)
 GNUPG_CONF_ENV = ac_cv_sys_symbol_underscore=no
 GNUPG_CONF_OPT = --disable-rpath --enable-minimal --disable-regex
 

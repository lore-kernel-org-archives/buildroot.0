From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 16 Oct 2012 22:34:37 +0200
Subject: [Buildroot] [git commit] gnupg: don't prefix assembly level
	functions with underscore
Message-ID: <20121016203752.3EC929988E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=525cd9eed18c55ffae18467bcdf69d44a3673310
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes http://autobuild.buildroot.net/results/45a0856bafa9f2f7e86e2c063528c2b5b04c08d6

gnupg's configure script defaults to prepending an underscore ('_') to
the assembly level functions, which isn't correct for Linux and causes
linker errors for the archs where it has asm optimizations.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/gnupg/gnupg.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/gnupg/gnupg.mk b/package/gnupg/gnupg.mk
index 4b5c0a1..e63c33c 100644
--- a/package/gnupg/gnupg.mk
+++ b/package/gnupg/gnupg.mk
@@ -10,6 +10,7 @@ GNUPG_SITE = ftp://ftp.gnupg.org/gcrypt/gnupg
 GNUPG_LICENSE = GPLv3+
 GNUPG_LICENSE_FILES = COPYING
 GNUPG_DEPENDENCIES = zlib ncurses
+GNUPG_CONF_ENV = ac_cv_sys_symbol_underscore=no
 GNUPG_CONF_OPT = --disable-rpath --enable-minimal --disable-regex
 
 ifeq ($(BR2_PACKAGE_BZIP2),y)

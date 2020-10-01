From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 1 Oct 2020 21:20:24 +0200
Subject: [Buildroot] [git commit] package/elfutils: needs host-pkgconf
Message-ID: <20201001191017.A397B8E776@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d1ba0a73de61596d5eb3aaa4b6998747cb898f82
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

host-pkgconf is a mandatory dependency since version 0.180 and
https://sourceware.org/git/?p=elfutils.git;a=commit;h=f7f0cdc59a13780938ae3f578955737a75e60ea9

Fixes:
 - http://autobuild.buildroot.org/results/123bdb3e7244800e1717f968c1d371e51f7fff2b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/elfutils/elfutils.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/elfutils/elfutils.mk b/package/elfutils/elfutils.mk
index 28f86c2fab..3d37c4634b 100644
--- a/package/elfutils/elfutils.mk
+++ b/package/elfutils/elfutils.mk
@@ -10,8 +10,8 @@ ELFUTILS_SITE = https://sourceware.org/elfutils/ftp/$(ELFUTILS_VERSION)
 ELFUTILS_INSTALL_STAGING = YES
 ELFUTILS_LICENSE = GPL-2.0+ or LGPL-3.0+ (library)
 ELFUTILS_LICENSE_FILES = COPYING COPYING-GPLV2 COPYING-LGPLV3
-ELFUTILS_DEPENDENCIES = zlib $(TARGET_NLS_DEPENDENCIES)
-HOST_ELFUTILS_DEPENDENCIES = host-zlib host-bzip2 host-xz
+ELFUTILS_DEPENDENCIES = host-pkgconf zlib $(TARGET_NLS_DEPENDENCIES)
+HOST_ELFUTILS_DEPENDENCIES = host-pkgconf host-zlib host-bzip2 host-xz
 
 # We patch configure.ac
 ELFUTILS_AUTORECONF = YES

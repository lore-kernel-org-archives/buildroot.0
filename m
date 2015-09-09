From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Wed, 9 Sep 2015 15:53:49 +0100
Subject: [Buildroot] [PATCH] binutils: remove unnecessary host-texinfo
	dependency
Message-ID: <1441810429-57871-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

host-texinfo dependency was only necessary when building the git version
of binutils, however, this upstream commit allows binutils to build
without makeinfo (a binary provided by host-texinfo)...

https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;a=commit;h=bba33ab1e0f7d2ebd8f8435f92ed12e2a3c558a4

...so we can safely remove the host-texinfo dependency.

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/binutils/binutils.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
index 535c019..2074fae 100644
--- a/package/binutils/binutils.mk
+++ b/package/binutils/binutils.mk
@@ -30,8 +30,8 @@ BINUTILS_LICENSE = GPLv3+, libiberty LGPLv2.1+
 BINUTILS_LICENSE_FILES = COPYING3 COPYING.LIB
 
 ifeq ($(BINUTILS_FROM_GIT),y)
-BINUTILS_DEPENDENCIES += host-texinfo host-flex host-bison
-HOST_BINUTILS_DEPENDENCIES += host-texinfo host-flex host-bison
+BINUTILS_DEPENDENCIES += host-flex host-bison
+HOST_BINUTILS_DEPENDENCIES += host-flex host-bison
 endif
 
 # When binutils sources are fetched from the binutils-gdb repository,
-- 
1.7.1

From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 20 Sep 2015 14:57:02 +0200
Subject: [Buildroot] [git commit] binutils: remove unnecessary host-texinfo
	dependency
Message-ID: <20150920125827.7B3AD80835@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f3e99991591c6356df8d55a794ed64fd20154654
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

host-texinfo dependency was only necessary when building the git version
of binutils, however, this upstream commit allows binutils to build
without makeinfo (a binary provided by host-texinfo)...

https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;a=commit;h=bba33ab1e0f7d2ebd8f8435f92ed12e2a3c558a4

...so we can safely remove the host-texinfo dependency.

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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

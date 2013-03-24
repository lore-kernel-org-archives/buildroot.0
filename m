From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 24 Mar 2013 13:43:08 +0100
Subject: [Buildroot] [git commit] gmp: requires host-m4
Message-ID: <20130324130051.17A1D9B258@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6593ff6a87194c2d6bb6767d29648f9fc669df14
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

On a system where m4 is not installed, gmp does not build due to the
lack of m4. Add the missing host-m4 dependency.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/gmp/gmp.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/gmp/gmp.mk b/package/gmp/gmp.mk
index 093d60c..24fbb3d 100644
--- a/package/gmp/gmp.mk
+++ b/package/gmp/gmp.mk
@@ -11,6 +11,8 @@ GMP_INSTALL_STAGING = YES
 GMP_LICENSE = LGPLv3+
 GMP_LICENSE_FILES = COPYING.LIB
 
+GMP_DEPENDENCIES = host-m4
+
 # Bad ARM assembly breaks on pure thumb
 ifeq ($(ARCH),arm)
 GMP_MAKE_OPT += CFLAGS="$(TARGET_CFLAGS) -marm"

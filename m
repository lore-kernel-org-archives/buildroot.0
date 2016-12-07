From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 7 Dec 2016 23:41:00 +0100
Subject: [Buildroot] [git commit] efivar: fix comment after uClibc
	compatibility patch
Message-ID: <20161207224648.A2A3F8183C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3eb51f16d2d24abeda8d27d3f1458afdb48db6d8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

uClibc support was recently added to efivar through a small
compatibility patch.
This commit updates a comment in the efivar recipe to reflect this, as
we no longer have glibc as the only supported C library.

Signed-off-by: Erico Nunes <nunes.erico@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/efivar/efivar.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/efivar/efivar.mk b/package/efivar/efivar.mk
index 913322e..84735b8 100644
--- a/package/efivar/efivar.mk
+++ b/package/efivar/efivar.mk
@@ -12,8 +12,8 @@ EFIVAR_DEPENDENCIES = popt
 EFIVAR_INSTALL_STAGING = YES
 
 # BINTARGETS is set to skip efivar-static which requires static popt,
-# and since we depend on glibc, we will never be built in a
-# static-only environment.
+# and since we depend on dynamic libraries, efivar will never be built
+# in a static-only environment.
 # -fPIC is needed at least on MIPS, otherwise fails to build shared
 # -library.
 EFIVAR_MAKE_OPTS = \

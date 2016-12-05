From: Erico Nunes <nunes.erico@gmail.com>
Date: Tue,  6 Dec 2016 00:07:15 +0100
Subject: [Buildroot] [PATCH 1/3] efivar: fix comment after uClibc
	compatibility patch
Message-ID: <1480979238-18273-1-git-send-email-nunes.erico@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

uClibc support was recently added to efivar through a small
compatibility patch.
This commit updates a comment in the efivar recipe to reflect this, as
we no longer have glibc as the only supported C library.

Signed-off-by: Erico Nunes <nunes.erico@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
-- 
2.7.4

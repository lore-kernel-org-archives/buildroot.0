From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 20 Feb 2016 23:46:07 +0100
Subject: [Buildroot] [git commit] package/libsoil: add a comment about why
	we rename the Makefile
Message-ID: <20160220224637.13BD180262@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9f8c65bb6b6be0197cd39c3f3573064d5881b5bc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 8461906d (package/libsoil: fix build using old versions of patch)
added a workaround for older patch versions, but didn't add any comment in
the .mk file explaining why this is done.

Add a comment explaining why for clarity.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libsoil/libsoil.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/libsoil/libsoil.mk b/package/libsoil/libsoil.mk
index 99a47f6..efa67d9 100644
--- a/package/libsoil/libsoil.mk
+++ b/package/libsoil/libsoil.mk
@@ -18,6 +18,10 @@ define LIBSOIL_EXTRACT_CMDS
 	mv $(@D)/Simple\ OpenGL\ Image\ Library/* $(@D)
 endef
 
+# gnu patch < v2.5.9 doesn't correctly handle spaces in file names,
+# and we want to patch the 'alternate Makefile.txt' file, so rename
+# the file (and patch the renamed file) for compatibility with older
+# distributions
 define REMOVE_SPACE_FROM_FILENAME
 	cd $(@D)/projects/makefile/ && \
 		mv "alternate Makefile.txt" alternate_Makefile.txt

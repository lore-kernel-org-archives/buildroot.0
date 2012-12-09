From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 9 Dec 2012 21:28:02 +0100
Subject: [Buildroot] [git commit] libroxml: don't build docs
Message-ID: <20121209203933.8568A9A158@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=59795cc98067fe2730e50dd3687fd94b6b36a843
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Don't build docs to avoid failures such as
http://autobuild.buildroot.net/results/3f1971472fe35a516b0f26ced477d33cb18280c9/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libroxml/libroxml.mk |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/package/libroxml/libroxml.mk b/package/libroxml/libroxml.mk
index d7ef6a4..6e690aa 100644
--- a/package/libroxml/libroxml.mk
+++ b/package/libroxml/libroxml.mk
@@ -30,4 +30,10 @@ define LIBROXML_CLEAN_CMDS
 	-$(MAKE) -C $(@D) clean
 endef
 
+define LIBROXML_DISABLE_DOXYGEN
+	$(SED) 's:) doxy:):' $(@D)/Makefile
+endef
+
+LIBROXML_POST_PATCH_HOOKS += LIBROXML_DISABLE_DOXYGEN
+
 $(eval $(generic-package))

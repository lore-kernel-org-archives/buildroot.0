From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 29 Jul 2011 09:52:59 +0200
Subject: [Buildroot] [git commit] libroxml: drop -Werror from CFLAGS
Message-ID: <20110729075358.AC7608B4F3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=8d657be342788bf5dd7d9690061787580b571f6f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libroxml/libroxml-2.1.0-werror.patch |   22 ++++++++++++++++++++++
 1 files changed, 22 insertions(+), 0 deletions(-)
 create mode 100644 package/libroxml/libroxml-2.1.0-werror.patch

diff --git a/package/libroxml/libroxml-2.1.0-werror.patch b/package/libroxml/libroxml-2.1.0-werror.patch
new file mode 100644
index 0000000..a72f2a7
--- /dev/null
+++ b/package/libroxml/libroxml-2.1.0-werror.patch
@@ -0,0 +1,22 @@
+[PATCH] remove -Werror from CFLAGS
+
+-Werror should only be used during development, not in released SW.
+
+Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
+---
+ Makefile |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+Index: libroxml-2.1.0/Makefile
+===================================================================
+--- libroxml-2.1.0.orig/Makefile
++++ libroxml-2.1.0/Makefile
+@@ -41,7 +41,7 @@
+ 
+ # options
+ override CPPFLAGS += -Iinc/
+-override CFLAGS += $(OPTIM) -fPIC -Wall -Wextra -Wno-unused -Werror -Iinc/ $(DEFINES)
++override CFLAGS += $(OPTIM) -fPIC -Wall -Wextra -Wno-unused -Iinc/ $(DEFINES)
+ override LDFLAGS += 
+ 
+ ifeq ("$(OS)", "Darwin")
-- 
1.7.3.4

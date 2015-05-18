From: Romain Naour <romain.naour@openwide.fr>
Date: Tue, 19 May 2015 00:37:40 +0200
Subject: [Buildroot] [PATCH] package/harfbuzz: fix static linking for
	test-unicode program
Message-ID: <1431988660-3991-1-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

During static build, -lstdc++ is required to link
against libicuuc.a.

Fixes:
http://autobuild.buildroot.net/results/210/2107f9dfb39eeb6559fb4271c7af8b39aef521ca/

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
 ...1-test-unicode-add-lstdc-for-static-build.patch | 29 ++++++++++++++++++++++
 1 file changed, 29 insertions(+)
 create mode 100644 package/harfbuzz/0001-test-unicode-add-lstdc-for-static-build.patch

diff --git a/package/harfbuzz/0001-test-unicode-add-lstdc-for-static-build.patch b/package/harfbuzz/0001-test-unicode-add-lstdc-for-static-build.patch
new file mode 100644
index 0000000..729c699
--- /dev/null
+++ b/package/harfbuzz/0001-test-unicode-add-lstdc-for-static-build.patch
@@ -0,0 +1,29 @@
+From deb928ead50196792ce662db73886227ea8b9e5a Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@openwide.fr>
+Date: Mon, 18 May 2015 23:10:39 +0200
+Subject: [PATCH] test-unicode: add -lstdc++ for static build
+
+During static build -lstdc++ is required to link
+against libicuuc.a.
+
+Signed-off-by: Romain Naour <romain.naour@openwide.fr>
+---
+ test/api/Makefile.am | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/test/api/Makefile.am b/test/api/Makefile.am
+index 4ff14fa..8f30b22 100644
+--- a/test/api/Makefile.am
++++ b/test/api/Makefile.am
+@@ -34,7 +34,7 @@ test_unicode_CPPFLAGS += $(GLIB_CFLAGS)
+ endif
+ if HAVE_ICU
+ test_unicode_CPPFLAGS += $(ICU_CFLAGS)
+-test_unicode_LDADD += $(top_builddir)/src/libharfbuzz-icu.la
++test_unicode_LDADD += $(top_builddir)/src/libharfbuzz-icu.la -lstdc++
+ endif
+ 
+ 
+-- 
+1.9.3
+
-- 
1.9.3

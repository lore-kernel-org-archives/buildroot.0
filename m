From: Hollis Blanchard <hollis_blanchard@mentor.com>
Date: Mon, 30 Jul 2018 15:02:17 -0700
Subject: [Buildroot] [PATCH v2 2/3] host-attr: build fix for GCC <4.5
In-Reply-To: <20180730220218.26454-1-hollis_blanchard@mentor.com>
References: <20180730220218.26454-1-hollis_blanchard@mentor.com>
Message-ID: <20180730220218.26454-2-hollis_blanchard@mentor.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Hollis Blanchard <hollis_blanchard@mentor.com>
---
 package/attr/0001-build-with-older-GCCs.patch | 87 +++++++++++++++++++++++++++
 1 file changed, 87 insertions(+)
 create mode 100644 package/attr/0001-build-with-older-GCCs.patch

diff --git a/package/attr/0001-build-with-older-GCCs.patch b/package/attr/0001-build-with-older-GCCs.patch
new file mode 100644
index 0000000000..2aa41107f9
--- /dev/null
+++ b/package/attr/0001-build-with-older-GCCs.patch
@@ -0,0 +1,87 @@
+From 3ac428794ea0f95c854166c9c0cffb0267c5e98b Mon Sep 17 00:00:00 2001
+From: Hollis Blanchard <hollis_blanchard@mentor.com>
+Date: Mon, 30 Jul 2018 14:17:21 -0700
+Subject: [PATCH] build with older GCCs
+
+GCC versions up through 4.4.7 (which is used in RHEL 6) do not accept any
+argument for the deprecated attribute. GCC 4.5 and later say the "msg"
+argument is optional. We don't need the messages during Buildroot builds
+anyways.
+
+Signed-off-by: Hollis Blanchard <hollis_blanchard@mentor.com>
+---
+ include/attributes.h | 20 ++++++++++----------
+ 1 file changed, 10 insertions(+), 10 deletions(-)
+
+diff --git a/include/attributes.h b/include/attributes.h
+index 14beb8f..23c39c8 100644
+--- a/include/attributes.h
++++ b/include/attributes.h
+@@ -127,10 +127,10 @@ typedef struct attr_multiop {
+  */
+ EXPORT int attr_get (const char *__path, const char *__attrname,
+ 			char *__attrvalue, int *__valuelength, int __flags)
+-	__attribute__ ((deprecated ("Use getxattr or lgetxattr instead")));
++	__attribute__ ((deprecated));
+ EXPORT int attr_getf (int __fd, const char *__attrname, char *__attrvalue,
+ 			int *__valuelength, int __flags)
+-	__attribute__ ((deprecated ("Use fgetxattr instead")));
++	__attribute__ ((deprecated));
+ 
+ /*
+  * Set the value of an attribute, creating the attribute if necessary.
+@@ -139,11 +139,11 @@ EXPORT int attr_getf (int __fd, const char *__attrname, char *__attrvalue,
+ EXPORT int attr_set (const char *__path, const char *__attrname,
+ 			const char *__attrvalue, const int __valuelength,
+ 			int __flags)
+-	__attribute__ ((deprecated ("Use setxattr or lsetxattr instead")));
++	__attribute__ ((deprecated));
+ EXPORT int attr_setf (int __fd, const char *__attrname,
+ 			const char *__attrvalue, const int __valuelength,
+ 			int __flags)
+-	__attribute__ ((deprecated ("Use fsetxattr instead")));
++	__attribute__ ((deprecated));
+ 
+ /*
+  * Remove an attribute.
+@@ -151,9 +151,9 @@ EXPORT int attr_setf (int __fd, const char *__attrname,
+  */
+ EXPORT int attr_remove (const char *__path, const char *__attrname,
+ 			int __flags)
+-	__attribute__ ((deprecated ("Use removexattr or lremovexattr instead")));
++	__attribute__ ((deprecated));
+ EXPORT int attr_removef (int __fd, const char *__attrname, int __flags)
+-	__attribute__ ((deprecated ("Use fremovexattr instead")));
++	__attribute__ ((deprecated));
+ 
+ /*
+  * List the names and sizes of the values of all the attributes of an object.
+@@ -164,10 +164,10 @@ EXPORT int attr_removef (int __fd, const char *__attrname, int __flags)
+  */
+ EXPORT int attr_list(const char *__path, char *__buffer, const int __buffersize,
+ 		int __flags, attrlist_cursor_t *__cursor)
+-	__attribute__ ((deprecated ("Use listxattr or llistxattr instead")));
++	__attribute__ ((deprecated));
+ EXPORT int attr_listf(int __fd, char *__buffer, const int __buffersize,
+ 		int __flags, attrlist_cursor_t *__cursor)
+-	__attribute__ ((deprecated ("Use flistxattr instead")));
++	__attribute__ ((deprecated));
+ 
+ /*
+  * Operate on multiple attributes of the same object simultaneously.
+@@ -188,10 +188,10 @@ EXPORT int attr_listf(int __fd, char *__buffer, const int __buffersize,
+  */
+ EXPORT int attr_multi (const char *__path, attr_multiop_t *__oplist,
+ 			int __count, int __flags)
+-	__attribute__ ((deprecated ("Use getxattr, setxattr, listxattr, removexattr instead")));
++	__attribute__ ((deprecated));
+ EXPORT int attr_multif (int __fd, attr_multiop_t *__oplist,
+ 			int __count, int __flags)
+-	__attribute__ ((deprecated ("Use getxattr, setxattr, listxattr, removexattr instead")));
++	__attribute__ ((deprecated));
+ 
+ #ifdef __cplusplus
+ }
+-- 
+2.13.0
+
-- 
2.13.0

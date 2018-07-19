From: Hollis Blanchard <hollis_blanchard@mentor.com>
Date: Thu, 19 Jul 2018 10:20:43 -0700
Subject: [Buildroot] [PATCH 2 of 3] host-attr: build fix for RHEL6 hosts
 (GCC 4.4.7)
In-Reply-To: <05bbe42a7a77f46daa8a.1532020842@cveaol6qa08.wv.mentorg.com>
References: <05bbe42a7a77f46daa8a.1532020842@cveaol6qa08.wv.mentorg.com>
Message-ID: <bc5f01fff2efadabe557.1532020843@cveaol6qa08.wv.mentorg.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Hollis Blanchard <hollis_blanchard@mentor.com>

diff --git a/package/attr/0001-deprecated-attribute-message.patch b/package/attr/0001-deprecated-attribute-message.patch
new file mode 100644
--- /dev/null
+++ b/package/attr/0001-deprecated-attribute-message.patch
@@ -0,0 +1,76 @@
+build with older GCCs
+
+GCC versions up through 4.4.7 (which is used in RHEL 6) do not accept any
+argument for the deprecated attribute. GCC 4.5 and later say the "msg"
+argument is optional. We don't need the messages during Buildroot builds
+anyways.
+
+Signed-off-by: Hollis Blanchard <hollis_blanchard@mentor.com>
+
+--- host-attr-2.4.48/include/attributes.h.orig	2018-07-19 08:49:19.506854736 -0700
++++ host-attr-2.4.48/include/attributes.h	2018-07-19 08:49:22.132854736 -0700
+@@ -127,10 +127,10 @@
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
+@@ -139,11 +139,11 @@
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
+@@ -151,9 +151,9 @@
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
+@@ -164,10 +164,10 @@
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
+@@ -188,10 +188,10 @@
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

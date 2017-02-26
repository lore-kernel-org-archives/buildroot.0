From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Feb 2017 21:04:21 +0100
Subject: [Buildroot] [git commit] classpath: add patch to fix or1k compile
	error
Message-ID: <20170226200440.A48A481EB9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f12a146f817c8ef07a7d41a31a5336b5ef6a96e8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
  http://autobuild.buildroot.net/results/a0bb5535fd197b9dd1607a5f0bca477c9575c99f

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/classpath/0003-add-or1k-endian.patch | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/package/classpath/0003-add-or1k-endian.patch b/package/classpath/0003-add-or1k-endian.patch
new file mode 100644
index 0000000..8bc8784
--- /dev/null
+++ b/package/classpath/0003-add-or1k-endian.patch
@@ -0,0 +1,18 @@
+Set endianess for or1k
+
+Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
+
+diff -Nur classpath-0.98.orig/native/fdlibm/ieeefp.h classpath-0.98/native/fdlibm/ieeefp.h
+--- classpath-0.98.orig/native/fdlibm/ieeefp.h	2008-01-13 18:33:50.000000000 +0100
++++ classpath-0.98/native/fdlibm/ieeefp.h	2017-02-26 12:39:12.316327363 +0100
+@@ -123,6 +123,10 @@
+ #define __IEEE_BIG_ENDIAN
+ #endif
+ 
++#ifdef __or1k__
++#define __IEEE_BIG_ENDIAN
++#endif
++
+ #ifdef __v800
+ #define __IEEE_LITTLE_ENDIAN
+ #endif

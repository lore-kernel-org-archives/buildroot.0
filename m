From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 12 May 2014 21:36:29 +0200
Subject: [Buildroot] [PATCH] libcec: fix build issue on AVR32
Message-ID: <1399923389-4496-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:

  http://autobuild.buildroot.org/results/89d/89d8165b455cd7131e4c0729cec50dad8980ceb1/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libcec/libcec-0002-no-psabi-warning.patch | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 package/libcec/libcec-0002-no-psabi-warning.patch

diff --git a/package/libcec/libcec-0002-no-psabi-warning.patch b/package/libcec/libcec-0002-no-psabi-warning.patch
new file mode 100644
index 0000000..bd6557e
--- /dev/null
+++ b/package/libcec/libcec-0002-no-psabi-warning.patch
@@ -0,0 +1,22 @@
+Do not use -Wno-psabi warning, not available on old g++
+
+AVR32 uses a very old g++ version, which does not implement the
+-Wno-psabi warning flag. This patch simply removes this warning flag
+from the libcec build. It can be dropped if only gcc 4.5+ versions are
+supported in Buildroot.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+Index: b/configure.ac
+===================================================================
+--- a/configure.ac
++++ b/configure.ac
+@@ -130,7 +130,7 @@
+ use_udev="no"
+ use_adapter_detection="yes"
+ use_lockdev="no"
+-SUPPRESS_MANGLING_WARNINGS=" -Wno-psabi"
++SUPPRESS_MANGLING_WARNINGS=""
+ case "${host}" in
+   *-*-linux*)
+     ## search for udev if pkg-config was found
-- 
1.9.2

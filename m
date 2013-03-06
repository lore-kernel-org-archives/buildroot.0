From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 6 Mar 2013 21:09:31 +0100
Subject: [Buildroot] [git commit] json-c: Add json_object_iterator.h to
	installed headers
Message-ID: <20130306205128.047B59AEFC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b9bb2c64cde21018f298b59c9a63a442286bf569
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

json_object_iterator.h is not installed in staging directory.
This leads to an error during pulseaudio build process:

fatal error: json_object_iterator.h: No such file or directory

Fixes autobuild failures like:
http://autobuild.buildroot.org/results/079f9265cd768f88ad57f6f7b794641c845f3079

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
Tested-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 ...n-c-add-missing-file-to-installed-headers.patch |   43 ++++++++++++++++++++
 1 files changed, 43 insertions(+), 0 deletions(-)

diff --git a/package/json-c/json-c-add-missing-file-to-installed-headers.patch b/package/json-c/json-c-add-missing-file-to-installed-headers.patch
new file mode 100644
index 0000000..12ef855
--- /dev/null
+++ b/package/json-c/json-c-add-missing-file-to-installed-headers.patch
@@ -0,0 +1,43 @@
+From 2ab6524ca0cfaab7feb42f7c328db8fca7b111fc Mon Sep 17 00:00:00 2001
+From: Gilles Talis <gilles.talis@gmail.com>
+Date: Tue, 5 Mar 2013 21:59:11 -0800
+Subject: [PATCH] Add json_object_iterator.h to installed headers
+
+Backported from: 4154c55edae6f6b34d6ef4fcc331055fdf8e1a23
+
+In addition to original patch, applied the same change to Makefile.in
+to avoid having the package to be autoreconfigured.
+
+Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
+---
+ Makefile.am |    1 +
+ Makefile.in |    1 +
+ 2 files changed, 2 insertions(+)
+
+diff --git a/Makefile.am b/Makefile.am
+index d4a7bbb..8f09ca8 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -17,6 +17,7 @@ libjsoninclude_HEADERS = \
+ 	json_config.h \
+ 	json_inttypes.h \
+ 	json_object.h \
++	json_object_iterator.h \
+ 	json_object_private.h \
+ 	json_tokener.h \
+ 	json_util.h \
+diff --git a/Makefile.in b/Makefile.in
+index c06db3e..9d924cd 100644
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -278,6 +278,7 @@ libjsoninclude_HEADERS = \
+ 	json_config.h \
+ 	json_inttypes.h \
+ 	json_object.h \
++	json_object_iterator.h \
+ 	json_object_private.h \
+ 	json_tokener.h \
+ 	json_util.h \
+-- 
+1.7.10.4
+

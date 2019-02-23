From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 23 Feb 2019 14:39:20 +0100
Subject: [Buildroot] [git commit] package/czmq: bump to version 4.2.0
Message-ID: <20190305095736.5660F8E504@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d76942949dcc7c8c9fc2fdbb3b4ace9ba161e137
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Modified patch to fit the new version.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/czmq/0001-configure.ac-remove-Werror.patch | 24 ++++++++++++----------
 package/czmq/czmq.hash                             |  6 +++---
 package/czmq/czmq.mk                               |  2 +-
 3 files changed, 17 insertions(+), 15 deletions(-)

diff --git a/package/czmq/0001-configure.ac-remove-Werror.patch b/package/czmq/0001-configure.ac-remove-Werror.patch
index 7f2dae2c2b..2a9454d95e 100644
--- a/package/czmq/0001-configure.ac-remove-Werror.patch
+++ b/package/czmq/0001-configure.ac-remove-Werror.patch
@@ -8,23 +8,25 @@ newer versions of the compiler or the C library, when new warnings
 are introduced.
 
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+[Asaf: Modified for version 4.2.0]
+Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
 ---
  configure.ac | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index e92970a..2fd551a 100755
+index 6868a99b..9a941545 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -344,7 +344,7 @@ AC_C_BIGENDIAN
- 
- # These options are GNU compiler specific.
- if test "x$GCC" = "xyes"; then
--    CPPFLAGS="-pedantic -Werror -Wall -Wc++-compat ${CPPFLAGS}"
-+    CPPFLAGS="-pedantic -Wall -Wc++-compat ${CPPFLAGS}"
- fi
- 
- AM_CONDITIONAL(ENABLE_SHARED, test "x$enable_shared" = "xyes")
+@@ -952,7 +952,7 @@ AS_IF([test "x$enable_Werror" = "xyes" || test "x$enable_Werror" = "xauto"],
+         ])])
+      AS_IF([test -n "$CPP"],[AS_IF([$CPP --version 2>&1 | grep 'Free Software Foundation' > /dev/null && test "x$GCC" = "xyes"],
+         [AC_MSG_NOTICE([Enabling pedantic errors for GNU CPP preprocessor])
+-         CPPFLAGS="$CPPFLAGS -pedantic -Werror -Wall -Wc++-compat"
++         CPPFLAGS="$CPPFLAGS -pedantic -Wall -Wc++-compat"
+         ],
+         [AC_MSG_NOTICE([Not enabling pedantic errors: preprocessor not supported by this recipe (not GNU CPP)])
+          AS_IF([test "x$enable_Werror" = "xyes"], [AC_MSG_ERROR([--enable-Werror=yes was requested and can not be satisfied for CPP: $CPP])])
 -- 
-2.7.4
+2.19.1
 
diff --git a/package/czmq/czmq.hash b/package/czmq/czmq.hash
index c42525c78d..97b6e03b54 100644
--- a/package/czmq/czmq.hash
+++ b/package/czmq/czmq.hash
@@ -1,6 +1,6 @@
 # From https://github.com/zeromq/czmq/releases
-md5 6d3a6fdd25c2bb29897c53670dce97bf czmq-4.1.1.tar.gz
-sha1 629d34e8b5c1f2dd88689350f71f9917a8d76f23 czmq-4.1.1.tar.gz
+md5 7e09997db6ac3b25e8ed104053040722 czmq-4.2.0.tar.gz
+sha1 42165b3eede517708814e5a1b6972d8bde417f7a czmq-4.2.0.tar.gz
 # Locally calculated
-sha256 f00ff419881dc2a05d0686c8467cd89b4882677fc56f31c0e2cc81c134cbb0c0 czmq-4.1.1.tar.gz
+sha256 cfab29c2b3cc8a845749758a51e1dd5f5160c1ef57e2a41ea96e4c2dcc8feceb czmq-4.2.0.tar.gz
 sha256 1f256ecad192880510e84ad60474eab7589218784b9a50bc7ceee34c2b91f1d5 LICENCE
diff --git a/package/czmq/czmq.mk b/package/czmq/czmq.mk
index 6eb9314200..56dc65f8bc 100644
--- a/package/czmq/czmq.mk
+++ b/package/czmq/czmq.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CZMQ_VERSION = 4.1.1
+CZMQ_VERSION = 4.2.0
 CZMQ_SITE = https://github.com/zeromq/czmq/releases/download/v$(CZMQ_VERSION)
 
 # 0001-configure.ac-remove-Werror.patch touches configure.ac

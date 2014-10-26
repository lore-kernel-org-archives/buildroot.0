From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Oct 2014 12:33:54 +0100
Subject: [Buildroot] [git commit] liblog4c-localtime: update patches that
	have been submitted upstream
Message-ID: <20141026113359.B6BC0AFE0C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=525a94acc35eb8ce54742c7351ffc40a51cf60a2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...x-underquoted-definition-of-AM_PATH_LOG4C.patch |    2 ++
 .../0002-Fix-linking-error-without-pthread.patch   |    2 ++
 .../0003-Fix-debug-mode-build-with-uClibc.patch    |    2 ++
 ...4-Add-AC_CONFIG_MACRO_DIR-to-configure.in.patch |    2 ++
 .../liblog4c-localtime/0005-Fix-C-support.patch    |    2 ++
 5 files changed, 10 insertions(+), 0 deletions(-)

diff --git a/package/liblog4c-localtime/0001-log4c.m4-fix-underquoted-definition-of-AM_PATH_LOG4C.patch b/package/liblog4c-localtime/0001-log4c.m4-fix-underquoted-definition-of-AM_PATH_LOG4C.patch
index 57859bf..1fe0798 100644
--- a/package/liblog4c-localtime/0001-log4c.m4-fix-underquoted-definition-of-AM_PATH_LOG4C.patch
+++ b/package/liblog4c-localtime/0001-log4c.m4-fix-underquoted-definition-of-AM_PATH_LOG4C.patch
@@ -8,6 +8,8 @@ When autoreconfiguring liblog4c-localtime, there is a warning from
 autoconf caused by an underquoted definition of AM_PATH_LOG4C. This
 patch fixes this warning.
 
+Submitted upstream: https://github.com/rcmadruga/log4c-localtime/pull/1
+
 Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 ---
diff --git a/package/liblog4c-localtime/0002-Fix-linking-error-without-pthread.patch b/package/liblog4c-localtime/0002-Fix-linking-error-without-pthread.patch
index 3a4ef58..5b679e3 100644
--- a/package/liblog4c-localtime/0002-Fix-linking-error-without-pthread.patch
+++ b/package/liblog4c-localtime/0002-Fix-linking-error-without-pthread.patch
@@ -8,6 +8,8 @@ available, but a call to these functions from log4c_fini() was outside
 the #if WITH_ROLLINGFILE conditional, causing linker errors when the
 library is used.
 
+Submitted upstream: https://github.com/rcmadruga/log4c-localtime/pull/1
+
 Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 ---
diff --git a/package/liblog4c-localtime/0003-Fix-debug-mode-build-with-uClibc.patch b/package/liblog4c-localtime/0003-Fix-debug-mode-build-with-uClibc.patch
index 812af9e..4b9a45d 100644
--- a/package/liblog4c-localtime/0003-Fix-debug-mode-build-with-uClibc.patch
+++ b/package/liblog4c-localtime/0003-Fix-debug-mode-build-with-uClibc.patch
@@ -12,6 +12,8 @@ mcheck.h.
 To better support this situation, we add an AC_CHECK_HEADERS() check
 on mcheck.h, and then use HAVE_MCHECK_H were appropriate.
 
+Submitted upstream: https://github.com/rcmadruga/log4c-localtime/pull/1
+
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 ---
  configure.in     | 2 +-
diff --git a/package/liblog4c-localtime/0004-Add-AC_CONFIG_MACRO_DIR-to-configure.in.patch b/package/liblog4c-localtime/0004-Add-AC_CONFIG_MACRO_DIR-to-configure.in.patch
index 1d77b80..479eb39 100644
--- a/package/liblog4c-localtime/0004-Add-AC_CONFIG_MACRO_DIR-to-configure.in.patch
+++ b/package/liblog4c-localtime/0004-Add-AC_CONFIG_MACRO_DIR-to-configure.in.patch
@@ -6,6 +6,8 @@ Subject: [PATCH 4/5] Add AC_CONFIG_MACRO_DIR to configure.in
 Without AC_CONFIG_MACRO_DIR, when autoreconfiguring the package, it
 cannot find AM_PATH_EXPAT which is defined in config/expat.m4.
 
+Submitted upstream: https://github.com/rcmadruga/log4c-localtime/pull/1
+
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 ---
  configure.in | 1 +
diff --git a/package/liblog4c-localtime/0005-Fix-C-support.patch b/package/liblog4c-localtime/0005-Fix-C-support.patch
index b2f8c8b..6ba25c3 100644
--- a/package/liblog4c-localtime/0005-Fix-C-support.patch
+++ b/package/liblog4c-localtime/0005-Fix-C-support.patch
@@ -10,6 +10,8 @@ tests/log4c/Makefile.am: error: C++ source seen but 'CXX' is undefined
 So this commit adds the AC_PROG_CXX macro to configure.in, and ensures
 that the C++ test is only built if a C++ compiler is available.
 
+Submitted upstream: https://github.com/rcmadruga/log4c-localtime/pull/1
+
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 ---
  configure.in            | 3 +++

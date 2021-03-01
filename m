From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 1 Mar 2021 22:31:49 +0100
Subject: [Buildroot] [git commit branch/next] package/ruby: update to 3.0.0
Message-ID: <20210301211035.4EAA6815E5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=af5226f2fd1292a26f2dfda32f41cbbad7aa4cc6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0001-fix-default-coroutine-selection.patch     | 30 ++++++----------------
 package/ruby/ruby.hash                             |  4 +--
 package/ruby/ruby.mk                               |  6 ++---
 3 files changed, 13 insertions(+), 27 deletions(-)

diff --git a/package/ruby/0001-fix-default-coroutine-selection.patch b/package/ruby/0001-fix-default-coroutine-selection.patch
index 79dbd692e5..ea84aa9bc6 100644
--- a/package/ruby/0001-fix-default-coroutine-selection.patch
+++ b/package/ruby/0001-fix-default-coroutine-selection.patch
@@ -2,34 +2,20 @@ fixed default coroutine selection for musl/uclibc
 
 https://github.com/ruby/ruby/pull/3567/commits/b570e7de87aaad8c903176d835e8124127f627b3
 
-Signed-off-by: Waldemar Brodkorb <wbx@opennadk.org>
+Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
 
-diff -Nur ruby-2.7.1.orig/configure.ac ruby-2.7.1/configure.ac
---- ruby-2.7.1.orig/configure.ac	2020-03-31 12:44:55.000000000 +0200
-+++ ruby-2.7.1/configure.ac	2020-10-01 00:03:53.130462286 +0200
-@@ -2344,8 +2344,12 @@
+diff -Nur ruby-3.0.0.orig/configure.ac ruby-3.0.0/configure.ac
+--- ruby-3.0.0.orig/configure.ac	2020-12-25 04:33:01.000000000 +0100
++++ ruby-3.0.0/configure.ac	2021-02-22 13:00:53.990314464 +0100
+@@ -2441,7 +2441,10 @@
              rb_cv_coroutine=copy
          ],
-         [*], [
+         [
 -            rb_cv_coroutine=ucontext
-+            AC_CHECK_FUNCS([getcontext swapcontext makecontext],
++        AC_CHECK_FUNCS([getcontext swapcontext makecontext],
 +               [rb_cv_coroutine=ucontext],
 +               [rb_cv_coroutine=copy; break]
-+            )
++	       )
          ]
-+
      )
      AC_MSG_RESULT(${rb_cv_coroutine})
- ])
-diff -Nur ruby-2.7.1.orig/coroutine/copy/Context.c ruby-2.7.1/coroutine/copy/Context.c
---- ruby-2.7.1.orig/coroutine/copy/Context.c	2020-03-31 12:44:55.000000000 +0200
-+++ ruby-2.7.1/coroutine/copy/Context.c	2020-10-01 00:04:59.414670705 +0200
-@@ -5,6 +5,8 @@
-  *  Copyright, 2019, by Samuel Williams. All rights reserved.
- */
- 
-+#include <sys/types.h>
-+
- #include "Context.h"
- 
- // http://gcc.gnu.org/onlinedocs/gcc/Alternate-Keywords.html
diff --git a/package/ruby/ruby.hash b/package/ruby/ruby.hash
index 80ffb00c0f..b4594fcaba 100644
--- a/package/ruby/ruby.hash
+++ b/package/ruby/ruby.hash
@@ -1,5 +1,5 @@
-# https://www.ruby-lang.org/en/news/2020/10/02/ruby-2-7-2-released/
-sha256  1b95ab193cc8f5b5e59d2686cb3d5dcf1ddf2a86cb6950e0b4bdaae5040ec0d6  ruby-2.7.2.tar.xz
+# https://www.ruby-lang.org/en/news/2020/12/25/ruby-3-0-0-released/
+sha256  68bfaeef027b6ccd0032504a68ae69721a70e97d921ff328c0c8836c798f6cb1  ruby-3.0.0.tar.xz
 # License files, Locally calculated
 sha256  b09ca195d2de08f0aacfa8793d0af62d7681c304b3ef714b75813721823295a6  LEGAL
 sha256  967586d538a28955ec2541910cf63c5ac345fcdea94bfb1f1705a1f6eb36bcbb  COPYING
diff --git a/package/ruby/ruby.mk b/package/ruby/ruby.mk
index 341943c4a5..a754ba8451 100644
--- a/package/ruby/ruby.mk
+++ b/package/ruby/ruby.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-RUBY_VERSION_MAJOR = 2.7
-RUBY_VERSION = $(RUBY_VERSION_MAJOR).2
-RUBY_VERSION_EXT = 2.7.0
+RUBY_VERSION_MAJOR = 3.0
+RUBY_VERSION = $(RUBY_VERSION_MAJOR).0
+RUBY_VERSION_EXT = 3.0.0
 RUBY_SITE = http://cache.ruby-lang.org/pub/ruby/$(RUBY_VERSION_MAJOR)
 RUBY_SOURCE = ruby-$(RUBY_VERSION).tar.xz
 RUBY_DEPENDENCIES = host-pkgconf host-ruby

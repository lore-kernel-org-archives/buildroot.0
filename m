From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 3 Oct 2017 14:20:00 +0200
Subject: [Buildroot] [git commit] package/icu: remove xlocale.h header
	include
Message-ID: <20171003121609.27FBB81054@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c5b3252ac9291dce9d91caac6d5b94fd31349f38
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Remove xlocale.h header include since it's removed from glibc 2.26.

Reported-by: Ross <grunpferd@netscape.net>
Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/icu/0006-i18n-Drop-include-xlocale.h.patch | 39 ++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/package/icu/0006-i18n-Drop-include-xlocale.h.patch b/package/icu/0006-i18n-Drop-include-xlocale.h.patch
new file mode 100644
index 0000000..a5eb9cb
--- /dev/null
+++ b/package/icu/0006-i18n-Drop-include-xlocale.h.patch
@@ -0,0 +1,39 @@
+From 5f38e4f8c4be351db96a3be23ce25c97597cc508 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 2 Oct 2017 22:41:02 +0200
+Subject: [PATCH] i18n: Drop include <xlocale.h>
+
+glibc 2.26 drops this header
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Reported Upstream: http://bugs.icu-project.org/trac/ticket/13385
+From: https://git.yoctoproject.org/cgit.cgi/poky/commit/meta/recipes-support/icu/icu/0001-i18n-Drop-include-xlocale.h.patch?id=931430f94c018bc3f58d70e11ca4a4ae7cb2e19c
+
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+---
+Upstream-Status: Pending
+---
+ source/i18n/digitlst.cpp | 6 +-----
+ 1 file changed, 1 insertion(+), 5 deletions(-)
+
+diff --git a/source/i18n/digitlst.cpp b/source/i18n/digitlst.cpp
+index 4d7c3f4..f111cf3 100644
+--- a/source/i18n/digitlst.cpp
++++ b/source/i18n/digitlst.cpp
+@@ -61,11 +61,7 @@
+ #endif
+ 
+ #if U_USE_STRTOD_L
+-# if U_PLATFORM_USES_ONLY_WIN32_API || U_PLATFORM == U_PF_CYGWIN
+-#   include <locale.h>
+-# else
+-#   include <xlocale.h>
+-# endif
++# include <locale.h>
+ #endif
+ 
+ // ***************************************************************************
+-- 
+2.9.5
+

From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 27 Jun 2011 10:29:46 +0200
Subject: [Buildroot] [git commit] qt: fix typo in webkit pthread_getattr_np
	patch
Message-ID: <20110627091554.0AA9788EC1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=36f8b40d22ce68155744124d75489dc15b5ff34c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Missing continuation (\) character in #if check.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../qt/qt-4.7.3-pthread_getattr_np_webkit.patch    |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/qt/qt-4.7.3-pthread_getattr_np_webkit.patch b/package/qt/qt-4.7.3-pthread_getattr_np_webkit.patch
index dc078ad..934c332 100644
--- a/package/qt/qt-4.7.3-pthread_getattr_np_webkit.patch
+++ b/package/qt/qt-4.7.3-pthread_getattr_np_webkit.patch
@@ -9,7 +9,7 @@
 +// pthread_getattr_np or pthread_attr_getstack.
 +#if __UCLIBC_MAJOR__ == 0 && \
 +    (__UCLIBC_MINOR__ < 9 || \
-+    (__UCLIBC_MINOR__ == 9 && __UCLIBC_SUBLEVEL__ <= 32)) &&
++    (__UCLIBC_MINOR__ == 9 && __UCLIBC_SUBLEVEL__ <= 32)) && \
 +    defined(__LINUXTHREADS_OLD__)
 +#define UCLIBC_USE_PROC_SELF_MAPS 1
 +#include <stdio_ext.h>
-- 
1.7.3.4

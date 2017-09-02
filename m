From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 02 Sep 2017 13:13:42 -0000
Subject: [Buildroot] [git commit] package/log4cpp: bump version to 1.1.3
Message-ID: <20170902130615.F39C580332@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2146a779b8a198f908bf3387e893cfba318e109a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Added sha256 hash, removed patch applied upstream:
https://sourceforge.net/p/log4cpp/codegit/ci/fe4ed0

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/log4cpp/0001-Fix-musl-compile.patch | 34 -----------------------------
 package/log4cpp/log4cpp.hash                |  6 +++--
 package/log4cpp/log4cpp.mk                  |  2 +-
 3 files changed, 5 insertions(+), 37 deletions(-)

diff --git a/package/log4cpp/0001-Fix-musl-compile.patch b/package/log4cpp/0001-Fix-musl-compile.patch
deleted file mode 100644
index f1a13a0..0000000
--- a/package/log4cpp/0001-Fix-musl-compile.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 17562259fb6684f351a70b98b4f3b438927ba1aa Mon Sep 17 00:00:00 2001
-From: Peter Seiderer <ps.report@gmx.net>
-Date: Mon, 11 Jul 2016 22:58:31 +0200
-Subject: [PATCH] Fix musl compile.
-
-Include proper config.h (via log4cpp/Portability.hh) to fix the
-evaluate of LOG4CPP_HAVE_STDINT_H in the file tests/Clock.hh
-
-Fixes:
-
-  Clock.hh:17:13: error: 'int64_t' does not name a type
-       typedef int64_t usec_t;
-
-Signed-off-by: Peter Seiderer <ps.report@gmx.net>
----
- log4cpp/tests/Clock.hh | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/log4cpp/tests/Clock.hh b/log4cpp/tests/Clock.hh
-index 4bf0ca4..45c6467 100644
---- a/log4cpp/tests/Clock.hh
-+++ b/log4cpp/tests/Clock.hh
-@@ -6,6 +6,8 @@
- #ifndef __CLOCK_H
- #define __CLOCK_H
- 
-+#include <log4cpp/Portability.hh>
-+
- #ifdef LOG4CPP_HAVE_STDINT_H
- #include <stdint.h>
- #endif // LOG4CPP_HAVE_STDINT_H
--- 
-2.8.1
-
diff --git a/package/log4cpp/log4cpp.hash b/package/log4cpp/log4cpp.hash
index 6467aab..fd73988 100644
--- a/package/log4cpp/log4cpp.hash
+++ b/package/log4cpp/log4cpp.hash
@@ -1,3 +1,5 @@
 # From http://sourceforge.net/projects/log4cpp/files/log4cpp-1.1.x%20%28new%29/log4cpp-1.1/
-md5		1e173df8ee97205f412ff84aa93b8fbe	log4cpp-1.1.1.tar.gz
-sha1	23aa5bd7d6f79992c92bad3e1c6d64a34f8fcf68	log4cpp-1.1.1.tar.gz
+md5 b9e2cee932da987212f2c74b767b4d8b  log4cpp-1.1.3.tar.gz
+sha1 74f0fea7931dc1bc4e5cd34a6318cd2a51322041  log4cpp-1.1.3.tar.gz
+# Locally computed
+sha256 2cbbea55a5d6895c9f0116a9a9ce3afb86df383cd05c9d6c1a4238e5e5c8f51d  log4cpp-1.1.3.tar.gz
diff --git a/package/log4cpp/log4cpp.mk b/package/log4cpp/log4cpp.mk
index 1801cff..aab05f2 100644
--- a/package/log4cpp/log4cpp.mk
+++ b/package/log4cpp/log4cpp.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LOG4CPP_VERSION_MAJOR = 1.1
-LOG4CPP_VERSION = $(LOG4CPP_VERSION_MAJOR).1
+LOG4CPP_VERSION = $(LOG4CPP_VERSION_MAJOR).3
 LOG4CPP_SITE = http://downloads.sourceforge.net/project/log4cpp/log4cpp-1.1.x%20%28new%29/log4cpp-$(LOG4CPP_VERSION_MAJOR)
 LOG4CPP_SUBDIR = log4cpp
 # The "or later" is indicated in the HTML documentation

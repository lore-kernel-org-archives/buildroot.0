From: Max Filippov <jcmvbkbc@gmail.com>
Date: Tue, 17 Mar 2015 01:12:26 +0300
Subject: [Buildroot] [PATCH] uclibc: enable UCLIBC_HAS_GNU_GETSUBOPT in all
	configs
Message-ID: <1426543946-29786-1-git-send-email-jcmvbkbc@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This fixes build for applications that use getsubopt unconditionally.
Code addition to getopt is negligible.

Fixes:
  http://autobuild.buildroot.net/results/90c318e3a9ef5e626d0a80e36695d34eda21f97e/
  http://autobuild.buildroot.net/results/cd8e9d9a5f454c321071c21192958aeee9c39e73/

Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
---
 package/uclibc/uClibc-0.9.33.config   |    2 +-
 package/uclibc/uClibc-ng.config       |    2 +-
 package/uclibc/uClibc-snapshot.config |    2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/uclibc/uClibc-0.9.33.config b/package/uclibc/uClibc-0.9.33.config
index 88dc7fa..afee4fd 100644
--- a/package/uclibc/uClibc-0.9.33.config
+++ b/package/uclibc/uClibc-0.9.33.config
@@ -217,7 +217,7 @@ UCLIBC_HAS_ERRNO_MESSAGES=y
 UCLIBC_HAS_SIGNUM_MESSAGES=y
 # UCLIBC_HAS_SYS_SIGLIST is not set
 UCLIBC_HAS_GNU_GETOPT=y
-# UCLIBC_HAS_GNU_GETSUBOPT is not set
+UCLIBC_HAS_GNU_GETSUBOPT=y
 
 #
 # Big and Tall
diff --git a/package/uclibc/uClibc-ng.config b/package/uclibc/uClibc-ng.config
index 9b348d6..2885af6 100644
--- a/package/uclibc/uClibc-ng.config
+++ b/package/uclibc/uClibc-ng.config
@@ -221,7 +221,7 @@ UCLIBC_HAS_ERRNO_MESSAGES=y
 UCLIBC_HAS_SIGNUM_MESSAGES=y
 # UCLIBC_HAS_SYS_SIGLIST is not set
 UCLIBC_HAS_GNU_GETOPT=y
-# UCLIBC_HAS_GNU_GETSUBOPT is not set
+UCLIBC_HAS_GNU_GETSUBOPT=y
 
 #
 # Big and Tall
diff --git a/package/uclibc/uClibc-snapshot.config b/package/uclibc/uClibc-snapshot.config
index 1f04561..6f5ebfa 100644
--- a/package/uclibc/uClibc-snapshot.config
+++ b/package/uclibc/uClibc-snapshot.config
@@ -222,7 +222,7 @@ UCLIBC_HAS_ERRNO_MESSAGES=y
 UCLIBC_HAS_SIGNUM_MESSAGES=y
 # UCLIBC_HAS_SYS_SIGLIST is not set
 UCLIBC_HAS_GNU_GETOPT=y
-# UCLIBC_HAS_GNU_GETSUBOPT is not set
+UCLIBC_HAS_GNU_GETSUBOPT=y
 
 #
 # Big and Tall
-- 
1.7.7.6

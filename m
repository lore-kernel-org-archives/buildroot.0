From: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
Date: Thu, 18 Aug 2016 22:34:08 +0530
Subject: [Buildroot] [PATCH 1/2] logrotate: bump version to 3.10.0
Message-ID: <1471539849-3766-1-git-send-email-rahul.bedarkar@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This version bump also fixes one of the build errors that we see with
gcc6.

  logrotate.c: In function 'postrotateSingleLog':
  logrotate.c:1784:5: error: this 'if' clause does not guard... [-Werror=misleading-indentation]
       if (!state->doRotate)
       ^~
  logrotate.c:1787:2: note: ...this statement, but the latter is misleadingly indented as if it is guarded by the 'if'
    if (!hasErrors && log->flags & LOG_FLAG_TMPFILENAME) {
    ^~
  cc1: all warnings being treated as errors

Fixes:

  http://autobuild.buildroot.net/results/6dc/6dc2eb22104076920d77425b1e608ef9b9e01c94/

Signed-off-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
---
 package/logrotate/logrotate.hash | 2 +-
 package/logrotate/logrotate.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/logrotate/logrotate.hash b/package/logrotate/logrotate.hash
index 77d4dc8..ee31f8e 100644
--- a/package/logrotate/logrotate.hash
+++ b/package/logrotate/logrotate.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 2de00c65e23fa9d7909cae6594e550b9abe9a7eb1553669ddeaca92d30f97009 logrotate-3.9.2.tar.gz
+sha256 db63b5932190cba941357c029b595a7fddf43539943aa1e0ca53a96136e4c5d9 logrotate-3.10.0.tar.gz
diff --git a/package/logrotate/logrotate.mk b/package/logrotate/logrotate.mk
index de4d837..96012c0 100644
--- a/package/logrotate/logrotate.mk
+++ b/package/logrotate/logrotate.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LOGROTATE_VERSION = 3.9.2
+LOGROTATE_VERSION = 3.10.0
 LOGROTATE_SITE = $(call github,logrotate,logrotate,$(LOGROTATE_VERSION))
 LOGROTATE_LICENSE = GPLv2+
 LOGROTATE_LICENSE_FILES = COPYING
-- 
2.6.2

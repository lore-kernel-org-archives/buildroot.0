From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 25 Apr 2017 13:44:34 +0200
Subject: [Buildroot] [PATCH] minicom: security bump to version 2.7.1
Message-ID: <20170425114434.1728-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes CVE-2017-7467 - minicom and prl-vzvncserver vt100.c escparms[] buffer
overflow.

For more details about the issue, see the nice writeup on oss-security:

http://www.openwall.com/lists/oss-security/2017/04/18/5

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/minicom/minicom.hash | 2 +-
 package/minicom/minicom.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/minicom/minicom.hash b/package/minicom/minicom.hash
index 33ba4ef10..ca3087160 100644
--- a/package/minicom/minicom.hash
+++ b/package/minicom/minicom.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 9ac3a663b82f4f5df64114b4792b9926b536c85f59de0f2d2b321c7626a904f4  minicom-2.7.tar.gz
+sha256 532f836b7a677eb0cb1dca8d70302b73729c3d30df26d58368d712e5cca041f1  minicom-2.7.1.tar.gz
diff --git a/package/minicom/minicom.mk b/package/minicom/minicom.mk
index 75cd0c4ff..cb0648237 100644
--- a/package/minicom/minicom.mk
+++ b/package/minicom/minicom.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-MINICOM_VERSION = 2.7
-MINICOM_SITE = https://alioth.debian.org/frs/download.php/file/3977
+MINICOM_VERSION = 2.7.1
+MINICOM_SITE = https://alioth.debian.org/frs/download.php/file/4215
 MINICOM_LICENSE = GPL-2.0+
 MINICOM_LICENSE_FILES = COPYING
 
-- 
2.11.0

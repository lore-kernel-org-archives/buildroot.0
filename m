From: Samuel Martin <s.martin49@gmail.com>
Date: Sun,  7 Jul 2013 20:42:19 +0200
Subject: [Buildroot] [PATCH] Makefile: unset MAKEFLAGS
Message-ID: <1373222539-8915-1-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

MAKEFLAGS can carry options that make Buildroot failed, eg. '-jN'.
To avoid this, unset the MAKEFLAGS environment variable.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Makefile b/Makefile
index 015fbdf..11a7b70 100644
--- a/Makefile
+++ b/Makefile
@@ -207,6 +207,7 @@ unexport CFLAGS
 unexport CXXFLAGS
 unexport GREP_OPTIONS
 unexport CONFIG_SITE
+unexport MAKEFLAGS
 unexport QMAKESPEC
 unexport TERMINFO
 
-- 
1.8.3.2

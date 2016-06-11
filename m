From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 11 Jun 2016 18:14:59 +0200
Subject: [Buildroot] [PATCH 1/1] package/log4cpp: fix legal-info
Message-ID: <1465661699-6771-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The source code files are stored in log4cpp/.
Apparently LOG4CPP_LICENSE_FILES does not take LOG4CPP_SUBDIR into
account so we need to fix LOG4CPP_LICENSE_FILES itself.

Fixes
http://autobuild.buildroot.net/results/a80/a80e83ca58b22afedb8f2573513d373913c6a488/
http://autobuild.buildroot.net/results/9eb/9ebb2ed5171d5a1be2db06497a210e552bfad078/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/log4cpp/log4cpp.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/log4cpp/log4cpp.mk b/package/log4cpp/log4cpp.mk
index 18cc6c8..24f9a0d 100755
--- a/package/log4cpp/log4cpp.mk
+++ b/package/log4cpp/log4cpp.mk
@@ -11,7 +11,7 @@ LOG4CPP_SITE = http://downloads.sourceforge.net/project/log4cpp/log4cpp-1.1.x%20
 LOG4CPP_SUBDIR = log4cpp
 # The "or later" is indicated in the HTML documentation
 LOG4CPP_LICENSE = LGPLv2.1+
-LOG4CPP_LICENSE_FILES = COPYING
+LOG4CPP_LICENSE_FILES = log4cpp/COPYING
 LOG4CPP_INSTALL_STAGING = YES
 
 # The default <pkg>_CONFIG_SCRIPTS handling does not apply
-- 
2.8.1

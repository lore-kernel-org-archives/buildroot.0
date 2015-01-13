From: Peter Seiderer <ps.report@gmx.net>
Date: Tue, 13 Jan 2015 20:40:01 +0100
Subject: [Buildroot] [PATCH v3 1/7] dtc: fix project and download url
In-Reply-To: <1421178007-11877-1-git-send-email-ps.report@gmx.net>
References: <1421178007-11877-1-git-send-email-ps.report@gmx.net>
Message-ID: <1421178007-11877-2-git-send-email-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This fix the error:

fatal: unable to connect to git.jdl.com:
git.jdl.com[0: 208.123.73.151]: errno=Connection refused

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
Changes v2 -> v3:
- split rename patches to extra patch (suggested by Thomas Petazzoni)
- add download failure log extract (borrowed from Fabio Porcedda
  suggested patch)
---
 package/dtc/Config.in | 2 +-
 package/dtc/dtc.mk    | 5 +++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/dtc/Config.in b/package/dtc/Config.in
index 7b02dd2..39223f7 100644
--- a/package/dtc/Config.in
+++ b/package/dtc/Config.in
@@ -8,7 +8,7 @@ config BR2_PACKAGE_DTC
 	  Note that only the library is installed.
 	  If you want the programs, say 'y' here, and to "dtc programs", below.
 
-	  http://git.jdl.com/gitweb/?p=dtc.git  (no home page)
+	  https://git.kernel.org/cgit/utils/dtc/dtc.git
 
 if BR2_PACKAGE_DTC
 
diff --git a/package/dtc/dtc.mk b/package/dtc/dtc.mk
index 51b5b4e..6fd5064 100644
--- a/package/dtc/dtc.mk
+++ b/package/dtc/dtc.mk
@@ -4,8 +4,9 @@
 #
 ################################################################################
 
-DTC_VERSION = v1.4.0
-DTC_SITE = git://git.jdl.com/software/dtc.git
+DTC_VERSION = 1.4.0
+DTC_SOURCE = dtc-$(DTC_VERSION).tar.xz
+DTC_SITE = https://www.kernel.org/pub/software/utils/dtc
 DTC_LICENSE = GPLv2+/BSD-2c
 DTC_LICENSE_FILES = README.license GPL
 DTC_INSTALL_STAGING = YES
-- 
2.1.2

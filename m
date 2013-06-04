From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue,  4 Jun 2013 07:51:36 -0300
Subject: [Buildroot] [PATCHv2] dtc: needs host-bison and host-flex
Message-ID: <1370343096-5366-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/000/000a042f6b485d90717d14b93efcf011841c33c3/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/dtc/dtc.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/dtc/dtc.mk b/package/dtc/dtc.mk
index 76ff361..7dd4fe7 100644
--- a/package/dtc/dtc.mk
+++ b/package/dtc/dtc.mk
@@ -9,6 +9,7 @@ DTC_SITE            = git://git.jdl.com/software/dtc.git
 DTC_LICENSE         = GPLv2+/BSD-2c
 DTC_LICENSE_FILES   = README.license GPL
 DTC_INSTALL_STAGING = YES
+DTC_DEPENDENCIES    = host-bison host-flex

 define DTC_POST_INSTALL_TARGET_RM_DTDIFF
 	rm -f $(TARGET_DIR)/usr/bin/dtdiff
--
1.8.1.5

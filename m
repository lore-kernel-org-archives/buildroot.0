From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 5 Jun 2013 23:52:44 +0200
Subject: [Buildroot] [git commit] dtc: needs host-bison and host-flex
Message-ID: <20130605215851.5054C9A972@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=40d782cd0e3942c56fec6d136b6792d39cf00d85
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/000/000a042f6b485d90717d14b93efcf011841c33c3/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/dtc/dtc.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

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

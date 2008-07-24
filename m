From: bugs at busybox.net <bugs@busybox.net>
Date: Thu, 24 Jul 2008 02:04:47 -0700
Subject: [Buildroot] =?windows-1252?q?=5Bbuildroot_0004304=5D=3A_=5BBuildR?=
	=?windows-1252?q?oot=5D_Fix_=91make_clean=92_so_=91make_clean=3B_m?=
	=?windows-1252?q?ake=92_works?=
Message-ID: <d36c709a7391e18ce9f44d152595453f@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=4304 
====================================================================== 
Reported By:                blf
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   4304
Category:                   Other
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             07-24-2008 02:04 PDT
Last Modified:              07-24-2008 02:04 PDT
====================================================================== 
Summary:                    [BuildRoot] Fix ?make clean? so ?make clean; make?
works
Description: 
    ?make clean? failed to remove all the state, causing a
    subsequent ?make? to skip some rather key steps (e.g.,
    creating a properly-populated skelton root filesystem).
    
    Signed-off-by: Brian Foster <brian.foster@innova-card.com>
---
 This patch is against r22481.

 Makefile |    2 --
 1 files changed, 0 insertions(+), 2 deletions(-)


diff --git a/Makefile b/Makefile
index fcf69ce..9c6fa4c 100644
--- a/Makefile
+++ b/Makefile
@@ -355,9 +355,11 @@ external-deps:
 #############################################################
 clean: $(TARGETS_CLEAN)
 	rm -rf $(STAGING_DIR) $(TARGET_DIR) $(IMAGE)
+	rm -f $(PROJECT_BUILD_DIR)/.root
 
 dirclean: $(TARGETS_DIRCLEAN)
 	rm -rf $(STAGING_DIR) $(TARGET_DIR) $(IMAGE)
+	rm -f $(PROJECT_BUILD_DIR)/.root
 
 distclean:
 ifeq ($(DL_DIR),$(BASE_DIR)/dl)

====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
07-24-08 02:04  blf            New Issue                                    
07-24-08 02:04  blf            Status                   new => assigned     
07-24-08 02:04  blf            Assigned To               => buildroot       
======================================================================

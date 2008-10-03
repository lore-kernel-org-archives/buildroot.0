From: bugs at busybox.net <bugs@busybox.net>
Date: Fri, 3 Oct 2008 09:42:04 -0700
Subject: [Buildroot] [buildroot 0005234]: Selecting MTD utils from git
	doesn't give you the HEAD
Message-ID: <532a9ee2ed7a6e52612f1f2e0680f030@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


A NOTE has been added to this issue. 
====================================================================== 
http://busybox.net/bugs/view.php?id=5234 
====================================================================== 
Reported By:                mjd
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   5234
Category:                   Other
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             10-03-2008 09:40 PDT
Last Modified:              10-03-2008 09:42 PDT
====================================================================== 
Summary:                    Selecting MTD utils from git doesn't give you the
HEAD
Description: 
If you turn on BR2_PACKAGE_MTD_UTILS_GIT, you can get the mtd-utils
source code from the Linux MTD project's GIT server, rather than use
source that is 1 or 2 years old.

I would have thought that the whole point of this is so that you can
get the latest-and-greatest mtd-utils source.  But
package/mtd/mtd-utils.git/mtd.mk hard-codes a particular (now
out-of-date)
version of mtd-utils.

This patch ensures that getting mtd-utils source from git gets the head
from Linux MTD.
====================================================================== 

---------------------------------------------------------------------- 
 mjd - 10-03-08 09:42  
---------------------------------------------------------------------- 
diff -x config -u -r
buildroot-mtcba-g1-pristine/package/mtd/mtd-utils.git/mtd.mk
buildroot-mtcba-g1/package/mtd/mtd-utils.git/mtd.mk
---
buildroot-mtcba-g1-pristine/package/mtd/mtd-utils.git/mtd.mk	2008-08-03
14:11:27.000000000 +1000
+++ buildroot-mtcba-g1/package/mtd/mtd-utils.git/mtd.mk	2008-09-30
17:45:07.000000000 +1000
@@ -3,7 +3,7 @@
 # mtd provides jffs2 utilities
 #
 #############################################################
-MTD_VERSION:=fcb52ccc99679460640386c297023f852b108f68
+MTD_VERSION:=HEAD
 MTD_SOURCE:=mtd-utils-$(MTD_VERSION).tar.gz

MTD_URL:=http://git.infradead.org/mtd-utils.git?a=snapshot;h=$(MTD_VERSION);sf=tgz
 MTD_HOST_DIR:= $(TOOL_BUILD_DIR)/mtd-utils-$(MTD_VERSION) 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
10-03-08 09:40  mjd            New Issue                                    
10-03-08 09:40  mjd            Status                   new => assigned     
10-03-08 09:40  mjd            Assigned To               => buildroot       
10-03-08 09:40  mjd            File Added: mtd-utils-git-from-head-1.diff       
            
10-03-08 09:42  mjd            Note Added: 0012684                          
======================================================================

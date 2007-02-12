From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:47:24 -0800
Subject: [Buildroot] [buildroot 0000418]: [patchmkdosfs] Resolved
	compilation error, update version to 2.11,
	remove debug symbol generation
Message-ID: <c975c8703b16656affab1be7de366ee9@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=418 
====================================================================== 
Reported By:                abogani
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   418
Category:                   Other
Reproducibility:            N/A
Severity:                   trivial
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             09-08-2005 02:36 PDT
Last Modified:              02-12-2007 05:47 PST
====================================================================== 
Summary:                    [patchmkdosfs] Resolved compilation error, update
version to 2.11, remove debug symbol generation
Description: 
Index: mkdosfs.mk
===================================================================
--- mkdosfs.mk  (revisione 11399)
+++ mkdosfs.mk  (copia locale)
@@ -3,16 +3,17 @@
 # mkdosfs
 #
 #############################################################
-MKDOSFS_SOURCE=dosfstools-2.8.src.tar.gz
+MKDOSFS_VERSION=2.11
+MKDOSFS_SOURCE=dosfstools-${MKDOSFS_VERSION}.src.tar.gz
 MKDOSFS_SITE=http://ftp.uni-erlangen.de/pub/Linux/LOCAL/dosfstools
-MKDOSFS_DIR=$(BUILD_DIR)/dosfstools-2.8
+MKDOSFS_DIR=$(BUILD_DIR)/dosfstools-${MKDOSFS_VERSION}
 MKDOSFS_CAT:=zcat
 MKDOSFS_BINARY:=mkdosfs/mkdosfs
 MKDOSFS_TARGET_BINARY:=sbin/mkdosfs
 ifeq ($(BR2_LARGEFILE),y)
-MKDOSFS_CFLAGS="-Os -g -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64"
+MKDOSFS_CFLAGS="-Os -fomit-frame-pointer -D_LARGEFILE_SOURCE
-D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64"
 else
-MKDOSFS_CFLAGS="-Os -g"
+MKDOSFS_CFLAGS="-Os -fomit-frame-pointer"
 endif

 $(DL_DIR)/$(MKDOSFS_SOURCE):
====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
09-08-05 02:36  abogani        New Issue                                    
09-08-05 02:36  abogani        Status                   new => assigned     
09-08-05 02:36  abogani        Assigned To               => uClibc          
01-23-06 13:58  prpplague      Status                   assigned => resolved
01-23-06 13:58  prpplague      Resolution               open => fixed       
01-23-06 13:58  prpplague      Additional Information Updated                   

03-08-06 16:54  vapier         Status                   resolved => closed  
02-12-07 05:47  vapier         Status                   closed => assigned  
02-12-07 05:47  vapier         Assigned To              uClibc => buildroot 
======================================================================

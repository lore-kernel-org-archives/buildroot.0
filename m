From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:44:47 -0800
Subject: [Buildroot] [buildroot 0000969]: lsof website missing/down
Message-ID: <b696ff2d26743743d627c2cdc28b7a9f@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=969 
====================================================================== 
Reported By:                bowerymarc
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   969
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             07-25-2006 06:37 PDT
Last Modified:              02-12-2007 05:44 PST
====================================================================== 
Summary:                    lsof website missing/down
Description: 
nightly build 20060724...

the LSOF website seems to be gone, found anotherone, here's a patch:

--- Config.in.orig	2006-07-25 09:32:00.000000000 -0400
+++ Config.in	2006-07-25 09:33:14.000000000 -0400
@@ -6,4 +6,4 @@
           The lsof tool lists information about files opened by 
           processes.
 
-	  ftp://lsof.itap.purdue.edu/pub/tools/unix/lsof/
+	  ftp://ftp.cerias.purdue.edu/pub/tools/unix/sysutils/lsof/
--- lsof.mk.orig	2006-07-25 09:32:10.000000000 -0400
+++ lsof.mk	2006-07-25 09:32:59.000000000 -0400
@@ -4,7 +4,7 @@
 #
 #############################################################
 LSOF_SOURCE:=lsof_4.77.tar.bz2
-LSOF_SITE:=ftp://lsof.itap.purdue.edu/pub/tools/unix/lsof/
+LSOF_SITE:=ftp://ftp.cerias.purdue.edu/pub/tools/unix/sysutils/lsof/
 LSOF_CAT:=bzip2 -cd
 LSOF_DIR:=$(BUILD_DIR)/lsof_4.77
 LSOF_BINARY:=lsof

====================================================================== 

---------------------------------------------------------------------- 
 vapier - 08-23-06 19:48  
---------------------------------------------------------------------- 
site is back up 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
07-25-06 06:37  bowerymarc     New Issue                                    
07-25-06 06:37  bowerymarc     Status                   new => assigned     
07-25-06 06:37  bowerymarc     Assigned To               => uClibc          
08-23-06 19:48  vapier         Note Added: 0001580                          
08-23-06 19:48  vapier         Status                   assigned => resolved
08-23-06 19:48  vapier         Resolution               open => won't fix   
09-30-06 14:10  bernhardf      Status                   resolved => closed  
02-12-07 05:44  vapier         Status                   closed => assigned  
02-12-07 05:44  vapier         Assigned To              uClibc => buildroot 
======================================================================

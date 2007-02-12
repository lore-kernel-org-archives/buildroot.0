From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:46:20 -0800
Subject: [Buildroot] [buildroot 0000813]: thttpd install fails
Message-ID: <001c8458ab715cfa3148a6570954c9eb@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=813 
====================================================================== 
Reported By:                will_newton
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   813
Category:                   Other
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             04-04-2006 06:27 PDT
Last Modified:              02-12-2007 05:46 PST
====================================================================== 
Summary:                    thttpd install fails
Description: 
The thttpd makefile is broken. The following patch allows it to build.

diff -u -r1.1.1.1 thttpd.mk
--- package/thttpd/thttpd.mk    10 Mar 2006 14:47:05 -0000      1.1.1.1
+++ package/thttpd/thttpd.mk    4 Apr 2006 13:27:04 -0000
@@ -40,7 +40,7 @@
        install -D $(THTTPD_DIR)/extras/htpasswd
$(TARGET_DIR)/bin/htpasswd
        install -D $(THTTPD_DIR)/extras/makeweb $(TARGET_DIR)/bin/makeweb
        install -D $(THTTPD_DIR)/extras/syslogtocern
$(TARGET_DIR)/bin/syslogtocern
-       install -D $(THTTPD_DIR)/scripts/thttpd_wrapper
$(TARGET_DIR)/sbin
+       install -D $(THTTPD_DIR)/scripts/thttpd_wrapper
$(TARGET_DIR)/sbin/thttpd_wrapper
        install -D $(THTTPD_DIR)/scripts/thttpd.sh
$(TARGET_DIR)/etc/init.d/S90thttpd
        cp $(TARGET_DIR)/etc/init.d/S90thttpd
$(TARGET_DIR)/etc/init.d/S90thttpd.in
        cp $(TARGET_DIR)/sbin/thttpd_wrapper
$(TARGET_DIR)/sbin/thttpd_wrapper.in

====================================================================== 

---------------------------------------------------------------------- 
 andersen - 04-06-06 10:48  
---------------------------------------------------------------------- 
applied thanks 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
04-04-06 06:27  will_newton    New Issue                                    
04-04-06 06:27  will_newton    Status                   new => assigned     
04-04-06 06:27  will_newton    Assigned To               => uClibc          
04-06-06 10:48  andersen       Note Added: 0001229                          
04-06-06 10:48  andersen       Status                   assigned => closed  
04-06-06 10:48  andersen       Resolution               open => fixed       
04-06-06 10:48  andersen       Description Updated                          
02-12-07 05:46  vapier         Status                   closed => assigned  
02-12-07 05:46  vapier         Assigned To              uClibc => buildroot 
======================================================================

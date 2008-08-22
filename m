From: bugs at busybox.net <bugs@busybox.net>
Date: Fri, 22 Aug 2008 07:42:48 -0700
Subject: [Buildroot] [buildroot 0004674]: The Openchrome package is br0ken..
Message-ID: <e96fe4be16f1f499ca5ae5378f2c6196@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been CLOSED 
====================================================================== 
http://busybox.net/bugs/view.php?id=4674 
====================================================================== 
Reported By:                antialize
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   4674
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   major
Priority:                   normal
Status:                     closed
Resolution:                 open
Fixed in Version:           
====================================================================== 
Date Submitted:             08-20-2008 01:37 PDT
Last Modified:              08-22-2008 07:42 PDT
====================================================================== 
Summary:                    The Openchrome package is br0ken..
Description: 
The openchrome package is broken. It needs, to do install instead of
install-exec just like ALL the other xorg vidio drivers do, currently only
extra libs are installed, not the actual graphics driver!

Index: openchrome.mk
===================================================================
--- openchrome.mk       (revision 23102)
+++ openchrome.mk       (working copy)
@@ -11,5 +11,6 @@

 OPENCHROME_AUTORECONF = YES
 OPENCHROME_CONF_OPT = --enable-shared --disable-static
+OPENCHROME_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR)/usr install

 $(eval $(call AUTOTARGETS,package/x11r7,openchrome))

====================================================================== 

---------------------------------------------------------------------- 
 jacmet - 08-22-08 07:42  
---------------------------------------------------------------------- 
A quick test seems to show that /usr isn't needed. Fixed in r23182. 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
08-20-08 01:37  antialize      New Issue                                    
08-20-08 01:37  antialize      Status                   new => assigned     
08-20-08 01:37  antialize      Assigned To               => buildroot       
08-20-08 01:37  antialize      File Added: openchome.patch                    
08-22-08 07:42  jacmet         Status                   assigned => closed  
08-22-08 07:42  jacmet         Note Added: 0010684                          
======================================================================

From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 17 Nov 2008 03:15:33 -0800
Subject: [Buildroot] [buildroot 0005744]: fb.modes example copied from
	kernel docs
Message-ID: <fed5ac32fb102e4b39a22a33ece914d8@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


A NOTE has been added to this issue. 
====================================================================== 
http://busybox.net/bugs/view.php?id=5744 
====================================================================== 
Reported By:                robang74
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   5744
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   feature
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             10-26-2008 03:59 PDT
Last Modified:              11-17-2008 03:15 PST
====================================================================== 
Summary:                    fb.modes example copied from kernel docs
Description: 
When fbset is compiled and installed in the rootfs an example of
/etc/fb.modes from kernel docs should be installed too (if it does not
exist yet).
====================================================================== 

---------------------------------------------------------------------- 
 jacmet - 10-26-08 04:44  
---------------------------------------------------------------------- 
Wouldn't it make more sense to install one of the fb.modes shipped with
fbset instead? (etc/fb.modes.*)

Is the cyberblade stuff representable for other gfx chips? 

---------------------------------------------------------------------- 
 robang74 - 10-26-08 14:56  
---------------------------------------------------------------------- 
I thought one example would be enough and I put in the first I found.
Following patch will put in all I have found.

--- package/fbset/fbset.mk	(revision 23784)
+++ package/fbset/fbset.mk	(working copy)
@@ -31,6 +31,8 @@
 	touch -c $@
 
 fbset: uclibc $(TARGET_DIR)/$(FBSET_TARGET_BINARY)
+	$(INSTALL) -m 0644 $(LINUX26_DIR)/Documentation/fb/cyblafb/fb.modes
$(TARGET_DIR)/etc/fb.modes.cybla
+	$(INSTALL) -m 0644 $(FBSET_DIR)/etc/fb.modes* $(TARGET_DIR)/etc
 
 fbset-source: $(DL_DIR)/$(FBSET_SOURCE)
 
Sorry but I cannot upload file any more, my FF remain blocked in "waiting
for busybox.net..."

 

---------------------------------------------------------------------- 
 robang74 - 11-17-08 03:15  
---------------------------------------------------------------------- 
Plese close this bug report, copying that files are useless. 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
10-26-08 03:59  robang74       New Issue                                    
10-26-08 03:59  robang74       Status                   new => assigned     
10-26-08 03:59  robang74       Assigned To               => buildroot       
10-26-08 03:59  robang74       File Added: fbset.mk.patch                    
10-26-08 04:04  robang74       Issue Monitored: robang74                    
10-26-08 04:44  jacmet         Note Added: 0014254                          
10-26-08 14:49  robang74       Note Added: 0014274                          
10-26-08 14:51  robang74       Note Edited: 0014274                         
10-26-08 14:55  robang74       Note Edited: 0014274                         
10-26-08 14:56  robang74       Note Edited: 0014274                         
11-17-08 03:15  robang74       Note Added: 0015924                          
======================================================================

From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:42:47 -0800
Subject: [Buildroot] [buildroot 0000841]: Python package - wrong include and
	library path
Message-ID: <4443a923b0d7d5d470698b481020b673@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=841 
====================================================================== 
Reported By:                nemo
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   841
Category:                   Other
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             04-18-2006 10:23 PDT
Last Modified:              02-12-2007 05:42 PST
====================================================================== 
Summary:                    Python package - wrong include and library path
Description: 
setup.py uses standard host's include and library path for modules
building.

This patch forces usage of staging_dir.

This second patch removes *.pyc installed in target_dir:
--- package/python/python.mk    (revisione 118)
+++ package/python/python.mk    (revisione 119)
@@ -70,7 +70,7 @@
        rm $(TARGET_DIR)/usr/bin/python?.?
        rm $(TARGET_DIR)/usr/bin/idle
        rm $(TARGET_DIR)/usr/bin/pydoc
-       find $(TARGET_DIR)/usr/lib/ -name '*.pyc' -o -name '*.pyo' -exec
rm {} \;
+       find $(TARGET_DIR)/usr/lib/ \( -name '*.pyc' -o -name '*.pyo' \)
-exec rm {} \;
        rm -rf $(TARGET_DIR)/share/locale $(TARGET_DIR)/usr/info \
                $(TARGET_DIR)/usr/man $(TARGET_DIR)/usr/share/doc \
                $(TARGET_DIR)/usr/lib/python*/test

====================================================================== 

---------------------------------------------------------------------- 
 bernhardf - 12-22-06 05:48  
---------------------------------------------------------------------- 
Unfortunately that 2.patch doesn't apply.

nemo, please retry with current buildroot (currently around revision
17053).
If this doesn't work for you then please provice a unified diff (diff -u)
that addresses this issue.

If i don't hear anything back from you i shall close this report as
fixed.
thanks, 

---------------------------------------------------------------------- 
 nemo - 01-14-07 05:52  
---------------------------------------------------------------------- 
br2.python-libsearch.03.patch should apply (revision 17302) 

---------------------------------------------------------------------- 
 bernhardf - 01-22-07 10:50  
---------------------------------------------------------------------- 
Thanks for the updated patch, but what i ment was that the
package/python/*.patch have to be in unidiff format.

I've applied this as r17472 and rediffed all patches.
Please let me know if this works ok for you or if i broke something.

TIA, 

---------------------------------------------------------------------- 
 nemo - 01-27-07 04:59  
---------------------------------------------------------------------- 
Ok, from now only unidiff format.

Patch works ok for me,
thanks 

---------------------------------------------------------------------- 
 bernhardf - 01-27-07 05:17  
---------------------------------------------------------------------- 
Fixed in svn. Thanks 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
04-18-06 10:23  nemo           New Issue                                    
04-18-06 10:23  nemo           Status                   new => assigned     
04-18-06 10:23  nemo           Assigned To               => uClibc          
04-18-06 10:23  nemo           File Added: python-libsearch.patch               
    
12-22-06 05:23  bernhardf      File Added: br2.python-libsearch.02.patch        
           
12-22-06 05:48  bernhardf      Note Added: 0001924                          
12-22-06 05:48  bernhardf      Status                   assigned => feedback
01-14-07 05:48  nemo           File Added: br2.python-libsearch.03.patch        
           
01-14-07 05:52  nemo           Note Added: 0001988                          
01-22-07 10:50  bernhardf      Note Added: 0002030                          
01-27-07 04:59  nemo           Note Added: 0002055                          
01-27-07 05:17  bernhardf      Status                   feedback => closed  
01-27-07 05:17  bernhardf      Note Added: 0002057                          
01-27-07 05:17  bernhardf      Resolution               open => fixed       
02-12-07 05:42  vapier         Status                   closed => assigned  
02-12-07 05:42  vapier         Assigned To              uClibc => buildroot 
======================================================================

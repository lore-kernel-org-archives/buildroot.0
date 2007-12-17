From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 17 Dec 2007 06:07:55 -0800
Subject: [Buildroot] [buildroot 0001622]: [PATCH] gcc 3.x/4.x symlinks to cc
Message-ID: <1134415e152197f9eb9e003ac4d58ae8@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


A NOTE has been added to this issue. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1622 
====================================================================== 
Reported By:                atle
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1622
Category:                   Other
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     feedback
====================================================================== 
Date Submitted:             11-30-2007 07:28 PST
Last Modified:              12-17-2007 06:07 PST
====================================================================== 
Summary:                    [PATCH] gcc 3.x/4.x symlinks to cc
Description: 
The 'cc' symlink to 'gcc' is wrongly created as $(REAL_GNU_TARGET_NAME)-cc
for gcc 3.x (overwrites link to  $(REAL_GNU_TARGET_NAME)-gcc). Also the
'cc' link should be created in $(STAGING_DIR)/$(REAL_GNU_TARGET_NAME)/bin/
instead of $(STAGING_DIR)/usr/bin.

The attached patch fixes this for both gcc 3.x and 4.x.

====================================================================== 

---------------------------------------------------------------------- 
 vanokuten - 12-13-07 04:10  
---------------------------------------------------------------------- 
fixed in 20646 rev 

---------------------------------------------------------------------- 
 vanokuten - 12-17-07 03:42  
---------------------------------------------------------------------- 
bad patch, not working correctly on ARM arch, see 1764

commit 20646 reverted

 

---------------------------------------------------------------------- 
 atle - 12-17-07 06:07  
---------------------------------------------------------------------- 
Trying again... The path should be
$(STAGING_DIR)/usr/$(REAL_GNU_TARGET_NAME)/bin/cc, see attached patch
gcc-cc_links-fix_v2.diff. 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
11-30-07 07:28  atle           New Issue                                    
11-30-07 07:28  atle           Status                   new => assigned     
11-30-07 07:28  atle           Assigned To               => buildroot       
11-30-07 07:28  atle           File Added: gcc-cc_links-fix.diff                
   
12-13-07 04:10  vanokuten      Status                   assigned => closed  
12-13-07 04:10  vanokuten      Note Added: 0003139                          
12-13-07 04:10  vanokuten      Resolution               open => fixed       
12-17-07 03:41  vanokuten      Status                   closed => feedback  
12-17-07 03:41  vanokuten      Resolution               fixed => reopened   
12-17-07 03:41  vanokuten      Note Added: 0003214                          
12-17-07 03:42  vanokuten      Note Edited: 0003214                         
12-17-07 05:59  atle           File Added: gcc-cc_links-fix_v2.diff             
      
12-17-07 06:07  atle           Note Added: 0003229                          
======================================================================
